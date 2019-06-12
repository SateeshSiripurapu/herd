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

import org.apache.hadoop.conf.Configuration
import org.apache.hadoop.fs.{FileStatus, Path}
import org.apache.spark.internal.Logging
import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.catalyst.InternalRow
import org.apache.spark.sql.catalyst.catalog.ExternalCatalogUtils.unescapePathName
import org.apache.spark.sql.catalyst.expressions._
import org.apache.spark.sql.execution.datasources.{FileIndex, PartitionPath, PartitionSpec}
import org.apache.spark.sql.types._
import org.apache.spark.util.SerializableConfiguration
import scala.collection.JavaConversions._
import scala.collection.mutable
import scala.util.{Failure, Success, Try}

import org.finra.herd.sdk.model.StorageUnit

 /** A custom [[org.apache.spark.sql.execution.datasources.FileIndex]] to use the partition paths provided by Herd, vs Spark's auto-discovery
  *
  * The custom data source abstracts the logic of querying Herd and defining DataFrames from the source data, or writing and creating
  * data sets. From an end-user's perspective using the Herd data source would be very similar to standard Spark data sources, using the DataFrameReader/Write
  * interfaces.
  *
  * @param sparkSession        The spark session
  * @param api                 The ApiClient instance needed by Herd SDK
  * @param herdPartitions      The list of partitions
  * @param namespace           The namespace
  * @param businessObjectName  The business object definition name
  * @param formatUsage         The business object format usage (e.g. PRC).
  * @param formatFileType      The business object format file type (e.g. GZ).
  * @param partitionKey        The business object format partition key.
  * @param herdPartitionSchema The schema associated with the business object format
  */
private[sql] abstract class HerdFileIndexBase(
                                             sparkSession: SparkSession,
                                             api: () => HerdApi,
                                             herdPartitions: Seq[(Int, String, Seq[String], Int)],
                                             namespace: String,
                                             businessObjectName: String,
                                             formatUsage: String,
                                             formatFileType: String,
                                             partitionKey: String,
                                             herdPartitionSchema: StructType) extends FileIndex with Logging {

  import HerdFileIndexBase._

  protected val hadoopConf = sparkSession.sessionState.newHadoopConf()

  protected val partitionSpec = {
    val partitions = herdPartitions.map {
      case (formatVersion, partitionValue, subPartitionValues, dataVersion) =>
        val row = if (herdPartitionSchema.nonEmpty) {
          val partValues = partitionValue +: subPartitionValues
          val values = partValues.zipWithIndex.map {
            case (rawValue, index) =>
              val field = herdPartitionSchema(index)

              Cast(Literal.create(unescapePathName(rawValue), StringType), field.dataType).eval()

          }

          InternalRow.fromSeq(values)
        } else {
          InternalRow.empty
        }

        val pathSettings = Array(
          s"namespace=$namespace",
          s"businessObjectName=$businessObjectName",
          s"formatUsage=$formatUsage",
          s"formatFileType=$formatFileType",
          s"formatVersion=$formatVersion",
          s"partitionKey=$partitionKey",
          s"partitionValue=$partitionValue",
          s"subPartitionValues=${subPartitionValues.mkString(",")}",
          s"dataVersion=$dataVersion"
        )

        val path = pathSettings.mkString("/")

        PartitionPath(row, path)

    }

    PartitionSpec(herdPartitionSchema, partitions)
  }

  @transient protected val cachedAllFiles = mutable.LinkedHashMap[Path, Array[FileStatus]]()

  override def rootPaths: Seq[Path] = partitionSpec.partitions.map(_.path)

   /**
    * List all files for the specified herd paths
    *
    * @param paths list of paths
    * @return The list of files under herd paths
    */
  protected def bulkListLeafFiles(paths: Seq[Path]): Seq[(Path, Array[FileStatus])] = {
    if (paths.size < sparkSession.sessionState.conf.parallelPartitionDiscoveryThreshold) {
      paths.map { path =>
        val statuses = listLeafFiles(hadoopConf, api(), path.toString).toArray

        (path, statuses)
      }
    } else {
      val serializableConfiguration = new SerializableConfiguration(hadoopConf)
      val parallelPartitionDiscoveryParallelism = sparkSession.sessionState.conf.parallelPartitionDiscoveryParallelism
      val numParallelism = Math.min(paths.size, parallelPartitionDiscoveryParallelism)
      val localApiFactory = api

      val fileStatuses = sparkSession.sparkContext
        .parallelize(paths.map(_.toString), numParallelism)
        .mapPartitions { pathStrings =>
          val localApi = localApiFactory()
          pathStrings.toSeq.map { path =>
            (path, listLeafFiles(serializableConfiguration.value, localApi, path))
          }.iterator
        }
        .map {
          case (path, statuses) => (path, statuses.map { s => (s.getPath.toString, s.getLen) })
        }.collect()

      fileStatuses.map {
        case (path, statuses) =>
          val newPath = new Path(path)
          val newStatuses = statuses.map {
            case (filePath, size) => new FileStatus(size, false, 0, 0, 0, new Path(filePath))
          }.toArray

          (newPath, newStatuses)

      }
    }
  }

  override def inputFiles: Array[String] = Array.empty

  override def refresh(): Unit = {
    cachedAllFiles.clear()
  }

  override def sizeInBytes: Long = Long.MaxValue

  override def partitionSchema: StructType = herdPartitionSchema

  override def toString: String = {
    s"HerdFileIndex[" +
      s"namespace=$namespace," +
      s"businessObjectName=$businessObjectName," +
      s"formatUsage=$formatUsage," +
      s"formatFileType=$formatFileType" +
      "]"
  }

  def filterPartitions(filters: Seq[Expression]): FileIndex
}

private object HerdFileIndexBase extends Logging {

  def parsePartitionPath(path: String): Map[String, Option[String]] = {
    path.split("/").map(_.split("=")).map(i => i.head -> i.drop(1).headOption).toMap
  }

  def listLeafFiles(hadoopConf: Configuration, api: HerdApi, path: String): Seq[FileStatus] = {
    val parts = parsePartitionPath(path)

    Try(api.getBusinessObjectData(
      parts("namespace").get,
      parts("businessObjectName").get,
      parts("formatUsage").get,
      parts("formatFileType").get,
      parts("formatVersion").get.toInt,
      parts("partitionKey").get,
      parts("partitionValue").get,
      parts("subPartitionValues").map(_.split(",").toSeq).getOrElse(Seq.empty),
      parts("dataVersion").get.toInt
    )) match {
      case Success(objectData) => objectData.getStorageUnits.flatMap(getFileStatuses(hadoopConf, _))
      case Failure(error) =>
        log.error(s"Could not fetch object data for $path", error)
        Seq.empty
    }
  }

  private def getFileStatuses(hadoopConf: Configuration, storageUnit: StorageUnit): Seq[FileStatus] = {
    val storage = storageUnit.getStorage

    val prefix = storage.getStoragePlatformName match {
      case "S3" =>
        val scheme = "s3a://"
        val bucket = storage
          .getAttributes
          .find(_.getName.equalsIgnoreCase("bucket.name"))
          .map(_.getValue)
          .getOrElse(sys.error("Missing 'bucket.name' attribute"))
        scheme + bucket + "/"

      case "FILE" => ""
      case _ => sys.error(s"Unsupported storage platform ${storage.getStoragePlatformName}")
    }

    if (storageUnit.getStorageFiles == null) {
      log.error(s"No storage files could be found for object")
      Seq.empty
    } else {
      storageUnit.getStorageFiles.map { f =>
        val path = new Path(prefix + f.getFilePath)

        val fs = path.getFileSystem(hadoopConf)

        new FileStatus(f.getFileSizeBytes, false, 0, 0, 0, path.makeQualified(fs.getUri, fs.getWorkingDirectory))
      }
    }
  }

}
