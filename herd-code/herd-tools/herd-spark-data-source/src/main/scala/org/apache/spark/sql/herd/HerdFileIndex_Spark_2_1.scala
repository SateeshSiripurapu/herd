/*
* Copyright 2015 herd contributors
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
package org.apache.spark.sql.herd

import org.apache.hadoop.fs.Path
import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.catalyst.expressions
import org.apache.spark.sql.catalyst.expressions.{AttributeReference, BoundReference, Expression, InterpretedPredicate}
import org.apache.spark.sql.execution.datasources._
import org.apache.spark.sql.types.StructType

private[sql] class HerdFileIndex(
    sparkSession: SparkSession,
    api: () => HerdApi,
    herdPartitions: Seq[(Int, String, Seq[String], Int)],
    namespace: String,
    businessObjectName: String,
    formatUsage: String,
    formatFileType: String,
    partitionKey: String,
    herdPartitionSchema: StructType)
  extends HerdFileIndexBase(
    sparkSession,
    api,
    herdPartitions,
    namespace,
    businessObjectName,
    formatUsage,
    formatFileType,
    partitionKey,
    herdPartitionSchema) {

  override def listFiles(filters: Seq[Expression]): Seq[PartitionDirectory] = {
    val prunedPartitions = if (partitionSpec.partitionColumns.isEmpty) {
      partitionSpec.partitions
    } else {
      prunePartitions(filters, partitionSpec)
    }

    val selectedPartitions = {
      val pathsToFetch = prunedPartitions
        .filter(p => cachedAllFiles.get(p.path).isEmpty)
        .map(_.path)

      cachedAllFiles ++= bulkListLeafFiles(pathsToFetch)

      prunedPartitions.map {
        case PartitionPath(values, path) =>
          val fileStatuses = cachedAllFiles(path)

          PartitionDirectoryShim(values, fileStatuses)
      }
    }

    if (isTraceEnabled()) {
      val auditInfo = prunedPartitions.map(p =>
        HerdFileIndexBase.parsePartitionPath(p.path.toString)).zip(selectedPartitions)

      auditInfo.foreach {
        case (objInfo, dir) =>
          logTrace(s"INPUT\t${businessObjectName}\t${namespace}\t" +
            s"${formatUsage}\t${formatFileType}\t" +
            s"${objInfo("formatVersion").get}\t${objInfo("dataVersion").get}\t" +
            s"${objInfo("partitionValue").get}\t${objInfo("subPartitionValues").getOrElse("")}\t" +
            s"${"S3"}\t" +
            "\t" +
            s"${dir.files.map(_.getPath.toUri.getPath).mkString(",")}\t" +
            "AVAILABLE")
      }
    }

    selectedPartitions
  }

  protected def prunePartitions(
                                 predicates: Seq[Expression],
                                 partitionSpec: PartitionSpec): Seq[PartitionPath] = {
    val PartitionSpec(partitionColumns, partitions) = partitionSpec
    val partitionColumnNames = partitionColumns.map(_.name).toSet
    val partitionPruningPredicates = predicates.filter {
      _.references.map(_.name).toSet.subsetOf(partitionColumnNames)
    }

    if (partitionPruningPredicates.nonEmpty) {
      val predicate = partitionPruningPredicates.reduce(expressions.And)

      val boundPredicate = InterpretedPredicate.create(predicate.transform {
        case a: AttributeReference =>
          val index = partitionColumns.indexWhere(a.name == _.name)
          BoundReference(index, partitionColumns(index).dataType, nullable = true)
      })

      val selected = partitions.filter {
        case PartitionPath(values, _) => boundPredicate(values)
      }

      logInfo {
        val total = partitions.length
        val selectedSize = selected.length
        val percentPruned = (1 - selectedSize.toDouble / total.toDouble) * 100
        s"Selected $selectedSize partitions out of $total, pruned $percentPruned% partitions."
      }

      selected
    } else {
      partitions
    }
  }

  override def filterPartitions(filters: Seq[Expression]): FileIndex = {
    val files = listFiles(filters).toArray

    new PrunedHerdFileIndex(files, partitionSchema)
  }

}

class PrunedHerdFileIndex(files: Array[PartitionDirectory], override val partitionSchema: StructType) extends FileIndex {

  override def sizeInBytes: Long = files.flatMap(_.files.map(_.getLen)).sum

  override def listFiles(partitionFilters: Seq[Expression]): Seq[PartitionDirectory] = {
    files
  }

  override def refresh(): Unit = Unit

  override def rootPaths: Seq[Path] = files
    .map(_.files.map(_.getPath).head.getParent)

  override def inputFiles: Array[String] = files
    .flatMap(_.files.map(_.getPath.toString))
}
