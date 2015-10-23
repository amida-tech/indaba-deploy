-- MySQL dump 10.13  Distrib 5.1.55, for unknown-linux-gnu (x86_64)
--
-- Host: localhost    Database: indaba_publisher
-- ------------------------------------------------------
-- Server version	5.5.45-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aggr_method`
--

DROP TABLE IF EXISTS `aggr_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggr_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `module_name` varchar(100) DEFAULT NULL COMMENT 'Name of the Java module',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(45) DEFAULT NULL,
  `site_intro` text,
  `srv_otis_value` varchar(45) NOT NULL,
  `srv_scorecard` varchar(45) NOT NULL,
  `srv_scorecard_answer` varchar(45) NOT NULL,
  `srv_tds_value` varchar(45) NOT NULL,
  `com_otis_value` varchar(45) NOT NULL,
  `com_scorecard` varchar(45) NOT NULL,
  `com_scorecard_answer` varchar(45) NOT NULL,
  `com_tds_value` varchar(45) NOT NULL,
  `table_swap_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datapoint`
--

DROP TABLE IF EXISTS `datapoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datapoint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workset_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `aggr_method_id` int(11) NOT NULL COMMENT 'ID of the aggr method',
  `hole_policy` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - do not compute; 2 - ignore missing values',
  `short_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_dp_wsn` (`workset_id`,`name`),
  UNIQUE KEY `uq_dp_wssn` (`workset_id`,`short_name`),
  KEY `fk_dp_ws` (`workset_id`),
  KEY `fk_dp_method` (`aggr_method_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COMMENT='Data point definition ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset`
--

DROP TABLE IF EXISTS `dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workset_id` int(11) NOT NULL,
  `includes_nonpub_data` tinyint(1) NOT NULL COMMENT 'Whether this dataset includes non-published data',
  `last_update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_ds` (`workset_id`,`includes_nonpub_data`),
  KEY `fk_ds_ws` (`workset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COMMENT='Datasets are used to store results of aggregation computatio';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dp_member`
--

DROP TABLE IF EXISTS `dp_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dp_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datapoint_id` int(11) NOT NULL COMMENT 'The datapoint this member belongs to.',
  `indicator_instance_id` int(11) DEFAULT NULL COMMENT 'ID of the member indicator instance. 0 if not an indicator instance.',
  `dp_id` int(11) DEFAULT NULL COMMENT 'ID of the member data point. 0 if not a data point.',
  `weight` int(11) DEFAULT NULL COMMENT 'Relative weight assigned to this member. Must be >= 0.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_dpm` (`datapoint_id`,`indicator_instance_id`,`dp_id`),
  KEY `fk_dpm_dp` (`datapoint_id`),
  KEY `fk_dpm_ii` (`indicator_instance_id`)
) ENGINE=MyISAM AUTO_INCREMENT=861 DEFAULT CHARSET=latin1 COMMENT='Define members of a data point definition';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exp_study_period`
--

DROP TABLE IF EXISTS `exp_study_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_study_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `export_log_id` int(11) NOT NULL,
  `study_period_id` int(11) NOT NULL COMMENT 'ID of study period in Builder DB',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_expsp` (`export_log_id`,`study_period_id`),
  KEY `fk_expsp_exp` (`export_log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Study periods in an export';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exp_target`
--

DROP TABLE IF EXISTS `exp_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `export_log_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_expt` (`export_log_id`,`target_id`),
  KEY `fk_expt_exp` (`export_log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Targets included into an export';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `export_log`
--

DROP TABLE IF EXISTS `export_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `workset_id` int(11) DEFAULT NULL COMMENT 'Only for dataset export',
  `product_id` int(11) DEFAULT NULL COMMENT 'Only for journal export',
  `user_id` int(11) NOT NULL COMMENT 'ID of the user (in Builder DB) that did the export. 0 if unknown.',
  PRIMARY KEY (`id`),
  KEY `fk_exp_ws` (`workset_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='This table keeps audit log of all export activities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `otis_value_a`
--

DROP TABLE IF EXISTS `otis_value_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otis_value_a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `indicator_id` int(11) NOT NULL,
  `study_period_id` int(11) NOT NULL,
  `data_type` tinyint(4) NOT NULL COMMENT '1 - single choice; 2 - multi choice; 3 - integer; 4 - float; 5 - text.\nCopied from scorecard_answer.',
  `value` text NOT NULL COMMENT 'Copied from scorecard_answer.',
  `score` decimal(22,6) DEFAULT NULL COMMENT 'Copied from scorecard_answer.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_otisv_otis` (`org_id`,`target_id`,`indicator_id`,`study_period_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27042 DEFAULT CHARSET=latin1 COMMENT='This table contains data values in the OTIS data space';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `otis_value_b`
--

DROP TABLE IF EXISTS `otis_value_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otis_value_b` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `indicator_id` int(11) NOT NULL,
  `study_period_id` int(11) NOT NULL,
  `data_type` tinyint(4) NOT NULL COMMENT '1 - single choice; 2 - multi choice; 3 - integer; 4 - float; 5 - text.\nCopied from scorecard_answer.',
  `value` text NOT NULL COMMENT 'Copied from scorecard_answer.',
  `score` decimal(22,6) DEFAULT NULL COMMENT 'Copied from scorecard_answer.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_otisv_otis` (`org_id`,`target_id`,`indicator_id`,`study_period_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27042 DEFAULT CHARSET=latin1 COMMENT='This table contains data values in the OTIS data space';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scorecard_a`
--

DROP TABLE IF EXISTS `scorecard_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scorecard_a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scorecard_id` int(11) NOT NULL,
  `content_header_id` int(11) NOT NULL COMMENT 'The survey content object that the scorecard belongs to. content_header is defined in the Builder DB.',
  `target_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `study_period_id` int(11) NOT NULL,
  `survey_config_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT 'Status of the scorecard in Builder:\n\n1 - no data; 2 - in progress; 3 - submitted; 4 - published;',
  `last_update_time` datetime NOT NULL COMMENT 'When this scorecard was last updated',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2307 DEFAULT CHARSET=latin1 COMMENT='Scorecard contains flattened raw data values of a survey con';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scorecard_answer_a`
--

DROP TABLE IF EXISTS `scorecard_answer_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scorecard_answer_a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scorecard_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL COMMENT 'ID of the question (in Builder DB) this answer corresponds to.',
  `indicator_id` int(11) NOT NULL,
  `data_type` tinyint(4) NOT NULL COMMENT '1 - single choice; 2 - multi choice; 3 - integer; 4 - float; 5 - text',
  `value` text NOT NULL COMMENT 'This is the the representation of the answer value. For multi choice, it is expressed as the labels of selected choices separated by the vertical bar char.\n',
  `score` decimal(22,6) DEFAULT NULL COMMENT 'The score associated with the answer. Only for single-choice, int, and float data types. Integer is converted to float.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_sa_card_qst` (`scorecard_id`,`question_id`),
  UNIQUE KEY `uq_sa_card_ind` (`scorecard_id`,`indicator_id`),
  KEY `fk_sa_card` (`scorecard_id`)
) ENGINE=MyISAM AUTO_INCREMENT=164156 DEFAULT CHARSET=latin1 COMMENT='Answers in the scorecard.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scorecard_answer_b`
--

DROP TABLE IF EXISTS `scorecard_answer_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scorecard_answer_b` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scorecard_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL COMMENT 'ID of the question (in Builder DB) this answer corresponds to.',
  `indicator_id` int(11) NOT NULL,
  `data_type` tinyint(4) NOT NULL COMMENT '1 - single choice; 2 - multi choice; 3 - integer; 4 - float; 5 - text',
  `value` text NOT NULL COMMENT 'This is the the representation of the answer value. For multi choice, it is expressed as the labels of selected choices separated by the vertical bar char.\n',
  `score` decimal(22,6) DEFAULT NULL COMMENT 'The score associated with the answer. Only for single-choice, int, and float data types. Integer is converted to float.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_sa_card_qst` (`scorecard_id`,`question_id`),
  UNIQUE KEY `uq_sa_card_ind` (`scorecard_id`,`indicator_id`),
  KEY `fk_sa_card` (`scorecard_id`)
) ENGINE=MyISAM AUTO_INCREMENT=164156 DEFAULT CHARSET=latin1 COMMENT='Answers in the scorecard.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scorecard_b`
--

DROP TABLE IF EXISTS `scorecard_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scorecard_b` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scorecard_id` int(11) NOT NULL,
  `content_header_id` int(11) NOT NULL COMMENT 'The survey content object that the scorecard belongs to. content_header is defined in the Builder DB.',
  `target_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `study_period_id` int(11) NOT NULL,
  `survey_config_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT 'Status of the scorecard in Builder:\n\n1 - no data; 2 - in progress; 3 - submitted; 4 - published;',
  `last_update_time` datetime NOT NULL COMMENT 'When this scorecard was last updated',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2311 DEFAULT CHARSET=latin1 COMMENT='Scorecard contains flattened raw data values of a survey con';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tds_value_a`
--

DROP TABLE IF EXISTS `tds_value_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tds_value_a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataset_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `datapoint_id` int(11) NOT NULL,
  `study_period_id` int(11) NOT NULL,
  `value` decimal(22,6) NOT NULL COMMENT 'Computed value of the aggregation',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_tdsv_dd` (`dataset_id`,`datapoint_id`,`target_id`,`study_period_id`),
  KEY `fk_tdsv_ds` (`dataset_id`),
  KEY `fk_tdsv_dp` (`datapoint_id`)
) ENGINE=MyISAM AUTO_INCREMENT=184 DEFAULT CHARSET=latin1 COMMENT='The TDS (target, datapoint, study-period) data space for sto';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tds_value_b`
--

DROP TABLE IF EXISTS `tds_value_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tds_value_b` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataset_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `datapoint_id` int(11) NOT NULL,
  `study_period_id` int(11) NOT NULL,
  `value` decimal(22,6) NOT NULL COMMENT 'Computed value of the aggregation',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_tdsv_dd` (`dataset_id`,`datapoint_id`,`target_id`,`study_period_id`),
  KEY `fk_tdsv_ds` (`dataset_id`),
  KEY `fk_tdsv_dp` (`datapoint_id`)
) ENGINE=MyISAM AUTO_INCREMENT=184 DEFAULT CHARSET=latin1 COMMENT='The TDS (target, datapoint, study-period) data space for sto';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tech_name` varchar(255) NOT NULL COMMENT 'Technical or internal name of the widget. Provided by the widget developer.',
  `display_name` varchar(255) NOT NULL COMMENT 'Display name of the widget when listed in widget library.',
  `description` text,
  `author` varchar(45) DEFAULT NULL,
  `org_id` int(11) NOT NULL DEFAULT '1' COMMENT 'ID of the organization that owns this widget. Organizations are defined in the Builder DB.',
  `version` varchar(45) NOT NULL DEFAULT '1.0' COMMENT 'In the form of major.minor.',
  `visibility` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - public;\n2 - private;\n3 - authenticated;',
  `target_url` varchar(255) NOT NULL,
  `icon_file_name` varchar(100) NOT NULL,
  `params` text COMMENT 'comma separated standard parameters',
  `content_types` int(11) NOT NULL,
  `config_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='This table contains only the meta attributes of widgets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workset`
--

DROP TABLE IF EXISTS `workset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `defined_by_user_id` int(11) NOT NULL,
  `defined_time` datetime NOT NULL,
  `org_id` int(11) NOT NULL COMMENT 'Organization the workset belongs to. Inherits the org of the user who defined the ws.',
  `visibility` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - public; 2 - private',
  `is_active` tinyint(1) NOT NULL COMMENT 'Whether this WS is active. Inactive WS is ignored by the aggregation process.',
  `last_update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ws_indicator_instance`
--

DROP TABLE IF EXISTS `ws_indicator_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_indicator_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workset_id` int(11) NOT NULL,
  `indicator_id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_wsi` (`workset_id`,`indicator_id`,`org_id`),
  KEY `fk_wsi_ws` (`workset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2322 DEFAULT CHARSET=latin1 COMMENT='Indicators to be included into a WS';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ws_project`
--

DROP TABLE IF EXISTS `ws_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workset_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL COMMENT 'ID of the project (in Builder DB) included into the WS',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_wsp_wsp` (`workset_id`,`project_id`),
  KEY `fk_wsp_ws` (`workset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COMMENT='Projects that are included into a WS';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ws_puser`
--

DROP TABLE IF EXISTS `ws_puser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_puser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workset_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'ID of the privileged user (in Builder DB) ',
  PRIMARY KEY (`id`),
  KEY `fk_wspu_ws` (`workset_id`),
  KEY `uq_wspu` (`workset_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Privileged users of the WS';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ws_target`
--

DROP TABLE IF EXISTS `ws_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workset_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_wst` (`workset_id`,`target_id`),
  KEY `fk_wst_ws` (`workset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=494 DEFAULT CHARSET=latin1 COMMENT='Targets to be included into a WS';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-03 12:58:30
