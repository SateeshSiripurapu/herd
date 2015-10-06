--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

-- SET search_path = dmrowner, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Data for Name: cnfgn; Type: TABLE DATA; Schema: dmrowner; Owner: dmrowner
--

INSERT INTO cnfgn VALUES ('org.springframework.orm.jpa.vendor.Database', 'POSTGRESQL', NULL);
INSERT INTO cnfgn VALUES ('hibernate.dialect', 'org.hibernate.dialect.PostgreSQL9Dialect', NULL);
INSERT INTO cnfgn VALUES ('org.quartz.jobStore.driverDelegateClass', 'org.quartz.impl.jdbcjobstore.PostgreSQLDelegate', NULL);

--
-- Data for Name: scrty_fn_lk; Type: TABLE DATA; Schema: dmrowner; Owner: dmrowner
--
INSERT INTO scrty_fn_lk VALUES('FN_BUILD_INFO_GET','FN_BUILD_INFO_GET','FN_BUILD_INFO_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_ATTRIBUTES_ALL_GET','FN_BUSINESS_OBJECT_DATA_ATTRIBUTES_ALL_GET','FN_BUSINESS_OBJECT_DATA_ATTRIBUTES_ALL_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_ATTRIBUTES_DELETE','FN_BUSINESS_OBJECT_DATA_ATTRIBUTES_DELETE','FN_BUSINESS_OBJECT_DATA_ATTRIBUTES_DELETE',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_ATTRIBUTES_GET','FN_BUSINESS_OBJECT_DATA_ATTRIBUTES_GET','FN_BUSINESS_OBJECT_DATA_ATTRIBUTES_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_ATTRIBUTES_POST','FN_BUSINESS_OBJECT_DATA_ATTRIBUTES_POST','FN_BUSINESS_OBJECT_DATA_ATTRIBUTES_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_ATTRIBUTES_PUT','FN_BUSINESS_OBJECT_DATA_ATTRIBUTES_PUT','FN_BUSINESS_OBJECT_DATA_ATTRIBUTES_PUT',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_AVAILABILITY_COLLECTION_POST','FN_BUSINESS_OBJECT_DATA_AVAILABILITY_COLLECTION_POST','FN_BUSINESS_OBJECT_DATA_AVAILABILITY_COLLECTION_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_AVAILABILITY_POST','FN_BUSINESS_OBJECT_DATA_AVAILABILITY_POST','FN_BUSINESS_OBJECT_DATA_AVAILABILITY_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_DELETE','FN_BUSINESS_OBJECT_DATA_DELETE','FN_BUSINESS_OBJECT_DATA_DELETE',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_GENERATE_DDL_COLLECTION_POST','FN_BUSINESS_OBJECT_DATA_GENERATE_DDL_COLLECTION_POST','FN_BUSINESS_OBJECT_DATA_GENERATE_DDL_COLLECTION_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_GENERATE_DDL_POST','FN_BUSINESS_OBJECT_DATA_GENERATE_DDL_POST','FN_BUSINESS_OBJECT_DATA_GENERATE_DDL_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_GET','FN_BUSINESS_OBJECT_DATA_GET','FN_BUSINESS_OBJECT_DATA_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_NOTIFICATION_REGISTRATIONS_ALL_GET','FN_BUSINESS_OBJECT_DATA_NOTIFICATION_REGISTRATIONS_ALL_GET','FN_BUSINESS_OBJECT_DATA_NOTIFICATION_REGISTRATIONS_ALL_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_NOTIFICATION_REGISTRATIONS_DELETE','FN_BUSINESS_OBJECT_DATA_NOTIFICATION_REGISTRATIONS_DELETE','FN_BUSINESS_OBJECT_DATA_NOTIFICATION_REGISTRATIONS_DELETE',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_NOTIFICATION_REGISTRATIONS_GET','FN_BUSINESS_OBJECT_DATA_NOTIFICATION_REGISTRATIONS_GET','FN_BUSINESS_OBJECT_DATA_NOTIFICATION_REGISTRATIONS_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_NOTIFICATION_REGISTRATIONS_POST','FN_BUSINESS_OBJECT_DATA_NOTIFICATION_REGISTRATIONS_POST','FN_BUSINESS_OBJECT_DATA_NOTIFICATION_REGISTRATIONS_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_POST','FN_BUSINESS_OBJECT_DATA_POST','FN_BUSINESS_OBJECT_DATA_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_S3_KEY_PREFIX_GET','FN_BUSINESS_OBJECT_DATA_S3_KEY_PREFIX_GET','FN_BUSINESS_OBJECT_DATA_S3_KEY_PREFIX_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_STATUS_GET','FN_BUSINESS_OBJECT_DATA_STATUS_GET','FN_BUSINESS_OBJECT_DATA_STATUS_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_STATUS_PUT','FN_BUSINESS_OBJECT_DATA_STATUS_PUT','FN_BUSINESS_OBJECT_DATA_STATUS_PUT',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_STORAGES_FILES_POST','FN_BUSINESS_OBJECT_DATA_STORAGES_FILES_POST','FN_BUSINESS_OBJECT_DATA_STORAGES_FILES_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_UNREGISTERED_INVALIDATE','FN_BUSINESS_OBJECT_DATA_UNREGISTERED_INVALIDATE','FN_BUSINESS_OBJECT_DATA_UNREGISTERED_INVALIDATE',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DATA_VERSIONS_GET','FN_BUSINESS_OBJECT_DATA_VERSIONS_GET','FN_BUSINESS_OBJECT_DATA_VERSIONS_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DEFINITIONS_ALL_GET','FN_BUSINESS_OBJECT_DEFINITIONS_ALL_GET','FN_BUSINESS_OBJECT_DEFINITIONS_ALL_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DEFINITIONS_DELETE','FN_BUSINESS_OBJECT_DEFINITIONS_DELETE','FN_BUSINESS_OBJECT_DEFINITIONS_DELETE',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DEFINITIONS_GET','FN_BUSINESS_OBJECT_DEFINITIONS_GET','FN_BUSINESS_OBJECT_DEFINITIONS_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DEFINITIONS_POST','FN_BUSINESS_OBJECT_DEFINITIONS_POST','FN_BUSINESS_OBJECT_DEFINITIONS_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_DEFINITIONS_PUT','FN_BUSINESS_OBJECT_DEFINITIONS_PUT','FN_BUSINESS_OBJECT_DEFINITIONS_PUT',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_FORMATS_ALL_GET','FN_BUSINESS_OBJECT_FORMATS_ALL_GET','FN_BUSINESS_OBJECT_FORMATS_ALL_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_FORMATS_DELETE','FN_BUSINESS_OBJECT_FORMATS_DELETE','FN_BUSINESS_OBJECT_FORMATS_DELETE',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_FORMATS_GENERATE_DDL_COLLECTION_POST','FN_BUSINESS_OBJECT_FORMATS_GENERATE_DDL_COLLECTION_POST','FN_BUSINESS_OBJECT_FORMATS_GENERATE_DDL_COLLECTION_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_FORMATS_GENERATE_DDL_POST','FN_BUSINESS_OBJECT_FORMATS_GENERATE_DDL_POST','FN_BUSINESS_OBJECT_FORMATS_GENERATE_DDL_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_FORMATS_GET','FN_BUSINESS_OBJECT_FORMATS_GET','FN_BUSINESS_OBJECT_FORMATS_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_FORMATS_POST','FN_BUSINESS_OBJECT_FORMATS_POST','FN_BUSINESS_OBJECT_FORMATS_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_BUSINESS_OBJECT_FORMATS_PUT','FN_BUSINESS_OBJECT_FORMATS_PUT','FN_BUSINESS_OBJECT_FORMATS_PUT',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_CUSTOM_DDLS_ALL_GET','FN_CUSTOM_DDLS_ALL_GET','FN_CUSTOM_DDLS_ALL_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_CUSTOM_DDLS_DELETE','FN_CUSTOM_DDLS_DELETE','FN_CUSTOM_DDLS_DELETE',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_CUSTOM_DDLS_GET','FN_CUSTOM_DDLS_GET','FN_CUSTOM_DDLS_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_CUSTOM_DDLS_POST','FN_CUSTOM_DDLS_POST','FN_CUSTOM_DDLS_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_CUSTOM_DDLS_PUT','FN_CUSTOM_DDLS_PUT','FN_CUSTOM_DDLS_PUT',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_DISPLAY_DM_UI','FN_DISPLAY_DM_UI','FN_DISPLAY_DM_UI',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_DOWNLOAD_GET','FN_DOWNLOAD_GET','FN_DOWNLOAD_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_EMR_CLUSTERS_DELETE','FN_EMR_CLUSTERS_DELETE','FN_EMR_CLUSTERS_DELETE',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_EMR_CLUSTERS_GET','FN_EMR_CLUSTERS_GET','FN_EMR_CLUSTERS_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_EMR_CLUSTERS_POST','FN_EMR_CLUSTERS_POST','FN_EMR_CLUSTERS_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_EMR_CLUSTER_DEFINITIONS_DELETE','FN_EMR_CLUSTER_DEFINITIONS_DELETE','FN_EMR_CLUSTER_DEFINITIONS_DELETE',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_EMR_CLUSTER_DEFINITIONS_GET','FN_EMR_CLUSTER_DEFINITIONS_GET','FN_EMR_CLUSTER_DEFINITIONS_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_EMR_CLUSTER_DEFINITIONS_POST','FN_EMR_CLUSTER_DEFINITIONS_POST','FN_EMR_CLUSTER_DEFINITIONS_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_EMR_CLUSTER_DEFINITIONS_PUT','FN_EMR_CLUSTER_DEFINITIONS_PUT','FN_EMR_CLUSTER_DEFINITIONS_PUT',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_EMR_HADOOP_JAR_STEPS_POST','FN_EMR_HADOOP_JAR_STEPS_POST','FN_EMR_HADOOP_JAR_STEPS_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_EMR_HIVE_STEPS_POST','FN_EMR_HIVE_STEPS_POST','FN_EMR_HIVE_STEPS_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_EMR_MASTER_SECURITY_GROUPS_POST','FN_EMR_MASTER_SECURITY_GROUPS_POST','FN_EMR_MASTER_SECURITY_GROUPS_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_EMR_OOZIE_STEPS_POST','FN_EMR_OOZIE_STEPS_POST','FN_EMR_OOZIE_STEPS_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_EMR_OOZIE_WORKFLOW_GET','FN_EMR_OOZIE_WORKFLOW_GET','FN_EMR_OOZIE_WORKFLOW_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_EMR_PIG_STEPS_POST','FN_EMR_PIG_STEPS_POST','FN_EMR_PIG_STEPS_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_EMR_SHELL_STEPS_POST','FN_EMR_SHELL_STEPS_POST','FN_EMR_SHELL_STEPS_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_EXPECTED_PARTITION_VALUES_DELETE','FN_EXPECTED_PARTITION_VALUES_DELETE','FN_EXPECTED_PARTITION_VALUES_DELETE',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_EXPECTED_PARTITION_VALUES_GET','FN_EXPECTED_PARTITION_VALUES_GET','FN_EXPECTED_PARTITION_VALUES_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_EXPECTED_PARTITION_VALUES_POST','FN_EXPECTED_PARTITION_VALUES_POST','FN_EXPECTED_PARTITION_VALUES_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_FILE_TYPES_ALL_GET','FN_FILE_TYPES_ALL_GET','FN_FILE_TYPES_ALL_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_JOBS_GET','FN_JOBS_GET','FN_JOBS_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_JOBS_POST','FN_JOBS_POST','FN_JOBS_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_JOBS_SIGNAL_POST','FN_JOBS_SIGNAL_POST','FN_JOBS_SIGNAL_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_JOB_DEFINITIONS_GET','FN_JOB_DEFINITIONS_GET','FN_JOB_DEFINITIONS_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_JOB_DEFINITIONS_POST','FN_JOB_DEFINITIONS_POST','FN_JOB_DEFINITIONS_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_JOB_DEFINITIONS_PUT','FN_JOB_DEFINITIONS_PUT','FN_JOB_DEFINITIONS_PUT',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_NAMESPACES_ALL_GET','FN_NAMESPACES_ALL_GET','FN_NAMESPACES_ALL_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_NAMESPACES_DELETE','FN_NAMESPACES_DELETE','FN_NAMESPACES_DELETE',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_NAMESPACES_GET','FN_NAMESPACES_GET','FN_NAMESPACES_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_NAMESPACES_POST','FN_NAMESPACES_POST','FN_NAMESPACES_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_PARTITION_KEY_GROUPS_ALL_GET','FN_PARTITION_KEY_GROUPS_ALL_GET','FN_PARTITION_KEY_GROUPS_ALL_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_PARTITION_KEY_GROUPS_DELETE','FN_PARTITION_KEY_GROUPS_DELETE','FN_PARTITION_KEY_GROUPS_DELETE',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_PARTITION_KEY_GROUPS_GET','FN_PARTITION_KEY_GROUPS_GET','FN_PARTITION_KEY_GROUPS_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_PARTITION_KEY_GROUPS_POST','FN_PARTITION_KEY_GROUPS_POST','FN_PARTITION_KEY_GROUPS_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_STORAGES_ALL_GET','FN_STORAGES_ALL_GET','FN_STORAGES_ALL_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_STORAGES_DELETE','FN_STORAGES_DELETE','FN_STORAGES_DELETE',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_STORAGES_GET','FN_STORAGES_GET','FN_STORAGES_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_STORAGES_POST','FN_STORAGES_POST','FN_STORAGES_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_STORAGES_PUT','FN_STORAGES_PUT','FN_STORAGES_PUT',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_STORAGES_UPLOAD_STATS_GET','FN_STORAGES_UPLOAD_STATS_GET','FN_STORAGES_UPLOAD_STATS_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_STORAGE_PLATFORMS_ALL_GET','FN_STORAGE_PLATFORMS_ALL_GET','FN_STORAGE_PLATFORMS_ALL_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_STORAGE_PLATFORMS_GET','FN_STORAGE_PLATFORMS_GET','FN_STORAGE_PLATFORMS_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_SYSTEM_JOBS_POST','FN_SYSTEM_JOBS_POST','FN_SYSTEM_JOBS_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_UPLOAD_EXTEND_CREDENTIALS_GET','FN_UPLOAD_EXTEND_CREDENTIALS_GET','FN_UPLOAD_EXTEND_CREDENTIALS_GET',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');
INSERT INTO scrty_fn_lk VALUES('FN_UPLOAD_POST','FN_UPLOAD_POST','FN_UPLOAD_POST',current_timestamp,'SYSTEM',current_timestamp,'SYSTEM');

----------------------
-- Disable security --
----------------------
INSERT INTO cnfgn VALUES ('security.enabled.spel.expression', 'false', NULL);

---------------------------------
-- Notification Configurations --
---------------------------------
INSERT INTO cnfgn VALUES ('dm.notification.sqs.enabled', 'false', NULL);

--
-- PostgreSQL database dump complete
--

