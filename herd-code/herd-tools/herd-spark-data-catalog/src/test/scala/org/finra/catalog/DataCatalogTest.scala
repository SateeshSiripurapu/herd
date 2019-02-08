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
package org.finra.catalog

import org.apache.spark.sql.SparkSession
import org.junit.runner.RunWith
import org.scalatest.FeatureSpec
import org.scalatest.junit.JUnitRunner

@RunWith(classOf[JUnitRunner])
class DataCatalogTest extends FeatureSpec {

  val spark = SparkSession
    .builder()
    .appName("catalog-test")
    .master("local[*]")
    .getOrCreate()

  feature("TODO") {
    info("Add Tests!!")

    scenario("Scenario 1") {
      assert(1 == 1)
    }
  }
}
