-- MySQL dump 10.14  Distrib 5.5.44-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: indaba
-- ------------------------------------------------------
-- Server version	5.5.44-MariaDB

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
-- Table structure for table `access_matrix`
--

DROP TABLE IF EXISTS `access_matrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT 'Each matrix has a unique name',
  `description` varchar(255) DEFAULT NULL,
  `default_value` tinyint(4) DEFAULT NULL COMMENT 'Default permission value if the value for a role/right combination is not explicitly defined.\n\n0 - No\n1 - Yes\n2 - Undefined',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='An access matrix defines permission values for role/right co';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_matrix`
--

LOCK TABLES `access_matrix` WRITE;
/*!40000 ALTER TABLE `access_matrix` DISABLE KEYS */;
INSERT INTO `access_matrix` VALUES (1,'Project Default','The default access matrix for projects',1),(54,'Test Action Right 1','soemthing',1);
/*!40000 ALTER TABLE `access_matrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_permission`
--

DROP TABLE IF EXISTS `access_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_matrix_id` int(11) NOT NULL COMMENT 'ID of the access matrix that this permission belongs to',
  `role_id` int(11) NOT NULL COMMENT 'ID of the role in role/right combination',
  `rights_id` int(11) NOT NULL COMMENT 'ID of the right in role/right combination',
  `permission` tinyint(4) NOT NULL COMMENT 'Permission value:\n0 - No\n1 - Yes\n2 - Undefined',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_mrr` (`access_matrix_id`,`role_id`,`rights_id`),
  KEY `fk_permission_matrix1` (`access_matrix_id`),
  KEY `fk_permission_role1` (`role_id`),
  KEY `fk_permission_right` (`rights_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14174 DEFAULT CHARSET=utf8 COMMENT='This defines the permission value for a role/right combinati';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_permission`
--

LOCK TABLES `access_permission` WRITE;
/*!40000 ALTER TABLE `access_permission` DISABLE KEYS */;
INSERT INTO `access_permission` VALUES (1,1,2,1,1),(14172,54,58,0,0),(14173,1,58,0,0);
/*!40000 ALTER TABLE `access_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT 'Title of the announcement',
  `body` text COMMENT 'Announcement body',
  `created_by_user_id` int(11) NOT NULL COMMENT 'ID of user who created this announcement',
  `created_time` datetime NOT NULL COMMENT 'Time at which the announcement was created',
  `expiration` datetime NOT NULL COMMENT 'When this announcement will expire',
  `active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Whether the announcement is active\n\n0 - inactive\n1 - active',
  PRIMARY KEY (`id`),
  KEY `fk_announcement_user1` (`created_by_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement`
--

LOCK TABLES `announcement` WRITE;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer_object_choice`
--

DROP TABLE IF EXISTS `answer_object_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_object_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choices` bigint(20) unsigned NOT NULL COMMENT 'Bit mask that contains all selected choices. ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=717622 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_object_choice`
--

LOCK TABLES `answer_object_choice` WRITE;
/*!40000 ALTER TABLE `answer_object_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_object_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer_object_float`
--

DROP TABLE IF EXISTS `answer_object_float`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_object_float` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_object_float`
--

LOCK TABLES `answer_object_float` WRITE;
/*!40000 ALTER TABLE `answer_object_float` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_object_float` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer_object_integer`
--

DROP TABLE IF EXISTS `answer_object_integer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_object_integer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14082 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_object_integer`
--

LOCK TABLES `answer_object_integer` WRITE;
/*!40000 ALTER TABLE `answer_object_integer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_object_integer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer_object_text`
--

DROP TABLE IF EXISTS `answer_object_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_object_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48210 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_object_text`
--

LOCK TABLES `answer_object_text` WRITE;
/*!40000 ALTER TABLE `answer_object_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_object_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer_type_choice`
--

DROP TABLE IF EXISTS `answer_type_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_type_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6640 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_type_choice`
--

LOCK TABLES `answer_type_choice` WRITE;
/*!40000 ALTER TABLE `answer_type_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_type_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer_type_float`
--

DROP TABLE IF EXISTS `answer_type_float`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_type_float` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `min_value` float NOT NULL,
  `max_value` float NOT NULL,
  `default_value` float DEFAULT NULL,
  `criteria` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_type_float`
--

LOCK TABLES `answer_type_float` WRITE;
/*!40000 ALTER TABLE `answer_type_float` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_type_float` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer_type_integer`
--

DROP TABLE IF EXISTS `answer_type_integer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_type_integer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `min_value` int(11) NOT NULL,
  `max_value` int(11) NOT NULL,
  `default_value` int(11) DEFAULT NULL,
  `criteria` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8 COMMENT='Structure of the Number answer type of indicator';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_type_integer`
--

LOCK TABLES `answer_type_integer` WRITE;
/*!40000 ALTER TABLE `answer_type_integer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_type_integer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer_type_table`
--

DROP TABLE IF EXISTS `answer_type_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_type_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tdf_file_name` varchar(300) DEFAULT NULL COMMENT 'name of the original tdf file uploaded by the user',
  `file_path` varchar(45) DEFAULT NULL COMMENT 'path to the stored file',
  `data` text COMMENT 'json structure for table def',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_type_table`
--

LOCK TABLES `answer_type_table` WRITE;
/*!40000 ALTER TABLE `answer_type_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_type_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer_type_text`
--

DROP TABLE IF EXISTS `answer_type_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_type_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `min_chars` int(11) NOT NULL,
  `max_chars` int(11) NOT NULL,
  `criteria` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8 COMMENT='Structure of answer type Text';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_type_text`
--

LOCK TABLES `answer_type_text` WRITE;
/*!40000 ALTER TABLE `answer_type_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_type_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apicall`
--

DROP TABLE IF EXISTS `apicall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apicall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `call_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'when the call was made',
  `func` varchar(105) NOT NULL COMMENT 'api function called',
  `url` varchar(255) NOT NULL COMMENT 'Original request url',
  `ip_addr` varchar(45) DEFAULT NULL COMMENT 'IP of the caller',
  `organization_id` int(11) DEFAULT NULL COMMENT 'org id on the call',
  `key_version` int(11) DEFAULT NULL COMMENT 'key version on the call',
  `product_id` int(11) DEFAULT NULL,
  `horse_id` int(11) DEFAULT NULL COMMENT 'horse ID of the requested content. ',
  `authn_code` tinyint(4) NOT NULL COMMENT '0 = ok;\n1 = bad function;\n2 = bad syntax;\n3 = bad org;\n4 = key not found;\n5 = key expired;\n6 = key revoked;\n7 = bad digest;\n8 = call too old;\n9 = replay;',
  `authz_code` tinyint(4) DEFAULT NULL COMMENT '0 = ok;\n1 = no access;',
  PRIMARY KEY (`id`),
  KEY `fk_apicall_org` (`organization_id`),
  KEY `fk_apicall_horse` (`horse_id`),
  KEY `fk_apicall_prod` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apicall`
--

LOCK TABLES `apicall` WRITE;
/*!40000 ALTER TABLE `apicall` DISABLE KEYS */;
/*!40000 ALTER TABLE `apicall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atc_choice`
--

DROP TABLE IF EXISTS `atc_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atc_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_type_choice_id` int(11) NOT NULL,
  `label` text NOT NULL COMMENT 'Display label of the choice',
  `score` int(11) DEFAULT NULL COMMENT 'Score associated with the choice',
  `criteria` text COMMENT 'Text resource ID of the choice''s criteria',
  `weight` int(11) NOT NULL COMMENT 'Weight that defines the display order of the choice ',
  `mask` bigint(20) unsigned NOT NULL COMMENT 'The bit mask representing this choice in the ATC',
  `default_selected` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Whether this choice is selected by default',
  `use_score` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether the score is applicable',
  PRIMARY KEY (`id`),
  KEY `fk_atcc_atc` (`answer_type_choice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30994 DEFAULT CHARSET=utf8 COMMENT='Choices for a ATC';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atc_choice`
--

LOCK TABLES `atc_choice` WRITE;
/*!40000 ALTER TABLE `atc_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `atc_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atc_choice_intl`
--

DROP TABLE IF EXISTS `atc_choice_intl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atc_choice_intl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atc_choice_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `label` text NOT NULL,
  `criteria` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_acintl_atclang` (`atc_choice_id`,`language_id`),
  KEY `fk_acintl_atcc` (`atc_choice_id`),
  KEY `fk_acintl_lang` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3444 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atc_choice_intl`
--

LOCK TABLES `atc_choice_intl` WRITE;
/*!40000 ALTER TABLE `atc_choice_intl` DISABLE KEYS */;
/*!40000 ALTER TABLE `atc_choice_intl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_header_id` int(11) NOT NULL COMMENT 'ID of the content that the file is attached to',
  `name` varchar(255) NOT NULL COMMENT 'Name of the attached file',
  `size` int(11) NOT NULL DEFAULT '0' COMMENT 'file size (bytes)',
  `type` varchar(8) NOT NULL COMMENT 'file type (suffix, i.e. txt, doc, pdf, etc.)',
  `note` varchar(255) DEFAULT NULL COMMENT 'Any notes to be attached',
  `file_path` varchar(255) NOT NULL COMMENT 'Path to the attached file in the file system after uploaded',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'the file upload time',
  `user_id` int(11) DEFAULT '0' COMMENT 'user who uploaded the file',
  PRIMARY KEY (`id`),
  KEY `fk_attachment_content_header1` (`content_header_id`),
  KEY `fk_attachment_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34696 DEFAULT CHARSET=utf8 COMMENT='defines file attachment.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_attachment`
--

DROP TABLE IF EXISTS `case_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cases_id` int(11) NOT NULL COMMENT 'ID of the case the file is attached to',
  `file_name` varchar(45) NOT NULL COMMENT 'Name of the attached file',
  `file_path` varchar(255) NOT NULL COMMENT 'Path to file in the file system',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_ca_case_file` (`cases_id`,`file_name`),
  KEY `fk_ca_case` (`cases_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='Stores information about files attached to cases. A case cou';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_attachment`
--

LOCK TABLES `case_attachment` WRITE;
/*!40000 ALTER TABLE `case_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `case_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_object`
--

DROP TABLE IF EXISTS `case_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cases_id` int(11) NOT NULL COMMENT 'ID of the case that the object is attached to',
  `object_type` tinyint(4) NOT NULL COMMENT 'Only two kinds of objects for now:\n\n0 - user\n1 - content',
  `object_id` int(11) NOT NULL COMMENT 'The ID of the attached object, either content_header_id or uid, depending on the object_type.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cto` (`cases_id`,`object_type`,`object_id`),
  KEY `fk_co_case` (`cases_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2627 DEFAULT CHARSET=utf8 COMMENT='Multiple objects could be associated with a case.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_object`
--

LOCK TABLES `case_object` WRITE;
/*!40000 ALTER TABLE `case_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `case_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_tag`
--

DROP TABLE IF EXISTS `case_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cases_id` int(11) NOT NULL COMMENT 'ID of the case',
  `ctags_id` int(11) NOT NULL COMMENT 'ID of the ctag to be associated with the case',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_ct_casetag` (`cases_id`,`ctags_id`),
  KEY `fk_ct_case` (`cases_id`),
  KEY `fk_ct_tag` (`ctags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Define case/tag association';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_tag`
--

LOCK TABLES `case_tag` WRITE;
/*!40000 ALTER TABLE `case_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `case_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opened_by_user_id` int(11) NOT NULL COMMENT 'opened by this user',
  `assigned_user_id` int(11) DEFAULT NULL COMMENT 'User assigned to be responsible',
  `opened_time` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `priority` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 - low\n2 - medium\n3 - high',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Status code of the case.\n0 - open\n1 - closed',
  `substatus` tinyint(4) DEFAULT NULL COMMENT 'Substatus code. \nWhen status is open:\n1 - New\n2 - Assigned\n\nWhen status is closed\n101 - Resolved\n102 - Invalid\n103 - Withdrawn\n104 - Duplicate',
  `block_workflow` tinyint(1) DEFAULT '0' COMMENT 'whether this case blocks workflow from being executed\n0 - no\n1 - yes',
  `block_publishing` tinyint(1) DEFAULT '0' COMMENT 'whether this case blocks publishing\n0 - no\n1 - yes',
  `project_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `horse_id` int(11) DEFAULT NULL,
  `goal_id` int(11) DEFAULT NULL,
  `staff_msgboard_id` int(11) DEFAULT NULL,
  `user_msgboard_id` int(11) DEFAULT NULL,
  `last_updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_case_user1` (`opened_by_user_id`),
  KEY `fk_case_project1` (`project_id`),
  KEY `fk_case_staff_mb` (`staff_msgboard_id`),
  KEY `fk_case_user_mb` (`user_msgboard_id`),
  KEY `fk_case_product` (`product_id`),
  KEY `fk_case_horse` (`horse_id`),
  KEY `fk_case_goal` (`goal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=525 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_language_id` int(11) NOT NULL,
  `platform_name` varchar(255) NOT NULL,
  `platform_admin_user_id` int(11) NOT NULL,
  `builder_config` text,
  `publisher_config` text,
  `cp_config` text,
  PRIMARY KEY (`id`),
  KEY `fk_config_admin_user` (`platform_admin_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,1,'Indaba',1,'################################################################\n#                                                              #\n#            Indaba web application configuration              #\n# Copyright 2010 OpenConcept Systems,Inc. All rights reserved. #\n#                                                              #\n################################################################\n\n# set email server\nmail.smtp.host=mail.indabaplatform.com\nmail.smtp.port=587\nmail.smtp.auth=true\nmail.smtp.sender=indaba@indabaplatform.com\nmail.smtp.username=indaba\nmail.smtp.password=SSLisoverrated!\n\n# max number of attempts to send a mail\nmailbatch.max.send=10000\n\n# max number of mails to process each cycle\nmailbatch.max.size=50\n\n# attachment file storage location\n# base path\nstorage.upload.base=/data/upload\n# storage path format. 0: base; 1: userid; 2: date; 3: filename\nstorage.path.format={0}/{1}/{2}/{3}\nstorage.date.format=yyyyMMdd\n\nstorage.upload.cntattach.name=contentattachment\n\n# content attachement path. 0: base path, 1: horseid, 2: filename\nstorage.upload.contentattachment.path={0}/contentattachment/{1}/{2}\n\nstorage.img.base=/data/images\nstorage.img.filename.fmt=hc_horse_id_{1}.jpg\nimg.type=jpeg\nimg.wait=10000\nimg.width=800\nimg.height=600\n\n# people icon path. 0: base path, 1: image file name\nstorage.img.peopleicon.path={0}/peopleicons/{1}\n\n# sponsor logo base url. 0: admin tool\'s base url (refer to \'admintool.baseurl\')\nloader.sponsorlogo.baseurl={0}/upload_files/sponsor_logos\n\n# sponsor logo path. 0: base path, 1: project id, 2: file name\n# Note, this parameter is deprecated and won\'t be used.\n# Actually, you should use \'loader.sponsorlogs.baseurl\'\nstorage.img.sponsorlogo.path={0}/sponsor_logos/{1}/{2}\n\n# messaging\nmessage.inbox.sidebar.size=5\nmessage.inbox.pagesize=10\n\n# admintool\nadmintool.baseurl=http://indaba.amida-demo.com/indaba_admin\n\n# workflow\nworkflow.alert_resend_interval=4320\nworkflow.reload_interval=0\n\n# cookie session timeout\ncookie.persistent.enabled=false\nsession.token.timeout=1200000\n\n# I18N text resource template engine settings\n# Please gurantee the tomcat user must have READ permission on i18n.src.dir\n# and WRITE permission on i18n.backup.dir and i18n.output.dir\ni18n.resource.src.orig.dir=/Users/jiangjeff/Workspace/indaba/trunk/Builder/web\ni18n.resource.src.tagged.dir=/Users/jiangjeff/Workspace/indaba/trunk/Builder/web/i18n_tagged\ni18n.resource.backup.dir=/tmp/i18n_backup\ni18n.resource.output.dir=/Users/jiangjeff/Workspace/indaba/trunk/Builder/web/i18n_output\n\nauth.ingore.paths=preactivate.do,activate.do,login.do,forgetpwd.do,runWorkflow.do,userfinder.do,fireuserfinder.do,mailbatch.do,sourceFile.do,textResource.do,textResourceTemplate.do,notificationEdit.do,jsI18nMsg.do,i18nTools.do,404.jsp,error.jsp\nauth.restricted.paths=runWorkflow.do,fireuserfinder.do,mailbatch.do,i18nTools.do\nauth.access.whitelist=localhost,127.0.0.1\n\ni18n.resource.dir=/WEB-INF/config/intl_resources\n','################################################################\n#                                                              #\n#            Indaba web application configuration              #\n# Copyright 2010 OpenConcept Systems,Inc. All rights reserved. #\n#                                                              #\n################################################################\n\nstorage.base.path=/data/indaba/aggregation/products\n\nprod.dirpath.pattern=PRD{0,number,#}\n\n# Scorecare Result File\nsrf.filename.pattern=HRS{0,number,#}.srf\n\n# Product Information File\npif.filename=PIF.pif\n\nscorecard.filepath.pattern={0}/{1}\n\n# cache file path\ncache.base.path=/data/indaba/aggregation/cache\n\n#workset file path\nworkset.root.path=/data/indaba/aggregation/workset\n\nworkset.published.suffix=published\nworkset.usable.suffix=usable\n\n# indicator summary cache file\nindicator.summary.filename.pattern=indicator_summary_HRS{0,number,#}.json\n\n# data summary cache file\ndata.summary.filename.pattern=data_summary_HRS{0,number,#}.json\n\n\nexport.base.path=/data/indaba/aggregation/export\nexport.filename=PRD{0}.xls\n\njournal.attachment.url=http://localhost:8080/aggregation/attachment.do?action=download&attachid={0,number,#}\n\nscorecard.attachment.url=http://localhost:8080/indaba/attachment.do?action=download&type=survey&attachid={0,number,#}&answerid={1,number,#}\n\n# attachment file storage location\n# base path\nstorage.upload.base=/data/upload\n# content attachement path. 0: base path, 1: horseid, 2: filename\nstorage.upload.contentattachment.path={0}/contentattachment/{1}/{2}\n\n# enable/disable data aggregation\ndata.aggregation.enable=true\n# only accept the following whitelist IP address\ndata.aggregation.whitelist=127.0.0.1,localhost,0:0:0:0:0:0:0:1\n\naggregation.local.context.path=http://localhost:8080/ids/\nexport.wkhtmltopdf.cmd=/apps/builds/bin/wkhtmltopdf --disable-external-links --ignore-load-errors --outline\nexport.wkhtmltopdf.run.timeout=60\nexport.wkhtmltopdf.java.executor.threadNum=3\n\nexport.pdftk.cmd=/apps/builds/bin/pdftk\nexport.pdftk.run.timeout=120\n\n#for api security, timestamp check in seconds\napi.security.timestamp.interval=600','################################################################\n#                                                              #\n#            Indaba web application configuration              #\n# Copyright 2010 OpenConcept Systems,Inc. All rights reserved. #\n#                                                              #\n################################################################\n\n# set email server\nmail.smtp.host=mail.indabaplatform.com\nmail.smtp.port=587\nmail.smtp.auth=true\nmail.smtp.sender=indaba@indabaplatform.com\nmail.smtp.username=indaba\nmail.smtp.password=SSLisoverrated!\n\n\n# attachment file storage location\n# base path\nstorage.upload.base=/data/controlpanel/upload\n# storage path format. 0: base; 1: type; 2: filename\nstorage.path.format={0}/{1}/{2}\n\n# admintool\nadmintool.baseurl=http://indaba.amida-demo.com/.com/indaba_admin\n\n# cookie session timeout\ncookie.persistent.enabled=false\nsession.token.timeout=360000\n\n# Access whitelist of I18N tools \ni18n.tools.whitelist=localhost,127.0.0.1\n\n# New user activation link pattern\nnew.user.access.link=http://indaba.amida-demo.com/indaba/preactivate.do?username={0}&password={1}\n\n');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_approval`
--

DROP TABLE IF EXISTS `content_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_approval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_header_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `note` text,
  `task_assignment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_chtask` (`content_header_id`,`task_assignment_id`),
  KEY `fk_ca_user` (`user_id`),
  KEY `fk_ca_content` (`content_header_id`),
  KEY `fk_ca_task` (`task_assignment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1041 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_approval`
--

LOCK TABLES `content_approval` WRITE;
/*!40000 ALTER TABLE `content_approval` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_header`
--

DROP TABLE IF EXISTS `content_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL COMMENT 'ID of the project that the content belongs to',
  `content_type` int(11) NOT NULL COMMENT 'Content type:\n\n0 - survey\n1 - journal',
  `content_object_id` int(11) NOT NULL COMMENT 'ID of the content object in the appropriate content object table: survey_content_object or journal_content_object',
  `horse_id` int(11) NOT NULL COMMENT 'ID of the horse that the content belongs to',
  `title` varchar(255) NOT NULL COMMENT 'Title of the content',
  `author_user_id` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT 'Create time of the content',
  `last_update_time` datetime DEFAULT NULL COMMENT 'Last update time of the content',
  `last_update_user_id` int(11) DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `deleted_by_user_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT 'Status of the content\n0 - in-flight\n1 - locked\n2 - deleted\n3 - completed\n4 - published',
  `internal_msgboard_id` int(11) DEFAULT NULL COMMENT 'ID of the message board used for internal staff discussions about this content',
  `staff_author_msgboard_id` int(11) DEFAULT NULL COMMENT 'ID of the message board used for staff/author discussions about this content',
  `editable` tinyint(1) DEFAULT NULL,
  `reviewable` tinyint(1) DEFAULT NULL,
  `peer_reviewable` tinyint(1) DEFAULT NULL,
  `approvable` tinyint(1) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL COMMENT 'when the content was submitted',
  PRIMARY KEY (`id`),
  UNIQUE KEY `horse_id_UNIQUE` (`horse_id`),
  KEY `fk_content_header_user1` (`author_user_id`),
  KEY `fk_content_header_messageboard1` (`internal_msgboard_id`),
  KEY `fk_ch_mb2` (`staff_author_msgboard_id`),
  KEY `fk_ch_horse` (`horse_id`),
  KEY `fk_ch_deletedby` (`deleted_by_user_id`),
  KEY `fk_ch_lastupdate_user` (`last_update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15992 DEFAULT CHARSET=utf8 COMMENT='defines the common attri of content instances of all types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_header`
--

LOCK TABLES `content_header` WRITE;
/*!40000 ALTER TABLE `content_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_payment`
--

DROP TABLE IF EXISTS `content_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_header_id` int(11) NOT NULL,
  `paid_by_user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `time` datetime NOT NULL,
  `payees` varchar(255) DEFAULT NULL,
  `note` text,
  `task_assignment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cp_ct_task` (`content_header_id`,`task_assignment_id`),
  KEY `fk_cp_user` (`paid_by_user_id`),
  KEY `fk_cp_content` (`content_header_id`),
  KEY `fk_cp_task` (`task_assignment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_payment`
--

LOCK TABLES `content_payment` WRITE;
/*!40000 ALTER TABLE `content_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_version`
--

DROP TABLE IF EXISTS `content_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_header_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `internal_msgboard_id` int(11) DEFAULT NULL,
  `staff_author_msgboard_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cv_header` (`content_header_id`),
  KEY `fk_cv_user` (`user_id`),
  KEY `fk_cv_intmb` (`internal_msgboard_id`),
  KEY `fk_cv_samb` (`staff_author_msgboard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7205 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_version`
--

LOCK TABLES `content_version` WRITE;
/*!40000 ALTER TABLE `content_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctags`
--

DROP TABLE IF EXISTS `ctags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(45) NOT NULL COMMENT 'The term of the tag to be displayed',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps predefined tags that can be used to classif';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctags`
--

LOCK TABLES `ctags` WRITE;
/*!40000 ALTER TABLE `ctags` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dead_horse`
--

DROP TABLE IF EXISTS `dead_horse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dead_horse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT 'ID of the product',
  `target_id` int(11) NOT NULL COMMENT 'ID of the target',
  `start_time` datetime DEFAULT NULL COMMENT 'When the process was started',
  `completion_time` datetime DEFAULT NULL COMMENT 'When the process was completed',
  `content_header_id` int(11) NOT NULL,
  `workflow_object_id` int(11) NOT NULL,
  `kill_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'when the horse was killed',
  PRIMARY KEY (`id`),
  KEY `fk_horse_target1` (`target_id`),
  KEY `fk_horse_prod` (`product_id`),
  KEY `fk_horse_workflow_object1` (`workflow_object_id`),
  KEY `fk_horse_content` (`content_header_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15991 DEFAULT CHARSET=utf8 COMMENT='Each target/product produces a horse. The horse keeps state ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dead_horse`
--

LOCK TABLES `dead_horse` WRITE;
/*!40000 ALTER TABLE `dead_horse` DISABLE KEYS */;
/*!40000 ALTER TABLE `dead_horse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_log_id` int(11) NOT NULL COMMENT 'ID of the log book on that the event will be recorded',
  `event_type` smallint(6) NOT NULL COMMENT 'Type of the event',
  `event_data` text COMMENT 'Any event specific data',
  `user_id` int(11) DEFAULT NULL COMMENT 'ID of the user who caused the event to happen',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time at whioch the event ocurred',
  PRIMARY KEY (`id`),
  KEY `fk_event_log_id` (`event_log_id`),
  KEY `fk_event_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=271323 DEFAULT CHARSET=utf8 COMMENT='This table stores events that occured during workflow execut';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (271316,1,1,'User Login',1,'2015-08-27 17:51:55'),(271317,1,2,'User Logout',1,'2015-08-27 17:54:30'),(271318,1,1,'User Login',1,'2015-08-27 17:55:13'),(271319,1,2,'User Logout',1,'2015-08-27 17:55:17'),(271320,1,1,'User Login',1,'2015-08-27 18:11:32'),(271321,1,2,'User Logout',1,'2015-08-27 18:12:03'),(271322,1,1,'User Login',4645,'2015-08-27 18:27:50');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log`
--

DROP TABLE IF EXISTS `event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of the log book',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21745 DEFAULT CHARSET=utf8 COMMENT='Event log is used to record events that happened during work';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal`
--

DROP TABLE IF EXISTS `goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_sequence_id` int(11) NOT NULL COMMENT 'ID of the sequence that the goal belongs to',
  `weight` int(11) NOT NULL COMMENT 'Weight of the goal in the sequence. Lighter goals go first.',
  `name` varchar(100) NOT NULL COMMENT 'Unique name of the goal',
  `description` varchar(255) DEFAULT NULL,
  `access_matrix_id` int(11) NOT NULL COMMENT 'ID of the access matrix used within the scope of the goal',
  `duration` int(11) NOT NULL COMMENT 'How many days allowed to complete this goal',
  `entrance_rule_file_name` varchar(255) DEFAULT NULL COMMENT 'ID of the entrance rule set',
  `inflight_rule_file_name` varchar(255) DEFAULT NULL COMMENT 'ID of the inflight rule ',
  `exit_rule_file_name` varchar(255) DEFAULT NULL COMMENT 'ID of the exit rule',
  `entrance_rule_desc` text NOT NULL,
  `inflight_rule_desc` text NOT NULL,
  `exit_rule_desc` text NOT NULL,
  `create_content_version` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_goal_name_seq` (`workflow_sequence_id`,`name`),
  KEY `fk_goal_workflow_sequence1` (`workflow_sequence_id`),
  KEY `fk_goal_access_matrix1` (`access_matrix_id`),
  KEY `fk_goal_entrance_rule` (`entrance_rule_file_name`),
  KEY `fk_goal_inflight_rule` (`inflight_rule_file_name`),
  KEY `fk_goal_exit_rule` (`exit_rule_file_name`)
) ENGINE=InnoDB AUTO_INCREMENT=554 DEFAULT CHARSET=utf8 COMMENT='A goal is a milestone in a project''s workflow. This table de';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal`
--

LOCK TABLES `goal` WRITE;
/*!40000 ALTER TABLE `goal` DISABLE KEYS */;
/*!40000 ALTER TABLE `goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal_object`
--

DROP TABLE IF EXISTS `goal_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goal_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goal_id` int(11) NOT NULL COMMENT 'ID of the goal that this GO is instantiated from',
  `enter_time` datetime DEFAULT NULL COMMENT 'When this goal is started (entered)',
  `exit_time` datetime DEFAULT NULL COMMENT 'When the goal was ended (exited)',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Goal execution status:\n\n0 - waiting\n1 - starting\n2 - started\n3 - done\n',
  `sequence_object_id` int(11) NOT NULL COMMENT 'ID of the sequence object (SO) that the GO belongs to',
  `event_log_id` int(11) DEFAULT NULL COMMENT 'ID of the event log used to record events that occurred during this GO execution',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_seq_goal` (`goal_id`,`sequence_object_id`),
  KEY `fk_goal_object_goal1` (`goal_id`),
  KEY `fk_goal_object_seq` (`sequence_object_id`),
  KEY `fk_goal_object_log` (`event_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115116 DEFAULT CHARSET=utf8 COMMENT='Goal Object is instantiated from a Goal Definition and is us';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_object`
--

LOCK TABLES `goal_object` WRITE;
/*!40000 ALTER TABLE `goal_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `goal_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupdef`
--

DROP TABLE IF EXISTS `groupdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupdef` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(105) NOT NULL,
  `description` text,
  `weight` int(11) NOT NULL DEFAULT '1',
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_grpdef_prod` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupdef`
--

LOCK TABLES `groupdef` WRITE;
/*!40000 ALTER TABLE `groupdef` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupdef_role`
--

DROP TABLE IF EXISTS `groupdef_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupdef_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupdef_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permissions` int(11) DEFAULT '0' COMMENT 'bitmask of:\n\n1 = manage comments;\n',
  PRIMARY KEY (`id`),
  UNIQUE KEY `un_grpdefrole` (`groupdef_id`,`role_id`),
  KEY `fk_grpdefr_role` (`role_id`),
  KEY `fk_grpdefr_grp` (`groupdef_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupdef_role`
--

LOCK TABLES `groupdef_role` WRITE;
/*!40000 ALTER TABLE `groupdef_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupdef_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupdef_user`
--

DROP TABLE IF EXISTS `groupdef_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupdef_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupdef_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permissions` int(11) DEFAULT '0' COMMENT 'bit mask of:\n1 = manage comments\n',
  PRIMARY KEY (`id`),
  UNIQUE KEY `un_grpdefuser` (`groupdef_id`,`user_id`),
  KEY `fk_grpdefu_user` (`user_id`),
  KEY `fk_grpdefu_grp` (`groupdef_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupdef_user`
--

LOCK TABLES `groupdef_user` WRITE;
/*!40000 ALTER TABLE `groupdef_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupdef_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupobj`
--

DROP TABLE IF EXISTS `groupobj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupobj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupdef_id` int(11) NOT NULL,
  `horse_id` int(11) NOT NULL,
  `survey_question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_grpobj` (`groupdef_id`,`horse_id`,`survey_question_id`),
  KEY `fk_grpobj_grpdef` (`groupdef_id`),
  KEY `fk_grpobj_qst` (`survey_question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73647 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupobj`
--

LOCK TABLES `groupobj` WRITE;
/*!40000 ALTER TABLE `groupobj` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupobj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupobj_comment`
--

DROP TABLE IF EXISTS `groupobj_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupobj_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupobj_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '0 - user comment;\n1 - set flag;\n2 - flag response;\n3 - unset flag;',
  `groupobj_flag_id` int(11) DEFAULT NULL COMMENT 'for flag-related comment',
  `comment` text NOT NULL,
  `author_user_id` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `delete_user_id` int(11) DEFAULT NULL,
  `delete_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grpobjcmt_grpobj` (`groupobj_id`),
  KEY `fk_grpobjcmt_author` (`author_user_id`),
  KEY `fk_grpobjcmt_deluser` (`delete_user_id`),
  KEY `fk_grpobjcmt_flag` (`groupobj_flag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22697 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupobj_comment`
--

LOCK TABLES `groupobj_comment` WRITE;
/*!40000 ALTER TABLE `groupobj_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupobj_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupobj_flag`
--

DROP TABLE IF EXISTS `groupobj_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupobj_flag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupobj_id` int(11) NOT NULL,
  `raise_user_id` int(11) NOT NULL,
  `raise_time` timestamp NULL DEFAULT NULL,
  `issue_description` text NOT NULL,
  `assigned_user_id` int(11) NOT NULL,
  `due_time` datetime DEFAULT NULL,
  `permissions` int(11) NOT NULL COMMENT 'bit mask of:\n1 = change scores;\n2 = change source;\n4 = change comments;\n8 = change attachments;\n16 = change PR opinion;\n32 = PR discussion;',
  `respond_time` timestamp NULL DEFAULT NULL,
  `unset_time` timestamp NULL DEFAULT NULL,
  `unset_comment` text,
  `unset_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grpobjflag_grp` (`groupobj_id`),
  KEY `fk_grpobjflag_raiseuser` (`raise_user_id`),
  KEY `fk_grpobjflag_assignuser` (`assigned_user_id`),
  KEY `fk_grpobjflag_unsetuser` (`unset_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6181 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupobj_flag`
--

LOCK TABLES `groupobj_flag` WRITE;
/*!40000 ALTER TABLE `groupobj_flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupobj_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horse`
--

DROP TABLE IF EXISTS `horse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT 'ID of the product',
  `target_id` int(11) NOT NULL COMMENT 'ID of the target',
  `start_time` datetime DEFAULT NULL COMMENT 'When the process was started',
  `completion_time` datetime DEFAULT NULL COMMENT 'When the process was completed',
  `content_header_id` int(11) NOT NULL,
  `workflow_object_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_header_id_UNIQUE` (`content_header_id`),
  KEY `fk_horse_target1` (`target_id`),
  KEY `fk_horse_prod` (`product_id`),
  KEY `fk_horse_workflow_object1` (`workflow_object_id`),
  KEY `fk_horse_content` (`content_header_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15992 DEFAULT CHARSET=utf8 COMMENT='Each target/product produces a horse. The horse keeps state ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horse`
--

LOCK TABLES `horse` WRITE;
/*!40000 ALTER TABLE `horse` DISABLE KEYS */;
/*!40000 ALTER TABLE `horse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder` varchar(255) NOT NULL,
  `note` text,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `result` tinyint(4) DEFAULT NULL COMMENT '1 - SUCCESS;\n2 - FAILURE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indicator_tag`
--

DROP TABLE IF EXISTS `indicator_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indicator_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_indicator_id` int(11) NOT NULL,
  `itags_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_it_td` (`survey_indicator_id`,`itags_id`),
  KEY `fk_it_ind` (`survey_indicator_id`),
  KEY `fk_it_tag` (`itags_id`)
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8 COMMENT='This table contains indicator and itags association';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicator_tag`
--

LOCK TABLES `indicator_tag` WRITE;
/*!40000 ALTER TABLE `indicator_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `indicator_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itags`
--

DROP TABLE IF EXISTS `itags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term_UNIQUE` (`term`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='This table contains indicator tags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itags`
--

LOCK TABLES `itags` WRITE;
/*!40000 ALTER TABLE `itags` DISABLE KEYS */;
/*!40000 ALTER TABLE `itags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_attachment_version`
--

DROP TABLE IF EXISTS `journal_attachment_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_attachment_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_version_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `type` varchar(8) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `update_time` datetime DEFAULT NULL COMMENT 'file upload time',
  `user_id` int(11) DEFAULT '0' COMMENT 'user who uploaded the file',
  PRIMARY KEY (`id`),
  KEY `jav_version` (`content_version_id`),
  KEY `fk_jav_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2159 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_attachment_version`
--

LOCK TABLES `journal_attachment_version` WRITE;
/*!40000 ALTER TABLE `journal_attachment_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal_attachment_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_config`
--

DROP TABLE IF EXISTS `journal_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `instructions` text NOT NULL COMMENT 'ID of the instruction text for users',
  `min_words` int(11) NOT NULL,
  `max_words` int(11) NOT NULL,
  `exportable_items` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - content and attachments\n1 - content only\n2 - attachments only',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='Journal Config defines configuration infor for a journal pro';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_config`
--

LOCK TABLES `journal_config` WRITE;
/*!40000 ALTER TABLE `journal_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_content_object`
--

DROP TABLE IF EXISTS `journal_content_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_content_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of the JCO',
  `content_header_id` int(11) NOT NULL COMMENT 'ID of the content header that contains common attributes for this JCO',
  `body` text COMMENT 'Content body of this JCO',
  `journal_config_id` int(11) NOT NULL COMMENT 'ID of the journal config',
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_header_id_UNIQUE` (`content_header_id`),
  KEY `fk_journal_content_object_content_header1` (`content_header_id`),
  KEY `fk_jco_config` (`journal_config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1816 DEFAULT CHARSET=utf8 COMMENT='Defines journal specific content object structure (JCO). Com';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_content_object`
--

LOCK TABLES `journal_content_object` WRITE;
/*!40000 ALTER TABLE `journal_content_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal_content_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_content_version`
--

DROP TABLE IF EXISTS `journal_content_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_content_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_version_id` int(11) NOT NULL,
  `body` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `journal_content_object_id_UNIQUE` (`content_version_id`),
  UNIQUE KEY `jcv_header_task` (`content_version_id`),
  KEY `jcv_version` (`content_version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1467 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_content_version`
--

LOCK TABLES `journal_content_version` WRITE;
/*!40000 ALTER TABLE `journal_content_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal_content_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_peer_review`
--

DROP TABLE IF EXISTS `journal_peer_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_peer_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_content_object_id` int(11) NOT NULL COMMENT 'ID of the JCO that the peer review is for',
  `reviewer_user_id` int(11) NOT NULL COMMENT 'UID of the user who wrote the peer review',
  `opinions` text COMMENT 'Opinions of the peer reviewer',
  `last_change_time` datetime DEFAULT NULL COMMENT 'Last change time of the peer review',
  `msgboard_id` int(11) DEFAULT NULL COMMENT 'ID of the message board used for communication between the peer reviewer and staff members',
  `submit_time` datetime DEFAULT NULL COMMENT 'when the review was submitted',
  PRIMARY KEY (`id`),
  KEY `fk_jpr_jobj` (`journal_content_object_id`),
  KEY `fk_jpr_author` (`reviewer_user_id`),
  KEY `fk_jpr_msgboard` (`msgboard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8 COMMENT='Keeps peer review data for a journal content object (JCO). A';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_peer_review`
--

LOCK TABLES `journal_peer_review` WRITE;
/*!40000 ALTER TABLE `journal_peer_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal_peer_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` char(2) NOT NULL COMMENT 'Language abbreviation: EN, CN, JP, etc',
  `language_desc` varchar(45) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT 'Whether this lanaguge is enabled:\n\n0 - active\n1 - inactive',
  PRIMARY KEY (`id`),
  UNIQUE KEY `language_UNIQUE` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='This table stores languages supported. All language using 2 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (4,'En','English',0);
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailbatch`
--

DROP TABLE IF EXISTS `mailbatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailbatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` text,
  `body` text,
  `from_email` varchar(255) NOT NULL,
  `to_email` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `send_count` int(11) DEFAULT NULL COMMENT 'how many times the msg was sent',
  `last_send_time` timestamp NULL DEFAULT NULL COMMENT 'last time tried',
  `is_sent` tinyint(1) DEFAULT NULL COMMENT 'whether the msg has been sent successfully',
  `message_id` int(11) DEFAULT NULL COMMENT 'the ID of the message. null if not in the message table.',
  PRIMARY KEY (`id`),
  KEY `fk_mailbatch_msg` (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=282955 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailbatch`
--

LOCK TABLES `mailbatch` WRITE;
/*!40000 ALTER TABLE `mailbatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailbatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msgboard_id` int(11) NOT NULL COMMENT 'ID of the msgboard the msg is posted to',
  `publishable` tinyint(1) DEFAULT '0' COMMENT 'Whether this msg is publishable',
  `author_user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'uid of the auther. 0 means system generated',
  `created_time` datetime NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `enhancer_user_id` int(11) DEFAULT NULL COMMENT 'UID of the user who enhanced this msg',
  `enhance_time` datetime DEFAULT NULL COMMENT 'Time at which the user enhanced the msg',
  `enhance_body` text COMMENT 'Enhanced title by the enhancer',
  `enhance_title` varchar(255) DEFAULT NULL COMMENT 'Enhanced title by the enhancer',
  `delete_time` timestamp NULL DEFAULT NULL COMMENT 'not null if the message is deleted.',
  `delete_user_id` int(11) DEFAULT NULL COMMENT 'user that deleted the message',
  PRIMARY KEY (`id`),
  KEY `fk_message_messageboard1` (`msgboard_id`),
  KEY `fk_message_author` (`author_user_id`),
  KEY `fk_message_enhancer` (`enhancer_user_id`),
  KEY `fk_msg_deleter` (`delete_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=679711 DEFAULT CHARSET=utf8 COMMENT='A message is posted to a message board.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_reading_status`
--

DROP TABLE IF EXISTS `msg_reading_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_reading_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL COMMENT 'ID of the msg read',
  `user_id` int(11) NOT NULL COMMENT 'UID of the user who read the msg',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time at which the msg was read',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_uid_msg` (`message_id`,`user_id`),
  KEY `fk_mrs_uid` (`user_id`),
  KEY `fk_mrs_msg` (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16223 DEFAULT CHARSET=utf8 COMMENT='This table stores message reading status for a user ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_reading_status`
--

LOCK TABLES `msg_reading_status` WRITE;
/*!40000 ALTER TABLE `msg_reading_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_reading_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msgboard`
--

DROP TABLE IF EXISTS `msgboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID of the msgboard',
  `create_time` datetime NOT NULL COMMENT 'When the msgboard was created',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1394932 DEFAULT CHARSET=utf8 COMMENT='A msgboard contains multiple messages. It is used for discus';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msgboard`
--

LOCK TABLES `msgboard` WRITE;
/*!40000 ALTER TABLE `msgboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `msgboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notedef`
--

DROP TABLE IF EXISTS `notedef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notedef` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(105) NOT NULL,
  `description` text,
  `weight` int(11) NOT NULL DEFAULT '1',
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_notedef_prod` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notedef`
--

LOCK TABLES `notedef` WRITE;
/*!40000 ALTER TABLE `notedef` DISABLE KEYS */;
/*!40000 ALTER TABLE `notedef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notedef_role`
--

DROP TABLE IF EXISTS `notedef_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notedef_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notedef_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permissions` int(11) DEFAULT NULL COMMENT 'bitmasks of:\n\n1= edit note;\n2 = translate note;',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_notedefrole` (`notedef_id`,`role_id`),
  KEY `fk_notedefrole_role` (`role_id`),
  KEY `fk_notedefrole_def` (`notedef_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notedef_role`
--

LOCK TABLES `notedef_role` WRITE;
/*!40000 ALTER TABLE `notedef_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `notedef_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notedef_user`
--

DROP TABLE IF EXISTS `notedef_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notedef_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notedef_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permissions` int(11) DEFAULT '0' COMMENT 'bit mask of:\n1 = edit note;\n2 = translate note;',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_notedefuser` (`notedef_id`,`user_id`),
  KEY `fk_notedefuser_def` (`notedef_id`),
  KEY `fk_notedefuser_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notedef_user`
--

LOCK TABLES `notedef_user` WRITE;
/*!40000 ALTER TABLE `notedef_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `notedef_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noteobj`
--

DROP TABLE IF EXISTS `noteobj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noteobj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notedef_id` int(11) NOT NULL,
  `horse_id` int(11) NOT NULL,
  `survey_question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_noteobj` (`notedef_id`,`horse_id`,`survey_question_id`),
  KEY `fk_noteobj_def` (`notedef_id`),
  KEY `fk_noteobj_horse` (`horse_id`),
  KEY `fk_noteobj_qst` (`survey_question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29368 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noteobj`
--

LOCK TABLES `noteobj` WRITE;
/*!40000 ALTER TABLE `noteobj` DISABLE KEYS */;
/*!40000 ALTER TABLE `noteobj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noteobj_intl`
--

DROP TABLE IF EXISTS `noteobj_intl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noteobj_intl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noteobj_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL COMMENT 'ID of a supported language',
  `note` text NOT NULL COMMENT 'translated text',
  `create_user_id` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `last_update_user_id` int(11) DEFAULT NULL,
  `last_update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_noteobjintl` (`noteobj_id`,`language_id`),
  KEY `fk_noteobjintl_note` (`noteobj_id`),
  KEY `fk_noteobjintl_lang` (`language_id`),
  KEY `fk_noteobjintl_cuid` (`create_user_id`),
  KEY `fk_noteobjintl_uuid` (`last_update_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noteobj_intl`
--

LOCK TABLES `noteobj_intl` WRITE;
/*!40000 ALTER TABLE `noteobj_intl` DISABLE KEYS */;
/*!40000 ALTER TABLE `noteobj_intl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noteobj_version`
--

DROP TABLE IF EXISTS `noteobj_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noteobj_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notedef_id` int(11) NOT NULL,
  `content_version_id` int(11) NOT NULL,
  `survey_question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_notedefversion` (`notedef_id`,`content_version_id`,`survey_question_id`),
  KEY `fk_nov_notedef` (`notedef_id`),
  KEY `fk_nov_cv` (`content_version_id`),
  KEY `fk_nov_qst` (`survey_question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99190 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noteobj_version`
--

LOCK TABLES `noteobj_version` WRITE;
/*!40000 ALTER TABLE `noteobj_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `noteobj_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noteobj_version_intl`
--

DROP TABLE IF EXISTS `noteobj_version_intl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noteobj_version_intl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noteobj_version_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `note` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_novintl` (`noteobj_version_id`,`language_id`),
  KEY `fk_novi_nov` (`noteobj_version_id`),
  KEY `fk_novi_lang` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=396 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noteobj_version_intl`
--

LOCK TABLES `noteobj_version_intl` WRITE;
/*!40000 ALTER TABLE `noteobj_version_intl` DISABLE KEYS */;
/*!40000 ALTER TABLE `noteobj_version_intl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_item`
--

DROP TABLE IF EXISTS `notification_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_text` varchar(255) NOT NULL,
  `body_text` text,
  `language_id` int(11) DEFAULT NULL,
  `notification_type_id` int(11) DEFAULT NULL,
  `name` varchar(105) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_ind` (`notification_type_id`,`language_id`),
  KEY `fk_language` (`language_id`),
  KEY `fk_notification_type` (`notification_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_item`
--

LOCK TABLES `notification_item` WRITE;
/*!40000 ALTER TABLE `notification_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_type`
--

DROP TABLE IF EXISTS `notification_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `label` varchar(105) DEFAULT NULL,
  `project_customizable` tinyint(1) DEFAULT '1',
  `category` int(11) DEFAULT '0',
  `template_type` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='Stores predefined notification types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_type`
--

LOCK TABLES `notification_type` WRITE;
/*!40000 ALTER TABLE `notification_type` DISABLE KEYS */;
INSERT INTO `notification_type` VALUES (44,'Notification 1','Notification 1',NULL,1,0,0);
/*!40000 ALTER TABLE `notification_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgadmin`
--

DROP TABLE IF EXISTS `orgadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgadmin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_oaoa` (`organization_id`,`user_id`),
  KEY `fk_oa_org` (`organization_id`),
  KEY `fk_oa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgadmin`
--

LOCK TABLES `orgadmin` WRITE;
/*!40000 ALTER TABLE `orgadmin` DISABLE KEYS */;
INSERT INTO `orgadmin` VALUES (78,1,4645);
/*!40000 ALTER TABLE `orgadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` text,
  `admin_user_id` int(11) NOT NULL COMMENT 'This is the super admin - first admin of the org',
  `url` varchar(255) DEFAULT NULL,
  `enforce_api_security` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'whether to enforce api key',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_org_admin_user` (`admin_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'Global Integrity',NULL,1,'http://globalintegrity.org',0);
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgkey`
--

DROP TABLE IF EXISTS `orgkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgkey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NOT NULL COMMENT 'The org that the key belongs to. Org 0 means super key.',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT 'Version number of the key',
  `hash_algorithm` varchar(45) NOT NULL DEFAULT 'sha1',
  `issue_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'when the key is issued',
  `issue_user_id` int(11) NOT NULL COMMENT 'user that issued the key',
  `effective_time` timestamp NULL DEFAULT NULL COMMENT 'when the key becomes effective',
  `valid_days` int(11) NOT NULL DEFAULT '0' COMMENT 'how many days the key is valid. 0 means no expiration.',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 = normal;\n2 = revoked;',
  `revoke_time` timestamp NULL DEFAULT NULL COMMENT 'when the key was revoked',
  `revoke_user_id` int(11) DEFAULT NULL COMMENT 'user that revoked the key',
  `revoke_reason` varchar(255) DEFAULT NULL,
  `renew_time` timestamp NULL DEFAULT NULL COMMENT 'when the key was renewed',
  `renew_user_id` int(11) DEFAULT NULL COMMENT 'User that renewed the key. 0 means by system',
  `data` varchar(45) NOT NULL COMMENT 'Key data. Must be valid ASCII with no spaces. Not to exceed 40 chars.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_ok_orgversion` (`organization_id`,`version`),
  KEY `fk_ok_org` (`organization_id`),
  KEY `fk_ok_issuer` (`issue_user_id`),
  KEY `fk_ok_revoker` (`revoke_user_id`),
  KEY `fk_ok_renewer` (`renew_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgkey`
--

LOCK TABLES `orgkey` WRITE;
/*!40000 ALTER TABLE `orgkey` DISABLE KEYS */;
INSERT INTO `orgkey` VALUES (10,1,1,'sha1','2015-08-27 06:24:52',4645,'2015-08-27 00:00:00',90,1,NULL,NULL,NULL,NULL,NULL,'9e452d2b68f6284bf0304b98340fc138');
/*!40000 ALTER TABLE `orgkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregoal`
--

DROP TABLE IF EXISTS `pregoal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregoal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_sequence_id` int(11) NOT NULL COMMENT 'ID of the sequence ',
  `pre_goal_id` int(11) NOT NULL COMMENT 'ID of the goal that is a pre-requisite goal of the sequence',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_seq_goal` (`workflow_sequence_id`,`pre_goal_id`),
  KEY `fk_pg_seqid` (`workflow_sequence_id`),
  KEY `fk_pg_goal` (`pre_goal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='Defines pre-requisite goals that must be completed before th';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregoal`
--

LOCK TABLES `pregoal` WRITE;
/*!40000 ALTER TABLE `pregoal` DISABLE KEYS */;
/*!40000 ALTER TABLE `pregoal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL COMMENT 'ID of the workflow that drives the product creation',
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `project_id` int(11) NOT NULL COMMENT 'ID of the project the product belongs to',
  `access_matrix_id` int(11) DEFAULT NULL,
  `product_config_id` int(11) NOT NULL COMMENT 'ID of the product config, either journal_config or survey_config, depending on the content_type',
  `content_type` tinyint(4) NOT NULL COMMENT '0 - survey\n1 - journal',
  `mode` tinyint(4) NOT NULL DEFAULT '3' COMMENT '1 = config;\n2 = test;\n3 = prod;',
  `report_url` varchar(255) DEFAULT NULL,
  `analytics_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_prod_proj` (`project_id`),
  KEY `fk_prod_matrix` (`access_matrix_id`),
  KEY `fk_prod_wfd` (`workflow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of the project',
  `organization_id` int(11) NOT NULL DEFAULT '1' COMMENT 'ID of the organization the project belongs to',
  `code_name` varchar(100) NOT NULL COMMENT 'Code name of the project',
  `description` varchar(255) NOT NULL,
  `owner_user_id` int(11) NOT NULL COMMENT 'Project owner''s uid',
  `creation_time` datetime DEFAULT NULL COMMENT 'When the project was created',
  `access_matrix_id` int(11) NOT NULL COMMENT 'Project-level default access matrix',
  `view_matrix_id` int(11) NOT NULL COMMENT 'ID of the view matrix for this project',
  `start_time` date NOT NULL COMMENT 'When the project is to be opened',
  `study_period_id` int(11) NOT NULL COMMENT 'ID of the study period specification',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Status of the project\n\n0 - waiting\n1 - in-flight\n2 - completed\n3 - suspended\n4 - abandoned\n',
  `logo_path` varchar(255) DEFAULT NULL COMMENT 'File path to the project''s logo',
  `msgboard_id` int(11) DEFAULT NULL COMMENT 'ID of the msgboard for project-level discussions: the project wall',
  `admin_user_id` int(11) NOT NULL COMMENT 'UID of the project admin',
  `sponsor_logos` varchar(256) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'whether the project is active',
  `close_time` date DEFAULT NULL COMMENT 'When the project is expected to be closed',
  `visibility` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Visibility type of the project. \n\n1 = public; \n2 = private;',
  `import_id` int(11) DEFAULT NULL,
  `report_url` varchar(255) DEFAULT NULL,
  `analytics_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_name_UNIQUE` (`code_name`),
  KEY `fk_project_user1` (`owner_user_id`),
  KEY `fk_project_table11` (`access_matrix_id`),
  KEY `fk_project_study_period1` (`study_period_id`),
  KEY `fk_project_view_matrix1` (`view_matrix_id`),
  KEY `fk_project_messageboard1` (`msgboard_id`),
  KEY `fk_project_admin` (`admin_user_id`),
  KEY `fk_project_org` (`organization_id`),
  KEY `fk_project_import` (`import_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='Definition of project';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,1,'Integrity 2010','World Anti-Corruption Study',1,NULL,1,1,'2010-06-01',1,1,NULL,7,1,NULL,1,'2010-12-31',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_admin`
--

DROP TABLE IF EXISTS `project_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_pauser` (`project_id`,`user_id`),
  KEY `fk_pa_proj` (`project_id`),
  KEY `fk_pa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_admin`
--

LOCK TABLES `project_admin` WRITE;
/*!40000 ALTER TABLE `project_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_contact`
--

DROP TABLE IF EXISTS `project_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL COMMENT 'ID of the project',
  `user_id` int(11) NOT NULL COMMENT 'UID of the user who will be a contact person in the project',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_fc` (`project_id`,`user_id`),
  KEY `fk_project_contact_project1` (`project_id`),
  KEY `fk_project_contact_user1` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='This table stores users who are to be the contact people of ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_contact`
--

LOCK TABLES `project_contact` WRITE;
/*!40000 ALTER TABLE `project_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_membership`
--

DROP TABLE IF EXISTS `project_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'UID of the user who is included into a project',
  `role_id` int(11) NOT NULL COMMENT 'ID of the role the user takes in the project',
  `project_id` int(11) NOT NULL COMMENT 'ID of the project',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_pu` (`user_id`,`project_id`),
  KEY `fk_project_membership_user1` (`user_id`),
  KEY `fk_project_membership_project_roles1` (`role_id`),
  KEY `fk_pm_project` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4134 DEFAULT CHARSET=utf8 COMMENT='Defines user membership in a project. User can be a member o';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_membership`
--

LOCK TABLES `project_membership` WRITE;
/*!40000 ALTER TABLE `project_membership` DISABLE KEYS */;
INSERT INTO `project_membership` VALUES (4133,4645,58,1);
/*!40000 ALTER TABLE `project_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_notif`
--

DROP TABLE IF EXISTS `project_notif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_notif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `notification_type_id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `subject_text` text,
  `body_text` text,
  `name` varchar(45) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `fk_pn_proj` (`project_id`),
  KEY `fk_pn_notif` (`notification_type_id`),
  KEY `fk_pn_lang` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_notif`
--

LOCK TABLES `project_notif` WRITE;
/*!40000 ALTER TABLE `project_notif` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_notif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_notif_role`
--

DROP TABLE IF EXISTS `project_notif_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_notif_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `project_notif_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_pnr` (`role_id`,`project_notif_id`),
  KEY `fk_pnr_notif` (`project_notif_id`),
  KEY `fk_pnr_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_notif_role`
--

LOCK TABLES `project_notif_role` WRITE;
/*!40000 ALTER TABLE `project_notif_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_notif_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_owner`
--

DROP TABLE IF EXISTS `project_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_owner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_po_projorg` (`project_id`,`org_id`),
  KEY `fk_po_project` (`project_id`),
  KEY `fk_po_org` (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_owner`
--

LOCK TABLES `project_owner` WRITE;
/*!40000 ALTER TABLE `project_owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_roles`
--

DROP TABLE IF EXISTS `project_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL COMMENT 'ID of the project',
  `role_id` int(11) NOT NULL COMMENT 'ID of the role to be included into this project',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_proj_role` (`role_id`,`project_id`),
  KEY `fk_project_roles_role1` (`role_id`),
  KEY `fk_project_roles_project1` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=utf8 COMMENT='Which roles apply to this project. The system could define m';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_roles`
--

LOCK TABLES `project_roles` WRITE;
/*!40000 ALTER TABLE `project_roles` DISABLE KEYS */;
INSERT INTO `project_roles` VALUES (355,1,58);
/*!40000 ALTER TABLE `project_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_target`
--

DROP TABLE IF EXISTS `project_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL COMMENT 'ID of the project',
  `target_id` int(11) NOT NULL COMMENT 'ID of the target to be included into the project',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_pt` (`project_id`,`target_id`),
  KEY `fk_project` (`project_id`),
  KEY `fk_target` (`target_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4221 DEFAULT CHARSET=utf8 COMMENT='The system could define many targets, but only a subset of t';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_target`
--

LOCK TABLES `project_target` WRITE;
/*!40000 ALTER TABLE `project_target` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference`
--

DROP TABLE IF EXISTS `reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `choice_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - no choice\n1 - single choice\n2 - multi choice',
  `classification` int(11) DEFAULT '0' COMMENT '0 = practice;\n1 = legal;',
  `import_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_ref_import` (`import_id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8 COMMENT='predefined to be used to provide standardized Reference requ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference`
--

LOCK TABLES `reference` WRITE;
/*!40000 ALTER TABLE `reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference_choice`
--

DROP TABLE IF EXISTS `reference_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_id` int(11) NOT NULL,
  `label` text NOT NULL COMMENT 'Text to be displayed to the user',
  `weight` int(11) DEFAULT NULL COMMENT 'Display order of the choice',
  `mask` bigint(20) unsigned NOT NULL COMMENT 'Bit mask that represents the choice',
  `sname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rc_ref` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2039 DEFAULT CHARSET=utf8 COMMENT='Choices for reference';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference_choice`
--

LOCK TABLES `reference_choice` WRITE;
/*!40000 ALTER TABLE `reference_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `reference_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference_object`
--

DROP TABLE IF EXISTS `reference_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_id` int(11) NOT NULL,
  `source_description` text NOT NULL,
  `comments` text,
  `choices` bigint(20) unsigned DEFAULT NULL COMMENT 'Bit mask that contains all selected choices',
  PRIMARY KEY (`id`),
  KEY `fk_ro_ref` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=664533 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference_object`
--

LOCK TABLES `reference_object` WRITE;
/*!40000 ALTER TABLE `reference_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `reference_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `right_category`
--

DROP TABLE IF EXISTS `right_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `right_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID of the category',
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Define categories for user rights.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `right_category`
--

LOCK TABLES `right_category` WRITE;
/*!40000 ALTER TABLE `right_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `right_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `right_category_id` int(11) NOT NULL COMMENT 'ID of the category the right belongs to',
  `name` varchar(105) NOT NULL COMMENT 'Unique name of the right',
  `label` varchar(105) NOT NULL COMMENT 'Label is displayed to end users',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_right_category` (`right_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='System function access is controlled by the role-based autho';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique id of the role',
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='This table contains definitions of all roles in the system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (58,'Role 1','Test Role');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT 'Unique name of the rule',
  `rule_type` tinyint(4) DEFAULT NULL,
  `file_name` varchar(216) DEFAULT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `file_name_UNIQUE` (`file_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='This table stores predefined biz rules for either validation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule`
--

LOCK TABLES `rule` WRITE;
/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_contributor`
--

DROP TABLE IF EXISTS `sc_contributor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sc_contributor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_config_id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_scontrib` (`survey_config_id`,`org_id`),
  KEY `fk_scontrib_survey` (`survey_config_id`),
  KEY `fk_scontrib_org` (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_contributor`
--

LOCK TABLES `sc_contributor` WRITE;
/*!40000 ALTER TABLE `sc_contributor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_contributor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_indicator`
--

DROP TABLE IF EXISTS `sc_indicator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sc_indicator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_config_id` int(11) NOT NULL,
  `survey_indicator_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_scicomb` (`survey_config_id`,`survey_indicator_id`),
  KEY `fk_sci_sconf` (`survey_config_id`),
  KEY `fk_sci_ind` (`survey_indicator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4987 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_indicator`
--

LOCK TABLES `sc_indicator` WRITE;
/*!40000 ALTER TABLE `sc_indicator` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_indicator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_object`
--

DROP TABLE IF EXISTS `sequence_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID of the SO',
  `workflow_object_id` int(11) NOT NULL COMMENT 'ID of the WFO that this SO belongs to',
  `workflow_sequence_id` int(11) NOT NULL COMMENT 'The ID of the workflow sequence that this SO is instantiated from',
  `status` tinyint(4) NOT NULL COMMENT '0 - waiting\n1 - started\n2 - done',
  PRIMARY KEY (`id`),
  KEY `fk_sequence_object_workflow_sequence1` (`workflow_sequence_id`),
  KEY `fk_sequence_object_wfi_id` (`workflow_object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17717 DEFAULT CHARSET=utf8 COMMENT='A Sequence Object (SO) is instantiated from workflow sequenc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_object`
--

LOCK TABLES `sequence_object` WRITE;
/*!40000 ALTER TABLE `sequence_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `ticket` varchar(32) NOT NULL COMMENT 'User sessions.',
  `last_updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `ticket_UNIQUE` (`ticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_file`
--

DROP TABLE IF EXISTS `source_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(256) NOT NULL,
  `path` varchar(256) NOT NULL DEFAULT '',
  `extension` varchar(10) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `last_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` varchar(512) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_status` (`status`),
  KEY `idx_filename` (`filename`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_file`
--

LOCK TABLES `source_file` WRITE;
/*!40000 ALTER TABLE `source_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `source_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_file_text_resource`
--

DROP TABLE IF EXISTS `source_file_text_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_file_text_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_file_id` int(11) NOT NULL,
  `text_resource_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_SOURCE_FILE_ID` (`source_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_file_text_resource`
--

LOCK TABLES `source_file_text_resource` WRITE;
/*!40000 ALTER TABLE `source_file_text_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `source_file_text_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spr_component`
--

DROP TABLE IF EXISTS `spr_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spr_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_peer_review_id` int(11) NOT NULL,
  `component_indicator_id` int(11) NOT NULL,
  `answer_object_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_sprcomp` (`survey_peer_review_id`,`component_indicator_id`),
  KEY `fk_sprc_spr` (`survey_peer_review_id`),
  KEY `fk_sprc_compind` (`component_indicator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1626 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spr_component`
--

LOCK TABLES `spr_component` WRITE;
/*!40000 ALTER TABLE `spr_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `spr_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spr_component_version`
--

DROP TABLE IF EXISTS `spr_component_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spr_component_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_peer_review_version_id` int(11) NOT NULL,
  `component_indicator_id` int(11) NOT NULL,
  `answer_object_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_sprcomp` (`survey_peer_review_version_id`,`component_indicator_id`),
  KEY `fk_sprc_spr` (`survey_peer_review_version_id`),
  KEY `fk_sprc_compind` (`component_indicator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spr_component_version`
--

LOCK TABLES `spr_component_version` WRITE;
/*!40000 ALTER TABLE `spr_component_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `spr_component_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_period`
--

DROP TABLE IF EXISTS `study_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Definition of study period';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_period`
--

LOCK TABLES `study_period` WRITE;
/*!40000 ALTER TABLE `study_period` DISABLE KEYS */;
INSERT INTO `study_period` VALUES (14,'Winter 2016','whateves');
/*!40000 ALTER TABLE `study_period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_answer`
--

DROP TABLE IF EXISTS `survey_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_content_object_id` int(11) NOT NULL,
  `survey_question_id` int(11) NOT NULL,
  `answer_object_id` int(11) DEFAULT NULL COMMENT 'ID of the answer object in answer_choice_object, answer_number_object or answer_text_object, depending on answer type',
  `reference_object_id` int(11) DEFAULT NULL,
  `comments` text,
  `answer_time` datetime DEFAULT NULL,
  `answer_user_id` int(11) DEFAULT NULL,
  `internal_msgboard_id` int(11) DEFAULT NULL,
  `staff_author_msgboard_id` int(11) DEFAULT NULL,
  `reviewer_has_problem` tinyint(1) NOT NULL DEFAULT '0',
  `problem_submit_time` datetime DEFAULT NULL COMMENT 'Time at which the problem is last submitted by reviewer',
  `problem_resp_time` datetime DEFAULT NULL COMMENT 'Time at which  the author provided last response',
  `staff_reviewed` tinyint(1) NOT NULL DEFAULT '0',
  `edited` tinyint(1) NOT NULL DEFAULT '0',
  `pr_reviewed` tinyint(1) NOT NULL DEFAULT '0',
  `overall_reviewed` tinyint(1) NOT NULL DEFAULT '0',
  `author_responded` tinyint(1) NOT NULL DEFAULT '0',
  `completed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'whether all components are completed',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_sa_co_qst` (`survey_content_object_id`,`survey_question_id`),
  KEY `fk_sa_co` (`survey_content_object_id`),
  KEY `fk_sa_internal_msgboard` (`internal_msgboard_id`),
  KEY `fk_sa_uid` (`answer_user_id`),
  KEY `fk_sa_question` (`survey_question_id`),
  KEY `fk_sa_sad_msgboard` (`staff_author_msgboard_id`),
  KEY `fk_sa_ref` (`reference_object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1314731 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_answer`
--

LOCK TABLES `survey_answer` WRITE;
/*!40000 ALTER TABLE `survey_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_answer_attachment`
--

DROP TABLE IF EXISTS `survey_answer_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_answer_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_answer_id` int(11) NOT NULL,
  `attachment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_saa_saa` (`survey_answer_id`,`attachment_id`),
  KEY `fk_saa_answer` (`survey_answer_id`),
  KEY `fk_saa_attach` (`attachment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33984 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_answer_attachment`
--

LOCK TABLES `survey_answer_attachment` WRITE;
/*!40000 ALTER TABLE `survey_answer_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_answer_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_answer_attachment_version`
--

DROP TABLE IF EXISTS `survey_answer_attachment_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_answer_attachment_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_answer_version_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `type` varchar(8) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `update_time` datetime DEFAULT NULL COMMENT 'file upload time',
  `user_id` int(11) DEFAULT '0' COMMENT 'user who uploaded the file',
  PRIMARY KEY (`id`),
  KEY `fk_saav_version` (`survey_answer_version_id`),
  KEY `fk_saav_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68984 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_answer_attachment_version`
--

LOCK TABLES `survey_answer_attachment_version` WRITE;
/*!40000 ALTER TABLE `survey_answer_attachment_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_answer_attachment_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_answer_component`
--

DROP TABLE IF EXISTS `survey_answer_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_answer_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_answer_id` int(11) NOT NULL,
  `component_indicator_id` int(11) NOT NULL,
  `answer_object_id` int(11) DEFAULT NULL,
  `answer_time` timestamp NULL DEFAULT NULL,
  `answer_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_sac_answerind` (`survey_answer_id`,`component_indicator_id`),
  KEY `fk_sac_answer` (`survey_answer_id`),
  KEY `fk_sac_indicator` (`component_indicator_id`),
  KEY `fk_sac_user` (`answer_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21336 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_answer_component`
--

LOCK TABLES `survey_answer_component` WRITE;
/*!40000 ALTER TABLE `survey_answer_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_answer_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_answer_component_version`
--

DROP TABLE IF EXISTS `survey_answer_component_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_answer_component_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_answer_version_id` int(11) NOT NULL,
  `component_indicator_id` int(11) NOT NULL,
  `answer_object_id` int(11) DEFAULT NULL,
  `answer_time` timestamp NULL DEFAULT NULL,
  `answer_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_sac_answerind` (`survey_answer_version_id`,`component_indicator_id`),
  KEY `fk_sac_answer` (`survey_answer_version_id`),
  KEY `fk_sac_indicator` (`component_indicator_id`),
  KEY `fk_sac_user` (`answer_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61446 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_answer_component_version`
--

LOCK TABLES `survey_answer_component_version` WRITE;
/*!40000 ALTER TABLE `survey_answer_component_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_answer_component_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_answer_version`
--

DROP TABLE IF EXISTS `survey_answer_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_answer_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_version_id` int(11) NOT NULL,
  `survey_question_id` int(11) NOT NULL,
  `answer_object_id` int(11) NOT NULL,
  `reference_object_id` int(11) NOT NULL,
  `comments` text,
  `answer_time` datetime DEFAULT NULL,
  `answer_user_id` int(11) DEFAULT NULL,
  `internal_msgboard_id` int(11) DEFAULT NULL,
  `staff_author_msgboard_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sav_content_qst` (`content_version_id`,`survey_question_id`),
  KEY `sav_question` (`survey_question_id`),
  KEY `sav_ref` (`reference_object_id`),
  KEY `sav_user` (`answer_user_id`),
  KEY `fk_sav_int_mb` (`internal_msgboard_id`),
  KEY `fk_sav_sa_mb` (`staff_author_msgboard_id`),
  KEY `fk_sav_cv` (`content_version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=388233 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_answer_version`
--

LOCK TABLES `survey_answer_version` WRITE;
/*!40000 ALTER TABLE `survey_answer_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_answer_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_category`
--

DROP TABLE IF EXISTS `survey_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_config_id` int(11) NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(225) NOT NULL,
  `label` varchar(45) NOT NULL COMMENT 'Displayed before the title text',
  `title` text,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sc_parent` (`parent_category_id`),
  KEY `fk_sc_config` (`survey_config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3072 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_category`
--

LOCK TABLES `survey_category` WRITE;
/*!40000 ALTER TABLE `survey_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_config`
--

DROP TABLE IF EXISTS `survey_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Unique name of the config',
  `description` varchar(255) DEFAULT NULL,
  `instructions` text NOT NULL COMMENT 'ID of the text resource used as user instructions',
  `moe_algorithm` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 = GI specific',
  `is_tsc` tinyint(1) DEFAULT '1',
  `creator_org_id` int(11) NOT NULL DEFAULT '1',
  `owner_org_id` int(11) NOT NULL DEFAULT '1',
  `visibility` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 = private;\n2 = public;',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 = active;\n2 = inactive;\n3 = deleted;',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delete_time` timestamp NULL DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `tip_display_method` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_sc_import` (`import_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COMMENT='Each product must have a config for its content type. This t';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_config`
--

LOCK TABLES `survey_config` WRITE;
/*!40000 ALTER TABLE `survey_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_content_object`
--

DROP TABLE IF EXISTS `survey_content_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_content_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of the SCO',
  `content_header_id` int(11) NOT NULL COMMENT 'ID of the content header that keeps common attributes for this SCO.',
  `survey_config_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_header_id_UNIQUE` (`content_header_id`),
  KEY `fk_sco_ch` (`content_header_id`),
  KEY `fk_sco_config` (`survey_config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14177 DEFAULT CHARSET=utf8 COMMENT='This table keeps all created suvey content objects (SCO). A ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_content_object`
--

LOCK TABLES `survey_content_object` WRITE;
/*!40000 ALTER TABLE `survey_content_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_content_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_indicator`
--

DROP TABLE IF EXISTS `survey_indicator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_indicator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `question` text NOT NULL,
  `answer_type` tinyint(4) NOT NULL COMMENT '1 - single choice\n2 - multi choice\n3 - integer\n4 - float\n5 - text\n\n',
  `answer_type_id` int(11) NOT NULL COMMENT 'ID of the type definition in answer_type_choice, answer_type_number, or answer_type_text table',
  `reference_id` int(11) NOT NULL,
  `tip` text COMMENT 'Additional tip text',
  `create_user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `reusable` tinyint(1) DEFAULT NULL,
  `original_indicator_id` int(11) DEFAULT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `creator_org_id` int(11) NOT NULL DEFAULT '1' COMMENT 'Org that created the indicator',
  `owner_org_id` int(11) NOT NULL DEFAULT '1' COMMENT 'Org that owns the indicator',
  `visibility` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 = public;\n2 = private;',
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Only for public indicator:\n\n1 = endorsed;\n2 = extended;\n3 = test;',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 = active;\n2 = inactive;\n3 = deleted;',
  `delete_time` timestamp NULL DEFAULT NULL,
  `delete_user_id` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `parent_indicator_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_survey_indicator_document_type1` (`reference_id`),
  KEY `fk_survey_user` (`create_user_id`),
  KEY `fk_survey_original_ind` (`original_indicator_id`),
  KEY `fk_surveyind_delete_user` (`delete_user_id`),
  KEY `fk_surveyind_language` (`language_id`),
  KEY `fk_surveyind_ownerorg` (`owner_org_id`),
  KEY `fk_surveyind_creatororg` (`creator_org_id`),
  KEY `fk_surveyind_import` (`import_id`),
  KEY `fk_survey_parent_ind` (`parent_indicator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7672 DEFAULT CHARSET=utf8 COMMENT='Survey Element structure defines the header info of the indi';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_indicator`
--

LOCK TABLES `survey_indicator` WRITE;
/*!40000 ALTER TABLE `survey_indicator` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_indicator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_indicator_intl`
--

DROP TABLE IF EXISTS `survey_indicator_intl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_indicator_intl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_indicator_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `tip` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_siintl_indlang` (`survey_indicator_id`,`language_id`),
  KEY `fk_siintl_ind` (`survey_indicator_id`),
  KEY `fk_siintl_lang` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=775 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_indicator_intl`
--

LOCK TABLES `survey_indicator_intl` WRITE;
/*!40000 ALTER TABLE `survey_indicator_intl` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_indicator_intl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_peer_review`
--

DROP TABLE IF EXISTS `survey_peer_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_peer_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_answer_id` int(11) NOT NULL,
  `opinion` tinyint(4) NOT NULL COMMENT '0 - agree\n1 - agree with comments\n2 - disagree\n3 - not qualified',
  `suggested_answer_object_id` int(11) DEFAULT NULL COMMENT 'Referenced table depends answer type: answer_object_choice, number, or text',
  `comments` text,
  `last_change_time` datetime NOT NULL,
  `reviewer_user_id` int(11) NOT NULL COMMENT 'uid who created this review',
  `msgboard_id` int(11) NOT NULL,
  `submit_time` datetime DEFAULT NULL COMMENT 'When the peer review was submitted',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_spr_answer_user` (`survey_answer_id`,`reviewer_user_id`),
  KEY `fk_survey_peer_review_user1` (`reviewer_user_id`),
  KEY `fk_survey_peer_review_messageboard1` (`msgboard_id`),
  KEY `fk_spr_answer` (`survey_answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=228672 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_peer_review`
--

LOCK TABLES `survey_peer_review` WRITE;
/*!40000 ALTER TABLE `survey_peer_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_peer_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_peer_review_version`
--

DROP TABLE IF EXISTS `survey_peer_review_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_peer_review_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_answer_version_id` int(11) NOT NULL,
  `opinion` tinyint(4) NOT NULL,
  `suggested_answer_object_id` int(11) DEFAULT NULL,
  `comments` text,
  `last_change_time` timestamp NULL DEFAULT NULL,
  `reviewer_user_id` int(11) NOT NULL,
  `msgboard_id` int(11) DEFAULT NULL,
  `submit_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_sprv_ansuser` (`survey_answer_version_id`,`reviewer_user_id`),
  KEY `fk_sprv_sav` (`survey_answer_version_id`),
  KEY `fk_sprv_reviewer` (`reviewer_user_id`),
  KEY `fk_sprv_mb` (`msgboard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=252489 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_peer_review_version`
--

LOCK TABLES `survey_peer_review_version` WRITE;
/*!40000 ALTER TABLE `survey_peer_review_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_peer_review_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_question`
--

DROP TABLE IF EXISTS `survey_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `survey_config_id` int(11) NOT NULL,
  `survey_indicator_id` int(11) NOT NULL,
  `survey_category_id` int(11) NOT NULL DEFAULT '0' COMMENT '0 if this element is the root (no parent)',
  `public_name` varchar(45) NOT NULL,
  `default_answer_id` int(11) DEFAULT NULL COMMENT 'The ID of default answer object: answer_choice_object, answer_number_object, or answer_text_object',
  `weight` int(11) DEFAULT NULL COMMENT 'used to determine display order of the element in the survey',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_sce` (`survey_config_id`,`survey_indicator_id`),
  KEY `fk_survey_item_config` (`survey_config_id`),
  KEY `fk_survey_item_indicator` (`survey_indicator_id`),
  KEY `fk_survey_item_category` (`survey_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10891 DEFAULT CHARSET=utf8 COMMENT='associate indicator with survey category\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_question`
--

LOCK TABLES `survey_question` WRITE;
/*!40000 ALTER TABLE `survey_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_question_visit`
--

DROP TABLE IF EXISTS `survey_question_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_question_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `horse_id` int(11) NOT NULL,
  `survey_question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_visit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_sqv` (`horse_id`,`survey_question_id`,`user_id`),
  KEY `fk_sqv_horse` (`horse_id`),
  KEY `fk_sqv_qst` (`survey_question_id`),
  KEY `fk_sqv_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_question_visit`
--

LOCK TABLES `survey_question_visit` WRITE;
/*!40000 ALTER TABLE `survey_question_visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_question_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_type` tinyint(4) NOT NULL COMMENT '0 - user tag\n1 - system tag',
  `tagged_object_type` smallint(6) NOT NULL COMMENT 'Object type',
  `tagged_object_id` int(11) NOT NULL,
  `tagged_object_scope_id` int(11) DEFAULT NULL COMMENT 'ID of the object that defines the scope of the tagged object',
  `tagging_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'user who applied the tag',
  `label` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_tag` (`tagged_object_type`,`tagged_object_id`,`label`),
  KEY `fk_tag_user1` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14633 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target`
--

DROP TABLE IF EXISTS `target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `target_type` tinyint(4) NOT NULL COMMENT '0 - region\nmore to follow',
  `short_name` varchar(45) NOT NULL COMMENT 'Short name of the target. ',
  `guid` varchar(255) DEFAULT NULL COMMENT 'global id of the target. typically a uri.',
  `creator_org_id` int(11) NOT NULL DEFAULT '1',
  `owner_org_id` int(11) NOT NULL DEFAULT '1',
  `visibility` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 = public;\n2 = private;',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 = active;\n2 = inactive;\n3 = deleted;',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delete_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_target_creator` (`creator_org_id`),
  KEY `fk_target_owner` (`owner_org_id`),
  KEY `fk_target_language` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2147 DEFAULT CHARSET=utf8 COMMENT='Unique definition for each country/region';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target`
--

LOCK TABLES `target` WRITE;
/*!40000 ALTER TABLE `target` DISABLE KEYS */;
INSERT INTO `target` VALUES (2146,'USA','US of A',1,'US','USA',1,1,1,1,1,'2015-08-27 05:54:55',NULL);
/*!40000 ALTER TABLE `target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target_tag`
--

DROP TABLE IF EXISTS `target_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `target_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_id` int(11) NOT NULL,
  `ttags_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_tt_tt` (`target_id`,`ttags_id`),
  KEY `fk_tt_target` (`target_id`),
  KEY `fk_tt_ttags` (`ttags_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1057 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_tag`
--

LOCK TABLES `target_tag` WRITE;
/*!40000 ALTER TABLE `target_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `target_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `goal_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `tool_id` int(11) NOT NULL,
  `assignment_method` tinyint(4) NOT NULL COMMENT '1 - manual\n2 - queue\n3 - dynamic',
  `instructions` text NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '-1' COMMENT 'Task type',
  `sticky` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_name_UNIQUE` (`task_name`,`product_id`),
  KEY `fk_task_goal` (`goal_id`),
  KEY `fk_task_tool` (`tool_id`),
  KEY `fk_task_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=938 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_assignment`
--

DROP TABLE IF EXISTS `task_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `assigned_user_id` int(11) NOT NULL,
  `due_time` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - inactive\n1 - active\n2 - aware\n3 - noticed\n4 - started\n5 - done',
  `start_time` datetime DEFAULT NULL,
  `completion_time` datetime DEFAULT NULL,
  `event_log_id` int(11) DEFAULT NULL,
  `q_enter_time` datetime DEFAULT NULL,
  `q_last_assigned_time` datetime DEFAULT NULL,
  `q_last_assigned_uid` int(11) DEFAULT NULL,
  `q_last_return_time` datetime DEFAULT NULL,
  `q_priority` tinyint(4) DEFAULT NULL COMMENT '1 - low\n2 - medium\n3 - high',
  `data` text COMMENT 'Used by app to stored any app-processing data',
  `goal_object_id` int(11) DEFAULT NULL COMMENT 'Used by app to remember id of the goal object that the assignment belongs to',
  `percent` float DEFAULT '-1' COMMENT 'Percent of completion',
  `horse_id` int(11) NOT NULL,
  `exit_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 = normal;\n1 = forced exit;',
  `status_data` text,
  PRIMARY KEY (`id`),
  KEY `fk_ta_task` (`task_id`),
  KEY `fk_ta_target` (`target_id`),
  KEY `fk_ta_assigned` (`assigned_user_id`),
  KEY `fk_ta_event_log` (`event_log_id`),
  KEY `fk_ta_goal_object` (`goal_object_id`),
  KEY `fk_ta_horse` (`horse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46667 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_assignment`
--

LOCK TABLES `task_assignment` WRITE;
/*!40000 ALTER TABLE `task_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_role`
--

DROP TABLE IF EXISTS `task_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `can_claim` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_tr` (`task_id`,`role_id`),
  KEY `fk_task_role_task` (`task_id`),
  KEY `fk_task_role_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1447 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_role`
--

LOCK TABLES `task_role` WRITE;
/*!40000 ALTER TABLE `task_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasksub`
--

DROP TABLE IF EXISTS `tasksub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasksub` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL COMMENT 'whether to notify the user of new event of the task',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_tasksub` (`user_id`,`task_id`),
  KEY `fk_tasksub_user` (`user_id`),
  KEY `fk_tasksub_task` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasksub`
--

LOCK TABLES `tasksub` WRITE;
/*!40000 ALTER TABLE `tasksub` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasksub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `team_name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_pid_name` (`project_id`,`team_name`),
  KEY `fk_team_project1` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_user`
--

DROP TABLE IF EXISTS `team_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_tu` (`user_id`,`team_id`),
  KEY `fk_team_user_user1` (`user_id`),
  KEY `fk_team_user_team1` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_user`
--

LOCK TABLES `team_user` WRITE;
/*!40000 ALTER TABLE `team_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_item`
--

DROP TABLE IF EXISTS `text_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text_resource_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_rlc` (`text_resource_id`,`language_id`),
  KEY `fk_ti_lang` (`language_id`),
  KEY `fk_ti_resource` (`text_resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2191114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_item`
--

LOCK TABLES `text_item` WRITE;
/*!40000 ALTER TABLE `text_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `text_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_resource`
--

DROP TABLE IF EXISTS `text_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resource_name_UNIQUE` (`resource_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2190025 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_resource`
--

LOCK TABLES `text_resource` WRITE;
/*!40000 ALTER TABLE `text_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `text_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='Tokens defined in this table is only for display to end user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokenset`
--

DROP TABLE IF EXISTS `tokenset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokenset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catgeory` int(11) NOT NULL,
  `tokens` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokenset`
--

LOCK TABLES `tokenset` WRITE;
/*!40000 ALTER TABLE `tokenset` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokenset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool`
--

DROP TABLE IF EXISTS `tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT 'Technical name used by system code',
  `label` varchar(45) NOT NULL COMMENT 'Label is displayed to end users',
  `description` varchar(255) DEFAULT NULL,
  `access_matrix_id` int(11) DEFAULT NULL COMMENT 'ID of the access matrix that configures the tool',
  `action` varchar(32) DEFAULT NULL,
  `task_type` tinyint(4) NOT NULL,
  `bsc_compatible` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'whether the tool is BSC compatible',
  `multi_user` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'whether the tool supports multiple users working on the task at the same time',
  `purpose` text COMMENT 'text explaining the purpose of the tool',
  `inactive_reason` text COMMENT 'text explaining why the task cannot be submitted',
  `content_types` int(11) NOT NULL DEFAULT '0' COMMENT 'supported content types. Bitmask of:\n1 - survey\n2 - journal',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_tool_config_matrix` (`access_matrix_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool`
--

LOCK TABLES `tool` WRITE;
/*!40000 ALTER TABLE `tool` DISABLE KEYS */;
/*!40000 ALTER TABLE `tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ttags`
--

DROP TABLE IF EXISTS `ttags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ttags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term_UNIQUE` (`term`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='Predefined target tags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ttags`
--

LOCK TABLES `ttags` WRITE;
/*!40000 ALTER TABLE `ttags` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file`
--

DROP TABLE IF EXISTS `upload_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `size` int(11) NOT NULL DEFAULT '0',
  `type` varchar(8) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_file_name` (`file_name`),
  KEY `fk_upload_file_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file`
--

LOCK TABLES `upload_file` WRITE;
/*!40000 ALTER TABLE `upload_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(20) NOT NULL COMMENT 'clear text password for easy management',
  `last_password_change_time` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `last_logout_time` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'account status.\n0 - inactive\n1 - active\n2 - deleted',
  `timezone` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `msgboard_id` int(11) DEFAULT NULL,
  `forward_inbox_msg` tinyint(1) DEFAULT '1',
  `number_msgs_per_screen` int(11) DEFAULT '10',
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `cell_phone` varchar(45) DEFAULT NULL,
  `address` text,
  `bio` text,
  `photo` varchar(255) DEFAULT NULL COMMENT 'file path of user''s photo',
  `location` varchar(255) DEFAULT NULL COMMENT 'List of role IDs to whom the profile is visible. ',
  `email_detail_level` tinyint(4) DEFAULT '1' COMMENT '0 - Alert only\n1 - Full message',
  `default_project_id` int(11) DEFAULT '-1',
  `last_login_time` datetime DEFAULT NULL,
  `site_admin` tinyint(4) DEFAULT '0',
  `organization_id` int(11) NOT NULL DEFAULT '1' COMMENT 'The organization the user belongs to',
  `privacy_policy_accept_time` timestamp NULL DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_user_language` (`language_id`),
  KEY `fk_user_messageboard` (`msgboard_id`),
  KEY `fk_user_org` (`organization_id`),
  KEY `fk_user_import` (`import_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4646 DEFAULT CHARSET=utf8 COMMENT='The user account structure';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin@gi.org','test',NULL,'2010-06-10 14:40:18','2015-08-27 18:12:08',1,0,1,4,1,10,'Adam','Boss','123-456-7890','123-456-7890',NULL,'I am the system admin.',NULL,'123 Kellie Jean Ct, Great Falls, VA 22066',1,1,'2015-08-27 18:11:32',1,1,NULL,0),(4645,'dmitry','dmitry@amida-tech.com','test',NULL,'2015-08-27 04:32:15',NULL,1,-5,0,0,1,10,'Dmitry','Kachaev',NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2015-08-27 19:49:56',1,1,NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userfinder`
--

DROP TABLE IF EXISTS `userfinder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userfinder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `assigned_user_id` int(11) NOT NULL,
  `case_subject` text NOT NULL,
  `case_body` text NOT NULL,
  `case_priority` tinyint(4) NOT NULL,
  `attach_user` tinyint(1) NOT NULL,
  `attach_content` tinyint(1) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1 = active;\n2 = inactive;\n3 = deleted;',
  `create_time` datetime NOT NULL,
  `last_update_time` datetime NOT NULL,
  `delete_time` datetime DEFAULT NULL,
  `product_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_uf_projrole` (`project_id`,`role_id`,`product_id`),
  KEY `fk_uf_project` (`project_id`),
  KEY `fk_uf_role` (`role_id`),
  KEY `fk_uf_assigned` (`assigned_user_id`),
  KEY `fk_uf_prod` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='This table contains userfinder triggers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userfinder`
--

LOCK TABLES `userfinder` WRITE;
/*!40000 ALTER TABLE `userfinder` DISABLE KEYS */;
/*!40000 ALTER TABLE `userfinder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userfinder_event`
--

DROP TABLE IF EXISTS `userfinder_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userfinder_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userfinder_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'User who has completed all assignments',
  `cases_id` int(11) NOT NULL COMMENT 'Case that was opened',
  `exe_time` datetime NOT NULL COMMENT 'when the even was fired',
  PRIMARY KEY (`id`),
  KEY `fk_ufe_uf` (`userfinder_id`),
  KEY `fk_ufe_user` (`user_id`),
  KEY `fk_ufe_case` (`cases_id`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8 COMMENT='This table keeps fired userfinder events';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userfinder_event`
--

LOCK TABLES `userfinder_event` WRITE;
/*!40000 ALTER TABLE `userfinder_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `userfinder_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_matrix`
--

DROP TABLE IF EXISTS `view_matrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `default_value` tinyint(4) NOT NULL COMMENT '0 - none\n1 - limited\n2 - full',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='Controls what roles can see what other roles'' profile';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_matrix`
--

LOCK TABLES `view_matrix` WRITE;
/*!40000 ALTER TABLE `view_matrix` DISABLE KEYS */;
INSERT INTO `view_matrix` VALUES (41,'User Privacy','description',3);
/*!40000 ALTER TABLE `view_matrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_permission`
--

DROP TABLE IF EXISTS `view_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `view_matrix_id` int(11) NOT NULL,
  `subject_role_id` int(11) NOT NULL,
  `target_role_id` int(11) NOT NULL,
  `permission` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - none\n1 - limited\n2 - full',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_vst` (`view_matrix_id`,`subject_role_id`,`target_role_id`),
  KEY `fk_view_permission_view_matrix1` (`view_matrix_id`),
  KEY `fk_view_permission_role1` (`subject_role_id`),
  KEY `fk_view_permission_role2` (`target_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2376 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_permission`
--

LOCK TABLES `view_permission` WRITE;
/*!40000 ALTER TABLE `view_permission` DISABLE KEYS */;
INSERT INTO `view_permission` VALUES (2375,41,58,58,3);
/*!40000 ALTER TABLE `view_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow`
--

DROP TABLE IF EXISTS `workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_time` datetime NOT NULL,
  `created_by_user_id` int(11) NOT NULL,
  `total_duration` int(11) DEFAULT NULL COMMENT 'Total length (number of days) for the workflow to complete ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_workflow_user1` (`created_by_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='Structure of workflow definition';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow`
--

LOCK TABLES `workflow` WRITE;
/*!40000 ALTER TABLE `workflow` DISABLE KEYS */;
INSERT INTO `workflow` VALUES (78,'Test Workflow','Some test workflow','2015-08-27 04:34:16',1,NULL);
/*!40000 ALTER TABLE `workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_object`
--

DROP TABLE IF EXISTS `workflow_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '1 - initial\n2 - running\n3 - completed\n4 - stopped\n5 - cancelled',
  `orig_status` int(11) DEFAULT '0' COMMENT 'the status before the horse is cancelled. Only meaningful if the status is 5.',
  `is_cancelled` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_wfi_workflow` (`workflow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_object`
--

LOCK TABLES `workflow_object` WRITE;
/*!40000 ALTER TABLE `workflow_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_sequence`
--

DROP TABLE IF EXISTS `workflow_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_sequence` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'sequence starts from 1 for each workflow',
  `workflow_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_workflow_sequence_workflow1` (`workflow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COMMENT='each workflow can have multiple sequence';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_sequence`
--

LOCK TABLES `workflow_sequence` WRITE;
/*!40000 ALTER TABLE `workflow_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_sequence` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-02 18:51:43
