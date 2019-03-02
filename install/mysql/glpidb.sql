-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: glpidb
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `glpi_alerts`
--

DROP TABLE IF EXISTS `glpi_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT 'see define.php ALERT_* constant',
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`type`),
  KEY `type` (`type`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_alerts`
--

LOCK TABLES `glpi_alerts` WRITE;
/*!40000 ALTER TABLE `glpi_alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_apiclients`
--

DROP TABLE IF EXISTS `glpi_apiclients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_apiclients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `ipv4_range_start` bigint(20) DEFAULT NULL,
  `ipv4_range_end` bigint(20) DEFAULT NULL,
  `ipv6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_token_date` datetime DEFAULT NULL,
  `dolog_method` tinyint(4) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_apiclients`
--

LOCK TABLES `glpi_apiclients` WRITE;
/*!40000 ALTER TABLE `glpi_apiclients` DISABLE KEYS */;
INSERT INTO `glpi_apiclients` VALUES (1,0,1,'full access from localhost',NULL,1,2130706433,2130706433,'::1','',NULL,0,NULL);
/*!40000 ALTER TABLE `glpi_apiclients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_authldapreplicates`
--

DROP TABLE IF EXISTS `glpi_authldapreplicates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_authldapreplicates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authldaps_id` int(11) NOT NULL DEFAULT '0',
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` int(11) NOT NULL DEFAULT '389',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `authldaps_id` (`authldaps_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_authldapreplicates`
--

LOCK TABLES `glpi_authldapreplicates` WRITE;
/*!40000 ALTER TABLE `glpi_authldapreplicates` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_authldapreplicates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_authldaps`
--

DROP TABLE IF EXISTS `glpi_authldaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_authldaps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `basedn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rootdn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` int(11) NOT NULL DEFAULT '389',
  `condition` text COLLATE utf8_unicode_ci,
  `login_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'uid',
  `sync_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_tls` tinyint(1) NOT NULL DEFAULT '0',
  `group_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_condition` text COLLATE utf8_unicode_ci,
  `group_search_type` int(11) NOT NULL DEFAULT '0',
  `group_member_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email1_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realname_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_dn` tinyint(1) NOT NULL DEFAULT '1',
  `time_offset` int(11) NOT NULL DEFAULT '0' COMMENT 'in seconds',
  `deref_option` int(11) NOT NULL DEFAULT '0',
  `title_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_condition` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `rootdn_passwd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_number_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email2_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email3_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email4_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `responsible_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pagesize` int(11) NOT NULL DEFAULT '0',
  `ldap_maxlimit` int(11) NOT NULL DEFAULT '0',
  `can_support_pagesize` tinyint(1) NOT NULL DEFAULT '0',
  `picture_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `inventory_domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `is_default` (`is_default`),
  KEY `is_active` (`is_active`),
  KEY `date_creation` (`date_creation`),
  KEY `sync_field` (`sync_field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_authldaps`
--

LOCK TABLES `glpi_authldaps` WRITE;
/*!40000 ALTER TABLE `glpi_authldaps` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_authldaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_authmails`
--

DROP TABLE IF EXISTS `glpi_authmails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_authmails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connect_string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_authmails`
--

LOCK TABLES `glpi_authmails` WRITE;
/*!40000 ALTER TABLE `glpi_authmails` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_authmails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_autoupdatesystems`
--

DROP TABLE IF EXISTS `glpi_autoupdatesystems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_autoupdatesystems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_autoupdatesystems`
--

LOCK TABLES `glpi_autoupdatesystems` WRITE;
/*!40000 ALTER TABLE `glpi_autoupdatesystems` DISABLE KEYS */;
INSERT INTO `glpi_autoupdatesystems` VALUES (1,'192.168.10.11/apt','');
/*!40000 ALTER TABLE `glpi_autoupdatesystems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_blacklistedmailcontents`
--

DROP TABLE IF EXISTS `glpi_blacklistedmailcontents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_blacklistedmailcontents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_blacklistedmailcontents`
--

LOCK TABLES `glpi_blacklistedmailcontents` WRITE;
/*!40000 ALTER TABLE `glpi_blacklistedmailcontents` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_blacklistedmailcontents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_blacklists`
--

DROP TABLE IF EXISTS `glpi_blacklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_blacklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_blacklists`
--

LOCK TABLES `glpi_blacklists` WRITE;
/*!40000 ALTER TABLE `glpi_blacklists` DISABLE KEYS */;
INSERT INTO `glpi_blacklists` VALUES (1,1,'empty IP','',NULL,NULL,NULL),(2,1,'localhost','127.0.0.1',NULL,NULL,NULL),(3,1,'zero IP','0.0.0.0',NULL,NULL,NULL),(4,2,'empty MAC','',NULL,NULL,NULL);
/*!40000 ALTER TABLE `glpi_blacklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_budgets`
--

DROP TABLE IF EXISTS `glpi_budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_budgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `value` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `budgettypes_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `entities_id` (`entities_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `is_template` (`is_template`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `locations_id` (`locations_id`),
  KEY `budgettypes_id` (`budgettypes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_budgets`
--

LOCK TABLES `glpi_budgets` WRITE;
/*!40000 ALTER TABLE `glpi_budgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_budgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_budgettypes`
--

DROP TABLE IF EXISTS `glpi_budgettypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_budgettypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_budgettypes`
--

LOCK TABLES `glpi_budgettypes` WRITE;
/*!40000 ALTER TABLE `glpi_budgettypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_budgettypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_businesscriticities`
--

DROP TABLE IF EXISTS `glpi_businesscriticities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_businesscriticities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `businesscriticities_id` int(11) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`businesscriticities_id`,`name`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_businesscriticities`
--

LOCK TABLES `glpi_businesscriticities` WRITE;
/*!40000 ALTER TABLE `glpi_businesscriticities` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_businesscriticities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_calendars`
--

DROP TABLE IF EXISTS `glpi_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_calendars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `cache_duration` text COLLATE utf8_unicode_ci,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_calendars`
--

LOCK TABLES `glpi_calendars` WRITE;
/*!40000 ALTER TABLE `glpi_calendars` DISABLE KEYS */;
INSERT INTO `glpi_calendars` VALUES (1,'Default',0,1,'Default calendar',NULL,'[0,43200,43200,43200,43200,43200,0]',NULL);
/*!40000 ALTER TABLE `glpi_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_calendars_holidays`
--

DROP TABLE IF EXISTS `glpi_calendars_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_calendars_holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendars_id` int(11) NOT NULL DEFAULT '0',
  `holidays_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`calendars_id`,`holidays_id`),
  KEY `holidays_id` (`holidays_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_calendars_holidays`
--

LOCK TABLES `glpi_calendars_holidays` WRITE;
/*!40000 ALTER TABLE `glpi_calendars_holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_calendars_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_calendarsegments`
--

DROP TABLE IF EXISTS `glpi_calendarsegments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_calendarsegments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendars_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `day` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'numer of the day based on date(w)',
  `begin` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendars_id` (`calendars_id`),
  KEY `day` (`day`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_calendarsegments`
--

LOCK TABLES `glpi_calendarsegments` WRITE;
/*!40000 ALTER TABLE `glpi_calendarsegments` DISABLE KEYS */;
INSERT INTO `glpi_calendarsegments` VALUES (1,1,0,0,1,'08:00:00','20:00:00'),(2,1,0,0,2,'08:00:00','20:00:00'),(3,1,0,0,3,'08:00:00','20:00:00'),(4,1,0,0,4,'08:00:00','20:00:00'),(5,1,0,0,5,'08:00:00','20:00:00');
/*!40000 ALTER TABLE `glpi_calendarsegments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_cartridgeitems`
--

DROP TABLE IF EXISTS `glpi_cartridgeitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_cartridgeitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `cartridgeitemtypes_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `alarm_threshold` int(11) NOT NULL DEFAULT '10',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `cartridgeitemtypes_id` (`cartridgeitemtypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `alarm_threshold` (`alarm_threshold`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_cartridgeitems`
--

LOCK TABLES `glpi_cartridgeitems` WRITE;
/*!40000 ALTER TABLE `glpi_cartridgeitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_cartridgeitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_cartridgeitems_printermodels`
--

DROP TABLE IF EXISTS `glpi_cartridgeitems_printermodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_cartridgeitems_printermodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cartridgeitems_id` int(11) NOT NULL DEFAULT '0',
  `printermodels_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`printermodels_id`,`cartridgeitems_id`),
  KEY `cartridgeitems_id` (`cartridgeitems_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_cartridgeitems_printermodels`
--

LOCK TABLES `glpi_cartridgeitems_printermodels` WRITE;
/*!40000 ALTER TABLE `glpi_cartridgeitems_printermodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_cartridgeitems_printermodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_cartridgeitemtypes`
--

DROP TABLE IF EXISTS `glpi_cartridgeitemtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_cartridgeitemtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_cartridgeitemtypes`
--

LOCK TABLES `glpi_cartridgeitemtypes` WRITE;
/*!40000 ALTER TABLE `glpi_cartridgeitemtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_cartridgeitemtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_cartridges`
--

DROP TABLE IF EXISTS `glpi_cartridges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_cartridges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `cartridgeitems_id` int(11) NOT NULL DEFAULT '0',
  `printers_id` int(11) NOT NULL DEFAULT '0',
  `date_in` date DEFAULT NULL,
  `date_use` date DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `pages` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cartridgeitems_id` (`cartridgeitems_id`),
  KEY `printers_id` (`printers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_cartridges`
--

LOCK TABLES `glpi_cartridges` WRITE;
/*!40000 ALTER TABLE `glpi_cartridges` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_cartridges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_certificates`
--

DROP TABLE IF EXISTS `glpi_certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_certificates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `certificatetypes_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_certificatetypes (id)',
  `dns_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dns_suffix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_users (id)',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_groups (id)',
  `locations_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_locations (id)',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_manufacturers (id)',
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `is_autosign` tinyint(1) NOT NULL DEFAULT '0',
  `date_expiration` date DEFAULT NULL,
  `states_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to states (id)',
  `command` text COLLATE utf8_unicode_ci,
  `certificate_request` text COLLATE utf8_unicode_ci,
  `certificate_item` text COLLATE utf8_unicode_ci,
  `date_creation` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_template` (`is_template`),
  KEY `is_deleted` (`is_deleted`),
  KEY `certificatetypes_id` (`certificatetypes_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `states_id` (`states_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_certificates`
--

LOCK TABLES `glpi_certificates` WRITE;
/*!40000 ALTER TABLE `glpi_certificates` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_certificates_items`
--

DROP TABLE IF EXISTS `glpi_certificates_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_certificates_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `certificates_id` int(11) NOT NULL DEFAULT '0',
  `items_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to various tables, according to itemtype (id)',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'see .class.php file',
  `date_creation` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`certificates_id`,`itemtype`,`items_id`),
  KEY `device` (`items_id`,`itemtype`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_certificates_items`
--

LOCK TABLES `glpi_certificates_items` WRITE;
/*!40000 ALTER TABLE `glpi_certificates_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_certificates_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_certificatetypes`
--

DROP TABLE IF EXISTS `glpi_certificatetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_certificatetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_creation` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_certificatetypes`
--

LOCK TABLES `glpi_certificatetypes` WRITE;
/*!40000 ALTER TABLE `glpi_certificatetypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_certificatetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changecosts`
--

DROP TABLE IF EXISTS `glpi_changecosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changecosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changes_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `cost_time` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_material` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `budgets_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `changes_id` (`changes_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changecosts`
--

LOCK TABLES `glpi_changecosts` WRITE;
/*!40000 ALTER TABLE `glpi_changecosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_changecosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changes`
--

DROP TABLE IF EXISTS `glpi_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `content` longtext COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `solvedate` datetime DEFAULT NULL,
  `closedate` datetime DEFAULT NULL,
  `time_to_resolve` datetime DEFAULT NULL,
  `users_id_recipient` int(11) NOT NULL DEFAULT '0',
  `users_id_lastupdater` int(11) NOT NULL DEFAULT '0',
  `urgency` int(11) NOT NULL DEFAULT '1',
  `impact` int(11) NOT NULL DEFAULT '1',
  `priority` int(11) NOT NULL DEFAULT '1',
  `itilcategories_id` int(11) NOT NULL DEFAULT '0',
  `impactcontent` longtext COLLATE utf8_unicode_ci,
  `controlistcontent` longtext COLLATE utf8_unicode_ci,
  `rolloutplancontent` longtext COLLATE utf8_unicode_ci,
  `backoutplancontent` longtext COLLATE utf8_unicode_ci,
  `checklistcontent` longtext COLLATE utf8_unicode_ci,
  `global_validation` int(11) NOT NULL DEFAULT '1',
  `validation_percent` int(11) NOT NULL DEFAULT '0',
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `begin_waiting_date` datetime DEFAULT NULL,
  `waiting_duration` int(11) NOT NULL DEFAULT '0',
  `close_delay_stat` int(11) NOT NULL DEFAULT '0',
  `solve_delay_stat` int(11) NOT NULL DEFAULT '0',
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date` (`date`),
  KEY `closedate` (`closedate`),
  KEY `status` (`status`),
  KEY `priority` (`priority`),
  KEY `date_mod` (`date_mod`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `users_id_recipient` (`users_id_recipient`),
  KEY `solvedate` (`solvedate`),
  KEY `urgency` (`urgency`),
  KEY `impact` (`impact`),
  KEY `time_to_resolve` (`time_to_resolve`),
  KEY `global_validation` (`global_validation`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changes`
--

LOCK TABLES `glpi_changes` WRITE;
/*!40000 ALTER TABLE `glpi_changes` DISABLE KEYS */;
INSERT INTO `glpi_changes` VALUES (1,'Перенести сервер 34',0,0,0,1,'Перенести сервер 34 из шк1 в шк2','2019-02-12 06:38:30','2019-02-12 06:19:00',NULL,NULL,NULL,4,4,3,3,3,0,NULL,NULL,NULL,NULL,NULL,1,50,0,NULL,0,0,0,'2019-02-12 06:21:04'),(2,'Изменить / Перенести',0,0,0,1,'&lt;h1&gt;Форма данных&lt;/h1&gt;&lt;h2&gt;Тип подключения&lt;/h2&gt;&lt;div&gt;&lt;b&gt;1) Полоса пропускания : &lt;/b&gt;&nbsp;&lt;/div&gt;&lt;div&gt;&lt;b&gt;2) СПД ЦОД : &lt;/b&gt;MDA1.1-EX4200-1&lt;/div&gt;&lt;div&gt;&lt;b&gt;3) Тип подключения : &lt;/b&gt;&nbsp;&lt;/div&gt;&lt;div&gt;&lt;b&gt;4) Порт : &lt;/b&gt;0/0/0, 0/0/8&lt;/div&gt;','2019-02-13 05:12:26','2019-02-13 05:12:26',NULL,NULL,NULL,4,4,3,3,3,0,'','','','','',1,0,0,NULL,0,0,0,'2019-02-13 05:12:26');
/*!40000 ALTER TABLE `glpi_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changes_groups`
--

DROP TABLE IF EXISTS `glpi_changes_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changes_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changes_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`type`,`groups_id`),
  KEY `group` (`groups_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changes_groups`
--

LOCK TABLES `glpi_changes_groups` WRITE;
/*!40000 ALTER TABLE `glpi_changes_groups` DISABLE KEYS */;
INSERT INTO `glpi_changes_groups` VALUES (1,1,2,2),(2,1,2,3);
/*!40000 ALTER TABLE `glpi_changes_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changes_items`
--

DROP TABLE IF EXISTS `glpi_changes_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changes_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changes_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changes_items`
--

LOCK TABLES `glpi_changes_items` WRITE;
/*!40000 ALTER TABLE `glpi_changes_items` DISABLE KEYS */;
INSERT INTO `glpi_changes_items` VALUES (1,2,'PluginFormcreatorFormAnswer',2);
/*!40000 ALTER TABLE `glpi_changes_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changes_problems`
--

DROP TABLE IF EXISTS `glpi_changes_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changes_problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changes_id` int(11) NOT NULL DEFAULT '0',
  `problems_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`problems_id`),
  KEY `problems_id` (`problems_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changes_problems`
--

LOCK TABLES `glpi_changes_problems` WRITE;
/*!40000 ALTER TABLE `glpi_changes_problems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_changes_problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changes_suppliers`
--

DROP TABLE IF EXISTS `glpi_changes_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changes_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changes_id` int(11) NOT NULL DEFAULT '0',
  `suppliers_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `use_notification` tinyint(1) NOT NULL DEFAULT '0',
  `alternative_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`type`,`suppliers_id`),
  KEY `group` (`suppliers_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changes_suppliers`
--

LOCK TABLES `glpi_changes_suppliers` WRITE;
/*!40000 ALTER TABLE `glpi_changes_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_changes_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changes_tickets`
--

DROP TABLE IF EXISTS `glpi_changes_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changes_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changes_id` int(11) NOT NULL DEFAULT '0',
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`tickets_id`),
  KEY `tickets_id` (`tickets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changes_tickets`
--

LOCK TABLES `glpi_changes_tickets` WRITE;
/*!40000 ALTER TABLE `glpi_changes_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_changes_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changes_users`
--

DROP TABLE IF EXISTS `glpi_changes_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changes_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changes_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `use_notification` tinyint(1) NOT NULL DEFAULT '0',
  `alternative_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`type`,`users_id`,`alternative_email`),
  KEY `user` (`users_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changes_users`
--

LOCK TABLES `glpi_changes_users` WRITE;
/*!40000 ALTER TABLE `glpi_changes_users` DISABLE KEYS */;
INSERT INTO `glpi_changes_users` VALUES (1,1,4,1,0,''),(2,2,4,1,1,'');
/*!40000 ALTER TABLE `glpi_changes_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changetasks`
--

DROP TABLE IF EXISTS `glpi_changetasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changetasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changes_id` int(11) NOT NULL DEFAULT '0',
  `taskcategories_id` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `begin` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `users_id_editor` int(11) NOT NULL DEFAULT '0',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tasktemplates_id` int(11) NOT NULL DEFAULT '0',
  `timeline_position` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `changes_id` (`changes_id`),
  KEY `state` (`state`),
  KEY `users_id` (`users_id`),
  KEY `users_id_editor` (`users_id_editor`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `tasktemplates_id` (`tasktemplates_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changetasks`
--

LOCK TABLES `glpi_changetasks` WRITE;
/*!40000 ALTER TABLE `glpi_changetasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_changetasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changevalidations`
--

DROP TABLE IF EXISTS `glpi_changevalidations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changevalidations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `changes_id` int(11) NOT NULL DEFAULT '0',
  `users_id_validate` int(11) NOT NULL DEFAULT '0',
  `comment_submission` text COLLATE utf8_unicode_ci,
  `comment_validation` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '2',
  `submission_date` datetime DEFAULT NULL,
  `validation_date` datetime DEFAULT NULL,
  `timeline_position` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `users_id` (`users_id`),
  KEY `users_id_validate` (`users_id_validate`),
  KEY `changes_id` (`changes_id`),
  KEY `submission_date` (`submission_date`),
  KEY `validation_date` (`validation_date`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changevalidations`
--

LOCK TABLES `glpi_changevalidations` WRITE;
/*!40000 ALTER TABLE `glpi_changevalidations` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_changevalidations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_computerantiviruses`
--

DROP TABLE IF EXISTS `glpi_computerantiviruses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_computerantiviruses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `antivirus_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `signature_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_uptodate` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `date_expiration` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `antivirus_version` (`antivirus_version`),
  KEY `signature_version` (`signature_version`),
  KEY `is_active` (`is_active`),
  KEY `is_uptodate` (`is_uptodate`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_deleted` (`is_deleted`),
  KEY `computers_id` (`computers_id`),
  KEY `date_expiration` (`date_expiration`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_computerantiviruses`
--

LOCK TABLES `glpi_computerantiviruses` WRITE;
/*!40000 ALTER TABLE `glpi_computerantiviruses` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_computerantiviruses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_computermodels`
--

DROP TABLE IF EXISTS `glpi_computermodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_computermodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  `required_units` int(11) NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int(11) NOT NULL DEFAULT '0',
  `power_consumption` int(11) NOT NULL DEFAULT '0',
  `is_half_rack` tinyint(1) NOT NULL DEFAULT '0',
  `picture_front` text COLLATE utf8_unicode_ci,
  `picture_rear` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_computermodels`
--

LOCK TABLES `glpi_computermodels` WRITE;
/*!40000 ALTER TABLE `glpi_computermodels` DISABLE KEYS */;
INSERT INTO `glpi_computermodels` VALUES (1,'2U d-5550','','101529201',20,2,1,2,1200,0,NULL,NULL,'2019-02-15 09:15:29','2019-02-11 09:46:40');
/*!40000 ALTER TABLE `glpi_computermodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_computers`
--

DROP TABLE IF EXISTS `glpi_computers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_computers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `autoupdatesystems_id` int(11) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `domains_id` int(11) NOT NULL DEFAULT '0',
  `networks_id` int(11) NOT NULL DEFAULT '0',
  `computermodels_id` int(11) NOT NULL DEFAULT '0',
  `computertypes_id` int(11) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `domains_id` (`domains_id`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `computermodels_id` (`computermodels_id`),
  KEY `networks_id` (`networks_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `computertypes_id` (`computertypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `uuid` (`uuid`),
  KEY `date_creation` (`date_creation`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_computers`
--

LOCK TABLES `glpi_computers` WRITE;
/*!40000 ALTER TABLE `glpi_computers` DISABLE KEYS */;
INSERT INTO `glpi_computers` VALUES (1,0,'2U dell-5550','121D940H12','001','Игнатьев А.С.','+7 7773330505',7,1,'','2019-02-15 09:38:07',1,1,1,3,1,1,0,NULL,2,0,0,0,2,1,0.0000,'00127782341','2019-02-11 09:47:50',0);
/*!40000 ALTER TABLE `glpi_computers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_computers_items`
--

DROP TABLE IF EXISTS `glpi_computers_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_computers_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to various table, according to itemtype (ID)',
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_computers_items`
--

LOCK TABLES `glpi_computers_items` WRITE;
/*!40000 ALTER TABLE `glpi_computers_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_computers_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_computers_softwarelicenses`
--

DROP TABLE IF EXISTS `glpi_computers_softwarelicenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_computers_softwarelicenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `softwarelicenses_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `softwarelicenses_id` (`softwarelicenses_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_computers_softwarelicenses`
--

LOCK TABLES `glpi_computers_softwarelicenses` WRITE;
/*!40000 ALTER TABLE `glpi_computers_softwarelicenses` DISABLE KEYS */;
INSERT INTO `glpi_computers_softwarelicenses` VALUES (1,1,1,0,0);
/*!40000 ALTER TABLE `glpi_computers_softwarelicenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_computers_softwareversions`
--

DROP TABLE IF EXISTS `glpi_computers_softwareversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_computers_softwareversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `softwareversions_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted_computer` tinyint(1) NOT NULL DEFAULT '0',
  `is_template_computer` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `date_install` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`computers_id`,`softwareversions_id`),
  KEY `softwareversions_id` (`softwareversions_id`),
  KEY `computers_info` (`entities_id`,`is_template_computer`,`is_deleted_computer`),
  KEY `is_template` (`is_template_computer`),
  KEY `is_deleted` (`is_deleted_computer`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `date_install` (`date_install`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_computers_softwareversions`
--

LOCK TABLES `glpi_computers_softwareversions` WRITE;
/*!40000 ALTER TABLE `glpi_computers_softwareversions` DISABLE KEYS */;
INSERT INTO `glpi_computers_softwareversions` VALUES (1,1,1,0,0,0,0,0,NULL);
/*!40000 ALTER TABLE `glpi_computers_softwareversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_computertypes`
--

DROP TABLE IF EXISTS `glpi_computertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_computertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_computertypes`
--

LOCK TABLES `glpi_computertypes` WRITE;
/*!40000 ALTER TABLE `glpi_computertypes` DISABLE KEYS */;
INSERT INTO `glpi_computertypes` VALUES (1,'srv','сервер','2019-02-11 09:44:51','2019-02-11 09:44:51'),(2,'comp','компьютер','2019-02-11 09:45:03','2019-02-11 09:45:03'),(3,'switch','','2019-02-15 03:27:27','2019-02-15 03:27:27');
/*!40000 ALTER TABLE `glpi_computertypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_computervirtualmachines`
--

DROP TABLE IF EXISTS `glpi_computervirtualmachines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_computervirtualmachines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `virtualmachinestates_id` int(11) NOT NULL DEFAULT '0',
  `virtualmachinesystems_id` int(11) NOT NULL DEFAULT '0',
  `virtualmachinetypes_id` int(11) NOT NULL DEFAULT '0',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `vcpu` int(11) NOT NULL DEFAULT '0',
  `ram` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `name` (`name`),
  KEY `virtualmachinestates_id` (`virtualmachinestates_id`),
  KEY `virtualmachinesystems_id` (`virtualmachinesystems_id`),
  KEY `vcpu` (`vcpu`),
  KEY `ram` (`ram`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `uuid` (`uuid`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_computervirtualmachines`
--

LOCK TABLES `glpi_computervirtualmachines` WRITE;
/*!40000 ALTER TABLE `glpi_computervirtualmachines` DISABLE KEYS */;
INSERT INTO `glpi_computervirtualmachines` VALUES (1,0,1,'orbp-001',1,2,2,'003AN341C',2,'2048',0,0,'','2019-02-11 10:21:54','2019-02-11 10:08:45'),(2,0,1,'vm2',1,3,2,'0324kljkdsjg12',2,'2048',0,0,'','2019-02-13 05:07:15','2019-02-13 05:07:15'),(3,0,1,'ip-alim',1,2,1,'',2,'2048',0,0,'','2019-02-19 05:02:20','2019-02-19 05:02:20');
/*!40000 ALTER TABLE `glpi_computervirtualmachines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_configs`
--

DROP TABLE IF EXISTS `glpi_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`context`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_configs`
--

LOCK TABLES `glpi_configs` WRITE;
/*!40000 ALTER TABLE `glpi_configs` DISABLE KEYS */;
INSERT INTO `glpi_configs` VALUES (1,'core','version','9.4.0'),(2,'core','show_jobs_at_login','0'),(3,'core','cut','250'),(4,'core','list_limit','15'),(5,'core','list_limit_max','50'),(6,'core','url_maxlength','30'),(7,'core','event_loglevel','5'),(8,'core','notifications_mailing','0'),(9,'core','admin_email','admsys@localhost'),(10,'core','admin_email_name',''),(11,'core','admin_reply',''),(12,'core','admin_reply_name',''),(13,'core','mailing_signature','SIGNATURE'),(14,'core','use_anonymous_helpdesk','0'),(15,'core','use_anonymous_followups','0'),(16,'core','language','ru_RU'),(17,'core','priority_1','#fff2f2'),(18,'core','priority_2','#ffe0e0'),(19,'core','priority_3','#ffcece'),(20,'core','priority_4','#ffbfbf'),(21,'core','priority_5','#ffadad'),(22,'core','priority_6','#ff5555'),(23,'core','date_tax','2019-12-31'),(24,'core','cas_host',''),(25,'core','cas_port','443'),(26,'core','cas_uri',''),(27,'core','cas_logout',''),(28,'core','existing_auth_server_field_clean_domain','0'),(29,'core','planning_begin','08:00:00'),(30,'core','planning_end','20:00:00'),(31,'core','utf8_conv','1'),(32,'core','use_public_faq','0'),(33,'core','url_base','http://hras.mycloud.kz'),(34,'core','show_link_in_mail','0'),(35,'core','text_login',''),(36,'core','founded_new_version',''),(37,'core','dropdown_max','100'),(38,'core','ajax_wildcard','*'),(42,'core','ajax_limit_count','10'),(43,'core','use_ajax_autocompletion','1'),(44,'core','is_users_auto_add','1'),(45,'core','date_format','0'),(46,'core','number_format','0'),(47,'core','csv_delimiter',';'),(48,'core','is_ids_visible','0'),(50,'core','smtp_mode','0'),(51,'core','smtp_host',''),(52,'core','smtp_port','25'),(53,'core','smtp_username',''),(54,'core','proxy_name',''),(55,'core','proxy_port','8080'),(56,'core','proxy_user',''),(57,'core','add_followup_on_update_ticket','1'),(58,'core','keep_tickets_on_delete','0'),(59,'core','time_step','5'),(60,'core','decimal_number','2'),(61,'core','helpdesk_doc_url',''),(62,'core','central_doc_url',''),(63,'core','documentcategories_id_forticket','0'),(64,'core','monitors_management_restrict','2'),(65,'core','phones_management_restrict','2'),(66,'core','peripherals_management_restrict','2'),(67,'core','printers_management_restrict','2'),(68,'core','use_log_in_files','1'),(69,'core','time_offset','0'),(70,'core','is_contact_autoupdate','1'),(71,'core','is_user_autoupdate','1'),(72,'core','is_group_autoupdate','1'),(73,'core','is_location_autoupdate','1'),(74,'core','state_autoupdate_mode','0'),(75,'core','is_contact_autoclean','0'),(76,'core','is_user_autoclean','0'),(77,'core','is_group_autoclean','0'),(78,'core','is_location_autoclean','0'),(79,'core','state_autoclean_mode','0'),(80,'core','use_flat_dropdowntree','0'),(81,'core','use_autoname_by_entity','1'),(84,'core','softwarecategories_id_ondelete','1'),(85,'core','x509_email_field',''),(86,'core','x509_cn_restrict',''),(87,'core','x509_o_restrict',''),(88,'core','x509_ou_restrict',''),(89,'core','default_mailcollector_filesize_max','2097152'),(90,'core','followup_private','0'),(91,'core','task_private','0'),(92,'core','default_software_helpdesk_visible','1'),(93,'core','names_format','0'),(95,'core','default_requesttypes_id','1'),(96,'core','use_noright_users_add','1'),(97,'core','cron_limit','5'),(98,'core','priority_matrix','{\"1\":{\"1\":1,\"2\":1,\"3\":2,\"4\":2,\"5\":2},\"2\":{\"1\":1,\"2\":2,\"3\":2,\"4\":3,\"5\":3},\"3\":{\"1\":2,\"2\":2,\"3\":3,\"4\":4,\"5\":4},\"4\":{\"1\":2,\"2\":3,\"3\":4,\"4\":4,\"5\":5},\"5\":{\"1\":2,\"2\":3,\"3\":4,\"4\":5,\"5\":5}}'),(99,'core','urgency_mask','62'),(100,'core','impact_mask','62'),(101,'core','user_deleted_ldap','0'),(102,'core','auto_create_infocoms','0'),(103,'core','use_slave_for_search','0'),(104,'core','proxy_passwd',''),(105,'core','smtp_passwd',''),(106,'core','transfers_id_auto','0'),(107,'core','show_count_on_tabs','1'),(108,'core','refresh_ticket_list','0'),(109,'core','set_default_tech','1'),(110,'core','allow_search_view','2'),(111,'core','allow_search_all','0'),(112,'core','allow_search_global','1'),(113,'core','display_count_on_home','5'),(114,'core','use_password_security','0'),(115,'core','password_min_length','8'),(116,'core','password_need_number','1'),(117,'core','password_need_letter','1'),(118,'core','password_need_caps','1'),(119,'core','password_need_symbol','1'),(120,'core','use_check_pref','0'),(121,'core','notification_to_myself','1'),(122,'core','duedateok_color','#06ff00'),(123,'core','duedatewarning_color','#ffb800'),(124,'core','duedatecritical_color','#ff0000'),(125,'core','duedatewarning_less','20'),(126,'core','duedatecritical_less','5'),(127,'core','duedatewarning_unit','%'),(128,'core','duedatecritical_unit','%'),(129,'core','realname_ssofield',''),(130,'core','firstname_ssofield',''),(131,'core','email1_ssofield',''),(132,'core','email2_ssofield',''),(133,'core','email3_ssofield',''),(134,'core','email4_ssofield',''),(135,'core','phone_ssofield',''),(136,'core','phone2_ssofield',''),(137,'core','mobile_ssofield',''),(138,'core','comment_ssofield',''),(139,'core','title_ssofield',''),(140,'core','category_ssofield',''),(141,'core','language_ssofield',''),(142,'core','entity_ssofield',''),(143,'core','registration_number_ssofield',''),(144,'core','ssovariables_id','0'),(145,'core','translate_kb','0'),(146,'core','translate_dropdowns','0'),(147,'core','pdffont','dejavusans'),(148,'core','keep_devices_when_purging_item','0'),(149,'core','maintenance_mode','0'),(150,'core','maintenance_text',''),(152,'core','attach_ticket_documents_to_mail','0'),(153,'core','backcreated','0'),(154,'core','task_state','1'),(155,'core','layout','lefttab'),(158,'core','palette','lightblue'),(159,'core','lock_use_lock_item','0'),(160,'core','lock_autolock_mode','1'),(161,'core','lock_directunlock_notification','0'),(162,'core','lock_item_list','[]'),(163,'core','lock_lockprofile_id','8'),(164,'core','set_default_requester','1'),(165,'core','highcontrast_css','0'),(166,'core','smtp_check_certificate','1'),(167,'core','enable_api','0'),(168,'core','enable_api_login_credentials','0'),(169,'core','enable_api_login_external_token','1'),(170,'core','url_base_api','http://hras.mycloud.kz/apirest.php/'),(171,'core','login_remember_time','604800'),(172,'core','login_remember_default','1'),(173,'core','use_notifications','1'),(174,'core','notifications_ajax','1'),(175,'core','notifications_ajax_check_interval','5'),(176,'core','notifications_ajax_sound',NULL),(177,'core','notifications_ajax_icon_url','/pics/glpi.png'),(178,'core','dbversion','9.4'),(179,'core','smtp_max_retries','5'),(180,'core','smtp_sender',NULL),(181,'core','from_email',NULL),(182,'core','from_email_name',NULL),(183,'core','instance_uuid','fTMeF6ba9J3CwmOXtGYtXgr6SjbvaZPA3lgeU3s4'),(184,'core','registration_uuid','bQsYb9ZiOsyWtMQ7ULnlxDLMAQ3VIhRAnVgQPZYL'),(185,'core','smtp_retry_time','5'),(186,'core','purge_addrelation','0'),(187,'core','purge_deleterelation','0'),(188,'core','purge_createitem','0'),(189,'core','purge_deleteitem','0'),(190,'core','purge_restoreitem','0'),(191,'core','purge_updateitem','0'),(192,'core','purge_computer_software_install','0'),(193,'core','purge_software_computer_install','0'),(194,'core','purge_software_version_install','0'),(195,'core','purge_infocom_creation','0'),(196,'core','purge_profile_user','0'),(197,'core','purge_group_user','0'),(198,'core','purge_adddevice','0'),(199,'core','purge_updatedevice','0'),(200,'core','purge_deletedevice','0'),(201,'core','purge_connectdevice','0'),(202,'core','purge_disconnectdevice','0'),(203,'core','purge_userdeletedfromldap','0'),(204,'core','purge_comments','0'),(205,'core','purge_datemod','0'),(206,'core','purge_all','0'),(207,'core','purge_user_auth_changes','0'),(208,'core','purge_plugins','0'),(209,'core','display_login_source','1'),(210,'core','cas_version','CAS_VERSION_2_0'),(212,'plugin:uninstall','replace_status_dropdown','1'),(213,'plugin:uninstall','config_class','PluginUninstallConfig'),(214,'plugin:uninstall','_no_history',''),(215,'core','notifications_websocket','0'),(216,'plugin:telegrambot','token',''),(217,'plugin:telegrambot','bot_username',''),(218,'plugin:Example','configuration',''),(219,'formcreator','schema_version','2.7'),(220,'core','_date_tax','12-31'),(221,'core','_no_history',''),(222,'plugin:Example','_no_history',''),(223,'core','_dbslave_status','0');
/*!40000 ALTER TABLE `glpi_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_consumableitems`
--

DROP TABLE IF EXISTS `glpi_consumableitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_consumableitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `consumableitemtypes_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `alarm_threshold` int(11) NOT NULL DEFAULT '10',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `consumableitemtypes_id` (`consumableitemtypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `alarm_threshold` (`alarm_threshold`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `otherserial` (`otherserial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_consumableitems`
--

LOCK TABLES `glpi_consumableitems` WRITE;
/*!40000 ALTER TABLE `glpi_consumableitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_consumableitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_consumableitemtypes`
--

DROP TABLE IF EXISTS `glpi_consumableitemtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_consumableitemtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_consumableitemtypes`
--

LOCK TABLES `glpi_consumableitemtypes` WRITE;
/*!40000 ALTER TABLE `glpi_consumableitemtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_consumableitemtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_consumables`
--

DROP TABLE IF EXISTS `glpi_consumables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_consumables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `consumableitems_id` int(11) NOT NULL DEFAULT '0',
  `date_in` date DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_in` (`date_in`),
  KEY `date_out` (`date_out`),
  KEY `consumableitems_id` (`consumableitems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_consumables`
--

LOCK TABLES `glpi_consumables` WRITE;
/*!40000 ALTER TABLE `glpi_consumables` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_consumables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_contacts`
--

DROP TABLE IF EXISTS `glpi_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contacttypes_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `usertitles_id` int(11) NOT NULL DEFAULT '0',
  `address` text COLLATE utf8_unicode_ci,
  `postcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `town` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `contacttypes_id` (`contacttypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `usertitles_id` (`usertitles_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_contacts`
--

LOCK TABLES `glpi_contacts` WRITE;
/*!40000 ALTER TABLE `glpi_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_contacts_suppliers`
--

DROP TABLE IF EXISTS `glpi_contacts_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_contacts_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suppliers_id` int(11) NOT NULL DEFAULT '0',
  `contacts_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`suppliers_id`,`contacts_id`),
  KEY `contacts_id` (`contacts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_contacts_suppliers`
--

LOCK TABLES `glpi_contacts_suppliers` WRITE;
/*!40000 ALTER TABLE `glpi_contacts_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_contacts_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_contacttypes`
--

DROP TABLE IF EXISTS `glpi_contacttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_contacttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_contacttypes`
--

LOCK TABLES `glpi_contacttypes` WRITE;
/*!40000 ALTER TABLE `glpi_contacttypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_contacttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_contractcosts`
--

DROP TABLE IF EXISTS `glpi_contractcosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_contractcosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contracts_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `cost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `budgets_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `contracts_id` (`contracts_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_contractcosts`
--

LOCK TABLES `glpi_contractcosts` WRITE;
/*!40000 ALTER TABLE `glpi_contractcosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_contractcosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_contracts`
--

DROP TABLE IF EXISTS `glpi_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contracttypes_id` int(11) NOT NULL DEFAULT '0',
  `begin_date` date DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT '0',
  `notice` int(11) NOT NULL DEFAULT '0',
  `periodicity` int(11) NOT NULL DEFAULT '0',
  `billing` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `accounting_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `week_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `week_end_hour` time NOT NULL DEFAULT '00:00:00',
  `saturday_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `saturday_end_hour` time NOT NULL DEFAULT '00:00:00',
  `use_saturday` tinyint(1) NOT NULL DEFAULT '0',
  `monday_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `monday_end_hour` time NOT NULL DEFAULT '00:00:00',
  `use_monday` tinyint(1) NOT NULL DEFAULT '0',
  `max_links_allowed` int(11) NOT NULL DEFAULT '0',
  `alert` int(11) NOT NULL DEFAULT '0',
  `renewal` int(11) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `begin_date` (`begin_date`),
  KEY `name` (`name`),
  KEY `contracttypes_id` (`contracttypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `use_monday` (`use_monday`),
  KEY `use_saturday` (`use_saturday`),
  KEY `alert` (`alert`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_contracts`
--

LOCK TABLES `glpi_contracts` WRITE;
/*!40000 ALTER TABLE `glpi_contracts` DISABLE KEYS */;
INSERT INTO `glpi_contracts` VALUES (1,0,0,'ИП «Курмангазы»','001',1,'2019-02-11',1,12,12,12,'100','',0,'10:00:00','20:00:00','00:00:00','00:00:00',0,'00:00:00','00:00:00',0,1,0,1,NULL,0,'2019-02-15 09:40:01','2019-02-11 10:04:40');
/*!40000 ALTER TABLE `glpi_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_contracts_items`
--

DROP TABLE IF EXISTS `glpi_contracts_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_contracts_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contracts_id` int(11) NOT NULL DEFAULT '0',
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`contracts_id`,`itemtype`,`items_id`),
  KEY `FK_device` (`items_id`,`itemtype`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_contracts_items`
--

LOCK TABLES `glpi_contracts_items` WRITE;
/*!40000 ALTER TABLE `glpi_contracts_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_contracts_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_contracts_suppliers`
--

DROP TABLE IF EXISTS `glpi_contracts_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_contracts_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suppliers_id` int(11) NOT NULL DEFAULT '0',
  `contracts_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`suppliers_id`,`contracts_id`),
  KEY `contracts_id` (`contracts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_contracts_suppliers`
--

LOCK TABLES `glpi_contracts_suppliers` WRITE;
/*!40000 ALTER TABLE `glpi_contracts_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_contracts_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_contracttypes`
--

DROP TABLE IF EXISTS `glpi_contracttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_contracttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_contracttypes`
--

LOCK TABLES `glpi_contracttypes` WRITE;
/*!40000 ALTER TABLE `glpi_contracttypes` DISABLE KEYS */;
INSERT INTO `glpi_contracttypes` VALUES (1,'Типовой','','2019-02-11 10:04:15','2019-02-11 10:04:15');
/*!40000 ALTER TABLE `glpi_contracttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_crontasklogs`
--

DROP TABLE IF EXISTS `glpi_crontasklogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_crontasklogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crontasks_id` int(11) NOT NULL,
  `crontasklogs_id` int(11) NOT NULL COMMENT 'id of ''start'' event',
  `date` datetime NOT NULL,
  `state` int(11) NOT NULL COMMENT '0:start, 1:run, 2:stop',
  `elapsed` float NOT NULL COMMENT 'time elapsed since start',
  `volume` int(11) NOT NULL COMMENT 'for statistics',
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'message',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `crontasks_id` (`crontasks_id`),
  KEY `crontasklogs_id_state` (`crontasklogs_id`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=752 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_crontasklogs`
--

LOCK TABLES `glpi_crontasklogs` WRITE;
/*!40000 ALTER TABLE `glpi_crontasklogs` DISABLE KEYS */;
INSERT INTO `glpi_crontasklogs` VALUES (1,18,0,'2019-02-07 09:04:18',0,0,0,'Run mode: GLPI'),(2,18,1,'2019-02-07 09:04:18',2,0.0190871,0,'Action completed, no processing required'),(3,19,0,'2019-02-07 09:06:53',0,0,0,'Run mode: GLPI'),(4,19,3,'2019-02-07 09:06:53',2,0.00827289,0,'Action completed, fully processed'),(5,20,0,'2019-02-07 09:10:45',0,0,0,'Run mode: GLPI'),(6,20,5,'2019-02-07 09:10:45',2,0.00821018,0,'Action completed, no processing required'),(7,21,0,'2019-02-07 09:36:01',0,0,0,'Run mode: GLPI'),(8,21,7,'2019-02-07 09:36:01',2,0.00824404,0,'Action completed, no processing required'),(9,22,0,'2019-02-07 09:36:45',0,0,0,'Run mode: GLPI'),(10,22,9,'2019-02-07 09:36:45',2,0.00864792,0,'Action completed, no processing required'),(11,23,0,'2019-02-07 09:48:28',0,0,0,'Run mode: GLPI'),(12,23,11,'2019-02-07 09:48:28',2,0.011775,0,'Action completed, no processing required'),(13,24,0,'2019-02-11 09:32:19',0,0,0,'Run mode: GLPI'),(14,24,13,'2019-02-11 09:32:19',1,0.00497103,1,'Очистить 1 временный файл созданный больше чем 3600 секунд\n'),(15,24,13,'2019-02-11 09:32:19',2,0.0110011,1,'Action completed, fully processed'),(16,25,0,'2019-02-11 09:47:50',0,0,0,'Run mode: GLPI'),(17,25,16,'2019-02-11 09:47:50',2,0.00725985,0,'Action completed, no processing required'),(18,5,0,'2019-02-11 09:52:59',0,0,0,'Run mode: GLPI'),(19,5,18,'2019-02-11 09:52:59',2,0.0073812,0,'Action completed, no processing required'),(20,6,0,'2019-02-11 09:58:41',0,0,0,'Run mode: GLPI'),(21,6,20,'2019-02-11 09:58:41',2,0.00686502,0,'Action completed, no processing required'),(22,9,0,'2019-02-11 10:04:40',0,0,0,'Run mode: GLPI'),(23,9,22,'2019-02-11 10:04:40',2,0.0446992,0,'Action completed, no processing required'),(24,12,0,'2019-02-11 10:10:00',0,0,0,'Run mode: GLPI'),(25,12,24,'2019-02-11 10:10:00',1,0.00407505,6,'Очистить 6 файлы сеансов созданные больше чем 1440 секунд\n'),(26,12,24,'2019-02-11 10:10:00',2,0.00903797,6,'Action completed, fully processed'),(27,13,0,'2019-02-11 10:15:00',0,0,0,'Run mode: GLPI'),(28,13,27,'2019-02-11 10:15:00',1,0.00472903,1,'Очистить 1 графический файл созданный больше чем 3600 секунд\n'),(29,13,27,'2019-02-11 10:15:00',2,0.0107028,1,'Action completed, fully processed'),(30,14,0,'2019-02-11 10:20:02',0,0,0,'Run mode: GLPI'),(31,14,30,'2019-02-11 10:20:02',2,0.00735402,0,'Action completed, no processing required'),(32,15,0,'2019-02-11 10:25:16',0,0,0,'Run mode: GLPI'),(33,15,32,'2019-02-11 10:25:16',2,0.00867486,0,'Action completed, no processing required'),(34,16,0,'2019-02-12 02:18:02',0,0,0,'Run mode: GLPI'),(35,16,34,'2019-02-12 02:18:02',2,0.00734115,0,'Action completed, no processing required'),(36,17,0,'2019-02-12 02:26:14',0,0,0,'Run mode: GLPI'),(37,17,36,'2019-02-12 02:26:14',2,0.00806403,0,'Action completed, no processing required'),(38,32,0,'2019-02-12 02:31:24',0,0,0,'Run mode: GLPI'),(39,32,38,'2019-02-12 02:31:24',2,0.0084939,0,'Action completed, no processing required'),(40,22,0,'2019-02-12 02:36:02',0,0,0,'Run mode: GLPI'),(41,22,40,'2019-02-12 02:36:02',2,0.00725198,0,'Action completed, no processing required'),(42,21,0,'2019-02-12 02:37:11',0,0,0,'Run mode: GLPI'),(43,21,42,'2019-02-12 02:37:11',2,0.00585103,0,'Action completed, no processing required'),(44,20,0,'2019-02-12 02:42:13',0,0,0,'Run mode: GLPI'),(45,20,44,'2019-02-12 02:42:13',2,0.00597715,0,'Action completed, no processing required'),(46,18,0,'2019-02-12 02:42:41',0,0,0,'Run mode: GLPI'),(47,18,46,'2019-02-12 02:42:41',2,0.00791311,0,'Action completed, no processing required'),(48,19,0,'2019-02-12 02:42:54',0,0,0,'Run mode: GLPI'),(49,19,48,'2019-02-12 02:42:54',2,0.00814104,0,'Action completed, fully processed'),(50,23,0,'2019-02-12 02:47:39',0,0,0,'Run mode: GLPI'),(51,23,50,'2019-02-12 02:47:39',2,0.00538492,0,'Action completed, no processing required'),(52,9,0,'2019-02-12 05:03:03',0,0,0,'Run mode: GLPI'),(53,9,52,'2019-02-12 05:03:03',2,0.0339811,0,'Action completed, no processing required'),(54,30,0,'2019-02-12 05:30:38',0,0,0,'Run mode: GLPI'),(55,30,54,'2019-02-12 05:30:38',2,1.33527,0,'Action completed, fully processed'),(56,24,0,'2019-02-12 05:44:34',0,0,0,'Run mode: GLPI'),(57,24,56,'2019-02-12 05:44:34',1,0.00573993,1,'Очистить 1 временный файл созданный больше чем 3600 секунд\n'),(58,24,56,'2019-02-12 05:44:34',2,0.0105848,1,'Action completed, fully processed'),(59,13,0,'2019-02-12 05:45:21',0,0,0,'Run mode: GLPI'),(60,13,59,'2019-02-12 05:45:21',1,0.00512791,1,'Очистить 1 графический файл созданный больше чем 3600 секунд\n'),(61,13,59,'2019-02-12 05:45:21',2,0.0100741,1,'Action completed, fully processed'),(62,14,0,'2019-02-12 05:46:46',0,0,0,'Run mode: GLPI'),(63,14,62,'2019-02-12 05:46:46',2,0.00803089,0,'Action completed, no processing required'),(64,15,0,'2019-02-12 05:47:53',0,0,0,'Run mode: GLPI'),(65,15,64,'2019-02-12 05:47:53',2,0.00927997,0,'Action completed, no processing required'),(66,17,0,'2019-02-12 05:48:02',0,0,0,'Run mode: GLPI'),(67,17,66,'2019-02-12 05:48:02',2,0.00933504,0,'Action completed, no processing required'),(68,32,0,'2019-02-12 05:49:08',0,0,0,'Run mode: GLPI'),(69,32,68,'2019-02-12 05:49:08',2,0.00841689,0,'Action completed, no processing required'),(70,22,0,'2019-02-12 05:55:24',0,0,0,'Run mode: GLPI'),(71,22,70,'2019-02-12 05:55:24',2,0.011451,0,'Action completed, no processing required'),(72,21,0,'2019-02-12 06:01:21',0,0,0,'Run mode: GLPI'),(73,21,72,'2019-02-12 06:01:21',2,0.00963402,0,'Action completed, no processing required'),(74,20,0,'2019-02-12 06:08:46',0,0,0,'Run mode: GLPI'),(75,20,74,'2019-02-12 06:08:46',2,0.00841403,0,'Action completed, no processing required'),(76,9,0,'2019-02-12 06:15:31',0,0,0,'Run mode: GLPI'),(77,9,76,'2019-02-12 06:15:31',2,0.0314901,0,'Action completed, no processing required'),(78,17,0,'2019-02-12 06:17:55',0,0,0,'Run mode: GLPI'),(79,17,78,'2019-02-12 06:17:55',2,0.00846505,0,'Action completed, no processing required'),(80,32,0,'2019-02-12 06:18:02',0,0,0,'Run mode: GLPI'),(81,32,80,'2019-02-12 06:18:02',2,0.00959396,0,'Action completed, no processing required'),(82,22,0,'2019-02-12 06:33:20',0,0,0,'Run mode: GLPI'),(83,22,82,'2019-02-12 06:33:20',2,0.0093441,0,'Action completed, no processing required'),(84,21,0,'2019-02-12 06:38:30',0,0,0,'Run mode: GLPI'),(85,21,84,'2019-02-12 06:38:30',2,0.00997996,0,'Action completed, no processing required'),(86,17,0,'2019-02-12 07:33:54',0,0,0,'Run mode: GLPI'),(87,17,86,'2019-02-12 07:33:54',2,0.0089612,0,'Action completed, no processing required'),(88,32,0,'2019-02-12 07:39:33',0,0,0,'Run mode: GLPI'),(89,32,88,'2019-02-12 07:39:33',2,0.014106,0,'Action completed, no processing required'),(90,9,0,'2019-02-12 07:42:22',0,0,0,'Run mode: GLPI'),(91,9,90,'2019-02-12 07:42:22',2,0.0280471,0,'Action completed, no processing required'),(92,22,0,'2019-02-12 07:42:27',0,0,0,'Run mode: GLPI'),(93,22,92,'2019-02-12 07:42:27',2,0.00764084,0,'Action completed, no processing required'),(94,21,0,'2019-02-12 07:42:42',0,0,0,'Run mode: GLPI'),(95,21,94,'2019-02-12 07:42:42',2,0.019489,0,'Action completed, no processing required'),(96,24,0,'2019-02-12 08:46:49',0,0,0,'Run mode: GLPI'),(97,24,96,'2019-02-12 08:46:49',2,0.00810099,0,'Action completed, no processing required'),(98,13,0,'2019-02-12 10:34:17',0,0,0,'Run mode: GLPI'),(99,13,98,'2019-02-12 10:34:17',1,0.00500488,8,'Очистить 8 графические файлы созданные больше чем 3600 секунд\n'),(100,13,98,'2019-02-12 10:34:17',2,0.011781,8,'Action completed, fully processed'),(101,14,0,'2019-02-12 10:50:30',0,0,0,'Run mode: GLPI'),(102,14,101,'2019-02-12 10:50:30',2,0.00817704,0,'Action completed, no processing required'),(103,20,0,'2019-02-12 11:05:01',0,0,0,'Run mode: GLPI'),(104,20,103,'2019-02-12 11:05:01',2,0.00645304,0,'Action completed, no processing required'),(105,17,0,'2019-02-12 11:15:34',0,0,0,'Run mode: GLPI'),(106,17,105,'2019-02-12 11:15:34',2,0.00805593,0,'Action completed, no processing required'),(107,22,0,'2019-02-12 11:21:11',0,0,0,'Run mode: GLPI'),(108,22,107,'2019-02-12 11:21:11',2,0.00860882,0,'Action completed, no processing required'),(109,32,0,'2019-02-12 11:32:25',0,0,0,'Run mode: GLPI'),(110,32,109,'2019-02-12 11:32:25',2,0.00810409,0,'Action completed, no processing required'),(111,21,0,'2019-02-12 11:41:42',0,0,0,'Run mode: GLPI'),(112,21,111,'2019-02-12 11:41:42',2,0.00709295,0,'Action completed, no processing required'),(113,9,0,'2019-02-12 11:55:05',0,0,0,'Run mode: GLPI'),(114,9,113,'2019-02-12 11:55:05',2,0.0308089,0,'Action completed, no processing required'),(115,24,0,'2019-02-12 12:00:08',0,0,0,'Run mode: GLPI'),(116,24,115,'2019-02-12 12:00:08',2,0.00872612,0,'Action completed, no processing required'),(117,25,0,'2019-02-13 02:30:49',0,0,0,'Run mode: GLPI'),(118,25,117,'2019-02-13 02:30:49',2,0.00820994,0,'Action completed, no processing required'),(119,5,0,'2019-02-13 04:05:05',0,0,0,'Run mode: GLPI'),(120,5,119,'2019-02-13 04:05:05',2,0.00862908,0,'Action completed, no processing required'),(121,6,0,'2019-02-13 04:17:18',0,0,0,'Run mode: GLPI'),(122,6,121,'2019-02-13 04:17:18',2,0.00744486,0,'Action completed, no processing required'),(123,12,0,'2019-02-13 04:22:33',0,0,0,'Run mode: GLPI'),(124,12,123,'2019-02-13 04:22:33',1,0.00565815,39,'Очистить 39 файлы сеансов созданные больше чем 1440 секунд\n'),(125,12,123,'2019-02-13 04:22:33',2,0.0119882,39,'Action completed, fully processed'),(126,17,0,'2019-02-13 04:30:07',0,0,0,'Run mode: GLPI'),(127,17,126,'2019-02-13 04:30:07',2,0.00749421,0,'Action completed, no processing required'),(128,22,0,'2019-02-13 04:35:24',0,0,0,'Run mode: GLPI'),(129,22,128,'2019-02-13 04:35:24',2,0.00952101,0,'Action completed, no processing required'),(130,13,0,'2019-02-13 04:44:20',0,0,0,'Run mode: GLPI'),(131,13,130,'2019-02-13 04:44:20',2,0.00837994,0,'Action completed, no processing required'),(132,32,0,'2019-02-13 04:45:20',0,0,0,'Run mode: GLPI'),(133,32,132,'2019-02-13 04:45:20',2,0.00843596,0,'Action completed, no processing required'),(134,21,0,'2019-02-13 04:50:40',0,0,0,'Run mode: GLPI'),(135,21,134,'2019-02-13 04:50:40',2,0.00857496,0,'Action completed, no processing required'),(136,14,0,'2019-02-13 04:55:57',0,0,0,'Run mode: GLPI'),(137,14,136,'2019-02-13 04:55:57',2,0.00730181,0,'Action completed, no processing required'),(138,9,0,'2019-02-13 05:01:19',0,0,0,'Run mode: GLPI'),(139,9,138,'2019-02-13 05:01:19',2,0.037605,0,'Action completed, no processing required'),(140,20,0,'2019-02-13 05:06:20',0,0,0,'Run mode: GLPI'),(141,20,140,'2019-02-13 05:06:20',2,0.00973201,0,'Action completed, no processing required'),(142,24,0,'2019-02-13 05:11:28',0,0,0,'Run mode: GLPI'),(143,24,142,'2019-02-13 05:11:28',2,0.00809503,0,'Action completed, no processing required'),(144,16,0,'2019-02-13 05:12:03',0,0,0,'Run mode: GLPI'),(145,16,144,'2019-02-13 05:12:03',2,0.00802517,0,'Action completed, no processing required'),(146,15,0,'2019-02-13 05:16:36',0,0,0,'Run mode: GLPI'),(147,15,146,'2019-02-13 05:16:36',2,0.00875092,0,'Action completed, no processing required'),(148,18,0,'2019-02-13 06:20:07',0,0,0,'Run mode: GLPI'),(149,18,148,'2019-02-13 06:20:07',2,0.0093441,0,'Action completed, no processing required'),(150,19,0,'2019-02-13 07:54:36',0,0,0,'Run mode: GLPI'),(151,19,150,'2019-02-13 07:54:36',2,0.00885487,0,'Action completed, fully processed'),(152,23,0,'2019-02-13 08:03:58',0,0,0,'Run mode: GLPI'),(153,23,152,'2019-02-13 08:03:58',2,0.00809789,0,'Action completed, no processing required'),(154,17,0,'2019-02-13 08:14:23',0,0,0,'Run mode: GLPI'),(155,17,154,'2019-02-13 08:14:23',2,0.00902486,0,'Action completed, no processing required'),(156,22,0,'2019-02-13 08:19:25',0,0,0,'Run mode: GLPI'),(157,22,156,'2019-02-13 08:19:25',2,0.00808501,0,'Action completed, no processing required'),(158,32,0,'2019-02-13 08:25:24',0,0,0,'Run mode: GLPI'),(159,32,158,'2019-02-13 08:25:24',2,0.008461,0,'Action completed, no processing required'),(160,21,0,'2019-02-13 08:31:26',0,0,0,'Run mode: GLPI'),(161,21,160,'2019-02-13 08:31:26',2,0.00863719,0,'Action completed, no processing required'),(162,9,0,'2019-02-13 09:35:54',0,0,0,'Run mode: GLPI'),(163,9,162,'2019-02-13 09:35:54',2,0.0316849,0,'Action completed, no processing required'),(164,13,0,'2019-02-13 09:43:40',0,0,0,'Run mode: GLPI'),(165,13,164,'2019-02-13 09:43:40',2,0.0134501,0,'Action completed, no processing required'),(166,14,0,'2019-02-13 09:52:18',0,0,0,'Run mode: GLPI'),(167,14,166,'2019-02-13 09:52:18',2,0.00903082,0,'Action completed, no processing required'),(168,20,0,'2019-02-13 09:58:51',0,0,0,'Run mode: GLPI'),(169,20,168,'2019-02-13 09:58:51',2,0.00950193,0,'Action completed, no processing required'),(170,24,0,'2019-02-13 10:00:51',0,0,0,'Run mode: GLPI'),(171,24,170,'2019-02-13 10:00:51',2,0.00847912,0,'Action completed, no processing required'),(172,17,0,'2019-02-13 10:10:52',0,0,0,'Run mode: GLPI'),(173,17,172,'2019-02-13 10:10:52',2,0.00845098,0,'Action completed, no processing required'),(174,22,0,'2019-02-13 10:35:48',0,0,0,'Run mode: GLPI'),(175,22,174,'2019-02-13 10:35:48',2,0.00839496,0,'Action completed, no processing required'),(176,32,0,'2019-02-13 10:36:07',0,0,0,'Run mode: GLPI'),(177,32,176,'2019-02-13 10:36:07',2,0.00828981,0,'Action completed, no processing required'),(178,21,0,'2019-02-13 10:44:44',0,0,0,'Run mode: GLPI'),(179,21,178,'2019-02-13 10:44:44',2,0.00823593,0,'Action completed, no processing required'),(180,9,0,'2019-02-13 10:45:29',0,0,0,'Run mode: GLPI'),(181,9,180,'2019-02-13 10:45:29',2,0.0337632,0,'Action completed, no processing required'),(182,17,0,'2019-02-13 10:54:30',0,0,0,'Run mode: GLPI'),(183,17,182,'2019-02-13 10:54:30',2,0.00897598,0,'Action completed, no processing required'),(184,22,0,'2019-02-13 11:02:11',0,0,0,'Run mode: GLPI'),(185,22,184,'2019-02-13 11:02:11',2,0.00838208,0,'Action completed, no processing required'),(186,32,0,'2019-02-14 02:28:21',0,0,0,'Run mode: GLPI'),(187,32,186,'2019-02-14 02:28:21',2,0.0113161,0,'Action completed, no processing required'),(188,13,0,'2019-02-14 02:41:19',0,0,0,'Run mode: GLPI'),(189,13,188,'2019-02-14 02:41:19',2,0.00650907,0,'Action completed, no processing required'),(190,21,0,'2019-02-14 02:47:29',0,0,0,'Run mode: GLPI'),(191,21,190,'2019-02-14 02:47:29',2,0.00633407,0,'Action completed, no processing required'),(192,14,0,'2019-02-14 03:04:43',0,0,0,'Run mode: GLPI'),(193,14,192,'2019-02-14 03:04:43',2,0.00983596,0,'Action completed, no processing required'),(194,9,0,'2019-02-14 03:13:36',0,0,0,'Run mode: GLPI'),(195,9,194,'2019-02-14 03:13:36',2,0.0418999,0,'Action completed, no processing required'),(196,20,0,'2019-02-14 03:18:41',0,0,0,'Run mode: GLPI'),(197,20,196,'2019-02-14 03:18:41',2,0.00921106,0,'Action completed, no processing required'),(198,17,0,'2019-02-14 05:03:46',0,0,0,'Run mode: GLPI'),(199,17,198,'2019-02-14 05:03:46',2,0.00935793,0,'Action completed, no processing required'),(200,24,0,'2019-02-14 05:27:16',0,0,0,'Run mode: GLPI'),(201,24,200,'2019-02-14 05:27:16',2,0.00597095,0,'Action completed, no processing required'),(202,22,0,'2019-02-14 05:32:36',0,0,0,'Run mode: GLPI'),(203,22,202,'2019-02-14 05:32:36',2,0.00836301,0,'Action completed, no processing required'),(204,16,0,'2019-02-14 05:52:23',0,0,0,'Run mode: GLPI'),(205,16,204,'2019-02-14 05:52:23',2,0.00881195,0,'Action completed, no processing required'),(206,15,0,'2019-02-14 05:57:34',0,0,0,'Run mode: GLPI'),(207,15,206,'2019-02-14 05:57:34',2,0.00890088,0,'Action completed, no processing required'),(208,25,0,'2019-02-14 06:17:24',0,0,0,'Run mode: GLPI'),(209,25,208,'2019-02-14 06:17:24',2,0.00631189,0,'Action completed, no processing required'),(210,32,0,'2019-02-14 06:25:26',0,0,0,'Run mode: GLPI'),(211,32,210,'2019-02-14 06:25:26',2,0.00944114,0,'Action completed, no processing required'),(212,21,0,'2019-02-14 07:43:32',0,0,0,'Run mode: GLPI'),(213,21,212,'2019-02-14 07:43:32',2,0.00900602,0,'Action completed, no processing required'),(214,9,0,'2019-02-14 08:03:54',0,0,0,'Run mode: GLPI'),(215,9,214,'2019-02-14 08:03:54',2,0.0322449,0,'Action completed, no processing required'),(216,13,0,'2019-02-14 08:47:37',0,0,0,'Run mode: GLPI'),(217,13,216,'2019-02-14 08:47:37',2,0.00775599,0,'Action completed, no processing required'),(218,14,0,'2019-02-14 09:37:24',0,0,0,'Run mode: GLPI'),(219,14,218,'2019-02-14 09:37:24',2,0.0086019,0,'Action completed, no processing required'),(220,5,0,'2019-02-14 09:42:32',0,0,0,'Run mode: GLPI'),(221,5,220,'2019-02-14 09:42:32',2,0.00791097,0,'Action completed, no processing required'),(222,6,0,'2019-02-14 09:48:39',0,0,0,'Run mode: GLPI'),(223,6,222,'2019-02-14 09:48:39',2,0.00578809,0,'Action completed, no processing required'),(224,20,0,'2019-02-14 09:54:09',0,0,0,'Run mode: GLPI'),(225,20,224,'2019-02-14 09:54:09',2,0.00824904,0,'Action completed, no processing required'),(226,12,0,'2019-02-14 10:20:01',0,0,0,'Run mode: GLPI'),(227,12,226,'2019-02-14 10:20:01',1,0.00701904,48,'Очистить 48 файлы сеансов созданные больше чем 1440 секунд\n'),(228,12,226,'2019-02-14 10:20:01',2,0.014637,48,'Action completed, fully processed'),(229,17,0,'2019-02-14 10:20:30',0,0,0,'Run mode: GLPI'),(230,17,229,'2019-02-14 10:20:30',2,0.00848603,0,'Action completed, no processing required'),(231,22,0,'2019-02-14 10:35:54',0,0,0,'Run mode: GLPI'),(232,22,231,'2019-02-14 10:35:54',2,0.00722003,0,'Action completed, no processing required'),(233,18,0,'2019-02-14 10:36:13',0,0,0,'Run mode: GLPI'),(234,18,233,'2019-02-14 10:36:13',2,0.0105851,0,'Action completed, no processing required'),(235,24,0,'2019-02-14 10:40:49',0,0,0,'Run mode: GLPI'),(236,24,235,'2019-02-14 10:40:49',2,0.00843191,0,'Action completed, no processing required'),(237,32,0,'2019-02-14 10:41:21',0,0,0,'Run mode: GLPI'),(238,32,237,'2019-02-14 10:41:21',2,0.008569,0,'Action completed, no processing required'),(239,21,0,'2019-02-14 10:50:28',0,0,0,'Run mode: GLPI'),(240,21,239,'2019-02-14 10:50:28',2,0.00847411,0,'Action completed, no processing required'),(241,19,0,'2019-02-14 10:51:27',0,0,0,'Run mode: GLPI'),(242,19,241,'2019-02-14 10:51:27',2,0.00853205,0,'Action completed, fully processed'),(243,23,0,'2019-02-14 10:51:48',0,0,0,'Run mode: GLPI'),(244,23,243,'2019-02-14 10:51:48',2,0.00890517,0,'Action completed, no processing required'),(245,9,0,'2019-02-15 02:27:27',0,0,0,'Run mode: GLPI'),(246,9,245,'2019-02-15 02:27:27',2,0.037477,0,'Action completed, no processing required'),(247,13,0,'2019-02-15 02:34:25',0,0,0,'Run mode: GLPI'),(248,13,247,'2019-02-15 02:34:25',2,0.00824213,0,'Action completed, no processing required'),(249,17,0,'2019-02-15 02:39:43',0,0,0,'Run mode: GLPI'),(250,17,249,'2019-02-15 02:39:43',2,0.00817204,0,'Action completed, no processing required'),(251,22,0,'2019-02-15 02:44:03',0,0,0,'Run mode: GLPI'),(252,22,251,'2019-02-15 02:44:03',2,0.00841212,0,'Action completed, no processing required'),(253,14,0,'2019-02-15 02:49:31',0,0,0,'Run mode: GLPI'),(254,14,253,'2019-02-15 02:49:31',2,0.00581503,0,'Action completed, no processing required'),(255,32,0,'2019-02-15 02:50:05',0,0,0,'Run mode: GLPI'),(256,32,255,'2019-02-15 02:50:05',2,0.00933695,0,'Action completed, no processing required'),(257,20,0,'2019-02-15 02:55:18',0,0,0,'Run mode: GLPI'),(258,20,257,'2019-02-15 02:55:18',2,0.00795794,0,'Action completed, no processing required'),(259,21,0,'2019-02-15 03:03:36',0,0,0,'Run mode: GLPI'),(260,21,259,'2019-02-15 03:03:36',2,0.00743198,0,'Action completed, no processing required'),(261,24,0,'2019-02-15 03:12:40',0,0,0,'Run mode: GLPI'),(262,24,261,'2019-02-15 03:12:40',2,0.00825191,0,'Action completed, no processing required'),(263,16,0,'2019-02-15 03:18:32',0,0,0,'Run mode: GLPI'),(264,16,263,'2019-02-15 03:18:32',2,0.00809193,0,'Action completed, no processing required'),(265,15,0,'2019-02-15 03:26:06',0,0,0,'Run mode: GLPI'),(266,15,265,'2019-02-15 03:26:06',2,0.00898409,0,'Action completed, no processing required'),(267,9,0,'2019-02-15 03:31:41',0,0,0,'Run mode: GLPI'),(268,9,267,'2019-02-15 03:31:41',2,0.030997,0,'Action completed, no processing required'),(269,17,0,'2019-02-15 03:36:54',0,0,0,'Run mode: GLPI'),(270,17,269,'2019-02-15 03:36:54',2,0.00816917,0,'Action completed, no processing required'),(271,22,0,'2019-02-15 03:39:03',0,0,0,'Run mode: GLPI'),(272,22,271,'2019-02-15 03:39:03',2,0.00853801,0,'Action completed, no processing required'),(273,32,0,'2019-02-15 03:45:10',0,0,0,'Run mode: GLPI'),(274,32,273,'2019-02-15 03:45:10',2,0.0098381,0,'Action completed, no processing required'),(275,21,0,'2019-02-15 03:50:20',0,0,0,'Run mode: GLPI'),(276,21,275,'2019-02-15 03:50:20',2,0.00616217,0,'Action completed, no processing required'),(277,13,0,'2019-02-15 03:55:39',0,0,0,'Run mode: GLPI'),(278,13,277,'2019-02-15 03:55:39',2,0.0078721,0,'Action completed, no processing required'),(279,22,0,'2019-02-15 04:01:01',0,0,0,'Run mode: GLPI'),(280,22,279,'2019-02-15 04:01:01',2,0.00891209,0,'Action completed, no processing required'),(281,9,0,'2019-02-15 04:06:20',0,0,0,'Run mode: GLPI'),(282,9,281,'2019-02-15 04:06:20',2,0.030288,0,'Action completed, no processing required'),(283,17,0,'2019-02-15 04:13:03',0,0,0,'Run mode: GLPI'),(284,17,283,'2019-02-15 04:13:03',2,0.00866604,0,'Action completed, no processing required'),(285,14,0,'2019-02-15 04:16:02',0,0,0,'Run mode: GLPI'),(286,14,285,'2019-02-15 04:16:02',2,0.0113201,0,'Action completed, no processing required'),(287,32,0,'2019-02-15 04:27:12',0,0,0,'Run mode: GLPI'),(288,32,287,'2019-02-15 04:27:12',2,0.0087471,0,'Action completed, no processing required'),(289,20,0,'2019-02-15 04:33:55',0,0,0,'Run mode: GLPI'),(290,20,289,'2019-02-15 04:33:55',2,0.00899696,0,'Action completed, no processing required'),(291,21,0,'2019-02-15 04:42:53',0,0,0,'Run mode: GLPI'),(292,21,291,'2019-02-15 04:42:53',2,0.013381,0,'Action completed, no processing required'),(293,22,0,'2019-02-15 04:48:02',0,0,0,'Run mode: GLPI'),(294,22,293,'2019-02-15 04:48:02',2,0.0101891,0,'Action completed, no processing required'),(295,24,0,'2019-02-15 04:49:27',0,0,0,'Run mode: GLPI'),(296,24,295,'2019-02-15 04:49:27',2,0.00793004,0,'Action completed, no processing required'),(297,9,0,'2019-02-15 04:57:22',0,0,0,'Run mode: GLPI'),(298,9,297,'2019-02-15 04:57:22',2,0.0311189,0,'Action completed, no processing required'),(299,17,0,'2019-02-15 04:57:29',0,0,0,'Run mode: GLPI'),(300,17,299,'2019-02-15 04:57:29',2,0.010139,0,'Action completed, no processing required'),(301,32,0,'2019-02-15 05:02:37',0,0,0,'Run mode: GLPI'),(302,32,301,'2019-02-15 05:02:37',2,0.00836587,0,'Action completed, no processing required'),(303,21,0,'2019-02-15 05:07:47',0,0,0,'Run mode: GLPI'),(304,21,303,'2019-02-15 05:07:47',2,0.00893211,0,'Action completed, no processing required'),(305,22,0,'2019-02-15 05:32:42',0,0,0,'Run mode: GLPI'),(306,22,305,'2019-02-15 05:32:42',2,0.00795913,0,'Action completed, no processing required'),(307,13,0,'2019-02-15 05:32:55',0,0,0,'Run mode: GLPI'),(308,13,307,'2019-02-15 05:32:55',2,0.00826812,0,'Action completed, no processing required'),(309,17,0,'2019-02-15 05:37:46',0,0,0,'Run mode: GLPI'),(310,17,309,'2019-02-15 05:37:46',2,0.00830102,0,'Action completed, no processing required'),(311,9,0,'2019-02-15 05:42:50',0,0,0,'Run mode: GLPI'),(312,9,311,'2019-02-15 05:42:50',2,0.030283,0,'Action completed, no processing required'),(313,32,0,'2019-02-15 05:48:07',0,0,0,'Run mode: GLPI'),(314,32,313,'2019-02-15 05:48:07',2,0.00949287,0,'Action completed, no processing required'),(315,21,0,'2019-02-15 05:53:16',0,0,0,'Run mode: GLPI'),(316,21,315,'2019-02-15 05:53:16',2,0.00922894,0,'Action completed, no processing required'),(317,14,0,'2019-02-15 05:58:22',0,0,0,'Run mode: GLPI'),(318,14,317,'2019-02-15 05:58:22',2,0.00816607,0,'Action completed, no processing required'),(319,20,0,'2019-02-15 06:03:58',0,0,0,'Run mode: GLPI'),(320,20,319,'2019-02-15 06:03:58',2,0.00922394,0,'Action completed, no processing required'),(321,22,0,'2019-02-15 06:09:14',0,0,0,'Run mode: GLPI'),(322,22,321,'2019-02-15 06:09:14',2,0.00825691,0,'Action completed, no processing required'),(323,17,0,'2019-02-15 06:14:17',0,0,0,'Run mode: GLPI'),(324,17,323,'2019-02-15 06:14:17',2,0.00946808,0,'Action completed, no processing required'),(325,24,0,'2019-02-15 06:19:44',0,0,0,'Run mode: GLPI'),(326,24,325,'2019-02-15 06:19:44',2,0.00844193,0,'Action completed, no processing required'),(327,9,0,'2019-02-15 06:25:12',0,0,0,'Run mode: GLPI'),(328,9,327,'2019-02-15 06:25:12',2,0.0316339,0,'Action completed, no processing required'),(329,32,0,'2019-02-15 06:30:26',0,0,0,'Run mode: GLPI'),(330,32,329,'2019-02-15 06:30:26',2,0.00830221,0,'Action completed, no processing required'),(331,21,0,'2019-02-15 06:35:47',0,0,0,'Run mode: GLPI'),(332,21,331,'2019-02-15 06:35:47',2,0.018445,0,'Action completed, no processing required'),(333,22,0,'2019-02-15 06:40:53',0,0,0,'Run mode: GLPI'),(334,22,333,'2019-02-15 06:40:53',2,0.00778389,0,'Action completed, no processing required'),(335,25,0,'2019-02-15 07:05:12',0,0,0,'Run mode: GLPI'),(336,25,335,'2019-02-15 07:05:12',2,0.013936,0,'Action completed, no processing required'),(337,17,0,'2019-02-15 07:10:35',0,0,0,'Run mode: GLPI'),(338,17,337,'2019-02-15 07:10:35',2,0.00856304,0,'Action completed, no processing required'),(339,13,0,'2019-02-15 08:27:14',0,0,0,'Run mode: GLPI'),(340,13,339,'2019-02-15 08:27:14',2,0.00760889,0,'Action completed, no processing required'),(341,9,0,'2019-02-15 08:27:22',0,0,0,'Run mode: GLPI'),(342,9,341,'2019-02-15 08:27:22',2,0.0321419,0,'Action completed, no processing required'),(343,32,0,'2019-02-15 08:41:10',0,0,0,'Run mode: GLPI'),(344,32,343,'2019-02-15 08:41:10',2,0.00912905,0,'Action completed, no processing required'),(345,21,0,'2019-02-15 08:49:58',0,0,0,'Run mode: GLPI'),(346,21,345,'2019-02-15 08:49:58',2,0.010344,0,'Action completed, no processing required'),(347,22,0,'2019-02-15 08:56:01',0,0,0,'Run mode: GLPI'),(348,22,347,'2019-02-15 08:56:01',2,0.01138,0,'Action completed, no processing required'),(349,14,0,'2019-02-15 09:03:44',0,0,0,'Run mode: GLPI'),(350,14,349,'2019-02-15 09:03:44',2,0.00987196,0,'Action completed, no processing required'),(351,20,0,'2019-02-15 09:10:47',0,0,0,'Run mode: GLPI'),(352,20,351,'2019-02-15 09:10:47',2,0.0101821,0,'Action completed, no processing required'),(353,17,0,'2019-02-15 09:15:48',0,0,0,'Run mode: GLPI'),(354,17,353,'2019-02-15 09:15:48',2,0.00866199,0,'Action completed, no processing required'),(355,24,0,'2019-02-15 09:26:32',0,0,0,'Run mode: GLPI'),(356,24,355,'2019-02-15 09:26:32',2,0.00605607,0,'Action completed, no processing required'),(357,9,0,'2019-02-15 09:30:44',0,0,0,'Run mode: GLPI'),(358,9,357,'2019-02-15 09:30:44',2,0.0305102,0,'Action completed, no processing required'),(359,32,0,'2019-02-15 09:34:05',0,0,0,'Run mode: GLPI'),(360,32,359,'2019-02-15 09:34:05',2,0.00912189,0,'Action completed, no processing required'),(361,21,0,'2019-02-15 09:39:21',0,0,0,'Run mode: GLPI'),(362,21,361,'2019-02-15 09:39:21',2,0.00888109,0,'Action completed, no processing required'),(363,22,0,'2019-02-15 09:44:50',0,0,0,'Run mode: GLPI'),(364,22,363,'2019-02-15 09:44:50',2,0.00815105,0,'Action completed, no processing required'),(365,17,0,'2019-02-15 09:49:05',0,0,0,'Run mode: GLPI'),(366,17,365,'2019-02-15 09:49:05',2,0.0109079,0,'Action completed, no processing required'),(367,13,0,'2019-02-15 09:52:27',0,0,0,'Run mode: GLPI'),(368,13,367,'2019-02-15 09:52:27',2,0.00800705,0,'Action completed, no processing required'),(369,32,0,'2019-02-15 09:54:05',0,0,0,'Run mode: GLPI'),(370,32,369,'2019-02-15 09:54:05',2,0.009022,0,'Action completed, no processing required'),(371,9,0,'2019-02-15 09:58:13',0,0,0,'Run mode: GLPI'),(372,9,371,'2019-02-15 09:58:13',2,0.039145,0,'Action completed, no processing required'),(373,5,0,'2019-02-15 10:04:46',0,0,0,'Run mode: GLPI'),(374,5,373,'2019-02-15 10:04:46',2,0.00843,0,'Action completed, no processing required'),(375,21,0,'2019-02-15 10:14:23',0,0,0,'Run mode: GLPI'),(376,21,375,'2019-02-15 10:14:23',2,0.00838304,0,'Action completed, no processing required'),(377,22,0,'2019-02-15 10:58:42',0,0,0,'Run mode: GLPI'),(378,22,377,'2019-02-15 10:58:42',2,0.00826001,0,'Action completed, no processing required'),(379,6,0,'2019-02-15 11:05:44',0,0,0,'Run mode: GLPI'),(380,6,379,'2019-02-15 11:05:44',2,0.00913191,0,'Action completed, no processing required'),(381,17,0,'2019-02-15 11:06:47',0,0,0,'Run mode: GLPI'),(382,17,381,'2019-02-15 11:06:47',2,0.00921798,0,'Action completed, no processing required'),(383,32,0,'2019-02-15 11:07:09',0,0,0,'Run mode: GLPI'),(384,32,383,'2019-02-15 11:07:09',2,0.00874305,0,'Action completed, no processing required'),(385,14,0,'2019-02-15 11:15:27',0,0,0,'Run mode: GLPI'),(386,14,385,'2019-02-15 11:15:27',2,0.00965309,0,'Action completed, no processing required'),(387,9,0,'2019-02-18 02:44:52',0,0,0,'Run mode: GLPI'),(388,9,387,'2019-02-18 02:44:52',2,0.0382719,0,'Action completed, no processing required'),(389,20,0,'2019-02-18 02:50:41',0,0,0,'Run mode: GLPI'),(390,20,389,'2019-02-18 02:50:41',2,0.008883,0,'Action completed, no processing required'),(391,21,0,'2019-02-18 02:56:05',0,0,0,'Run mode: GLPI'),(392,21,391,'2019-02-18 02:56:05',2,0.00682902,0,'Action completed, no processing required'),(393,12,0,'2019-02-18 03:21:08',0,0,0,'Run mode: GLPI'),(394,12,393,'2019-02-18 03:21:08',1,0.00895309,154,'Очистить 154 файлы сеансов созданные больше чем 1440 секунд\n'),(395,12,393,'2019-02-18 03:21:08',2,0.0173442,154,'Action completed, fully processed'),(396,24,0,'2019-02-18 04:37:05',0,0,0,'Run mode: GLPI'),(397,24,396,'2019-02-18 04:37:05',1,0.0086,1,'Очистить 1 временный файл созданный больше чем 3600 секунд\n'),(398,24,396,'2019-02-18 04:37:05',2,0.0188491,1,'Action completed, fully processed'),(399,18,0,'2019-02-18 04:42:28',0,0,0,'Run mode: GLPI'),(400,18,399,'2019-02-18 04:42:28',2,0.0102501,0,'Action completed, no processing required'),(401,19,0,'2019-02-18 04:54:27',0,0,0,'Run mode: GLPI'),(402,19,401,'2019-02-18 04:54:27',2,0.00828505,0,'Action completed, fully processed'),(403,23,0,'2019-02-18 05:01:33',0,0,0,'Run mode: GLPI'),(404,23,403,'2019-02-18 05:01:33',2,0.00889897,0,'Action completed, no processing required'),(405,13,0,'2019-02-18 05:10:42',0,0,0,'Run mode: GLPI'),(406,13,405,'2019-02-18 05:10:42',2,0.00823188,0,'Action completed, no processing required'),(407,22,0,'2019-02-18 05:11:17',0,0,0,'Run mode: GLPI'),(408,22,407,'2019-02-18 05:11:17',2,0.0088079,0,'Action completed, no processing required'),(409,17,0,'2019-02-18 05:17:47',0,0,0,'Run mode: GLPI'),(410,17,409,'2019-02-18 05:17:47',2,0.00867391,0,'Action completed, no processing required'),(411,32,0,'2019-02-18 05:17:52',0,0,0,'Run mode: GLPI'),(412,32,411,'2019-02-18 05:17:52',2,0.0097661,0,'Action completed, no processing required'),(413,14,0,'2019-02-18 06:10:24',0,0,0,'Run mode: GLPI'),(414,14,413,'2019-02-18 06:10:24',2,0.00830412,0,'Action completed, no processing required'),(415,16,0,'2019-02-18 08:21:00',0,0,0,'Run mode: GLPI'),(416,16,415,'2019-02-18 08:21:00',2,0.00829411,0,'Action completed, no processing required'),(417,15,0,'2019-02-19 04:42:22',0,0,0,'Run mode: GLPI'),(418,15,417,'2019-02-19 04:42:22',2,0.00861001,0,'Action completed, no processing required'),(419,25,0,'2019-02-19 04:50:02',0,0,0,'Run mode: GLPI'),(420,25,419,'2019-02-19 04:50:02',2,0.00919509,0,'Action completed, no processing required'),(421,5,0,'2019-02-19 04:58:07',0,0,0,'Run mode: GLPI'),(422,5,421,'2019-02-19 04:58:07',2,0.0101521,0,'Action completed, no processing required'),(423,6,0,'2019-02-19 05:04:47',0,0,0,'Run mode: GLPI'),(424,6,423,'2019-02-19 05:04:47',2,0.00875783,0,'Action completed, no processing required'),(425,9,0,'2019-02-19 05:36:47',0,0,0,'Run mode: GLPI'),(426,9,425,'2019-02-19 05:36:47',2,0.0341229,0,'Action completed, no processing required'),(427,21,0,'2019-02-19 05:51:08',0,0,0,'Run mode: GLPI'),(428,21,427,'2019-02-19 05:51:08',2,0.00852108,0,'Action completed, no processing required'),(429,20,0,'2019-02-19 05:58:50',0,0,0,'Run mode: GLPI'),(430,20,429,'2019-02-19 05:58:50',2,0.00891304,0,'Action completed, no processing required'),(431,22,0,'2019-02-19 06:44:47',0,0,0,'Run mode: GLPI'),(432,22,431,'2019-02-19 06:44:47',2,0.00873399,0,'Action completed, no processing required'),(433,17,0,'2019-02-20 10:56:28',0,0,0,'Run mode: GLPI'),(434,17,433,'2019-02-20 10:56:28',2,0.0180562,0,'Action completed, no processing required'),(435,32,0,'2019-02-21 02:26:17',0,0,0,'Run mode: GLPI'),(436,32,435,'2019-02-21 02:26:17',2,0.016947,0,'Action completed, no processing required'),(437,24,0,'2019-02-21 03:11:39',0,0,0,'Run mode: GLPI'),(438,24,437,'2019-02-21 03:11:39',2,0.0156219,0,'Action completed, no processing required'),(439,13,0,'2019-02-21 05:26:42',0,0,0,'Run mode: GLPI'),(440,13,439,'2019-02-21 05:26:42',2,0.017602,0,'Action completed, no processing required'),(441,14,0,'2019-02-21 06:32:38',0,0,0,'Run mode: GLPI'),(442,14,441,'2019-02-21 06:32:38',2,0.0254879,0,'Action completed, no processing required'),(443,16,0,'2019-02-21 09:40:35',0,0,0,'Run mode: GLPI'),(444,16,443,'2019-02-21 09:40:35',2,0.022408,0,'Action completed, no processing required'),(445,12,0,'2019-02-21 09:46:52',0,0,0,'Run mode: GLPI'),(446,12,445,'2019-02-21 09:46:52',1,0.0175672,154,'Очистить 154 файлы сеансов созданные больше чем 1440 секунд\n'),(447,12,445,'2019-02-21 09:46:52',2,0.0293071,154,'Action completed, fully processed'),(448,18,0,'2019-02-21 10:09:57',0,0,0,'Run mode: GLPI'),(449,18,448,'2019-02-21 10:09:57',2,0.021667,0,'Action completed, no processing required'),(450,19,0,'2019-02-21 10:14:57',0,0,0,'Run mode: GLPI'),(451,19,450,'2019-02-21 10:14:57',2,0.0175519,0,'Action completed, fully processed'),(452,23,0,'2019-02-21 10:21:22',0,0,0,'Run mode: GLPI'),(453,23,452,'2019-02-21 10:21:22',2,0.0156021,0,'Action completed, no processing required'),(454,9,0,'2019-02-21 10:29:08',0,0,0,'Run mode: GLPI'),(455,9,454,'2019-02-21 10:29:08',2,0.037354,0,'Action completed, no processing required'),(456,21,0,'2019-02-21 10:34:12',0,0,0,'Run mode: GLPI'),(457,21,456,'2019-02-21 10:34:12',2,0.0143709,0,'Action completed, no processing required'),(458,22,0,'2019-02-21 10:41:14',0,0,0,'Run mode: GLPI'),(459,22,458,'2019-02-21 10:41:14',2,0.0125859,0,'Action completed, no processing required'),(460,20,0,'2019-02-21 10:46:42',0,0,0,'Run mode: GLPI'),(461,20,460,'2019-02-21 10:46:42',2,0.013483,0,'Action completed, no processing required'),(462,15,0,'2019-02-21 10:53:18',0,0,0,'Run mode: GLPI'),(463,15,462,'2019-02-21 10:53:18',2,0.017101,0,'Action completed, no processing required'),(464,25,0,'2019-02-22 04:15:53',0,0,0,'Run mode: GLPI'),(465,25,464,'2019-02-22 04:15:53',2,0.012871,0,'Action completed, no processing required'),(466,5,0,'2019-02-22 04:31:40',0,0,0,'Run mode: GLPI'),(467,5,466,'2019-02-22 04:31:40',2,0.0181479,0,'Action completed, no processing required'),(468,6,0,'2019-02-22 04:38:27',0,0,0,'Run mode: GLPI'),(469,6,468,'2019-02-22 04:38:27',2,0.016917,0,'Action completed, no processing required'),(470,17,0,'2019-02-22 04:49:27',0,0,0,'Run mode: GLPI'),(471,17,470,'2019-02-22 04:49:27',2,0.0129509,0,'Action completed, no processing required'),(472,32,0,'2019-02-22 05:26:14',0,0,0,'Run mode: GLPI'),(473,32,472,'2019-02-22 05:26:14',2,0.0135689,0,'Action completed, no processing required'),(474,24,0,'2019-02-22 05:38:05',0,0,0,'Run mode: GLPI'),(475,24,474,'2019-02-22 05:38:05',2,0.0123491,0,'Action completed, no processing required'),(476,13,0,'2019-02-22 05:43:23',0,0,0,'Run mode: GLPI'),(477,13,476,'2019-02-22 05:43:23',2,0.013391,0,'Action completed, no processing required'),(478,14,0,'2019-02-22 05:48:47',0,0,0,'Run mode: GLPI'),(479,14,478,'2019-02-22 05:48:47',2,0.0183151,0,'Action completed, no processing required'),(480,9,0,'2019-02-22 06:03:21',0,0,0,'Run mode: GLPI'),(481,9,480,'2019-02-22 06:03:21',2,0.035322,0,'Action completed, no processing required'),(482,21,0,'2019-02-22 06:12:33',0,0,0,'Run mode: GLPI'),(483,21,482,'2019-02-22 06:12:33',2,0.0136762,0,'Action completed, no processing required'),(484,22,0,'2019-02-22 06:18:27',0,0,0,'Run mode: GLPI'),(485,22,484,'2019-02-22 06:18:27',2,0.025255,0,'Action completed, no processing required'),(486,20,0,'2019-02-22 06:23:30',0,0,0,'Run mode: GLPI'),(487,20,486,'2019-02-22 06:23:30',2,0.0135062,0,'Action completed, no processing required'),(488,16,0,'2019-02-22 06:36:40',0,0,0,'Run mode: GLPI'),(489,16,488,'2019-02-22 06:36:40',2,0.0360129,0,'Action completed, no processing required'),(490,15,0,'2019-02-22 06:38:40',0,0,0,'Run mode: GLPI'),(491,15,490,'2019-02-22 06:38:40',2,0.018512,0,'Action completed, no processing required'),(492,17,0,'2019-02-22 07:48:18',0,0,0,'Run mode: GLPI'),(493,17,492,'2019-02-22 07:48:18',2,0.0144849,0,'Action completed, no processing required'),(494,32,0,'2019-02-22 07:55:25',0,0,0,'Run mode: GLPI'),(495,32,494,'2019-02-22 07:55:25',2,0.0136731,0,'Action completed, no processing required'),(496,9,0,'2019-02-22 08:11:03',0,0,0,'Run mode: GLPI'),(497,9,496,'2019-02-22 08:11:03',2,0.0476301,0,'Action completed, no processing required'),(498,21,0,'2019-02-22 08:16:17',0,0,0,'Run mode: GLPI'),(499,21,498,'2019-02-22 08:16:17',2,0.0148668,0,'Action completed, no processing required'),(500,22,0,'2019-02-22 08:20:44',0,0,0,'Run mode: GLPI'),(501,22,500,'2019-02-22 08:20:44',2,0.013423,0,'Action completed, no processing required'),(502,24,0,'2019-02-22 08:26:09',0,0,0,'Run mode: GLPI'),(503,24,502,'2019-02-22 08:26:09',2,0.0133269,0,'Action completed, no processing required'),(504,13,0,'2019-02-22 08:27:02',0,0,0,'Run mode: GLPI'),(505,13,504,'2019-02-22 08:27:02',2,0.012779,0,'Action completed, no processing required'),(506,14,0,'2019-02-22 08:31:56',0,0,0,'Run mode: GLPI'),(507,14,506,'2019-02-22 08:31:56',2,0.034899,0,'Action completed, no processing required'),(508,20,0,'2019-02-22 08:33:13',0,0,0,'Run mode: GLPI'),(509,20,508,'2019-02-22 08:33:13',2,0.0142212,0,'Action completed, no processing required'),(510,17,0,'2019-02-22 08:38:15',0,0,0,'Run mode: GLPI'),(511,17,510,'2019-02-22 08:38:15',2,0.014008,0,'Action completed, no processing required'),(512,32,0,'2019-02-22 08:40:54',0,0,0,'Run mode: GLPI'),(513,32,512,'2019-02-22 08:40:54',2,0.0130379,0,'Action completed, no processing required'),(514,9,0,'2019-02-22 08:46:08',0,0,0,'Run mode: GLPI'),(515,9,514,'2019-02-22 08:46:08',2,0.0348301,0,'Action completed, no processing required'),(516,21,0,'2019-02-22 08:51:13',0,0,0,'Run mode: GLPI'),(517,21,516,'2019-02-22 08:51:13',2,0.0151379,0,'Action completed, no processing required'),(518,22,0,'2019-02-22 09:54:01',0,0,0,'Run mode: GLPI'),(519,22,518,'2019-02-22 09:54:01',2,0.015135,0,'Action completed, no processing required'),(520,17,0,'2019-02-22 09:55:29',0,0,0,'Run mode: GLPI'),(521,17,520,'2019-02-22 09:55:29',2,0.0125899,0,'Action completed, no processing required'),(522,32,0,'2019-02-22 09:59:09',0,0,0,'Run mode: GLPI'),(523,32,522,'2019-02-22 09:59:09',2,0.01246,0,'Action completed, no processing required'),(524,9,0,'2019-02-22 10:07:34',0,0,0,'Run mode: GLPI'),(525,9,524,'2019-02-22 10:07:34',2,0.03546,0,'Action completed, no processing required'),(526,21,0,'2019-02-22 10:12:53',0,0,0,'Run mode: GLPI'),(527,21,526,'2019-02-22 10:12:53',2,0.015373,0,'Action completed, no processing required'),(528,24,0,'2019-02-22 10:16:44',0,0,0,'Run mode: GLPI'),(529,24,528,'2019-02-22 10:16:44',2,0.0123742,0,'Action completed, no processing required'),(530,13,0,'2019-02-22 10:24:19',0,0,0,'Run mode: GLPI'),(531,13,530,'2019-02-22 10:24:19',2,0.0123661,0,'Action completed, no processing required'),(532,14,0,'2019-02-22 10:31:45',0,0,0,'Run mode: GLPI'),(533,14,532,'2019-02-22 10:31:45',2,0.0156209,0,'Action completed, no processing required'),(534,20,0,'2019-02-22 10:37:03',0,0,0,'Run mode: GLPI'),(535,20,534,'2019-02-22 10:37:03',2,0.012892,0,'Action completed, no processing required'),(536,12,0,'2019-02-22 10:43:55',0,0,0,'Run mode: GLPI'),(537,12,536,'2019-02-22 10:43:55',1,0.0101261,35,'Очистить 35 файлы сеансов созданные больше чем 1440 секунд\n'),(538,12,536,'2019-02-22 10:43:55',2,0.0249791,35,'Action completed, fully processed'),(539,22,0,'2019-02-22 10:49:52',0,0,0,'Run mode: GLPI'),(540,22,539,'2019-02-22 10:49:52',2,0.013031,0,'Action completed, no processing required'),(541,17,0,'2019-02-22 10:52:35',0,0,0,'Run mode: GLPI'),(542,17,541,'2019-02-22 10:52:35',2,0.013366,0,'Action completed, no processing required'),(543,32,0,'2019-02-22 10:54:55',0,0,0,'Run mode: GLPI'),(544,32,543,'2019-02-22 10:54:55',2,0.0126171,0,'Action completed, no processing required'),(545,18,0,'2019-02-22 10:59:23',0,0,0,'Run mode: GLPI'),(546,18,545,'2019-02-22 10:59:23',2,0.0189691,0,'Action completed, no processing required'),(547,19,0,'2019-02-22 11:00:25',0,0,0,'Run mode: GLPI'),(548,19,547,'2019-02-22 11:00:25',2,0.0130341,0,'Action completed, fully processed'),(549,9,0,'2019-02-22 11:01:48',0,0,0,'Run mode: GLPI'),(550,9,549,'2019-02-22 11:01:48',2,0.034523,0,'Action completed, no processing required'),(551,21,0,'2019-02-22 11:02:47',0,0,0,'Run mode: GLPI'),(552,21,551,'2019-02-22 11:02:47',2,0.01526,0,'Action completed, no processing required'),(553,23,0,'2019-02-22 11:14:53',0,0,0,'Run mode: GLPI'),(554,23,553,'2019-02-22 11:14:53',2,0.013164,0,'Action completed, no processing required'),(555,22,0,'2019-02-22 11:20:11',0,0,0,'Run mode: GLPI'),(556,22,555,'2019-02-22 11:20:11',2,0.0205202,0,'Action completed, no processing required'),(557,17,0,'2019-02-22 11:24:53',0,0,0,'Run mode: GLPI'),(558,17,557,'2019-02-22 11:24:53',2,0.014164,0,'Action completed, no processing required'),(559,32,0,'2019-02-22 11:25:03',0,0,0,'Run mode: GLPI'),(560,32,559,'2019-02-22 11:25:03',2,0.0131741,0,'Action completed, no processing required'),(561,21,0,'2019-02-22 11:30:27',0,0,0,'Run mode: GLPI'),(562,21,561,'2019-02-22 11:30:27',2,0.013551,0,'Action completed, no processing required'),(563,9,0,'2019-02-22 11:30:32',0,0,0,'Run mode: GLPI'),(564,9,563,'2019-02-22 11:30:32',2,0.036026,0,'Action completed, no processing required'),(565,24,0,'2019-02-25 02:35:01',0,0,0,'Run mode: GLPI'),(566,24,565,'2019-02-25 02:35:01',2,0.0129669,0,'Action completed, no processing required'),(567,22,0,'2019-02-25 02:44:36',0,0,0,'Run mode: GLPI'),(568,22,567,'2019-02-25 02:44:36',2,0.0142741,0,'Action completed, no processing required'),(569,13,0,'2019-02-25 02:50:38',0,0,0,'Run mode: GLPI'),(570,13,569,'2019-02-25 02:50:38',2,0.01211,0,'Action completed, no processing required'),(571,17,0,'2019-02-25 02:52:35',0,0,0,'Run mode: GLPI'),(572,17,571,'2019-02-25 02:52:35',2,0.0145972,0,'Action completed, no processing required'),(573,32,0,'2019-02-25 02:57:41',0,0,0,'Run mode: GLPI'),(574,32,573,'2019-02-25 02:57:41',2,0.0130341,0,'Action completed, no processing required'),(575,14,0,'2019-02-25 02:57:49',0,0,0,'Run mode: GLPI'),(576,14,575,'2019-02-25 02:57:49',2,0.0159659,0,'Action completed, no processing required'),(577,21,0,'2019-02-25 03:03:30',0,0,0,'Run mode: GLPI'),(578,21,577,'2019-02-25 03:03:30',2,0.0153041,0,'Action completed, no processing required'),(579,20,0,'2019-02-25 03:09:44',0,0,0,'Run mode: GLPI'),(580,20,579,'2019-02-25 03:09:44',2,0.0129471,0,'Action completed, no processing required'),(581,9,0,'2019-02-25 03:10:20',0,0,0,'Run mode: GLPI'),(582,9,581,'2019-02-25 03:10:20',2,0.03581,0,'Action completed, no processing required'),(583,16,0,'2019-02-25 03:15:23',0,0,0,'Run mode: GLPI'),(584,16,583,'2019-02-25 03:15:23',2,0.022567,0,'Action completed, no processing required'),(585,15,0,'2019-02-25 03:15:55',0,0,0,'Run mode: GLPI'),(586,15,585,'2019-02-25 03:15:55',2,0.0159092,0,'Action completed, no processing required'),(587,25,0,'2019-02-25 03:21:44',0,0,0,'Run mode: GLPI'),(588,25,587,'2019-02-25 03:21:44',2,0.012208,0,'Action completed, no processing required'),(589,5,0,'2019-02-25 04:14:52',0,0,0,'Run mode: GLPI'),(590,5,589,'2019-02-25 04:14:52',2,0.0184729,0,'Action completed, no processing required'),(591,6,0,'2019-02-25 04:21:08',0,0,0,'Run mode: GLPI'),(592,6,591,'2019-02-25 04:21:08',2,0.0195611,0,'Action completed, no processing required'),(593,12,0,'2019-02-25 04:27:15',0,0,0,'Run mode: GLPI'),(594,12,593,'2019-02-25 04:27:15',1,0.0162039,263,'Очистить 263 файлы сеансов созданные больше чем 1440 секунд\n'),(595,12,593,'2019-02-25 04:27:15',2,0.0244548,263,'Action completed, fully processed'),(596,18,0,'2019-02-25 04:40:52',0,0,0,'Run mode: GLPI'),(597,18,596,'2019-02-25 04:40:52',2,0.019748,0,'Action completed, no processing required'),(598,19,0,'2019-02-25 04:51:11',0,0,0,'Run mode: GLPI'),(599,19,598,'2019-02-25 04:51:11',2,0.0133069,0,'Action completed, fully processed'),(600,23,0,'2019-02-25 04:56:27',0,0,0,'Run mode: GLPI'),(601,23,600,'2019-02-25 04:56:27',2,0.0131459,0,'Action completed, no processing required'),(602,22,0,'2019-02-25 05:01:57',0,0,0,'Run mode: GLPI'),(603,22,602,'2019-02-25 05:01:57',2,0.014364,0,'Action completed, no processing required'),(604,17,0,'2019-02-25 05:12:01',0,0,0,'Run mode: GLPI'),(605,17,604,'2019-02-25 05:12:01',2,0.0130858,0,'Action completed, no processing required'),(606,32,0,'2019-02-25 05:17:20',0,0,0,'Run mode: GLPI'),(607,32,606,'2019-02-25 05:17:20',2,0.0160711,0,'Action completed, no processing required'),(608,21,0,'2019-02-25 05:24:22',0,0,0,'Run mode: GLPI'),(609,21,608,'2019-02-25 05:24:22',2,0.0180149,0,'Action completed, no processing required'),(610,9,0,'2019-02-25 05:29:36',0,0,0,'Run mode: GLPI'),(611,9,610,'2019-02-25 05:29:36',2,0.043283,0,'Action completed, no processing required'),(612,24,0,'2019-02-25 05:38:36',0,0,0,'Run mode: GLPI'),(613,24,612,'2019-02-25 05:38:36',2,0.01582,0,'Action completed, no processing required'),(614,13,0,'2019-02-25 06:00:03',0,0,0,'Run mode: GLPI'),(615,13,614,'2019-02-25 06:00:03',2,0.0170531,0,'Action completed, no processing required'),(616,14,0,'2019-02-25 08:36:32',0,0,0,'Run mode: GLPI'),(617,14,616,'2019-02-25 08:36:32',2,0.01967,0,'Action completed, no processing required'),(618,20,0,'2019-02-25 08:46:04',0,0,0,'Run mode: GLPI'),(619,20,618,'2019-02-25 08:46:04',2,0.0164261,0,'Action completed, no processing required'),(620,22,0,'2019-02-25 08:57:36',0,0,0,'Run mode: GLPI'),(621,22,620,'2019-02-25 08:57:36',2,0.018575,0,'Action completed, no processing required'),(622,17,0,'2019-02-25 09:11:14',0,0,0,'Run mode: GLPI'),(623,17,622,'2019-02-25 09:11:14',2,0.0157821,0,'Action completed, no processing required'),(624,32,0,'2019-02-25 09:32:28',0,0,0,'Run mode: GLPI'),(625,32,624,'2019-02-25 09:32:28',2,0.015928,0,'Action completed, no processing required'),(626,21,0,'2019-02-25 09:50:35',0,0,0,'Run mode: GLPI'),(627,21,626,'2019-02-25 09:50:35',2,0.0174568,0,'Action completed, no processing required'),(628,9,0,'2019-02-25 10:16:40',0,0,0,'Run mode: GLPI'),(629,9,628,'2019-02-25 10:16:40',2,0.0519531,0,'Action completed, no processing required'),(630,24,0,'2019-02-25 10:57:01',0,0,0,'Run mode: GLPI'),(631,24,630,'2019-02-25 10:57:01',2,0.018549,0,'Action completed, no processing required'),(632,13,0,'2019-02-25 11:15:22',0,0,0,'Run mode: GLPI'),(633,13,632,'2019-02-25 11:15:22',2,0.0318742,0,'Action completed, no processing required'),(634,22,0,'2019-02-26 03:38:01',0,0,0,'Run mode: GLPI'),(635,22,634,'2019-02-26 03:38:01',2,0.02618,0,'Action completed, no processing required'),(636,17,0,'2019-02-26 05:29:07',0,0,0,'Run mode: GLPI'),(637,17,636,'2019-02-26 05:29:07',2,0.017415,0,'Action completed, no processing required'),(638,14,0,'2019-02-26 05:33:32',0,0,0,'Run mode: GLPI'),(639,14,638,'2019-02-26 05:33:32',2,0.0189979,0,'Action completed, no processing required'),(640,32,0,'2019-02-26 05:39:11',0,0,0,'Run mode: GLPI'),(641,32,640,'2019-02-26 05:39:11',2,0.0162451,0,'Action completed, no processing required'),(642,20,0,'2019-02-26 06:16:05',0,0,0,'Run mode: GLPI'),(643,20,642,'2019-02-26 06:16:05',2,0.021723,0,'Action completed, no processing required'),(644,21,0,'2019-02-26 06:30:25',0,0,0,'Run mode: GLPI'),(645,21,644,'2019-02-26 06:30:25',2,0.016588,0,'Action completed, no processing required'),(646,9,0,'2019-02-26 08:33:51',0,0,0,'Run mode: GLPI'),(647,9,646,'2019-02-26 08:33:51',2,0.038368,0,'Action completed, no processing required'),(648,24,0,'2019-02-26 08:46:54',0,0,0,'Run mode: GLPI'),(649,24,648,'2019-02-26 08:46:54',2,0.015713,0,'Action completed, no processing required'),(650,13,0,'2019-02-26 08:54:59',0,0,0,'Run mode: GLPI'),(651,13,650,'2019-02-26 08:54:59',2,0.0155439,0,'Action completed, no processing required'),(652,15,0,'2019-02-26 09:28:15',0,0,0,'Run mode: GLPI'),(653,15,652,'2019-02-26 09:28:15',2,0.02215,0,'Action completed, no processing required'),(654,16,0,'2019-02-26 09:40:52',0,0,0,'Run mode: GLPI'),(655,16,654,'2019-02-26 09:40:52',2,0.023989,0,'Action completed, no processing required'),(656,25,0,'2019-02-26 09:46:55',0,0,0,'Run mode: GLPI'),(657,25,656,'2019-02-26 09:46:55',2,0.0156741,0,'Action completed, no processing required'),(658,22,0,'2019-02-26 09:47:44',0,0,0,'Run mode: GLPI'),(659,22,658,'2019-02-26 09:47:44',2,0.0180712,0,'Action completed, no processing required'),(660,5,0,'2019-02-26 09:53:52',0,0,0,'Run mode: GLPI'),(661,5,660,'2019-02-26 09:53:52',2,0.020879,0,'Action completed, no processing required'),(662,6,0,'2019-02-26 10:01:19',0,0,0,'Run mode: GLPI'),(663,6,662,'2019-02-26 10:01:19',2,0.0178292,0,'Action completed, no processing required'),(664,12,0,'2019-02-26 10:15:32',0,0,0,'Run mode: GLPI'),(665,12,664,'2019-02-26 10:15:32',1,0.0139871,46,'Очистить 46 файлы сеансов созданные больше чем 1440 секунд\n'),(666,12,664,'2019-02-26 10:15:32',2,0.0221729,46,'Action completed, fully processed'),(667,18,0,'2019-02-26 10:30:43',0,0,0,'Run mode: GLPI'),(668,18,667,'2019-02-26 10:30:43',2,0.0221791,0,'Action completed, no processing required'),(669,19,0,'2019-02-27 09:28:15',0,0,0,'Run mode: GLPI'),(670,19,669,'2019-02-27 09:28:15',2,0.0161009,0,'Action completed, fully processed'),(671,23,0,'2019-02-27 10:50:25',0,0,0,'Run mode: GLPI'),(672,23,671,'2019-02-27 10:50:25',2,0.016161,0,'Action completed, no processing required'),(673,17,0,'2019-02-27 10:55:51',0,0,0,'Run mode: GLPI'),(674,17,673,'2019-02-27 10:55:51',2,0.0167561,0,'Action completed, no processing required'),(675,32,0,'2019-02-27 11:07:56',0,0,0,'Run mode: GLPI'),(676,32,675,'2019-02-27 11:07:56',2,0.0164418,0,'Action completed, no processing required'),(677,14,0,'2019-02-27 11:22:50',0,0,0,'Run mode: GLPI'),(678,14,677,'2019-02-27 11:22:50',2,0.020422,0,'Action completed, no processing required'),(679,21,0,'2019-02-27 16:54:27',0,0,0,'Run mode: GLPI'),(680,21,679,'2019-02-27 16:54:27',2,0.0165782,0,'Action completed, no processing required'),(681,20,0,'2019-02-28 21:34:55',0,0,0,'Run mode: GLPI'),(682,20,681,'2019-02-28 21:34:55',2,0.0158501,0,'Action completed, no processing required'),(683,9,0,'2019-03-01 03:03:28',0,0,0,'Run mode: GLPI'),(684,9,683,'2019-03-01 03:03:28',2,0.0478981,0,'Action completed, no processing required'),(685,24,0,'2019-03-01 03:13:10',0,0,0,'Run mode: GLPI'),(686,24,685,'2019-03-01 03:13:10',2,0.0186942,0,'Action completed, no processing required'),(687,22,0,'2019-03-01 03:20:04',0,0,0,'Run mode: GLPI'),(688,22,687,'2019-03-01 03:20:04',2,0.0192111,0,'Action completed, no processing required'),(689,13,0,'2019-03-01 03:25:53',0,0,0,'Run mode: GLPI'),(690,13,689,'2019-03-01 03:25:53',2,0.0155048,0,'Action completed, no processing required'),(691,15,0,'2019-03-01 03:31:14',0,0,0,'Run mode: GLPI'),(692,15,691,'2019-03-01 03:31:14',2,0.02198,0,'Action completed, no processing required'),(693,16,0,'2019-03-01 03:44:02',0,0,0,'Run mode: GLPI'),(694,16,693,'2019-03-01 03:44:02',2,0.020261,0,'Action completed, no processing required'),(695,25,0,'2019-03-01 04:32:29',0,0,0,'Run mode: GLPI'),(696,25,695,'2019-03-01 04:32:29',2,0.015928,0,'Action completed, no processing required'),(697,5,0,'2019-03-01 04:42:07',0,0,0,'Run mode: GLPI'),(698,5,697,'2019-03-01 04:42:07',2,0.0200882,0,'Action completed, no processing required'),(699,6,0,'2019-03-01 04:55:10',0,0,0,'Run mode: GLPI'),(700,6,699,'2019-03-01 04:55:10',2,0.00897884,0,'Action completed, no processing required'),(701,12,0,'2019-03-01 05:17:59',0,0,0,'Run mode: GLPI'),(702,12,701,'2019-03-01 05:17:59',1,0.00928092,122,'Очистить 122 файлы сеансов созданные больше чем 1440 секунд\n'),(703,12,701,'2019-03-01 05:17:59',2,0.017961,122,'Action completed, fully processed'),(704,18,0,'2019-03-01 05:45:17',0,0,0,'Run mode: GLPI'),(705,18,704,'2019-03-01 05:45:17',2,0.00924802,0,'Action completed, no processing required'),(706,17,0,'2019-03-01 06:23:48',0,0,0,'Run mode: GLPI'),(707,17,706,'2019-03-01 06:23:48',2,0.010097,0,'Action completed, no processing required'),(708,32,0,'2019-03-01 06:40:51',0,0,0,'Run mode: GLPI'),(709,32,708,'2019-03-01 06:40:51',2,0.00904703,0,'Action completed, no processing required'),(710,14,0,'2019-03-01 07:48:41',0,0,0,'Run mode: GLPI'),(711,14,710,'2019-03-01 07:48:41',2,0.0103121,0,'Action completed, no processing required'),(712,21,0,'2019-03-01 07:53:46',0,0,0,'Run mode: GLPI'),(713,21,712,'2019-03-01 07:53:46',2,0.00987411,0,'Action completed, no processing required'),(714,19,0,'2019-03-01 07:58:58',0,0,0,'Run mode: GLPI'),(715,19,714,'2019-03-01 07:58:58',2,0.00853801,0,'Action completed, fully processed'),(716,23,0,'2019-03-01 08:04:08',0,0,0,'Run mode: GLPI'),(717,23,716,'2019-03-01 08:04:08',2,0.0111859,0,'Action completed, no processing required'),(718,20,0,'2019-03-01 08:26:34',0,0,0,'Run mode: GLPI'),(719,20,718,'2019-03-01 08:26:34',2,0.00848413,0,'Action completed, no processing required'),(720,9,0,'2019-03-01 08:35:59',0,0,0,'Run mode: GLPI'),(721,9,720,'2019-03-01 08:35:59',2,0.0336211,0,'Action completed, no processing required'),(722,22,0,'2019-03-01 08:42:36',0,0,0,'Run mode: GLPI'),(723,22,722,'2019-03-01 08:42:36',2,0.0142522,0,'Action completed, no processing required'),(724,24,0,'2019-03-01 08:50:21',0,0,0,'Run mode: GLPI'),(725,24,724,'2019-03-01 08:50:21',2,0.00933695,0,'Action completed, no processing required'),(726,13,0,'2019-03-01 08:59:02',0,0,0,'Run mode: GLPI'),(727,13,726,'2019-03-01 08:59:02',2,0.00920677,0,'Action completed, no processing required'),(728,17,0,'2019-03-01 09:10:41',0,0,0,'Run mode: GLPI'),(729,17,728,'2019-03-01 09:10:41',2,0.00974703,0,'Action completed, no processing required'),(730,32,0,'2019-03-01 09:19:03',0,0,0,'Run mode: GLPI'),(731,32,730,'2019-03-01 09:19:03',2,0.0101042,0,'Action completed, no processing required'),(732,21,0,'2019-03-01 09:41:49',0,0,0,'Run mode: GLPI'),(733,21,732,'2019-03-01 09:41:49',2,0.00913405,0,'Action completed, no processing required'),(734,22,0,'2019-03-01 09:47:59',0,0,0,'Run mode: GLPI'),(735,22,734,'2019-03-01 09:47:59',2,0.00919104,0,'Action completed, no processing required'),(736,9,0,'2019-03-01 10:05:45',0,0,0,'Run mode: GLPI'),(737,9,736,'2019-03-01 10:05:45',2,0.033813,0,'Action completed, no processing required'),(738,14,0,'2019-03-01 10:14:12',0,0,0,'Run mode: GLPI'),(739,14,738,'2019-03-01 10:14:12',2,0.00995207,0,'Action completed, no processing required'),(740,17,0,'2019-03-01 10:21:34',0,0,0,'Run mode: GLPI'),(741,17,740,'2019-03-01 10:21:34',2,0.00871992,0,'Action completed, no processing required'),(742,32,0,'2019-03-01 10:35:26',0,0,0,'Run mode: GLPI'),(743,32,742,'2019-03-01 10:35:26',2,0.00982904,0,'Action completed, no processing required'),(744,20,0,'2019-03-01 10:42:18',0,0,0,'Run mode: GLPI'),(745,20,744,'2019-03-01 10:42:18',2,0.0096271,0,'Action completed, no processing required'),(746,21,0,'2019-03-01 10:50:01',0,0,0,'Run mode: GLPI'),(747,21,746,'2019-03-01 10:50:01',2,0.00850296,0,'Action completed, no processing required'),(748,22,0,'2019-03-01 10:55:13',0,0,0,'Run mode: GLPI'),(749,22,748,'2019-03-01 10:55:13',2,0.01002,0,'Action completed, no processing required'),(750,24,0,'2019-03-01 11:00:19',0,0,0,'Run mode: GLPI'),(751,24,750,'2019-03-01 11:00:19',2,0.00792885,0,'Action completed, no processing required');
/*!40000 ALTER TABLE `glpi_crontasklogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_crontasks`
--

DROP TABLE IF EXISTS `glpi_crontasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_crontasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'task name',
  `frequency` int(11) NOT NULL COMMENT 'second between launch',
  `param` int(11) DEFAULT NULL COMMENT 'task specify parameter',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '0:disabled, 1:waiting, 2:running',
  `mode` int(11) NOT NULL DEFAULT '1' COMMENT '1:internal, 2:external',
  `allowmode` int(11) NOT NULL DEFAULT '3' COMMENT '1:internal, 2:external, 3:both',
  `hourmin` int(11) NOT NULL DEFAULT '0',
  `hourmax` int(11) NOT NULL DEFAULT '24',
  `logs_lifetime` int(11) NOT NULL DEFAULT '30' COMMENT 'number of days',
  `lastrun` datetime DEFAULT NULL COMMENT 'last run date',
  `lastcode` int(11) DEFAULT NULL COMMENT 'last run return code',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`name`),
  KEY `mode` (`mode`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Task run by internal / external cron.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_crontasks`
--

LOCK TABLES `glpi_crontasks` WRITE;
/*!40000 ALTER TABLE `glpi_crontasks` DISABLE KEYS */;
INSERT INTO `glpi_crontasks` VALUES (2,'CartridgeItem','cartridge',86400,10,0,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),(3,'ConsumableItem','consumable',86400,10,0,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),(4,'SoftwareLicense','software',86400,NULL,0,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),(5,'Contract','contract',86400,NULL,1,1,3,0,24,30,'2019-03-01 10:42:00',NULL,NULL,NULL,NULL),(6,'InfoCom','infocom',86400,NULL,1,1,3,0,24,30,'2019-03-01 10:55:00',NULL,NULL,NULL,NULL),(7,'CronTask','logs',86400,30,0,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),(9,'MailCollector','mailgate',600,10,1,1,3,0,24,30,'2019-03-01 16:05:00',NULL,NULL,NULL,NULL),(10,'DBconnection','checkdbreplicate',300,NULL,0,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),(11,'CronTask','checkupdate',604800,NULL,0,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),(12,'CronTask','session',86400,NULL,1,1,3,0,24,30,'2019-03-01 11:17:00',NULL,NULL,NULL,NULL),(13,'CronTask','graph',3600,NULL,1,1,3,0,24,30,'2019-03-01 14:59:00',NULL,NULL,NULL,NULL),(14,'ReservationItem','reservation',3600,NULL,1,1,3,0,24,30,'2019-03-01 16:14:00',NULL,NULL,NULL,NULL),(15,'Ticket','closeticket',43200,NULL,1,1,3,0,24,30,'2019-03-01 09:31:00',NULL,NULL,NULL,NULL),(16,'Ticket','alertnotclosed',43200,NULL,1,1,3,0,24,30,'2019-03-01 09:44:00',NULL,NULL,NULL,NULL),(17,'SlaLevel_Ticket','slaticket',300,NULL,1,1,3,0,24,30,'2019-03-01 16:21:00',NULL,NULL,NULL,NULL),(18,'Ticket','createinquest',86400,NULL,1,1,3,0,24,30,'2019-03-01 11:45:00',NULL,NULL,NULL,NULL),(19,'Crontask','watcher',86400,NULL,1,1,3,0,24,30,'2019-03-01 13:58:00',NULL,NULL,NULL,NULL),(20,'TicketRecurrent','ticketrecurrent',3600,NULL,1,1,3,0,24,30,'2019-03-01 16:42:00',NULL,NULL,NULL,NULL),(21,'PlanningRecall','planningrecall',300,NULL,1,1,3,0,24,30,'2019-03-01 16:50:00',NULL,NULL,NULL,NULL),(22,'QueuedNotification','queuednotification',60,50,1,1,3,0,24,30,'2019-03-01 16:55:00',NULL,NULL,NULL,NULL),(23,'QueuedNotification','queuednotificationclean',86400,30,1,1,3,0,24,30,'2019-03-01 14:04:00',NULL,NULL,NULL,NULL),(24,'Crontask','temp',3600,NULL,1,1,3,0,24,30,'2019-03-01 17:00:00',NULL,NULL,NULL,NULL),(25,'MailCollector','mailgateerror',86400,NULL,1,1,3,0,24,30,'2019-03-01 10:32:00',NULL,NULL,NULL,NULL),(26,'Crontask','circularlogs',86400,4,0,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),(27,'ObjectLock','unlockobject',86400,4,0,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),(28,'SavedSearch','countAll',604800,NULL,0,1,3,0,24,10,NULL,NULL,NULL,NULL,NULL),(29,'SavedSearch_Alert','savedsearchesalerts',86400,NULL,0,1,3,0,24,10,NULL,NULL,NULL,NULL,NULL),(30,'Telemetry','telemetry',2592000,NULL,1,1,3,0,24,10,'2019-02-12 11:30:00',NULL,NULL,'2019-02-12 05:29:28',NULL),(31,'Certificate','certificate',86400,NULL,0,1,3,0,24,10,NULL,NULL,NULL,NULL,NULL),(32,'OlaLevel_Ticket','olaticket',300,NULL,1,1,3,0,24,30,'2019-03-01 16:35:00',NULL,NULL,NULL,NULL),(34,'PluginTelegrambotCron','messagelistener',300,NULL,1,2,3,0,24,30,NULL,NULL,'','2019-02-14 02:21:11','2019-02-14 02:21:11'),(35,'PluginExampleExample','Sample',86400,50,1,1,3,0,24,30,NULL,NULL,NULL,'2019-02-14 02:22:08','2019-02-14 02:22:08'),(36,'PluginFormcreatorIssue','SyncIssues',3600,NULL,1,2,3,0,24,30,NULL,NULL,'Formcreator - Проблемы каталога службы синхронизации','2019-02-14 03:16:17','2019-02-14 03:16:17');
/*!40000 ALTER TABLE `glpi_crontasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_datacenters`
--

DROP TABLE IF EXISTS `glpi_datacenters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_datacenters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_datacenters`
--

LOCK TABLES `glpi_datacenters` WRITE;
/*!40000 ALTER TABLE `glpi_datacenters` DISABLE KEYS */;
INSERT INTO `glpi_datacenters` VALUES (1,'Алатау KTCL - ЦОД ',0,0,1,0,'2019-02-11 09:54:04','2019-02-11 09:54:04');
/*!40000 ALTER TABLE `glpi_datacenters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_dcrooms`
--

DROP TABLE IF EXISTS `glpi_dcrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_dcrooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `vis_cols` int(11) DEFAULT NULL,
  `vis_rows` int(11) DEFAULT NULL,
  `blueprint` text COLLATE utf8_unicode_ci,
  `datacenters_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `datacenters_id` (`datacenters_id`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_dcrooms`
--

LOCK TABLES `glpi_dcrooms` WRITE;
/*!40000 ALTER TABLE `glpi_dcrooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_dcrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicebatteries`
--

DROP TABLE IF EXISTS `glpi_devicebatteries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicebatteries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `voltage` int(11) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `devicebatterytypes_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `devicebatterymodels_id` int(11) DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicebatterymodels_id` (`devicebatterymodels_id`),
  KEY `devicebatterytypes_id` (`devicebatterytypes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicebatteries`
--

LOCK TABLES `glpi_devicebatteries` WRITE;
/*!40000 ALTER TABLE `glpi_devicebatteries` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicebatteries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicebatterymodels`
--

DROP TABLE IF EXISTS `glpi_devicebatterymodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicebatterymodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicebatterymodels`
--

LOCK TABLES `glpi_devicebatterymodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicebatterymodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicebatterymodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicebatterytypes`
--

DROP TABLE IF EXISTS `glpi_devicebatterytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicebatterytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicebatterytypes`
--

LOCK TABLES `glpi_devicebatterytypes` WRITE;
/*!40000 ALTER TABLE `glpi_devicebatterytypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicebatterytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicecasemodels`
--

DROP TABLE IF EXISTS `glpi_devicecasemodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicecasemodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicecasemodels`
--

LOCK TABLES `glpi_devicecasemodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicecasemodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicecasemodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicecases`
--

DROP TABLE IF EXISTS `glpi_devicecases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicecases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicecasetypes_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `devicecasemodels_id` int(11) DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicecasetypes_id` (`devicecasetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicecasemodels_id` (`devicecasemodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicecases`
--

LOCK TABLES `glpi_devicecases` WRITE;
/*!40000 ALTER TABLE `glpi_devicecases` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicecases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicecasetypes`
--

DROP TABLE IF EXISTS `glpi_devicecasetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicecasetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicecasetypes`
--

LOCK TABLES `glpi_devicecasetypes` WRITE;
/*!40000 ALTER TABLE `glpi_devicecasetypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicecasetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicecontrolmodels`
--

DROP TABLE IF EXISTS `glpi_devicecontrolmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicecontrolmodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicecontrolmodels`
--

LOCK TABLES `glpi_devicecontrolmodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicecontrolmodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicecontrolmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicecontrols`
--

DROP TABLE IF EXISTS `glpi_devicecontrols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicecontrols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_raid` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `interfacetypes_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `devicecontrolmodels_id` int(11) DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicecontrolmodels_id` (`devicecontrolmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicecontrols`
--

LOCK TABLES `glpi_devicecontrols` WRITE;
/*!40000 ALTER TABLE `glpi_devicecontrols` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicecontrols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicedrivemodels`
--

DROP TABLE IF EXISTS `glpi_devicedrivemodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicedrivemodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicedrivemodels`
--

LOCK TABLES `glpi_devicedrivemodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicedrivemodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicedrivemodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicedrives`
--

DROP TABLE IF EXISTS `glpi_devicedrives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicedrives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_writer` tinyint(1) NOT NULL DEFAULT '1',
  `speed` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `interfacetypes_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `devicedrivemodels_id` int(11) DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicedrivemodels_id` (`devicedrivemodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicedrives`
--

LOCK TABLES `glpi_devicedrives` WRITE;
/*!40000 ALTER TABLE `glpi_devicedrives` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicedrives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicefirmwaremodels`
--

DROP TABLE IF EXISTS `glpi_devicefirmwaremodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicefirmwaremodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicefirmwaremodels`
--

LOCK TABLES `glpi_devicefirmwaremodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicefirmwaremodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicefirmwaremodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicefirmwares`
--

DROP TABLE IF EXISTS `glpi_devicefirmwares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicefirmwares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicefirmwaretypes_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `devicefirmwaremodels_id` int(11) DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicefirmwaremodels_id` (`devicefirmwaremodels_id`),
  KEY `devicefirmwaretypes_id` (`devicefirmwaretypes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicefirmwares`
--

LOCK TABLES `glpi_devicefirmwares` WRITE;
/*!40000 ALTER TABLE `glpi_devicefirmwares` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicefirmwares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicefirmwaretypes`
--

DROP TABLE IF EXISTS `glpi_devicefirmwaretypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicefirmwaretypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicefirmwaretypes`
--

LOCK TABLES `glpi_devicefirmwaretypes` WRITE;
/*!40000 ALTER TABLE `glpi_devicefirmwaretypes` DISABLE KEYS */;
INSERT INTO `glpi_devicefirmwaretypes` VALUES (1,'BIOS',NULL,NULL,NULL),(2,'UEFI',NULL,NULL,NULL),(3,'Firmware',NULL,NULL,NULL);
/*!40000 ALTER TABLE `glpi_devicefirmwaretypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicegenericmodels`
--

DROP TABLE IF EXISTS `glpi_devicegenericmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicegenericmodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicegenericmodels`
--

LOCK TABLES `glpi_devicegenericmodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicegenericmodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicegenericmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicegenerics`
--

DROP TABLE IF EXISTS `glpi_devicegenerics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicegenerics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicegenerictypes_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `devicegenericmodels_id` int(11) DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicegenerictypes_id` (`devicegenerictypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicegenericmodels_id` (`devicegenericmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicegenerics`
--

LOCK TABLES `glpi_devicegenerics` WRITE;
/*!40000 ALTER TABLE `glpi_devicegenerics` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicegenerics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicegenerictypes`
--

DROP TABLE IF EXISTS `glpi_devicegenerictypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicegenerictypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicegenerictypes`
--

LOCK TABLES `glpi_devicegenerictypes` WRITE;
/*!40000 ALTER TABLE `glpi_devicegenerictypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicegenerictypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicegraphiccardmodels`
--

DROP TABLE IF EXISTS `glpi_devicegraphiccardmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicegraphiccardmodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicegraphiccardmodels`
--

LOCK TABLES `glpi_devicegraphiccardmodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicegraphiccardmodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicegraphiccardmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicegraphiccards`
--

DROP TABLE IF EXISTS `glpi_devicegraphiccards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicegraphiccards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interfacetypes_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `memory_default` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `devicegraphiccardmodels_id` int(11) DEFAULT NULL,
  `chipset` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `chipset` (`chipset`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicegraphiccardmodels_id` (`devicegraphiccardmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicegraphiccards`
--

LOCK TABLES `glpi_devicegraphiccards` WRITE;
/*!40000 ALTER TABLE `glpi_devicegraphiccards` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicegraphiccards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_deviceharddrivemodels`
--

DROP TABLE IF EXISTS `glpi_deviceharddrivemodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_deviceharddrivemodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_deviceharddrivemodels`
--

LOCK TABLES `glpi_deviceharddrivemodels` WRITE;
/*!40000 ALTER TABLE `glpi_deviceharddrivemodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_deviceharddrivemodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_deviceharddrives`
--

DROP TABLE IF EXISTS `glpi_deviceharddrives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_deviceharddrives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rpm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interfacetypes_id` int(11) NOT NULL DEFAULT '0',
  `cache` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `capacity_default` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `deviceharddrivemodels_id` int(11) DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `deviceharddrivemodels_id` (`deviceharddrivemodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_deviceharddrives`
--

LOCK TABLES `glpi_deviceharddrives` WRITE;
/*!40000 ALTER TABLE `glpi_deviceharddrives` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_deviceharddrives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicememories`
--

DROP TABLE IF EXISTS `glpi_devicememories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicememories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frequence` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `size_default` int(11) NOT NULL DEFAULT '0',
  `devicememorytypes_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `devicememorymodels_id` int(11) DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicememorytypes_id` (`devicememorytypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicememorymodels_id` (`devicememorymodels_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicememories`
--

LOCK TABLES `glpi_devicememories` WRITE;
/*!40000 ALTER TABLE `glpi_devicememories` DISABLE KEYS */;
INSERT INTO `glpi_devicememories` VALUES (1,'4Gb','1333','',3,4000,1,0,0,0,'2019-02-13 05:03:11','2019-02-13 05:03:11');
/*!40000 ALTER TABLE `glpi_devicememories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicememorymodels`
--

DROP TABLE IF EXISTS `glpi_devicememorymodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicememorymodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicememorymodels`
--

LOCK TABLES `glpi_devicememorymodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicememorymodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicememorymodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicememorytypes`
--

DROP TABLE IF EXISTS `glpi_devicememorytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicememorytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicememorytypes`
--

LOCK TABLES `glpi_devicememorytypes` WRITE;
/*!40000 ALTER TABLE `glpi_devicememorytypes` DISABLE KEYS */;
INSERT INTO `glpi_devicememorytypes` VALUES (1,'EDO',NULL,NULL,NULL),(2,'DDR',NULL,NULL,NULL),(3,'SDRAM',NULL,NULL,NULL),(4,'SDRAM-2',NULL,NULL,NULL);
/*!40000 ALTER TABLE `glpi_devicememorytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicemotherboardmodels`
--

DROP TABLE IF EXISTS `glpi_devicemotherboardmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicemotherboardmodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicemotherboardmodels`
--

LOCK TABLES `glpi_devicemotherboardmodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicemotherboardmodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicemotherboardmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicemotherboards`
--

DROP TABLE IF EXISTS `glpi_devicemotherboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicemotherboards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chipset` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `devicemotherboardmodels_id` int(11) DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicemotherboardmodels_id` (`devicemotherboardmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicemotherboards`
--

LOCK TABLES `glpi_devicemotherboards` WRITE;
/*!40000 ALTER TABLE `glpi_devicemotherboards` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicemotherboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicenetworkcardmodels`
--

DROP TABLE IF EXISTS `glpi_devicenetworkcardmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicenetworkcardmodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicenetworkcardmodels`
--

LOCK TABLES `glpi_devicenetworkcardmodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicenetworkcardmodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicenetworkcardmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicenetworkcards`
--

DROP TABLE IF EXISTS `glpi_devicenetworkcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicenetworkcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bandwidth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `mac_default` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `devicenetworkcardmodels_id` int(11) DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicenetworkcardmodels_id` (`devicenetworkcardmodels_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicenetworkcards`
--

LOCK TABLES `glpi_devicenetworkcards` WRITE;
/*!40000 ALTER TABLE `glpi_devicenetworkcards` DISABLE KEYS */;
INSERT INTO `glpi_devicenetworkcards` VALUES (1,'pci-ex tp-link 1000','1000','',6,'',0,0,0,'2019-02-15 06:25:12','2019-02-15 06:25:12');
/*!40000 ALTER TABLE `glpi_devicenetworkcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicepcimodels`
--

DROP TABLE IF EXISTS `glpi_devicepcimodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicepcimodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicepcimodels`
--

LOCK TABLES `glpi_devicepcimodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicepcimodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicepcimodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicepcis`
--

DROP TABLE IF EXISTS `glpi_devicepcis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicepcis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `devicenetworkcardmodels_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `devicepcimodels_id` int(11) DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicenetworkcardmodels_id` (`devicenetworkcardmodels_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicepcimodels_id` (`devicepcimodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicepcis`
--

LOCK TABLES `glpi_devicepcis` WRITE;
/*!40000 ALTER TABLE `glpi_devicepcis` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicepcis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicepowersupplies`
--

DROP TABLE IF EXISTS `glpi_devicepowersupplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicepowersupplies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `power` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_atx` tinyint(1) NOT NULL DEFAULT '1',
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `devicepowersupplymodels_id` int(11) DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicepowersupplymodels_id` (`devicepowersupplymodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicepowersupplies`
--

LOCK TABLES `glpi_devicepowersupplies` WRITE;
/*!40000 ALTER TABLE `glpi_devicepowersupplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicepowersupplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicepowersupplymodels`
--

DROP TABLE IF EXISTS `glpi_devicepowersupplymodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicepowersupplymodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicepowersupplymodels`
--

LOCK TABLES `glpi_devicepowersupplymodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicepowersupplymodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicepowersupplymodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_deviceprocessormodels`
--

DROP TABLE IF EXISTS `glpi_deviceprocessormodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_deviceprocessormodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_deviceprocessormodels`
--

LOCK TABLES `glpi_deviceprocessormodels` WRITE;
/*!40000 ALTER TABLE `glpi_deviceprocessormodels` DISABLE KEYS */;
INSERT INTO `glpi_deviceprocessormodels` VALUES (1,'Intel Xeon E5450','','IntelXeonE5450');
/*!40000 ALTER TABLE `glpi_deviceprocessormodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_deviceprocessors`
--

DROP TABLE IF EXISTS `glpi_deviceprocessors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_deviceprocessors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frequence` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `frequency_default` int(11) NOT NULL DEFAULT '0',
  `nbcores_default` int(11) DEFAULT NULL,
  `nbthreads_default` int(11) DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `deviceprocessormodels_id` int(11) DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `deviceprocessormodels_id` (`deviceprocessormodels_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_deviceprocessors`
--

LOCK TABLES `glpi_deviceprocessors` WRITE;
/*!40000 ALTER TABLE `glpi_deviceprocessors` DISABLE KEYS */;
INSERT INTO `glpi_deviceprocessors` VALUES (1,'Intel Xeon E5450',4000,'',7,3400,4,2,0,0,1,'2019-02-15 09:03:43','2019-02-15 09:03:43');
/*!40000 ALTER TABLE `glpi_deviceprocessors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicesensormodels`
--

DROP TABLE IF EXISTS `glpi_devicesensormodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicesensormodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicesensormodels`
--

LOCK TABLES `glpi_devicesensormodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicesensormodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicesensormodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicesensors`
--

DROP TABLE IF EXISTS `glpi_devicesensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicesensors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicesensortypes_id` int(11) NOT NULL DEFAULT '0',
  `devicesensormodels_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicesensortypes_id` (`devicesensortypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicesensors`
--

LOCK TABLES `glpi_devicesensors` WRITE;
/*!40000 ALTER TABLE `glpi_devicesensors` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicesensors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicesensortypes`
--

DROP TABLE IF EXISTS `glpi_devicesensortypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicesensortypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicesensortypes`
--

LOCK TABLES `glpi_devicesensortypes` WRITE;
/*!40000 ALTER TABLE `glpi_devicesensortypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicesensortypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicesimcards`
--

DROP TABLE IF EXISTS `glpi_devicesimcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicesimcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `voltage` int(11) DEFAULT NULL,
  `devicesimcardtypes_id` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `allow_voip` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `devicesimcardtypes_id` (`devicesimcardtypes_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `manufacturers_id` (`manufacturers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicesimcards`
--

LOCK TABLES `glpi_devicesimcards` WRITE;
/*!40000 ALTER TABLE `glpi_devicesimcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicesimcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicesimcardtypes`
--

DROP TABLE IF EXISTS `glpi_devicesimcardtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicesimcardtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicesimcardtypes`
--

LOCK TABLES `glpi_devicesimcardtypes` WRITE;
/*!40000 ALTER TABLE `glpi_devicesimcardtypes` DISABLE KEYS */;
INSERT INTO `glpi_devicesimcardtypes` VALUES (1,'Full SIM',NULL,NULL,NULL),(2,'Mini SIM',NULL,NULL,NULL),(3,'Micro SIM',NULL,NULL,NULL),(4,'Nano SIM',NULL,NULL,NULL);
/*!40000 ALTER TABLE `glpi_devicesimcardtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicesoundcardmodels`
--

DROP TABLE IF EXISTS `glpi_devicesoundcardmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicesoundcardmodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicesoundcardmodels`
--

LOCK TABLES `glpi_devicesoundcardmodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicesoundcardmodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicesoundcardmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicesoundcards`
--

DROP TABLE IF EXISTS `glpi_devicesoundcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicesoundcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `devicesoundcardmodels_id` int(11) DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicesoundcardmodels_id` (`devicesoundcardmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicesoundcards`
--

LOCK TABLES `glpi_devicesoundcards` WRITE;
/*!40000 ALTER TABLE `glpi_devicesoundcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicesoundcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_displaypreferences`
--

DROP TABLE IF EXISTS `glpi_displaypreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_displaypreferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`itemtype`,`num`),
  KEY `rank` (`rank`),
  KEY `num` (`num`),
  KEY `itemtype` (`itemtype`)
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_displaypreferences`
--

LOCK TABLES `glpi_displaypreferences` WRITE;
/*!40000 ALTER TABLE `glpi_displaypreferences` DISABLE KEYS */;
INSERT INTO `glpi_displaypreferences` VALUES (29,'Computer',31,1,0),(30,'Computer',23,2,0),(31,'Computer',5,3,0),(32,'Computer',4,4,0),(33,'Computer',40,5,0),(34,'Computer',45,6,0),(35,'Computer',3,7,0),(36,'Computer',19,8,0),(37,'Computer',17,9,0),(38,'NetworkEquipment',31,1,0),(39,'NetworkEquipment',23,2,0),(40,'NetworkEquipment',3,3,0),(41,'NetworkEquipment',4,4,0),(42,'NetworkEquipment',11,6,0),(43,'NetworkEquipment',19,7,0),(44,'Printer',31,1,0),(45,'Printer',23,2,0),(46,'Printer',3,3,0),(47,'Printer',4,4,0),(48,'Printer',19,6,0),(49,'Monitor',31,1,0),(50,'Monitor',23,2,0),(51,'Monitor',3,3,0),(52,'Monitor',4,4,0),(53,'Monitor',19,6,0),(54,'Monitor',7,7,0),(55,'Peripheral',31,1,0),(56,'Peripheral',23,2,0),(57,'Peripheral',3,3,0),(58,'Peripheral',4,4,0),(59,'Peripheral',19,6,0),(60,'Peripheral',7,7,0),(61,'Software',23,1,0),(62,'Software',5,2,0),(63,'Software',4,3,0),(64,'Contact',3,1,0),(65,'Contact',4,2,0),(66,'Contact',5,3,0),(67,'Contact',6,4,0),(68,'Contact',9,5,0),(69,'Supplier',9,1,0),(70,'Supplier',3,2,0),(71,'Supplier',4,3,0),(72,'Supplier',5,4,0),(73,'Supplier',10,5,0),(74,'Supplier',6,6,0),(75,'Contract',4,1,0),(76,'Contract',3,2,0),(77,'Contract',5,3,0),(78,'Contract',6,4,0),(79,'Contract',7,5,0),(80,'Contract',11,6,0),(82,'CartridgeItem',34,1,0),(83,'CartridgeItem',4,2,0),(84,'CartridgeItem',23,3,0),(85,'CartridgeItem',3,4,0),(86,'DocumentType',3,1,0),(88,'DocumentType',6,2,0),(89,'DocumentType',4,3,0),(90,'DocumentType',5,4,0),(91,'Document',3,1,0),(92,'Document',4,2,0),(93,'Document',7,3,0),(94,'Document',5,4,0),(95,'Document',16,5,0),(96,'User',34,1,0),(98,'User',5,4,0),(99,'User',6,5,0),(100,'User',3,6,0),(101,'ConsumableItem',34,1,0),(102,'ConsumableItem',4,2,0),(103,'ConsumableItem',23,3,0),(104,'ConsumableItem',3,4,0),(105,'NetworkEquipment',40,5,0),(106,'Printer',40,5,0),(107,'Monitor',40,5,0),(108,'Peripheral',40,5,0),(109,'User',8,7,0),(110,'Phone',31,1,0),(111,'Phone',23,2,0),(112,'Phone',3,3,0),(113,'Phone',4,4,0),(114,'Phone',40,5,0),(115,'Phone',19,6,0),(116,'Phone',7,7,0),(117,'Group',16,1,0),(118,'AllAssets',31,1,0),(119,'ReservationItem',4,1,0),(120,'ReservationItem',3,2,0),(122,'Software',72,4,0),(123,'Software',163,5,0),(124,'Budget',5,1,0),(125,'Budget',3,2,0),(126,'Budget',4,3,0),(127,'Budget',19,4,0),(128,'Crontask',8,1,0),(129,'Crontask',3,2,0),(130,'Crontask',4,3,0),(131,'Crontask',7,4,0),(132,'RequestType',14,1,0),(133,'RequestType',15,2,0),(134,'NotificationTemplate',4,1,0),(135,'NotificationTemplate',16,2,0),(136,'Notification',5,1,0),(137,'Notification',6,2,0),(138,'Notification',2,3,0),(139,'Notification',4,4,0),(140,'Notification',80,5,0),(141,'Notification',86,6,0),(142,'MailCollector',2,1,0),(143,'MailCollector',19,2,0),(144,'AuthLDAP',3,1,0),(145,'AuthLDAP',19,2,0),(146,'AuthMail',3,1,0),(147,'AuthMail',19,2,0),(150,'Profile',2,1,0),(151,'Profile',3,2,0),(152,'Profile',19,3,0),(153,'Transfer',19,1,0),(154,'TicketValidation',3,1,0),(155,'TicketValidation',2,2,0),(156,'TicketValidation',8,3,0),(157,'TicketValidation',4,4,0),(158,'TicketValidation',9,5,0),(159,'TicketValidation',7,6,0),(160,'NotImportedEmail',2,1,0),(161,'NotImportedEmail',5,2,0),(162,'NotImportedEmail',4,3,0),(163,'NotImportedEmail',6,4,0),(164,'NotImportedEmail',16,5,0),(165,'NotImportedEmail',19,6,0),(166,'RuleRightParameter',11,1,0),(167,'Ticket',12,1,0),(168,'Ticket',19,2,0),(169,'Ticket',15,3,0),(170,'Ticket',3,4,0),(171,'Ticket',4,5,0),(172,'Ticket',5,6,0),(173,'Ticket',7,7,0),(174,'Calendar',19,1,0),(175,'Holiday',11,1,0),(176,'Holiday',12,2,0),(177,'Holiday',13,3,0),(178,'SLA',4,1,0),(179,'Ticket',18,8,0),(180,'AuthLdap',30,3,0),(181,'AuthMail',6,3,0),(183,'FieldUnicity',1,1,0),(184,'FieldUnicity',80,2,0),(185,'FieldUnicity',4,3,0),(186,'FieldUnicity',3,4,0),(187,'FieldUnicity',86,5,0),(188,'FieldUnicity',30,6,0),(189,'Problem',21,1,0),(190,'Problem',12,2,0),(191,'Problem',19,3,0),(192,'Problem',15,4,0),(193,'Problem',3,5,0),(194,'Problem',7,6,0),(195,'Problem',18,7,0),(196,'Vlan',11,1,0),(197,'TicketRecurrent',11,1,0),(198,'TicketRecurrent',12,2,0),(199,'TicketRecurrent',13,3,0),(200,'TicketRecurrent',15,4,0),(201,'TicketRecurrent',14,5,0),(202,'Reminder',2,1,0),(203,'Reminder',3,2,0),(204,'Reminder',4,3,0),(205,'Reminder',5,4,0),(206,'Reminder',6,5,0),(207,'Reminder',7,6,0),(208,'FQDN',11,1,0),(209,'WifiNetwork',10,1,0),(210,'IPNetwork',18,1,0),(211,'IPNetwork',10,2,0),(212,'IPNetwork',11,3,0),(213,'IPNetwork',12,4,0),(214,'IPNetwork',17,5,0),(215,'NetworkName',12,1,0),(216,'NetworkName',13,2,0),(217,'RSSFeed',2,1,0),(218,'RSSFeed',4,2,0),(219,'RSSFeed',5,3,0),(220,'RSSFeed',19,4,0),(221,'RSSFeed',6,5,0),(222,'RSSFeed',7,6,0),(223,'Blacklist',12,1,0),(224,'Blacklist',11,2,0),(225,'ReservationItem',5,3,0),(226,'QueueMail',16,1,0),(227,'QueueMail',7,2,0),(228,'QueueMail',20,3,0),(229,'QueueMail',21,4,0),(230,'QueueMail',22,5,0),(231,'QueueMail',15,6,0),(232,'Change',12,1,0),(233,'Change',19,2,0),(234,'Change',15,3,0),(235,'Change',7,4,0),(236,'Change',18,5,0),(237,'Project',3,1,0),(238,'Project',4,2,0),(239,'Project',12,3,0),(240,'Project',5,4,0),(241,'Project',15,5,0),(242,'Project',21,6,0),(243,'ProjectState',12,1,0),(244,'ProjectState',11,2,0),(245,'ProjectTask',2,1,0),(246,'ProjectTask',12,2,0),(247,'ProjectTask',14,3,0),(248,'ProjectTask',5,4,0),(249,'ProjectTask',7,5,0),(250,'ProjectTask',8,6,0),(251,'ProjectTask',13,7,0),(252,'CartridgeItem',9,5,0),(253,'ConsumableItem',9,5,0),(254,'ReservationItem',9,4,0),(255,'SoftwareLicense',1,1,0),(256,'SoftwareLicense',3,2,0),(257,'SoftwareLicense',10,3,0),(258,'SoftwareLicense',162,4,0),(259,'SoftwareLicense',5,5,0),(260,'SavedSearch',8,1,0),(261,'SavedSearch',9,1,0),(262,'SavedSearch',3,1,0),(263,'SavedSearch',10,1,0),(264,'SavedSearch',11,1,0),(265,'Plugin',2,1,0),(266,'Plugin',3,2,0),(267,'Plugin',4,3,0),(268,'Plugin',5,4,0),(269,'Plugin',6,5,0),(270,'Plugin',7,6,0),(271,'Plugin',8,7,0),(272,'User',13,3,0),(273,'User',20,8,0),(274,'User',82,9,0),(293,'PluginFormcreatorFormAnswer',2,1,0),(294,'PluginFormcreatorFormAnswer',3,2,0),(295,'PluginFormcreatorFormAnswer',4,3,0),(296,'PluginFormcreatorFormAnswer',5,4,0),(297,'PluginFormcreatorFormAnswer',6,5,0),(298,'PluginFormcreatorForm',30,1,0),(299,'PluginFormcreatorForm',3,2,0),(300,'PluginFormcreatorForm',10,3,0),(301,'PluginFormcreatorForm',7,4,0),(302,'PluginFormcreatorForm',8,5,0),(303,'PluginFormcreatorForm',9,6,0),(304,'PluginFormcreatorIssue',1,1,0),(305,'PluginFormcreatorIssue',2,2,0),(306,'PluginFormcreatorIssue',4,3,0),(307,'PluginFormcreatorIssue',5,4,0),(308,'PluginFormcreatorIssue',6,5,0),(309,'PluginFormcreatorIssue',7,6,0),(310,'PluginFormcreatorIssue',8,7,0),(311,'PluginFieldsContainer',2,1,0),(312,'PluginFieldsContainer',3,2,0),(313,'PluginFieldsContainer',4,3,0),(314,'PluginFieldsContainer',5,4,0),(315,'Ticket',13,9,0),(317,'Computer',33,10,0),(318,'PluginGenericobjectType',10,1,0),(319,'PluginGenericobjectType',9,2,0),(320,'PluginGenericobjectType',8,3,0),(321,'PluginGenericobjectType',7,4,0),(322,'PluginGenericobjectType',6,5,0),(323,'PluginGenericobjectType',2,6,0),(324,'PluginGenericobjectType',4,7,0),(325,'PluginGenericobjectType',11,8,0),(326,'PluginGenericobjectType',12,9,0),(327,'PluginGenericobjectType',14,10,0),(328,'PluginGenericobjectType',15,11,0),(337,'PluginGenericobjectVpscmp',2,1,0);
/*!40000 ALTER TABLE `glpi_displaypreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_documentcategories`
--

DROP TABLE IF EXISTS `glpi_documentcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_documentcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `documentcategories_id` int(11) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`documentcategories_id`,`name`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_documentcategories`
--

LOCK TABLES `glpi_documentcategories` WRITE;
/*!40000 ALTER TABLE `glpi_documentcategories` DISABLE KEYS */;
INSERT INTO `glpi_documentcategories` VALUES (1,'ИП «Курмангазы»','',0,'ИП «Курмангазы»',1,'[]',NULL,'2019-02-15 09:40:40','2019-02-15 09:40:40'),(2,'Согл. о продлении','',0,'Согл. о продлении',1,'[]',NULL,'2019-02-15 09:41:26','2019-02-15 09:41:26');
/*!40000 ALTER TABLE `glpi_documentcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_documents`
--

DROP TABLE IF EXISTS `glpi_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'for display and transfert',
  `filepath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'file storage path',
  `documentcategories_id` int(11) NOT NULL DEFAULT '0',
  `mime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `sha1sum` char(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_blacklisted` tinyint(1) NOT NULL DEFAULT '0',
  `tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `tickets_id` (`tickets_id`),
  KEY `users_id` (`users_id`),
  KEY `documentcategories_id` (`documentcategories_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `sha1sum` (`sha1sum`),
  KEY `tag` (`tag`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_documents`
--

LOCK TABLES `glpi_documents` WRITE;
/*!40000 ALTER TABLE `glpi_documents` DISABLE KEYS */;
INSERT INTO `glpi_documents` VALUES (1,0,0,'Документ: Стойка - шк.01','email-1.jpg','JPG/1f/fbaac9fac62d83c4a066a0cefd1d5f100775c6.JPG',0,'image/jpeg','2019-02-11 10:02:08',NULL,0,NULL,2,0,'1ffbaac9fac62d83c4a066a0cefd1d5f100775c6',0,'749a0a43-e5de59b9-5c614816980753.62619593','2019-02-11 10:02:08'),(2,0,0,'Документ: Vp - centos 7.5','s5700-28c.png','PNG/c0/a679a59eedadbd25b9794a777dff9aceb8c367.PNG',1,'image/png','2019-02-22 10:43:55',NULL,0,NULL,2,0,'c0a679a59eedadbd25b9794a777dff9aceb8c367',0,'749a0a43-f37490bd-5c6fd2668e2e22.57290017','2019-02-22 10:43:55');
/*!40000 ALTER TABLE `glpi_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_documents_items`
--

DROP TABLE IF EXISTS `glpi_documents_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_documents_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documents_id` int(11) NOT NULL DEFAULT '0',
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `users_id` int(11) DEFAULT '0',
  `timeline_position` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`documents_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`,`entities_id`,`is_recursive`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_documents_items`
--

LOCK TABLES `glpi_documents_items` WRITE;
/*!40000 ALTER TABLE `glpi_documents_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_documents_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_documenttypes`
--

DROP TABLE IF EXISTS `glpi_documenttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_documenttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_uploadable` tinyint(1) NOT NULL DEFAULT '1',
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`ext`),
  KEY `name` (`name`),
  KEY `is_uploadable` (`is_uploadable`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_documenttypes`
--

LOCK TABLES `glpi_documenttypes` WRITE;
/*!40000 ALTER TABLE `glpi_documenttypes` DISABLE KEYS */;
INSERT INTO `glpi_documenttypes` VALUES (1,'JPEG','jpg','jpg-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(2,'PNG','png','png-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(3,'GIF','gif','gif-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(4,'BMP','bmp','bmp-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(5,'Photoshop','psd','psd-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(6,'TIFF','tif','tif-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(7,'AIFF','aiff','aiff-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(8,'Windows Media','asf','asf-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(9,'Windows Media','avi','avi-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(10,'BZip','bz2','bz2-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(11,'Word','doc','doc-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(12,'DjVu','djvu','','',1,'2004-12-13 19:47:21',NULL,NULL),(13,'PostScript','eps','ps-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(14,'GZ','gz','gz-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(15,'HTML','html','html-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(16,'Midi','mid','mid-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(17,'QuickTime','mov','mov-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(18,'MP3','mp3','mp3-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(19,'MPEG','mpg','mpg-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(20,'Ogg Vorbis','ogg','ogg-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(21,'PDF','pdf','pdf-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(22,'PowerPoint','ppt','ppt-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(23,'PostScript','ps','ps-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(24,'QuickTime','qt','qt-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(25,'RealAudio','ra','ra-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(26,'RealAudio','ram','ram-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(27,'RealAudio','rm','rm-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(28,'RTF','rtf','rtf-dist.png','',1,'2004-12-13 19:47:21',NULL,NULL),(29,'StarOffice','sdd','sdd-dist.png','',1,'2004-12-13 19:47:22',NULL,NULL),(30,'StarOffice','sdw','sdw-dist.png','',1,'2004-12-13 19:47:22',NULL,NULL),(31,'Stuffit','sit','sit-dist.png','',1,'2004-12-13 19:47:22',NULL,NULL),(32,'OpenOffice Impress','sxi','sxi-dist.png','',1,'2004-12-13 19:47:22',NULL,NULL),(33,'OpenOffice','sxw','sxw-dist.png','',1,'2004-12-13 19:47:22',NULL,NULL),(34,'Flash','swf','swf-dist.png','',1,'2011-12-06 09:48:34',NULL,NULL),(35,'TGZ','tgz','tgz-dist.png','',1,'2004-12-13 19:47:22',NULL,NULL),(36,'texte','txt','txt-dist.png','',1,'2004-12-13 19:47:22',NULL,NULL),(37,'WAV','wav','wav-dist.png','',1,'2004-12-13 19:47:22',NULL,NULL),(38,'Excel','xls','xls-dist.png','',1,'2004-12-13 19:47:22',NULL,NULL),(39,'XML','xml','xml-dist.png','',1,'2004-12-13 19:47:22',NULL,NULL),(40,'Windows Media','wmv','wmv-dist.png','',1,'2011-12-06 09:48:34',NULL,NULL),(41,'Zip','zip','zip-dist.png','',1,'2011-12-06 09:48:34',NULL,NULL),(42,'MNG','mng','','',1,'2004-12-13 19:47:22',NULL,NULL),(43,'Adobe Illustrator','ai','ai-dist.png','',1,'2004-12-13 19:47:22',NULL,NULL),(44,'C source','c','c-dist.png','',1,'2011-12-06 09:48:34',NULL,NULL),(45,'Debian','deb','deb-dist.png','',1,'2004-12-13 19:47:22',NULL,NULL),(46,'DVI','dvi','dvi-dist.png','',1,'2004-12-13 19:47:22',NULL,NULL),(47,'C header','h','h-dist.png','',1,'2011-12-06 09:48:34',NULL,NULL),(48,'Pascal','pas','pas-dist.png','',1,'2011-12-06 09:48:34',NULL,NULL),(49,'RedHat/Mandrake/SuSE','rpm','rpm-dist.png','',1,'2004-12-13 19:47:22',NULL,NULL),(50,'OpenOffice Calc','sxc','sxc-dist.png','',1,'2004-12-13 19:47:22',NULL,NULL),(51,'LaTeX','tex','tex-dist.png','',1,'2004-12-13 19:47:22',NULL,NULL),(52,'GIMP multi-layer','xcf','xcf-dist.png','',1,'2004-12-13 19:47:22',NULL,NULL),(53,'JPEG','jpeg','jpg-dist.png','',1,'2005-03-07 22:23:17',NULL,NULL),(54,'Oasis Open Office Writer','odt','odt-dist.png','',1,'2006-01-21 17:41:13',NULL,NULL),(55,'Oasis Open Office Calc','ods','ods-dist.png','',1,'2006-01-21 17:41:31',NULL,NULL),(56,'Oasis Open Office Impress','odp','odp-dist.png','',1,'2006-01-21 17:42:54',NULL,NULL),(57,'Oasis Open Office Impress Template','otp','odp-dist.png','',1,'2006-01-21 17:43:58',NULL,NULL),(58,'Oasis Open Office Writer Template','ott','odt-dist.png','',1,'2006-01-21 17:44:41',NULL,NULL),(59,'Oasis Open Office Calc Template','ots','ods-dist.png','',1,'2006-01-21 17:45:30',NULL,NULL),(60,'Oasis Open Office Math','odf','odf-dist.png','',1,'2006-01-21 17:48:05',NULL,NULL),(61,'Oasis Open Office Draw','odg','odg-dist.png','',1,'2006-01-21 17:48:31',NULL,NULL),(62,'Oasis Open Office Draw Template','otg','odg-dist.png','',1,'2006-01-21 17:49:46',NULL,NULL),(63,'Oasis Open Office Base','odb','odb-dist.png','',1,'2006-01-21 18:03:34',NULL,NULL),(64,'Oasis Open Office HTML','oth','oth-dist.png','',1,'2006-01-21 18:05:27',NULL,NULL),(65,'Oasis Open Office Writer Master','odm','odm-dist.png','',1,'2006-01-21 18:06:34',NULL,NULL),(66,'Oasis Open Office Chart','odc','','',1,'2006-01-21 18:07:48',NULL,NULL),(67,'Oasis Open Office Image','odi','','',1,'2006-01-21 18:08:18',NULL,NULL),(68,'Word XML','docx','doc-dist.png',NULL,1,'2011-01-18 11:40:42',NULL,NULL),(69,'Excel XML','xlsx','xls-dist.png',NULL,1,'2011-01-18 11:40:42',NULL,NULL),(70,'PowerPoint XML','pptx','ppt-dist.png',NULL,1,'2011-01-18 11:40:42',NULL,NULL),(71,'Comma-Separated Values','csv','csv-dist.png',NULL,1,'2011-12-06 09:48:34',NULL,NULL),(72,'Scalable Vector Graphics','svg','svg-dist.png',NULL,1,'2011-12-06 09:48:34',NULL,NULL),(73,'JSON file','json','',NULL,1,'2019-02-13 05:16:51',NULL,'2019-02-13 05:16:51');
/*!40000 ALTER TABLE `glpi_documenttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_domains`
--

DROP TABLE IF EXISTS `glpi_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_domains`
--

LOCK TABLES `glpi_domains` WRITE;
/*!40000 ALTER TABLE `glpi_domains` DISABLE KEYS */;
INSERT INTO `glpi_domains` VALUES (1,'ktcl.kz',0,0,'','2019-02-15 08:58:28','2019-02-15 08:58:28'),(2,'mycloud.kz',0,0,'','2019-02-15 08:58:34','2019-02-15 08:58:34');
/*!40000 ALTER TABLE `glpi_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_dropdowntranslations`
--

DROP TABLE IF EXISTS `glpi_dropdowntranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_dropdowntranslations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`language`,`field`),
  KEY `typeid` (`itemtype`,`items_id`),
  KEY `language` (`language`),
  KEY `field` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_dropdowntranslations`
--

LOCK TABLES `glpi_dropdowntranslations` WRITE;
/*!40000 ALTER TABLE `glpi_dropdowntranslations` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_dropdowntranslations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_enclosuremodels`
--

DROP TABLE IF EXISTS `glpi_enclosuremodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_enclosuremodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  `required_units` int(11) NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int(11) NOT NULL DEFAULT '0',
  `power_consumption` int(11) NOT NULL DEFAULT '0',
  `is_half_rack` tinyint(1) NOT NULL DEFAULT '0',
  `picture_front` text COLLATE utf8_unicode_ci,
  `picture_rear` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_enclosuremodels`
--

LOCK TABLES `glpi_enclosuremodels` WRITE;
/*!40000 ALTER TABLE `glpi_enclosuremodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_enclosuremodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_enclosures`
--

DROP TABLE IF EXISTS `glpi_enclosures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_enclosures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enclosuremodels_id` int(11) DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `orientation` tinyint(1) DEFAULT NULL,
  `power_supplies` tinyint(1) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to states (id)',
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `enclosuremodels_id` (`enclosuremodels_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `group_id_tech` (`groups_id_tech`),
  KEY `is_template` (`is_template`),
  KEY `is_deleted` (`is_deleted`),
  KEY `states_id` (`states_id`),
  KEY `manufacturers_id` (`manufacturers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_enclosures`
--

LOCK TABLES `glpi_enclosures` WRITE;
/*!40000 ALTER TABLE `glpi_enclosures` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_enclosures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_entities`
--

DROP TABLE IF EXISTS `glpi_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_entities` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `address` text COLLATE utf8_unicode_ci,
  `postcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `town` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phonenumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_email_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_reply` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_reply_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification_subject_tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ldap_dn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authldaps_id` int(11) NOT NULL DEFAULT '0',
  `mail_domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_ldapfilter` text COLLATE utf8_unicode_ci,
  `mailing_signature` text COLLATE utf8_unicode_ci,
  `cartridges_alert_repeat` int(11) NOT NULL DEFAULT '-2',
  `consumables_alert_repeat` int(11) NOT NULL DEFAULT '-2',
  `use_licenses_alert` int(11) NOT NULL DEFAULT '-2',
  `send_licenses_alert_before_delay` int(11) NOT NULL DEFAULT '-2',
  `use_certificates_alert` int(11) NOT NULL DEFAULT '-2',
  `send_certificates_alert_before_delay` int(11) NOT NULL DEFAULT '-2',
  `use_contracts_alert` int(11) NOT NULL DEFAULT '-2',
  `send_contracts_alert_before_delay` int(11) NOT NULL DEFAULT '-2',
  `use_infocoms_alert` int(11) NOT NULL DEFAULT '-2',
  `send_infocoms_alert_before_delay` int(11) NOT NULL DEFAULT '-2',
  `use_reservations_alert` int(11) NOT NULL DEFAULT '-2',
  `autoclose_delay` int(11) NOT NULL DEFAULT '-2',
  `notclosed_delay` int(11) NOT NULL DEFAULT '-2',
  `calendars_id` int(11) NOT NULL DEFAULT '-2',
  `auto_assign_mode` int(11) NOT NULL DEFAULT '-2',
  `tickettype` int(11) NOT NULL DEFAULT '-2',
  `max_closedate` datetime DEFAULT NULL,
  `inquest_config` int(11) NOT NULL DEFAULT '-2',
  `inquest_rate` int(11) NOT NULL DEFAULT '0',
  `inquest_delay` int(11) NOT NULL DEFAULT '-10',
  `inquest_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autofill_warranty_date` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-2',
  `autofill_use_date` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-2',
  `autofill_buy_date` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-2',
  `autofill_delivery_date` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-2',
  `autofill_order_date` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-2',
  `tickettemplates_id` int(11) NOT NULL DEFAULT '-2',
  `entities_id_software` int(11) NOT NULL DEFAULT '-2',
  `default_contract_alert` int(11) NOT NULL DEFAULT '-2',
  `default_infocom_alert` int(11) NOT NULL DEFAULT '-2',
  `default_cartridges_alarm_threshold` int(11) NOT NULL DEFAULT '-2',
  `default_consumables_alarm_threshold` int(11) NOT NULL DEFAULT '-2',
  `delay_send_emails` int(11) NOT NULL DEFAULT '-2',
  `is_notif_enable_default` int(11) NOT NULL DEFAULT '-2',
  `inquest_duration` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `autofill_decommission_date` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '-2',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`entities_id`,`name`),
  KEY `entities_id` (`entities_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_entities`
--

LOCK TABLES `glpi_entities` WRITE;
/*!40000 ALTER TABLE `glpi_entities` DISABLE KEYS */;
INSERT INTO `glpi_entities` VALUES (0,'KTCL',-1,'KTCL',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,-10,0,0,-10,1,NULL,1,0,0,NULL,'0','0','0','0','0',1,-10,0,0,10,10,0,1,0,'2019-02-12 05:35:04',NULL,'0');
/*!40000 ALTER TABLE `glpi_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_entities_knowbaseitems`
--

DROP TABLE IF EXISTS `glpi_entities_knowbaseitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_entities_knowbaseitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_entities_knowbaseitems`
--

LOCK TABLES `glpi_entities_knowbaseitems` WRITE;
/*!40000 ALTER TABLE `glpi_entities_knowbaseitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_entities_knowbaseitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_entities_reminders`
--

DROP TABLE IF EXISTS `glpi_entities_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_entities_reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reminders_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_entities_reminders`
--

LOCK TABLES `glpi_entities_reminders` WRITE;
/*!40000 ALTER TABLE `glpi_entities_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_entities_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_entities_rssfeeds`
--

DROP TABLE IF EXISTS `glpi_entities_rssfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_entities_rssfeeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rssfeeds_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rssfeeds_id` (`rssfeeds_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_entities_rssfeeds`
--

LOCK TABLES `glpi_entities_rssfeeds` WRITE;
/*!40000 ALTER TABLE `glpi_entities_rssfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_entities_rssfeeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_events`
--

DROP TABLE IF EXISTS `glpi_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `service` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `level` (`level`),
  KEY `item` (`type`,`items_id`)
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_events`
--

LOCK TABLES `glpi_events` WRITE;
/*!40000 ALTER TABLE `glpi_events` DISABLE KEYS */;
INSERT INTO `glpi_events` VALUES (1,-1,'system','2019-02-07 09:06:37','login',3,'glpi вошел в систему с IP 178.88.161.74'),(2,2,'users','2019-02-07 09:09:21','setup',5,'glpi обновил объект'),(3,-1,'system','2019-02-07 09:11:06','login',3,'tech вошел в систему с IP 178.88.161.74'),(4,-1,'system','2019-02-07 09:36:49','login',3,'dixon вошел в систему с IP 178.88.161.74'),(5,5,'users','2019-02-07 09:37:30','setup',5,'dixon обновил объект'),(6,4,'users','2019-02-07 09:37:58','setup',5,'dixon обновил объект'),(7,4,'users','2019-02-07 09:38:23','setup',5,'dixon обновил объект'),(8,3,'users','2019-02-07 09:38:44','setup',5,'dixon обновил объект'),(9,-1,'system','2019-02-11 09:32:17','login',3,'Неудачная попытка входа пользователя  с IP 178.88.161.74'),(10,-1,'system','2019-02-11 09:32:21','login',3,'dixon вошел в систему с IP 178.88.161.74'),(11,1,'State','2019-02-11 09:33:39','setup',4,'dixon добавил объект on'),(12,2,'State','2019-02-11 09:33:48','setup',4,'dixon добавил объект off'),(13,1,'Location','2019-02-11 09:38:03','setup',4,'dixon добавил объект ЦОД Алатау'),(14,2,'Location','2019-02-11 09:39:43','setup',4,'dixon добавил объект ОРБП на Жумалиева 108'),(15,1,'groups','2019-02-11 09:41:30','setup',4,'dixon добавил объект Системный администратор'),(16,2,'groups','2019-02-11 09:42:11','setup',4,'dixon добавил объект Дежурный специалист'),(17,3,'groups','2019-02-11 09:42:40','setup',4,'dixon добавил объект Сетевой администратор'),(18,4,'groups','2019-02-11 09:43:12','setup',4,'dixon добавил объект Инженер энергетик'),(19,5,'groups','2019-02-11 09:43:29','setup',4,'dixon добавил объект Пользо-ватель'),(20,1,'ComputerType','2019-02-11 09:44:51','setup',4,'dixon добавил объект srv'),(21,2,'ComputerType','2019-02-11 09:45:03','setup',4,'dixon добавил объект comp'),(22,1,'Manufacturer','2019-02-11 09:45:29','setup',4,'dixon добавил объект supermicro'),(23,2,'Manufacturer','2019-02-11 09:45:34','setup',4,'dixon добавил объект dell'),(24,1,'ComputerModel','2019-02-11 09:46:40','setup',4,'dixon добавил объект d-5550'),(25,1,'Network','2019-02-11 09:47:38','setup',4,'dixon добавил объект 192.168.0.0/24'),(26,1,'computers','2019-02-11 09:47:50','inventory',4,'dixon добавил объект dell-5550'),(27,1,'racks','2019-02-11 09:50:18','inventory',4,'dixon добавил объект шк.01'),(28,1,'datacenters','2019-02-11 09:54:04','inventory',4,'dixon добавил объект Алатау KTCL - ЦОД '),(29,1,'documents','2019-02-11 10:02:08','document',4,'dixon добавил связь с объектом'),(30,1,'documents','2019-02-11 10:02:08','login',4,'dixon добавил объект Документ: Стойка - шк.01'),(31,1,'ContractType','2019-02-11 10:04:15','setup',4,'dixon добавил объект Типовой'),(32,1,'contracts','2019-02-11 10:04:40','financial',4,'dixon добавил объект На размещение'),(33,1,'contracts','2019-02-11 10:05:05','financial',4,'dixon добавил связь с объектом'),(34,1,'VirtualMachineType','2019-02-11 10:05:35','setup',4,'dixon добавил объект nutanix'),(35,2,'VirtualMachineType','2019-02-11 10:05:43','setup',4,'dixon добавил объект wm-ware'),(36,1,'VirtualMachineState','2019-02-11 10:06:18','setup',4,'dixon добавил объект on'),(37,2,'VirtualMachineState','2019-02-11 10:06:22','setup',4,'dixon добавил объект off'),(38,1,'VirtualMachineSystem','2019-02-11 10:07:19','setup',4,'dixon добавил объект LXC'),(39,2,'VirtualMachineSystem','2019-02-11 10:07:25','setup',4,'dixon добавил объект KVM'),(40,3,'VirtualMachineSystem','2019-02-11 10:07:36','setup',4,'dixon добавил объект Windows'),(41,1,'computers','2019-02-11 10:08:45','inventory',4,'dixon добавил виртуальную машину'),(42,1,'ticket','2019-02-11 10:11:54','tracking',4,'dixon добавил объект 1'),(43,1,'UserCategory','2019-02-11 10:16:37','setup',4,'dixon добавил объект Разработчик'),(44,6,'users','2019-02-11 10:17:47','setup',4,'dixon добавил объект d_tailakov'),(45,1,'computers','2019-02-11 10:21:54','inventory',4,'dixon обновил виртуальную машину'),(46,-1,'system','2019-02-12 02:17:55','login',3,'Неудачная попытка входа пользователя  с IP 178.88.161.74'),(47,-1,'system','2019-02-12 02:18:20','login',3,'d_tailakov вошел в систему с IP 178.88.161.74'),(48,1,'UserTitle','2019-02-12 02:33:27','setup',4,'d_tailakov добавил объект Главный специалист'),(49,2,'UserTitle','2019-02-12 02:33:38','setup',4,'d_tailakov добавил объект Ведущий специалист'),(50,3,'UserTitle','2019-02-12 02:33:51','setup',4,'d_tailakov добавил объект Технический специалист'),(51,3,'users','2019-02-12 02:34:42','setup',5,'d_tailakov обновил объект'),(52,-1,'system','2019-02-12 02:35:54','login',3,'dixon вошел в систему с IP 178.88.161.74'),(53,-1,'system','2019-02-12 02:36:28','login',3,'t_lovazov вошел в систему с IP 178.88.161.74'),(54,3,'users','2019-02-12 02:37:11','setup',5,'d_tailakov обновил объект'),(55,-1,'system','2019-02-12 02:43:12','login',3,'t_lovazov вошел в систему с IP 178.88.161.74'),(56,5,'users','2019-02-12 02:45:37','setup',5,'d_tailakov обновил объект'),(57,-1,'system','2019-02-12 05:30:13','login',3,'t_lovazov вошел в систему с IP 178.88.161.74'),(58,-1,'system','2019-02-12 05:30:53','login',3,'dixon вошел в систему с IP 178.88.161.74'),(59,0,'Entity','2019-02-12 05:35:04','setup',4,'dixon обновил объект'),(60,-1,'system','2019-02-12 05:45:33','login',3,'t_aipov вошел в систему с IP 178.88.161.74'),(61,-1,'system','2019-02-12 05:47:26','login',3,'d_tailakov вошел в систему с IP 178.88.161.74'),(62,-1,'system','2019-02-12 05:48:00','login',3,'Неудачная попытка входа пользователя glpi с IP 178.88.161.74'),(63,-1,'system','2019-02-12 05:48:06','login',3,'d_tailakov вошел в систему с IP 178.88.161.74'),(64,-1,'system','2019-02-12 05:49:21','login',3,'dixon вошел в систему с IP 178.88.161.74'),(65,4,'users','2019-02-12 05:55:23','setup',5,'dixon обновил объект'),(66,-1,'system','2019-02-12 05:55:43','login',3,'v_shegula вошел в систему с IP 178.88.161.74'),(67,4,'users','2019-02-12 06:00:17','setup',4,'dixon добавил пользователя в группу'),(68,-1,'system','2019-02-12 06:18:42','login',3,'v_shegula вошел в систему с IP 178.88.161.74'),(69,1,'change','2019-02-12 06:21:04','maintain',4,'v_shegula добавил объект Перенести сервер 38'),(70,1,'reminder','2019-02-12 06:34:30','tools',4,'v_shegula добавил объект Выполнить заявку'),(71,1,'problem','2019-02-12 06:36:53','maintain',4,'v_shegula добавил объект Перегрев сервера 38'),(72,1,'change','2019-02-12 06:37:50','maintain',4,'v_shegula обновил объект'),(73,1,'change','2019-02-12 06:37:56','maintain',4,'v_shegula обновил объект'),(74,1,'change','2019-02-12 06:38:30','maintain',4,'v_shegula обновил объект'),(75,1,'change','2019-02-12 06:39:13','maintain',4,'v_shegula обновил объект'),(76,1,'peripherals','2019-02-12 07:39:33','inventory',4,'v_shegula добавил объект Патч-панель'),(77,1,'phones','2019-02-12 07:41:10','inventory',4,'v_shegula добавил объект Panasonic-NSX-120'),(78,-1,'system','2019-02-12 07:42:39','login',3,'Неудачная попытка входа пользователя v.shegula с IP 178.88.161.74'),(79,-1,'system','2019-02-12 07:42:53','login',3,'v_shegula вошел в систему с IP 178.88.161.74'),(80,1,'PluginFormcreatorCategory','2019-02-12 11:59:53','setup',4,'dixon добавил объект Сетевой администратор'),(81,-1,'system','2019-02-13 02:24:31','login',3,'dixon вошел в систему с IP 178.88.161.74'),(82,-1,'system','2019-02-13 04:39:17','login',3,'v_shegula вошел в систему с IP 178.88.161.74'),(83,2,'ticket','2019-02-13 04:45:00','tracking',4,'v_shegula добавил объект 2'),(84,0,'networkport','2019-02-13 04:48:34','inventory',5,'dixon добавил несколько сетевых портов'),(85,0,'networkport','2019-02-13 04:49:13','inventory',5,'dixon добавил несколько сетевых портов'),(86,0,'networkport','2019-02-13 04:49:35','inventory',5,'dixon добавил несколько сетевых портов'),(87,0,'networkport','2019-02-13 04:50:03','inventory',5,'dixon добавил несколько сетевых портов'),(88,4,'networkport','2019-02-13 04:51:35','inventory',4,'dixon обновил объект'),(89,1,'Vlan','2019-02-13 04:52:49','setup',4,'dixon добавил объект 1'),(90,2,'Vlan','2019-02-13 04:53:01','setup',4,'dixon добавил объект 2'),(91,0,'networkport','2019-02-13 04:53:09','inventory',5,'dixon связал VLAN с сетевым портом'),(92,5,'networkport','2019-02-13 04:54:01','inventory',4,'dixon обновил объект'),(93,1,'OperatingSystemKernel','2019-02-13 04:57:22','setup',4,'dixon добавил объект 1 ядро'),(94,2,'OperatingSystemKernel','2019-02-13 04:57:28','setup',4,'dixon добавил объект 2 ядра'),(95,3,'OperatingSystemKernel','2019-02-13 04:57:39','setup',4,'dixon добавил объект 3 ядра'),(96,4,'OperatingSystemKernel','2019-02-13 04:57:45','setup',4,'dixon добавил объект 4 ядра'),(97,5,'OperatingSystemKernel','2019-02-13 04:57:57','setup',4,'dixon добавил объект 5 ядер'),(98,6,'OperatingSystemKernel','2019-02-13 04:58:07','setup',4,'dixon добавил объект 6 ядер'),(99,7,'OperatingSystemKernel','2019-02-13 04:58:17','setup',4,'dixon добавил объект 7 ядер'),(100,8,'OperatingSystemKernel','2019-02-13 04:58:22','setup',4,'dixon добавил объект 8 ядер'),(101,9,'OperatingSystemKernel','2019-02-13 04:58:28','setup',4,'dixon добавил объект 9 ядер'),(102,10,'OperatingSystemKernel','2019-02-13 04:58:33','setup',4,'dixon добавил объект 10 ядер'),(103,11,'OperatingSystemKernel','2019-02-13 04:58:38','setup',4,'dixon добавил объект 11 ядер'),(104,12,'OperatingSystemKernel','2019-02-13 04:58:43','setup',4,'dixon добавил объект 12 ядер'),(105,13,'OperatingSystemKernel','2019-02-13 04:58:49','setup',4,'dixon добавил объект 13 ядер'),(106,14,'OperatingSystemKernel','2019-02-13 04:58:54','setup',4,'dixon добавил объект 14 ядер'),(107,15,'OperatingSystemKernel','2019-02-13 04:58:59','setup',4,'dixon добавил объект 15 ядер'),(108,16,'OperatingSystemKernel','2019-02-13 04:59:04','setup',4,'dixon добавил объект 16 ядер'),(109,17,'OperatingSystemKernel','2019-02-13 04:59:09','setup',4,'dixon добавил объект 17 ядер'),(110,18,'OperatingSystemKernel','2019-02-13 04:59:13','setup',4,'dixon добавил объект 18 ядер'),(111,19,'OperatingSystemKernel','2019-02-13 04:59:19','setup',4,'dixon добавил объект 19 ядер'),(112,20,'OperatingSystemKernel','2019-02-13 04:59:26','setup',4,'dixon добавил объект 20 ядер'),(113,3,'Manufacturer','2019-02-13 05:02:20','setup',4,'dixon добавил объект Kingston'),(114,1,'DeviceMemory','2019-02-13 05:03:11','inventory',4,'dixon добавил объект 4Gb'),(115,1,'Computer','2019-02-13 05:05:12','inventory',4,'dixon добавил том'),(116,1,'Computer','2019-02-13 05:05:49','inventory',4,'dixon обновил том'),(117,1,'computers','2019-02-13 05:07:15','inventory',4,'dixon добавил виртуальную машину'),(118,2,'problem','2019-02-13 05:08:31','maintain',4,'dixon добавил объект Греется процессор'),(119,3,'ticket','2019-02-13 05:12:26','tracking',4,'v_shegula добавил объект 3'),(120,2,'transfers','2019-02-13 07:58:06','setup',4,'dixon обновил объект'),(121,1,'Network','2019-02-13 08:19:15','setup',4,'dixon обновил объект'),(122,2,'Network','2019-02-13 08:19:46','setup',4,'dixon добавил объект Сеть клиента (LAN)'),(123,3,'Network','2019-02-13 08:20:26','setup',4,'dixon добавил объект Vlan'),(124,-1,'system','2019-02-13 10:00:54','login',3,'dixon вошел в систему с IP 178.88.161.74'),(125,-1,'system','2019-02-13 10:07:41','login',3,'dixon вошел в систему с IP 178.88.161.74'),(126,-1,'system','2019-02-13 10:10:55','login',3,'dixon вошел в систему с IP 178.88.161.74'),(127,-1,'system','2019-02-13 10:18:07','login',3,'dixon вошел в систему с IP 178.88.161.74'),(128,-1,'system','2019-02-13 10:18:15','login',3,'dixon вошел в систему с IP 178.88.161.74'),(129,-1,'system','2019-02-13 10:18:17','login',3,'dixon вошел в систему с IP 178.88.161.74'),(130,-1,'system','2019-02-13 10:18:19','login',3,'dixon вошел в систему с IP 178.88.161.74'),(131,-1,'system','2019-02-13 10:18:20','login',3,'dixon вошел в систему с IP 178.88.161.74'),(132,-1,'system','2019-02-13 10:18:21','login',3,'dixon вошел в систему с IP 178.88.161.74'),(133,-1,'system','2019-02-13 10:36:10','login',3,'dixon вошел в систему с IP 178.88.161.74'),(134,-1,'system','2019-02-13 10:45:32','login',3,'dixon вошел в систему с IP 178.88.161.74'),(135,-1,'system','2019-02-13 10:47:16','login',3,'dixon вошел в систему с IP 178.88.161.74'),(136,-1,'system','2019-02-13 11:09:44','login',3,'v_shegula вошел в систему с IP 178.88.161.74'),(137,-1,'system','2019-02-14 02:20:53','login',3,'dixon вошел в систему с IP 178.88.161.74'),(138,1,'PluginFormcreatorCategory','2019-02-14 03:17:47','setup',4,'dixon добавил объект Callocation'),(139,2,'PluginFormcreatorCategory','2019-02-14 03:17:58','setup',4,'dixon добавил объект vps'),(140,1,'Computer','2019-02-14 05:31:38','inventory',4,'dixon обновил том'),(141,1,'Computer','2019-02-14 05:32:01','inventory',4,'dixon обновил том'),(142,1,'racks','2019-02-14 05:33:17','inventory',4,'dixon обновил объект'),(143,1,'NetworkEquipmentType','2019-02-14 05:38:26','setup',4,'dixon добавил объект switches'),(144,4,'Manufacturer','2019-02-14 05:38:44','setup',4,'dixon добавил объект huawei'),(145,1,'NetworkEquipmentModel','2019-02-14 05:48:05','setup',4,'dixon добавил объект S5700-52C'),(146,2,'NetworkEquipmentModel','2019-02-14 05:51:30','setup',4,'dixon добавил объект S5700-28C-SI'),(147,1,'networkequipment','2019-02-14 05:52:23','inventory',4,'dixon добавил объект S5700-24TP-SI'),(148,2,'networkequipment','2019-02-14 05:55:49','inventory',4,'dixon добавил объект S5700-52C-SI'),(149,1,'Netpoint','2019-02-14 06:10:54','setup',4,'dixon добавил объект 001-1'),(150,2,'Netpoint','2019-02-14 06:11:02','setup',4,'dixon добавил объект 001-2'),(151,3,'Netpoint','2019-02-14 06:11:13','setup',4,'dixon добавил объект 002-1'),(152,4,'Netpoint','2019-02-14 06:11:21','setup',4,'dixon добавил объект 002-2'),(153,1,'FQDN','2019-02-14 06:14:08','setup',4,'dixon добавил объект ktcl.kz'),(154,2,'FQDN','2019-02-14 06:15:35','setup',4,'dixon добавил объект mycloud.kz'),(155,1,'networkport','2019-02-14 06:17:24','inventory',5,'dixon добавляет элемент'),(156,0,'networkport','2019-02-14 06:18:56','inventory',5,'dixon добавил несколько сетевых портов'),(157,0,'networkport','2019-02-14 06:21:04','inventory',5,'dixon добавил несколько сетевых портов'),(158,-1,'system','2019-02-14 08:01:48','login',3,'dixon вошел в систему с IP 178.88.161.74'),(159,1,'PluginFieldsFieldDropdown','2019-02-14 09:46:40','setup',4,'dixon добавил объект INT'),(160,2,'PluginFieldsFieldDropdown','2019-02-14 09:47:06','setup',4,'dixon добавил объект VPN'),(161,3,'PluginFieldsFieldDropdown','2019-02-14 09:47:22','setup',4,'dixon добавил объект SIP'),(162,3,'networkequipment','2019-02-14 09:48:38','inventory',4,'dixon добавил объект S5700-52C-SI'),(163,3,'networkequipment','2019-02-14 09:49:16','inventory',4,'dixon обновил объект'),(164,2,'networkequipment','2019-02-14 09:50:25','inventory',4,'dixon обновил объект'),(165,-1,'system','2019-02-14 10:20:53','login',3,'v_shegula вошел в систему с IP 178.88.161.74'),(166,-1,'system','2019-02-14 10:36:17','login',3,'v_shegula вошел в систему с IP 178.88.161.74'),(167,4,'users','2019-02-14 10:36:49','setup',5,'v_shegula обновил объект'),(168,-1,'system','2019-02-14 10:41:06','login',3,'v_shegula вошел в систему с IP 178.88.161.74'),(169,-1,'system','2019-02-14 10:41:06','login',3,'v_shegula вошел в систему с IP 178.88.161.74'),(170,-1,'system','2019-02-14 10:41:24','login',3,'dixon вошел в систему с IP 178.88.161.74'),(171,4,'users','2019-02-14 10:42:42','setup',5,'v_shegula обновил объект'),(172,-1,'system','2019-02-14 10:52:06','login',3,'v_shegula вошел в систему с IP 178.88.161.74'),(173,-1,'system','2019-02-15 02:16:45','login',3,'v_shegula вошел в систему с IP 178.88.161.74'),(174,-1,'system','2019-02-15 02:38:33','login',3,'dixon вошел в систему с IP 178.88.161.74'),(175,1,'RackModel','2019-02-15 03:07:48','setup',4,'dixon добавил объект EDA 1.1.1'),(176,2,'RackModel','2019-02-15 03:08:25','setup',4,'dixon добавил объект EDA 1.1.2'),(177,3,'RackModel','2019-02-15 03:10:37','setup',4,'dixon добавил объект EDA 1.1.3'),(178,4,'RackModel','2019-02-15 03:11:07','setup',4,'dixon добавил объект EDA 1.1.4'),(179,5,'RackModel','2019-02-15 03:11:29','setup',4,'dixon добавил объект EDA 1.1.5'),(180,6,'RackModel','2019-02-15 03:11:45','setup',4,'dixon добавил объект EDA 1.1.6'),(181,7,'RackModel','2019-02-15 03:12:27','setup',4,'dixon добавил объект EDA 1.1.7'),(182,3,'ComputerType','2019-02-15 03:27:27','setup',4,'dixon добавил объект switch'),(183,5,'Manufacturer','2019-02-15 03:29:02','setup',4,'dixon добавил объект HP'),(184,3,'NetworkEquipmentModel','2019-02-15 03:31:25','setup',4,'dixon добавил объект DL360-G7'),(185,1,'computers','2019-02-15 03:40:39','inventory',4,'dixon обновил объект'),(186,1,'DeviceMemory','2019-02-15 03:41:02','setup',4,'dixon обновил объект'),(187,5,'networkport','2019-02-15 03:43:15','inventory',4,'dixon обновил объект'),(188,1,'pdus','2019-02-15 03:50:10','inventory',4,'dixon добавил объект '),(189,2,'reminder','2019-02-15 03:52:39','tools',4,'dixon добавил объект Новая заметка'),(190,2,'reminder','2019-02-15 03:55:15','tools',4,'dixon добавил назначение'),(191,2,'reminder','2019-02-15 03:55:38','tools',4,'dixon обновил объект'),(192,2,'users','2019-02-15 03:59:24','setup',5,'dixon обновил объект'),(193,2,'users','2019-02-15 03:59:49','setup',5,'dixon обновил объект'),(194,1,'computers','2019-02-15 04:01:20','inventory',5,'dixon связал объект'),(195,1,'PhoneType','2019-02-15 04:15:23','setup',4,'dixon добавил объект Panas1'),(196,2,'PhoneType','2019-02-15 04:15:28','setup',4,'dixon добавил объект Nokia'),(197,2,'users','2019-02-15 04:29:47','setup',5,'dixon обновил объект'),(198,2,'users','2019-02-15 04:30:04','setup',5,'dixon обновил объект'),(199,7,'users','2019-02-15 04:33:54','setup',4,'dixon добавил объект a_dosmagambetov'),(200,6,'groups','2019-02-15 04:37:52','setup',4,'dixon добавил объект Разработчик'),(201,7,'users','2019-02-15 04:38:05','setup',4,'dixon добавил пользователя в группу'),(202,7,'users','2019-02-15 04:38:48','setup',5,'dixon обновил объект'),(203,3,'reminder','2019-02-15 04:59:19','tools',4,'dixon добавил объект Новая заметка'),(204,4,'reminder','2019-02-15 05:00:07','tools',4,'dixon добавил объект Новая заметка'),(205,3,'reminder','2019-02-15 05:00:26','tools',4,'dixon добавил назначение'),(206,3,'reminder','2019-02-15 05:01:05','tools',4,'dixon обновил объект'),(207,2,'users','2019-02-15 05:34:01','setup',5,'dixon обновил объект'),(208,49,'networkport','2019-02-15 05:40:55','inventory',5,'dixon добавляет элемент'),(209,0,'networkport','2019-02-15 05:46:13','inventory',5,'dixon добавил несколько сетевых портов'),(210,1,'LineType','2019-02-15 05:50:36','setup',4,'dixon добавил объект INT'),(211,2,'LineType','2019-02-15 05:50:45','setup',4,'dixon добавил объект VPN'),(212,3,'LineType','2019-02-15 05:50:51','setup',4,'dixon добавил объект SIP'),(213,6,'Manufacturer','2019-02-15 06:24:58','setup',4,'dixon добавил объект tp-link'),(214,1,'DeviceNetworkCard','2019-02-15 06:25:12','inventory',4,'dixon добавил объект pci-ex tp-link 1000'),(215,12,'rules','2019-02-15 06:29:27','setup',4,'dixon добавил объект 12'),(216,1,'networkport','2019-02-15 08:50:29','inventory',4,'dixon обновил объект'),(217,2,'networkport','2019-02-15 08:51:17','inventory',4,'dixon обновил объект'),(218,3,'networkport','2019-02-15 08:51:58','inventory',4,'dixon обновил объект'),(219,3,'networkport','2019-02-15 08:53:05','inventory',4,'dixon обновил объект'),(220,1,'Domain','2019-02-15 08:58:28','setup',4,'dixon добавил объект ktcl.kz'),(221,2,'Domain','2019-02-15 08:58:34','setup',4,'dixon добавил объект mycloud.kz'),(222,1,'computers','2019-02-15 08:58:45','inventory',4,'dixon обновил объект'),(223,1,'computers','2019-02-15 08:58:54','inventory',4,'dixon обновил объект'),(224,7,'Manufacturer','2019-02-15 09:00:32','setup',4,'dixon добавил объект intel'),(225,1,'DeviceProcessorModel','2019-02-15 09:03:37','setup',4,'dixon добавил объект Intel Xeon E5450'),(226,1,'DeviceProcessor','2019-02-15 09:03:43','inventory',4,'dixon добавил объект Intel Xeon E5450'),(227,1,'OperatingSystem','2019-02-15 09:05:08','setup',4,'dixon добавил объект MS Windows 10'),(228,1,'OperatingSystemArchitecture','2019-02-15 09:05:26','setup',4,'dixon добавил объект 64x'),(229,1,'OperatingSystemKernelVersion','2019-02-15 09:05:53','setup',4,'dixon добавил объект core'),(230,1,'OperatingSystemVersion','2019-02-15 09:06:18','setup',4,'dixon добавил объект 10.05.19'),(231,1,'ComputerModel','2019-02-15 09:15:29','setup',4,'dixon обновил объект'),(232,1,'computers','2019-02-15 09:16:13','inventory',4,'dixon обновил объект'),(233,1,'computers','2019-02-15 09:20:16','inventory',4,'dixon обновил объект'),(234,1,'PluginFieldsClientservicefieldDropdown','2019-02-15 09:36:08','setup',4,'dixon добавил объект Клиент'),(235,2,'PluginFieldsClientservicefieldDropdown','2019-02-15 09:36:27','setup',4,'dixon добавил объект Служебное'),(236,1,'AutoUpdateSystem','2019-02-15 09:37:50','setup',4,'dixon добавил объект 192.168.10.11/apt'),(237,1,'computers','2019-02-15 09:38:07','inventory',4,'dixon обновил объект'),(238,1,'contracts','2019-02-15 09:40:01','financial',4,'dixon обновил объект'),(239,1,'DocumentCategory','2019-02-15 09:40:40','setup',4,'dixon добавил объект ИП «Курмангазы» '),(240,2,'DocumentCategory','2019-02-15 09:41:26','setup',4,'dixon добавил объект Согл. о продлении'),(241,1,'reservationitem','2019-02-15 09:44:50','inventory',4,'dixon добавляет элемент Computer (1)'),(242,3,'networkequipment','2019-02-15 09:49:41','inventory',4,'v_shegula обновил объект'),(243,2,'ticket','2019-02-15 09:55:22','tracking',4,'dixon обновил объект'),(244,-1,'system','2019-02-15 10:59:14','login',3,'Dixon вошел в систему с IP 90.143.22.6'),(245,-1,'system','2019-02-15 11:05:54','login',3,'dixon вошел в систему с IP 90.143.22.6'),(246,1,'ComputerModel','2019-02-15 11:08:04','setup',4,'dixon обновил объект'),(247,-1,'system','2019-02-16 04:56:19','login',3,'dixon вошел в систему с IP 90.143.22.6'),(248,-1,'system','2019-02-18 02:03:58','login',3,'dixon вошел в систему с IP 178.88.161.74'),(249,-1,'system','2019-02-18 05:11:20','login',3,'d_tailakov вошел в систему с IP 178.88.161.74'),(250,-1,'system','2019-02-18 05:13:20','login',3,'v_shegula вошел в систему с IP 178.88.161.74'),(251,-1,'system','2019-02-19 04:39:09','login',3,'d_tailakov вошел в систему с IP 178.88.161.74'),(252,-1,'system','2019-02-19 04:42:25','login',3,'dixon вошел в систему с IP 178.88.161.74'),(253,-1,'system','2019-02-19 04:54:33','login',3,'v_shegula вошел в систему с IP 178.88.161.74'),(254,1,'Computer','2019-02-19 05:00:14','inventory',4,'dixon обновил том'),(255,1,'Computer','2019-02-19 05:01:09','inventory',4,'dixon добавил том'),(256,1,'computers','2019-02-19 05:02:20','inventory',4,'dixon добавил виртуальную машину'),(257,-1,'system','2019-02-19 06:44:50','login',3,'dixon вошел в систему с IP 178.88.175.252'),(258,-1,'system','2019-02-20 03:47:42','login',3,'dixon вошел в систему с IP 178.88.175.252'),(259,-1,'system','2019-02-20 10:56:31','login',3,'dixon вошел в систему с IP 178.88.175.252'),(260,-1,'system','2019-02-21 02:26:28','login',3,'dixon вошел в систему с IP 178.88.175.252'),(261,1,'software','2019-02-21 06:34:48','inventory',4,'dixon добавил объект Ms Windows 10 ru x23-x64'),(262,1,'PluginGenericobjectTypeFamily','2019-02-21 10:14:52','setup',4,'dixon добавил объект vps'),(263,4,'PluginOrderOrderTax','2019-02-21 10:31:04','setup',4,'dixon добавил объект 12'),(264,1,'PluginGenericobjectVptype','2019-02-21 10:52:21','setup',4,'dixon добавил объект Клиент'),(265,2,'PluginGenericobjectVptype','2019-02-21 10:52:37','setup',4,'dixon добавил объект Служебный'),(266,-1,'system','2019-02-22 02:53:40','login',3,'dixon вошел в систему с IP 178.88.175.252'),(267,1,'software','2019-02-22 05:41:52','inventory',4,'dixon обновил объект'),(268,1,'software','2019-02-22 05:42:18','inventory',4,'dixon добавлено лицензий 1'),(269,1,'software','2019-02-22 05:43:22','inventory',4,'dixon добавлено лицензий 1'),(270,1,'computers','2019-02-22 05:43:44','inventory',5,'dixon инсталлировал ПО'),(271,1,'softwarelicense','2019-02-22 05:44:06','inventory',4,'dixon задал связь между компьютером и лицензией'),(272,1,'software','2019-02-22 05:44:52','inventory',4,'dixon обновлено лицензий 1'),(273,-1,'system','2019-02-22 06:38:42','login',3,'dixon вошел в систему с IP 178.88.175.252'),(274,-1,'system','2019-02-22 08:03:22','login',3,'dixon вошел в систему с IP 178.88.175.252'),(275,1,'PluginFieldsClientservicefieldDropdown','2019-02-22 08:09:11','setup',4,'dixon добавил объект Все'),(276,2,'PluginFieldsClientservicefieldDropdown','2019-02-22 08:09:21','setup',4,'dixon добавил объект Клиент'),(277,3,'PluginFieldsClientservicefieldDropdown','2019-02-22 08:09:39','setup',4,'dixon добавил объект Служебный'),(278,1,'computers','2019-02-22 08:11:02','inventory',4,'dixon обновил объект'),(279,2,'Location','2019-02-22 08:13:42','setup',4,'dixon обновил объект'),(280,0,'dropdown','2019-02-22 08:14:27','setup',5,'dixon добавляет несколько netpoints'),(281,2,'Location','2019-02-22 08:15:42','setup',4,'dixon обновил объект'),(282,3,'ticket','2019-02-22 08:28:24','tracking',4,'dixon добавил объект 3'),(283,2,'problem','2019-02-22 08:30:05','maintain',4,'dixon обновил объект'),(284,3,'problem','2019-02-22 08:37:29','maintain',4,'dixon добавил объект '),(285,0,'networkport','2019-02-22 08:42:01','inventory',5,'dixon добавил несколько сетевых портов'),(286,82,'networkport','2019-02-22 08:45:20','inventory',4,'dixon обновил объект'),(287,83,'networkport','2019-02-22 08:46:07','inventory',4,'dixon обновил объект'),(288,84,'networkport','2019-02-22 08:46:45','inventory',4,'dixon обновил объект'),(289,0,'networkport','2019-02-22 08:47:04','inventory',5,'dixon связал VLAN с сетевым портом'),(290,3,'Vlan','2019-02-22 08:48:06','setup',4,'dixon добавил объект 3'),(291,4,'Vlan','2019-02-22 08:48:10','setup',4,'dixon добавил объект 4'),(292,5,'Vlan','2019-02-22 08:48:15','setup',4,'dixon добавил объект 5'),(293,6,'Vlan','2019-02-22 08:48:20','setup',4,'dixon добавил объект 6'),(294,7,'Vlan','2019-02-22 08:48:25','setup',4,'dixon добавил объект 7'),(295,8,'Vlan','2019-02-22 08:48:30','setup',4,'dixon добавил объект 8'),(296,9,'Vlan','2019-02-22 08:48:36','setup',4,'dixon добавил объект 9'),(297,10,'Vlan','2019-02-22 08:48:41','setup',4,'dixon добавил объект 10'),(298,0,'networkport','2019-02-22 08:48:53','inventory',5,'dixon связал VLAN с сетевым портом'),(299,86,'networkport','2019-02-22 08:49:43','inventory',4,'dixon обновил объект'),(300,0,'networkport','2019-02-22 08:49:56','inventory',5,'dixon связал VLAN с сетевым портом'),(301,85,'networkport','2019-02-22 08:50:52','inventory',4,'dixon обновил объект'),(302,0,'networkport','2019-02-22 08:51:12','inventory',5,'dixon связал VLAN с сетевым портом'),(303,1,'FieldUnicity','2019-02-22 09:57:33','setup',4,'dixon добавил объект Находится на'),(304,13,'rules','2019-02-22 10:36:16','setup',4,'dixon добавил объект 13'),(305,13,'rules','2019-02-22 10:37:14','setup',4,'dixon обновил объект'),(306,2,'FieldUnicity','2019-02-22 10:39:54','setup',4,'dixon добавил объект Инвентврный№'),(307,2,'documents','2019-02-22 10:43:55','document',4,'dixon добавил связь с объектом'),(308,2,'documents','2019-02-22 10:43:55','login',4,'dixon добавил объект Документ: Vp - centos 7.5'),(309,-1,'system','2019-02-22 10:45:08','login',3,'dixon вошел в систему с IP 178.88.175.252'),(310,-1,'system','2019-02-22 11:02:06','login',3,'v_shegula вошел в систему с IP 178.88.175.252'),(311,-1,'system','2019-02-22 11:03:04','login',3,'v_shegula вошел в систему с IP 178.88.175.252'),(312,2,'reservationitem','2019-02-22 11:05:04','inventory',4,'v_shegula добавляет элемент PluginGenericobjectVpsvirtual (1)'),(313,-1,'system','2019-02-22 11:25:15','login',3,'v_shegula вошел в систему с IP 178.88.175.252'),(314,-1,'system','2019-02-25 02:15:38','login',3,'dixon вошел в систему с IP 178.88.175.252'),(315,-1,'system','2019-02-25 02:39:33','login',3,'v_shegula вошел в систему с IP 178.88.175.252'),(316,-1,'system','2019-02-25 05:19:02','login',3,'v_shegula вошел в систему с IP 178.88.175.252'),(317,0,'networkport','2019-02-25 05:19:50','inventory',5,'v_shegula добавил несколько сетевых портов'),(318,91,'networkport','2019-02-25 05:21:21','inventory',5,'v_shegula добавляет элемент'),(319,0,'networkport','2019-02-25 05:22:04','inventory',5,'v_shegula связал VLAN с сетевым портом'),(320,92,'networkport','2019-02-25 05:23:14','inventory',5,'v_shegula добавляет элемент'),(321,93,'networkport','2019-02-25 05:24:21','inventory',5,'v_shegula добавляет элемент'),(322,93,'networkport','2019-02-25 05:25:00','inventory',4,'v_shegula обновил объект'),(323,0,'networkport','2019-02-25 05:25:34','inventory',5,'v_shegula связал VLAN с сетевым портом'),(324,93,'networkport','2019-02-25 05:26:39','inventory',4,'v_shegula обновил объект'),(325,93,'networkport','2019-02-25 05:27:13','inventory',4,'v_shegula обновил объект'),(326,94,'networkport','2019-02-25 05:28:28','inventory',5,'v_shegula добавляет элемент'),(327,94,'networkport','2019-02-25 05:29:01','inventory',4,'v_shegula обновил объект'),(328,87,'networkport','2019-02-25 05:29:36','inventory',4,'v_shegula обновил объект'),(329,27,'networkport','2019-02-25 05:30:46','inventory',4,'v_shegula обновил объект'),(330,-1,'system','2019-02-26 01:59:34','login',3,'dixon вошел в систему с IP 178.88.175.252'),(331,-1,'system','2019-02-26 05:33:35','login',3,'dixon вошел в систему с IP 178.88.175.252'),(332,-1,'system','2019-02-26 09:47:46','login',3,'dixon вошел в систему с IP 178.88.175.252'),(333,-1,'system','2019-02-27 09:07:41','login',3,'dixon вошел в систему с IP 178.88.175.252'),(334,-1,'system','2019-03-01 02:57:46','login',3,'dixon вошел в систему с IP 178.88.175.252'),(335,1,'notepad','2019-03-01 04:33:06','tools',4,'dixon добавил объект 1'),(336,-1,'system','2019-03-01 04:55:14','login',3,'dixon вошел в систему с IP 178.88.175.252'),(337,1,'contracts','2019-03-01 08:06:39','financial',4,'dixon добавил связь с объектом'),(338,2,'notepad','2019-03-01 08:07:24','tools',4,'dixon добавил объект 2'),(339,1,'PluginGenericobjectCnehcode','2019-03-01 08:09:48','setup',4,'dixon добавил объект 1Gb'),(340,2,'PluginGenericobjectCnehcode','2019-03-01 08:09:52','setup',4,'dixon добавил объект 2Gb'),(341,3,'PluginGenericobjectCnehcode','2019-03-01 08:09:56','setup',4,'dixon добавил объект 3Gb'),(342,4,'PluginGenericobjectCnehcode','2019-03-01 08:10:00','setup',4,'dixon добавил объект 4Gb'),(343,5,'PluginGenericobjectCnehcode','2019-03-01 08:10:03','setup',4,'dixon добавил объект 5Gb'),(344,6,'PluginGenericobjectCnehcode','2019-03-01 08:10:08','setup',4,'dixon добавил объект 6Gb'),(345,7,'PluginGenericobjectCnehcode','2019-03-01 08:10:12','setup',4,'dixon добавил объект 7Gb'),(346,8,'PluginGenericobjectCnehcode','2019-03-01 08:10:17','setup',4,'dixon добавил объект 8Gb'),(347,9,'PluginGenericobjectCnehcode','2019-03-01 08:10:22','setup',4,'dixon добавил объект 9Gb'),(348,10,'PluginGenericobjectCnehcode','2019-03-01 08:10:27','setup',4,'dixon добавил объект 10Gb'),(349,11,'PluginGenericobjectCnehcode','2019-03-01 08:10:30','setup',4,'dixon добавил объект 11Gb'),(350,12,'PluginGenericobjectCnehcode','2019-03-01 08:10:34','setup',4,'dixon добавил объект 12Gb'),(351,13,'PluginGenericobjectCnehcode','2019-03-01 08:10:37','setup',4,'dixon добавил объект 13Gb'),(352,14,'PluginGenericobjectCnehcode','2019-03-01 08:10:41','setup',4,'dixon добавил объект 14Gb'),(353,15,'PluginGenericobjectCnehcode','2019-03-01 08:10:45','setup',4,'dixon добавил объект 15Gb'),(354,16,'PluginGenericobjectCnehcode','2019-03-01 08:10:49','setup',4,'dixon добавил объект 16Gb'),(355,17,'PluginGenericobjectCnehcode','2019-03-01 08:10:54','setup',4,'dixon добавил объект 17Gb'),(356,18,'PluginGenericobjectCnehcode','2019-03-01 08:10:59','setup',4,'dixon добавил объект 18Gb'),(357,19,'PluginGenericobjectCnehcode','2019-03-01 08:11:04','setup',4,'dixon добавил объект 19Gb'),(358,20,'PluginGenericobjectCnehcode','2019-03-01 08:11:10','setup',4,'dixon добавил объект 20Gb'),(359,-1,'system','2019-03-02 05:24:36','login',3,'dixon вошел в систему с IP 178.88.175.252');
/*!40000 ALTER TABLE `glpi_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_fieldblacklists`
--

DROP TABLE IF EXISTS `glpi_fieldblacklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_fieldblacklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_fieldblacklists`
--

LOCK TABLES `glpi_fieldblacklists` WRITE;
/*!40000 ALTER TABLE `glpi_fieldblacklists` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_fieldblacklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_fieldunicities`
--

DROP TABLE IF EXISTS `glpi_fieldunicities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_fieldunicities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `fields` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `action_refuse` tinyint(1) NOT NULL DEFAULT '0',
  `action_notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores field unicity criterias';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_fieldunicities`
--

LOCK TABLES `glpi_fieldunicities` WRITE;
/*!40000 ALTER TABLE `glpi_fieldunicities` DISABLE KEYS */;
INSERT INTO `glpi_fieldunicities` VALUES (1,'Находится на',0,'Computer',0,'name',1,0,0,'','2019-02-22 09:57:33','2019-02-22 09:57:33');
/*!40000 ALTER TABLE `glpi_fieldunicities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_filesystems`
--

DROP TABLE IF EXISTS `glpi_filesystems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_filesystems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_filesystems`
--

LOCK TABLES `glpi_filesystems` WRITE;
/*!40000 ALTER TABLE `glpi_filesystems` DISABLE KEYS */;
INSERT INTO `glpi_filesystems` VALUES (1,'ext',NULL,NULL,NULL),(2,'ext2',NULL,NULL,NULL),(3,'ext3',NULL,NULL,NULL),(4,'ext4',NULL,NULL,NULL),(5,'FAT',NULL,NULL,NULL),(6,'FAT32',NULL,NULL,NULL),(7,'VFAT',NULL,NULL,NULL),(8,'HFS',NULL,NULL,NULL),(9,'HPFS',NULL,NULL,NULL),(10,'HTFS',NULL,NULL,NULL),(11,'JFS',NULL,NULL,NULL),(12,'JFS2',NULL,NULL,NULL),(13,'NFS',NULL,NULL,NULL),(14,'NTFS',NULL,NULL,NULL),(15,'ReiserFS',NULL,NULL,NULL),(16,'SMBFS',NULL,NULL,NULL),(17,'UDF',NULL,NULL,NULL),(18,'UFS',NULL,NULL,NULL),(19,'XFS',NULL,NULL,NULL),(20,'ZFS',NULL,NULL,NULL);
/*!40000 ALTER TABLE `glpi_filesystems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_fqdns`
--

DROP TABLE IF EXISTS `glpi_fqdns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_fqdns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fqdn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `name` (`name`),
  KEY `fqdn` (`fqdn`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_fqdns`
--

LOCK TABLES `glpi_fqdns` WRITE;
/*!40000 ALTER TABLE `glpi_fqdns` DISABLE KEYS */;
INSERT INTO `glpi_fqdns` VALUES (1,0,0,'ktcl.kz','ktcl.kz','','2019-02-14 06:14:08','2019-02-14 06:14:08'),(2,0,0,'mycloud.kz','mycloud.kz','','2019-02-14 06:15:35','2019-02-14 06:15:35');
/*!40000 ALTER TABLE `glpi_fqdns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_groups`
--

DROP TABLE IF EXISTS `glpi_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `ldap_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ldap_value` text COLLATE utf8_unicode_ci,
  `ldap_group_dn` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `is_requester` tinyint(1) NOT NULL DEFAULT '1',
  `is_watcher` tinyint(1) NOT NULL DEFAULT '1',
  `is_assign` tinyint(1) NOT NULL DEFAULT '1',
  `is_task` tinyint(1) NOT NULL DEFAULT '1',
  `is_notify` tinyint(1) NOT NULL DEFAULT '1',
  `is_itemgroup` tinyint(1) NOT NULL DEFAULT '1',
  `is_usergroup` tinyint(1) NOT NULL DEFAULT '1',
  `is_manager` tinyint(1) NOT NULL DEFAULT '1',
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `ldap_field` (`ldap_field`),
  KEY `entities_id` (`entities_id`),
  KEY `date_mod` (`date_mod`),
  KEY `ldap_value` (`ldap_value`(200)),
  KEY `ldap_group_dn` (`ldap_group_dn`(200)),
  KEY `groups_id` (`groups_id`),
  KEY `is_requester` (`is_requester`),
  KEY `is_assign` (`is_assign`),
  KEY `is_notify` (`is_notify`),
  KEY `is_itemgroup` (`is_itemgroup`),
  KEY `is_usergroup` (`is_usergroup`),
  KEY `is_manager` (`is_manager`),
  KEY `date_creation` (`date_creation`),
  KEY `is_watcher` (`is_watcher`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_groups`
--

LOCK TABLES `glpi_groups` WRITE;
/*!40000 ALTER TABLE `glpi_groups` DISABLE KEYS */;
INSERT INTO `glpi_groups` VALUES (1,0,0,'Системный администратор','',NULL,NULL,NULL,'2019-02-11 09:41:30',0,'Системный администратор',1,'[]','{\"1\":\"1\",\"2\":\"2\",\"4\":\"4\",\"5\":\"5\",\"3\":\"3\"}',1,1,1,1,1,1,1,1,'2019-02-11 09:41:30'),(2,0,0,'Дежурный специалист','',NULL,NULL,NULL,'2019-02-11 09:42:11',1,'Системный администратор > Дежурный специалист',2,'{\"1\":\"1\"}',NULL,1,1,1,0,1,1,1,1,'2019-02-11 09:42:11'),(3,0,0,'Сетевой администратор','',NULL,NULL,NULL,'2019-02-11 09:42:40',1,'Системный администратор > Сетевой администратор',2,'{\"1\":\"1\"}',NULL,1,1,1,0,1,1,1,1,'2019-02-11 09:42:40'),(4,0,0,'Инженер энергетик','',NULL,NULL,NULL,'2019-02-11 09:43:12',1,'Системный администратор > Инженер энергетик',2,'{\"1\":\"1\"}',NULL,1,1,1,0,1,1,1,1,'2019-02-11 09:43:12'),(5,0,0,'Пользо-ватель','',NULL,NULL,NULL,'2019-02-11 09:43:29',1,'Системный администратор > Пользо-ватель',2,'{\"1\":\"1\"}',NULL,1,1,1,0,1,1,1,1,'2019-02-11 09:43:29'),(6,0,0,'Разработчик','',NULL,NULL,NULL,'2019-02-15 04:37:52',0,'Разработчик',1,'[]',NULL,1,1,1,0,1,1,1,1,'2019-02-15 04:37:52');
/*!40000 ALTER TABLE `glpi_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_groups_knowbaseitems`
--

DROP TABLE IF EXISTS `glpi_groups_knowbaseitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_groups_knowbaseitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `groups_id` (`groups_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_groups_knowbaseitems`
--

LOCK TABLES `glpi_groups_knowbaseitems` WRITE;
/*!40000 ALTER TABLE `glpi_groups_knowbaseitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_groups_knowbaseitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_groups_problems`
--

DROP TABLE IF EXISTS `glpi_groups_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_groups_problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problems_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`type`,`groups_id`),
  KEY `group` (`groups_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_groups_problems`
--

LOCK TABLES `glpi_groups_problems` WRITE;
/*!40000 ALTER TABLE `glpi_groups_problems` DISABLE KEYS */;
INSERT INTO `glpi_groups_problems` VALUES (1,1,2,3),(2,2,1,3);
/*!40000 ALTER TABLE `glpi_groups_problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_groups_reminders`
--

DROP TABLE IF EXISTS `glpi_groups_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_groups_reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reminders_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `groups_id` (`groups_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_groups_reminders`
--

LOCK TABLES `glpi_groups_reminders` WRITE;
/*!40000 ALTER TABLE `glpi_groups_reminders` DISABLE KEYS */;
INSERT INTO `glpi_groups_reminders` VALUES (1,2,2,0,0);
/*!40000 ALTER TABLE `glpi_groups_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_groups_rssfeeds`
--

DROP TABLE IF EXISTS `glpi_groups_rssfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_groups_rssfeeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rssfeeds_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rssfeeds_id` (`rssfeeds_id`),
  KEY `groups_id` (`groups_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_groups_rssfeeds`
--

LOCK TABLES `glpi_groups_rssfeeds` WRITE;
/*!40000 ALTER TABLE `glpi_groups_rssfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_groups_rssfeeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_groups_tickets`
--

DROP TABLE IF EXISTS `glpi_groups_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_groups_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`type`,`groups_id`),
  KEY `group` (`groups_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_groups_tickets`
--

LOCK TABLES `glpi_groups_tickets` WRITE;
/*!40000 ALTER TABLE `glpi_groups_tickets` DISABLE KEYS */;
INSERT INTO `glpi_groups_tickets` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `glpi_groups_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_groups_users`
--

DROP TABLE IF EXISTS `glpi_groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_groups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `is_manager` tinyint(1) NOT NULL DEFAULT '0',
  `is_userdelegate` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`groups_id`),
  KEY `groups_id` (`groups_id`),
  KEY `is_manager` (`is_manager`),
  KEY `is_userdelegate` (`is_userdelegate`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_groups_users`
--

LOCK TABLES `glpi_groups_users` WRITE;
/*!40000 ALTER TABLE `glpi_groups_users` DISABLE KEYS */;
INSERT INTO `glpi_groups_users` VALUES (1,4,2,0,0,0),(2,7,6,0,1,0);
/*!40000 ALTER TABLE `glpi_groups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_holidays`
--

DROP TABLE IF EXISTS `glpi_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_perpetual` tinyint(1) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `is_perpetual` (`is_perpetual`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_holidays`
--

LOCK TABLES `glpi_holidays` WRITE;
/*!40000 ALTER TABLE `glpi_holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_infocoms`
--

DROP TABLE IF EXISTS `glpi_infocoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_infocoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `buy_date` date DEFAULT NULL,
  `use_date` date DEFAULT NULL,
  `warranty_duration` int(11) NOT NULL DEFAULT '0',
  `warranty_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suppliers_id` int(11) NOT NULL DEFAULT '0',
  `order_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `immo_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `warranty_value` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `sink_time` int(11) NOT NULL DEFAULT '0',
  `sink_type` int(11) NOT NULL DEFAULT '0',
  `sink_coeff` float NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `bill` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `budgets_id` int(11) NOT NULL DEFAULT '0',
  `alert` int(11) NOT NULL DEFAULT '0',
  `order_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `inventory_date` date DEFAULT NULL,
  `warranty_date` date DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `decommission_date` datetime DEFAULT NULL,
  `businesscriticities_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  KEY `buy_date` (`buy_date`),
  KEY `alert` (`alert`),
  KEY `budgets_id` (`budgets_id`),
  KEY `suppliers_id` (`suppliers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `businesscriticities_id` (`businesscriticities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_infocoms`
--

LOCK TABLES `glpi_infocoms` WRITE;
/*!40000 ALTER TABLE `glpi_infocoms` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_infocoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_interfacetypes`
--

DROP TABLE IF EXISTS `glpi_interfacetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_interfacetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_interfacetypes`
--

LOCK TABLES `glpi_interfacetypes` WRITE;
/*!40000 ALTER TABLE `glpi_interfacetypes` DISABLE KEYS */;
INSERT INTO `glpi_interfacetypes` VALUES (1,'IDE',NULL,NULL,NULL),(2,'SATA',NULL,NULL,NULL),(3,'SCSI',NULL,NULL,NULL),(4,'USB',NULL,NULL,NULL),(5,'AGP','',NULL,NULL),(6,'PCI','',NULL,NULL),(7,'PCIe','',NULL,NULL),(8,'PCI-X','',NULL,NULL);
/*!40000 ALTER TABLE `glpi_interfacetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_ipaddresses`
--

DROP TABLE IF EXISTS `glpi_ipaddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_ipaddresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `version` tinyint(3) unsigned DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `binary_0` int(10) unsigned NOT NULL DEFAULT '0',
  `binary_1` int(10) unsigned NOT NULL DEFAULT '0',
  `binary_2` int(10) unsigned NOT NULL DEFAULT '0',
  `binary_3` int(10) unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `mainitems_id` int(11) NOT NULL DEFAULT '0',
  `mainitemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `textual` (`name`),
  KEY `binary` (`binary_0`,`binary_1`,`binary_2`,`binary_3`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `item` (`itemtype`,`items_id`,`is_deleted`),
  KEY `mainitem` (`mainitemtype`,`mainitems_id`,`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_ipaddresses`
--

LOCK TABLES `glpi_ipaddresses` WRITE;
/*!40000 ALTER TABLE `glpi_ipaddresses` DISABLE KEYS */;
INSERT INTO `glpi_ipaddresses` VALUES (1,0,1,'NetworkName',4,'192.168.0.5',0,0,65535,3232235525,0,0,1,'Computer'),(2,0,2,'NetworkName',4,'192.168.1.1',0,0,65535,3232235777,0,0,2,'NetworkEquipment'),(3,0,3,'NetworkName',4,'192.168.1.1',0,0,65535,3232235777,0,0,1,'Computer');
/*!40000 ALTER TABLE `glpi_ipaddresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_ipaddresses_ipnetworks`
--

DROP TABLE IF EXISTS `glpi_ipaddresses_ipnetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_ipaddresses_ipnetworks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipaddresses_id` int(11) NOT NULL DEFAULT '0',
  `ipnetworks_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`ipaddresses_id`,`ipnetworks_id`),
  KEY `ipnetworks_id` (`ipnetworks_id`),
  KEY `ipaddresses_id` (`ipaddresses_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_ipaddresses_ipnetworks`
--

LOCK TABLES `glpi_ipaddresses_ipnetworks` WRITE;
/*!40000 ALTER TABLE `glpi_ipaddresses_ipnetworks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_ipaddresses_ipnetworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_ipnetworks`
--

DROP TABLE IF EXISTS `glpi_ipnetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_ipnetworks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `ipnetworks_id` int(11) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `addressable` tinyint(1) NOT NULL DEFAULT '0',
  `version` tinyint(3) unsigned DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_0` int(10) unsigned NOT NULL DEFAULT '0',
  `address_1` int(10) unsigned NOT NULL DEFAULT '0',
  `address_2` int(10) unsigned NOT NULL DEFAULT '0',
  `address_3` int(10) unsigned NOT NULL DEFAULT '0',
  `netmask` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `netmask_0` int(10) unsigned NOT NULL DEFAULT '0',
  `netmask_1` int(10) unsigned NOT NULL DEFAULT '0',
  `netmask_2` int(10) unsigned NOT NULL DEFAULT '0',
  `netmask_3` int(10) unsigned NOT NULL DEFAULT '0',
  `gateway` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gateway_0` int(10) unsigned NOT NULL DEFAULT '0',
  `gateway_1` int(10) unsigned NOT NULL DEFAULT '0',
  `gateway_2` int(10) unsigned NOT NULL DEFAULT '0',
  `gateway_3` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `network_definition` (`entities_id`,`address`,`netmask`),
  KEY `address` (`address_0`,`address_1`,`address_2`,`address_3`),
  KEY `netmask` (`netmask_0`,`netmask_1`,`netmask_2`,`netmask_3`),
  KEY `gateway` (`gateway_0`,`gateway_1`,`gateway_2`,`gateway_3`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_ipnetworks`
--

LOCK TABLES `glpi_ipnetworks` WRITE;
/*!40000 ALTER TABLE `glpi_ipnetworks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_ipnetworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_ipnetworks_vlans`
--

DROP TABLE IF EXISTS `glpi_ipnetworks_vlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_ipnetworks_vlans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipnetworks_id` int(11) NOT NULL DEFAULT '0',
  `vlans_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`ipnetworks_id`,`vlans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_ipnetworks_vlans`
--

LOCK TABLES `glpi_ipnetworks_vlans` WRITE;
/*!40000 ALTER TABLE `glpi_ipnetworks_vlans` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_ipnetworks_vlans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicebatteries`
--

DROP TABLE IF EXISTS `glpi_items_devicebatteries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicebatteries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicebatteries_id` int(11) NOT NULL DEFAULT '0',
  `manufacturing_date` date DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicebatteries_id` (`devicebatteries_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicebatteries`
--

LOCK TABLES `glpi_items_devicebatteries` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicebatteries` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicebatteries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicecases`
--

DROP TABLE IF EXISTS `glpi_items_devicecases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicecases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicecases_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicecases_id` (`devicecases_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicecases`
--

LOCK TABLES `glpi_items_devicecases` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicecases` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicecases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicecontrols`
--

DROP TABLE IF EXISTS `glpi_items_devicecontrols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicecontrols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicecontrols_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `busID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicecontrols_id` (`devicecontrols_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicecontrols`
--

LOCK TABLES `glpi_items_devicecontrols` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicecontrols` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicecontrols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicedrives`
--

DROP TABLE IF EXISTS `glpi_items_devicedrives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicedrives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicedrives_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `busID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicedrives_id` (`devicedrives_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicedrives`
--

LOCK TABLES `glpi_items_devicedrives` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicedrives` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicedrives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicefirmwares`
--

DROP TABLE IF EXISTS `glpi_items_devicefirmwares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicefirmwares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicefirmwares_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicefirmwares_id` (`devicefirmwares_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicefirmwares`
--

LOCK TABLES `glpi_items_devicefirmwares` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicefirmwares` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicefirmwares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicegenerics`
--

DROP TABLE IF EXISTS `glpi_items_devicegenerics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicegenerics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicegenerics_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicegenerics_id` (`devicegenerics_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicegenerics`
--

LOCK TABLES `glpi_items_devicegenerics` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicegenerics` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicegenerics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicegraphiccards`
--

DROP TABLE IF EXISTS `glpi_items_devicegraphiccards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicegraphiccards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicegraphiccards_id` int(11) NOT NULL DEFAULT '0',
  `memory` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `busID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicegraphiccards_id` (`devicegraphiccards_id`),
  KEY `specificity` (`memory`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicegraphiccards`
--

LOCK TABLES `glpi_items_devicegraphiccards` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicegraphiccards` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicegraphiccards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_deviceharddrives`
--

DROP TABLE IF EXISTS `glpi_items_deviceharddrives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_deviceharddrives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deviceharddrives_id` int(11) NOT NULL DEFAULT '0',
  `capacity` int(11) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `busID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `deviceharddrives_id` (`deviceharddrives_id`),
  KEY `specificity` (`capacity`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_deviceharddrives`
--

LOCK TABLES `glpi_items_deviceharddrives` WRITE;
/*!40000 ALTER TABLE `glpi_items_deviceharddrives` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_deviceharddrives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicememories`
--

DROP TABLE IF EXISTS `glpi_items_devicememories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicememories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicememories_id` int(11) NOT NULL DEFAULT '0',
  `size` int(11) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `busID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicememories_id` (`devicememories_id`),
  KEY `specificity` (`size`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicememories`
--

LOCK TABLES `glpi_items_devicememories` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicememories` DISABLE KEYS */;
INSERT INTO `glpi_items_devicememories` VALUES (1,1,'Computer',1,4000,NULL,0,0,0,0,NULL,NULL,1,0);
/*!40000 ALTER TABLE `glpi_items_devicememories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicemotherboards`
--

DROP TABLE IF EXISTS `glpi_items_devicemotherboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicemotherboards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicemotherboards_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicemotherboards_id` (`devicemotherboards_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicemotherboards`
--

LOCK TABLES `glpi_items_devicemotherboards` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicemotherboards` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicemotherboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicenetworkcards`
--

DROP TABLE IF EXISTS `glpi_items_devicenetworkcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicenetworkcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicenetworkcards_id` int(11) NOT NULL DEFAULT '0',
  `mac` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `busID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicenetworkcards_id` (`devicenetworkcards_id`),
  KEY `specificity` (`mac`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicenetworkcards`
--

LOCK TABLES `glpi_items_devicenetworkcards` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicenetworkcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicenetworkcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicepcis`
--

DROP TABLE IF EXISTS `glpi_items_devicepcis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicepcis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicepcis_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `busID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicepcis_id` (`devicepcis_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicepcis`
--

LOCK TABLES `glpi_items_devicepcis` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicepcis` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicepcis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicepowersupplies`
--

DROP TABLE IF EXISTS `glpi_items_devicepowersupplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicepowersupplies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicepowersupplies_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicepowersupplies_id` (`devicepowersupplies_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicepowersupplies`
--

LOCK TABLES `glpi_items_devicepowersupplies` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicepowersupplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicepowersupplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_deviceprocessors`
--

DROP TABLE IF EXISTS `glpi_items_deviceprocessors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_deviceprocessors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deviceprocessors_id` int(11) NOT NULL DEFAULT '0',
  `frequency` int(11) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `nbcores` int(11) DEFAULT NULL,
  `nbthreads` int(11) DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `busID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `deviceprocessors_id` (`deviceprocessors_id`),
  KEY `specificity` (`frequency`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `nbcores` (`nbcores`),
  KEY `nbthreads` (`nbthreads`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_deviceprocessors`
--

LOCK TABLES `glpi_items_deviceprocessors` WRITE;
/*!40000 ALTER TABLE `glpi_items_deviceprocessors` DISABLE KEYS */;
INSERT INTO `glpi_items_deviceprocessors` VALUES (1,1,'Computer',1,3400,NULL,0,0,4,2,0,0,NULL,NULL,1,0);
/*!40000 ALTER TABLE `glpi_items_deviceprocessors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicesensors`
--

DROP TABLE IF EXISTS `glpi_items_devicesensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicesensors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicesensors_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicesensors_id` (`devicesensors_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicesensors`
--

LOCK TABLES `glpi_items_devicesensors` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicesensors` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicesensors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicesimcards`
--

DROP TABLE IF EXISTS `glpi_items_devicesimcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicesimcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to various table, according to itemtype (id)',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `devicesimcards_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `states_id` int(11) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `lines_id` int(11) NOT NULL DEFAULT '0',
  `pin` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pin2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `puk` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `puk2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `msin` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `devicesimcards_id` (`devicesimcards_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `states_id` (`states_id`),
  KEY `locations_id` (`locations_id`),
  KEY `lines_id` (`lines_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicesimcards`
--

LOCK TABLES `glpi_items_devicesimcards` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicesimcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicesimcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicesoundcards`
--

DROP TABLE IF EXISTS `glpi_items_devicesoundcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicesoundcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `devicesoundcards_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `busID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `devicesoundcards_id` (`devicesoundcards_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicesoundcards`
--

LOCK TABLES `glpi_items_devicesoundcards` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicesoundcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicesoundcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_disks`
--

DROP TABLE IF EXISTS `glpi_items_disks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_disks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mountpoint` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filesystems_id` int(11) NOT NULL DEFAULT '0',
  `totalsize` int(11) NOT NULL DEFAULT '0',
  `freesize` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `device` (`device`),
  KEY `mountpoint` (`mountpoint`),
  KEY `totalsize` (`totalsize`),
  KEY `freesize` (`freesize`),
  KEY `itemtype` (`itemtype`),
  KEY `items_id` (`items_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `filesystems_id` (`filesystems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_disks`
--

LOCK TABLES `glpi_items_disks` WRITE;
/*!40000 ALTER TABLE `glpi_items_disks` DISABLE KEYS */;
INSERT INTO `glpi_items_disks` VALUES (1,0,'Computer',1,'1Tb','/sdb1','/sdb',4,1024000,500000,0,0,'2019-02-14 05:32:01','2019-02-13 05:05:12'),(2,0,'Computer',1,'3Tb','/dev/sde1','/dev/sde',4,3000000,500000,0,0,'2019-02-19 05:01:09','2019-02-19 05:01:09');
/*!40000 ALTER TABLE `glpi_items_disks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_enclosures`
--

DROP TABLE IF EXISTS `glpi_items_enclosures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_enclosures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enclosures_id` int(11) NOT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `items_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`itemtype`,`items_id`),
  KEY `relation` (`enclosures_id`,`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_enclosures`
--

LOCK TABLES `glpi_items_enclosures` WRITE;
/*!40000 ALTER TABLE `glpi_items_enclosures` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_enclosures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_operatingsystems`
--

DROP TABLE IF EXISTS `glpi_items_operatingsystems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_operatingsystems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operatingsystems_id` int(11) NOT NULL DEFAULT '0',
  `operatingsystemversions_id` int(11) NOT NULL DEFAULT '0',
  `operatingsystemservicepacks_id` int(11) NOT NULL DEFAULT '0',
  `operatingsystemarchitectures_id` int(11) NOT NULL DEFAULT '0',
  `operatingsystemkernelversions_id` int(11) NOT NULL DEFAULT '0',
  `license_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `licenseid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operatingsystemeditions_id` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`items_id`,`itemtype`,`operatingsystems_id`,`operatingsystemarchitectures_id`),
  KEY `items_id` (`items_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `operatingsystems_id` (`operatingsystems_id`),
  KEY `operatingsystemservicepacks_id` (`operatingsystemservicepacks_id`),
  KEY `operatingsystemversions_id` (`operatingsystemversions_id`),
  KEY `operatingsystemarchitectures_id` (`operatingsystemarchitectures_id`),
  KEY `operatingsystemkernelversions_id` (`operatingsystemkernelversions_id`),
  KEY `operatingsystemeditions_id` (`operatingsystemeditions_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_operatingsystems`
--

LOCK TABLES `glpi_items_operatingsystems` WRITE;
/*!40000 ALTER TABLE `glpi_items_operatingsystems` DISABLE KEYS */;
INSERT INTO `glpi_items_operatingsystems` VALUES (1,1,'Computer',1,1,0,1,1,'132','',0,'2019-02-15 09:06:34','2019-02-15 09:06:34',0,0,0,0);
/*!40000 ALTER TABLE `glpi_items_operatingsystems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_problems`
--

DROP TABLE IF EXISTS `glpi_items_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problems_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_problems`
--

LOCK TABLES `glpi_items_problems` WRITE;
/*!40000 ALTER TABLE `glpi_items_problems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_projects`
--

DROP TABLE IF EXISTS `glpi_items_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projects_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`projects_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_projects`
--

LOCK TABLES `glpi_items_projects` WRITE;
/*!40000 ALTER TABLE `glpi_items_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_racks`
--

DROP TABLE IF EXISTS `glpi_items_racks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_racks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `racks_id` int(11) NOT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `items_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `orientation` tinyint(1) DEFAULT NULL,
  `bgcolor` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hpos` tinyint(1) NOT NULL DEFAULT '0',
  `is_reserved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`itemtype`,`items_id`,`is_reserved`),
  KEY `relation` (`racks_id`,`itemtype`,`items_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_racks`
--

LOCK TABLES `glpi_items_racks` WRITE;
/*!40000 ALTER TABLE `glpi_items_racks` DISABLE KEYS */;
INSERT INTO `glpi_items_racks` VALUES (1,1,'Computer',1,31,0,'#69ceba',0,0),(2,1,'Peripheral',1,3,1,'#69ce77',0,0),(3,1,'NetworkEquipment',1,4,1,'#6d8ad7',0,0),(4,1,'NetworkEquipment',2,5,1,'#5f72e9',0,0),(5,1,'PDU',1,1,0,'#69ceba',0,0);
/*!40000 ALTER TABLE `glpi_items_racks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_tickets`
--

DROP TABLE IF EXISTS `glpi_items_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`tickets_id`),
  KEY `tickets_id` (`tickets_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_tickets`
--

LOCK TABLES `glpi_items_tickets` WRITE;
/*!40000 ALTER TABLE `glpi_items_tickets` DISABLE KEYS */;
INSERT INTO `glpi_items_tickets` VALUES (1,'Computer',1,1);
/*!40000 ALTER TABLE `glpi_items_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_itilcategories`
--

DROP TABLE IF EXISTS `glpi_itilcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_itilcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `itilcategories_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `completename` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `knowbaseitemcategories_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `is_helpdeskvisible` tinyint(1) NOT NULL DEFAULT '1',
  `tickettemplates_id_incident` int(11) NOT NULL DEFAULT '0',
  `tickettemplates_id_demand` int(11) NOT NULL DEFAULT '0',
  `is_incident` int(11) NOT NULL DEFAULT '1',
  `is_request` int(11) NOT NULL DEFAULT '1',
  `is_problem` int(11) NOT NULL DEFAULT '1',
  `is_change` tinyint(1) NOT NULL DEFAULT '1',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  KEY `users_id` (`users_id`),
  KEY `groups_id` (`groups_id`),
  KEY `is_helpdeskvisible` (`is_helpdeskvisible`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `tickettemplates_id_incident` (`tickettemplates_id_incident`),
  KEY `tickettemplates_id_demand` (`tickettemplates_id_demand`),
  KEY `is_incident` (`is_incident`),
  KEY `is_request` (`is_request`),
  KEY `is_problem` (`is_problem`),
  KEY `is_change` (`is_change`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_itilcategories`
--

LOCK TABLES `glpi_itilcategories` WRITE;
/*!40000 ALTER TABLE `glpi_itilcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_itilcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_itilfollowups`
--

DROP TABLE IF EXISTS `glpi_itilfollowups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_itilfollowups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `users_id_editor` int(11) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `requesttypes_id` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `timeline_position` tinyint(1) NOT NULL DEFAULT '0',
  `sourceitems_id` int(11) NOT NULL DEFAULT '0',
  `sourceof_items_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `users_id` (`users_id`),
  KEY `users_id_editor` (`users_id_editor`),
  KEY `is_private` (`is_private`),
  KEY `requesttypes_id` (`requesttypes_id`),
  KEY `itemtype` (`itemtype`),
  KEY `item_id` (`items_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `sourceitems_id` (`sourceitems_id`),
  KEY `sourceof_items_id` (`sourceof_items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_itilfollowups`
--

LOCK TABLES `glpi_itilfollowups` WRITE;
/*!40000 ALTER TABLE `glpi_itilfollowups` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_itilfollowups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_itils_projects`
--

DROP TABLE IF EXISTS `glpi_itils_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_itils_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `items_id` int(11) NOT NULL DEFAULT '0',
  `projects_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`projects_id`),
  KEY `projects_id` (`projects_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_itils_projects`
--

LOCK TABLES `glpi_itils_projects` WRITE;
/*!40000 ALTER TABLE `glpi_itils_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_itils_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_itilsolutions`
--

DROP TABLE IF EXISTS `glpi_itilsolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_itilsolutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `solutiontypes_id` int(11) NOT NULL DEFAULT '0',
  `solutiontype_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `date_creation` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_approval` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id_editor` int(11) NOT NULL DEFAULT '0',
  `users_id_approval` int(11) NOT NULL DEFAULT '0',
  `user_name_approval` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `itilfollowups_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `itemtype` (`itemtype`),
  KEY `item_id` (`items_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `solutiontypes_id` (`solutiontypes_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_editor` (`users_id_editor`),
  KEY `users_id_approval` (`users_id_approval`),
  KEY `status` (`status`),
  KEY `itilfollowups_id` (`itilfollowups_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_itilsolutions`
--

LOCK TABLES `glpi_itilsolutions` WRITE;
/*!40000 ALTER TABLE `glpi_itilsolutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_itilsolutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_knowbaseitemcategories`
--

DROP TABLE IF EXISTS `glpi_knowbaseitemcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_knowbaseitemcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `knowbaseitemcategories_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `completename` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`entities_id`,`knowbaseitemcategories_id`,`name`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_knowbaseitemcategories`
--

LOCK TABLES `glpi_knowbaseitemcategories` WRITE;
/*!40000 ALTER TABLE `glpi_knowbaseitemcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_knowbaseitemcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_knowbaseitems`
--

DROP TABLE IF EXISTS `glpi_knowbaseitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_knowbaseitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowbaseitemcategories_id` int(11) NOT NULL DEFAULT '0',
  `name` text COLLATE utf8_unicode_ci,
  `answer` longtext COLLATE utf8_unicode_ci,
  `is_faq` tinyint(1) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `view` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  KEY `is_faq` (`is_faq`),
  KEY `date_mod` (`date_mod`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  FULLTEXT KEY `fulltext` (`name`,`answer`),
  FULLTEXT KEY `name` (`name`),
  FULLTEXT KEY `answer` (`answer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_knowbaseitems`
--

LOCK TABLES `glpi_knowbaseitems` WRITE;
/*!40000 ALTER TABLE `glpi_knowbaseitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_knowbaseitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_knowbaseitems_comments`
--

DROP TABLE IF EXISTS `glpi_knowbaseitems_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_knowbaseitems_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_knowbaseitems_comments`
--

LOCK TABLES `glpi_knowbaseitems_comments` WRITE;
/*!40000 ALTER TABLE `glpi_knowbaseitems_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_knowbaseitems_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_knowbaseitems_items`
--

DROP TABLE IF EXISTS `glpi_knowbaseitems_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_knowbaseitems_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(11) NOT NULL,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `date_creation` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`knowbaseitems_id`),
  KEY `itemtype` (`itemtype`),
  KEY `item_id` (`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_knowbaseitems_items`
--

LOCK TABLES `glpi_knowbaseitems_items` WRITE;
/*!40000 ALTER TABLE `glpi_knowbaseitems_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_knowbaseitems_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_knowbaseitems_profiles`
--

DROP TABLE IF EXISTS `glpi_knowbaseitems_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_knowbaseitems_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(11) NOT NULL DEFAULT '0',
  `profiles_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_knowbaseitems_profiles`
--

LOCK TABLES `glpi_knowbaseitems_profiles` WRITE;
/*!40000 ALTER TABLE `glpi_knowbaseitems_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_knowbaseitems_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_knowbaseitems_revisions`
--

DROP TABLE IF EXISTS `glpi_knowbaseitems_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_knowbaseitems_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(11) NOT NULL,
  `revision` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `answer` longtext COLLATE utf8_unicode_ci,
  `language` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`knowbaseitems_id`,`revision`,`language`),
  KEY `revision` (`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_knowbaseitems_revisions`
--

LOCK TABLES `glpi_knowbaseitems_revisions` WRITE;
/*!40000 ALTER TABLE `glpi_knowbaseitems_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_knowbaseitems_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_knowbaseitems_users`
--

DROP TABLE IF EXISTS `glpi_knowbaseitems_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_knowbaseitems_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_knowbaseitems_users`
--

LOCK TABLES `glpi_knowbaseitems_users` WRITE;
/*!40000 ALTER TABLE `glpi_knowbaseitems_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_knowbaseitems_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_knowbaseitemtranslations`
--

DROP TABLE IF EXISTS `glpi_knowbaseitemtranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_knowbaseitemtranslations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `answer` longtext COLLATE utf8_unicode_ci,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`knowbaseitems_id`,`language`),
  KEY `users_id` (`users_id`),
  FULLTEXT KEY `fulltext` (`name`,`answer`),
  FULLTEXT KEY `name` (`name`),
  FULLTEXT KEY `answer` (`answer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_knowbaseitemtranslations`
--

LOCK TABLES `glpi_knowbaseitemtranslations` WRITE;
/*!40000 ALTER TABLE `glpi_knowbaseitemtranslations` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_knowbaseitemtranslations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_lineoperators`
--

DROP TABLE IF EXISTS `glpi_lineoperators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_lineoperators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8_unicode_ci,
  `mcc` int(11) DEFAULT NULL,
  `mnc` int(11) DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`mcc`,`mnc`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_lineoperators`
--

LOCK TABLES `glpi_lineoperators` WRITE;
/*!40000 ALTER TABLE `glpi_lineoperators` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_lineoperators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_lines`
--

DROP TABLE IF EXISTS `glpi_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `caller_num` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `lineoperators_id` int(11) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `linetypes_id` int(11) NOT NULL DEFAULT '0',
  `date_creation` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `users_id` (`users_id`),
  KEY `lineoperators_id` (`lineoperators_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_lines`
--

LOCK TABLES `glpi_lines` WRITE;
/*!40000 ALTER TABLE `glpi_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_linetypes`
--

DROP TABLE IF EXISTS `glpi_linetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_linetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_linetypes`
--

LOCK TABLES `glpi_linetypes` WRITE;
/*!40000 ALTER TABLE `glpi_linetypes` DISABLE KEYS */;
INSERT INTO `glpi_linetypes` VALUES (1,'INT','','2019-02-15 05:50:36','2019-02-15 05:50:36'),(2,'VPN','','2019-02-15 05:50:45','2019-02-15 05:50:45'),(3,'SIP','','2019-02-15 05:50:51','2019-02-15 05:50:51');
/*!40000 ALTER TABLE `glpi_linetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_links`
--

DROP TABLE IF EXISTS `glpi_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `open_window` tinyint(1) NOT NULL DEFAULT '1',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_links`
--

LOCK TABLES `glpi_links` WRITE;
/*!40000 ALTER TABLE `glpi_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_links_itemtypes`
--

DROP TABLE IF EXISTS `glpi_links_itemtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_links_itemtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `links_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`links_id`),
  KEY `links_id` (`links_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_links_itemtypes`
--

LOCK TABLES `glpi_links_itemtypes` WRITE;
/*!40000 ALTER TABLE `glpi_links_itemtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_links_itemtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_locations`
--

DROP TABLE IF EXISTS `glpi_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `address` text COLLATE utf8_unicode_ci,
  `postcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `town` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `building` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `room` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`entities_id`,`locations_id`,`name`),
  KEY `locations_id` (`locations_id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_locations`
--

LOCK TABLES `glpi_locations` WRITE;
/*!40000 ALTER TABLE `glpi_locations` DISABLE KEYS */;
INSERT INTO `glpi_locations` VALUES (1,0,0,'ЦОД Алатау',0,'ЦОД Алатау','',1,'[]',NULL,'ИЯФ пос. Алатау','','Алма-Ата','','Казахстан','','','','','','2019-02-11 09:38:03','2019-02-11 09:38:03'),(2,0,0,'ОРБП на Жумалиева 108',0,'ОРБП на Жумалиева 108','',1,'[]','{\"2\":\"2\"}','Жумалиева 108','','Алма-Ата','','','108','','43.25149850766202','76.91372463626864','','2019-02-22 08:15:42','2019-02-11 09:39:43');
/*!40000 ALTER TABLE `glpi_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_logs`
--

DROP TABLE IF EXISTS `glpi_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `linked_action` int(11) NOT NULL DEFAULT '0' COMMENT 'see define.php HISTORY_* constant',
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `id_search_option` int(11) NOT NULL DEFAULT '0' COMMENT 'see search.constant.php for value',
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `itemtype_link` (`itemtype_link`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `id_search_option` (`id_search_option`)
) ENGINE=InnoDB AUTO_INCREMENT=1035 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_logs`
--

LOCK TABLES `glpi_logs` WRITE;
/*!40000 ALTER TABLE `glpi_logs` DISABLE KEYS */;
INSERT INTO `glpi_logs` VALUES (1,'User',2,'',0,'dixon (2)','2019-02-07 09:09:21',1,'glpi','dixon'),(2,'User',4,'',0,'tech (4)','2019-02-07 09:11:32',17,'en_GB',NULL),(3,'State',1,'0',20,'dixon (2)','2019-02-11 09:33:39',0,'',''),(4,'State',2,'0',20,'dixon (2)','2019-02-11 09:33:48',0,'',''),(5,'Location',1,'0',20,'dixon (2)','2019-02-11 09:38:03',0,'',''),(6,'Location',2,'0',20,'dixon (2)','2019-02-11 09:39:43',0,'',''),(7,'Group',1,'0',20,'dixon (2)','2019-02-11 09:41:30',0,'',''),(8,'Group',1,'Group',17,'dixon (2)','2019-02-11 09:42:11',0,'','Дежурный специалист'),(9,'Group',2,'0',20,'dixon (2)','2019-02-11 09:42:11',0,'',''),(10,'Group',1,'Group',17,'dixon (2)','2019-02-11 09:42:40',0,'','Сетевой администратор'),(11,'Group',3,'0',20,'dixon (2)','2019-02-11 09:42:40',0,'',''),(12,'Group',1,'Group',17,'dixon (2)','2019-02-11 09:43:12',0,'','Инженер энергетик'),(13,'Group',4,'0',20,'dixon (2)','2019-02-11 09:43:12',0,'',''),(14,'Group',1,'Group',17,'dixon (2)','2019-02-11 09:43:29',0,'','Пользо-ватель'),(15,'Group',5,'0',20,'dixon (2)','2019-02-11 09:43:29',0,'',''),(16,'ComputerType',1,'0',20,'dixon (2)','2019-02-11 09:44:51',0,'',''),(17,'ComputerType',2,'0',20,'dixon (2)','2019-02-11 09:45:03',0,'',''),(18,'Manufacturer',1,'0',20,'dixon (2)','2019-02-11 09:45:29',0,'',''),(19,'Manufacturer',2,'0',20,'dixon (2)','2019-02-11 09:45:34',0,'',''),(20,'ComputerModel',1,'0',20,'dixon (2)','2019-02-11 09:46:40',0,'',''),(21,'Network',1,'0',20,'dixon (2)','2019-02-11 09:47:38',0,'',''),(22,'Computer',1,'0',20,'dixon (2)','2019-02-11 09:47:50',0,'',''),(23,'Rack',1,'0',20,'dixon (2)','2019-02-11 09:50:18',0,'',''),(24,'Rack',1,'Computer',15,'dixon (2)','2019-02-11 09:50:54',0,'','dell-5550 (1)'),(25,'Computer',1,'Rack',15,'dixon (2)','2019-02-11 09:50:54',0,'','шк.01 (1)'),(26,'Datacenter',1,'0',20,'dixon (2)','2019-02-11 09:54:04',0,'',''),(27,'Rack',1,'Item_Rack#hpos',21,'dixon (2)','2019-02-11 10:00:43',0,'0','1'),(28,'Computer',1,'Item_Rack#hpos',21,'dixon (2)','2019-02-11 10:00:43',0,'0','1'),(29,'Document',1,'Rack',15,'dixon (2)','2019-02-11 10:02:08',0,'','шк.01 (1)'),(30,'Rack',1,'Document',15,'dixon (2)','2019-02-11 10:02:08',0,'','Документ: Стойка - шк.01 (1)'),(31,'Document',1,'0',20,'dixon (2)','2019-02-11 10:02:08',0,'',''),(32,'ContractType',1,'0',20,'dixon (2)','2019-02-11 10:04:15',0,'',''),(33,'Contract',1,'0',20,'dixon (2)','2019-02-11 10:04:40',0,'',''),(34,'Contract',1,'Computer',15,'dixon (2)','2019-02-11 10:05:05',0,'','dell-5550 (1)'),(35,'Computer',1,'Contract',15,'dixon (2)','2019-02-11 10:05:05',0,'','На размещение (1)'),(36,'VirtualMachineType',1,'0',20,'dixon (2)','2019-02-11 10:05:35',0,'',''),(37,'VirtualMachineType',2,'0',20,'dixon (2)','2019-02-11 10:05:43',0,'',''),(38,'VirtualMachineState',1,'0',20,'dixon (2)','2019-02-11 10:06:18',0,'',''),(39,'VirtualMachineState',2,'0',20,'dixon (2)','2019-02-11 10:06:22',0,'',''),(40,'VirtualMachineSystem',1,'0',20,'dixon (2)','2019-02-11 10:07:19',0,'',''),(41,'VirtualMachineSystem',2,'0',20,'dixon (2)','2019-02-11 10:07:25',0,'',''),(42,'VirtualMachineSystem',3,'0',20,'dixon (2)','2019-02-11 10:07:36',0,'',''),(43,'Computer',1,'ComputerVirtualMachine',17,'dixon (2)','2019-02-11 10:08:45',0,'','orbp-001 (1)'),(44,'ComputerVirtualMachine',1,'0',20,'dixon (2)','2019-02-11 10:08:45',0,'',''),(45,'Ticket',1,'Computer',15,'dixon (2)','2019-02-11 10:11:54',0,'','dell-5550 (1)'),(46,'Computer',1,'Ticket',15,'dixon (2)','2019-02-11 10:11:54',0,'','Перезагружается каждый час (1)'),(47,'Ticket',1,'User',15,'dixon (2)','2019-02-11 10:11:54',4,'','dixon (2)'),(48,'Ticket',1,'',0,'dixon (2)','2019-02-11 10:11:54',150,'0','114'),(49,'Ticket',1,'User',15,'dixon (2)','2019-02-11 10:11:54',5,'','dixon (2)'),(50,'Ticket',1,'Group',15,'dixon (2)','2019-02-11 10:11:54',71,'','Системный администратор (1)'),(51,'Ticket',1,'0',20,'dixon (2)','2019-02-11 10:11:54',0,'',''),(52,'UserCategory',1,'0',20,'dixon (2)','2019-02-11 10:16:37',0,'',''),(53,'User',6,'UserEmail',17,'dixon (2)','2019-02-11 10:17:47',0,'','d.tailakov@mycloud.kz (1)'),(54,'UserEmail',1,'0',20,'dixon (2)','2019-02-11 10:17:47',0,'',''),(55,'User',6,'Profile',17,'dixon (2)','2019-02-11 10:17:47',0,'','Admin (3)'),(56,'User',6,'0',20,'dixon (2)','2019-02-11 10:17:47',0,'',''),(57,'Computer',1,'ComputerVirtualMachine',18,'dixon (2)','2019-02-11 10:21:54',0,'1','2'),(58,'UserTitle',1,'0',20,'Тайлаков Дмитрий (6)','2019-02-12 02:33:27',0,'',''),(59,'UserTitle',2,'0',20,'Тайлаков Дмитрий (6)','2019-02-12 02:33:38',0,'',''),(60,'UserTitle',3,'0',20,'Тайлаков Дмитрий (6)','2019-02-12 02:33:51',0,'',''),(61,'User',3,'',0,'Тайлаков Дмитрий (6)','2019-02-12 02:34:42',1,'post-only','t_lovazov'),(62,'User',3,'',0,'Тайлаков Дмитрий (6)','2019-02-12 02:34:42',34,'','Takhir'),(63,'User',3,'',0,'Тайлаков Дмитрий (6)','2019-02-12 02:34:42',9,'','Lovazov'),(64,'User',3,'',0,'Тайлаков Дмитрий (6)','2019-02-12 02:34:42',82,'&nbsp; (0)','Разработчик (1)'),(65,'User',3,'',0,'Тайлаков Дмитрий (6)','2019-02-12 02:34:42',81,'&nbsp; (0)','Главный специалист (1)'),(66,'User',3,'',0,'Тайлаков Дмитрий (6)','2019-02-12 02:34:42',3,'&nbsp; (0)','ОРБП на Жумалиева 108 (2)'),(67,'User',3,'',0,'Тайлаков Дмитрий (6)','2019-02-12 02:34:42',20,'&nbsp; (0)','Self-Service (1)'),(68,'User',3,'',0,'Тайлаков Дмитрий (6)','2019-02-12 02:37:11',17,'en_GB',NULL),(69,'User',5,'',0,'Тайлаков Дмитрий (6)','2019-02-12 02:45:37',1,'normal','t_aipov'),(70,'User',5,'',0,'Тайлаков Дмитрий (6)','2019-02-12 02:45:37',34,'','Аипов'),(71,'User',5,'',0,'Тайлаков Дмитрий (6)','2019-02-12 02:45:37',9,'','Тлек'),(72,'User',5,'',0,'Тайлаков Дмитрий (6)','2019-02-12 02:45:37',82,'&nbsp; (0)','Разработчик (1)'),(73,'User',5,'',0,'Тайлаков Дмитрий (6)','2019-02-12 02:45:37',81,'&nbsp; (0)','Ведущий специалист (2)'),(74,'User',5,'',0,'Тайлаков Дмитрий (6)','2019-02-12 02:45:37',3,'&nbsp; (0)','ОРБП на Жумалиева 108 (2)'),(75,'CronTask',30,'',0,'','2019-02-12 05:29:28',4,'0','1'),(76,'Entity',0,'',0,'dixon (2)','2019-02-12 05:35:04',14,'Root entity','KTCL'),(77,'Entity',0,'',0,'dixon (2)','2019-02-12 05:35:04',1,'Root entity','KTCL'),(78,'User',4,'',0,'dixon (2)','2019-02-12 05:55:23',1,'tech','v_shegula'),(79,'User',4,'',0,'dixon (2)','2019-02-12 05:55:23',34,'','Щегула'),(80,'User',4,'',0,'dixon (2)','2019-02-12 05:55:23',9,'','Владимир'),(81,'User',4,'Group',15,'dixon (2)','2019-02-12 06:00:17',0,'','Дежурный специалист (2)'),(82,'Group',2,'User',15,'dixon (2)','2019-02-12 06:00:17',0,'','Щегула Владимир (4)'),(83,'Profile',6,'',0,'dixon (2)','2019-02-12 06:08:45',26,'127','0'),(84,'Profile',6,'',0,'dixon (2)','2019-02-12 06:08:45',27,'127','0'),(85,'Profile',6,'',0,'dixon (2)','2019-02-12 06:08:45',129,'31','0'),(86,'Profile',6,'',0,'dixon (2)','2019-02-12 06:08:45',21,'127','0'),(87,'Profile',6,'',0,'dixon (2)','2019-02-12 06:08:45',24,'127','0'),(88,'Profile',6,'',0,'dixon (2)','2019-02-12 06:08:45',22,'127','0'),(89,'Profile',6,'',0,'dixon (2)','2019-02-12 06:11:51',87,'[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\"]','[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\",\"DCRoom\",\"Rack\",\"Enclosure\"]'),(90,'Profile',6,'',0,'dixon (2)','2019-02-12 06:11:51',112,'1121','1125'),(91,'Profile',6,'',0,'dixon (2)','2019-02-12 06:11:51',102,'168967','0'),(92,'Profile',6,'',0,'dixon (2)','2019-02-12 06:11:51',119,'31','0'),(93,'Profile',6,'',0,'dixon (2)','2019-02-12 06:11:51',103,'1','0'),(94,'Profile',6,'',0,'dixon (2)','2019-02-12 06:13:40',101,'96','0'),(95,'Profile',6,'',0,'dixon (2)','2019-02-12 06:13:40',32,'96','0'),(96,'Profile',6,'',0,'dixon (2)','2019-02-12 06:13:40',31,'127','0'),(97,'Profile',6,'',0,'dixon (2)','2019-02-12 06:15:31',34,'14367','14359'),(98,'Profile',6,'',0,'dixon (2)','2019-02-12 06:15:31',63,'31','23'),(99,'Profile',6,'',0,'dixon (2)','2019-02-12 06:15:31',36,'1055','0'),(100,'Profile',6,'',0,'dixon (2)','2019-02-12 06:15:31',120,'31','0'),(101,'Profile',6,'',0,'dixon (2)','2019-02-12 06:16:30',59,'97','96'),(102,'Profile',6,'',0,'dixon (2)','2019-02-12 06:16:30',58,'1','0'),(103,'Profile',6,'',0,'dixon (2)','2019-02-12 06:16:30',56,'1055','0'),(104,'Change',1,'User',15,'Щегула Владимир (4)','2019-02-12 06:21:04',0,'','Щегула Владимир (4)'),(105,'Change',1,'Group',15,'Щегула Владимир (4)','2019-02-12 06:21:04',0,'','Дежурный специалист (2)'),(106,'Change',1,'Group',15,'Щегула Владимир (4)','2019-02-12 06:21:04',0,'','Дежурный специалист (2)'),(107,'Change',1,'0',20,'Щегула Владимир (4)','2019-02-12 06:21:04',0,'',''),(108,'Reminder',1,'0',20,'Щегула Владимир (4)','2019-02-12 06:34:30',0,'',''),(109,'Problem',1,'User',15,'Щегула Владимир (4)','2019-02-12 06:36:53',0,'','Щегула Владимир (4)'),(110,'Problem',1,'Group',15,'Щегула Владимир (4)','2019-02-12 06:36:53',0,'','Дежурный специалист (2)'),(111,'Problem',1,'0',20,'Щегула Владимир (4)','2019-02-12 06:36:53',0,'',''),(112,'Change',1,'',0,'Щегула Владимир (4)','2019-02-12 06:37:50',1,'Перенести сервер 38','Перенести сервер 34'),(113,'Change',1,'',0,'Щегула Владимир (4)','2019-02-12 06:37:56',21,'Перенести сервер 38 из шк1 в шк2','Перенести сервер 34 из шк1 в шк2'),(114,'Change',1,'',0,'Щегула Владимир (4)','2019-02-12 06:38:30',51,'0','50'),(115,'Peripheral',1,'0',20,'Щегула Владимир (4)','2019-02-12 07:39:33',0,'',''),(116,'Phone',1,'0',20,'Щегула Владимир (4)','2019-02-12 07:41:10',0,'',''),(117,'Profile',6,'',0,'dixon (2)','2019-02-12 07:42:22',2,'central','helpdesk'),(164,'Profile',6,'',0,'dixon (2)','2019-02-13 04:32:33',2,'helpdesk','central'),(165,'Profile',6,'',0,'dixon (2)','2019-02-13 04:33:31',1,'Technician','Сетевой администратор'),(166,'Profile',6,'',0,'dixon (2)','2019-02-13 04:34:26',115,'1151','0'),(167,'Profile',6,'',0,'dixon (2)','2019-02-13 04:34:26',79,'1','0'),(168,'Profile',6,'',0,'dixon (2)','2019-02-13 04:34:26',112,'1125','0'),(169,'Profile',6,'',0,'dixon (2)','2019-02-13 04:35:24',34,'14359','0'),(170,'Profile',6,'',0,'dixon (2)','2019-02-13 04:35:56',59,'96','0'),(171,'Profile',6,'',0,'dixon (2)','2019-02-13 04:35:56',91,'0','23'),(172,'Profile',6,'',0,'dixon (2)','2019-02-13 04:35:56',60,'1','0'),(173,'Profile',6,'',0,'dixon (2)','2019-02-13 04:37:55',1,'Сетевой администратор','Сетевой-администратор'),(175,'Ticket',2,'User',15,'Щегула Владимир (4)','2019-02-13 04:45:00',4,'','Щегула Владимир (4)'),(176,'Ticket',2,'0',20,'Щегула Владимир (4)','2019-02-13 04:45:00',0,'',''),(177,'Ticket',2,'PluginFormcreatorFormAnswer',15,'Щегула Владимир (4)','2019-02-13 04:45:00',0,'','Паспорт Collocation (1)'),(179,'NetworkPort',1,'NetworkPortEthernet',17,'dixon (2)','2019-02-13 04:48:34',0,'','N/A (1)'),(180,'NetworkPort',1,'0',20,'dixon (2)','2019-02-13 04:48:34',0,'',''),(181,'NetworkPort',2,'NetworkPortEthernet',17,'dixon (2)','2019-02-13 04:48:34',0,'','N/A (2)'),(182,'NetworkPort',2,'0',20,'dixon (2)','2019-02-13 04:48:34',0,'',''),(183,'NetworkPort',3,'NetworkPortEthernet',17,'dixon (2)','2019-02-13 04:49:13',0,'','N/A (3)'),(184,'NetworkPort',3,'0',20,'dixon (2)','2019-02-13 04:49:13',0,'',''),(185,'NetworkPort',4,'NetworkPortEthernet',17,'dixon (2)','2019-02-13 04:49:35',0,'','N/A (4)'),(186,'NetworkPort',4,'0',20,'dixon (2)','2019-02-13 04:49:35',0,'',''),(187,'NetworkPort',5,'NetworkPortEthernet',17,'dixon (2)','2019-02-13 04:50:03',0,'','N/A (5)'),(188,'NetworkPort',5,'0',20,'dixon (2)','2019-02-13 04:50:03',0,'',''),(189,'NetworkPort',4,'',0,'dixon (2)','2019-02-13 04:51:35',4,'','60:45:cb:a1:1a:32'),(190,'Computer',1,'NetworkPort',18,'dixon (2)','2019-02-13 04:51:35',0,'','60:45:cb:a1:1a:32'),(191,'NetworkName',1,'IPAddress',17,'dixon (2)','2019-02-13 04:51:35',0,'','192.168.0.5 (1)'),(192,'NetworkPort',4,'NetworkName',17,'dixon (2)','2019-02-13 04:51:35',0,'','N/A (1)'),(193,'NetworkName',1,'0',20,'dixon (2)','2019-02-13 04:51:35',0,'',''),(194,'Vlan',1,'0',20,'dixon (2)','2019-02-13 04:52:49',0,'',''),(195,'Vlan',2,'0',20,'dixon (2)','2019-02-13 04:53:01',0,'',''),(196,'NetworkPort',4,'Vlan',15,'dixon (2)','2019-02-13 04:53:09',0,'','1 (1)'),(197,'Vlan',1,'NetworkPort',15,'dixon (2)','2019-02-13 04:53:09',0,'','dell-5550 - 03 (4)'),(198,'NetworkPort',5,'NetworkPort',7,'dixon (2)','2019-02-13 04:54:01',0,'','dell-5550 - 02 (3)'),(199,'NetworkPort',3,'NetworkPort',7,'dixon (2)','2019-02-13 04:54:01',0,'','dell-5550 - 04 (5)'),(200,'OperatingSystemKernel',1,'0',20,'dixon (2)','2019-02-13 04:57:22',0,'',''),(201,'OperatingSystemKernel',2,'0',20,'dixon (2)','2019-02-13 04:57:28',0,'',''),(202,'OperatingSystemKernel',3,'0',20,'dixon (2)','2019-02-13 04:57:39',0,'',''),(203,'OperatingSystemKernel',4,'0',20,'dixon (2)','2019-02-13 04:57:45',0,'',''),(204,'OperatingSystemKernel',5,'0',20,'dixon (2)','2019-02-13 04:57:57',0,'',''),(205,'OperatingSystemKernel',6,'0',20,'dixon (2)','2019-02-13 04:58:07',0,'',''),(206,'OperatingSystemKernel',7,'0',20,'dixon (2)','2019-02-13 04:58:17',0,'',''),(207,'OperatingSystemKernel',8,'0',20,'dixon (2)','2019-02-13 04:58:22',0,'',''),(208,'OperatingSystemKernel',9,'0',20,'dixon (2)','2019-02-13 04:58:28',0,'',''),(209,'OperatingSystemKernel',10,'0',20,'dixon (2)','2019-02-13 04:58:33',0,'',''),(210,'OperatingSystemKernel',11,'0',20,'dixon (2)','2019-02-13 04:58:38',0,'',''),(211,'OperatingSystemKernel',12,'0',20,'dixon (2)','2019-02-13 04:58:43',0,'',''),(212,'OperatingSystemKernel',13,'0',20,'dixon (2)','2019-02-13 04:58:49',0,'',''),(213,'OperatingSystemKernel',14,'0',20,'dixon (2)','2019-02-13 04:58:54',0,'',''),(214,'OperatingSystemKernel',15,'0',20,'dixon (2)','2019-02-13 04:58:59',0,'',''),(215,'OperatingSystemKernel',16,'0',20,'dixon (2)','2019-02-13 04:59:04',0,'',''),(216,'OperatingSystemKernel',17,'0',20,'dixon (2)','2019-02-13 04:59:09',0,'',''),(217,'OperatingSystemKernel',18,'0',20,'dixon (2)','2019-02-13 04:59:13',0,'',''),(218,'OperatingSystemKernel',19,'0',20,'dixon (2)','2019-02-13 04:59:19',0,'',''),(219,'OperatingSystemKernel',20,'0',20,'dixon (2)','2019-02-13 04:59:26',0,'',''),(220,'Manufacturer',3,'0',20,'dixon (2)','2019-02-13 05:02:20',0,'',''),(221,'DeviceMemory',1,'0',20,'dixon (2)','2019-02-13 05:03:11',0,'',''),(222,'Computer',1,'DeviceMemory',1,'dixon (2)','2019-02-13 05:03:57',0,'','4Gb (1)'),(223,'Item_DeviceMemory',1,'0',20,'dixon (2)','2019-02-13 05:03:57',0,'',''),(224,'Computer',1,'Item_Disk',17,'dixon (2)','2019-02-13 05:05:12',0,'','1Tb (1)'),(225,'Item_Disk',1,'0',20,'dixon (2)','2019-02-13 05:05:12',0,'',''),(226,'Computer',1,'Item_Disk',18,'dixon (2)','2019-02-13 05:05:49',0,'500','500000'),(227,'Computer',1,'ComputerVirtualMachine',17,'dixon (2)','2019-02-13 05:07:15',0,'','vm2 (2)'),(228,'ComputerVirtualMachine',2,'0',20,'dixon (2)','2019-02-13 05:07:15',0,'',''),(229,'Problem',2,'User',15,'dixon (2)','2019-02-13 05:08:31',0,'','Тайлаков Дмитрий (6)'),(230,'Problem',2,'Group',15,'dixon (2)','2019-02-13 05:08:31',0,'','Системный администратор (1)'),(231,'Problem',2,'Computer',15,'dixon (2)','2019-02-13 05:08:31',0,'','dell-5550 (1)'),(232,'Computer',1,'Problem',15,'dixon (2)','2019-02-13 05:08:31',0,'','Греется процессор (2)'),(233,'Problem',2,'0',20,'dixon (2)','2019-02-13 05:08:31',0,'',''),(240,'Change',2,'User',15,'Щегула Владимир (4)','2019-02-13 05:12:26',0,'','Щегула Владимир (4)'),(241,'Change',2,'0',20,'Щегула Владимир (4)','2019-02-13 05:12:26',0,'',''),(242,'Change',2,'PluginFormcreatorFormAnswer',15,'Щегула Владимир (4)','2019-02-13 05:12:26',0,'','Паспорт Collocation (2)'),(247,'DocumentType',73,'0',20,'dixon (2)','2019-02-13 05:16:51',0,'',''),(248,'Profile',4,'ProfileRight',17,'dixon (2)','2019-02-13 06:20:15',0,'','uninstall:profile (880)'),(249,'ProfileRight',880,'0',20,'dixon (2)','2019-02-13 06:20:15',0,'',''),(250,'Profile',4,'ProfileRight',17,'dixon (2)','2019-02-13 06:20:15',0,'','plugin_uninstall_replace (881)'),(251,'ProfileRight',881,'0',20,'dixon (2)','2019-02-13 06:20:15',0,'',''),(252,'PluginUninstallModel',1,'0',20,'dixon (2)','2019-02-13 06:20:15',0,'',''),(253,'PluginUninstallModel',2,'0',20,'dixon (2)','2019-02-13 06:20:15',0,'',''),(254,'Profile',4,'ProfileRight',19,'dixon (2)','2019-02-13 06:20:17',0,'plugin_satisfaction (884)',''),(255,'Profile',4,'ProfileRight',17,'dixon (2)','2019-02-13 06:20:17',0,'','plugin_satisfaction (890)'),(256,'ProfileRight',890,'0',20,'dixon (2)','2019-02-13 06:20:17',0,'',''),(257,'Profile',4,'ProfileRight',17,'dixon (2)','2019-02-13 06:20:19',0,'','plugin_datainjection_model (891)'),(258,'ProfileRight',891,'0',20,'dixon (2)','2019-02-13 06:20:19',0,'',''),(259,'Profile',4,'ProfileRight',17,'dixon (2)','2019-02-13 06:20:19',0,'','plugin_datainjection_use (892)'),(260,'ProfileRight',892,'0',20,'dixon (2)','2019-02-13 06:20:19',0,'',''),(261,'Network',1,'',0,'dixon (2)','2019-02-13 08:19:15',1,'192.168.0.0/24','Сеть клиента (p2p)'),(262,'Network',1,'',0,'dixon (2)','2019-02-13 08:19:15',16,'default','Сеть клиента (p2p)'),(263,'Network',2,'0',20,'dixon (2)','2019-02-13 08:19:46',0,'',''),(264,'Network',3,'0',20,'dixon (2)','2019-02-13 08:20:26',0,'',''),(265,'User',2,'',0,'dixon (2)','2019-02-13 10:37:57',17,'','en_GB'),(266,'User',2,'',0,'dixon (2)','2019-02-13 10:39:21',17,'en_GB',NULL),(267,'User',2,'',0,'dixon (2)','2019-02-13 11:03:42',17,'','en_GB'),(268,'User',2,'',0,'dixon (2)','2019-02-13 11:03:51',17,'en_GB',NULL),(269,'CronTask',34,'0',20,'dixon (2)','2019-02-14 02:21:11',0,'',''),(270,'CronTask',35,'0',20,'dixon (2)','2019-02-14 02:22:08',0,'',''),(271,'Ticket',2,'PluginFormcreatorFormAnswer',16,'dixon (2)','2019-02-14 03:13:55',0,'Паспорт Collocation (1)',''),(273,'Ticket',2,'',0,'dixon (2)','2019-02-14 03:13:55',64,'v_shegula (4)','dixon (2)'),(284,'PluginFormcreatorEntityconfig',0,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(285,'CronTask',36,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(286,'NotificationTemplate',31,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(287,'NotificationTemplate',31,'NotificationTemplateTranslation',17,'dixon (2)','2019-02-14 03:16:17',0,'','Перевод шаблона (31)'),(288,'NotificationTemplateTranslation',31,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(289,'Notification',73,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(290,'Notification',73,'NotificationTemplate',15,'dixon (2)','2019-02-14 03:16:17',0,'','Форма была создана (31)'),(291,'NotificationTemplate',31,'Notification',15,'dixon (2)','2019-02-14 03:16:17',0,'','Форма была создана (73)'),(292,'Notification',73,'NotificationTarget',17,'dixon (2)','2019-02-14 03:16:17',0,'','N/A (137)'),(293,'NotificationTarget',137,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(294,'NotificationTemplate',32,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(295,'NotificationTemplate',32,'NotificationTemplateTranslation',17,'dixon (2)','2019-02-14 03:16:17',0,'','Перевод шаблона (32)'),(296,'NotificationTemplateTranslation',32,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(297,'Notification',74,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(298,'Notification',74,'NotificationTemplate',15,'dixon (2)','2019-02-14 03:16:17',0,'','Форма требует согласования (32)'),(299,'NotificationTemplate',32,'Notification',15,'dixon (2)','2019-02-14 03:16:17',0,'','Форма требует согласования (74)'),(300,'Notification',74,'NotificationTarget',17,'dixon (2)','2019-02-14 03:16:17',0,'','N/A (138)'),(301,'NotificationTarget',138,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(302,'NotificationTemplate',33,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(303,'NotificationTemplate',33,'NotificationTemplateTranslation',17,'dixon (2)','2019-02-14 03:16:17',0,'','Перевод шаблона (33)'),(304,'NotificationTemplateTranslation',33,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(305,'Notification',75,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(306,'Notification',75,'NotificationTemplate',15,'dixon (2)','2019-02-14 03:16:17',0,'','Форма отклонена (33)'),(307,'NotificationTemplate',33,'Notification',15,'dixon (2)','2019-02-14 03:16:17',0,'','Форма отклонена (75)'),(308,'Notification',75,'NotificationTarget',17,'dixon (2)','2019-02-14 03:16:17',0,'','N/A (139)'),(309,'NotificationTarget',139,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(310,'NotificationTemplate',34,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(311,'NotificationTemplate',34,'NotificationTemplateTranslation',17,'dixon (2)','2019-02-14 03:16:17',0,'','Перевод шаблона (34)'),(312,'NotificationTemplateTranslation',34,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(313,'Notification',76,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(314,'Notification',76,'NotificationTemplate',15,'dixon (2)','2019-02-14 03:16:17',0,'','Форма принята (34)'),(315,'NotificationTemplate',34,'Notification',15,'dixon (2)','2019-02-14 03:16:17',0,'','Форма принята (76)'),(316,'Notification',76,'NotificationTarget',17,'dixon (2)','2019-02-14 03:16:17',0,'','N/A (140)'),(317,'NotificationTarget',140,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(318,'NotificationTemplate',35,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(319,'NotificationTemplate',35,'NotificationTemplateTranslation',17,'dixon (2)','2019-02-14 03:16:17',0,'','Перевод шаблона (35)'),(320,'NotificationTemplateTranslation',35,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(321,'Notification',77,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(322,'Notification',77,'NotificationTemplate',15,'dixon (2)','2019-02-14 03:16:17',0,'','Форма удалена (35)'),(323,'NotificationTemplate',35,'Notification',15,'dixon (2)','2019-02-14 03:16:17',0,'','Форма удалена (77)'),(324,'Notification',77,'NotificationTarget',17,'dixon (2)','2019-02-14 03:16:17',0,'','N/A (141)'),(325,'NotificationTarget',141,'0',20,'dixon (2)','2019-02-14 03:16:17',0,'',''),(326,'PluginFormcreatorCategory',1,'0',20,'dixon (2)','2019-02-14 03:17:47',0,'',''),(327,'PluginFormcreatorCategory',2,'0',20,'dixon (2)','2019-02-14 03:17:58',0,'',''),(328,'PluginFormcreatorForm',1,'0',20,'dixon (2)','2019-02-14 03:18:41',0,'',''),(329,'Computer',1,'Item_Disk',18,'dixon (2)','2019-02-14 05:31:38',0,'1024000','1024'),(330,'Computer',1,'Item_Disk',18,'dixon (2)','2019-02-14 05:31:38',0,'500000','500'),(331,'Computer',1,'Item_Disk',18,'dixon (2)','2019-02-14 05:32:01',0,'1024','1024000'),(332,'Computer',1,'Item_Disk',18,'dixon (2)','2019-02-14 05:32:01',0,'500','500000'),(333,'Rack',1,'',0,'dixon (2)','2019-02-14 05:33:17',23,'&nbsp; (0)','supermicro (1)'),(334,'Rack',1,'Peripheral',15,'dixon (2)','2019-02-14 05:34:18',0,'','Патч-панель (1)'),(335,'Peripheral',1,'Rack',15,'dixon (2)','2019-02-14 05:34:18',0,'','шк.01 (1)'),(336,'NetworkEquipmentType',1,'0',20,'dixon (2)','2019-02-14 05:38:26',0,'',''),(337,'Manufacturer',4,'0',20,'dixon (2)','2019-02-14 05:38:44',0,'',''),(338,'NetworkEquipmentModel',1,'0',20,'dixon (2)','2019-02-14 05:48:05',0,'',''),(339,'NetworkEquipmentModel',2,'0',20,'dixon (2)','2019-02-14 05:51:30',0,'',''),(340,'NetworkEquipment',1,'0',20,'dixon (2)','2019-02-14 05:52:23',0,'',''),(341,'NetworkEquipment',2,'0',20,'dixon (2)','2019-02-14 05:55:49',0,'',''),(342,'Rack',1,'NetworkEquipment',15,'dixon (2)','2019-02-14 05:56:52',0,'','S5700-24TP-SI (1)'),(343,'NetworkEquipment',1,'Rack',15,'dixon (2)','2019-02-14 05:56:52',0,'','шк.01 (1)'),(344,'Rack',1,'NetworkEquipment',15,'dixon (2)','2019-02-14 05:57:33',0,'','S5700-52C-SI (2)'),(345,'NetworkEquipment',2,'Rack',15,'dixon (2)','2019-02-14 05:57:33',0,'','шк.01 (1)'),(346,'Location',1,'Netpoint',17,'dixon (2)','2019-02-14 06:10:54',0,'','001-1'),(347,'Netpoint',1,'0',20,'dixon (2)','2019-02-14 06:10:54',0,'',''),(348,'Location',1,'Netpoint',17,'dixon (2)','2019-02-14 06:11:02',0,'','001-2'),(349,'Netpoint',2,'0',20,'dixon (2)','2019-02-14 06:11:02',0,'',''),(350,'Location',1,'Netpoint',17,'dixon (2)','2019-02-14 06:11:13',0,'','002-1'),(351,'Netpoint',3,'0',20,'dixon (2)','2019-02-14 06:11:13',0,'',''),(352,'Location',1,'Netpoint',17,'dixon (2)','2019-02-14 06:11:21',0,'','002-2'),(353,'Netpoint',4,'0',20,'dixon (2)','2019-02-14 06:11:21',0,'',''),(354,'FQDN',1,'0',20,'dixon (2)','2019-02-14 06:14:08',0,'',''),(355,'FQDN',2,'0',20,'dixon (2)','2019-02-14 06:15:35',0,'',''),(356,'NetworkPort',1,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:17:24',0,'','N/A (1)'),(357,'NetworkName',2,'IPAddress',17,'dixon (2)','2019-02-14 06:17:24',0,'','192.168.1.1 (2)'),(358,'NetworkPort',1,'NetworkName',17,'dixon (2)','2019-02-14 06:17:24',0,'','N/A (2)'),(359,'NetworkName',2,'0',20,'dixon (2)','2019-02-14 06:17:24',0,'',''),(360,'NetworkPort',1,'0',20,'dixon (2)','2019-02-14 06:17:24',0,'',''),(361,'NetworkPort',2,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:18:56',0,'','N/A (2)'),(362,'NetworkPort',2,'0',20,'dixon (2)','2019-02-14 06:18:56',0,'',''),(363,'NetworkPort',3,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:18:56',0,'','N/A (3)'),(364,'NetworkPort',3,'0',20,'dixon (2)','2019-02-14 06:18:56',0,'',''),(365,'NetworkPort',4,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:18:56',0,'','N/A (4)'),(366,'NetworkPort',4,'0',20,'dixon (2)','2019-02-14 06:18:56',0,'',''),(367,'NetworkPort',5,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:18:56',0,'','N/A (5)'),(368,'NetworkPort',5,'0',20,'dixon (2)','2019-02-14 06:18:56',0,'',''),(369,'NetworkPort',6,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:18:56',0,'','N/A (6)'),(370,'NetworkPort',6,'0',20,'dixon (2)','2019-02-14 06:18:56',0,'',''),(409,'NetworkPort',26,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (26)'),(410,'NetworkPort',26,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(411,'NetworkPort',27,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (27)'),(412,'NetworkPort',27,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(413,'NetworkPort',28,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (28)'),(414,'NetworkPort',28,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(415,'NetworkPort',29,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (29)'),(416,'NetworkPort',29,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(417,'NetworkPort',30,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (30)'),(418,'NetworkPort',30,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(419,'NetworkPort',31,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (31)'),(420,'NetworkPort',31,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(421,'NetworkPort',32,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (32)'),(422,'NetworkPort',32,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(423,'NetworkPort',33,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (33)'),(424,'NetworkPort',33,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(425,'NetworkPort',34,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (34)'),(426,'NetworkPort',34,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(427,'NetworkPort',35,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (35)'),(428,'NetworkPort',35,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(429,'NetworkPort',36,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (36)'),(430,'NetworkPort',36,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(431,'NetworkPort',37,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (37)'),(432,'NetworkPort',37,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(433,'NetworkPort',38,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (38)'),(434,'NetworkPort',38,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(435,'NetworkPort',39,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (39)'),(436,'NetworkPort',39,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(437,'NetworkPort',40,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (40)'),(438,'NetworkPort',40,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(439,'NetworkPort',41,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (41)'),(440,'NetworkPort',41,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(441,'NetworkPort',42,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (42)'),(442,'NetworkPort',42,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(443,'NetworkPort',43,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (43)'),(444,'NetworkPort',43,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(445,'NetworkPort',44,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (44)'),(446,'NetworkPort',44,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(447,'NetworkPort',45,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (45)'),(448,'NetworkPort',45,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(449,'NetworkPort',46,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (46)'),(450,'NetworkPort',46,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(451,'NetworkPort',47,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (47)'),(452,'NetworkPort',47,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(453,'NetworkPort',48,'NetworkPortEthernet',17,'dixon (2)','2019-02-14 06:21:04',0,'','N/A (48)'),(454,'NetworkPort',48,'0',20,'dixon (2)','2019-02-14 06:21:04',0,'',''),(455,'NetworkName',2,'IPAddress',18,'dixon (2)','2019-02-14 09:44:33',0,'1','2'),(456,'NetworkEquipment',1,'PluginUninstallUninstall',1000,'dixon (2)','2019-02-14 09:44:33',0,'','Item replaced by a new one with model Replace'),(457,'NetworkEquipment',2,'PluginUninstallUninstall',1000,'dixon (2)','2019-02-14 09:44:33',0,'','Item replacing an old one'),(458,'PluginFieldsFieldDropdown',1,'0',20,'dixon (2)','2019-02-14 09:46:40',0,'',''),(459,'PluginFieldsFieldDropdown',2,'0',20,'dixon (2)','2019-02-14 09:47:06',0,'',''),(460,'PluginFieldsFieldDropdown',3,'0',20,'dixon (2)','2019-02-14 09:47:22',0,'',''),(461,'NetworkEquipment',3,'0',20,'dixon (2)','2019-02-14 09:48:38',0,'',''),(462,'NetworkEquipment',3,'',0,'dixon (2)','2019-02-14 09:48:38',76665,'','INT'),(463,'NetworkEquipment',3,'',0,'dixon (2)','2019-02-14 09:49:16',1,'S5700-52C-SI','S5700-28C-SI'),(464,'NetworkEquipment',3,'',0,'dixon (2)','2019-02-14 09:49:16',40,'S5700-52C (1)','S5700-28C-SI (2)'),(465,'NetworkEquipment',2,'',0,'dixon (2)','2019-02-14 09:50:25',76665,'','SIP'),(466,'NetworkEquipment',2,'',0,'dixon (2)','2019-02-14 09:50:25',16,'\nThis item is a replacement for item \n ID: 1\n Наименование: S5700-24TP-SI\n Серийный номер: 03JW39F10\n Инвентарный номер: 137','This item is a replacement for item rn ID: 1rn Наименование: S5700-24TP-SIrn Серийный номер: 03JW39F10rn Инвентарный номер: 137'),(467,'PluginSatisfactionSurvey',1,'0',20,'dixon (2)','2019-02-15 02:44:29',0,'',''),(468,'PluginSatisfactionSurvey',1,'PluginSatisfactionSurveyQuestion',17,'dixon (2)','2019-02-15 02:45:28',0,'','Кол-во процессоров (1)'),(469,'PluginSatisfactionSurveyQuestion',1,'0',20,'dixon (2)','2019-02-15 02:45:28',0,'',''),(470,'PluginSatisfactionSurvey',1,'PluginSatisfactionSurveyQuestion',17,'dixon (2)','2019-02-15 02:48:55',0,'','Включен (2)'),(471,'PluginSatisfactionSurveyQuestion',2,'0',20,'dixon (2)','2019-02-15 02:48:55',0,'',''),(472,'PluginSatisfactionSurvey',1,'',0,'dixon (2)','2019-02-15 02:49:48',1,'Satisfaction объект','Satisfaction опрос'),(473,'PluginFormcreatorFormAnswer',1,'0',20,'Щегула Владимир (4)','2019-02-15 02:50:38',0,'',''),(474,'PluginFormcreatorForm',1,'PluginFormcreatorSection',17,'dixon (2)','2019-02-15 02:52:31',0,'','Collocation (1)'),(475,'RackModel',1,'0',20,'dixon (2)','2019-02-15 03:07:48',0,'',''),(476,'RackModel',2,'0',20,'dixon (2)','2019-02-15 03:08:25',0,'',''),(477,'RackModel',3,'0',20,'dixon (2)','2019-02-15 03:10:37',0,'',''),(478,'RackModel',4,'0',20,'dixon (2)','2019-02-15 03:11:07',0,'',''),(479,'RackModel',5,'0',20,'dixon (2)','2019-02-15 03:11:29',0,'',''),(480,'RackModel',6,'0',20,'dixon (2)','2019-02-15 03:11:45',0,'',''),(481,'RackModel',7,'0',20,'dixon (2)','2019-02-15 03:12:27',0,'',''),(482,'PluginFormcreatorForm',1,'PluginFormcreatorSection',17,'dixon (2)','2019-02-15 03:26:06',0,'','Оборудование (2)'),(483,'ComputerType',3,'0',20,'dixon (2)','2019-02-15 03:27:27',0,'',''),(484,'Manufacturer',5,'0',20,'dixon (2)','2019-02-15 03:29:02',0,'',''),(485,'NetworkEquipmentModel',3,'0',20,'dixon (2)','2019-02-15 03:31:25',0,'',''),(486,'PluginFormcreatorFormAnswer',2,'0',20,'Щегула Владимир (4)','2019-02-15 03:38:50',0,'',''),(487,'Computer',1,'',0,'dixon (2)','2019-02-15 03:40:39',32,'Сеть клиента (p2p) (1)','Vlan (3)'),(488,'Computer',1,'NetworkPort',19,'dixon (2)','2019-02-15 03:42:06',0,'dell-5550 - 06 (7)',''),(489,'Computer',1,'NetworkPort',19,'dixon (2)','2019-02-15 03:42:06',0,'dell-5550 - 07 (8)',''),(490,'Computer',1,'NetworkPort',19,'dixon (2)','2019-02-15 03:42:06',0,'dell-5550 - 08 (9)',''),(491,'Computer',1,'NetworkPort',19,'dixon (2)','2019-02-15 03:42:06',0,'dell-5550 - 09 (10)',''),(492,'Computer',1,'NetworkPort',19,'dixon (2)','2019-02-15 03:42:06',0,'dell-5550 - 10 (11)',''),(493,'Computer',1,'NetworkPort',19,'dixon (2)','2019-02-15 03:42:06',0,'dell-5550 - 11 (12)',''),(494,'Computer',1,'NetworkPort',19,'dixon (2)','2019-02-15 03:42:06',0,'dell-5550 - 12 (13)',''),(495,'Computer',1,'NetworkPort',19,'dixon (2)','2019-02-15 03:42:06',0,'dell-5550 - 13 (14)',''),(496,'Computer',1,'NetworkPort',19,'dixon (2)','2019-02-15 03:42:06',0,'dell-5550 - 14 (15)',''),(497,'Computer',1,'NetworkPort',19,'dixon (2)','2019-02-15 03:42:06',0,'dell-5550 - 15 (16)',''),(498,'Computer',1,'NetworkPort',19,'dixon (2)','2019-02-15 03:42:06',0,'dell-5550 - 16 (17)',''),(499,'Computer',1,'NetworkPort',19,'dixon (2)','2019-02-15 03:42:06',0,'dell-5550 - 17 (18)',''),(500,'Computer',1,'NetworkPort',19,'dixon (2)','2019-02-15 03:42:06',0,'dell-5550 - 18 (19)',''),(501,'Computer',1,'NetworkPort',19,'dixon (2)','2019-02-15 03:42:06',0,'dell-5550 - 19 (20)',''),(502,'Computer',1,'NetworkPort',19,'dixon (2)','2019-02-15 03:42:06',0,'dell-5550 - 20 (21)',''),(503,'Computer',1,'NetworkPort',19,'dixon (2)','2019-02-15 03:42:06',0,'dell-5550 - 21 (22)',''),(504,'Computer',1,'NetworkPort',19,'dixon (2)','2019-02-15 03:42:06',0,'dell-5550 - 22 (23)',''),(505,'Computer',1,'NetworkPort',19,'dixon (2)','2019-02-15 03:42:06',0,'dell-5550 - 23 (24)',''),(506,'Computer',1,'NetworkPort',19,'dixon (2)','2019-02-15 03:42:06',0,'dell-5550 - 24 (25)',''),(507,'NetworkPort',5,'NetworkPort',6,'dixon (2)','2019-02-15 03:42:36',0,'dell-5550 - 02 (3)',''),(508,'NetworkPort',3,'NetworkPort',6,'dixon (2)','2019-02-15 03:42:36',0,'dell-5550 - 04 (5)',''),(509,'NetworkName',3,'IPAddress',17,'dixon (2)','2019-02-15 03:43:15',0,'','192.168.1.1 (3)'),(510,'NetworkPort',5,'NetworkName',17,'dixon (2)','2019-02-15 03:43:15',0,'','N/A (3)'),(511,'NetworkName',3,'0',20,'dixon (2)','2019-02-15 03:43:15',0,'',''),(512,'NetworkPort',5,'NetworkPort',7,'dixon (2)','2019-02-15 03:43:15',0,'','N/A (1)'),(513,'NetworkPort',1,'NetworkPort',7,'dixon (2)','2019-02-15 03:43:15',0,'','dell-5550 - 04 (5)'),(514,'Rack',1,'Item_Rack#position',21,'dixon (2)','2019-02-15 03:47:58',0,'1','14'),(515,'Computer',1,'Item_Rack#position',21,'dixon (2)','2019-02-15 03:47:58',0,'1','14'),(516,'Rack',1,'Item_Rack#hpos',21,'dixon (2)','2019-02-15 03:47:58',0,'1','0'),(517,'Computer',1,'Item_Rack#hpos',21,'dixon (2)','2019-02-15 03:47:58',0,'1','0'),(518,'Rack',1,'Item_Rack#position',21,'dixon (2)','2019-02-15 03:48:01',0,'14','35'),(519,'Computer',1,'Item_Rack#position',21,'dixon (2)','2019-02-15 03:48:01',0,'14','35'),(520,'PDU',1,'0',20,'dixon (2)','2019-02-15 03:50:10',0,'',''),(521,'Rack',1,'PDU',15,'dixon (2)','2019-02-15 03:50:40',0,'','N/A (1)'),(522,'PDU',1,'Rack',15,'dixon (2)','2019-02-15 03:50:40',0,'','шк.01 (1)'),(523,'Reminder',2,'0',20,'dixon (2)','2019-02-15 03:52:39',0,'',''),(524,'Reminder',2,'Group',15,'dixon (2)','2019-02-15 03:55:15',0,'','Дежурный специалист (2)'),(525,'Reminder',2,'',0,'dixon (2)','2019-02-15 03:55:38',5,'','2019-02-15 00:00'),(526,'Reminder',2,'',0,'dixon (2)','2019-02-15 03:55:38',6,'','2019-02-16 00:00'),(527,'Peripheral',1,'',0,'dixon (2)','2019-02-15 04:01:20',7,'','Игнатьев А.С.'),(528,'Peripheral',1,'',0,'dixon (2)','2019-02-15 04:01:20',8,'','+7 7773330505'),(529,'Computer',1,'Peripheral',15,'dixon (2)','2019-02-15 04:01:20',0,'','Патч-панель (1)'),(530,'Peripheral',1,'Computer',15,'dixon (2)','2019-02-15 04:01:20',0,'','dell-5550 (1)'),(531,'PluginFormcreatorFormAnswer',3,'0',20,'dixon (2)','2019-02-15 04:04:04',0,'',''),(532,'PhoneType',1,'0',20,'dixon (2)','2019-02-15 04:15:23',0,'',''),(533,'PhoneType',2,'0',20,'dixon (2)','2019-02-15 04:15:28',0,'',''),(534,'User',7,'UserEmail',17,'dixon (2)','2019-02-15 04:33:54',0,'','a.dosmagambetov@mycloud.kz (2)'),(535,'UserEmail',2,'0',20,'dixon (2)','2019-02-15 04:33:54',0,'',''),(536,'User',7,'Profile',17,'dixon (2)','2019-02-15 04:33:54',0,'','Super-Admin (4)'),(537,'User',7,'0',20,'dixon (2)','2019-02-15 04:33:54',0,'',''),(538,'Group',6,'0',20,'dixon (2)','2019-02-15 04:37:52',0,'',''),(539,'User',7,'Group',15,'dixon (2)','2019-02-15 04:38:05',0,'','Разработчик (6)'),(540,'Group',6,'User',15,'dixon (2)','2019-02-15 04:38:05',0,'','Dosmagambetov Anuar (7)'),(541,'User',7,'',0,'dixon (2)','2019-02-15 04:38:48',81,'Главный специалист (1)','Ведущий специалист (2)'),(542,'PluginFormcreatorForm',1,'',0,'dixon (2)','2019-02-15 04:52:07',9,'1','2'),(543,'PluginFormcreatorForm',1,'Profile',15,'dixon (2)','2019-02-15 04:52:33',0,'','Self-Service (1)'),(544,'Profile',1,'PluginFormcreatorForm',15,'dixon (2)','2019-02-15 04:52:33',0,'','Callocation (1)'),(545,'PluginFormcreatorForm',1,'Profile',15,'dixon (2)','2019-02-15 04:52:33',0,'','Observer (2)'),(546,'Profile',2,'PluginFormcreatorForm',15,'dixon (2)','2019-02-15 04:52:33',0,'','Callocation (1)'),(547,'PluginFormcreatorForm',1,'Profile',15,'dixon (2)','2019-02-15 04:52:33',0,'','Admin (3)'),(548,'Profile',3,'PluginFormcreatorForm',15,'dixon (2)','2019-02-15 04:52:33',0,'','Callocation (1)'),(549,'PluginFormcreatorForm',1,'Profile',15,'dixon (2)','2019-02-15 04:52:33',0,'','Super-Admin (4)'),(550,'Profile',4,'PluginFormcreatorForm',15,'dixon (2)','2019-02-15 04:52:33',0,'','Callocation (1)'),(551,'PluginFormcreatorForm',1,'Profile',15,'dixon (2)','2019-02-15 04:52:33',0,'','Сетевой-администратор (6)'),(552,'Profile',6,'PluginFormcreatorForm',15,'dixon (2)','2019-02-15 04:52:33',0,'','Callocation (1)'),(553,'PluginFormcreatorForm',1,'Profile',15,'dixon (2)','2019-02-15 04:52:33',0,'','Supervisor (7)'),(554,'Profile',7,'PluginFormcreatorForm',15,'dixon (2)','2019-02-15 04:52:33',0,'','Callocation (1)'),(555,'PluginFormcreatorFormAnswer',4,'0',20,'Щегула Владимир (4)','2019-02-15 04:57:22',0,'',''),(556,'Reminder',3,'0',20,'dixon (2)','2019-02-15 04:59:19',0,'',''),(557,'Reminder',4,'0',20,'dixon (2)','2019-02-15 05:00:07',0,'',''),(558,'Reminder',3,'User',15,'dixon (2)','2019-02-15 05:00:26',0,'','Dosmagambetov Anuar (7)'),(559,'Reminder',3,'',0,'dixon (2)','2019-02-15 05:01:05',5,'','2019-02-15 00:00'),(560,'Reminder',3,'',0,'dixon (2)','2019-02-15 05:01:05',6,'','2019-02-28 00:00'),(561,'PluginFormcreatorForm',1,'PluginFormcreatorSection',17,'dixon (2)','2019-02-15 05:06:13',0,'','Сетевые настройки (3)'),(562,'NetworkPort',49,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:40:55',0,'','N/A (49)'),(563,'NetworkPort',49,'0',20,'dixon (2)','2019-02-15 05:40:55',0,'',''),(564,'NetworkPort',50,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (50)'),(565,'NetworkPort',50,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(566,'NetworkPort',51,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (51)'),(567,'NetworkPort',51,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(568,'NetworkPort',52,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (52)'),(569,'NetworkPort',52,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(570,'NetworkPort',53,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (53)'),(571,'NetworkPort',53,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(572,'NetworkPort',54,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (54)'),(573,'NetworkPort',54,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(574,'NetworkPort',55,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (55)'),(575,'NetworkPort',55,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(576,'NetworkPort',56,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (56)'),(577,'NetworkPort',56,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(578,'NetworkPort',57,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (57)'),(579,'NetworkPort',57,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(580,'NetworkPort',58,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (58)'),(581,'NetworkPort',58,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(582,'NetworkPort',59,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (59)'),(583,'NetworkPort',59,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(584,'NetworkPort',60,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (60)'),(585,'NetworkPort',60,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(586,'NetworkPort',61,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (61)'),(587,'NetworkPort',61,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(588,'NetworkPort',62,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (62)'),(589,'NetworkPort',62,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(590,'NetworkPort',63,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (63)'),(591,'NetworkPort',63,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(592,'NetworkPort',64,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (64)'),(593,'NetworkPort',64,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(594,'NetworkPort',65,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (65)'),(595,'NetworkPort',65,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(596,'NetworkPort',66,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (66)'),(597,'NetworkPort',66,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(598,'NetworkPort',67,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (67)'),(599,'NetworkPort',67,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(600,'NetworkPort',68,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (68)'),(601,'NetworkPort',68,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(602,'NetworkPort',69,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (69)'),(603,'NetworkPort',69,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(604,'NetworkPort',70,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (70)'),(605,'NetworkPort',70,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(606,'NetworkPort',71,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (71)'),(607,'NetworkPort',71,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(608,'NetworkPort',72,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (72)'),(609,'NetworkPort',72,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(610,'NetworkPort',73,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (73)'),(611,'NetworkPort',73,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(612,'NetworkPort',74,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (74)'),(613,'NetworkPort',74,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(614,'NetworkPort',75,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (75)'),(615,'NetworkPort',75,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(616,'NetworkPort',76,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (76)'),(617,'NetworkPort',76,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(618,'NetworkPort',77,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (77)'),(619,'NetworkPort',77,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(620,'NetworkPort',78,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (78)'),(621,'NetworkPort',78,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(622,'NetworkPort',79,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (79)'),(623,'NetworkPort',79,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(624,'NetworkPort',80,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (80)'),(625,'NetworkPort',80,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(626,'NetworkPort',81,'NetworkPortEthernet',17,'dixon (2)','2019-02-15 05:46:13',0,'','N/A (81)'),(627,'NetworkPort',81,'0',20,'dixon (2)','2019-02-15 05:46:13',0,'',''),(628,'Profile',4,'',0,'dixon (2)','2019-02-15 05:47:24',87,'[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\"]','[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\",\"DCRoom\",\"Rack\",\"Enclosure\"]'),(629,'Profile',4,'',0,'dixon (2)','2019-02-15 05:47:24',115,'1279','1151'),(630,'Profile',4,'',0,'dixon (2)','2019-02-15 05:47:24',112,'1279','1151'),(631,'Profile',4,'',0,'dixon (2)','2019-02-15 05:47:24',102,'259231','261151'),(632,'Profile',4,'',0,'dixon (2)','2019-02-15 05:47:24',119,'31','23'),(633,'Profile',4,'',0,'dixon (2)','2019-02-15 05:47:24',103,'31','23'),(634,'Profile',4,'',0,'dixon (2)','2019-02-15 05:47:49',64,'31','23'),(635,'Profile',4,'',0,'dixon (2)','2019-02-15 05:47:49',34,'15519','15383'),(636,'Profile',4,'',0,'dixon (2)','2019-02-15 05:47:49',63,'159','23'),(637,'Profile',4,'',0,'dixon (2)','2019-02-15 05:47:49',120,'159','23'),(638,'Profile',4,'',0,'dixon (2)','2019-02-15 05:48:06',62,'1055','1045'),(639,'Profile',4,'',0,'dixon (2)','2019-02-15 05:48:06',59,'3327','3191'),(640,'Profile',4,'',0,'dixon (2)','2019-02-15 05:48:06',58,'159','119'),(641,'Profile',4,'',0,'dixon (2)','2019-02-15 05:48:06',55,'159','23'),(642,'Profile',4,'',0,'dixon (2)','2019-02-15 05:48:06',91,'31','23'),(643,'Profile',4,'',0,'dixon (2)','2019-02-15 05:48:06',90,'31','23'),(644,'Profile',4,'',0,'dixon (2)','2019-02-15 05:48:06',49,'31','23'),(645,'Profile',4,'',0,'dixon (2)','2019-02-15 05:48:06',50,'31','23'),(646,'Profile',4,'',0,'dixon (2)','2019-02-15 05:48:06',105,'31','23'),(647,'Profile',4,'',0,'dixon (2)','2019-02-15 05:48:06',51,'31','23'),(648,'Profile',4,'',0,'dixon (2)','2019-02-15 05:48:06',48,'1055','1047'),(649,'Profile',4,'',0,'dixon (2)','2019-02-15 05:48:06',60,'31','23'),(650,'Profile',4,'',0,'dixon (2)','2019-02-15 05:48:06',56,'7327','7199'),(651,'LineType',1,'0',20,'dixon (2)','2019-02-15 05:50:36',0,'',''),(652,'LineType',2,'0',20,'dixon (2)','2019-02-15 05:50:45',0,'',''),(653,'LineType',3,'0',20,'dixon (2)','2019-02-15 05:50:51',0,'',''),(654,'Manufacturer',6,'0',20,'dixon (2)','2019-02-15 06:24:58',0,'',''),(655,'DeviceNetworkCard',1,'0',20,'dixon (2)','2019-02-15 06:25:12',0,'',''),(656,'RuleDictionnaryNetworkEquipmentType',12,'0',20,'dixon (2)','2019-02-15 06:29:27',0,'',''),(657,'RuleDictionnaryNetworkEquipmentType',12,'RuleAction',17,'dixon (2)','2019-02-15 06:30:11',0,'','ТипДобавить результат регулярного выражения1000 (12)'),(658,'RuleAction',12,'0',20,'dixon (2)','2019-02-15 06:30:11',0,'',''),(659,'NetworkPort',1,'',0,'dixon (2)','2019-02-15 08:50:29',1,'','S5700-52C-SI'),(660,'NetworkEquipment',2,'NetworkPort',18,'dixon (2)','2019-02-15 08:50:29',0,'','S5700-52C-SI'),(661,'NetworkPort',5,'NetworkPort',6,'dixon (2)','2019-02-15 08:50:44',0,'S5700-52C-SI - S5700-52C-SI (1)',''),(662,'NetworkPort',1,'NetworkPort',6,'dixon (2)','2019-02-15 08:50:44',0,'dell-5550 - 04 (5)',''),(663,'NetworkPort',3,'NetworkPortEthernet',18,'dixon (2)','2019-02-15 08:51:58',0,'0','2'),(664,'NetworkPort',3,'NetworkPort',7,'dixon (2)','2019-02-15 08:51:58',0,'','S5700-52C-SI - 02 (26)'),(665,'NetworkPort',26,'NetworkPort',7,'dixon (2)','2019-02-15 08:51:58',0,'','dell-5550 - 02 (3)'),(666,'NetworkPort',3,'NetworkPortEthernet',18,'dixon (2)','2019-02-15 08:53:05',0,'2','0'),(667,'Domain',1,'0',20,'dixon (2)','2019-02-15 08:58:28',0,'',''),(668,'Domain',2,'0',20,'dixon (2)','2019-02-15 08:58:34',0,'',''),(669,'Computer',1,'',0,'dixon (2)','2019-02-15 08:58:45',71,'&nbsp; (0)','Разработчик (6)'),(670,'Computer',1,'',0,'dixon (2)','2019-02-15 08:58:45',33,'&nbsp; (0)','ktcl.kz (1)'),(671,'Peripheral',1,'',0,'dixon (2)','2019-02-15 08:58:45',71,'&nbsp; (0)','Разработчик (6)'),(672,'Computer',1,'',0,'dixon (2)','2019-02-15 08:58:54',71,'Разработчик (6)','Системный администратор > Дежурный специалист (2)'),(673,'Peripheral',1,'',0,'dixon (2)','2019-02-15 08:58:54',71,'Разработчик (6)','Системный администратор > Дежурный специалист (2)'),(674,'Manufacturer',7,'0',20,'dixon (2)','2019-02-15 09:00:32',0,'',''),(675,'DeviceProcessorModel',1,'0',20,'dixon (2)','2019-02-15 09:03:37',0,'',''),(676,'DeviceProcessor',1,'0',20,'dixon (2)','2019-02-15 09:03:43',0,'',''),(677,'Computer',1,'DeviceProcessor',1,'dixon (2)','2019-02-15 09:04:19',0,'','Intel Xeon E5450 (1)'),(678,'Item_DeviceProcessor',1,'0',20,'dixon (2)','2019-02-15 09:04:19',0,'',''),(679,'OperatingSystem',1,'0',20,'dixon (2)','2019-02-15 09:05:08',0,'',''),(680,'OperatingSystemArchitecture',1,'0',20,'dixon (2)','2019-02-15 09:05:26',0,'',''),(681,'OperatingSystemKernelVersion',1,'0',20,'dixon (2)','2019-02-15 09:05:53',0,'',''),(682,'OperatingSystemVersion',1,'0',20,'dixon (2)','2019-02-15 09:06:18',0,'',''),(683,'OperatingSystem',1,'Computer',15,'dixon (2)','2019-02-15 09:06:34',0,'','dell-5550 (1)'),(684,'Computer',1,'OperatingSystem',15,'dixon (2)','2019-02-15 09:06:34',0,'','MS Windows 10 (1)'),(685,'ComputerModel',1,'',0,'dixon (2)','2019-02-15 09:15:29',1,'d-5550','2U d-5550'),(686,'ComputerModel',1,'',0,'dixon (2)','2019-02-15 09:15:29',133,'0.25','1'),(687,'Computer',1,'',0,'dixon (2)','2019-02-15 09:16:13',1,'dell-5550','2U dell-5550'),(688,'Computer',1,'',0,'dixon (2)','2019-02-15 09:20:16',24,'dixon (2)','a_dosmagambetov (7)'),(689,'PluginFieldsClientservicefieldDropdown',1,'0',20,'dixon (2)','2019-02-15 09:36:08',0,'',''),(690,'PluginFieldsClientservicefieldDropdown',2,'0',20,'dixon (2)','2019-02-15 09:36:27',0,'',''),(691,'AutoUpdateSystem',1,'0',20,'dixon (2)','2019-02-15 09:37:50',0,'',''),(692,'Computer',1,'',0,'dixon (2)','2019-02-15 09:38:07',76665,'','Клиент'),(693,'Computer',1,'',0,'dixon (2)','2019-02-15 09:38:07',42,'&nbsp; (0)','192.168.10.11/apt (1)'),(694,'Contract',1,'',0,'dixon (2)','2019-02-15 09:40:01',1,'На размещение','ИП «Курмангазы»'),(695,'DocumentCategory',1,'0',20,'dixon (2)','2019-02-15 09:40:40',0,'',''),(696,'DocumentCategory',2,'0',20,'dixon (2)','2019-02-15 09:41:26',0,'',''),(697,'Computer',1,'ReservationItem',17,'dixon (2)','2019-02-15 09:44:50',0,'','N/A (1)'),(698,'NetworkEquipment',3,'',0,'Щегула Владимир (4)','2019-02-15 09:49:41',76665,'','Служебное'),(699,'NetworkEquipment',3,'',0,'Щегула Владимир (4)','2019-02-15 09:49:41',76666,'N/A','https://lotus.ktcl.kz/__462'),(700,'Ticket',2,'',0,'dixon (2)','2019-02-15 09:55:22',76665,'','Клиент'),(701,'Ticket',2,'',0,'dixon (2)','2019-02-15 09:55:22',76666,'N/A','https://itsfoss.com/share-folders-local-network-ubuntu-windows/'),(702,'Ticket',2,'',0,'dixon (2)','2019-02-15 09:55:22',21,'&lt;h1&gt;Форма данных&lt;/h1&gt;&lt;h2&gt;Тип подключения&lt;/h2&gt;&lt;div&gt;&lt;b&gt;1) Полоса пропускания : &lt;/b&gt;&nbsp;&lt;/div&gt;&lt;div&gt;&lt;b&gt;2) СПД ЦОД : &lt;/b','&lt;h1&gt;Форма данных&lt;/h1&gt;&lt;h2&gt;Тип подключения&lt;/h2&gt;&lt;div&gt;&lt;strong&gt;1) Полоса пропускания : &lt;/strong&gt; &lt;/div&gt;&lt;div&gt;&lt;strong&gt;2) СПД ЦО'),(703,'Profile',6,'',0,'dixon (2)','2019-02-15 10:06:12',112,'0','125'),(704,'Profile',6,'',0,'dixon (2)','2019-02-15 10:07:12',32,'0','127'),(705,'Profile',6,'',0,'dixon (2)','2019-02-15 10:07:12',31,'0','127'),(706,'Profile',6,'',0,'dixon (2)','2019-02-15 10:07:45',64,'0','23'),(707,'Profile',6,'',0,'dixon (2)','2019-02-15 10:07:45',34,'0','15383'),(708,'Profile',6,'',0,'dixon (2)','2019-02-15 10:07:45',36,'0','1055'),(709,'Profile',6,'',0,'dixon (2)','2019-02-15 10:09:46',107,'0','23'),(710,'Profile',6,'',0,'dixon (2)','2019-02-15 10:09:46',42,'0','23'),(711,'Profile',6,'',0,'dixon (2)','2019-02-15 10:09:46',106,'0','23'),(712,'Rack',1,'Item_Rack#position',21,'dixon (2)','2019-02-15 11:10:28',0,'35','31'),(713,'Computer',1,'Item_Rack#position',21,'dixon (2)','2019-02-15 11:10:28',0,'35','31'),(714,'Profile',4,'ProfileRight',17,'dixon (2)','2019-02-18 02:53:45',0,'','plugin_useditemsexport_export (906)'),(715,'ProfileRight',906,'0',20,'dixon (2)','2019-02-18 02:53:45',0,'',''),(716,'Computer',1,'Item_Disk',17,'dixon (2)','2019-02-19 05:01:09',0,'','3Tb (2)'),(717,'Item_Disk',2,'0',20,'dixon (2)','2019-02-19 05:01:09',0,'',''),(718,'Computer',1,'ComputerVirtualMachine',17,'dixon (2)','2019-02-19 05:02:20',0,'','ip-alim (3)'),(719,'ComputerVirtualMachine',3,'0',20,'dixon (2)','2019-02-19 05:02:20',0,'',''),(720,'Software',1,'0',20,'dixon (2)','2019-02-21 06:34:48',0,'',''),(721,'Profile',1,'ProfileRight',17,'dixon (2)','2019-02-21 10:10:07',0,'','plugin_genericobject_types (907)'),(722,'ProfileRight',907,'0',20,'dixon (2)','2019-02-21 10:10:07',0,'',''),(723,'Profile',2,'ProfileRight',17,'dixon (2)','2019-02-21 10:10:07',0,'','plugin_genericobject_types (915)'),(724,'ProfileRight',915,'0',20,'dixon (2)','2019-02-21 10:10:07',0,'',''),(725,'Profile',3,'ProfileRight',17,'dixon (2)','2019-02-21 10:10:07',0,'','plugin_genericobject_types (923)'),(726,'ProfileRight',923,'0',20,'dixon (2)','2019-02-21 10:10:07',0,'',''),(727,'Profile',4,'ProfileRight',17,'dixon (2)','2019-02-21 10:10:07',0,'','plugin_genericobject_types (931)'),(728,'ProfileRight',931,'0',20,'dixon (2)','2019-02-21 10:10:07',0,'',''),(729,'Profile',5,'ProfileRight',17,'dixon (2)','2019-02-21 10:10:07',0,'','plugin_genericobject_types (932)'),(730,'ProfileRight',932,'0',20,'dixon (2)','2019-02-21 10:10:07',0,'',''),(731,'Profile',6,'ProfileRight',17,'dixon (2)','2019-02-21 10:10:07',0,'','plugin_genericobject_types (940)'),(732,'ProfileRight',940,'0',20,'dixon (2)','2019-02-21 10:10:07',0,'',''),(733,'Profile',7,'ProfileRight',17,'dixon (2)','2019-02-21 10:10:07',0,'','plugin_genericobject_types (942)'),(734,'ProfileRight',942,'0',20,'dixon (2)','2019-02-21 10:10:07',0,'',''),(735,'Profile',8,'ProfileRight',17,'dixon (2)','2019-02-21 10:10:07',0,'','plugin_genericobject_types (950)'),(736,'ProfileRight',950,'0',20,'dixon (2)','2019-02-21 10:10:07',0,'',''),(737,'PluginGenericobjectTypeFamily',1,'0',20,'dixon (2)','2019-02-21 10:14:52',0,'',''),(742,'PluginOrderBillState',1,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(743,'PluginOrderBillState',2,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(744,'PluginOrderOrderState',1,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(745,'PluginOrderOrderState',2,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(746,'PluginOrderOrderState',3,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(747,'PluginOrderOrderState',4,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(748,'PluginOrderOrderState',5,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(749,'PluginOrderOrderState',6,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(750,'PluginOrderOrderState',7,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(752,'NotificationTemplate',36,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(753,'NotificationTemplate',36,'NotificationTemplateTranslation',17,'dixon (2)','2019-02-21 10:23:12',0,'','Перевод шаблона (36)'),(754,'NotificationTemplateTranslation',36,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(755,'Notification',78,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(756,'Notification',78,'NotificationTemplate',15,'dixon (2)','2019-02-21 10:23:12',0,'','Order Validation (36)'),(757,'NotificationTemplate',36,'Notification',15,'dixon (2)','2019-02-21 10:23:12',0,'','New Order Validation (78)'),(758,'Notification',79,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(759,'Notification',79,'NotificationTemplate',15,'dixon (2)','2019-02-21 10:23:12',0,'','Order Validation (36)'),(760,'NotificationTemplate',36,'Notification',15,'dixon (2)','2019-02-21 10:23:12',0,'','Confirm Order Validation (79)'),(761,'Notification',80,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(762,'Notification',80,'NotificationTemplate',15,'dixon (2)','2019-02-21 10:23:12',0,'','Order Validation (36)'),(763,'NotificationTemplate',36,'Notification',15,'dixon (2)','2019-02-21 10:23:12',0,'','Cancel Order Validation (80)'),(764,'Notification',81,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(765,'Notification',81,'NotificationTemplate',15,'dixon (2)','2019-02-21 10:23:12',0,'','Order Validation (36)'),(766,'NotificationTemplate',36,'Notification',15,'dixon (2)','2019-02-21 10:23:12',0,'','Cancel Order (81)'),(767,'NotificationTemplate',37,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(768,'NotificationTemplate',37,'NotificationTemplateTranslation',17,'dixon (2)','2019-02-21 10:23:12',0,'','Перевод шаблона (37)'),(769,'NotificationTemplateTranslation',37,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(770,'Notification',82,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(771,'Notification',82,'NotificationTemplate',15,'dixon (2)','2019-02-21 10:23:12',0,'','Due date overtaken (37)'),(772,'NotificationTemplate',37,'Notification',15,'dixon (2)','2019-02-21 10:23:12',0,'','Due date overtaken (82)'),(773,'NotificationTemplate',38,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(774,'NotificationTemplate',38,'NotificationTemplateTranslation',17,'dixon (2)','2019-02-21 10:23:12',0,'','Перевод шаблона (38)'),(775,'NotificationTemplateTranslation',38,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(776,'Notification',83,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(777,'Notification',83,'NotificationTemplate',15,'dixon (2)','2019-02-21 10:23:12',0,'','Order Delivered (38)'),(778,'NotificationTemplate',38,'Notification',15,'dixon (2)','2019-02-21 10:23:12',0,'','Order Delivered (83)'),(779,'Profile',4,'ProfileRight',19,'dixon (2)','2019-02-21 10:23:12',0,'plugin_order_order (967)',''),(780,'Profile',4,'ProfileRight',17,'dixon (2)','2019-02-21 10:23:12',0,'','plugin_order_order (989)'),(781,'ProfileRight',989,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(782,'Profile',4,'ProfileRight',19,'dixon (2)','2019-02-21 10:23:12',0,'plugin_order_bill (983)',''),(783,'Profile',4,'ProfileRight',17,'dixon (2)','2019-02-21 10:23:12',0,'','plugin_order_bill (990)'),(784,'ProfileRight',990,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(785,'Profile',4,'ProfileRight',19,'dixon (2)','2019-02-21 10:23:12',0,'plugin_order_reference (975)',''),(786,'Profile',4,'ProfileRight',17,'dixon (2)','2019-02-21 10:23:12',0,'','plugin_order_reference (991)'),(787,'ProfileRight',991,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(788,'PluginOrderOrderTax',1,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(789,'PluginOrderOrderTax',2,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(790,'PluginOrderOrderTax',3,'0',20,'dixon (2)','2019-02-21 10:23:12',0,'',''),(791,'PluginOrderOrderTax',4,'0',20,'dixon (2)','2019-02-21 10:31:04',0,'',''),(792,'PluginGenericobjectVptype',1,'0',20,'dixon (2)','2019-02-21 10:52:21',0,'',''),(793,'PluginGenericobjectVptype',2,'0',20,'dixon (2)','2019-02-21 10:52:37',0,'',''),(797,'Software',1,'SoftwareVersion',17,'dixon (2)','2019-02-22 05:42:18',0,'','Ms Windows 10 ru x23-x64 - 10 (1)'),(798,'SoftwareVersion',1,'0',20,'dixon (2)','2019-02-22 05:42:18',0,'',''),(799,'SoftwareLicense',1,'0',20,'dixon (2)','2019-02-22 05:43:22',0,'',''),(800,'Computer',1,'SoftwareVersion',4,'dixon (2)','2019-02-22 05:43:44',0,'','Ms Windows 10 ru x23-x64 - 10 (1)'),(801,'SoftwareVersion',1,'Computer',4,'dixon (2)','2019-02-22 05:43:44',0,'','2U dell-5550 (1)'),(802,'Computer',1,'SoftwareLicense',15,'dixon (2)','2019-02-22 05:44:06',0,'','Ms Windows 10 ru x23-x64 - OS Windows (1)'),(803,'SoftwareLicense',1,'Computer',15,'dixon (2)','2019-02-22 05:44:06',0,'','2U dell-5550 (1)'),(804,'PluginFieldsClientservicefieldDropdown',1,'0',20,'dixon (2)','2019-02-22 08:09:11',0,'',''),(805,'PluginFieldsClientservicefieldDropdown',1,'PluginFieldsClientservicefieldDropdown',17,'dixon (2)','2019-02-22 08:09:21',0,'','Клиент'),(806,'PluginFieldsClientservicefieldDropdown',2,'0',20,'dixon (2)','2019-02-22 08:09:21',0,'',''),(807,'PluginFieldsClientservicefieldDropdown',1,'PluginFieldsClientservicefieldDropdown',17,'dixon (2)','2019-02-22 08:09:39',0,'','Служебный'),(808,'PluginFieldsClientservicefieldDropdown',3,'0',20,'dixon (2)','2019-02-22 08:09:39',0,'',''),(809,'Computer',1,'',0,'dixon (2)','2019-02-22 08:11:02',76665,'','Все > Клиент'),(810,'Location',2,'Netpoint',17,'dixon (2)','2019-02-22 08:14:27',0,'','comp1'),(811,'Netpoint',5,'0',20,'dixon (2)','2019-02-22 08:14:27',0,'',''),(812,'Location',2,'Netpoint',17,'dixon (2)','2019-02-22 08:14:27',0,'','comp2'),(813,'Netpoint',6,'0',20,'dixon (2)','2019-02-22 08:14:27',0,'',''),(814,'Location',2,'Netpoint',17,'dixon (2)','2019-02-22 08:14:27',0,'','comp3'),(815,'Netpoint',7,'0',20,'dixon (2)','2019-02-22 08:14:27',0,'',''),(816,'Location',2,'Netpoint',17,'dixon (2)','2019-02-22 08:14:27',0,'','comp4'),(817,'Netpoint',8,'0',20,'dixon (2)','2019-02-22 08:14:27',0,'',''),(818,'Location',2,'Netpoint',17,'dixon (2)','2019-02-22 08:14:27',0,'','comp5'),(819,'Netpoint',9,'0',20,'dixon (2)','2019-02-22 08:14:27',0,'',''),(820,'Location',2,'Netpoint',17,'dixon (2)','2019-02-22 08:14:27',0,'','comp6'),(821,'Netpoint',10,'0',20,'dixon (2)','2019-02-22 08:14:27',0,'',''),(822,'Location',2,'Netpoint',17,'dixon (2)','2019-02-22 08:14:27',0,'','comp7'),(823,'Netpoint',11,'0',20,'dixon (2)','2019-02-22 08:14:27',0,'',''),(824,'Location',2,'Netpoint',17,'dixon (2)','2019-02-22 08:14:27',0,'','comp8'),(825,'Netpoint',12,'0',20,'dixon (2)','2019-02-22 08:14:27',0,'',''),(826,'Location',2,'Netpoint',17,'dixon (2)','2019-02-22 08:14:27',0,'','comp9'),(827,'Netpoint',13,'0',20,'dixon (2)','2019-02-22 08:14:27',0,'',''),(828,'Location',2,'Netpoint',17,'dixon (2)','2019-02-22 08:14:27',0,'','comp10'),(829,'Netpoint',14,'0',20,'dixon (2)','2019-02-22 08:14:27',0,'',''),(830,'Location',2,'',0,'dixon (2)','2019-02-22 08:15:42',21,'','43.25149850766202'),(831,'Location',2,'',0,'dixon (2)','2019-02-22 08:15:42',20,'','76.91372463626864'),(832,'Ticket',3,'User',15,'dixon (2)','2019-02-22 08:28:24',4,'','Тайлаков Дмитрий (6)'),(833,'Ticket',3,'',0,'dixon (2)','2019-02-22 08:28:24',150,'0','30504'),(834,'Ticket',3,'User',15,'dixon (2)','2019-02-22 08:28:24',5,'','dixon (2)'),(835,'Ticket',3,'0',20,'dixon (2)','2019-02-22 08:28:24',0,'',''),(836,'Problem',2,'User',15,'dixon (2)','2019-02-22 08:30:05',0,'','Dosmagambetov Anuar (7)'),(837,'Problem',3,'User',15,'dixon (2)','2019-02-22 08:37:29',0,'','dixon (2)'),(838,'Problem',3,'User',15,'dixon (2)','2019-02-22 08:37:29',0,'','Тайлаков Дмитрий (6)'),(839,'Problem',3,'0',20,'dixon (2)','2019-02-22 08:37:29',0,'',''),(864,'Vlan',1,'NetworkPort',15,'dixon (2)','2019-02-22 08:47:04',0,'','centos 7.5 - vlan 3 (84)'),(866,'Vlan',1,'NetworkPort',16,'dixon (2)','2019-02-22 08:47:50',0,'centos 7.5 - vlan 3 (84)',''),(867,'Vlan',3,'0',20,'dixon (2)','2019-02-22 08:48:06',0,'',''),(868,'Vlan',4,'0',20,'dixon (2)','2019-02-22 08:48:10',0,'',''),(869,'Vlan',5,'0',20,'dixon (2)','2019-02-22 08:48:15',0,'',''),(870,'Vlan',6,'0',20,'dixon (2)','2019-02-22 08:48:20',0,'',''),(871,'Vlan',7,'0',20,'dixon (2)','2019-02-22 08:48:25',0,'',''),(872,'Vlan',8,'0',20,'dixon (2)','2019-02-22 08:48:30',0,'',''),(873,'Vlan',9,'0',20,'dixon (2)','2019-02-22 08:48:36',0,'',''),(874,'Vlan',10,'0',20,'dixon (2)','2019-02-22 08:48:41',0,'',''),(876,'Vlan',3,'NetworkPort',15,'dixon (2)','2019-02-22 08:48:53',0,'','centos 7.5 - vlan 3 (84)'),(884,'Vlan',5,'NetworkPort',15,'dixon (2)','2019-02-22 08:49:56',0,'','centos 7.5 - vlan 5 (86)'),(892,'Vlan',4,'NetworkPort',15,'dixon (2)','2019-02-22 08:51:12',0,'','centos 7.5 - vlan 4 (85)'),(895,'FieldUnicity',1,'0',20,'dixon (2)','2019-02-22 09:57:33',0,'',''),(903,'RuleDictionnaryOperatingSystemArchitecture',13,'0',20,'dixon (2)','2019-02-22 10:36:16',0,'',''),(904,'RuleDictionnaryOperatingSystemArchitecture',13,'RuleCriteria',17,'dixon (2)','2019-02-22 10:36:42',0,'','Архитектура операционной системыравенx86 (23)'),(906,'RuleDictionnaryOperatingSystemArchitecture',13,'RuleCriteria',17,'dixon (2)','2019-02-22 10:37:02',0,'','Архитектура операционной системыравенx64 (24)'),(907,'RuleCriteria',24,'0',20,'dixon (2)','2019-02-22 10:37:02',0,'',''),(908,'RuleDictionnaryOperatingSystemArchitecture',13,'',0,'dixon (2)','2019-02-22 10:37:14',1,'x86','i386'),(909,'RuleDictionnaryOperatingSystemArchitecture',13,'RuleCriteria',19,'dixon (2)','2019-02-22 10:37:28',0,'Архитектура операционной системыравенx86 (23)',''),(910,'RuleDictionnaryOperatingSystemArchitecture',13,'RuleCriteria',17,'dixon (2)','2019-02-22 10:37:44',0,'','Архитектура операционной системыравенi386 (25)'),(911,'RuleCriteria',25,'0',20,'dixon (2)','2019-02-22 10:37:44',0,'',''),(913,'Document',2,'PluginGenericobjectVp',15,'dixon (2)','2019-02-22 10:43:55',0,'','centos 7.5 (1)'),(915,'Document',2,'0',20,'dixon (2)','2019-02-22 10:43:55',0,'',''),(941,'Document',2,'PluginGenericobjectVp',16,'dixon (2)','2019-02-25 02:44:48',0,'centos 7.5 (1)',''),(965,'Vlan',1,'NetworkPort',15,'Щегула Владимир (4)','2019-02-25 05:22:04',0,'','unun18.04 - tap0 (91)'),(975,'Vlan',5,'NetworkPort',15,'Щегула Владимир (4)','2019-02-25 05:25:34',0,'','unun18.04 - adcl0 (93)'),(982,'NetworkPort',2,'NetworkPort',7,'Щегула Владимир (4)','2019-02-25 05:29:36',0,'','unun18.04 - eth01 (87)'),(983,'NetworkPort',27,'NetworkPort',7,'Щегула Владимир (4)','2019-02-25 05:30:46',0,'','unun18.04 - eth03 (89)'),(998,'Contract',1,'PluginGenericobjectVirtual',15,'dixon (2)','2019-03-01 08:06:39',0,'','test01-srv (1)'),(1001,'PluginGenericobjectCnehcode',1,'0',20,'dixon (2)','2019-03-01 08:09:48',0,'',''),(1002,'PluginGenericobjectCnehcode',2,'0',20,'dixon (2)','2019-03-01 08:09:52',0,'',''),(1003,'PluginGenericobjectCnehcode',3,'0',20,'dixon (2)','2019-03-01 08:09:56',0,'',''),(1004,'PluginGenericobjectCnehcode',4,'0',20,'dixon (2)','2019-03-01 08:10:00',0,'',''),(1005,'PluginGenericobjectCnehcode',5,'0',20,'dixon (2)','2019-03-01 08:10:03',0,'',''),(1006,'PluginGenericobjectCnehcode',6,'0',20,'dixon (2)','2019-03-01 08:10:08',0,'',''),(1007,'PluginGenericobjectCnehcode',7,'0',20,'dixon (2)','2019-03-01 08:10:12',0,'',''),(1008,'PluginGenericobjectCnehcode',8,'0',20,'dixon (2)','2019-03-01 08:10:17',0,'',''),(1009,'PluginGenericobjectCnehcode',9,'0',20,'dixon (2)','2019-03-01 08:10:22',0,'',''),(1010,'PluginGenericobjectCnehcode',10,'0',20,'dixon (2)','2019-03-01 08:10:27',0,'',''),(1011,'PluginGenericobjectCnehcode',11,'0',20,'dixon (2)','2019-03-01 08:10:30',0,'',''),(1012,'PluginGenericobjectCnehcode',12,'0',20,'dixon (2)','2019-03-01 08:10:34',0,'',''),(1013,'PluginGenericobjectCnehcode',13,'0',20,'dixon (2)','2019-03-01 08:10:37',0,'',''),(1014,'PluginGenericobjectCnehcode',14,'0',20,'dixon (2)','2019-03-01 08:10:41',0,'',''),(1015,'PluginGenericobjectCnehcode',15,'0',20,'dixon (2)','2019-03-01 08:10:45',0,'',''),(1016,'PluginGenericobjectCnehcode',16,'0',20,'dixon (2)','2019-03-01 08:10:49',0,'',''),(1017,'PluginGenericobjectCnehcode',17,'0',20,'dixon (2)','2019-03-01 08:10:54',0,'',''),(1018,'PluginGenericobjectCnehcode',18,'0',20,'dixon (2)','2019-03-01 08:10:59',0,'',''),(1019,'PluginGenericobjectCnehcode',19,'0',20,'dixon (2)','2019-03-01 08:11:04',0,'',''),(1020,'PluginGenericobjectCnehcode',20,'0',20,'dixon (2)','2019-03-01 08:11:10',0,'',''),(1022,'Contract',1,'PluginGenericobjectVirtual',16,'dixon (2)','2019-03-01 08:43:29',0,'test01-srv (1)',''),(1030,'PluginGenericobjectType',9,'0',20,'dixon (2)','2019-03-01 10:22:27',0,'',''),(1031,'PluginGenericobjectType',9,'',0,'dixon (2)','2019-03-01 10:22:40',5,'0','1'),(1032,'PluginGenericobjectType',9,'',0,'dixon (2)','2019-03-01 10:24:17',6,'0','1'),(1033,'PluginGenericobjectType',9,'',0,'dixon (2)','2019-03-01 10:24:17',9,'0','1'),(1034,'PluginGenericobjectType',9,'',0,'dixon (2)','2019-03-01 10:24:17',16,'0','1');
/*!40000 ALTER TABLE `glpi_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_mailcollectors`
--

DROP TABLE IF EXISTS `glpi_mailcollectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_mailcollectors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filesize_max` int(11) NOT NULL DEFAULT '2097152',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `passwd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accepted` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refused` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_kerberos` tinyint(1) NOT NULL DEFAULT '0',
  `errors` int(11) NOT NULL DEFAULT '0',
  `use_mail_date` tinyint(1) NOT NULL DEFAULT '0',
  `date_creation` datetime DEFAULT NULL,
  `requester_field` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_mailcollectors`
--

LOCK TABLES `glpi_mailcollectors` WRITE;
/*!40000 ALTER TABLE `glpi_mailcollectors` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_mailcollectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_manufacturers`
--

DROP TABLE IF EXISTS `glpi_manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_manufacturers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_manufacturers`
--

LOCK TABLES `glpi_manufacturers` WRITE;
/*!40000 ALTER TABLE `glpi_manufacturers` DISABLE KEYS */;
INSERT INTO `glpi_manufacturers` VALUES (1,'supermicro','','2019-02-11 09:45:29','2019-02-11 09:45:29'),(2,'dell','','2019-02-11 09:45:34','2019-02-11 09:45:34'),(3,'Kingston','','2019-02-13 05:02:20','2019-02-13 05:02:20'),(4,'huawei','','2019-02-14 05:38:44','2019-02-14 05:38:44'),(5,'HP','','2019-02-15 03:29:02','2019-02-15 03:29:02'),(6,'tp-link','','2019-02-15 06:24:58','2019-02-15 06:24:58'),(7,'intel','','2019-02-15 09:00:32','2019-02-15 09:00:32');
/*!40000 ALTER TABLE `glpi_manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_monitormodels`
--

DROP TABLE IF EXISTS `glpi_monitormodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_monitormodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  `required_units` int(11) NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int(11) NOT NULL DEFAULT '0',
  `power_consumption` int(11) NOT NULL DEFAULT '0',
  `is_half_rack` tinyint(1) NOT NULL DEFAULT '0',
  `picture_front` text COLLATE utf8_unicode_ci,
  `picture_rear` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_monitormodels`
--

LOCK TABLES `glpi_monitormodels` WRITE;
/*!40000 ALTER TABLE `glpi_monitormodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_monitormodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_monitors`
--

DROP TABLE IF EXISTS `glpi_monitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_monitors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` decimal(5,2) NOT NULL DEFAULT '0.00',
  `have_micro` tinyint(1) NOT NULL DEFAULT '0',
  `have_speaker` tinyint(1) NOT NULL DEFAULT '0',
  `have_subd` tinyint(1) NOT NULL DEFAULT '0',
  `have_bnc` tinyint(1) NOT NULL DEFAULT '0',
  `have_dvi` tinyint(1) NOT NULL DEFAULT '0',
  `have_pivot` tinyint(1) NOT NULL DEFAULT '0',
  `have_hdmi` tinyint(1) NOT NULL DEFAULT '0',
  `have_displayport` tinyint(1) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `monitortypes_id` int(11) NOT NULL DEFAULT '0',
  `monitormodels_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `date_creation` datetime DEFAULT NULL,
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `monitormodels_id` (`monitormodels_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `monitortypes_id` (`monitortypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `date_creation` (`date_creation`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_monitors`
--

LOCK TABLES `glpi_monitors` WRITE;
/*!40000 ALTER TABLE `glpi_monitors` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_monitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_monitortypes`
--

DROP TABLE IF EXISTS `glpi_monitortypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_monitortypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_monitortypes`
--

LOCK TABLES `glpi_monitortypes` WRITE;
/*!40000 ALTER TABLE `glpi_monitortypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_monitortypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_netpoints`
--

DROP TABLE IF EXISTS `glpi_netpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_netpoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `complete` (`entities_id`,`locations_id`,`name`),
  KEY `location_name` (`locations_id`,`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_netpoints`
--

LOCK TABLES `glpi_netpoints` WRITE;
/*!40000 ALTER TABLE `glpi_netpoints` DISABLE KEYS */;
INSERT INTO `glpi_netpoints` VALUES (1,0,1,'001-1','','2019-02-14 06:10:54','2019-02-14 06:10:54'),(2,0,1,'001-2','','2019-02-14 06:11:02','2019-02-14 06:11:02'),(3,0,1,'002-1','','2019-02-14 06:11:13','2019-02-14 06:11:13'),(4,0,1,'002-2','','2019-02-14 06:11:21','2019-02-14 06:11:21'),(5,0,2,'comp1',NULL,'2019-02-22 08:14:27','2019-02-22 08:14:27'),(6,0,2,'comp2',NULL,'2019-02-22 08:14:27','2019-02-22 08:14:27'),(7,0,2,'comp3',NULL,'2019-02-22 08:14:27','2019-02-22 08:14:27'),(8,0,2,'comp4',NULL,'2019-02-22 08:14:27','2019-02-22 08:14:27'),(9,0,2,'comp5',NULL,'2019-02-22 08:14:27','2019-02-22 08:14:27'),(10,0,2,'comp6',NULL,'2019-02-22 08:14:27','2019-02-22 08:14:27'),(11,0,2,'comp7',NULL,'2019-02-22 08:14:27','2019-02-22 08:14:27'),(12,0,2,'comp8',NULL,'2019-02-22 08:14:27','2019-02-22 08:14:27'),(13,0,2,'comp9',NULL,'2019-02-22 08:14:27','2019-02-22 08:14:27'),(14,0,2,'comp10',NULL,'2019-02-22 08:14:27','2019-02-22 08:14:27');
/*!40000 ALTER TABLE `glpi_netpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkaliases`
--

DROP TABLE IF EXISTS `glpi_networkaliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkaliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `networknames_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fqdns_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `name` (`name`),
  KEY `networknames_id` (`networknames_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkaliases`
--

LOCK TABLES `glpi_networkaliases` WRITE;
/*!40000 ALTER TABLE `glpi_networkaliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkaliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkequipmentmodels`
--

DROP TABLE IF EXISTS `glpi_networkequipmentmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkequipmentmodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  `required_units` int(11) NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int(11) NOT NULL DEFAULT '0',
  `power_consumption` int(11) NOT NULL DEFAULT '0',
  `is_half_rack` tinyint(1) NOT NULL DEFAULT '0',
  `picture_front` text COLLATE utf8_unicode_ci,
  `picture_rear` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkequipmentmodels`
--

LOCK TABLES `glpi_networkequipmentmodels` WRITE;
/*!40000 ALTER TABLE `glpi_networkequipmentmodels` DISABLE KEYS */;
INSERT INTO `glpi_networkequipmentmodels` VALUES (1,'S5700-52C','•Forty-eight 10/100/1000Base-T ports\r\n•Subcards supported: 4x1000Base-X \r\n•SFP subcard, 2x10GE SFP+ subcard, and 4x10GE SFP+ subcardDouble hot swappable AC power •suppliesPoE+•Forwarding performance: 132 Mpps','S5700-52C-EI',6,1,0.5,1,250,0,'/front/document.send.php?file=_pictures/s5700-28c.png',NULL,'2019-02-14 05:48:05','2019-02-14 05:48:05'),(2,'S5700-28C-SI','•Forty-eight 10/100/1000Base-T portsSubcards supported: \r\n•4x1000Base-X SFP subcard, 2x10GE SFP+ subcard, and 4x10GE SFP+ subcardDouble hot swappable power \r\n•suppliesUSB port\r\n•Forwarding performance: 132 \r\n•Mpps','S5700-28C-SI',6,1,1,1,250,0,'/front/document.send.php?file=_pictures/s5700-28c.png',NULL,'2019-02-14 05:51:30','2019-02-14 05:51:30'),(3,'DL360-G7','','DL360-G7',0,2,1,0,500,0,NULL,NULL,'2019-02-15 03:31:25','2019-02-15 03:31:25');
/*!40000 ALTER TABLE `glpi_networkequipmentmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkequipments`
--

DROP TABLE IF EXISTS `glpi_networkequipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkequipments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `domains_id` int(11) NOT NULL DEFAULT '0',
  `networks_id` int(11) NOT NULL DEFAULT '0',
  `networkequipmenttypes_id` int(11) NOT NULL DEFAULT '0',
  `networkequipmentmodels_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `domains_id` (`domains_id`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `networkequipmentmodels_id` (`networkequipmentmodels_id`),
  KEY `networks_id` (`networks_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `networkequipmenttypes_id` (`networkequipmenttypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkequipments`
--

LOCK TABLES `glpi_networkequipments` WRITE;
/*!40000 ALTER TABLE `glpi_networkequipments` DISABLE KEYS */;
INSERT INTO `glpi_networkequipments` VALUES (1,0,0,'S5700-24TP-SI','','03JW39F10','137','','',0,1,'2019-02-14 09:44:33','\nThis item was replaced by \n ID: 2\n Наименование: S5700-52C-SI\n Серийный номер: 0028783J3618\n Инвентарный номер: 138',1,0,2,1,2,4,1,0,NULL,0,1,1,0.0000,0,'2019-02-14 05:52:23'),(2,0,0,'S5700-52C-SI','','0028783J3618','138','','',0,1,'2019-02-14 09:50:25','This item is a replacement for item \r\n ID: 1\r\n Наименование: S5700-24TP-SI\r\n Серийный номер: 03JW39F10\r\n Инвентарный номер: 137',1,0,2,1,1,4,0,0,NULL,0,1,1,0.0000,0,'2019-02-14 05:55:49'),(3,0,0,'S5700-28C-SI','1024','02JR57823S01','139','','',0,1,'2019-02-14 09:49:16','',1,0,2,1,2,4,0,0,NULL,0,2,1,0.0000,0,'2019-02-14 09:48:38');
/*!40000 ALTER TABLE `glpi_networkequipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkequipmenttypes`
--

DROP TABLE IF EXISTS `glpi_networkequipmenttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkequipmenttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkequipmenttypes`
--

LOCK TABLES `glpi_networkequipmenttypes` WRITE;
/*!40000 ALTER TABLE `glpi_networkequipmenttypes` DISABLE KEYS */;
INSERT INTO `glpi_networkequipmenttypes` VALUES (1,'switches','','2019-02-14 05:38:26','2019-02-14 05:38:26');
/*!40000 ALTER TABLE `glpi_networkequipmenttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkinterfaces`
--

DROP TABLE IF EXISTS `glpi_networkinterfaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkinterfaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkinterfaces`
--

LOCK TABLES `glpi_networkinterfaces` WRITE;
/*!40000 ALTER TABLE `glpi_networkinterfaces` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkinterfaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networknames`
--

DROP TABLE IF EXISTS `glpi_networknames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networknames` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `fqdns_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `FQDN` (`name`,`fqdns_id`),
  KEY `name` (`name`),
  KEY `fqdns_id` (`fqdns_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `item` (`itemtype`,`items_id`,`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networknames`
--

LOCK TABLES `glpi_networknames` WRITE;
/*!40000 ALTER TABLE `glpi_networknames` DISABLE KEYS */;
INSERT INTO `glpi_networknames` VALUES (1,0,4,'NetworkPort','',NULL,0,0,0,'2019-02-13 04:51:35','2019-02-13 04:51:35'),(2,0,1,'NetworkPort','',NULL,1,0,0,'2019-02-14 06:17:24','2019-02-14 06:17:24'),(3,0,5,'NetworkPort','',NULL,1,0,0,'2019-02-15 03:43:15','2019-02-15 03:43:15');
/*!40000 ALTER TABLE `glpi_networknames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkportaggregates`
--

DROP TABLE IF EXISTS `glpi_networkportaggregates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkportaggregates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkports_id` int(11) NOT NULL DEFAULT '0',
  `networkports_id_list` text COLLATE utf8_unicode_ci COMMENT 'array of associated networkports_id',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkportaggregates`
--

LOCK TABLES `glpi_networkportaggregates` WRITE;
/*!40000 ALTER TABLE `glpi_networkportaggregates` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkportaggregates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkportaliases`
--

DROP TABLE IF EXISTS `glpi_networkportaliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkportaliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkports_id` int(11) NOT NULL DEFAULT '0',
  `networkports_id_alias` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `networkports_id_alias` (`networkports_id_alias`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkportaliases`
--

LOCK TABLES `glpi_networkportaliases` WRITE;
/*!40000 ALTER TABLE `glpi_networkportaliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkportaliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkportdialups`
--

DROP TABLE IF EXISTS `glpi_networkportdialups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkportdialups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkports_id` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkportdialups`
--

LOCK TABLES `glpi_networkportdialups` WRITE;
/*!40000 ALTER TABLE `glpi_networkportdialups` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkportdialups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkportethernets`
--

DROP TABLE IF EXISTS `glpi_networkportethernets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkportethernets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkports_id` int(11) NOT NULL DEFAULT '0',
  `items_devicenetworkcards_id` int(11) NOT NULL DEFAULT '0',
  `netpoints_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'T, LX, SX',
  `speed` int(11) NOT NULL DEFAULT '10' COMMENT 'Mbit/s: 10, 100, 1000, 10000',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `card` (`items_devicenetworkcards_id`),
  KEY `netpoint` (`netpoints_id`),
  KEY `type` (`type`),
  KEY `speed` (`speed`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkportethernets`
--

LOCK TABLES `glpi_networkportethernets` WRITE;
/*!40000 ALTER TABLE `glpi_networkportethernets` DISABLE KEYS */;
INSERT INTO `glpi_networkportethernets` VALUES (1,1,0,1,'T',1000,'2019-02-14 06:17:24','2019-02-14 06:17:24'),(2,2,0,0,'T',1000,'2019-02-14 06:18:56','2019-02-14 06:18:56'),(3,3,0,0,'T',1000,'2019-02-15 08:53:05','2019-02-14 06:18:56'),(4,4,0,0,'T',1000,'2019-02-14 06:18:56','2019-02-14 06:18:56'),(5,5,0,0,'T',1000,'2019-02-14 06:18:56','2019-02-14 06:18:56'),(6,6,0,0,'T',1000,'2019-02-14 06:18:56','2019-02-14 06:18:56'),(26,26,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(27,27,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(28,28,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(29,29,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(30,30,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(31,31,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(32,32,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(33,33,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(34,34,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(35,35,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(36,36,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(37,37,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(38,38,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(39,39,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(40,40,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(41,41,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(42,42,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(43,43,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(44,44,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(45,45,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(46,46,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(47,47,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(48,48,0,0,'T',1000,'2019-02-14 06:21:04','2019-02-14 06:21:04'),(49,49,0,0,'T',100,'2019-02-15 05:40:55','2019-02-15 05:40:55'),(50,50,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(51,51,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(52,52,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(53,53,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(54,54,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(55,55,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(56,56,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(57,57,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(58,58,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(59,59,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(60,60,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(61,61,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(62,62,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(63,63,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(64,64,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(65,65,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(66,66,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(67,67,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(68,68,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(69,69,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(70,70,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(71,71,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(72,72,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(73,73,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(74,74,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(75,75,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(76,76,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(77,77,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(78,78,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(79,79,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(80,80,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(81,81,0,0,'T',100,'2019-02-15 05:46:13','2019-02-15 05:46:13');
/*!40000 ALTER TABLE `glpi_networkportethernets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkportfiberchannels`
--

DROP TABLE IF EXISTS `glpi_networkportfiberchannels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkportfiberchannels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkports_id` int(11) NOT NULL DEFAULT '0',
  `items_devicenetworkcards_id` int(11) NOT NULL DEFAULT '0',
  `netpoints_id` int(11) NOT NULL DEFAULT '0',
  `wwn` varchar(16) COLLATE utf8_unicode_ci DEFAULT '',
  `speed` int(11) NOT NULL DEFAULT '10' COMMENT 'Mbit/s: 10, 100, 1000, 10000',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `card` (`items_devicenetworkcards_id`),
  KEY `netpoint` (`netpoints_id`),
  KEY `wwn` (`wwn`),
  KEY `speed` (`speed`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkportfiberchannels`
--

LOCK TABLES `glpi_networkportfiberchannels` WRITE;
/*!40000 ALTER TABLE `glpi_networkportfiberchannels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkportfiberchannels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkportlocals`
--

DROP TABLE IF EXISTS `glpi_networkportlocals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkportlocals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkports_id` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkportlocals`
--

LOCK TABLES `glpi_networkportlocals` WRITE;
/*!40000 ALTER TABLE `glpi_networkportlocals` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkportlocals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkports`
--

DROP TABLE IF EXISTS `glpi_networkports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `logical_number` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instantiation_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mac` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `on_device` (`items_id`,`itemtype`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `mac` (`mac`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkports`
--

LOCK TABLES `glpi_networkports` WRITE;
/*!40000 ALTER TABLE `glpi_networkports` DISABLE KEYS */;
INSERT INTO `glpi_networkports` VALUES (1,2,'NetworkEquipment',0,0,1,'S5700-52C-SI','NetworkPortEthernet','60:45:cb:a1:1a:9e','',0,0,'2019-02-15 08:50:29','2019-02-14 06:17:24'),(2,1,'Computer',0,0,1,'01','NetworkPortEthernet','60:45:cb:a1:2a:3d','',0,0,'2019-02-14 06:18:56','2019-02-14 06:18:56'),(3,1,'Computer',0,0,2,'02','NetworkPortEthernet','60:45:cb:a1:2a:3d','',0,0,'2019-02-14 06:18:56','2019-02-14 06:18:56'),(4,1,'Computer',0,0,3,'03','NetworkPortEthernet','60:45:cb:a1:2a:3d','',0,0,'2019-02-14 06:18:56','2019-02-14 06:18:56'),(5,1,'Computer',0,0,4,'04','NetworkPortEthernet','60:45:cb:a1:2a:3d','',0,0,'2019-02-14 06:18:56','2019-02-14 06:18:56'),(6,1,'Computer',0,0,5,'05','NetworkPortEthernet','60:45:cb:a1:2a:3d','',0,0,'2019-02-14 06:18:56','2019-02-14 06:18:56'),(26,2,'NetworkEquipment',0,0,2,'02','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(27,2,'NetworkEquipment',0,0,3,'03','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(28,2,'NetworkEquipment',0,0,4,'04','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(29,2,'NetworkEquipment',0,0,5,'05','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(30,2,'NetworkEquipment',0,0,6,'06','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(31,2,'NetworkEquipment',0,0,7,'07','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(32,2,'NetworkEquipment',0,0,8,'08','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(33,2,'NetworkEquipment',0,0,9,'09','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(34,2,'NetworkEquipment',0,0,10,'10','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(35,2,'NetworkEquipment',0,0,11,'11','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(36,2,'NetworkEquipment',0,0,12,'12','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(37,2,'NetworkEquipment',0,0,13,'13','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(38,2,'NetworkEquipment',0,0,14,'14','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(39,2,'NetworkEquipment',0,0,15,'15','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(40,2,'NetworkEquipment',0,0,16,'16','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(41,2,'NetworkEquipment',0,0,17,'17','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(42,2,'NetworkEquipment',0,0,18,'18','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(43,2,'NetworkEquipment',0,0,19,'19','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(44,2,'NetworkEquipment',0,0,20,'20','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(45,2,'NetworkEquipment',0,0,21,'21','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(46,2,'NetworkEquipment',0,0,22,'22','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(47,2,'NetworkEquipment',0,0,23,'23','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(48,2,'NetworkEquipment',0,0,24,'24','NetworkPortEthernet','60:45:cb:a1:1a:41','',0,0,'2019-02-14 09:44:33','2019-02-14 06:21:04'),(49,1,'Phone',0,0,1,'1','NetworkPortEthernet','','',0,0,'2019-02-15 05:40:55','2019-02-15 05:40:55'),(50,3,'NetworkEquipment',0,0,1,'01','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(51,3,'NetworkEquipment',0,0,2,'02','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(52,3,'NetworkEquipment',0,0,3,'03','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(53,3,'NetworkEquipment',0,0,4,'04','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(54,3,'NetworkEquipment',0,0,5,'05','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(55,3,'NetworkEquipment',0,0,6,'06','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(56,3,'NetworkEquipment',0,0,7,'07','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(57,3,'NetworkEquipment',0,0,8,'08','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(58,3,'NetworkEquipment',0,0,9,'09','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(59,3,'NetworkEquipment',0,0,10,'10','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(60,3,'NetworkEquipment',0,0,11,'11','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(61,3,'NetworkEquipment',0,0,12,'12','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(62,3,'NetworkEquipment',0,0,13,'13','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(63,3,'NetworkEquipment',0,0,14,'14','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(64,3,'NetworkEquipment',0,0,15,'15','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(65,3,'NetworkEquipment',0,0,16,'16','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(66,3,'NetworkEquipment',0,0,17,'17','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(67,3,'NetworkEquipment',0,0,18,'18','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(68,3,'NetworkEquipment',0,0,19,'19','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(69,3,'NetworkEquipment',0,0,20,'20','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(70,3,'NetworkEquipment',0,0,21,'21','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(71,3,'NetworkEquipment',0,0,22,'22','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(72,3,'NetworkEquipment',0,0,23,'23','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(73,3,'NetworkEquipment',0,0,24,'24','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(74,3,'NetworkEquipment',0,0,25,'25','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(75,3,'NetworkEquipment',0,0,26,'26','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(76,3,'NetworkEquipment',0,0,27,'27','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(77,3,'NetworkEquipment',0,0,28,'28','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(78,3,'NetworkEquipment',0,0,29,'29','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(79,3,'NetworkEquipment',0,0,30,'30','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(80,3,'NetworkEquipment',0,0,31,'31','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13'),(81,3,'NetworkEquipment',0,0,32,'32','NetworkPortEthernet','','',0,0,'2019-02-15 05:46:13','2019-02-15 05:46:13');
/*!40000 ALTER TABLE `glpi_networkports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkports_networkports`
--

DROP TABLE IF EXISTS `glpi_networkports_networkports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkports_networkports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkports_id_1` int(11) NOT NULL DEFAULT '0',
  `networkports_id_2` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`networkports_id_1`,`networkports_id_2`),
  KEY `networkports_id_2` (`networkports_id_2`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkports_networkports`
--

LOCK TABLES `glpi_networkports_networkports` WRITE;
/*!40000 ALTER TABLE `glpi_networkports_networkports` DISABLE KEYS */;
INSERT INTO `glpi_networkports_networkports` VALUES (3,3,26);
/*!40000 ALTER TABLE `glpi_networkports_networkports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkports_vlans`
--

DROP TABLE IF EXISTS `glpi_networkports_vlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkports_vlans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkports_id` int(11) NOT NULL DEFAULT '0',
  `vlans_id` int(11) NOT NULL DEFAULT '0',
  `tagged` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`networkports_id`,`vlans_id`),
  KEY `vlans_id` (`vlans_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkports_vlans`
--

LOCK TABLES `glpi_networkports_vlans` WRITE;
/*!40000 ALTER TABLE `glpi_networkports_vlans` DISABLE KEYS */;
INSERT INTO `glpi_networkports_vlans` VALUES (1,4,1,1);
/*!40000 ALTER TABLE `glpi_networkports_vlans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkportwifis`
--

DROP TABLE IF EXISTS `glpi_networkportwifis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkportwifis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkports_id` int(11) NOT NULL DEFAULT '0',
  `items_devicenetworkcards_id` int(11) NOT NULL DEFAULT '0',
  `wifinetworks_id` int(11) NOT NULL DEFAULT '0',
  `networkportwifis_id` int(11) NOT NULL DEFAULT '0' COMMENT 'only useful in case of Managed node',
  `version` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'a, a/b, a/b/g, a/b/g/n, a/b/g/n/y',
  `mode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ad-hoc, managed, master, repeater, secondary, monitor, auto',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `card` (`items_devicenetworkcards_id`),
  KEY `essid` (`wifinetworks_id`),
  KEY `version` (`version`),
  KEY `mode` (`mode`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkportwifis`
--

LOCK TABLES `glpi_networkportwifis` WRITE;
/*!40000 ALTER TABLE `glpi_networkportwifis` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkportwifis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networks`
--

DROP TABLE IF EXISTS `glpi_networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networks`
--

LOCK TABLES `glpi_networks` WRITE;
/*!40000 ALTER TABLE `glpi_networks` DISABLE KEYS */;
INSERT INTO `glpi_networks` VALUES (1,'Сеть клиента (p2p)','Сеть клиента (p2p)','2019-02-13 08:19:15','2019-02-11 09:47:38'),(2,'Сеть клиента (LAN)','Сеть клиента (LAN)','2019-02-13 08:19:46','2019-02-13 08:19:46'),(3,'Vlan','','2019-02-13 08:20:26','2019-02-13 08:20:26');
/*!40000 ALTER TABLE `glpi_networks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_notepads`
--

DROP TABLE IF EXISTS `glpi_notepads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_notepads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `users_id_lastupdater` int(11) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date` (`date`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_notepads`
--

LOCK TABLES `glpi_notepads` WRITE;
/*!40000 ALTER TABLE `glpi_notepads` DISABLE KEYS */;
INSERT INTO `glpi_notepads` VALUES (1,'PluginGenericobjectVirtual',1,'2019-03-01 04:33:06','2019-03-01 04:33:06',2,2,'Заметка1'),(2,'PluginGenericobjectVirtual',1,'2019-03-01 08:07:24','2019-03-01 08:07:24',2,2,'Отключил по просьбе Умуткулова - хозяина');
/*!40000 ALTER TABLE `glpi_notepads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_notifications`
--

DROP TABLE IF EXISTS `glpi_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `event` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `itemtype` (`itemtype`),
  KEY `entities_id` (`entities_id`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_notifications`
--

LOCK TABLES `glpi_notifications` WRITE;
/*!40000 ALTER TABLE `glpi_notifications` DISABLE KEYS */;
INSERT INTO `glpi_notifications` VALUES (1,'Alert Tickets not closed',0,'Ticket','alertnotclosed','',1,1,'2010-02-16 16:41:39',NULL),(2,'New Ticket',0,'Ticket','new','',1,1,'2010-02-16 16:41:39',NULL),(3,'Update Ticket',0,'Ticket','update','',1,0,'2010-02-16 16:41:39',NULL),(4,'Close Ticket',0,'Ticket','closed','',1,1,'2010-02-16 16:41:39',NULL),(5,'Add Followup',0,'Ticket','add_followup','',1,1,'2010-02-16 16:41:39',NULL),(6,'Add Task',0,'Ticket','add_task','',1,1,'2010-02-16 16:41:39',NULL),(7,'Update Followup',0,'Ticket','update_followup','',1,1,'2010-02-16 16:41:39',NULL),(8,'Update Task',0,'Ticket','update_task','',1,1,'2010-02-16 16:41:39',NULL),(9,'Delete Followup',0,'Ticket','delete_followup','',1,1,'2010-02-16 16:41:39',NULL),(10,'Delete Task',0,'Ticket','delete_task','',1,1,'2010-02-16 16:41:39',NULL),(11,'Resolve ticket',0,'Ticket','solved','',1,1,'2010-02-16 16:41:39',NULL),(12,'Ticket Validation',0,'Ticket','validation','',1,1,'2010-02-16 16:41:39',NULL),(13,'New Reservation',0,'Reservation','new','',1,1,'2010-02-16 16:41:39',NULL),(14,'Update Reservation',0,'Reservation','update','',1,1,'2010-02-16 16:41:39',NULL),(15,'Delete Reservation',0,'Reservation','delete','',1,1,'2010-02-16 16:41:39',NULL),(16,'Alert Reservation',0,'Reservation','alert','',1,1,'2010-02-16 16:41:39',NULL),(17,'Contract Notice',0,'Contract','notice','',1,1,'2010-02-16 16:41:39',NULL),(18,'Contract End',0,'Contract','end','',1,1,'2010-02-16 16:41:39',NULL),(19,'MySQL Synchronization',0,'DBConnection','desynchronization','',1,1,'2010-02-16 16:41:39',NULL),(20,'Cartridges',0,'CartridgeItem','alert','',1,1,'2010-02-16 16:41:39',NULL),(21,'Consumables',0,'ConsumableItem','alert','',1,1,'2010-02-16 16:41:39',NULL),(22,'Infocoms',0,'Infocom','alert','',1,1,'2010-02-16 16:41:39',NULL),(23,'Software Licenses',0,'SoftwareLicense','alert','',1,1,'2010-02-16 16:41:39',NULL),(24,'Ticket Recall',0,'Ticket','recall','',1,1,'2011-03-04 11:35:13',NULL),(25,'Password Forget',0,'User','passwordforget','',1,1,'2011-03-04 11:35:13',NULL),(26,'Ticket Satisfaction',0,'Ticket','satisfaction','',1,1,'2011-03-04 11:35:15',NULL),(27,'Item not unique',0,'FieldUnicity','refuse','',1,1,'2011-03-04 11:35:16',NULL),(28,'Crontask Watcher',0,'Crontask','alert','',1,1,'2011-03-04 11:35:16',NULL),(29,'New Problem',0,'Problem','new','',1,1,'2011-12-06 09:48:33',NULL),(30,'Update Problem',0,'Problem','update','',1,1,'2011-12-06 09:48:33',NULL),(31,'Resolve Problem',0,'Problem','solved','',1,1,'2011-12-06 09:48:33',NULL),(32,'Add Task',0,'Problem','add_task','',1,1,'2011-12-06 09:48:33',NULL),(33,'Update Task',0,'Problem','update_task','',1,1,'2011-12-06 09:48:33',NULL),(34,'Delete Task',0,'Problem','delete_task','',1,1,'2011-12-06 09:48:33',NULL),(35,'Close Problem',0,'Problem','closed','',1,1,'2011-12-06 09:48:33',NULL),(36,'Delete Problem',0,'Problem','delete','',1,1,'2011-12-06 09:48:33',NULL),(37,'Ticket Validation Answer',0,'Ticket','validation_answer','',1,1,'2014-01-15 14:35:24',NULL),(38,'Contract End Periodicity',0,'Contract','periodicity','',1,1,'2014-01-15 14:35:24',NULL),(39,'Contract Notice Periodicity',0,'Contract','periodicitynotice','',1,1,'2014-01-15 14:35:24',NULL),(40,'Planning recall',0,'PlanningRecall','planningrecall','',1,1,'2014-01-15 14:35:24',NULL),(41,'Delete Ticket',0,'Ticket','delete','',1,1,'2014-01-15 14:35:26',NULL),(42,'New Change',0,'Change','new','',1,1,'2014-06-18 08:02:07',NULL),(43,'Update Change',0,'Change','update','',1,1,'2014-06-18 08:02:07',NULL),(44,'Resolve Change',0,'Change','solved','',1,1,'2014-06-18 08:02:07',NULL),(45,'Add Task',0,'Change','add_task','',1,1,'2014-06-18 08:02:07',NULL),(46,'Update Task',0,'Change','update_task','',1,1,'2014-06-18 08:02:07',NULL),(47,'Delete Task',0,'Change','delete_task','',1,1,'2014-06-18 08:02:07',NULL),(48,'Close Change',0,'Change','closed','',1,1,'2014-06-18 08:02:07',NULL),(49,'Delete Change',0,'Change','delete','',1,1,'2014-06-18 08:02:07',NULL),(50,'Ticket Satisfaction Answer',0,'Ticket','replysatisfaction','',1,1,'2014-06-18 08:02:08',NULL),(51,'Receiver errors',0,'MailCollector','error','',1,1,'2014-06-18 08:02:08',NULL),(52,'New Project',0,'Project','new','',1,1,'2014-06-18 08:02:09',NULL),(53,'Update Project',0,'Project','update','',1,1,'2014-06-18 08:02:09',NULL),(54,'Delete Project',0,'Project','delete','',1,1,'2014-06-18 08:02:09',NULL),(55,'New Project Task',0,'ProjectTask','new','',1,1,'2014-06-18 08:02:09',NULL),(56,'Update Project Task',0,'ProjectTask','update','',1,1,'2014-06-18 08:02:09',NULL),(57,'Delete Project Task',0,'ProjectTask','delete','',1,1,'2014-06-18 08:02:09',NULL),(58,'Request Unlock Items',0,'ObjectLock','unlock','',1,1,'2016-02-08 16:57:46',NULL),(59,'New user in requesters',0,'Ticket','requester_user','',1,1,'2016-02-08 16:57:46',NULL),(60,'New group in requesters',0,'Ticket','requester_group','',1,1,'2016-02-08 16:57:46',NULL),(61,'New user in observers',0,'Ticket','observer_user','',1,1,'2016-02-08 16:57:46',NULL),(62,'New group in observers',0,'Ticket','observer_group','',1,1,'2016-02-08 16:57:46',NULL),(63,'New user in assignees',0,'Ticket','assign_user','',1,1,'2016-02-08 16:57:46',NULL),(64,'New group in assignees',0,'Ticket','assign_group','',1,1,'2016-02-08 16:57:46',NULL),(65,'New supplier in assignees',0,'Ticket','assign_supplier','',1,1,'2016-02-08 16:57:46',NULL),(66,'Saved searches',0,'SavedSearch_Alert','alert','',1,1,'2016-02-08 16:57:46',NULL),(67,'Certificates',0,'Certificate','alert','',1,1,NULL,NULL),(73,'Форма была создана',0,'PluginFormcreatorFormAnswer','plugin_formcreator_form_created','',1,1,'2019-02-14 03:16:17','2019-02-14 03:16:17'),(74,'Форма требует согласования',0,'PluginFormcreatorFormAnswer','plugin_formcreator_need_validation','',1,1,'2019-02-14 03:16:17','2019-02-14 03:16:17'),(75,'Форма отклонена',0,'PluginFormcreatorFormAnswer','plugin_formcreator_refused','',1,1,'2019-02-14 03:16:17','2019-02-14 03:16:17'),(76,'Форма принята',0,'PluginFormcreatorFormAnswer','plugin_formcreator_accepted','',1,1,'2019-02-14 03:16:17','2019-02-14 03:16:17'),(77,'Форма удалена',0,'PluginFormcreatorFormAnswer','plugin_formcreator_deleted','',1,1,'2019-02-14 03:16:17','2019-02-14 03:16:17'),(78,'New Order Validation',0,'PluginOrderOrder','ask','',1,1,'2019-02-21 10:23:12','2019-02-21 10:23:12'),(79,'Confirm Order Validation',0,'PluginOrderOrder','validation','',1,1,'2019-02-21 10:23:12','2019-02-21 10:23:12'),(80,'Cancel Order Validation',0,'PluginOrderOrder','undovalidation','',1,1,'2019-02-21 10:23:12','2019-02-21 10:23:12'),(81,'Cancel Order',0,'PluginOrderOrder','cancel','',1,1,'2019-02-21 10:23:12','2019-02-21 10:23:12'),(82,'Due date overtaken',0,'PluginOrderOrder','duedate','',1,1,'2019-02-21 10:23:12','2019-02-21 10:23:12'),(83,'Order Delivered',0,'PluginOrderOrder','delivered','',1,1,'2019-02-21 10:23:12','2019-02-21 10:23:12');
/*!40000 ALTER TABLE `glpi_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_notifications_notificationtemplates`
--

DROP TABLE IF EXISTS `glpi_notifications_notificationtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_notifications_notificationtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notifications_id` int(11) NOT NULL DEFAULT '0',
  `mode` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'See Notification_NotificationTemplate::MODE_* constants',
  `notificationtemplates_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`notifications_id`,`mode`,`notificationtemplates_id`),
  KEY `notifications_id` (`notifications_id`),
  KEY `notificationtemplates_id` (`notificationtemplates_id`),
  KEY `mode` (`mode`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_notifications_notificationtemplates`
--

LOCK TABLES `glpi_notifications_notificationtemplates` WRITE;
/*!40000 ALTER TABLE `glpi_notifications_notificationtemplates` DISABLE KEYS */;
INSERT INTO `glpi_notifications_notificationtemplates` VALUES (1,1,'mailing',6),(2,2,'mailing',4),(3,3,'mailing',4),(4,4,'mailing',4),(5,5,'mailing',4),(6,6,'mailing',4),(7,7,'mailing',4),(8,8,'mailing',4),(9,9,'mailing',4),(10,10,'mailing',4),(11,11,'mailing',4),(12,12,'mailing',7),(13,13,'mailing',2),(14,14,'mailing',2),(15,15,'mailing',2),(16,16,'mailing',3),(17,17,'mailing',12),(18,18,'mailing',12),(19,19,'mailing',1),(20,20,'mailing',8),(21,21,'mailing',9),(22,22,'mailing',10),(23,23,'mailing',11),(24,24,'mailing',4),(25,25,'mailing',13),(26,26,'mailing',14),(27,27,'mailing',15),(28,28,'mailing',16),(29,29,'mailing',17),(30,30,'mailing',17),(31,31,'mailing',17),(32,32,'mailing',17),(33,33,'mailing',17),(34,34,'mailing',17),(35,35,'mailing',17),(36,36,'mailing',17),(37,37,'mailing',7),(38,38,'mailing',12),(39,39,'mailing',12),(40,40,'mailing',18),(41,41,'mailing',4),(42,42,'mailing',19),(43,43,'mailing',19),(44,44,'mailing',19),(45,45,'mailing',19),(46,46,'mailing',19),(47,47,'mailing',19),(48,48,'mailing',19),(49,49,'mailing',19),(50,50,'mailing',14),(51,51,'mailing',20),(52,52,'mailing',21),(53,53,'mailing',21),(54,54,'mailing',21),(55,55,'mailing',22),(56,56,'mailing',22),(57,57,'mailing',22),(58,58,'mailing',23),(59,59,'mailing',4),(60,60,'mailing',4),(61,61,'mailing',4),(62,62,'mailing',4),(63,63,'mailing',4),(64,64,'mailing',4),(65,65,'mailing',4),(66,66,'mailing',24),(67,67,'mailing',25),(73,73,'mailing',31),(74,74,'mailing',32),(75,75,'mailing',33),(76,76,'mailing',34),(77,77,'mailing',35),(78,78,'mailing',36),(79,79,'mailing',36),(80,80,'mailing',36),(81,81,'mailing',36),(82,82,'mailing',37),(83,83,'mailing',38);
/*!40000 ALTER TABLE `glpi_notifications_notificationtemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_notificationtargets`
--

DROP TABLE IF EXISTS `glpi_notificationtargets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_notificationtargets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `notifications_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `items` (`type`,`items_id`),
  KEY `notifications_id` (`notifications_id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_notificationtargets`
--

LOCK TABLES `glpi_notificationtargets` WRITE;
/*!40000 ALTER TABLE `glpi_notificationtargets` DISABLE KEYS */;
INSERT INTO `glpi_notificationtargets` VALUES (1,3,1,13),(2,1,1,13),(3,3,2,2),(4,1,1,2),(5,1,1,3),(6,1,1,5),(7,1,1,4),(8,2,1,3),(9,4,1,3),(10,3,1,2),(11,3,1,3),(12,3,1,5),(13,3,1,4),(14,1,1,19),(15,14,1,12),(16,3,1,14),(17,1,1,14),(18,3,1,15),(19,1,1,15),(20,1,1,6),(21,3,1,6),(22,1,1,7),(23,3,1,7),(24,1,1,8),(25,3,1,8),(26,1,1,9),(27,3,1,9),(28,1,1,10),(29,3,1,10),(30,1,1,11),(31,3,1,11),(32,19,1,25),(33,3,1,26),(34,21,1,2),(35,21,1,3),(36,21,1,5),(37,21,1,4),(38,21,1,6),(39,21,1,7),(40,21,1,8),(41,21,1,9),(42,21,1,10),(43,21,1,11),(46,1,1,28),(47,3,1,29),(48,1,1,29),(49,21,1,29),(50,2,1,30),(51,4,1,30),(52,3,1,30),(53,1,1,30),(54,21,1,30),(55,3,1,31),(56,1,1,31),(57,21,1,31),(58,3,1,32),(59,1,1,32),(60,21,1,32),(61,3,1,33),(62,1,1,33),(63,21,1,33),(64,3,1,34),(65,1,1,34),(66,21,1,34),(67,3,1,35),(68,1,1,35),(69,21,1,35),(70,3,1,36),(71,1,1,36),(72,21,1,36),(73,14,1,37),(74,3,1,40),(75,1,1,41),(76,3,1,42),(77,1,1,42),(78,21,1,42),(79,2,1,43),(80,4,1,43),(81,3,1,43),(82,1,1,43),(83,21,1,43),(84,3,1,44),(85,1,1,44),(86,21,1,44),(87,3,1,45),(88,1,1,45),(89,21,1,45),(90,3,1,46),(91,1,1,46),(92,21,1,46),(93,3,1,47),(94,1,1,47),(95,21,1,47),(96,3,1,48),(97,1,1,48),(98,21,1,48),(99,3,1,49),(100,1,1,49),(101,21,1,49),(102,3,1,50),(103,2,1,50),(104,1,1,51),(105,27,1,52),(106,1,1,52),(107,28,1,52),(108,27,1,53),(109,1,1,53),(110,28,1,53),(111,27,1,54),(112,1,1,54),(113,28,1,54),(114,31,1,55),(115,1,1,55),(116,32,1,55),(117,31,1,56),(118,1,1,56),(119,32,1,56),(120,31,1,57),(121,1,1,57),(122,32,1,57),(123,19,1,58),(124,3,1,59),(125,13,1,60),(126,21,1,61),(127,20,1,62),(128,2,1,63),(129,23,1,64),(130,8,1,65),(131,19,1,66),(137,101,1,73),(138,102,1,74),(139,101,1,75),(140,101,1,76),(141,101,1,77);
/*!40000 ALTER TABLE `glpi_notificationtargets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_notificationtemplates`
--

DROP TABLE IF EXISTS `glpi_notificationtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_notificationtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `css` text COLLATE utf8_unicode_ci,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `itemtype` (`itemtype`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_notificationtemplates`
--

LOCK TABLES `glpi_notificationtemplates` WRITE;
/*!40000 ALTER TABLE `glpi_notificationtemplates` DISABLE KEYS */;
INSERT INTO `glpi_notificationtemplates` VALUES (1,'MySQL Synchronization','DBConnection','2010-02-01 15:51:46','',NULL,NULL),(2,'Reservations','Reservation','2010-02-03 14:03:45','',NULL,NULL),(3,'Alert Reservation','Reservation','2010-02-03 14:03:45','',NULL,NULL),(4,'Tickets','Ticket','2010-02-07 21:39:15','',NULL,NULL),(5,'Tickets (Simple)','Ticket','2010-02-07 21:39:15','',NULL,NULL),(6,'Alert Tickets not closed','Ticket','2010-02-07 21:39:15','',NULL,NULL),(7,'Tickets Validation','Ticket','2010-02-26 21:39:15','',NULL,NULL),(8,'Cartridges','CartridgeItem','2010-02-16 13:17:24','',NULL,NULL),(9,'Consumables','ConsumableItem','2010-02-16 13:17:38','',NULL,NULL),(10,'Infocoms','Infocom','2010-02-16 13:17:55','',NULL,NULL),(11,'Licenses','SoftwareLicense','2010-02-16 13:18:12','',NULL,NULL),(12,'Contracts','Contract','2010-02-16 13:18:12','',NULL,NULL),(13,'Password Forget','User','2011-03-04 11:35:13',NULL,NULL,NULL),(14,'Ticket Satisfaction','Ticket','2011-03-04 11:35:15',NULL,NULL,NULL),(15,'Item not unique','FieldUnicity','2011-03-04 11:35:16',NULL,NULL,NULL),(16,'Crontask','Crontask','2011-03-04 11:35:16',NULL,NULL,NULL),(17,'Problems','Problem','2011-12-06 09:48:33',NULL,NULL,NULL),(18,'Planning recall','PlanningRecall','2014-01-15 14:35:24',NULL,NULL,NULL),(19,'Changes','Change','2014-06-18 08:02:07',NULL,NULL,NULL),(20,'Receiver errors','MailCollector','2014-06-18 08:02:08',NULL,NULL,NULL),(21,'Projects','Project','2014-06-18 08:02:09',NULL,NULL,NULL),(22,'Project Tasks','ProjectTask','2014-06-18 08:02:09',NULL,NULL,NULL),(23,'Unlock Item request','ObjectLock','2016-02-08 16:57:46',NULL,NULL,NULL),(24,'Saved searches alerts','SavedSearch_Alert','2017-04-05 14:57:34',NULL,NULL,NULL),(25,'Certificates','Certificate',NULL,'',NULL,NULL),(31,'Форма была создана','PluginFormcreatorFormAnswer','2019-02-14 03:16:17','',NULL,'2019-02-14 03:16:17'),(32,'Форма требует согласования','PluginFormcreatorFormAnswer','2019-02-14 03:16:17','',NULL,'2019-02-14 03:16:17'),(33,'Форма отклонена','PluginFormcreatorFormAnswer','2019-02-14 03:16:17','',NULL,'2019-02-14 03:16:17'),(34,'Форма принята','PluginFormcreatorFormAnswer','2019-02-14 03:16:17','',NULL,'2019-02-14 03:16:17'),(35,'Форма удалена','PluginFormcreatorFormAnswer','2019-02-14 03:16:17','',NULL,'2019-02-14 03:16:17'),(36,'Order Validation','PluginOrderOrder','2019-02-21 10:23:12','','','2019-02-21 10:23:12'),(37,'Due date overtaken','PluginOrderOrder','2019-02-21 10:23:12','','','2019-02-21 10:23:12'),(38,'Order Delivered','PluginOrderOrder','2019-02-21 10:23:12','','','2019-02-21 10:23:12');
/*!40000 ALTER TABLE `glpi_notificationtemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_notificationtemplatetranslations`
--

DROP TABLE IF EXISTS `glpi_notificationtemplatetranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_notificationtemplatetranslations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificationtemplates_id` int(11) NOT NULL DEFAULT '0',
  `language` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_text` text COLLATE utf8_unicode_ci,
  `content_html` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `notificationtemplates_id` (`notificationtemplates_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_notificationtemplatetranslations`
--

LOCK TABLES `glpi_notificationtemplatetranslations` WRITE;
/*!40000 ALTER TABLE `glpi_notificationtemplatetranslations` DISABLE KEYS */;
INSERT INTO `glpi_notificationtemplatetranslations` VALUES (1,1,'','##lang.dbconnection.title##','##lang.dbconnection.delay## : ##dbconnection.delay##\n','&lt;p&gt;##lang.dbconnection.delay## : ##dbconnection.delay##&lt;/p&gt;'),(2,2,'','##reservation.action##','======================================================================\n##lang.reservation.user##: ##reservation.user##\n##lang.reservation.item.name##: ##reservation.itemtype## - ##reservation.item.name##\n##IFreservation.tech## ##lang.reservation.tech## ##reservation.tech## ##ENDIFreservation.tech##\n##lang.reservation.begin##: ##reservation.begin##\n##lang.reservation.end##: ##reservation.end##\n##lang.reservation.comment##: ##reservation.comment##\n======================================================================\n','&lt;!-- description{ color: inherit; background: #ebebeb;border-style: solid;border-color: #8d8d8d; border-width: 0px 1px 1px 0px; } --&gt;\n&lt;p&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.user##:&lt;/span&gt;##reservation.user##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.item.name##:&lt;/span&gt;##reservation.itemtype## - ##reservation.item.name##&lt;br /&gt;##IFreservation.tech## ##lang.reservation.tech## ##reservation.tech####ENDIFreservation.tech##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.begin##:&lt;/span&gt; ##reservation.begin##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.end##:&lt;/span&gt;##reservation.end##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.comment##:&lt;/span&gt; ##reservation.comment##&lt;/p&gt;'),(3,3,'','##reservation.action##  ##reservation.entity##','##lang.reservation.entity## : ##reservation.entity##\n\n\n##FOREACHreservations##\n##lang.reservation.itemtype## : ##reservation.itemtype##\n\n ##lang.reservation.item## : ##reservation.item##\n\n ##reservation.url##\n\n ##ENDFOREACHreservations##','&lt;p&gt;##lang.reservation.entity## : ##reservation.entity## &lt;br /&gt; &lt;br /&gt;\n##FOREACHreservations## &lt;br /&gt;##lang.reservation.itemtype## :  ##reservation.itemtype##&lt;br /&gt;\n ##lang.reservation.item## :  ##reservation.item##&lt;br /&gt; &lt;br /&gt;\n &lt;a href=\"##reservation.url##\"&gt; ##reservation.url##&lt;/a&gt;&lt;br /&gt;\n ##ENDFOREACHreservations##&lt;/p&gt;'),(4,4,'','##ticket.action## ##ticket.title##',' ##IFticket.storestatus=5##\n ##lang.ticket.url## : ##ticket.urlapprove##\n ##lang.ticket.autoclosewarning##\n ##lang.ticket.solvedate## : ##ticket.solvedate##\n ##lang.ticket.solution.type## : ##ticket.solution.type##\n ##lang.ticket.solution.description## : ##ticket.solution.description## ##ENDIFticket.storestatus##\n ##ELSEticket.storestatus## ##lang.ticket.url## : ##ticket.url## ##ENDELSEticket.storestatus##\n\n ##lang.ticket.description##\n\n ##lang.ticket.title## : ##ticket.title##\n ##lang.ticket.authors## : ##IFticket.authors## ##ticket.authors## ##ENDIFticket.authors## ##ELSEticket.authors##--##ENDELSEticket.authors##\n ##lang.ticket.creationdate## : ##ticket.creationdate##\n ##lang.ticket.closedate## : ##ticket.closedate##\n ##lang.ticket.requesttype## : ##ticket.requesttype##\n##lang.ticket.item.name## :\n\n##FOREACHitems##\n\n ##IFticket.itemtype##\n  ##ticket.itemtype## - ##ticket.item.name##\n  ##IFticket.item.model## ##lang.ticket.item.model## : ##ticket.item.model## ##ENDIFticket.item.model##\n  ##IFticket.item.serial## ##lang.ticket.item.serial## : ##ticket.item.serial## ##ENDIFticket.item.serial##\n  ##IFticket.item.otherserial## ##lang.ticket.item.otherserial## : ##ticket.item.otherserial## ##ENDIFticket.item.otherserial##\n ##ENDIFticket.itemtype##\n\n##ENDFOREACHitems##\n##IFticket.assigntousers## ##lang.ticket.assigntousers## : ##ticket.assigntousers## ##ENDIFticket.assigntousers##\n ##lang.ticket.status## : ##ticket.status##\n##IFticket.assigntogroups## ##lang.ticket.assigntogroups## : ##ticket.assigntogroups## ##ENDIFticket.assigntogroups##\n ##lang.ticket.urgency## : ##ticket.urgency##\n ##lang.ticket.impact## : ##ticket.impact##\n ##lang.ticket.priority## : ##ticket.priority##\n##IFticket.user.email## ##lang.ticket.user.email## : ##ticket.user.email ##ENDIFticket.user.email##\n##IFticket.category## ##lang.ticket.category## : ##ticket.category## ##ENDIFticket.category## ##ELSEticket.category## ##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##\n ##lang.ticket.content## : ##ticket.content##\n ##IFticket.storestatus=6##\n\n ##lang.ticket.solvedate## : ##ticket.solvedate##\n ##lang.ticket.solution.type## : ##ticket.solution.type##\n ##lang.ticket.solution.description## : ##ticket.solution.description##\n ##ENDIFticket.storestatus##\n ##lang.ticket.numberoffollowups## : ##ticket.numberoffollowups##\n\n##FOREACHfollowups##\n\n [##followup.date##] ##lang.followup.isprivate## : ##followup.isprivate##\n ##lang.followup.author## ##followup.author##\n ##lang.followup.description## ##followup.description##\n ##lang.followup.date## ##followup.date##\n ##lang.followup.requesttype## ##followup.requesttype##\n\n##ENDFOREACHfollowups##\n ##lang.ticket.numberoftasks## : ##ticket.numberoftasks##\n\n##FOREACHtasks##\n\n [##task.date##] ##lang.task.isprivate## : ##task.isprivate##\n ##lang.task.author## ##task.author##\n ##lang.task.description## ##task.description##\n ##lang.task.time## ##task.time##\n ##lang.task.category## ##task.category##\n\n##ENDFOREACHtasks##','<!-- description{ color: inherit; background: #ebebeb; border-style: solid;border-color: #8d8d8d; border-width: 0px 1px 1px 0px; }    -->\n<div>##IFticket.storestatus=5##</div>\n<div>##lang.ticket.url## : <a href=\"##ticket.urlapprove##\">##ticket.urlapprove##</a> <strong>&#160;</strong></div>\n<div><strong>##lang.ticket.autoclosewarning##</strong></div>\n<div><span style=\"color: #888888;\"><strong><span style=\"text-decoration: underline;\">##lang.ticket.solvedate##</span></strong></span> : ##ticket.solvedate##<br /><span style=\"text-decoration: underline; color: #888888;\"><strong>##lang.ticket.solution.type##</strong></span> : ##ticket.solution.type##<br /><span style=\"text-decoration: underline; color: #888888;\"><strong>##lang.ticket.solution.description##</strong></span> : ##ticket.solution.description## ##ENDIFticket.storestatus##</div>\n<div>##ELSEticket.storestatus## ##lang.ticket.url## : <a href=\"##ticket.url##\">##ticket.url##</a> ##ENDELSEticket.storestatus##</div>\n<p class=\"description b\"><strong>##lang.ticket.description##</strong></p>\n<p><span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.title##</span>&#160;:##ticket.title## <br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.authors##</span>&#160;:##IFticket.authors## ##ticket.authors## ##ENDIFticket.authors##    ##ELSEticket.authors##--##ENDELSEticket.authors## <br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.creationdate##</span>&#160;:##ticket.creationdate## <br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.closedate##</span>&#160;:##ticket.closedate## <br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.requesttype##</span>&#160;:##ticket.requesttype##<br />\n<br /><span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.item.name##</span>&#160;:\n<p>##FOREACHitems##</p>\n<div class=\"description b\">##IFticket.itemtype## ##ticket.itemtype##&#160;- ##ticket.item.name## ##IFticket.item.model## ##lang.ticket.item.model## : ##ticket.item.model## ##ENDIFticket.item.model## ##IFticket.item.serial## ##lang.ticket.item.serial## : ##ticket.item.serial## ##ENDIFticket.item.serial## ##IFticket.item.otherserial## ##lang.ticket.item.otherserial## : ##ticket.item.otherserial## ##ENDIFticket.item.otherserial## ##ENDIFticket.itemtype## </div><br />\n<p>##ENDFOREACHitems##</p>\n##IFticket.assigntousers## <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.assigntousers##</span>&#160;: ##ticket.assigntousers## ##ENDIFticket.assigntousers##<br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\">##lang.ticket.status## </span>&#160;: ##ticket.status##<br /> ##IFticket.assigntogroups## <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.assigntogroups##</span>&#160;: ##ticket.assigntogroups## ##ENDIFticket.assigntogroups##<br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.urgency##</span>&#160;: ##ticket.urgency##<br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.impact##</span>&#160;: ##ticket.impact##<br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.priority##</span>&#160;: ##ticket.priority## <br /> ##IFticket.user.email##<span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.user.email##</span>&#160;: ##ticket.user.email ##ENDIFticket.user.email##    <br /> ##IFticket.category##<span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\">##lang.ticket.category## </span>&#160;:##ticket.category## ##ENDIFticket.category## ##ELSEticket.category## ##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##    <br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.ticket.content##</span>&#160;: ##ticket.content##</p>\n<br />##IFticket.storestatus=6##<br /><span style=\"text-decoration: underline;\"><strong><span style=\"color: #888888;\">##lang.ticket.solvedate##</span></strong></span> : ##ticket.solvedate##<br /><span style=\"color: #888888;\"><strong><span style=\"text-decoration: underline;\">##lang.ticket.solution.type##</span></strong></span> : ##ticket.solution.type##<br /><span style=\"text-decoration: underline; color: #888888;\"><strong>##lang.ticket.solution.description##</strong></span> : ##ticket.solution.description##<br />##ENDIFticket.storestatus##</p>\n<div class=\"description b\">##lang.ticket.numberoffollowups##&#160;: ##ticket.numberoffollowups##</div>\n<p>##FOREACHfollowups##</p>\n<div class=\"description b\"><br /> <strong> [##followup.date##] <em>##lang.followup.isprivate## : ##followup.isprivate## </em></strong><br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.followup.author## </span> ##followup.author##<br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.followup.description## </span> ##followup.description##<br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.followup.date## </span> ##followup.date##<br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.followup.requesttype## </span> ##followup.requesttype##</div>\n<p>##ENDFOREACHfollowups##</p>\n<div class=\"description b\">##lang.ticket.numberoftasks##&#160;: ##ticket.numberoftasks##</div>\n<p>##FOREACHtasks##</p>\n<div class=\"description b\"><br /> <strong> [##task.date##] <em>##lang.task.isprivate## : ##task.isprivate## </em></strong><br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.task.author##</span> ##task.author##<br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.task.description##</span> ##task.description##<br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.task.time##</span> ##task.time##<br /> <span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"> ##lang.task.category##</span> ##task.category##</div>\n<p>##ENDFOREACHtasks##</p>'),(5,12,'','##contract.action##  ##contract.entity##','##lang.contract.entity## : ##contract.entity##\n\n##FOREACHcontracts##\n##lang.contract.name## : ##contract.name##\n##lang.contract.number## : ##contract.number##\n##lang.contract.time## : ##contract.time##\n##IFcontract.type####lang.contract.type## : ##contract.type####ENDIFcontract.type##\n##contract.url##\n##ENDFOREACHcontracts##','&lt;p&gt;##lang.contract.entity## : ##contract.entity##&lt;br /&gt;\n&lt;br /&gt;##FOREACHcontracts##&lt;br /&gt;##lang.contract.name## :\n##contract.name##&lt;br /&gt;\n##lang.contract.number## : ##contract.number##&lt;br /&gt;\n##lang.contract.time## : ##contract.time##&lt;br /&gt;\n##IFcontract.type####lang.contract.type## : ##contract.type##\n##ENDIFcontract.type##&lt;br /&gt;\n&lt;a href=\"##contract.url##\"&gt;\n##contract.url##&lt;/a&gt;&lt;br /&gt;\n##ENDFOREACHcontracts##&lt;/p&gt;'),(6,5,'','##ticket.action## ##ticket.title##','##lang.ticket.url## : ##ticket.url##\n\n##lang.ticket.description##\n\n\n##lang.ticket.title##  :##ticket.title##\n\n##lang.ticket.authors##  :##IFticket.authors##\n##ticket.authors## ##ENDIFticket.authors##\n##ELSEticket.authors##--##ENDELSEticket.authors##\n\n##IFticket.category## ##lang.ticket.category##  :##ticket.category##\n##ENDIFticket.category## ##ELSEticket.category##\n##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##\n\n##lang.ticket.content##  : ##ticket.content##\n##IFticket.itemtype##\n##lang.ticket.item.name##  : ##ticket.itemtype## - ##ticket.item.name##\n##ENDIFticket.itemtype##','&lt;div&gt;##lang.ticket.url## : &lt;a href=\"##ticket.url##\"&gt;\n##ticket.url##&lt;/a&gt;&lt;/div&gt;\n&lt;div class=\"description b\"&gt;\n##lang.ticket.description##&lt;/div&gt;\n&lt;p&gt;&lt;span\nstyle=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n##lang.ticket.title##&lt;/span&gt;&#160;:##ticket.title##\n&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n##lang.ticket.authors##&lt;/span&gt;\n##IFticket.authors## ##ticket.authors##\n##ENDIFticket.authors##\n##ELSEticket.authors##--##ENDELSEticket.authors##\n&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;&#160\n;&lt;/span&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; &lt;/span&gt;\n##IFticket.category##&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n##lang.ticket.category## &lt;/span&gt;&#160;:##ticket.category##\n##ENDIFticket.category## ##ELSEticket.category##\n##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##\n&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n##lang.ticket.content##&lt;/span&gt;&#160;:\n##ticket.content##&lt;br /&gt;##IFticket.itemtype##\n&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n##lang.ticket.item.name##&lt;/span&gt;&#160;:\n##ticket.itemtype## - ##ticket.item.name##\n##ENDIFticket.itemtype##&lt;/p&gt;'),(7,7,'','##ticket.action## ##ticket.title##','##FOREACHvalidations##\n\n##IFvalidation.storestatus=2##\n##validation.submission.title##\n##lang.validation.commentsubmission## : ##validation.commentsubmission##\n##ENDIFvalidation.storestatus##\n##ELSEvalidation.storestatus## ##validation.answer.title## ##ENDELSEvalidation.storestatus##\n\n##lang.ticket.url## : ##ticket.urlvalidation##\n\n##IFvalidation.status## ##lang.validation.status## : ##validation.status## ##ENDIFvalidation.status##\n##IFvalidation.commentvalidation##\n##lang.validation.commentvalidation## : ##validation.commentvalidation##\n##ENDIFvalidation.commentvalidation##\n##ENDFOREACHvalidations##','&lt;div&gt;##FOREACHvalidations##&lt;/div&gt;\n&lt;p&gt;##IFvalidation.storestatus=2##&lt;/p&gt;\n&lt;div&gt;##validation.submission.title##&lt;/div&gt;\n&lt;div&gt;##lang.validation.commentsubmission## : ##validation.commentsubmission##&lt;/div&gt;\n&lt;div&gt;##ENDIFvalidation.storestatus##&lt;/div&gt;\n&lt;div&gt;##ELSEvalidation.storestatus## ##validation.answer.title## ##ENDELSEvalidation.storestatus##&lt;/div&gt;\n&lt;div&gt;&lt;/div&gt;\n&lt;div&gt;\n&lt;div&gt;##lang.ticket.url## : &lt;a href=\"##ticket.urlvalidation##\"&gt; ##ticket.urlvalidation## &lt;/a&gt;&lt;/div&gt;\n&lt;/div&gt;\n&lt;p&gt;##IFvalidation.status## ##lang.validation.status## : ##validation.status## ##ENDIFvalidation.status##\n&lt;br /&gt; ##IFvalidation.commentvalidation##&lt;br /&gt; ##lang.validation.commentvalidation## :\n&#160; ##validation.commentvalidation##&lt;br /&gt; ##ENDIFvalidation.commentvalidation##\n&lt;br /&gt;##ENDFOREACHvalidations##&lt;/p&gt;'),(8,6,'','##ticket.action## ##ticket.entity##','##lang.ticket.entity## : ##ticket.entity##\n\n##FOREACHtickets##\n\n##lang.ticket.title## : ##ticket.title##\n ##lang.ticket.status## : ##ticket.status##\n\n ##ticket.url##\n ##ENDFOREACHtickets##','&lt;table class=\"tab_cadre\" border=\"1\" cellspacing=\"2\" cellpadding=\"3\"&gt;\n&lt;tbody&gt;\n&lt;tr&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.authors##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.title##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.priority##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.status##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.attribution##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.creationdate##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.content##&lt;/span&gt;&lt;/td&gt;\n&lt;/tr&gt;\n##FOREACHtickets##\n&lt;tr&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.authors##&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;&lt;a href=\"##ticket.url##\"&gt;##ticket.title##&lt;/a&gt;&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.priority##&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.status##&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##IFticket.assigntousers####ticket.assigntousers##&lt;br /&gt;##ENDIFticket.assigntousers####IFticket.assigntogroups##&lt;br /&gt;##ticket.assigntogroups## ##ENDIFticket.assigntogroups####IFticket.assigntosupplier##&lt;br /&gt;##ticket.assigntosupplier## ##ENDIFticket.assigntosupplier##&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.creationdate##&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.content##&lt;/span&gt;&lt;/td&gt;\n&lt;/tr&gt;\n##ENDFOREACHtickets##\n&lt;/tbody&gt;\n&lt;/table&gt;'),(9,9,'','##consumable.action##  ##consumable.entity##','##lang.consumable.entity## : ##consumable.entity##\n\n\n##FOREACHconsumables##\n##lang.consumable.item## : ##consumable.item##\n\n\n##lang.consumable.reference## : ##consumable.reference##\n\n##lang.consumable.remaining## : ##consumable.remaining##\n\n##consumable.url##\n\n##ENDFOREACHconsumables##','&lt;p&gt;\n##lang.consumable.entity## : ##consumable.entity##\n&lt;br /&gt; &lt;br /&gt;##FOREACHconsumables##\n&lt;br /&gt;##lang.consumable.item## : ##consumable.item##&lt;br /&gt;\n&lt;br /&gt;##lang.consumable.reference## : ##consumable.reference##&lt;br /&gt;\n##lang.consumable.remaining## : ##consumable.remaining##&lt;br /&gt;\n&lt;a href=\"##consumable.url##\"&gt; ##consumable.url##&lt;/a&gt;&lt;br /&gt;\n   ##ENDFOREACHconsumables##&lt;/p&gt;'),(10,8,'','##cartridge.action##  ##cartridge.entity##','##lang.cartridge.entity## : ##cartridge.entity##\n\n\n##FOREACHcartridges##\n##lang.cartridge.item## : ##cartridge.item##\n\n\n##lang.cartridge.reference## : ##cartridge.reference##\n\n##lang.cartridge.remaining## : ##cartridge.remaining##\n\n##cartridge.url##\n ##ENDFOREACHcartridges##','&lt;p&gt;##lang.cartridge.entity## : ##cartridge.entity##\n&lt;br /&gt; &lt;br /&gt;##FOREACHcartridges##\n&lt;br /&gt;##lang.cartridge.item## :\n##cartridge.item##&lt;br /&gt; &lt;br /&gt;\n##lang.cartridge.reference## :\n##cartridge.reference##&lt;br /&gt;\n##lang.cartridge.remaining## :\n##cartridge.remaining##&lt;br /&gt;\n&lt;a href=\"##cartridge.url##\"&gt;\n##cartridge.url##&lt;/a&gt;&lt;br /&gt;\n##ENDFOREACHcartridges##&lt;/p&gt;'),(11,10,'','##infocom.action##  ##infocom.entity##','##lang.infocom.entity## : ##infocom.entity##\n\n\n##FOREACHinfocoms##\n\n##lang.infocom.itemtype## : ##infocom.itemtype##\n\n##lang.infocom.item## : ##infocom.item##\n\n\n##lang.infocom.expirationdate## : ##infocom.expirationdate##\n\n##infocom.url##\n ##ENDFOREACHinfocoms##','&lt;p&gt;##lang.infocom.entity## : ##infocom.entity##\n&lt;br /&gt; &lt;br /&gt;##FOREACHinfocoms##\n&lt;br /&gt;##lang.infocom.itemtype## : ##infocom.itemtype##&lt;br /&gt;\n##lang.infocom.item## : ##infocom.item##&lt;br /&gt; &lt;br /&gt;\n##lang.infocom.expirationdate## : ##infocom.expirationdate##\n&lt;br /&gt; &lt;a href=\"##infocom.url##\"&gt;\n##infocom.url##&lt;/a&gt;&lt;br /&gt;\n##ENDFOREACHinfocoms##&lt;/p&gt;'),(12,11,'','##license.action##  ##license.entity##','##lang.license.entity## : ##license.entity##\n\n##FOREACHlicenses##\n\n##lang.license.item## : ##license.item##\n\n##lang.license.serial## : ##license.serial##\n\n##lang.license.expirationdate## : ##license.expirationdate##\n\n##license.url##\n ##ENDFOREACHlicenses##','&lt;p&gt;\n##lang.license.entity## : ##license.entity##&lt;br /&gt;\n##FOREACHlicenses##\n&lt;br /&gt;##lang.license.item## : ##license.item##&lt;br /&gt;\n##lang.license.serial## : ##license.serial##&lt;br /&gt;\n##lang.license.expirationdate## : ##license.expirationdate##\n&lt;br /&gt; &lt;a href=\"##license.url##\"&gt; ##license.url##\n&lt;/a&gt;&lt;br /&gt; ##ENDFOREACHlicenses##&lt;/p&gt;'),(13,13,'','##user.action##','##user.realname## ##user.firstname##\n\n##lang.passwordforget.information##\n\n##lang.passwordforget.link## ##user.passwordforgeturl##','&lt;p&gt;&lt;strong&gt;##user.realname## ##user.firstname##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;##lang.passwordforget.information##&lt;/p&gt;\n&lt;p&gt;##lang.passwordforget.link## &lt;a title=\"##user.passwordforgeturl##\" href=\"##user.passwordforgeturl##\"&gt;##user.passwordforgeturl##&lt;/a&gt;&lt;/p&gt;'),(14,14,'','##ticket.action## ##ticket.title##','##lang.ticket.title## : ##ticket.title##\n\n##lang.ticket.closedate## : ##ticket.closedate##\n\n##lang.satisfaction.text## ##ticket.urlsatisfaction##','&lt;p&gt;##lang.ticket.title## : ##ticket.title##&lt;/p&gt;\n&lt;p&gt;##lang.ticket.closedate## : ##ticket.closedate##&lt;/p&gt;\n&lt;p&gt;##lang.satisfaction.text## &lt;a href=\"##ticket.urlsatisfaction##\"&gt;##ticket.urlsatisfaction##&lt;/a&gt;&lt;/p&gt;'),(15,15,'','##lang.unicity.action##','##lang.unicity.entity## : ##unicity.entity##\n\n##lang.unicity.itemtype## : ##unicity.itemtype##\n\n##lang.unicity.message## : ##unicity.message##\n\n##lang.unicity.action_user## : ##unicity.action_user##\n\n##lang.unicity.action_type## : ##unicity.action_type##\n\n##lang.unicity.date## : ##unicity.date##','&lt;p&gt;##lang.unicity.entity## : ##unicity.entity##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.itemtype## : ##unicity.itemtype##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.message## : ##unicity.message##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.action_user## : ##unicity.action_user##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.action_type## : ##unicity.action_type##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.date## : ##unicity.date##&lt;/p&gt;'),(16,16,'','##crontask.action##','##lang.crontask.warning##\n\n##FOREACHcrontasks##\n ##crontask.name## : ##crontask.description##\n\n##ENDFOREACHcrontasks##','&lt;p&gt;##lang.crontask.warning##&lt;/p&gt;\n&lt;p&gt;##FOREACHcrontasks## &lt;br /&gt;&lt;a href=\"##crontask.url##\"&gt;##crontask.name##&lt;/a&gt; : ##crontask.description##&lt;br /&gt; &lt;br /&gt;##ENDFOREACHcrontasks##&lt;/p&gt;'),(17,17,'','##problem.action## ##problem.title##','##IFproblem.storestatus=5##\n ##lang.problem.url## : ##problem.urlapprove##\n ##lang.problem.solvedate## : ##problem.solvedate##\n ##lang.problem.solution.type## : ##problem.solution.type##\n ##lang.problem.solution.description## : ##problem.solution.description## ##ENDIFproblem.storestatus##\n ##ELSEproblem.storestatus## ##lang.problem.url## : ##problem.url## ##ENDELSEproblem.storestatus##\n\n ##lang.problem.description##\n\n ##lang.problem.title##  :##problem.title##\n ##lang.problem.authors##  :##IFproblem.authors## ##problem.authors## ##ENDIFproblem.authors## ##ELSEproblem.authors##--##ENDELSEproblem.authors##\n ##lang.problem.creationdate##  :##problem.creationdate##\n ##IFproblem.assigntousers## ##lang.problem.assigntousers##  : ##problem.assigntousers## ##ENDIFproblem.assigntousers##\n ##lang.problem.status##  : ##problem.status##\n ##IFproblem.assigntogroups## ##lang.problem.assigntogroups##  : ##problem.assigntogroups## ##ENDIFproblem.assigntogroups##\n ##lang.problem.urgency##  : ##problem.urgency##\n ##lang.problem.impact##  : ##problem.impact##\n ##lang.problem.priority## : ##problem.priority##\n##IFproblem.category## ##lang.problem.category##  :##problem.category## ##ENDIFproblem.category## ##ELSEproblem.category## ##lang.problem.nocategoryassigned## ##ENDELSEproblem.category##\n ##lang.problem.content##  : ##problem.content##\n\n##IFproblem.storestatus=6##\n ##lang.problem.solvedate## : ##problem.solvedate##\n ##lang.problem.solution.type## : ##problem.solution.type##\n ##lang.problem.solution.description## : ##problem.solution.description##\n##ENDIFproblem.storestatus##\n ##lang.problem.numberoftickets## : ##problem.numberoftickets##\n\n##FOREACHtickets##\n [##ticket.date##] ##lang.problem.title## : ##ticket.title##\n ##lang.problem.content## ##ticket.content##\n\n##ENDFOREACHtickets##\n ##lang.problem.numberoftasks## : ##problem.numberoftasks##\n\n##FOREACHtasks##\n [##task.date##]\n ##lang.task.author## ##task.author##\n ##lang.task.description## ##task.description##\n ##lang.task.time## ##task.time##\n ##lang.task.category## ##task.category##\n\n##ENDFOREACHtasks##\n','&lt;p&gt;##IFproblem.storestatus=5##&lt;/p&gt;\n&lt;div&gt;##lang.problem.url## : &lt;a href=\"##problem.urlapprove##\"&gt;##problem.urlapprove##&lt;/a&gt;&lt;/div&gt;\n&lt;div&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.problem.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##problem.solvedate##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.problem.solution.type##&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.problem.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.description## ##ENDIFproblem.storestatus##&lt;/div&gt;\n&lt;div&gt;##ELSEproblem.storestatus## ##lang.problem.url## : &lt;a href=\"##problem.url##\"&gt;##problem.url##&lt;/a&gt; ##ENDELSEproblem.storestatus##&lt;/div&gt;\n&lt;p class=\"description b\"&gt;&lt;strong&gt;##lang.problem.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.title##&lt;/span&gt;&#160;:##problem.title## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.authors##&lt;/span&gt;&#160;:##IFproblem.authors## ##problem.authors## ##ENDIFproblem.authors##    ##ELSEproblem.authors##--##ENDELSEproblem.authors## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.creationdate##&lt;/span&gt;&#160;:##problem.creationdate## &lt;br /&gt; ##IFproblem.assigntousers## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.assigntousers##&lt;/span&gt;&#160;: ##problem.assigntousers## ##ENDIFproblem.assigntousers##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.problem.status## &lt;/span&gt;&#160;: ##problem.status##&lt;br /&gt; ##IFproblem.assigntogroups## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.assigntogroups##&lt;/span&gt;&#160;: ##problem.assigntogroups## ##ENDIFproblem.assigntogroups##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.urgency##&lt;/span&gt;&#160;: ##problem.urgency##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.impact##&lt;/span&gt;&#160;: ##problem.impact##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.priority##&lt;/span&gt; : ##problem.priority## &lt;br /&gt;##IFproblem.category##&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.problem.category## &lt;/span&gt;&#160;:##problem.category##  ##ENDIFproblem.category## ##ELSEproblem.category##  ##lang.problem.nocategoryassigned## ##ENDELSEproblem.category##    &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.content##&lt;/span&gt;&#160;: ##problem.content##&lt;/p&gt;\n&lt;p&gt;##IFproblem.storestatus=6##&lt;br /&gt;&lt;span style=\"text-decoration: underline;\"&gt;&lt;strong&gt;&lt;span style=\"color: #888888;\"&gt;##lang.problem.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##problem.solvedate##&lt;br /&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.problem.solution.type##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.problem.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.description##&lt;br /&gt;##ENDIFproblem.storestatus##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.problem.numberoftickets##&#160;: ##problem.numberoftickets##&lt;/div&gt;\n&lt;p&gt;##FOREACHtickets##&lt;/p&gt;\n&lt;div&gt;&lt;strong&gt; [##ticket.date##] &lt;em&gt;##lang.problem.title## : &lt;a href=\"##ticket.url##\"&gt;##ticket.title## &lt;/a&gt;&lt;/em&gt;&lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; &lt;/span&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.problem.content## &lt;/span&gt; ##ticket.content##\n&lt;p&gt;##ENDFOREACHtickets##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.problem.numberoftasks##&#160;: ##problem.numberoftasks##&lt;/div&gt;\n&lt;p&gt;##FOREACHtasks##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;&lt;strong&gt;[##task.date##] &lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.author##&lt;/span&gt; ##task.author##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.description##&lt;/span&gt; ##task.description##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.time##&lt;/span&gt; ##task.time##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.category##&lt;/span&gt; ##task.category##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;\n&lt;/div&gt;'),(18,18,'','##recall.action##: ##recall.item.name##','##recall.action##: ##recall.item.name##\n\n##recall.item.content##\n\n##lang.recall.planning.begin##: ##recall.planning.begin##\n##lang.recall.planning.end##: ##recall.planning.end##\n##lang.recall.planning.state##: ##recall.planning.state##\n##lang.recall.item.private##: ##recall.item.private##','&lt;p&gt;##recall.action##: &lt;a href=\"##recall.item.url##\"&gt;##recall.item.name##&lt;/a&gt;&lt;/p&gt;\n&lt;p&gt;##recall.item.content##&lt;/p&gt;\n&lt;p&gt;##lang.recall.planning.begin##: ##recall.planning.begin##&lt;br /&gt;##lang.recall.planning.end##: ##recall.planning.end##&lt;br /&gt;##lang.recall.planning.state##: ##recall.planning.state##&lt;br /&gt;##lang.recall.item.private##: ##recall.item.private##&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;'),(19,19,'','##change.action## ##change.title##','##IFchange.storestatus=5##\n ##lang.change.url## : ##change.urlapprove##\n ##lang.change.solvedate## : ##change.solvedate##\n ##lang.change.solution.type## : ##change.solution.type##\n ##lang.change.solution.description## : ##change.solution.description## ##ENDIFchange.storestatus##\n ##ELSEchange.storestatus## ##lang.change.url## : ##change.url## ##ENDELSEchange.storestatus##\n\n ##lang.change.description##\n\n ##lang.change.title##  :##change.title##\n ##lang.change.authors##  :##IFchange.authors## ##change.authors## ##ENDIFchange.authors## ##ELSEchange.authors##--##ENDELSEchange.authors##\n ##lang.change.creationdate##  :##change.creationdate##\n ##IFchange.assigntousers## ##lang.change.assigntousers##  : ##change.assigntousers## ##ENDIFchange.assigntousers##\n ##lang.change.status##  : ##change.status##\n ##IFchange.assigntogroups## ##lang.change.assigntogroups##  : ##change.assigntogroups## ##ENDIFchange.assigntogroups##\n ##lang.change.urgency##  : ##change.urgency##\n ##lang.change.impact##  : ##change.impact##\n ##lang.change.priority## : ##change.priority##\n##IFchange.category## ##lang.change.category##  :##change.category## ##ENDIFchange.category## ##ELSEchange.category## ##lang.change.nocategoryassigned## ##ENDELSEchange.category##\n ##lang.change.content##  : ##change.content##\n\n##IFchange.storestatus=6##\n ##lang.change.solvedate## : ##change.solvedate##\n ##lang.change.solution.type## : ##change.solution.type##\n ##lang.change.solution.description## : ##change.solution.description##\n##ENDIFchange.storestatus##\n ##lang.change.numberofproblems## : ##change.numberofproblems##\n\n##FOREACHproblems##\n [##problem.date##] ##lang.change.title## : ##problem.title##\n ##lang.change.content## ##problem.content##\n\n##ENDFOREACHproblems##\n ##lang.change.numberoftasks## : ##change.numberoftasks##\n\n##FOREACHtasks##\n [##task.date##]\n ##lang.task.author## ##task.author##\n ##lang.task.description## ##task.description##\n ##lang.task.time## ##task.time##\n ##lang.task.category## ##task.category##\n\n##ENDFOREACHtasks##\n','&lt;p&gt;##IFchange.storestatus=5##&lt;/p&gt;\n&lt;div&gt;##lang.change.url## : &lt;a href=\"##change.urlapprove##\"&gt;##change.urlapprove##&lt;/a&gt;&lt;/div&gt;\n&lt;div&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.change.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##change.solvedate##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.change.solution.type##&lt;/strong&gt;&lt;/span&gt; : ##change.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.change.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##change.solution.description## ##ENDIFchange.storestatus##&lt;/div&gt;\n&lt;div&gt;##ELSEchange.storestatus## ##lang.change.url## : &lt;a href=\"##change.url##\"&gt;##change.url##&lt;/a&gt; ##ENDELSEchange.storestatus##&lt;/div&gt;\n&lt;p class=\"description b\"&gt;&lt;strong&gt;##lang.change.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.title##&lt;/span&gt;&#160;:##change.title## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.authors##&lt;/span&gt;&#160;:##IFchange.authors## ##change.authors## ##ENDIFchange.authors##    ##ELSEchange.authors##--##ENDELSEchange.authors## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.creationdate##&lt;/span&gt;&#160;:##change.creationdate## &lt;br /&gt; ##IFchange.assigntousers## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.assigntousers##&lt;/span&gt;&#160;: ##change.assigntousers## ##ENDIFchange.assigntousers##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.change.status## &lt;/span&gt;&#160;: ##change.status##&lt;br /&gt; ##IFchange.assigntogroups## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.assigntogroups##&lt;/span&gt;&#160;: ##change.assigntogroups## ##ENDIFchange.assigntogroups##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.urgency##&lt;/span&gt;&#160;: ##change.urgency##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.impact##&lt;/span&gt;&#160;: ##change.impact##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.priority##&lt;/span&gt; : ##change.priority## &lt;br /&gt;##IFchange.category##&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.change.category## &lt;/span&gt;&#160;:##change.category##  ##ENDIFchange.category## ##ELSEchange.category##  ##lang.change.nocategoryassigned## ##ENDELSEchange.category##    &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.content##&lt;/span&gt;&#160;: ##change.content##&lt;/p&gt;\n&lt;p&gt;##IFchange.storestatus=6##&lt;br /&gt;&lt;span style=\"text-decoration: underline;\"&gt;&lt;strong&gt;&lt;span style=\"color: #888888;\"&gt;##lang.change.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##change.solvedate##&lt;br /&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.change.solution.type##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##change.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.change.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##change.solution.description##&lt;br /&gt;##ENDIFchange.storestatus##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.change.numberofproblems##&#160;: ##change.numberofproblems##&lt;/div&gt;\n&lt;p&gt;##FOREACHproblems##&lt;/p&gt;\n&lt;div&gt;&lt;strong&gt; [##problem.date##] &lt;em&gt;##lang.change.title## : &lt;a href=\"##problem.url##\"&gt;##problem.title## &lt;/a&gt;&lt;/em&gt;&lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; &lt;/span&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.change.content## &lt;/span&gt; ##problem.content##\n&lt;p&gt;##ENDFOREACHproblems##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.change.numberoftasks##&#160;: ##change.numberoftasks##&lt;/div&gt;\n&lt;p&gt;##FOREACHtasks##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;&lt;strong&gt;[##task.date##] &lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.author##&lt;/span&gt; ##task.author##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.description##&lt;/span&gt; ##task.description##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.time##&lt;/span&gt; ##task.time##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.category##&lt;/span&gt; ##task.category##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;\n&lt;/div&gt;'),(20,20,'','##mailcollector.action##','##FOREACHmailcollectors##\n##lang.mailcollector.name## : ##mailcollector.name##\n##lang.mailcollector.errors## : ##mailcollector.errors##\n##mailcollector.url##\n##ENDFOREACHmailcollectors##','&lt;p&gt;##FOREACHmailcollectors##&lt;br /&gt;##lang.mailcollector.name## : ##mailcollector.name##&lt;br /&gt; ##lang.mailcollector.errors## : ##mailcollector.errors##&lt;br /&gt;&lt;a href=\"##mailcollector.url##\"&gt;##mailcollector.url##&lt;/a&gt;&lt;br /&gt; ##ENDFOREACHmailcollectors##&lt;/p&gt;\n&lt;p&gt;&lt;/p&gt;'),(21,21,'','##project.action## ##project.name## ##project.code##','##lang.project.url## : ##project.url##\n\n##lang.project.description##\n\n##lang.project.name## : ##project.name##\n##lang.project.code## : ##project.code##\n##lang.project.manager## : ##project.manager##\n##lang.project.managergroup## : ##project.managergroup##\n##lang.project.creationdate## : ##project.creationdate##\n##lang.project.priority## : ##project.priority##\n##lang.project.state## : ##project.state##\n##lang.project.type## : ##project.type##\n##lang.project.description## : ##project.description##\n\n##lang.project.numberoftasks## : ##project.numberoftasks##\n\n\n\n##FOREACHtasks##\n\n[##task.creationdate##]\n##lang.task.name## : ##task.name##\n##lang.task.state## : ##task.state##\n##lang.task.type## : ##task.type##\n##lang.task.percent## : ##task.percent##\n##lang.task.description## : ##task.description##\n\n##ENDFOREACHtasks##','&lt;p&gt;##lang.project.url## : &lt;a href=\"##project.url##\"&gt;##project.url##&lt;/a&gt;&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;##lang.project.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;##lang.project.name## : ##project.name##&lt;br /&gt;##lang.project.code## : ##project.code##&lt;br /&gt; ##lang.project.manager## : ##project.manager##&lt;br /&gt;##lang.project.managergroup## : ##project.managergroup##&lt;br /&gt; ##lang.project.creationdate## : ##project.creationdate##&lt;br /&gt;##lang.project.priority## : ##project.priority## &lt;br /&gt;##lang.project.state## : ##project.state##&lt;br /&gt;##lang.project.type## : ##project.type##&lt;br /&gt;##lang.project.description## : ##project.description##&lt;/p&gt;\n&lt;p&gt;##lang.project.numberoftasks## : ##project.numberoftasks##&lt;/p&gt;\n&lt;div&gt;\n&lt;p&gt;##FOREACHtasks##&lt;/p&gt;\n&lt;div&gt;&lt;strong&gt;[##task.creationdate##] &lt;/strong&gt;&lt;br /&gt; ##lang.task.name## : ##task.name##&lt;br /&gt;##lang.task.state## : ##task.state##&lt;br /&gt;##lang.task.type## : ##task.type##&lt;br /&gt;##lang.task.percent## : ##task.percent##&lt;br /&gt;##lang.task.description## : ##task.description##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;\n&lt;/div&gt;'),(22,22,'','##projecttask.action## ##projecttask.name##','##lang.projecttask.url## : ##projecttask.url##\n\n##lang.projecttask.description##\n\n##lang.projecttask.name## : ##projecttask.name##\n##lang.projecttask.project## : ##projecttask.project##\n##lang.projecttask.creationdate## : ##projecttask.creationdate##\n##lang.projecttask.state## : ##projecttask.state##\n##lang.projecttask.type## : ##projecttask.type##\n##lang.projecttask.description## : ##projecttask.description##\n\n##lang.projecttask.numberoftasks## : ##projecttask.numberoftasks##\n\n\n\n##FOREACHtasks##\n\n[##task.creationdate##]\n##lang.task.name## : ##task.name##\n##lang.task.state## : ##task.state##\n##lang.task.type## : ##task.type##\n##lang.task.percent## : ##task.percent##\n##lang.task.description## : ##task.description##\n\n##ENDFOREACHtasks##','&lt;p&gt;##lang.projecttask.url## : &lt;a href=\"##projecttask.url##\"&gt;##projecttask.url##&lt;/a&gt;&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;##lang.projecttask.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;##lang.projecttask.name## : ##projecttask.name##&lt;br /&gt;##lang.projecttask.project## : &lt;a href=\"##projecttask.projecturl##\"&gt;##projecttask.project##&lt;/a&gt;&lt;br /&gt;##lang.projecttask.creationdate## : ##projecttask.creationdate##&lt;br /&gt;##lang.projecttask.state## : ##projecttask.state##&lt;br /&gt;##lang.projecttask.type## : ##projecttask.type##&lt;br /&gt;##lang.projecttask.description## : ##projecttask.description##&lt;/p&gt;\n&lt;p&gt;##lang.projecttask.numberoftasks## : ##projecttask.numberoftasks##&lt;/p&gt;\n&lt;div&gt;\n&lt;p&gt;##FOREACHtasks##&lt;/p&gt;\n&lt;div&gt;&lt;strong&gt;[##task.creationdate##] &lt;/strong&gt;&lt;br /&gt;##lang.task.name## : ##task.name##&lt;br /&gt;##lang.task.state## : ##task.state##&lt;br /&gt;##lang.task.type## : ##task.type##&lt;br /&gt;##lang.task.percent## : ##task.percent##&lt;br /&gt;##lang.task.description## : ##task.description##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;\n&lt;/div&gt;'),(23,23,'','##objectlock.action##','##objectlock.type## ###objectlock.id## - ##objectlock.name##\n\n      ##lang.objectlock.url##\n      ##objectlock.url##\n\n      ##lang.objectlock.date_mod##\n      ##objectlock.date_mod##\n\n      Hello ##objectlock.lockedby.firstname##,\n      Could go to this item and unlock it for me?\n      Thank you,\n      Regards,\n      ##objectlock.requester.firstname##','&lt;table&gt;\n      &lt;tbody&gt;\n      &lt;tr&gt;&lt;th colspan=\"2\"&gt;&lt;a href=\"##objectlock.url##\"&gt;##objectlock.type## ###objectlock.id## - ##objectlock.name##&lt;/a&gt;&lt;/th&gt;&lt;/tr&gt;\n      &lt;tr&gt;\n      &lt;td&gt;##lang.objectlock.url##&lt;/td&gt;\n      &lt;td&gt;##objectlock.url##&lt;/td&gt;\n      &lt;/tr&gt;\n      &lt;tr&gt;\n      &lt;td&gt;##lang.objectlock.date_mod##&lt;/td&gt;\n      &lt;td&gt;##objectlock.date_mod##&lt;/td&gt;\n      &lt;/tr&gt;\n      &lt;/tbody&gt;\n      &lt;/table&gt;\n      &lt;p&gt;&lt;span style=\"font-size: small;\"&gt;Hello ##objectlock.lockedby.firstname##,&lt;br /&gt;Could go to this item and unlock it for me?&lt;br /&gt;Thank you,&lt;br /&gt;Regards,&lt;br /&gt;##objectlock.requester.firstname## ##objectlock.requester.lastname##&lt;/span&gt;&lt;/p&gt;'),(24,24,'','##savedsearch.action## ##savedsearch.name##','##savedsearch.type## ###savedsearch.id## - ##savedsearch.name##\n\n      ##savedsearch.message##\n\n      ##lang.savedsearch.url##\n      ##savedsearch.url##\n\n      Regards,','&lt;table&gt;\n      &lt;tbody&gt;\n      &lt;tr&gt;&lt;th colspan=\"2\"&gt;&lt;a href=\"##savedsearch.url##\"&gt;##savedsearch.type## ###savedsearch.id## - ##savedsearch.name##&lt;/a&gt;&lt;/th&gt;&lt;/tr&gt;\n      &lt;tr&gt;&lt;td colspan=\"2\"&gt;&lt;a href=\"##savedsearch.url##\"&gt;##savedsearch.message##&lt;/a&gt;&lt;/td&gt;&lt;/tr&gt;\n      &lt;tr&gt;\n      &lt;td&gt;##lang.savedsearch.url##&lt;/td&gt;\n      &lt;td&gt;##savedsearch.url##&lt;/td&gt;\n      &lt;/tr&gt;\n      &lt;/tbody&gt;\n      &lt;/table&gt;\n      &lt;p&gt;&lt;span style=\"font-size: small;\"&gt;Hello &lt;br /&gt;Regards,&lt;/span&gt;&lt;/p&gt;'),(25,25,'','##certificate.action##  ##certificate.entity##','##lang.certificate.entity## : ##certificate.entity##\n\n##FOREACHcertificates##\n\n##lang.certificate.serial## : ##certificate.serial##\n\n##lang.certificate.expirationdate## : ##certificate.expirationdate##\n\n##certificate.url##\n ##ENDFOREACHcertificates##','&lt;p&gt;\n##lang.certificate.entity## : ##certificate.entity##&lt;br /&gt;\n##FOREACHcertificates##\n&lt;br /&gt;##lang.certificate.name## : ##certificate.name##&lt;br /&gt;\n##lang.certificate.serial## : ##certificate.serial##&lt;br /&gt;\n##lang.certificate.expirationdate## : ##certificate.expirationdate##\n&lt;br /&gt; &lt;a href=\"##certificate.url##\"&gt; ##certificate.url##\n&lt;/a&gt;&lt;br /&gt; ##ENDFOREACHcertificates##&lt;/p&gt;'),(31,31,'','Ваш запрос сохранен!','Здравствуйте,\\nВаш запрос формы GLPI был успешно сохранен под номером ##formcreator.request_id## и передана в команду службы поддержки.\\nВы можете увидеть Ваши ответы по следующей ссылке:\\n##formcreator.validation_link##','<p>Здравствуйте,<br />Ваш запрос формы GLPI был успешно сохранен под номером ##formcreator.request_id## и передана в команду службы поддержки.<br />Вы можете увидеть Ваши ответы по следующей ссылке:<br />##formcreator.validation_link##</p>'),(32,32,'','Форма из GLPI должна быть подтверждена','Здравствуйте,\\nФорму из GLPI нужно проверить, и в качестве согласующего выбраны Вы.\\nВы можете получить доступ к нему, нажав на эту ссылку:\\n##formcreator.validation_link##','<p>Здравствуйте,<br />Форму из GLPI нужно проверить, и в качестве согласующего выбраны Вы.<br />Вы можете получить доступ к нему, нажав на эту ссылку:<br />##formcreator.validation_link##</p>'),(33,33,'','Ваша форма была отклонена согласующим','Здравствуйте,\\nМы сожалеем сообщить Вам, что Ваша форма была отклонена согласующим по причине ниже:\\n##formcreator.validation_comment##\\n\\nВы можете все еще исправить и снова отправить кликнув по этой ссылке:\\n##formcreator.validation_link##','<p>Здравствуйте,<br />Мы сожалеем сообщить Вам, что Ваша форма была отклонена согласующим по причине ниже:<br />##formcreator.validation_comment##<br /><br />Вы можете все еще исправить и снова отправить кликнув по этой ссылке:<br />##formcreator.validation_link##</p>'),(34,34,'','Ваша форма была принята согласующим','Здравствуйте,\\nМы рады сообщить Вам, что Ваша форма была принята согласующим.\\nВаш запрос будет вскоре рассмотрен.','<p>Здравствуйте,<br />Мы рады сообщить Вам, что Ваша форма была принята согласующим.<br />Ваш запрос будет вскоре рассмотрен.</p>'),(35,35,'','Ваша заявка была удалена администратором','Здравствуйте,\\nМы сожалеем сообщить Вам, что Ваш запрос не может быть рассмотрена и была удалена администратором.','<p>Здравствуйте,<br />Мы сожалеем сообщить Вам, что Ваш запрос не может быть рассмотрена и была удалена администратором.</p>'),(36,36,'','##lang.ordervalidation.title##','##lang.ordervalidation.url## : ##ordervalidation.url##\n               ##lang.ordervalidation.entity## : ##ordervalidation.entity##\n               ##IFordervalidation.name####lang.ordervalidation.name## : ##ordervalidation.name##\n               ##ENDIFordervalidation.name##\n               ##IFordervalidation.numorder####lang.ordervalidation.numorder## : ##ordervalidation.numorder##\n               ##ENDIFordervalidation.numorder##\n               ##IFordervalidation.orderdate####lang.ordervalidation.orderdate##  : ##ordervalidation.orderdate####ENDIFordervalidation.orderdate##\n               ##IFordervalidation.state####lang.ordervalidation.state## : ##ordervalidation.state####ENDIFordervalidation.state##\n               ##IFordervalidation.users####lang.ordervalidation.users## : ##ordervalidation.users####ENDIFordervalidation.users##\n\n               ##IFordervalidation.comment####lang.ordervalidation.comment## : ##ordervalidation.comment####ENDIFordervalidation.comment##','&lt;p&gt;&lt;strong&gt;##lang.ordervalidation.url##&lt;/strong&gt; : &lt;a href=\"##ordervalidation.url##\"&gt;##ordervalidation.url##&lt;/a&gt;&lt;br /&gt;&lt;br /&gt;&lt;strong&gt;##lang.ordervalidation.entity##&lt;/strong&gt; : ##ordervalidation.entity##&lt;br /&gt; ##IFordervalidation.name##&lt;strong&gt;##lang.ordervalidation.name##&lt;/strong&gt; : ##ordervalidation.name####ENDIFordervalidation.name##&lt;br /&gt;##IFordervalidation.numorder##&lt;strong&gt;##lang.ordervalidation.numorder##&lt;/strong&gt; : ##ordervalidation.numorder####ENDIFordervalidation.numorder##&lt;br /&gt;##IFordervalidation.orderdate##&lt;strong&gt;##lang.ordervalidation.orderdate##&lt;/strong&gt; : ##ordervalidation.orderdate####ENDIFordervalidation.orderdate##&lt;br /&gt;##IFordervalidation.state##&lt;strong&gt;##lang.ordervalidation.state##&lt;/strong&gt; : ##ordervalidation.state####ENDIFordervalidation.state##&lt;br /&gt;##IFordervalidation.users##&lt;strong&gt;##lang.ordervalidation.users##&lt;/strong&gt; : ##ordervalidation.users####ENDIFordervalidation.users##&lt;br /&gt;&lt;br /&gt;##IFordervalidation.comment##&lt;strong&gt;##lang.ordervalidation.comment##&lt;/strong&gt; : ##ordervalidation.comment####ENDIFordervalidation.comment##&lt;/p&gt;'),(37,37,'','##order.action## ##order.entity##','##lang.order.entity## : ##order.entity##\n \n##FOREACHorders##\n##lang.order.item.name## : ##order.item.name##\n ##lang.order.item.numorder## : ##order.item.numorder##\n ##lang.order.item.orderdate## : ##order.item.orderdate##\n ##lang.order.item.duedate## : ##order.item.duedate##\n ##lang.order.item.deliverydate## : ##order.item.deliverydate##\n ##order.item.url## \n ##ENDFOREACHorders##','##lang.order.entity## : ##order.entity##&lt;br /&gt; &lt;br /&gt;##FOREACHorders##&lt;br /&gt;##lang.order.item.name## : ##order.item.name##&lt;br /&gt; ##lang.order.item.numorder## : ##order.item.numorder##&lt;br /&gt; ##lang.order.item.orderdate## : ##order.item.orderdate##&lt;br /&gt; &lt;a&gt;##lang.order.item.duedate## : ##order.item.duedate##&lt;br /&gt; &lt;/a&gt;&lt;a&gt;##lang.order.item.deliverydate## : ##order.item.deliverydate##&lt;br /&gt; &lt;/a&gt;&lt;a&gt;##order.item.url##&lt;/a&gt;&lt;br /&gt; ##ENDFOREACHorders##'),(38,38,'','##order.action## ##ordervalidation.name## ##ordervalidation.numorder##','##order.action##\n##lang.ordervalidation.name## :\n##ordervalidation.name##\n##lang.ordervalidation.orderdate## :\n##ordervalidation.orderdate##\n##lang.ordervalidation.entity## :\n##ordervalidation.entity##','&lt;p&gt;##order.action## &lt;br /&gt;&lt;br /&gt;&#160;\n                ##lang.ordervalidation.name## : &lt;br /&gt;&#160;\n                ##ordervalidation.name## &lt;br /&gt;&#160;\n                ##lang.ordervalidation.orderdate## : &lt;br /&gt;&#160;\n                ##ordervalidation.orderdate## &lt;br /&gt;&#160; &lt;br /&gt;&#160;\n                ##lang.ordervalidation.entity## : &lt;br /&gt;&#160;##ordervalidation.entity##&lt;/p&gt;');
/*!40000 ALTER TABLE `glpi_notificationtemplatetranslations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_notimportedemails`
--

DROP TABLE IF EXISTS `glpi_notimportedemails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_notimportedemails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `mailcollectors_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `subject` text,
  `messageid` varchar(255) NOT NULL,
  `reason` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `mailcollectors_id` (`mailcollectors_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_notimportedemails`
--

LOCK TABLES `glpi_notimportedemails` WRITE;
/*!40000 ALTER TABLE `glpi_notimportedemails` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_notimportedemails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_objectlocks`
--

DROP TABLE IF EXISTS `glpi_objectlocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_objectlocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Type of locked object',
  `items_id` int(11) NOT NULL COMMENT 'RELATION to various tables, according to itemtype (ID)',
  `users_id` int(11) NOT NULL COMMENT 'id of the locker',
  `date_mod` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp of the lock',
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_objectlocks`
--

LOCK TABLES `glpi_objectlocks` WRITE;
/*!40000 ALTER TABLE `glpi_objectlocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_objectlocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_olalevelactions`
--

DROP TABLE IF EXISTS `glpi_olalevelactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_olalevelactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `olalevels_id` int(11) NOT NULL DEFAULT '0',
  `action_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `olalevels_id` (`olalevels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_olalevelactions`
--

LOCK TABLES `glpi_olalevelactions` WRITE;
/*!40000 ALTER TABLE `glpi_olalevelactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_olalevelactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_olalevelcriterias`
--

DROP TABLE IF EXISTS `glpi_olalevelcriterias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_olalevelcriterias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `olalevels_id` int(11) NOT NULL DEFAULT '0',
  `criteria` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT '0' COMMENT 'see define.php PATTERN_* and REGEX_* constant',
  `pattern` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `olalevels_id` (`olalevels_id`),
  KEY `condition` (`condition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_olalevelcriterias`
--

LOCK TABLES `glpi_olalevelcriterias` WRITE;
/*!40000 ALTER TABLE `glpi_olalevelcriterias` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_olalevelcriterias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_olalevels`
--

DROP TABLE IF EXISTS `glpi_olalevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_olalevels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `olas_id` int(11) NOT NULL DEFAULT '0',
  `execution_time` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `match` char(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'see define.php *_MATCHING constant',
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_active` (`is_active`),
  KEY `olas_id` (`olas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_olalevels`
--

LOCK TABLES `glpi_olalevels` WRITE;
/*!40000 ALTER TABLE `glpi_olalevels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_olalevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_olalevels_tickets`
--

DROP TABLE IF EXISTS `glpi_olalevels_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_olalevels_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `olalevels_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`olalevels_id`),
  KEY `tickets_id` (`tickets_id`),
  KEY `olalevels_id` (`olalevels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_olalevels_tickets`
--

LOCK TABLES `glpi_olalevels_tickets` WRITE;
/*!40000 ALTER TABLE `glpi_olalevels_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_olalevels_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_olas`
--

DROP TABLE IF EXISTS `glpi_olas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_olas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `number_time` int(11) NOT NULL,
  `calendars_id` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `definition_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_of_working_day` tinyint(1) NOT NULL DEFAULT '0',
  `date_creation` datetime DEFAULT NULL,
  `slms_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `calendars_id` (`calendars_id`),
  KEY `slms_id` (`slms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_olas`
--

LOCK TABLES `glpi_olas` WRITE;
/*!40000 ALTER TABLE `glpi_olas` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_olas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_operatingsystemarchitectures`
--

DROP TABLE IF EXISTS `glpi_operatingsystemarchitectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_operatingsystemarchitectures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_operatingsystemarchitectures`
--

LOCK TABLES `glpi_operatingsystemarchitectures` WRITE;
/*!40000 ALTER TABLE `glpi_operatingsystemarchitectures` DISABLE KEYS */;
INSERT INTO `glpi_operatingsystemarchitectures` VALUES (1,'64x','','2019-02-15 09:05:26','2019-02-15 09:05:26');
/*!40000 ALTER TABLE `glpi_operatingsystemarchitectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_operatingsystemeditions`
--

DROP TABLE IF EXISTS `glpi_operatingsystemeditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_operatingsystemeditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_operatingsystemeditions`
--

LOCK TABLES `glpi_operatingsystemeditions` WRITE;
/*!40000 ALTER TABLE `glpi_operatingsystemeditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_operatingsystemeditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_operatingsystemkernels`
--

DROP TABLE IF EXISTS `glpi_operatingsystemkernels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_operatingsystemkernels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_operatingsystemkernels`
--

LOCK TABLES `glpi_operatingsystemkernels` WRITE;
/*!40000 ALTER TABLE `glpi_operatingsystemkernels` DISABLE KEYS */;
INSERT INTO `glpi_operatingsystemkernels` VALUES (1,'1 ядро','','2019-02-13 04:57:22','2019-02-13 04:57:22'),(2,'2 ядра','','2019-02-13 04:57:28','2019-02-13 04:57:28'),(3,'3 ядра','','2019-02-13 04:57:39','2019-02-13 04:57:39'),(4,'4 ядра','','2019-02-13 04:57:45','2019-02-13 04:57:45'),(5,'5 ядер','','2019-02-13 04:57:57','2019-02-13 04:57:57'),(6,'6 ядер','','2019-02-13 04:58:07','2019-02-13 04:58:07'),(7,'7 ядер','','2019-02-13 04:58:17','2019-02-13 04:58:17'),(8,'8 ядер','','2019-02-13 04:58:22','2019-02-13 04:58:22'),(9,'9 ядер','','2019-02-13 04:58:28','2019-02-13 04:58:28'),(10,'10 ядер','','2019-02-13 04:58:33','2019-02-13 04:58:33'),(11,'11 ядер','','2019-02-13 04:58:38','2019-02-13 04:58:38'),(12,'12 ядер','','2019-02-13 04:58:43','2019-02-13 04:58:43'),(13,'13 ядер','','2019-02-13 04:58:49','2019-02-13 04:58:49'),(14,'14 ядер','','2019-02-13 04:58:54','2019-02-13 04:58:54'),(15,'15 ядер','','2019-02-13 04:58:59','2019-02-13 04:58:59'),(16,'16 ядер','','2019-02-13 04:59:04','2019-02-13 04:59:04'),(17,'17 ядер','','2019-02-13 04:59:09','2019-02-13 04:59:09'),(18,'18 ядер','','2019-02-13 04:59:13','2019-02-13 04:59:13'),(19,'19 ядер','','2019-02-13 04:59:19','2019-02-13 04:59:19'),(20,'20 ядер','','2019-02-13 04:59:26','2019-02-13 04:59:26');
/*!40000 ALTER TABLE `glpi_operatingsystemkernels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_operatingsystemkernelversions`
--

DROP TABLE IF EXISTS `glpi_operatingsystemkernelversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_operatingsystemkernelversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operatingsystemkernels_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `operatingsystemkernels_id` (`operatingsystemkernels_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_operatingsystemkernelversions`
--

LOCK TABLES `glpi_operatingsystemkernelversions` WRITE;
/*!40000 ALTER TABLE `glpi_operatingsystemkernelversions` DISABLE KEYS */;
INSERT INTO `glpi_operatingsystemkernelversions` VALUES (1,4,'core','','2019-02-15 09:05:53','2019-02-15 09:05:53');
/*!40000 ALTER TABLE `glpi_operatingsystemkernelversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_operatingsystems`
--

DROP TABLE IF EXISTS `glpi_operatingsystems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_operatingsystems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_operatingsystems`
--

LOCK TABLES `glpi_operatingsystems` WRITE;
/*!40000 ALTER TABLE `glpi_operatingsystems` DISABLE KEYS */;
INSERT INTO `glpi_operatingsystems` VALUES (1,'MS Windows 10','','2019-02-15 09:05:08','2019-02-15 09:05:08');
/*!40000 ALTER TABLE `glpi_operatingsystems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_operatingsystemservicepacks`
--

DROP TABLE IF EXISTS `glpi_operatingsystemservicepacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_operatingsystemservicepacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_operatingsystemservicepacks`
--

LOCK TABLES `glpi_operatingsystemservicepacks` WRITE;
/*!40000 ALTER TABLE `glpi_operatingsystemservicepacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_operatingsystemservicepacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_operatingsystemversions`
--

DROP TABLE IF EXISTS `glpi_operatingsystemversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_operatingsystemversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_operatingsystemversions`
--

LOCK TABLES `glpi_operatingsystemversions` WRITE;
/*!40000 ALTER TABLE `glpi_operatingsystemversions` DISABLE KEYS */;
INSERT INTO `glpi_operatingsystemversions` VALUES (1,'10.05.19','','2019-02-15 09:06:18','2019-02-15 09:06:18');
/*!40000 ALTER TABLE `glpi_operatingsystemversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_pdumodels`
--

DROP TABLE IF EXISTS `glpi_pdumodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_pdumodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  `required_units` int(11) NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int(11) NOT NULL DEFAULT '0',
  `max_power` int(11) NOT NULL DEFAULT '0',
  `is_half_rack` tinyint(1) NOT NULL DEFAULT '0',
  `picture_front` text COLLATE utf8_unicode_ci,
  `picture_rear` text COLLATE utf8_unicode_ci,
  `is_rackable` tinyint(1) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_rackable` (`is_rackable`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_pdumodels`
--

LOCK TABLES `glpi_pdumodels` WRITE;
/*!40000 ALTER TABLE `glpi_pdumodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_pdumodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_pdus`
--

DROP TABLE IF EXISTS `glpi_pdus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_pdus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdumodels_id` int(11) DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to states (id)',
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `pdutypes_id` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `pdumodels_id` (`pdumodels_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `group_id_tech` (`groups_id_tech`),
  KEY `is_template` (`is_template`),
  KEY `is_deleted` (`is_deleted`),
  KEY `states_id` (`states_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `pdutypes_id` (`pdutypes_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_pdus`
--

LOCK TABLES `glpi_pdus` WRITE;
/*!40000 ALTER TABLE `glpi_pdus` DISABLE KEYS */;
INSERT INTO `glpi_pdus` VALUES (1,'',0,0,1,'','',0,6,1,0,NULL,0,1,'',0,0,'2019-02-15 03:50:10','2019-02-15 03:50:10');
/*!40000 ALTER TABLE `glpi_pdus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_pdus_plugs`
--

DROP TABLE IF EXISTS `glpi_pdus_plugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_pdus_plugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugs_id` int(11) NOT NULL DEFAULT '0',
  `pdus_id` int(11) NOT NULL DEFAULT '0',
  `number_plugs` int(11) DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plugs_id` (`plugs_id`),
  KEY `pdus_id` (`pdus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_pdus_plugs`
--

LOCK TABLES `glpi_pdus_plugs` WRITE;
/*!40000 ALTER TABLE `glpi_pdus_plugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_pdus_plugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_pdus_racks`
--

DROP TABLE IF EXISTS `glpi_pdus_racks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_pdus_racks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `racks_id` int(11) NOT NULL DEFAULT '0',
  `pdus_id` int(11) NOT NULL DEFAULT '0',
  `side` int(11) DEFAULT '0',
  `position` int(11) NOT NULL,
  `bgcolor` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `racks_id` (`racks_id`),
  KEY `pdus_id` (`pdus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_pdus_racks`
--

LOCK TABLES `glpi_pdus_racks` WRITE;
/*!40000 ALTER TABLE `glpi_pdus_racks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_pdus_racks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_pdutypes`
--

DROP TABLE IF EXISTS `glpi_pdutypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_pdutypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_creation` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_pdutypes`
--

LOCK TABLES `glpi_pdutypes` WRITE;
/*!40000 ALTER TABLE `glpi_pdutypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_pdutypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_peripheralmodels`
--

DROP TABLE IF EXISTS `glpi_peripheralmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_peripheralmodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  `required_units` int(11) NOT NULL DEFAULT '1',
  `depth` float NOT NULL DEFAULT '1',
  `power_connections` int(11) NOT NULL DEFAULT '0',
  `power_consumption` int(11) NOT NULL DEFAULT '0',
  `is_half_rack` tinyint(1) NOT NULL DEFAULT '0',
  `picture_front` text COLLATE utf8_unicode_ci,
  `picture_rear` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_peripheralmodels`
--

LOCK TABLES `glpi_peripheralmodels` WRITE;
/*!40000 ALTER TABLE `glpi_peripheralmodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_peripheralmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_peripherals`
--

DROP TABLE IF EXISTS `glpi_peripherals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_peripherals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `peripheraltypes_id` int(11) NOT NULL DEFAULT '0',
  `peripheralmodels_id` int(11) NOT NULL DEFAULT '0',
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `date_creation` datetime DEFAULT NULL,
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `peripheralmodels_id` (`peripheralmodels_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `peripheraltypes_id` (`peripheraltypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `date_creation` (`date_creation`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_peripherals`
--

LOCK TABLES `glpi_peripherals` WRITE;
/*!40000 ALTER TABLE `glpi_peripherals` DISABLE KEYS */;
INSERT INTO `glpi_peripherals` VALUES (1,0,'Патч-панель','2019-02-15 08:58:54','Игнатьев А.С.','+7 7773330505',0,1,'','04А356Р723','137',1,0,0,'',0,0,0,0,NULL,0,2,1,0.0000,0,'2019-02-12 07:39:33',0);
/*!40000 ALTER TABLE `glpi_peripherals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_peripheraltypes`
--

DROP TABLE IF EXISTS `glpi_peripheraltypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_peripheraltypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_peripheraltypes`
--

LOCK TABLES `glpi_peripheraltypes` WRITE;
/*!40000 ALTER TABLE `glpi_peripheraltypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_peripheraltypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_phonemodels`
--

DROP TABLE IF EXISTS `glpi_phonemodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_phonemodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_phonemodels`
--

LOCK TABLES `glpi_phonemodels` WRITE;
/*!40000 ALTER TABLE `glpi_phonemodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_phonemodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_phonepowersupplies`
--

DROP TABLE IF EXISTS `glpi_phonepowersupplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_phonepowersupplies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_phonepowersupplies`
--

LOCK TABLES `glpi_phonepowersupplies` WRITE;
/*!40000 ALTER TABLE `glpi_phonepowersupplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_phonepowersupplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_phones`
--

DROP TABLE IF EXISTS `glpi_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_phones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `phonetypes_id` int(11) NOT NULL DEFAULT '0',
  `phonemodels_id` int(11) NOT NULL DEFAULT '0',
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phonepowersupplies_id` int(11) NOT NULL DEFAULT '0',
  `number_line` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `have_headset` tinyint(1) NOT NULL DEFAULT '0',
  `have_hp` tinyint(1) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `date_creation` datetime DEFAULT NULL,
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `phonemodels_id` (`phonemodels_id`),
  KEY `phonepowersupplies_id` (`phonepowersupplies_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `phonetypes_id` (`phonetypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `date_creation` (`date_creation`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_phones`
--

LOCK TABLES `glpi_phones` WRITE;
/*!40000 ALTER TABLE `glpi_phones` DISABLE KEYS */;
INSERT INTO `glpi_phones` VALUES (1,0,'Panasonic-NSX-120','2019-02-12 07:41:10','','',5,0,'','041536','138',1,0,0,'Panasonic',0,'1',0,0,0,0,0,0,NULL,0,0,1,0.0000,0,'2019-02-12 07:41:10',0);
/*!40000 ALTER TABLE `glpi_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_phonetypes`
--

DROP TABLE IF EXISTS `glpi_phonetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_phonetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_phonetypes`
--

LOCK TABLES `glpi_phonetypes` WRITE;
/*!40000 ALTER TABLE `glpi_phonetypes` DISABLE KEYS */;
INSERT INTO `glpi_phonetypes` VALUES (1,'Panas1','','2019-02-15 04:15:23','2019-02-15 04:15:23'),(2,'Nokia','','2019-02-15 04:15:28','2019-02-15 04:15:28');
/*!40000 ALTER TABLE `glpi_phonetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_planningrecalls`
--

DROP TABLE IF EXISTS `glpi_planningrecalls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_planningrecalls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `before_time` int(11) NOT NULL DEFAULT '-10',
  `when` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`users_id`),
  KEY `users_id` (`users_id`),
  KEY `before_time` (`before_time`),
  KEY `when` (`when`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_planningrecalls`
--

LOCK TABLES `glpi_planningrecalls` WRITE;
/*!40000 ALTER TABLE `glpi_planningrecalls` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_planningrecalls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_dashboard_config`
--

DROP TABLE IF EXISTS `glpi_plugin_dashboard_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_dashboard_config` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` varchar(125) NOT NULL,
  `users_id` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`name`,`value`,`users_id`),
  UNIQUE KEY `name` (`name`,`users_id`),
  KEY `name_2` (`name`,`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_dashboard_config`
--

LOCK TABLES `glpi_plugin_dashboard_config` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_dashboard_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_dashboard_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_dashboard_count`
--

DROP TABLE IF EXISTS `glpi_plugin_dashboard_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_dashboard_count` (
  `type` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `quant` int(11) DEFAULT NULL,
  PRIMARY KEY (`type`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_dashboard_count`
--

LOCK TABLES `glpi_plugin_dashboard_count` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_dashboard_count` DISABLE KEYS */;
INSERT INTO `glpi_plugin_dashboard_count` VALUES (1,0,1),(2,0,2);
/*!40000 ALTER TABLE `glpi_plugin_dashboard_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_dashboard_map`
--

DROP TABLE IF EXISTS `glpi_plugin_dashboard_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_dashboard_map` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `entities_id` int(4) NOT NULL,
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  PRIMARY KEY (`id`,`entities_id`),
  UNIQUE KEY `location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_dashboard_map`
--

LOCK TABLES `glpi_plugin_dashboard_map` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_dashboard_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_dashboard_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_datainjection_infos`
--

DROP TABLE IF EXISTS `glpi_plugin_datainjection_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_datainjection_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `models_id` int(11) NOT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_mandatory` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_datainjection_infos`
--

LOCK TABLES `glpi_plugin_datainjection_infos` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_datainjection_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_datainjection_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_datainjection_mappings`
--

DROP TABLE IF EXISTS `glpi_plugin_datainjection_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_datainjection_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `models_id` int(11) NOT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rank` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_mandatory` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_datainjection_mappings`
--

LOCK TABLES `glpi_plugin_datainjection_mappings` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_datainjection_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_datainjection_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_datainjection_modelcsvs`
--

DROP TABLE IF EXISTS `glpi_plugin_datainjection_modelcsvs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_datainjection_modelcsvs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `models_id` int(11) NOT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delimiter` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT ';',
  `is_header_present` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_datainjection_modelcsvs`
--

LOCK TABLES `glpi_plugin_datainjection_modelcsvs` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_datainjection_modelcsvs` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_datainjection_modelcsvs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_datainjection_models`
--

DROP TABLE IF EXISTS `glpi_plugin_datainjection_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_datainjection_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_creation` datetime DEFAULT NULL,
  `filetype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'csv',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `behavior_add` tinyint(1) NOT NULL DEFAULT '1',
  `behavior_update` tinyint(1) NOT NULL DEFAULT '0',
  `can_add_dropdown` tinyint(1) NOT NULL DEFAULT '0',
  `can_overwrite_if_not_empty` int(1) NOT NULL DEFAULT '1',
  `is_private` tinyint(1) NOT NULL DEFAULT '1',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `perform_network_connection` tinyint(1) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL,
  `date_format` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yyyy-mm-dd',
  `float_format` tinyint(1) NOT NULL DEFAULT '0',
  `port_unicity` tinyint(1) NOT NULL DEFAULT '0',
  `step` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_datainjection_models`
--

LOCK TABLES `glpi_plugin_datainjection_models` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_datainjection_models` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_datainjection_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_example_devicecameras`
--

DROP TABLE IF EXISTS `glpi_plugin_example_devicecameras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_example_devicecameras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_example_devicecameras`
--

LOCK TABLES `glpi_plugin_example_devicecameras` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_example_devicecameras` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_example_devicecameras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_example_dropdowns`
--

DROP TABLE IF EXISTS `glpi_plugin_example_dropdowns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_example_dropdowns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_example_dropdowns`
--

LOCK TABLES `glpi_plugin_example_dropdowns` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_example_dropdowns` DISABLE KEYS */;
INSERT INTO `glpi_plugin_example_dropdowns` VALUES (1,'dp 1','comment 1'),(2,'dp2','comment 2');
/*!40000 ALTER TABLE `glpi_plugin_example_dropdowns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_example_examples`
--

DROP TABLE IF EXISTS `glpi_plugin_example_examples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_example_examples` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plugin_example_dropdowns_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_example_examples`
--

LOCK TABLES `glpi_plugin_example_examples` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_example_examples` DISABLE KEYS */;
INSERT INTO `glpi_plugin_example_examples` VALUES (1,'example 1','serial 1',1,0,0,NULL),(2,'example 2','serial 2',2,0,0,NULL),(3,'example 3','serial 3',1,0,0,NULL);
/*!40000 ALTER TABLE `glpi_plugin_example_examples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_example_items_devicecameras`
--

DROP TABLE IF EXISTS `glpi_plugin_example_items_devicecameras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_example_items_devicecameras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plugin_example_devicecameras_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`items_id`),
  KEY `plugin_example_devicecameras_id` (`plugin_example_devicecameras_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_example_items_devicecameras`
--

LOCK TABLES `glpi_plugin_example_items_devicecameras` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_example_items_devicecameras` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_example_items_devicecameras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_fields_clientservicefielddropdowns`
--

DROP TABLE IF EXISTS `glpi_plugin_fields_clientservicefielddropdowns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_fields_clientservicefielddropdowns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `completename` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `plugin_fields_clientservicefielddropdowns_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `ancestors_cache` text COLLATE utf8_unicode_ci,
  `sons_cache` text COLLATE utf8_unicode_ci,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `plugin_fields_clientservicefielddropdowns_id` (`plugin_fields_clientservicefielddropdowns_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_fields_clientservicefielddropdowns`
--

LOCK TABLES `glpi_plugin_fields_clientservicefielddropdowns` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_fields_clientservicefielddropdowns` DISABLE KEYS */;
INSERT INTO `glpi_plugin_fields_clientservicefielddropdowns` VALUES (1,'Все','Все','',0,1,NULL,NULL,0,0),(2,'Клиент','Все > Клиент','',1,2,NULL,NULL,0,0),(3,'Служебный','Все > Служебный','',1,2,'{\"1\":\"1\"}',NULL,0,0);
/*!40000 ALTER TABLE `glpi_plugin_fields_clientservicefielddropdowns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_fields_computervirtualmachinevpscallocations`
--

DROP TABLE IF EXISTS `glpi_plugin_fields_computervirtualmachinevpscallocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_fields_computervirtualmachinevpscallocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'ComputerVirtualMachine',
  `plugin_fields_containers_id` int(11) NOT NULL DEFAULT '6',
  `plugin_fields_clientservicefielddropdowns_id` int(11) NOT NULL DEFAULT '0',
  `field2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemtype_item_container` (`itemtype`,`items_id`,`plugin_fields_containers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_fields_computervirtualmachinevpscallocations`
--

LOCK TABLES `glpi_plugin_fields_computervirtualmachinevpscallocations` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_fields_computervirtualmachinevpscallocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_fields_computervirtualmachinevpscallocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_fields_computervpscallocations`
--

DROP TABLE IF EXISTS `glpi_plugin_fields_computervpscallocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_fields_computervpscallocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Computer',
  `plugin_fields_containers_id` int(11) NOT NULL DEFAULT '6',
  `plugin_fields_clientservicefielddropdowns_id` int(11) NOT NULL DEFAULT '0',
  `field2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemtype_item_container` (`itemtype`,`items_id`,`plugin_fields_containers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_fields_computervpscallocations`
--

LOCK TABLES `glpi_plugin_fields_computervpscallocations` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_fields_computervpscallocations` DISABLE KEYS */;
INSERT INTO `glpi_plugin_fields_computervpscallocations` VALUES (1,1,'Computer',6,2,NULL);
/*!40000 ALTER TABLE `glpi_plugin_fields_computervpscallocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_fields_containers`
--

DROP TABLE IF EXISTS `glpi_plugin_fields_containers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_fields_containers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtypes` longtext COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_fields_containers`
--

LOCK TABLES `glpi_plugin_fields_containers` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_fields_containers` DISABLE KEYS */;
INSERT INTO `glpi_plugin_fields_containers` VALUES (6,'vpscallocation','vps-callocation','[\"Computer\",\"ComputerVirtualMachine\",\"NetworkEquipment\"]','dom',NULL,0,0,1),(7,'zayavka','zayavka','[\"Ticket\"]','tab',NULL,0,0,1);
/*!40000 ALTER TABLE `glpi_plugin_fields_containers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_fields_fields`
--

DROP TABLE IF EXISTS `glpi_plugin_fields_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_fields_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plugin_fields_containers_id` int(11) NOT NULL DEFAULT '0',
  `ranking` int(11) NOT NULL DEFAULT '0',
  `default_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_readonly` tinyint(1) NOT NULL DEFAULT '1',
  `mandatory` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `plugin_fields_containers_id` (`plugin_fields_containers_id`),
  KEY `is_active` (`is_active`),
  KEY `is_readonly` (`is_readonly`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_fields_fields`
--

LOCK TABLES `glpi_plugin_fields_fields` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_fields_fields` DISABLE KEYS */;
INSERT INTO `glpi_plugin_fields_fields` VALUES (2,'field','','dropdown',2,1,'INT',1,0,0),(8,'clientservicefield','client-service','dropdown',6,1,'1',1,0,0),(9,'field2','№ договора','number',6,2,'',1,0,0),(11,'field4','Ссылка на СЗ','url',7,1,'',1,0,0);
/*!40000 ALTER TABLE `glpi_plugin_fields_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_fields_labeltranslations`
--

DROP TABLE IF EXISTS `glpi_plugin_fields_labeltranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_fields_labeltranslations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_fields_itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `plugin_fields_items_id` int(11) NOT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`plugin_fields_itemtype`,`plugin_fields_items_id`,`language`),
  KEY `plugin_fields_itemtype` (`plugin_fields_itemtype`),
  KEY `plugin_fields_items_id` (`plugin_fields_items_id`),
  KEY `language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_fields_labeltranslations`
--

LOCK TABLES `glpi_plugin_fields_labeltranslations` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_fields_labeltranslations` DISABLE KEYS */;
INSERT INTO `glpi_plugin_fields_labeltranslations` VALUES (3,'PluginFieldsContainer',2,'ru_RU','Тип подключения'),(13,'PluginFieldsContainer',6,'ru_RU','vps-callocation'),(14,'PluginFieldsField',8,'ru_RU','client-service'),(15,'PluginFieldsField',9,'ru_RU','№ договора'),(16,'PluginFieldsContainer',7,'ru_RU','zayavka'),(19,'PluginFieldsField',11,'ru_RU','Ссылка на СЗ');
/*!40000 ALTER TABLE `glpi_plugin_fields_labeltranslations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_fields_linetype975861251s`
--

DROP TABLE IF EXISTS `glpi_plugin_fields_linetype975861251s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_fields_linetype975861251s` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'LineType',
  `plugin_fields_containers_id` int(11) NOT NULL DEFAULT '2',
  `plugin_fields_fielddropdowns_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemtype_item_container` (`itemtype`,`items_id`,`plugin_fields_containers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_fields_linetype975861251s`
--

LOCK TABLES `glpi_plugin_fields_linetype975861251s` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_fields_linetype975861251s` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_fields_linetype975861251s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_fields_networkequipmentvpscallocations`
--

DROP TABLE IF EXISTS `glpi_plugin_fields_networkequipmentvpscallocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_fields_networkequipmentvpscallocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'NetworkEquipment',
  `plugin_fields_containers_id` int(11) NOT NULL DEFAULT '6',
  `plugin_fields_clientservicefielddropdowns_id` int(11) NOT NULL DEFAULT '0',
  `field2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemtype_item_container` (`itemtype`,`items_id`,`plugin_fields_containers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_fields_networkequipmentvpscallocations`
--

LOCK TABLES `glpi_plugin_fields_networkequipmentvpscallocations` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_fields_networkequipmentvpscallocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_fields_networkequipmentvpscallocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_fields_profiles`
--

DROP TABLE IF EXISTS `glpi_plugin_fields_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_fields_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profiles_id` int(11) NOT NULL DEFAULT '0',
  `plugin_fields_containers_id` int(11) NOT NULL DEFAULT '0',
  `right` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `plugin_fields_containers_id` (`plugin_fields_containers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_fields_profiles`
--

LOCK TABLES `glpi_plugin_fields_profiles` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_fields_profiles` DISABLE KEYS */;
INSERT INTO `glpi_plugin_fields_profiles` VALUES (9,1,2,'4'),(10,2,2,'4'),(11,3,2,'4'),(12,4,2,'4'),(13,5,2,'4'),(14,6,2,'4'),(15,7,2,'4'),(16,8,2,'4'),(41,1,6,'4'),(42,2,6,'4'),(43,3,6,'4'),(44,4,6,'4'),(45,5,6,'4'),(46,6,6,'4'),(47,7,6,'4'),(48,8,6,'4'),(49,1,7,'4'),(50,2,7,'4'),(51,3,7,'4'),(52,4,7,'4'),(53,5,7,'4'),(54,6,7,'4'),(55,7,7,'4'),(56,8,7,'4');
/*!40000 ALTER TABLE `glpi_plugin_fields_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_fields_ticketzayavkas`
--

DROP TABLE IF EXISTS `glpi_plugin_fields_ticketzayavkas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_fields_ticketzayavkas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `items_id` int(11) NOT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Ticket',
  `plugin_fields_containers_id` int(11) NOT NULL DEFAULT '7',
  `field4` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemtype_item_container` (`itemtype`,`items_id`,`plugin_fields_containers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_fields_ticketzayavkas`
--

LOCK TABLES `glpi_plugin_fields_ticketzayavkas` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_fields_ticketzayavkas` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_fields_ticketzayavkas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_formcreator_answers`
--

DROP TABLE IF EXISTS `glpi_plugin_formcreator_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_formcreator_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_formcreator_formanswers_id` int(11) NOT NULL,
  `plugin_formcreator_questions_id` int(11) NOT NULL,
  `answer` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `plugin_formcreator_formanswers_id` (`plugin_formcreator_formanswers_id`),
  KEY `plugin_formcreator_questions_id` (`plugin_formcreator_questions_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_formcreator_answers`
--

LOCK TABLES `glpi_plugin_formcreator_answers` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_answers` DISABLE KEYS */;
INSERT INTO `glpi_plugin_formcreator_answers` VALUES (1,2,1,'Клиент'),(2,2,3,'1'),(3,2,4,'3'),(4,2,5,'1\r\n2\r\n6\r\n7'),(5,2,6,'2'),(6,2,7,'ТОО Компания'),(7,2,8,'&lt;p&gt;36&lt;/p&gt;'),(8,2,9,'&lt;p&gt;https://lotus.ktcl.kz/_462&lt;/p&gt;'),(9,2,10,'1'),(10,2,11,'2'),(11,2,12,'3'),(12,2,13,'&lt;p&gt;6513265243&lt;/p&gt;'),(13,2,14,'3'),(14,3,1,'Клиент'),(15,3,3,'10'),(16,3,4,'1'),(17,3,5,'1'),(18,3,6,'1'),(19,3,7,''),(20,3,8,''),(21,3,9,''),(22,3,10,'1'),(23,3,11,'2'),(24,3,12,'3'),(25,3,13,'&lt;p&gt;тест1&lt;/p&gt;'),(26,3,14,'1'),(27,4,1,'Клиент'),(28,4,3,'10'),(29,4,4,'1'),(30,4,5,'1\r\n2'),(31,4,6,'2'),(32,4,7,'ТОО Компания КЗ'),(33,4,8,'&lt;p&gt;123456&lt;/p&gt;'),(34,4,9,'&lt;p&gt;http://mail.mycloud.kz/admin&lt;/p&gt;'),(35,4,10,'1'),(36,4,11,'2'),(37,4,12,'0'),(38,4,13,'&lt;p&gt;123&lt;/p&gt;'),(39,4,14,'3');
/*!40000 ALTER TABLE `glpi_plugin_formcreator_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_formcreator_categories`
--

DROP TABLE IF EXISTS `glpi_plugin_formcreator_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_formcreator_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8_unicode_ci,
  `completename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plugin_formcreator_categories_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `knowbaseitemcategories_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  KEY `plugin_formcreator_categories_id` (`plugin_formcreator_categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_formcreator_categories`
--

LOCK TABLES `glpi_plugin_formcreator_categories` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_categories` DISABLE KEYS */;
INSERT INTO `glpi_plugin_formcreator_categories` VALUES (1,'Callocation','','Callocation',0,1,NULL,'[]',0),(2,'vps','','vps',0,1,NULL,'[]',0);
/*!40000 ALTER TABLE `glpi_plugin_formcreator_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_formcreator_entityconfigs`
--

DROP TABLE IF EXISTS `glpi_plugin_formcreator_entityconfigs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_formcreator_entityconfigs` (
  `id` int(11) NOT NULL,
  `replace_helpdesk` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_formcreator_entityconfigs`
--

LOCK TABLES `glpi_plugin_formcreator_entityconfigs` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_entityconfigs` DISABLE KEYS */;
INSERT INTO `glpi_plugin_formcreator_entityconfigs` VALUES (0,0);
/*!40000 ALTER TABLE `glpi_plugin_formcreator_entityconfigs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_formcreator_formanswers`
--

DROP TABLE IF EXISTS `glpi_plugin_formcreator_formanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_formcreator_formanswers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `plugin_formcreator_forms_id` int(11) NOT NULL,
  `requester_id` int(11) DEFAULT NULL,
  `users_id_validator` int(11) DEFAULT NULL,
  `groups_id_validator` int(11) DEFAULT NULL,
  `request_date` datetime NOT NULL,
  `status` enum('waiting','refused','accepted') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'waiting',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `plugin_formcreator_forms_id` (`plugin_formcreator_forms_id`),
  KEY `entities_id_is_recursive` (`entities_id`,`is_recursive`),
  KEY `requester_id` (`requester_id`),
  KEY `users_id_validator` (`users_id_validator`),
  KEY `groups_id_validator` (`groups_id_validator`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_formcreator_formanswers`
--

LOCK TABLES `glpi_plugin_formcreator_formanswers` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_formanswers` DISABLE KEYS */;
INSERT INTO `glpi_plugin_formcreator_formanswers` VALUES (1,'Callocation',0,0,1,4,0,0,'2019-02-15 02:50:38','accepted',NULL),(2,'Callocation',0,0,1,4,0,0,'2019-02-15 03:38:50','accepted',NULL),(3,'Callocation',0,0,1,2,0,0,'2019-02-15 04:04:04','accepted',NULL),(4,'Callocation',0,0,1,4,0,0,'2019-02-15 04:57:22','accepted',NULL);
/*!40000 ALTER TABLE `glpi_plugin_formcreator_formanswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_formcreator_forms`
--

DROP TABLE IF EXISTS `glpi_plugin_formcreator_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_formcreator_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `access_rights` tinyint(1) NOT NULL DEFAULT '1',
  `requesttype` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `plugin_formcreator_categories_id` int(11) unsigned NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `helpdesk_home` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `validation_required` tinyint(1) NOT NULL DEFAULT '0',
  `usage_count` int(11) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `plugin_formcreator_categories_id` (`plugin_formcreator_categories_id`),
  FULLTEXT KEY `Search` (`name`,`description`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_formcreator_forms`
--

LOCK TABLES `glpi_plugin_formcreator_forms` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_forms` DISABLE KEYS */;
INSERT INTO `glpi_plugin_formcreator_forms` VALUES (1,'Callocation',0,0,2,7,'Размещение','&lt;p&gt;Размещение серверов&lt;/p&gt;',1,1,'ru_RU',1,0,0,4,1,'749a0a43-59e7d068-5c64de116bdd59.76674102');
/*!40000 ALTER TABLE `glpi_plugin_formcreator_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_formcreator_forms_profiles`
--

DROP TABLE IF EXISTS `glpi_plugin_formcreator_forms_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_formcreator_forms_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_formcreator_forms_id` int(11) NOT NULL,
  `profiles_id` int(11) NOT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`plugin_formcreator_forms_id`,`profiles_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_formcreator_forms_profiles`
--

LOCK TABLES `glpi_plugin_formcreator_forms_profiles` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_forms_profiles` DISABLE KEYS */;
INSERT INTO `glpi_plugin_formcreator_forms_profiles` VALUES (1,1,1,'749a0a43-59e7d068-5c6645914f3068.58718382'),(2,1,2,'749a0a43-59e7d068-5c664591531bb6.56040596'),(3,1,3,'749a0a43-59e7d068-5c66459156e4d8.21636875'),(4,1,4,'749a0a43-59e7d068-5c66459159d455.08050198'),(5,1,6,'749a0a43-59e7d068-5c6645915cc497.52512598'),(6,1,7,'749a0a43-59e7d068-5c6645915f74d5.77080703');
/*!40000 ALTER TABLE `glpi_plugin_formcreator_forms_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_formcreator_forms_validators`
--

DROP TABLE IF EXISTS `glpi_plugin_formcreator_forms_validators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_formcreator_forms_validators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_formcreator_forms_id` int(11) NOT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `items_id` int(11) NOT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`plugin_formcreator_forms_id`,`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_formcreator_forms_validators`
--

LOCK TABLES `glpi_plugin_formcreator_forms_validators` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_forms_validators` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_forms_validators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_formcreator_issues`
--

DROP TABLE IF EXISTS `glpi_plugin_formcreator_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_formcreator_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `original_id` int(11) NOT NULL DEFAULT '0',
  `sub_itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_creation` datetime NOT NULL,
  `date_mod` datetime NOT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `requester_id` int(11) NOT NULL DEFAULT '0',
  `validator_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `original_id_sub_itemtype` (`original_id`,`sub_itemtype`),
  KEY `entities_id` (`entities_id`),
  KEY `requester_id` (`requester_id`),
  KEY `validator_id` (`validator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_formcreator_issues`
--

LOCK TABLES `glpi_plugin_formcreator_issues` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_issues` DISABLE KEYS */;
INSERT INTO `glpi_plugin_formcreator_issues` VALUES (1,'Callocation','f_1',1,'PluginFormcreatorFormAnswer','accepted','2019-02-15 02:50:38','2019-02-15 02:50:38',0,0,4,0,''),(2,'Callocation','f_2',2,'PluginFormcreatorFormAnswer','accepted','2019-02-15 03:38:50','2019-02-15 03:38:50',0,0,4,0,''),(3,'Callocation','f_3',3,'PluginFormcreatorFormAnswer','accepted','2019-02-15 04:04:04','2019-02-15 04:04:04',0,0,2,0,''),(4,'Callocation','f_4',4,'PluginFormcreatorFormAnswer','accepted','2019-02-15 04:57:22','2019-02-15 04:57:22',0,0,4,0,''),(5,'Надо подумать','t_3',3,'Ticket','2','2019-02-22 00:00:00','2019-02-22 08:28:24',0,0,2,0,'&lt;p&gt;Надо подумать&lt;/p&gt;');
/*!40000 ALTER TABLE `glpi_plugin_formcreator_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_formcreator_items_targettickets`
--

DROP TABLE IF EXISTS `glpi_plugin_formcreator_items_targettickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_formcreator_items_targettickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_formcreator_targettickets_id` int(11) NOT NULL DEFAULT '0',
  `link` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `items_id` int(11) NOT NULL DEFAULT '0',
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plugin_formcreator_targettickets_id` (`plugin_formcreator_targettickets_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_formcreator_items_targettickets`
--

LOCK TABLES `glpi_plugin_formcreator_items_targettickets` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_items_targettickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_items_targettickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_formcreator_questiondependencies`
--

DROP TABLE IF EXISTS `glpi_plugin_formcreator_questiondependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_formcreator_questiondependencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_formcreator_questions_id` int(11) NOT NULL,
  `plugin_formcreator_questions_id_2` int(11) NOT NULL,
  `fieldname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plugin_formcreator_questions_id` (`plugin_formcreator_questions_id`),
  KEY `plugin_formcreator_questions_id_2` (`plugin_formcreator_questions_id_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_formcreator_questiondependencies`
--

LOCK TABLES `glpi_plugin_formcreator_questiondependencies` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_questiondependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_questiondependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_formcreator_questionranges`
--

DROP TABLE IF EXISTS `glpi_plugin_formcreator_questionranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_formcreator_questionranges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_formcreator_questions_id` int(11) NOT NULL,
  `range_min` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `range_max` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fieldname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plugin_formcreator_questions_id` (`plugin_formcreator_questions_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_formcreator_questionranges`
--

LOCK TABLES `glpi_plugin_formcreator_questionranges` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_questionranges` DISABLE KEYS */;
INSERT INTO `glpi_plugin_formcreator_questionranges` VALUES (1,1,'','','range','749a0a43-59e7d068-5c6629dc2fe013.85813542'),(2,3,'1','40','range','749a0a43-59e7d068-5c662c08773100.47412448'),(3,5,'1','500','range','749a0a43-59e7d068-5c662f0adb8665.90787235'),(4,6,'1','20','range','749a0a43-59e7d068-5c662f8826c2d7.51324781'),(5,7,'','','range','749a0a43-59e7d068-5c66304ab98d83.82950680'),(9,8,'','','range','749a0a43-59e7d068-5c66485ab21194.78734651'),(10,9,'','','range','749a0a43-59e7d068-5c66487ac65267.04387881'),(11,13,'','','range','749a0a43-59e7d068-5c66488d354269.57724496');
/*!40000 ALTER TABLE `glpi_plugin_formcreator_questionranges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_formcreator_questionregexes`
--

DROP TABLE IF EXISTS `glpi_plugin_formcreator_questionregexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_formcreator_questionregexes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_formcreator_questions_id` int(11) NOT NULL,
  `regex` text COLLATE utf8_unicode_ci,
  `fieldname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plugin_formcreator_questions_id` (`plugin_formcreator_questions_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_formcreator_questionregexes`
--

LOCK TABLES `glpi_plugin_formcreator_questionregexes` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_questionregexes` DISABLE KEYS */;
INSERT INTO `glpi_plugin_formcreator_questionregexes` VALUES (1,7,'','regex','749a0a43-59e7d068-5c66304ab84602.32172577'),(5,8,'','regex','749a0a43-59e7d068-5c66485ab08623.17735084'),(6,9,'','regex','749a0a43-59e7d068-5c66487ac4aaa4.41416566'),(7,13,'','regex','749a0a43-59e7d068-5c66488d338424.50590706');
/*!40000 ALTER TABLE `glpi_plugin_formcreator_questionregexes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_formcreator_questions`
--

DROP TABLE IF EXISTS `glpi_plugin_formcreator_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_formcreator_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plugin_formcreator_sections_id` int(11) NOT NULL,
  `fieldtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `show_empty` tinyint(1) NOT NULL DEFAULT '0',
  `default_values` text COLLATE utf8_unicode_ci,
  `values` text COLLATE utf8_unicode_ci,
  `range_min` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `range_max` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `show_rule` enum('always','hidden','shown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'always',
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plugin_formcreator_sections_id` (`plugin_formcreator_sections_id`),
  FULLTEXT KEY `Search` (`name`,`description`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_formcreator_questions`
--

LOCK TABLES `glpi_plugin_formcreator_questions` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_questions` DISABLE KEYS */;
INSERT INTO `glpi_plugin_formcreator_questions` VALUES (1,'Клиент/служебное',1,'select',0,0,'Клиент','Клиент\r\nCлужебное',NULL,NULL,'',1,'always','749a0a43-59e7d068-5c6629dc2bfe45.70666606'),(2,'',0,'text',0,0,'',NULL,NULL,NULL,'',1,'always','749a0a43-59e7d068-5c662a15da9160.52659729'),(3,'Ряд',1,'select',0,0,'10','1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n9\r\n10\r\n11\r\n12\r\n13\r\n14\r\n15\r\n16\r\n17\r\n18\r\n19\r\n20\r\n21\r\n22\r\n23\r\n24\r\n25\r\n26\r\n27\r\n28\r\n29\r\n30\r\n31\r\n32\r\n33\r\n34\r\n35\r\n36\r\n37\r\n38\r\n39\r\n40',NULL,NULL,'',2,'always','749a0a43-59e7d068-5c662c08732020.58458994'),(4,'Шкаф',1,'dropdown',0,0,'1','{\"itemtype\":\"RackModel\"}',NULL,NULL,'',3,'always','749a0a43-59e7d068-5c662e280d9ae7.62168284'),(5,'Юнит',1,'multiselect',0,0,'1','1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n9\r\n10\r\n11\r\n12\r\n13\r\n14',NULL,NULL,'',4,'always','749a0a43-59e7d068-5c662f0ad75126.31629833'),(6,'Количество юнитов',1,'select',0,0,'1','1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n9\r\n10\r\n11\r\n12\r\n13\r\n14\r\n15\r\n16\r\n17\r\n18\r\n19\r\n20',NULL,NULL,'&lt;p&gt;Количество юнитов&lt;/p&gt;',5,'always','749a0a43-59e7d068-5c662f8820f538.78442888'),(7,'Название компании ',1,'text',0,0,'','',NULL,NULL,'&lt;p&gt;Название компани&lt;/p&gt;',6,'always','749a0a43-59e7d068-5c66304ab45db3.01452144'),(8,'№ договора',1,'text',0,0,'','',NULL,NULL,'',7,'always','749a0a43-59e7d068-5c663084970b22.19783215'),(9,'СЗ на подключение',1,'text',0,0,'','',NULL,NULL,'',8,'always','749a0a43-59e7d068-5c6630b2d4ca80.96617349'),(10,'Тип оборудования',2,'dropdown',0,0,'1','{\"itemtype\":\"ComputerType\"}',NULL,NULL,'',1,'always','749a0a43-59e7d068-5c6631a59fa266.22207795'),(11,'Производитель оборудования',2,'dropdown',0,0,'0','{\"itemtype\":\"Manufacturer\"}',NULL,NULL,'',2,'always','749a0a43-59e7d068-5c6632085e2005.20678261'),(12,'Модель оборудования',2,'dropdown',0,0,'0','{\"itemtype\":\"NetworkEquipmentModel\"}',NULL,NULL,'',3,'always','749a0a43-59e7d068-5c66329d004cb5.78031823'),(13,'Серийный номер',2,'text',0,0,'','',NULL,NULL,'&lt;p&gt;Серийный номер&lt;/p&gt;',4,'always','749a0a43-59e7d068-5c663353d2ac29.45599633'),(16,'Тип подключения',3,'dropdown',0,0,'1','{\"itemtype\":\"LineType\"}',NULL,NULL,'&lt;p&gt;Тип подключения&lt;/p&gt;',1,'always','749a0a43-59e7d068-5c664efa82eca3.49250444');
/*!40000 ALTER TABLE `glpi_plugin_formcreator_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_formcreator_questions_conditions`
--

DROP TABLE IF EXISTS `glpi_plugin_formcreator_questions_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_formcreator_questions_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_formcreator_questions_id` int(11) NOT NULL,
  `show_field` int(11) DEFAULT NULL,
  `show_condition` enum('==','!=','<','>','<=','>=') COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_logic` enum('AND','OR') COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plugin_formcreator_questions_id` (`plugin_formcreator_questions_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_formcreator_questions_conditions`
--

LOCK TABLES `glpi_plugin_formcreator_questions_conditions` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_questions_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_questions_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_formcreator_sections`
--

DROP TABLE IF EXISTS `glpi_plugin_formcreator_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_formcreator_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plugin_formcreator_forms_id` int(11) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plugin_formcreator_forms_id` (`plugin_formcreator_forms_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_formcreator_sections`
--

LOCK TABLES `glpi_plugin_formcreator_sections` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_sections` DISABLE KEYS */;
INSERT INTO `glpi_plugin_formcreator_sections` VALUES (1,'Collocation',1,1,'749a0a43-59e7d068-5c66296f657b15.37184319'),(2,'Оборудование',1,2,'749a0a43-59e7d068-5c66314e6c3f37.85768777'),(3,'Сетевые настройки',1,3,'749a0a43-59e7d068-5c6648c5a24f76.24927260');
/*!40000 ALTER TABLE `glpi_plugin_formcreator_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_formcreator_targetchanges`
--

DROP TABLE IF EXISTS `glpi_plugin_formcreator_targetchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_formcreator_targetchanges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci,
  `impactcontent` longtext COLLATE utf8_unicode_ci,
  `controlistcontent` longtext COLLATE utf8_unicode_ci,
  `rolloutplancontent` longtext COLLATE utf8_unicode_ci,
  `backoutplancontent` longtext COLLATE utf8_unicode_ci,
  `checklistcontent` longtext COLLATE utf8_unicode_ci,
  `due_date_rule` enum('answer','change','calcul') COLLATE utf8_unicode_ci DEFAULT NULL,
  `due_date_question` int(11) DEFAULT NULL,
  `due_date_value` tinyint(4) DEFAULT NULL,
  `due_date_period` enum('minute','hour','day','month') COLLATE utf8_unicode_ci DEFAULT NULL,
  `urgency_rule` enum('none','specific','answer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `urgency_question` int(11) NOT NULL DEFAULT '0',
  `validation_followup` tinyint(1) NOT NULL DEFAULT '1',
  `destination_entity` enum('current','requester','requester_dynamic_first','requester_dynamic_last','form','validator','specific','user','entity') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'requester',
  `destination_entity_value` int(11) DEFAULT NULL,
  `tag_type` enum('none','questions','specifics','questions_and_specific','questions_or_specific') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `tag_questions` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tag_specifics` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_rule` enum('none','specific','answer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `category_question` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_formcreator_targetchanges`
--

LOCK TABLES `glpi_plugin_formcreator_targetchanges` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_targetchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_targetchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_formcreator_targetchanges_actors`
--

DROP TABLE IF EXISTS `glpi_plugin_formcreator_targetchanges_actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_formcreator_targetchanges_actors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_formcreator_targetchanges_id` int(11) NOT NULL,
  `actor_role` enum('requester','observer','assigned') COLLATE utf8_unicode_ci NOT NULL,
  `actor_type` enum('creator','validator','person','question_person','group','question_group','supplier','question_supplier') COLLATE utf8_unicode_ci NOT NULL,
  `actor_value` int(11) DEFAULT NULL,
  `use_notification` tinyint(1) NOT NULL DEFAULT '1',
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plugin_formcreator_targetchanges_id` (`plugin_formcreator_targetchanges_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_formcreator_targetchanges_actors`
--

LOCK TABLES `glpi_plugin_formcreator_targetchanges_actors` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_targetchanges_actors` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_targetchanges_actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_formcreator_targets`
--

DROP TABLE IF EXISTS `glpi_plugin_formcreator_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_formcreator_targets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_formcreator_forms_id` int(11) NOT NULL,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PluginFormcreatorTargetTicket',
  `items_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plugin_formcreator_forms_id` (`plugin_formcreator_forms_id`),
  KEY `itemtype_items_id` (`itemtype`,`items_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_formcreator_targets`
--

LOCK TABLES `glpi_plugin_formcreator_targets` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_targets` DISABLE KEYS */;
INSERT INTO `glpi_plugin_formcreator_targets` VALUES (1,1,'PluginFormcreatorTargetTicket',1,'Назначено','749a0a43-59e7d068-5c6647ed815fa6.38334138');
/*!40000 ALTER TABLE `glpi_plugin_formcreator_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_formcreator_targettickets`
--

DROP TABLE IF EXISTS `glpi_plugin_formcreator_targettickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_formcreator_targettickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tickettemplates_id` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `due_date_rule` enum('answer','ticket','calcul') COLLATE utf8_unicode_ci DEFAULT NULL,
  `due_date_question` int(11) DEFAULT NULL,
  `due_date_value` tinyint(4) DEFAULT NULL,
  `due_date_period` enum('minute','hour','day','month') COLLATE utf8_unicode_ci DEFAULT NULL,
  `urgency_rule` enum('none','specific','answer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `urgency_question` int(11) NOT NULL DEFAULT '0',
  `location_rule` enum('none','specific','answer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `location_question` int(11) NOT NULL DEFAULT '0',
  `validation_followup` tinyint(1) NOT NULL DEFAULT '1',
  `destination_entity` enum('current','requester','requester_dynamic_first','requester_dynamic_last','form','validator','specific','user','entity') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'current',
  `destination_entity_value` int(11) DEFAULT NULL,
  `tag_type` enum('none','questions','specifics','questions_and_specific','questions_or_specific') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `tag_questions` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tag_specifics` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_rule` enum('none','specific','answer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `category_question` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tickettemplates_id` (`tickettemplates_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_formcreator_targettickets`
--

LOCK TABLES `glpi_plugin_formcreator_targettickets` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_targettickets` DISABLE KEYS */;
INSERT INTO `glpi_plugin_formcreator_targettickets` VALUES (1,'Назначено',NULL,'##FULLFORM##',NULL,NULL,NULL,NULL,'none',0,'none',0,1,'current',NULL,'none','','','none',0);
/*!40000 ALTER TABLE `glpi_plugin_formcreator_targettickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_formcreator_targettickets_actors`
--

DROP TABLE IF EXISTS `glpi_plugin_formcreator_targettickets_actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_formcreator_targettickets_actors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_formcreator_targettickets_id` int(11) NOT NULL,
  `actor_role` enum('requester','observer','assigned') COLLATE utf8_unicode_ci NOT NULL,
  `actor_type` enum('creator','validator','person','question_person','group','question_group','supplier','question_supplier','question_actors') COLLATE utf8_unicode_ci NOT NULL,
  `actor_value` int(11) DEFAULT NULL,
  `use_notification` tinyint(1) NOT NULL DEFAULT '1',
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plugin_formcreator_targettickets_id` (`plugin_formcreator_targettickets_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_formcreator_targettickets_actors`
--

LOCK TABLES `glpi_plugin_formcreator_targettickets_actors` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_formcreator_targettickets_actors` DISABLE KEYS */;
INSERT INTO `glpi_plugin_formcreator_targettickets_actors` VALUES (1,1,'requester','creator',NULL,1,'749a0a43-59e7d068-5c6647ed7f2932.97443187'),(2,1,'observer','validator',NULL,1,'749a0a43-59e7d068-5c6647ed806da5.98987213');
/*!40000 ALTER TABLE `glpi_plugin_formcreator_targettickets_actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_genericobject_typefamilies`
--

DROP TABLE IF EXISTS `glpi_plugin_genericobject_typefamilies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_genericobject_typefamilies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_genericobject_typefamilies`
--

LOCK TABLES `glpi_plugin_genericobject_typefamilies` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_genericobject_typefamilies` DISABLE KEYS */;
INSERT INTO `glpi_plugin_genericobject_typefamilies` VALUES (1,'virtual','','2019-02-21 10:14:52','2019-02-21 10:14:52');
/*!40000 ALTER TABLE `glpi_plugin_genericobject_typefamilies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_genericobject_types`
--

DROP TABLE IF EXISTS `glpi_plugin_genericobject_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_genericobject_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `use_global_search` tinyint(1) NOT NULL DEFAULT '0',
  `use_unicity` tinyint(1) NOT NULL DEFAULT '0',
  `use_history` tinyint(1) NOT NULL DEFAULT '0',
  `use_infocoms` tinyint(1) NOT NULL DEFAULT '0',
  `use_contracts` tinyint(1) NOT NULL DEFAULT '0',
  `use_documents` tinyint(1) NOT NULL DEFAULT '0',
  `use_tickets` tinyint(1) NOT NULL DEFAULT '0',
  `use_links` tinyint(1) NOT NULL DEFAULT '0',
  `use_loans` tinyint(1) NOT NULL DEFAULT '0',
  `use_network_ports` tinyint(1) NOT NULL DEFAULT '0',
  `use_computervirtualmachines` tinyint(4) NOT NULL DEFAULT '0',
  `use_direct_connections` tinyint(1) NOT NULL DEFAULT '0',
  `use_plugin_datainjection` tinyint(1) NOT NULL DEFAULT '0',
  `use_plugin_pdf` tinyint(1) NOT NULL DEFAULT '0',
  `use_plugin_order` tinyint(1) NOT NULL DEFAULT '0',
  `use_plugin_uninstall` tinyint(1) NOT NULL DEFAULT '0',
  `use_plugin_geninventorynumber` tinyint(1) NOT NULL DEFAULT '0',
  `use_menu_entry` tinyint(1) NOT NULL DEFAULT '0',
  `use_projects` tinyint(1) NOT NULL DEFAULT '0',
  `linked_itemtypes` text COLLATE utf8_unicode_ci,
  `plugin_genericobject_typefamilies_id` int(11) NOT NULL DEFAULT '0',
  `use_notepad` tinyint(1) NOT NULL DEFAULT '0',
  `use_plugin_simcard` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Object types definition table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_genericobject_types`
--

LOCK TABLES `glpi_plugin_genericobject_types` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_genericobject_types` DISABLE KEYS */;
INSERT INTO `glpi_plugin_genericobject_types` VALUES (9,0,'PluginGenericobjectVpscmp',1,'vpscmp','','2019-03-01 10:24:17','2019-03-01 10:22:27',0,0,1,0,1,0,1,0,0,1,0,0,0,0,0,0,0,0,0,NULL,0,1,0);
/*!40000 ALTER TABLE `glpi_plugin_genericobject_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_genericobject_virtualmachines`
--

DROP TABLE IF EXISTS `glpi_plugin_genericobject_virtualmachines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_genericobject_virtualmachines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_genericobject_virtualmachines`
--

LOCK TABLES `glpi_plugin_genericobject_virtualmachines` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_genericobject_virtualmachines` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_genericobject_virtualmachines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_genericobject_vps_cpus`
--

DROP TABLE IF EXISTS `glpi_plugin_genericobject_vps_cpus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_genericobject_vps_cpus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_genericobject_vps_cpus`
--

LOCK TABLES `glpi_plugin_genericobject_vps_cpus` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_genericobject_vps_cpus` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_genericobject_vps_cpus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_genericobject_vps_emails`
--

DROP TABLE IF EXISTS `glpi_plugin_genericobject_vps_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_genericobject_vps_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_genericobject_vps_emails`
--

LOCK TABLES `glpi_plugin_genericobject_vps_emails` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_genericobject_vps_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_genericobject_vps_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_genericobject_vps_hdds`
--

DROP TABLE IF EXISTS `glpi_plugin_genericobject_vps_hdds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_genericobject_vps_hdds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_genericobject_vps_hdds`
--

LOCK TABLES `glpi_plugin_genericobject_vps_hdds` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_genericobject_vps_hdds` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_genericobject_vps_hdds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_genericobject_vps_memories`
--

DROP TABLE IF EXISTS `glpi_plugin_genericobject_vps_memories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_genericobject_vps_memories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_genericobject_vps_memories`
--

LOCK TABLES `glpi_plugin_genericobject_vps_memories` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_genericobject_vps_memories` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_genericobject_vps_memories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_genericobject_vps_os`
--

DROP TABLE IF EXISTS `glpi_plugin_genericobject_vps_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_genericobject_vps_os` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_genericobject_vps_os`
--

LOCK TABLES `glpi_plugin_genericobject_vps_os` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_genericobject_vps_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_genericobject_vps_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_genericobject_vpscmps`
--

DROP TABLE IF EXISTS `glpi_plugin_genericobject_vpscmps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_genericobject_vpscmps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notepad` text COLLATE utf8_unicode_ci,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contact_num` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugin_genericobject_vps_email_id` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `creationdate` date DEFAULT NULL,
  `expirationdate` date DEFAULT NULL,
  `states_id` int(11) NOT NULL DEFAULT '0',
  `domains_id` int(11) NOT NULL DEFAULT '0',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `is_helpdesk_visible` tinyint(1) DEFAULT NULL,
  `plugin_genericobject_vps_os_id` int(11) NOT NULL DEFAULT '0',
  `plugin_genericobject_vps_cpu_id` int(11) DEFAULT NULL,
  `plugin_genericobject_vps_memory_id` int(11) NOT NULL DEFAULT '0',
  `plugin_genericobject_vps_hdd_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='PluginGenericobjectVpscmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_genericobject_vpscmps`
--

LOCK TABLES `glpi_plugin_genericobject_vpscmps` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_genericobject_vpscmps` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_genericobject_vpscmps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_accountsections`
--

DROP TABLE IF EXISTS `glpi_plugin_order_accountsections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_accountsections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_accountsections`
--

LOCK TABLES `glpi_plugin_order_accountsections` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_accountsections` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_order_accountsections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_analyticnatures`
--

DROP TABLE IF EXISTS `glpi_plugin_order_analyticnatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_analyticnatures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_analyticnatures`
--

LOCK TABLES `glpi_plugin_order_analyticnatures` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_analyticnatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_order_analyticnatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_bills`
--

DROP TABLE IF EXISTS `glpi_plugin_order_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `number` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `billdate` datetime DEFAULT NULL,
  `validationdate` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `plugin_order_billstates_id` int(11) NOT NULL DEFAULT '0',
  `value` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `plugin_order_billtypes_id` int(11) NOT NULL DEFAULT '0',
  `suppliers_id` int(11) NOT NULL DEFAULT '0',
  `plugin_order_orders_id` int(11) NOT NULL DEFAULT '0',
  `users_id_validation` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` int(11) NOT NULL DEFAULT '0',
  `notepad` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_bills`
--

LOCK TABLES `glpi_plugin_order_bills` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_order_bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_billstates`
--

DROP TABLE IF EXISTS `glpi_plugin_order_billstates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_billstates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_billstates`
--

LOCK TABLES `glpi_plugin_order_billstates` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_billstates` DISABLE KEYS */;
INSERT INTO `glpi_plugin_order_billstates` VALUES (1,'Оплачено',NULL),(2,'Не оплачено',NULL);
/*!40000 ALTER TABLE `glpi_plugin_order_billstates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_billtypes`
--

DROP TABLE IF EXISTS `glpi_plugin_order_billtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_billtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_billtypes`
--

LOCK TABLES `glpi_plugin_order_billtypes` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_billtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_order_billtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_configs`
--

DROP TABLE IF EXISTS `glpi_plugin_order_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `use_validation` tinyint(1) NOT NULL DEFAULT '0',
  `use_supplier_satisfaction` tinyint(1) NOT NULL DEFAULT '0',
  `use_supplier_informations` tinyint(1) NOT NULL DEFAULT '0',
  `use_supplier_infos` tinyint(1) NOT NULL DEFAULT '1',
  `generate_order_pdf` tinyint(1) NOT NULL DEFAULT '0',
  `copy_documents` tinyint(1) NOT NULL DEFAULT '0',
  `default_taxes` int(11) NOT NULL DEFAULT '0',
  `generate_assets` int(11) NOT NULL DEFAULT '0',
  `generated_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generated_serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generated_otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_asset_states_id` int(11) NOT NULL DEFAULT '0',
  `tickettemplates_id_delivery` int(11) NOT NULL DEFAULT '0',
  `order_status_draft` int(11) NOT NULL DEFAULT '0',
  `order_status_waiting_approval` int(11) NOT NULL DEFAULT '0',
  `order_status_approved` int(11) NOT NULL DEFAULT '0',
  `order_status_partially_delivred` int(11) NOT NULL DEFAULT '0',
  `order_status_completly_delivered` int(11) NOT NULL DEFAULT '0',
  `order_status_canceled` int(11) NOT NULL DEFAULT '0',
  `order_status_paid` int(11) NOT NULL DEFAULT '0',
  `order_analyticnature_display` int(11) NOT NULL DEFAULT '0',
  `order_analyticnature_mandatory` int(11) NOT NULL DEFAULT '0',
  `order_accountsection_display` int(11) NOT NULL DEFAULT '0',
  `order_accountsection_mandatory` int(11) NOT NULL DEFAULT '0',
  `shoudbedelivered_color` char(20) COLLATE utf8_unicode_ci DEFAULT '#ff5555',
  `documentcategories_id` int(11) NOT NULL DEFAULT '0',
  `groups_id_author` int(11) NOT NULL DEFAULT '0',
  `groups_id_recipient` int(11) NOT NULL DEFAULT '0',
  `users_id_recipient` int(11) NOT NULL DEFAULT '0',
  `add_location` tinyint(1) NOT NULL DEFAULT '0',
  `add_bill_details` tinyint(1) NOT NULL DEFAULT '0',
  `hide_inactive_budgets` tinyint(1) NOT NULL DEFAULT '0',
  `rename_documents` tinyint(1) NOT NULL DEFAULT '0',
  `transmit_budget_change` tinyint(1) NOT NULL DEFAULT '0',
  `use_free_reference` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_configs`
--

LOCK TABLES `glpi_plugin_order_configs` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_configs` DISABLE KEYS */;
INSERT INTO `glpi_plugin_order_configs` VALUES (1,1,0,0,1,1,0,4,0,'TOBEFILLED','TOBEFILLED','TOBEFILLED',0,0,2,2,3,0,5,6,7,1,0,0,0,'#ff5555',0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `glpi_plugin_order_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_deliverystates`
--

DROP TABLE IF EXISTS `glpi_plugin_order_deliverystates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_deliverystates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_deliverystates`
--

LOCK TABLES `glpi_plugin_order_deliverystates` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_deliverystates` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_order_deliverystates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_documentcategories`
--

DROP TABLE IF EXISTS `glpi_plugin_order_documentcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_documentcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documentcategories_id` int(11) NOT NULL DEFAULT '0',
  `documentcategories_prefix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`documentcategories_id`,`documentcategories_prefix`),
  KEY `documentcategories_id` (`documentcategories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_documentcategories`
--

LOCK TABLES `glpi_plugin_order_documentcategories` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_documentcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_order_documentcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_orderpayments`
--

DROP TABLE IF EXISTS `glpi_plugin_order_orderpayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_orderpayments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_orderpayments`
--

LOCK TABLES `glpi_plugin_order_orderpayments` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_orderpayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_order_orderpayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_orders`
--

DROP TABLE IF EXISTS `glpi_plugin_order_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num_order` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `budgets_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_budgets (id)',
  `plugin_order_ordertaxes_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_plugin_order_ordertaxes (id)',
  `plugin_order_orderpayments_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_plugin_order_orderpayments (id)',
  `order_date` date DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `deliverydate` date DEFAULT NULL,
  `is_late` tinyint(1) NOT NULL DEFAULT '0',
  `suppliers_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_suppliers (id)',
  `contacts_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_contacts (id)',
  `plugin_order_accountsections_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to plugin_order_accountsections (id)',
  `locations_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_locations (id)',
  `plugin_order_orderstates_id` int(11) NOT NULL DEFAULT '1',
  `plugin_order_billstates_id` int(11) NOT NULL DEFAULT '1',
  `port_price` float NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `notepad` longtext COLLATE utf8_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `users_id_delivery` int(11) NOT NULL DEFAULT '0',
  `groups_id_delivery` int(11) NOT NULL DEFAULT '0',
  `plugin_order_ordertypes_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_plugin_order_ordertypes (id)',
  `date_mod` datetime DEFAULT NULL,
  `is_helpdesk_visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `plugin_order_ordertaxes_id` (`plugin_order_ordertaxes_id`),
  KEY `plugin_order_orderpayments_id` (`plugin_order_orderpayments_id`),
  KEY `states_id` (`plugin_order_orderstates_id`),
  KEY `suppliers_id` (`suppliers_id`),
  KEY `contacts_id` (`contacts_id`),
  KEY `plugin_order_accountsections_id` (`plugin_order_accountsections_id`),
  KEY `locations_id` (`locations_id`),
  KEY `is_late` (`locations_id`),
  KEY `is_template` (`is_template`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_orders`
--

LOCK TABLES `glpi_plugin_order_orders` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_order_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_orders_items`
--

DROP TABLE IF EXISTS `glpi_plugin_order_orders_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_orders_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `plugin_order_orders_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_plugin_order_orders (id)',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'see .class.php file',
  `items_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to various tables, according to itemtype (id)',
  `plugin_order_references_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_plugin_order_references (id)',
  `plugin_order_deliverystates_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_plugin_order_deliverystates (id)',
  `plugin_order_ordertaxes_id` float NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_plugin_order_ordertaxes (id)',
  `plugin_order_analyticnatures_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to plugin_order_analyticnatures (id)',
  `delivery_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_comment` text COLLATE utf8_unicode_ci,
  `price_taxfree` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `price_discounted` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `discount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `price_ati` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `states_id` int(11) NOT NULL DEFAULT '1',
  `delivery_date` date DEFAULT NULL,
  `plugin_order_bills_id` int(11) NOT NULL DEFAULT '0',
  `plugin_order_billstates_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `FK_device` (`items_id`,`itemtype`),
  KEY `entities_id` (`entities_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `plugin_order_references_id` (`plugin_order_references_id`),
  KEY `plugin_order_deliverystates_id` (`plugin_order_deliverystates_id`),
  KEY `plugin_order_analyticnatures_id` (`plugin_order_analyticnatures_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_orders_items`
--

LOCK TABLES `glpi_plugin_order_orders_items` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_orders_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_order_orders_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_orders_suppliers`
--

DROP TABLE IF EXISTS `glpi_plugin_order_orders_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_orders_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `plugin_order_orders_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_plugin_order_orders (id)',
  `suppliers_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_suppliers (id)',
  `num_quote` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num_order` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plugin_order_orders_id` (`plugin_order_orders_id`),
  KEY `entities_id` (`entities_id`),
  KEY `suppliers_id` (`suppliers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_orders_suppliers`
--

LOCK TABLES `glpi_plugin_order_orders_suppliers` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_orders_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_order_orders_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_orderstates`
--

DROP TABLE IF EXISTS `glpi_plugin_order_orderstates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_orderstates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_orderstates`
--

LOCK TABLES `glpi_plugin_order_orderstates` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_orderstates` DISABLE KEYS */;
INSERT INTO `glpi_plugin_order_orderstates` VALUES (1,'Черновик',NULL),(2,'Ожидание утверждения',NULL),(3,'Проверено',NULL),(4,'Отправляющийся',NULL),(5,'Доставлено',NULL),(6,'Отменено',NULL),(7,'Оплачено',NULL);
/*!40000 ALTER TABLE `glpi_plugin_order_orderstates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_ordertaxes`
--

DROP TABLE IF EXISTS `glpi_plugin_order_ordertaxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_ordertaxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_ordertaxes`
--

LOCK TABLES `glpi_plugin_order_ordertaxes` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_ordertaxes` DISABLE KEYS */;
INSERT INTO `glpi_plugin_order_ordertaxes` VALUES (1,'20',NULL),(2,'5.5',NULL),(3,'19.6',NULL),(4,'12','');
/*!40000 ALTER TABLE `glpi_plugin_order_ordertaxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_ordertypes`
--

DROP TABLE IF EXISTS `glpi_plugin_order_ordertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_ordertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_ordertypes`
--

LOCK TABLES `glpi_plugin_order_ordertypes` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_ordertypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_order_ordertypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_others`
--

DROP TABLE IF EXISTS `glpi_plugin_order_others`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_others` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `othertypes_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `othertypes_id` (`othertypes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_others`
--

LOCK TABLES `glpi_plugin_order_others` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_others` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_order_others` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_othertypes`
--

DROP TABLE IF EXISTS `glpi_plugin_order_othertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_othertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_othertypes`
--

LOCK TABLES `glpi_plugin_order_othertypes` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_othertypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_order_othertypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_preferences`
--

DROP TABLE IF EXISTS `glpi_plugin_order_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sign` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_preferences`
--

LOCK TABLES `glpi_plugin_order_preferences` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_order_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_referencefrees`
--

DROP TABLE IF EXISTS `glpi_plugin_order_referencefrees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_referencefrees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `plugin_order_orders_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_plugin_order_orders (id)',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_manufacturers (id)',
  `manufacturers_reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'see .class.php file',
  `templates_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to various tables, according to itemtype (id)',
  `comment` text COLLATE utf8_unicode_ci,
  `price_taxfree` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `price_discounted` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `discount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `price_ati` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `states_id` int(11) NOT NULL DEFAULT '1',
  `delivery_date` date DEFAULT NULL,
  `plugin_order_ordertaxes_id` float NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_plugin_order_ordertaxes (id)',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `notepad` longtext COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `templates_id` (`templates_id`),
  KEY `plugin_order_ordertaxes_id` (`plugin_order_ordertaxes_id`),
  KEY `states_id` (`states_id`),
  KEY `is_active` (`is_active`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_referencefrees`
--

LOCK TABLES `glpi_plugin_order_referencefrees` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_referencefrees` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_order_referencefrees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_references`
--

DROP TABLE IF EXISTS `glpi_plugin_order_references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_references` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_manufacturers (id)',
  `manufacturers_reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `types_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to various tables, according to itemtypes tables (id)',
  `models_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to various tables, according to itemmodels tables (id)',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'see .class.php file',
  `templates_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to various tables, according to itemtype (id)',
  `comment` text COLLATE utf8_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `notepad` longtext COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `types_id` (`types_id`),
  KEY `models_id` (`models_id`),
  KEY `templates_id` (`templates_id`),
  KEY `is_active` (`is_active`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_references`
--

LOCK TABLES `glpi_plugin_order_references` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_references` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_order_references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_references_suppliers`
--

DROP TABLE IF EXISTS `glpi_plugin_order_references_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_references_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `plugin_order_references_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_plugin_order_references (id)',
  `suppliers_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_suppliers (id)',
  `price_taxfree` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `reference_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `plugin_order_references_id` (`plugin_order_references_id`),
  KEY `suppliers_id` (`suppliers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_references_suppliers`
--

LOCK TABLES `glpi_plugin_order_references_suppliers` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_references_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_order_references_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_order_surveysuppliers`
--

DROP TABLE IF EXISTS `glpi_plugin_order_surveysuppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_order_surveysuppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `plugin_order_orders_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_plugin_order_orders (id)',
  `suppliers_id` int(11) NOT NULL DEFAULT '0' COMMENT 'RELATION to glpi_suppliers (id)',
  `answer1` int(11) NOT NULL DEFAULT '0',
  `answer2` int(11) NOT NULL DEFAULT '0',
  `answer3` int(11) NOT NULL DEFAULT '0',
  `answer4` int(11) NOT NULL DEFAULT '0',
  `answer5` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `plugin_order_orders_id` (`plugin_order_orders_id`),
  KEY `entities_id` (`entities_id`),
  KEY `suppliers_id` (`suppliers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_order_surveysuppliers`
--

LOCK TABLES `glpi_plugin_order_surveysuppliers` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_order_surveysuppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_order_surveysuppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_satisfaction_surveyanswers`
--

DROP TABLE IF EXISTS `glpi_plugin_satisfaction_surveyanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_satisfaction_surveyanswers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `plugin_satisfaction_surveys_id` int(11) NOT NULL,
  `ticketsatisfactions_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_satisfaction_surveyanswers`
--

LOCK TABLES `glpi_plugin_satisfaction_surveyanswers` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_satisfaction_surveyanswers` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_satisfaction_surveyanswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_satisfaction_surveyquestions`
--

DROP TABLE IF EXISTS `glpi_plugin_satisfaction_surveyquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_satisfaction_surveyquestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_satisfaction_surveys_id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `number` int(11) NOT NULL DEFAULT '0',
  `default_value` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_satisfaction_surveyquestions`
--

LOCK TABLES `glpi_plugin_satisfaction_surveyquestions` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_satisfaction_surveyquestions` DISABLE KEYS */;
INSERT INTO `glpi_plugin_satisfaction_surveyquestions` VALUES (1,1,'Кол-во процессоров','textarea','',2,1),(2,1,'Включен','yesno','',2,1);
/*!40000 ALTER TABLE `glpi_plugin_satisfaction_surveyquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_satisfaction_surveys`
--

DROP TABLE IF EXISTS `glpi_plugin_satisfaction_surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_satisfaction_surveys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_creation` date DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_satisfaction_surveys`
--

LOCK TABLES `glpi_plugin_satisfaction_surveys` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_satisfaction_surveys` DISABLE KEYS */;
INSERT INTO `glpi_plugin_satisfaction_surveys` VALUES (1,0,0,1,'Satisfaction опрос','','2019-02-15','2019-02-15 02:49:48');
/*!40000 ALTER TABLE `glpi_plugin_satisfaction_surveys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_telegrambot_botan_shortener`
--

DROP TABLE IF EXISTS `glpi_plugin_telegrambot_botan_shortener`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_telegrambot_botan_shortener` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier for this entry',
  `user_id` bigint(20) DEFAULT NULL COMMENT 'Unique user identifier',
  `url` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Original URL',
  `short_url` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Shortened URL',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Entry date creation',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_telegrambot_botan_shortener`
--

LOCK TABLES `glpi_plugin_telegrambot_botan_shortener` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_botan_shortener` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_botan_shortener` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_telegrambot_callback_query`
--

DROP TABLE IF EXISTS `glpi_plugin_telegrambot_callback_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_telegrambot_callback_query` (
  `id` bigint(20) unsigned NOT NULL COMMENT 'Unique identifier for this query',
  `user_id` bigint(20) DEFAULT NULL COMMENT 'Unique user identifier',
  `chat_id` bigint(20) DEFAULT NULL COMMENT 'Unique chat identifier',
  `message_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Unique message identifier',
  `inline_message_id` char(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Identifier of the message sent via the bot in inline mode, that originated the query',
  `data` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Data associated with the callback button',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Entry date creation',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `chat_id` (`chat_id`),
  KEY `message_id` (`message_id`),
  KEY `chat_id_2` (`chat_id`,`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_telegrambot_callback_query`
--

LOCK TABLES `glpi_plugin_telegrambot_callback_query` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_callback_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_callback_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_telegrambot_chat`
--

DROP TABLE IF EXISTS `glpi_plugin_telegrambot_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_telegrambot_chat` (
  `id` bigint(20) NOT NULL COMMENT 'Unique user or chat identifier',
  `type` enum('private','group','supergroup','channel') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Chat type, either private, group, supergroup or channel',
  `title` char(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'Chat (group) title, is null if chat type is private',
  `username` char(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Username, for private chats, supergroups and channels if available',
  `all_members_are_administrators` tinyint(1) DEFAULT '0' COMMENT 'True if a all members of this group are admins',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Entry date creation',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Entry date update',
  `old_id` bigint(20) DEFAULT NULL COMMENT 'Unique chat identifier, this is filled when a group is converted to a supergroup',
  PRIMARY KEY (`id`),
  KEY `old_id` (`old_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_telegrambot_chat`
--

LOCK TABLES `glpi_plugin_telegrambot_chat` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_telegrambot_chosen_inline_result`
--

DROP TABLE IF EXISTS `glpi_plugin_telegrambot_chosen_inline_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_telegrambot_chosen_inline_result` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier for this entry',
  `result_id` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Identifier for this result',
  `user_id` bigint(20) DEFAULT NULL COMMENT 'Unique user identifier',
  `location` char(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Location object, user''s location',
  `inline_message_id` char(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Identifier of the sent inline message',
  `query` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'The query that was used to obtain the result',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Entry date creation',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_telegrambot_chosen_inline_result`
--

LOCK TABLES `glpi_plugin_telegrambot_chosen_inline_result` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_chosen_inline_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_chosen_inline_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_telegrambot_conversation`
--

DROP TABLE IF EXISTS `glpi_plugin_telegrambot_conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_telegrambot_conversation` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier for this entry',
  `user_id` bigint(20) DEFAULT NULL COMMENT 'Unique user identifier',
  `chat_id` bigint(20) DEFAULT NULL COMMENT 'Unique user or chat identifier',
  `status` enum('active','cancelled','stopped') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active' COMMENT 'Conversation state',
  `command` varchar(160) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'Default command to execute',
  `notes` text COLLATE utf8_unicode_ci COMMENT 'Data stored from command',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Entry date creation',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Entry date update',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `chat_id` (`chat_id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_telegrambot_conversation`
--

LOCK TABLES `glpi_plugin_telegrambot_conversation` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_conversation` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_telegrambot_edited_message`
--

DROP TABLE IF EXISTS `glpi_plugin_telegrambot_edited_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_telegrambot_edited_message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier for this entry',
  `chat_id` bigint(20) DEFAULT NULL COMMENT 'Unique chat identifier',
  `message_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Unique message identifier',
  `user_id` bigint(20) DEFAULT NULL COMMENT 'Unique user identifier',
  `edit_date` timestamp NULL DEFAULT NULL COMMENT 'Date the message was edited in timestamp format',
  `text` text COLLATE utf8_unicode_ci COMMENT 'For text messages, the actual UTF-8 text of the message max message length 4096 char utf8',
  `entities` text COLLATE utf8_unicode_ci COMMENT 'For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text',
  `caption` text COLLATE utf8_unicode_ci COMMENT 'For message with caption, the actual UTF-8 text of the caption',
  PRIMARY KEY (`id`),
  KEY `chat_id` (`chat_id`),
  KEY `message_id` (`message_id`),
  KEY `user_id` (`user_id`),
  KEY `chat_id_2` (`chat_id`,`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_telegrambot_edited_message`
--

LOCK TABLES `glpi_plugin_telegrambot_edited_message` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_edited_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_edited_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_telegrambot_inline_query`
--

DROP TABLE IF EXISTS `glpi_plugin_telegrambot_inline_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_telegrambot_inline_query` (
  `id` bigint(20) unsigned NOT NULL COMMENT 'Unique identifier for this query',
  `user_id` bigint(20) DEFAULT NULL COMMENT 'Unique user identifier',
  `location` char(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Location of the user',
  `query` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Text of the query',
  `offset` char(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Offset of the result',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Entry date creation',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_telegrambot_inline_query`
--

LOCK TABLES `glpi_plugin_telegrambot_inline_query` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_inline_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_inline_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_telegrambot_message`
--

DROP TABLE IF EXISTS `glpi_plugin_telegrambot_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_telegrambot_message` (
  `chat_id` bigint(20) NOT NULL COMMENT 'Unique chat identifier',
  `id` bigint(20) unsigned NOT NULL COMMENT 'Unique message identifier',
  `user_id` bigint(20) DEFAULT NULL COMMENT 'Unique user identifier',
  `date` timestamp NULL DEFAULT NULL COMMENT 'Date the message was sent in timestamp format',
  `forward_from` bigint(20) DEFAULT NULL COMMENT 'Unique user identifier, sender of the original message',
  `forward_from_chat` bigint(20) DEFAULT NULL COMMENT 'Unique chat identifier, chat the original message belongs to',
  `forward_from_message_id` bigint(20) DEFAULT NULL COMMENT 'Unique chat identifier of the original message in the channel',
  `forward_date` timestamp NULL DEFAULT NULL COMMENT 'date the original message was sent in timestamp format',
  `reply_to_chat` bigint(20) DEFAULT NULL COMMENT 'Unique chat identifier',
  `reply_to_message` bigint(20) unsigned DEFAULT NULL COMMENT 'Message that this message is reply to',
  `text` text COLLATE utf8_unicode_ci COMMENT 'For text messages, the actual UTF-8 text of the message max message length 4096 char utf8mb4',
  `entities` text COLLATE utf8_unicode_ci COMMENT 'For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text',
  `audio` text COLLATE utf8_unicode_ci COMMENT 'Audio object. Message is an audio file, information about the file',
  `document` text COLLATE utf8_unicode_ci COMMENT 'Document object. Message is a general file, information about the file',
  `photo` text COLLATE utf8_unicode_ci COMMENT 'Array of PhotoSize objects. Message is a photo, available sizes of the photo',
  `sticker` text COLLATE utf8_unicode_ci COMMENT 'Sticker object. Message is a sticker, information about the sticker',
  `video` text COLLATE utf8_unicode_ci COMMENT 'Video object. Message is a video, information about the video',
  `voice` text COLLATE utf8_unicode_ci COMMENT 'Voice Object. Message is a Voice, information about the Voice',
  `video_note` text COLLATE utf8_unicode_ci COMMENT 'VoiceNote Object. Message is a Video Note, information about the Video Note',
  `contact` text COLLATE utf8_unicode_ci COMMENT 'Contact object. Message is a shared contact, information about the contact',
  `location` text COLLATE utf8_unicode_ci COMMENT 'Location object. Message is a shared location, information about the location',
  `venue` text COLLATE utf8_unicode_ci COMMENT 'Venue object. Message is a Venue, information about the Venue',
  `caption` text COLLATE utf8_unicode_ci COMMENT 'For message with caption, the actual UTF-8 text of the caption',
  `new_chat_members` text COLLATE utf8_unicode_ci COMMENT 'List of unique user identifiers, new member(s) were added to the group, information about them (one of these members may be the bot itself)',
  `left_chat_member` bigint(20) DEFAULT NULL COMMENT 'Unique user identifier, a member was removed from the group, information about them (this member may be the bot itself)',
  `new_chat_title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'A chat title was changed to this value',
  `new_chat_photo` text COLLATE utf8_unicode_ci COMMENT 'Array of PhotoSize objects. A chat photo was change to this value',
  `delete_chat_photo` tinyint(1) DEFAULT '0' COMMENT 'Informs that the chat photo was deleted',
  `group_chat_created` tinyint(1) DEFAULT '0' COMMENT 'Informs that the group has been created',
  `supergroup_chat_created` tinyint(1) DEFAULT '0' COMMENT 'Informs that the supergroup has been created',
  `channel_chat_created` tinyint(1) DEFAULT '0' COMMENT 'Informs that the channel chat has been created',
  `migrate_to_chat_id` bigint(20) DEFAULT NULL COMMENT 'Migrate to chat identifier. The group has been migrated to a supergroup with the specified identifier',
  `migrate_from_chat_id` bigint(20) DEFAULT NULL COMMENT 'Migrate from chat identifier. The supergroup has been migrated from a group with the specified identifier',
  `pinned_message` text COLLATE utf8_unicode_ci COMMENT 'Message object. Specified message was pinned',
  PRIMARY KEY (`chat_id`,`id`),
  KEY `user_id` (`user_id`),
  KEY `forward_from` (`forward_from`),
  KEY `forward_from_chat` (`forward_from_chat`),
  KEY `reply_to_chat` (`reply_to_chat`),
  KEY `reply_to_message` (`reply_to_message`),
  KEY `left_chat_member` (`left_chat_member`),
  KEY `migrate_from_chat_id` (`migrate_from_chat_id`),
  KEY `migrate_to_chat_id` (`migrate_to_chat_id`),
  KEY `reply_to_chat_2` (`reply_to_chat`,`reply_to_message`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_telegrambot_message`
--

LOCK TABLES `glpi_plugin_telegrambot_message` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_telegrambot_request_limiter`
--

DROP TABLE IF EXISTS `glpi_plugin_telegrambot_request_limiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_telegrambot_request_limiter` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier for this entry',
  `chat_id` char(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Unique chat identifier',
  `inline_message_id` char(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Identifier of the sent inline message',
  `method` char(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Request method',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Entry date creation',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_telegrambot_request_limiter`
--

LOCK TABLES `glpi_plugin_telegrambot_request_limiter` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_request_limiter` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_request_limiter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_telegrambot_telegram_update`
--

DROP TABLE IF EXISTS `glpi_plugin_telegrambot_telegram_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_telegrambot_telegram_update` (
  `id` bigint(20) unsigned NOT NULL COMMENT 'Update''s unique identifier',
  `chat_id` bigint(20) DEFAULT NULL COMMENT 'Unique chat identifier',
  `message_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Unique message identifier',
  `inline_query_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Unique inline query identifier',
  `chosen_inline_result_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Local chosen inline result identifier',
  `callback_query_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Unique callback query identifier',
  `edited_message_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Local edited message identifier',
  PRIMARY KEY (`id`),
  KEY `message_id` (`chat_id`,`message_id`),
  KEY `inline_query_id` (`inline_query_id`),
  KEY `chosen_inline_result_id` (`chosen_inline_result_id`),
  KEY `callback_query_id` (`callback_query_id`),
  KEY `edited_message_id` (`edited_message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_telegrambot_telegram_update`
--

LOCK TABLES `glpi_plugin_telegrambot_telegram_update` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_telegram_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_telegram_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_telegrambot_user`
--

DROP TABLE IF EXISTS `glpi_plugin_telegrambot_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_telegrambot_user` (
  `id` bigint(20) NOT NULL COMMENT 'Unique user identifier',
  `is_bot` tinyint(1) DEFAULT '0' COMMENT 'True if this user is a bot',
  `first_name` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'User''s first name',
  `last_name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'User''s last name',
  `username` char(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'User''s username',
  `language_code` char(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'User''s system language',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Entry date creation',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Entry date update',
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_telegrambot_user`
--

LOCK TABLES `glpi_plugin_telegrambot_user` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_telegrambot_user_chat`
--

DROP TABLE IF EXISTS `glpi_plugin_telegrambot_user_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_telegrambot_user_chat` (
  `user_id` bigint(20) NOT NULL COMMENT 'Unique user identifier',
  `chat_id` bigint(20) NOT NULL COMMENT 'Unique user or chat identifier',
  PRIMARY KEY (`user_id`,`chat_id`),
  KEY `chat_id` (`chat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_telegrambot_user_chat`
--

LOCK TABLES `glpi_plugin_telegrambot_user_chat` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_user_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_user_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_telegrambot_users`
--

DROP TABLE IF EXISTS `glpi_plugin_telegrambot_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_telegrambot_users` (
  `id` bigint(20) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_telegrambot_users`
--

LOCK TABLES `glpi_plugin_telegrambot_users` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_telegrambot_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_uninstall_models`
--

DROP TABLE IF EXISTS `glpi_plugin_uninstall_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_uninstall_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `transfers_id` int(11) NOT NULL,
  `states_id` int(11) NOT NULL,
  `raz_name` int(1) NOT NULL DEFAULT '1',
  `raz_contact` int(1) NOT NULL DEFAULT '1',
  `raz_contact_num` int(1) NOT NULL DEFAULT '1',
  `raz_ip` int(1) NOT NULL DEFAULT '1',
  `raz_os` int(1) NOT NULL DEFAULT '1',
  `raz_domain` int(1) NOT NULL DEFAULT '1',
  `raz_network` int(1) NOT NULL DEFAULT '1',
  `raz_history` int(1) NOT NULL DEFAULT '1',
  `raz_soft_history` int(1) NOT NULL DEFAULT '1',
  `raz_budget` int(1) NOT NULL DEFAULT '1',
  `raz_antivirus` int(1) NOT NULL DEFAULT '1',
  `raz_user` int(1) NOT NULL DEFAULT '1',
  `raz_ocs_registrykeys` int(1) NOT NULL DEFAULT '1',
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `remove_from_ocs` int(1) NOT NULL DEFAULT '0',
  `delete_ocs_link` int(1) NOT NULL DEFAULT '0',
  `types_id` int(11) NOT NULL DEFAULT '0',
  `replace_name` tinyint(1) NOT NULL DEFAULT '0',
  `replace_serial` tinyint(1) NOT NULL DEFAULT '0',
  `replace_otherserial` tinyint(1) NOT NULL DEFAULT '0',
  `replace_documents` tinyint(1) NOT NULL DEFAULT '0',
  `replace_contracts` tinyint(1) NOT NULL DEFAULT '0',
  `replace_infocoms` tinyint(1) NOT NULL DEFAULT '0',
  `replace_reservations` tinyint(1) NOT NULL DEFAULT '0',
  `replace_users` tinyint(1) NOT NULL DEFAULT '0',
  `replace_groups` tinyint(1) NOT NULL DEFAULT '0',
  `replace_tickets` tinyint(1) NOT NULL DEFAULT '0',
  `replace_netports` tinyint(1) NOT NULL DEFAULT '0',
  `replace_direct_connections` tinyint(1) NOT NULL DEFAULT '0',
  `overwrite` tinyint(1) NOT NULL DEFAULT '0',
  `replace_method` int(11) NOT NULL DEFAULT '2',
  `raz_fusioninventory` int(1) NOT NULL DEFAULT '1',
  `raz_plugin_fields` tinyint(1) NOT NULL DEFAULT '1',
  `replace_contact` tinyint(1) NOT NULL DEFAULT '0',
  `replace_contact_num` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_uninstall_models`
--

LOCK TABLES `glpi_plugin_uninstall_models` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_uninstall_models` DISABLE KEYS */;
INSERT INTO `glpi_plugin_uninstall_models` VALUES (1,0,1,'Uninstall',2,0,1,1,1,1,1,1,1,1,1,1,1,1,1,'',0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,2,1,1,1,1),(2,0,1,'Replace',2,0,1,1,1,1,1,1,1,1,1,1,1,1,1,'',0,0,0,2,1,1,1,1,1,1,1,1,1,1,1,1,0,2,1,1,1,1);
/*!40000 ALTER TABLE `glpi_plugin_uninstall_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_uninstall_preferences`
--

DROP TABLE IF EXISTS `glpi_plugin_uninstall_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_uninstall_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `entities_id` int(11) DEFAULT '0',
  `templates_id` int(11) DEFAULT '0',
  `locations_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_uninstall_preferences`
--

LOCK TABLES `glpi_plugin_uninstall_preferences` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_uninstall_preferences` DISABLE KEYS */;
INSERT INTO `glpi_plugin_uninstall_preferences` VALUES (1,2,0,2,-1),(2,2,0,1,-1);
/*!40000 ALTER TABLE `glpi_plugin_uninstall_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_uninstall_profiles`
--

DROP TABLE IF EXISTS `glpi_plugin_uninstall_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_uninstall_profiles` (
  `id` int(11) NOT NULL DEFAULT '0',
  `profile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `use` varchar(1) COLLATE utf8_unicode_ci DEFAULT '',
  `replace` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_uninstall_profiles`
--

LOCK TABLES `glpi_plugin_uninstall_profiles` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_uninstall_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_uninstall_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_useditemsexport_configs`
--

DROP TABLE IF EXISTS `glpi_plugin_useditemsexport_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_useditemsexport_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `footer_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `orientation` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `format` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A4',
  `language` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fr',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_useditemsexport_configs`
--

LOCK TABLES `glpi_plugin_useditemsexport_configs` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_useditemsexport_configs` DISABLE KEYS */;
INSERT INTO `glpi_plugin_useditemsexport_configs` VALUES (1,'',1,'P','A4','en');
/*!40000 ALTER TABLE `glpi_plugin_useditemsexport_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugin_useditemsexport_exports`
--

DROP TABLE IF EXISTS `glpi_plugin_useditemsexport_exports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugin_useditemsexport_exports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `num` smallint(2) NOT NULL DEFAULT '0',
  `refnumber` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0000-0000',
  `authors_id` int(11) NOT NULL DEFAULT '0',
  `documents_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugin_useditemsexport_exports`
--

LOCK TABLES `glpi_plugin_useditemsexport_exports` WRITE;
/*!40000 ALTER TABLE `glpi_plugin_useditemsexport_exports` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugin_useditemsexport_exports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugins`
--

DROP TABLE IF EXISTS `glpi_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `directory` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0' COMMENT 'see define.php PLUGIN_* constant',
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `homepage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`directory`),
  KEY `state` (`state`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugins`
--

LOCK TABLES `glpi_plugins` WRITE;
/*!40000 ALTER TABLE `glpi_plugins` DISABLE KEYS */;
INSERT INTO `glpi_plugins` VALUES (2,'dashboard','Панель отчетов','0.9.5',4,'<a href=\"mailto:stevenesdonato@gmail.com\"> Stevenes Donato </b> </a>','https://forge.glpi-project.org/projects/dashboard','GPLv2+'),(3,'formcreator','Формы','2.7.0',4,'<a href=\"http://www.teclib.com\">Teclib\'</a>','https://github.com/pluginsGLPI/formcreator','<a href=\"../plugins/formcreator/LICENSE\" target=\"_blank\">GPLv2</a>'),(4,'uninstall','Item\'s Lifecycle (uninstall)','2.6.0',4,'Walid Nouh, François Legastelois, Remi Collet','https://github.com/pluginsGLPI/uninstall','GPLv2+'),(5,'datainjection','Вложить файл','2.7.0',4,'Walid Nouh, Remi Collet, Nelly Mahu-Lasson, Xavier Caillaud','https://github.com/pluginsGLPI/datainjection','GPLv2+'),(6,'satisfaction','Больше вопросов для оценки удовлетворения','1.4.0',4,'<a href=\'www.teclib.com\'>TECLIB\'</a>, <a href=\'http://infotel.com/services/expertise-technique/glpi/\'>Infotel</a>','https://github.com/pluginsGLPI/satisfaction','GPLv2+'),(7,'example','Plugin Example','7.1',4,'GLPI developer team','https://github.com/pluginsGLPI/example','GPLv2+'),(8,'fields','Дополнительные поля','1.9.1',1,'Teclib\', Olivier Moron','teclib.com','GPLv2+'),(9,'telegrambot','TelegramBot','2.0.0',4,'<a href=\"http://trulymanager.com\" target=\"_blank\">Truly Systems</a>','https://github.com/pluginsGLPI/telegrambot','GPLv2+'),(10,'useditemsexport','Used items export','2.2.0',4,'TECLIB','https://github.com/pluginsGLPI/useditemsexport','GPLv2+'),(13,'genericobject','Управление объектами','2.7.0',1,'<a href=\"mailto:contact@teclib.com\">Teclib\'</a> & siprossii','https://github.com/pluginsGLPI/genericobject','GPLv2+');
/*!40000 ALTER TABLE `glpi_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugs`
--

DROP TABLE IF EXISTS `glpi_plugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugs`
--

LOCK TABLES `glpi_plugs` WRITE;
/*!40000 ALTER TABLE `glpi_plugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_printermodels`
--

DROP TABLE IF EXISTS `glpi_printermodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_printermodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_printermodels`
--

LOCK TABLES `glpi_printermodels` WRITE;
/*!40000 ALTER TABLE `glpi_printermodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_printermodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_printers`
--

DROP TABLE IF EXISTS `glpi_printers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_printers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `have_serial` tinyint(1) NOT NULL DEFAULT '0',
  `have_parallel` tinyint(1) NOT NULL DEFAULT '0',
  `have_usb` tinyint(1) NOT NULL DEFAULT '0',
  `have_wifi` tinyint(1) NOT NULL DEFAULT '0',
  `have_ethernet` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `memory_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `domains_id` int(11) NOT NULL DEFAULT '0',
  `networks_id` int(11) NOT NULL DEFAULT '0',
  `printertypes_id` int(11) NOT NULL DEFAULT '0',
  `printermodels_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `init_pages_counter` int(11) NOT NULL DEFAULT '0',
  `last_pages_counter` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `domains_id` (`domains_id`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `printermodels_id` (`printermodels_id`),
  KEY `networks_id` (`networks_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `printertypes_id` (`printertypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `last_pages_counter` (`last_pages_counter`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_printers`
--

LOCK TABLES `glpi_printers` WRITE;
/*!40000 ALTER TABLE `glpi_printers` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_printers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_printertypes`
--

DROP TABLE IF EXISTS `glpi_printertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_printertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_printertypes`
--

LOCK TABLES `glpi_printertypes` WRITE;
/*!40000 ALTER TABLE `glpi_printertypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_printertypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_problemcosts`
--

DROP TABLE IF EXISTS `glpi_problemcosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_problemcosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problems_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `cost_time` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_material` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `budgets_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `problems_id` (`problems_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_problemcosts`
--

LOCK TABLES `glpi_problemcosts` WRITE;
/*!40000 ALTER TABLE `glpi_problemcosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_problemcosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_problems`
--

DROP TABLE IF EXISTS `glpi_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `content` longtext COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `solvedate` datetime DEFAULT NULL,
  `closedate` datetime DEFAULT NULL,
  `time_to_resolve` datetime DEFAULT NULL,
  `users_id_recipient` int(11) NOT NULL DEFAULT '0',
  `users_id_lastupdater` int(11) NOT NULL DEFAULT '0',
  `urgency` int(11) NOT NULL DEFAULT '1',
  `impact` int(11) NOT NULL DEFAULT '1',
  `priority` int(11) NOT NULL DEFAULT '1',
  `itilcategories_id` int(11) NOT NULL DEFAULT '0',
  `impactcontent` longtext COLLATE utf8_unicode_ci,
  `causecontent` longtext COLLATE utf8_unicode_ci,
  `symptomcontent` longtext COLLATE utf8_unicode_ci,
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `begin_waiting_date` datetime DEFAULT NULL,
  `waiting_duration` int(11) NOT NULL DEFAULT '0',
  `close_delay_stat` int(11) NOT NULL DEFAULT '0',
  `solve_delay_stat` int(11) NOT NULL DEFAULT '0',
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date` (`date`),
  KEY `closedate` (`closedate`),
  KEY `status` (`status`),
  KEY `priority` (`priority`),
  KEY `date_mod` (`date_mod`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `users_id_recipient` (`users_id_recipient`),
  KEY `solvedate` (`solvedate`),
  KEY `urgency` (`urgency`),
  KEY `impact` (`impact`),
  KEY `time_to_resolve` (`time_to_resolve`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_problems`
--

LOCK TABLES `glpi_problems` WRITE;
/*!40000 ALTER TABLE `glpi_problems` DISABLE KEYS */;
INSERT INTO `glpi_problems` VALUES (1,'Перегрев сервера 38',0,0,0,1,'Проверить охлаждение соответствующего шкафа','2019-02-12 06:36:53','2019-02-12 06:35:26',NULL,NULL,'2019-02-13 00:00:00',4,4,4,3,4,0,NULL,NULL,NULL,0,NULL,0,0,0,'2019-02-12 06:36:53'),(2,'Греется процессор',0,0,0,1,'Срочно исправить','2019-02-22 08:30:05','2019-02-13 05:07:37',NULL,NULL,'2019-02-14 00:00:00',2,2,3,3,3,0,NULL,NULL,NULL,0,NULL,0,0,0,'2019-02-13 05:08:31'),(3,'Есть проблема',0,0,0,2,'Есть проблема','2019-02-22 08:37:29','2019-02-22 08:37:09',NULL,NULL,NULL,2,2,3,3,3,0,NULL,NULL,NULL,0,NULL,0,0,0,'2019-02-22 08:37:29');
/*!40000 ALTER TABLE `glpi_problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_problems_suppliers`
--

DROP TABLE IF EXISTS `glpi_problems_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_problems_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problems_id` int(11) NOT NULL DEFAULT '0',
  `suppliers_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `use_notification` tinyint(1) NOT NULL DEFAULT '0',
  `alternative_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`type`,`suppliers_id`),
  KEY `group` (`suppliers_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_problems_suppliers`
--

LOCK TABLES `glpi_problems_suppliers` WRITE;
/*!40000 ALTER TABLE `glpi_problems_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_problems_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_problems_tickets`
--

DROP TABLE IF EXISTS `glpi_problems_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_problems_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problems_id` int(11) NOT NULL DEFAULT '0',
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`tickets_id`),
  KEY `tickets_id` (`tickets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_problems_tickets`
--

LOCK TABLES `glpi_problems_tickets` WRITE;
/*!40000 ALTER TABLE `glpi_problems_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_problems_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_problems_users`
--

DROP TABLE IF EXISTS `glpi_problems_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_problems_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problems_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `use_notification` tinyint(1) NOT NULL DEFAULT '0',
  `alternative_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`type`,`users_id`,`alternative_email`),
  KEY `user` (`users_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_problems_users`
--

LOCK TABLES `glpi_problems_users` WRITE;
/*!40000 ALTER TABLE `glpi_problems_users` DISABLE KEYS */;
INSERT INTO `glpi_problems_users` VALUES (1,1,4,1,0,''),(2,2,6,1,0,''),(3,2,7,3,0,''),(4,3,2,1,0,''),(5,3,6,2,0,'');
/*!40000 ALTER TABLE `glpi_problems_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_problemtasks`
--

DROP TABLE IF EXISTS `glpi_problemtasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_problemtasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problems_id` int(11) NOT NULL DEFAULT '0',
  `taskcategories_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `begin` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `users_id_editor` int(11) NOT NULL DEFAULT '0',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tasktemplates_id` int(11) NOT NULL DEFAULT '0',
  `timeline_position` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `problems_id` (`problems_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_editor` (`users_id_editor`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `state` (`state`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `tasktemplates_id` (`tasktemplates_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_problemtasks`
--

LOCK TABLES `glpi_problemtasks` WRITE;
/*!40000 ALTER TABLE `glpi_problemtasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_problemtasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_profilerights`
--

DROP TABLE IF EXISTS `glpi_profilerights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_profilerights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profiles_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rights` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`profiles_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1056 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_profilerights`
--

LOCK TABLES `glpi_profilerights` WRITE;
/*!40000 ALTER TABLE `glpi_profilerights` DISABLE KEYS */;
INSERT INTO `glpi_profilerights` VALUES (1,1,'computer',0),(2,1,'monitor',0),(3,1,'software',0),(4,1,'networking',0),(5,1,'internet',0),(6,1,'printer',0),(7,1,'peripheral',0),(8,1,'cartridge',0),(9,1,'consumable',0),(10,1,'phone',0),(12,1,'contact_enterprise',0),(13,1,'document',0),(14,1,'contract',0),(15,1,'infocom',0),(16,1,'knowbase',2048),(20,1,'reservation',1024),(21,1,'reports',0),(22,1,'dropdown',0),(24,1,'device',0),(25,1,'typedoc',0),(26,1,'link',0),(27,1,'config',0),(29,1,'rule_ticket',0),(30,1,'rule_import',0),(31,1,'rule_ldap',0),(32,1,'rule_softwarecategories',0),(33,1,'search_config',0),(36,1,'profile',0),(37,1,'user',0),(39,1,'group',0),(40,1,'entity',0),(41,1,'transfer',0),(42,1,'logs',0),(43,1,'reminder_public',1),(44,1,'rssfeed_public',1),(45,1,'bookmark_public',0),(46,1,'backup',0),(47,1,'ticket',131077),(51,1,'followup',5),(52,1,'task',1),(64,1,'planning',0),(67,1,'statistic',0),(68,1,'password_update',1),(70,1,'show_group_hardware',0),(71,1,'rule_dictionnary_software',0),(72,1,'rule_dictionnary_dropdown',0),(73,1,'budget',0),(75,1,'notification',0),(76,1,'rule_mailcollector',0),(79,1,'calendar',0),(80,1,'slm',0),(81,1,'rule_dictionnary_printer',0),(85,1,'problem',0),(89,1,'tickettemplate',0),(90,1,'ticketrecurrent',0),(91,1,'ticketcost',1),(94,1,'ticketvalidation',0),(95,2,'computer',33),(96,2,'monitor',33),(97,2,'software',33),(98,2,'networking',33),(99,2,'internet',1),(100,2,'printer',33),(101,2,'peripheral',33),(102,2,'cartridge',33),(103,2,'consumable',33),(104,2,'phone',33),(106,2,'contact_enterprise',33),(107,2,'document',33),(108,2,'contract',33),(109,2,'infocom',1),(110,2,'knowbase',10241),(114,2,'reservation',1025),(115,2,'reports',1),(116,2,'dropdown',0),(118,2,'device',0),(119,2,'typedoc',1),(120,2,'link',1),(121,2,'config',0),(123,2,'rule_ticket',0),(124,2,'rule_import',0),(125,2,'rule_ldap',0),(126,2,'rule_softwarecategories',0),(127,2,'search_config',1055),(130,2,'profile',0),(131,2,'user',2049),(133,2,'group',1),(134,2,'entity',32),(135,2,'transfer',0),(136,2,'logs',0),(137,2,'reminder_public',0),(138,2,'rssfeed_public',0),(139,2,'bookmark_public',0),(140,2,'backup',1024),(141,2,'ticket',168989),(145,2,'followup',5),(146,2,'task',1),(158,2,'planning',1),(161,2,'statistic',1),(162,2,'password_update',1),(164,2,'show_group_hardware',0),(165,2,'rule_dictionnary_software',0),(166,2,'rule_dictionnary_dropdown',0),(167,2,'budget',33),(169,2,'notification',0),(170,2,'rule_mailcollector',0),(173,2,'calendar',0),(174,2,'slm',0),(175,2,'rule_dictionnary_printer',0),(179,2,'problem',1057),(183,2,'tickettemplate',0),(184,2,'ticketrecurrent',0),(185,2,'ticketcost',1),(188,2,'ticketvalidation',15384),(189,3,'computer',127),(190,3,'monitor',127),(191,3,'software',127),(192,3,'networking',127),(193,3,'internet',31),(194,3,'printer',127),(195,3,'peripheral',127),(196,3,'cartridge',127),(197,3,'consumable',127),(198,3,'phone',127),(200,3,'contact_enterprise',127),(201,3,'document',127),(202,3,'contract',127),(203,3,'infocom',31),(204,3,'knowbase',14367),(208,3,'reservation',1055),(209,3,'reports',1),(210,3,'dropdown',31),(212,3,'device',31),(213,3,'typedoc',31),(214,3,'link',31),(215,3,'config',0),(217,3,'rule_ticket',0),(218,3,'rule_import',0),(219,3,'rule_ldap',0),(220,3,'rule_softwarecategories',0),(221,3,'search_config',3103),(224,3,'profile',1),(225,3,'user',7199),(227,3,'group',31),(228,3,'entity',96),(229,3,'transfer',0),(230,3,'logs',0),(231,3,'reminder_public',0),(232,3,'rssfeed_public',0),(233,3,'bookmark_public',0),(234,3,'backup',1024),(235,3,'ticket',259103),(239,3,'followup',15383),(240,3,'task',13329),(252,3,'planning',3073),(255,3,'statistic',1),(256,3,'password_update',1),(258,3,'show_group_hardware',0),(259,3,'rule_dictionnary_software',0),(260,3,'rule_dictionnary_dropdown',0),(261,3,'budget',127),(263,3,'notification',0),(264,3,'rule_mailcollector',0),(267,3,'calendar',31),(268,3,'slm',0),(269,3,'rule_dictionnary_printer',0),(273,3,'problem',1151),(277,3,'tickettemplate',0),(278,3,'ticketrecurrent',0),(279,3,'ticketcost',31),(282,3,'ticketvalidation',15384),(283,4,'computer',255),(284,4,'monitor',255),(285,4,'software',255),(286,4,'networking',255),(287,4,'internet',159),(288,4,'printer',255),(289,4,'peripheral',255),(290,4,'cartridge',255),(291,4,'consumable',255),(292,4,'phone',255),(294,4,'contact_enterprise',255),(295,4,'document',255),(296,4,'contract',255),(297,4,'infocom',31),(298,4,'knowbase',15383),(302,4,'reservation',1055),(303,4,'reports',1),(304,4,'dropdown',31),(306,4,'device',31),(307,4,'typedoc',31),(308,4,'link',159),(309,4,'config',31),(311,4,'rule_ticket',1047),(312,4,'rule_import',23),(313,4,'rule_ldap',23),(314,4,'rule_softwarecategories',23),(315,4,'search_config',3103),(318,4,'profile',23),(319,4,'user',7199),(321,4,'group',119),(322,4,'entity',3191),(323,4,'transfer',23),(324,4,'logs',1),(325,4,'reminder_public',23),(326,4,'rssfeed_public',23),(327,4,'bookmark_public',23),(328,4,'backup',1045),(329,4,'ticket',261151),(333,4,'followup',15383),(334,4,'task',13329),(346,4,'planning',3073),(349,4,'statistic',1),(350,4,'password_update',1),(352,4,'show_group_hardware',1),(353,4,'rule_dictionnary_software',23),(354,4,'rule_dictionnary_dropdown',23),(355,4,'budget',255),(357,4,'notification',31),(358,4,'rule_mailcollector',23),(361,4,'calendar',31),(362,4,'slm',31),(363,4,'rule_dictionnary_printer',23),(367,4,'problem',1151),(371,4,'tickettemplate',23),(372,4,'ticketrecurrent',23),(373,4,'ticketcost',23),(376,4,'ticketvalidation',15376),(377,5,'computer',0),(378,5,'monitor',0),(379,5,'software',0),(380,5,'networking',0),(381,5,'internet',0),(382,5,'printer',0),(383,5,'peripheral',0),(384,5,'cartridge',0),(385,5,'consumable',0),(386,5,'phone',0),(388,5,'contact_enterprise',0),(389,5,'document',0),(390,5,'contract',0),(391,5,'infocom',0),(392,5,'knowbase',8192),(396,5,'reservation',0),(397,5,'reports',0),(398,5,'dropdown',0),(400,5,'device',0),(401,5,'typedoc',0),(402,5,'link',0),(403,5,'config',0),(405,5,'rule_ticket',0),(406,5,'rule_import',0),(407,5,'rule_ldap',0),(408,5,'rule_softwarecategories',0),(409,5,'search_config',0),(412,5,'profile',0),(413,5,'user',1025),(415,5,'group',0),(416,5,'entity',0),(417,5,'transfer',0),(418,5,'logs',0),(419,5,'reminder_public',0),(420,5,'rssfeed_public',0),(421,5,'bookmark_public',0),(422,5,'backup',0),(423,5,'ticket',140295),(427,5,'followup',12295),(428,5,'task',8193),(440,5,'planning',1),(443,5,'statistic',1),(444,5,'password_update',1),(446,5,'show_group_hardware',0),(447,5,'rule_dictionnary_software',0),(448,5,'rule_dictionnary_dropdown',0),(449,5,'budget',0),(451,5,'notification',0),(452,5,'rule_mailcollector',0),(455,5,'calendar',0),(456,5,'slm',0),(457,5,'rule_dictionnary_printer',0),(461,5,'problem',1024),(465,5,'tickettemplate',1),(466,5,'ticketrecurrent',0),(467,5,'ticketcost',31),(470,5,'ticketvalidation',3088),(471,6,'computer',127),(472,6,'monitor',0),(473,6,'software',0),(474,6,'networking',127),(475,6,'internet',0),(476,6,'printer',0),(477,6,'peripheral',127),(478,6,'cartridge',0),(479,6,'consumable',0),(480,6,'phone',127),(482,6,'contact_enterprise',0),(483,6,'document',127),(484,6,'contract',127),(485,6,'infocom',0),(486,6,'knowbase',15383),(490,6,'reservation',1055),(491,6,'reports',1),(492,6,'dropdown',23),(494,6,'device',0),(495,6,'typedoc',0),(496,6,'link',0),(497,6,'config',0),(499,6,'rule_ticket',0),(500,6,'rule_import',0),(501,6,'rule_ldap',0),(502,6,'rule_softwarecategories',0),(503,6,'search_config',0),(506,6,'profile',0),(507,6,'user',0),(509,6,'group',0),(510,6,'entity',0),(511,6,'transfer',0),(512,6,'logs',0),(513,6,'reminder_public',23),(514,6,'rssfeed_public',0),(515,6,'bookmark_public',23),(516,6,'backup',0),(517,6,'ticket',0),(521,6,'followup',0),(522,6,'task',0),(534,6,'planning',0),(537,6,'statistic',1),(538,6,'password_update',1),(540,6,'show_group_hardware',0),(541,6,'rule_dictionnary_software',0),(542,6,'rule_dictionnary_dropdown',23),(543,6,'budget',0),(545,6,'notification',23),(546,6,'rule_mailcollector',0),(549,6,'calendar',23),(550,6,'slm',0),(551,6,'rule_dictionnary_printer',0),(555,6,'problem',125),(559,6,'tickettemplate',0),(560,6,'ticketrecurrent',0),(561,6,'ticketcost',0),(564,6,'ticketvalidation',3088),(565,7,'computer',127),(566,7,'monitor',127),(567,7,'software',127),(568,7,'networking',127),(569,7,'internet',31),(570,7,'printer',127),(571,7,'peripheral',127),(572,7,'cartridge',127),(573,7,'consumable',127),(574,7,'phone',127),(576,7,'contact_enterprise',96),(577,7,'document',127),(578,7,'contract',96),(579,7,'infocom',0),(580,7,'knowbase',14367),(584,7,'reservation',1055),(585,7,'reports',1),(586,7,'dropdown',0),(588,7,'device',0),(589,7,'typedoc',0),(590,7,'link',0),(591,7,'config',0),(593,7,'rule_ticket',1055),(594,7,'rule_import',0),(595,7,'rule_ldap',0),(596,7,'rule_softwarecategories',0),(597,7,'search_config',0),(600,7,'profile',0),(601,7,'user',1055),(603,7,'group',1),(604,7,'entity',97),(605,7,'transfer',1),(606,7,'logs',1),(607,7,'reminder_public',31),(608,7,'rssfeed_public',31),(609,7,'bookmark_public',0),(610,7,'backup',0),(611,7,'ticket',259103),(615,7,'followup',13335),(616,7,'task',13329),(628,7,'planning',2049),(631,7,'statistic',1),(632,7,'password_update',1),(634,7,'show_group_hardware',0),(635,7,'rule_dictionnary_software',0),(636,7,'rule_dictionnary_dropdown',0),(637,7,'budget',96),(639,7,'notification',0),(640,7,'rule_mailcollector',31),(643,7,'calendar',31),(644,7,'slm',31),(645,7,'rule_dictionnary_printer',0),(649,7,'problem',1151),(653,7,'tickettemplate',31),(654,7,'ticketrecurrent',31),(655,7,'ticketcost',31),(658,7,'ticketvalidation',15384),(659,1,'change',0),(660,2,'change',1057),(661,3,'change',1151),(662,4,'change',1151),(663,5,'change',1054),(664,6,'change',0),(665,7,'change',1151),(666,1,'changevalidation',0),(667,2,'changevalidation',1044),(668,3,'changevalidation',1044),(669,4,'changevalidation',1044),(670,5,'changevalidation',20),(671,6,'changevalidation',0),(672,7,'changevalidation',1044),(673,1,'domain',0),(674,2,'domain',0),(675,3,'domain',31),(676,4,'domain',31),(677,5,'domain',0),(678,6,'domain',0),(679,7,'domain',31),(680,1,'location',0),(681,2,'location',0),(682,3,'location',31),(683,4,'location',31),(684,5,'location',0),(685,6,'location',0),(686,7,'location',31),(687,1,'itilcategory',0),(688,2,'itilcategory',0),(689,3,'itilcategory',31),(690,4,'itilcategory',31),(691,5,'itilcategory',0),(692,6,'itilcategory',0),(693,7,'itilcategory',31),(694,1,'knowbasecategory',0),(695,2,'knowbasecategory',0),(696,3,'knowbasecategory',31),(697,4,'knowbasecategory',31),(698,5,'knowbasecategory',0),(699,6,'knowbasecategory',0),(700,7,'knowbasecategory',31),(701,1,'netpoint',0),(702,2,'netpoint',0),(703,3,'netpoint',31),(704,4,'netpoint',31),(705,5,'netpoint',0),(706,6,'netpoint',0),(707,7,'netpoint',31),(708,1,'taskcategory',0),(709,2,'taskcategory',0),(710,3,'taskcategory',31),(711,4,'taskcategory',31),(712,5,'taskcategory',0),(713,6,'taskcategory',0),(714,7,'taskcategory',31),(715,1,'state',0),(716,2,'state',0),(717,3,'state',31),(718,4,'state',31),(719,5,'state',0),(720,6,'state',0),(721,7,'state',31),(722,1,'solutiontemplate',0),(723,2,'solutiontemplate',0),(724,3,'solutiontemplate',31),(725,4,'solutiontemplate',31),(726,5,'solutiontemplate',0),(727,6,'solutiontemplate',0),(728,7,'solutiontemplate',31),(729,1,'queuednotification',0),(730,2,'queuednotification',0),(731,3,'queuednotification',0),(732,4,'queuednotification',31),(733,5,'queuednotification',0),(734,6,'queuednotification',0),(735,7,'queuednotification',0),(736,1,'project',0),(737,2,'project',1025),(738,3,'project',1151),(739,4,'project',1151),(740,5,'project',1150),(741,6,'project',0),(742,7,'project',1151),(743,1,'projecttask',0),(744,2,'projecttask',1025),(745,3,'projecttask',1025),(746,4,'projecttask',1121),(747,5,'projecttask',0),(748,6,'projecttask',0),(749,7,'projecttask',1025),(750,8,'backup',1),(751,8,'bookmark_public',1),(752,8,'budget',161),(753,8,'calendar',1),(754,8,'cartridge',161),(755,8,'change',1185),(756,8,'changevalidation',0),(757,8,'computer',161),(758,8,'config',1),(759,8,'consumable',161),(760,8,'contact_enterprise',161),(761,8,'contract',161),(762,8,'device',0),(763,8,'document',161),(764,8,'domain',1),(765,8,'dropdown',1),(766,8,'entity',1185),(767,8,'followup',8193),(768,8,'global_validation',0),(769,8,'group',129),(770,8,'infocom',1),(771,8,'internet',129),(772,8,'itilcategory',1),(773,8,'knowbase',10369),(774,8,'knowbasecategory',1),(775,8,'link',129),(776,8,'location',1),(777,8,'logs',1),(778,8,'monitor',161),(779,8,'netpoint',1),(780,8,'networking',161),(781,8,'notification',1),(782,8,'password_update',0),(783,8,'peripheral',161),(784,8,'phone',161),(785,8,'planning',3073),(786,8,'printer',161),(787,8,'problem',1185),(788,8,'profile',129),(789,8,'project',1185),(790,8,'projecttask',1),(791,8,'queuednotification',1),(792,8,'reminder_public',129),(793,8,'reports',1),(794,8,'reservation',1),(795,8,'rssfeed_public',129),(796,8,'rule_dictionnary_dropdown',1),(797,8,'rule_dictionnary_printer',1),(798,8,'rule_dictionnary_software',1),(799,8,'rule_import',1),(800,8,'rule_ldap',1),(801,8,'rule_mailcollector',1),(802,8,'rule_softwarecategories',1),(803,8,'rule_ticket',1),(804,8,'search_config',0),(805,8,'show_group_hardware',1),(806,8,'slm',1),(807,8,'software',161),(808,8,'solutiontemplate',1),(809,8,'state',1),(810,8,'statistic',1),(811,8,'task',8193),(812,8,'taskcategory',1),(813,8,'ticket',138369),(814,8,'ticketcost',1),(815,8,'ticketrecurrent',1),(816,8,'tickettemplate',1),(817,8,'ticketvalidation',0),(818,8,'transfer',1),(819,8,'typedoc',1),(820,8,'user',2177),(821,1,'license',0),(822,2,'license',33),(823,3,'license',127),(824,4,'license',255),(825,5,'license',0),(826,6,'license',0),(827,7,'license',127),(828,8,'license',161),(829,1,'line',0),(830,2,'line',33),(831,3,'line',127),(832,4,'line',255),(833,5,'line',0),(834,6,'line',0),(835,7,'line',127),(836,8,'line',161),(837,1,'lineoperator',0),(838,2,'lineoperator',33),(839,3,'lineoperator',31),(840,4,'lineoperator',31),(841,5,'lineoperator',0),(842,6,'lineoperator',0),(843,7,'lineoperator',31),(844,8,'lineoperator',1),(845,1,'devicesimcard_pinpuk',0),(846,2,'devicesimcard_pinpuk',0),(847,3,'devicesimcard_pinpuk',3),(848,4,'devicesimcard_pinpuk',3),(849,5,'devicesimcard_pinpuk',1),(850,6,'devicesimcard_pinpuk',0),(851,7,'devicesimcard_pinpuk',0),(852,8,'devicesimcard_pinpuk',0),(853,1,'certificate',0),(854,2,'certificate',33),(855,3,'certificate',127),(856,4,'certificate',255),(857,5,'certificate',0),(858,6,'certificate',0),(859,7,'certificate',127),(860,8,'certificate',161),(861,1,'datacenter',0),(862,2,'datacenter',1),(863,3,'datacenter',255),(864,4,'datacenter',255),(865,5,'datacenter',0),(866,6,'datacenter',0),(867,7,'datacenter',255),(868,8,'datacenter',0),(869,4,'rule_asset',1047),(870,2,'personalization',3),(871,3,'personalization',3),(872,4,'personalization',3),(873,5,'personalization',3),(874,6,'personalization',3),(875,7,'personalization',3),(876,8,'personalization',3),(877,1,'personalization',3),(878,6,'rule_asset',0),(879,6,'global_validation',0),(880,4,'uninstall:profile',131),(881,4,'plugin_uninstall_replace',1),(882,2,'plugin_satisfaction',0),(883,3,'plugin_satisfaction',0),(885,5,'plugin_satisfaction',0),(886,6,'plugin_satisfaction',0),(887,7,'plugin_satisfaction',0),(888,8,'plugin_satisfaction',0),(889,1,'plugin_satisfaction',0),(890,4,'plugin_satisfaction',31),(891,4,'plugin_datainjection_model',31),(892,4,'plugin_datainjection_use',1),(893,2,'example:read',0),(894,3,'example:read',0),(895,4,'example:read',0),(896,5,'example:read',0),(897,6,'example:read',0),(898,7,'example:read',0),(899,8,'example:read',0),(900,1,'example:read',0),(901,6,'plugin_datainjection_model',0),(902,6,'plugin_datainjection_use',0),(903,6,'plugin_uninstall_replace',0),(904,6,'uninstall:profile',0),(905,4,'global_validation',0),(906,4,'plugin_useditemsexport_export',21),(907,1,'plugin_genericobject_types',0),(908,1,'global_validation',0),(909,1,'plugin_datainjection_model',0),(910,1,'plugin_datainjection_use',0),(911,1,'plugin_uninstall_replace',0),(912,1,'plugin_useditemsexport_export',0),(913,1,'rule_asset',0),(914,1,'uninstall:profile',0),(915,2,'plugin_genericobject_types',0),(916,2,'global_validation',0),(917,2,'plugin_datainjection_model',0),(918,2,'plugin_datainjection_use',0),(919,2,'plugin_uninstall_replace',0),(920,2,'plugin_useditemsexport_export',0),(921,2,'rule_asset',0),(922,2,'uninstall:profile',0),(923,3,'plugin_genericobject_types',0),(924,3,'global_validation',0),(925,3,'plugin_datainjection_model',0),(926,3,'plugin_datainjection_use',0),(927,3,'plugin_uninstall_replace',0),(928,3,'plugin_useditemsexport_export',0),(929,3,'rule_asset',0),(930,3,'uninstall:profile',0),(931,4,'plugin_genericobject_types',127),(932,5,'plugin_genericobject_types',0),(933,5,'global_validation',0),(934,5,'plugin_datainjection_model',0),(935,5,'plugin_datainjection_use',0),(936,5,'plugin_uninstall_replace',0),(937,5,'plugin_useditemsexport_export',0),(938,5,'rule_asset',0),(939,5,'uninstall:profile',0),(940,6,'plugin_genericobject_types',0),(941,6,'plugin_useditemsexport_export',0),(942,7,'plugin_genericobject_types',0),(943,7,'global_validation',0),(944,7,'plugin_datainjection_model',0),(945,7,'plugin_datainjection_use',0),(946,7,'plugin_uninstall_replace',0),(947,7,'plugin_useditemsexport_export',0),(948,7,'rule_asset',0),(949,7,'uninstall:profile',0),(950,8,'plugin_genericobject_types',0),(951,8,'plugin_datainjection_model',0),(952,8,'plugin_datainjection_use',0),(953,8,'plugin_uninstall_replace',0),(954,8,'plugin_useditemsexport_export',0),(955,8,'rule_asset',0),(956,8,'uninstall:profile',0),(965,2,'plugin_order_order',0),(966,3,'plugin_order_order',0),(968,5,'plugin_order_order',0),(969,6,'plugin_order_order',0),(970,7,'plugin_order_order',0),(971,8,'plugin_order_order',0),(972,1,'plugin_order_order',0),(973,2,'plugin_order_reference',0),(974,3,'plugin_order_reference',0),(976,5,'plugin_order_reference',0),(977,6,'plugin_order_reference',0),(978,7,'plugin_order_reference',0),(979,8,'plugin_order_reference',0),(980,1,'plugin_order_reference',0),(981,2,'plugin_order_bill',0),(982,3,'plugin_order_bill',0),(984,5,'plugin_order_bill',0),(985,6,'plugin_order_bill',0),(986,7,'plugin_order_bill',0),(987,8,'plugin_order_bill',0),(988,1,'plugin_order_bill',0),(989,4,'plugin_order_order',16255),(990,4,'plugin_order_bill',127),(991,4,'plugin_order_reference',127),(1048,2,'plugin_genericobject_vpscmps',0),(1049,3,'plugin_genericobject_vpscmps',0),(1050,4,'plugin_genericobject_vpscmps',127),(1051,5,'plugin_genericobject_vpscmps',0),(1052,6,'plugin_genericobject_vpscmps',0),(1053,7,'plugin_genericobject_vpscmps',0),(1054,8,'plugin_genericobject_vpscmps',0),(1055,1,'plugin_genericobject_vpscmps',0);
/*!40000 ALTER TABLE `glpi_profilerights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_profiles`
--

DROP TABLE IF EXISTS `glpi_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interface` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'helpdesk',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `helpdesk_hardware` int(11) NOT NULL DEFAULT '0',
  `helpdesk_item_type` text COLLATE utf8_unicode_ci,
  `ticket_status` text COLLATE utf8_unicode_ci COMMENT 'json encoded array of from/dest allowed status change',
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `problem_status` text COLLATE utf8_unicode_ci COMMENT 'json encoded array of from/dest allowed status change',
  `create_ticket_on_login` tinyint(1) NOT NULL DEFAULT '0',
  `tickettemplates_id` int(11) NOT NULL DEFAULT '0',
  `change_status` text COLLATE utf8_unicode_ci COMMENT 'json encoded array of from/dest allowed status change',
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `interface` (`interface`),
  KEY `is_default` (`is_default`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_profiles`
--

LOCK TABLES `glpi_profiles` WRITE;
/*!40000 ALTER TABLE `glpi_profiles` DISABLE KEYS */;
INSERT INTO `glpi_profiles` VALUES (1,'Self-Service','helpdesk',1,1,'[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\"]','{\"1\":{\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"2\":{\"1\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"3\":{\"1\":0,\"2\":0,\"4\":0,\"5\":0,\"6\":0},\"4\":{\"1\":0,\"2\":0,\"3\":0,\"5\":0,\"6\":0},\"5\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0},\"6\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}}',NULL,NULL,'[]',0,0,NULL,NULL),(2,'Observer','central',0,1,'[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\"]','[]',NULL,NULL,'[]',0,0,NULL,NULL),(3,'Admin','central',0,3,'[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\"]','[]',NULL,NULL,'[]',0,0,NULL,NULL),(4,'Super-Admin','central',0,3,'[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\",\"DCRoom\",\"Rack\",\"Enclosure\"]','[]','2019-02-15 05:47:24',NULL,'[]',0,0,NULL,NULL),(5,'Hotliner','central',0,3,'[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\"]','[]',NULL,NULL,'[]',1,0,NULL,NULL),(6,'Сетевой-администратор','central',0,3,'[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\",\"DCRoom\",\"Rack\",\"Enclosure\"]','[]','2019-02-15 10:06:12',NULL,'[]',0,0,NULL,NULL),(7,'Supervisor','central',0,3,'[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\"]','[]',NULL,NULL,'[]',0,0,NULL,NULL),(8,'Read-Only','central',0,0,'[]','{\"1\":{\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\n                       \"2\":{\"1\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\n                       \"3\":{\"1\":0,\"2\":0,\"4\":0,\"5\":0,\"6\":0},\n                       \"4\":{\"1\":0,\"2\":0,\"3\":0,\"5\":0,\"6\":0},\n                       \"5\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"6\":0},\n                       \"6\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}}',NULL,'This profile defines read-only access. It is used when objects are locked. It can also be used to give to users rights to unlock objects.','{\"1\":{\"7\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"8\":0,\"6\":0},\n                      \"7\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"8\":0,\"6\":0},\n                      \"2\":{\"1\":0,\"7\":0,\"3\":0,\"4\":0,\"5\":0,\"8\":0,\"6\":0},\n                      \"3\":{\"1\":0,\"7\":0,\"2\":0,\"4\":0,\"5\":0,\"8\":0,\"6\":0},\n                      \"4\":{\"1\":0,\"7\":0,\"2\":0,\"3\":0,\"5\":0,\"8\":0,\"6\":0},\n                      \"5\":{\"1\":0,\"7\":0,\"2\":0,\"3\":0,\"4\":0,\"8\":0,\"6\":0},\n                      \"8\":{\"1\":0,\"7\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\n                      \"6\":{\"1\":0,\"7\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"8\":0}}',0,0,'{\"1\":{\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\n                       \"9\":{\"1\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\n                       \"10\":{\"1\":0,\"9\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\n                       \"7\":{\"1\":0,\"9\":0,\"10\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\n                       \"4\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\n                       \"11\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\n                       \"12\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"5\":0,\"8\":0,\"6\":0},\n                       \"5\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"8\":0,\"6\":0},\n                       \"8\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"6\":0},\n                       \"6\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0}}','2016-02-08 16:57:46');
/*!40000 ALTER TABLE `glpi_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_profiles_reminders`
--

DROP TABLE IF EXISTS `glpi_profiles_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_profiles_reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reminders_id` int(11) NOT NULL DEFAULT '0',
  `profiles_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_profiles_reminders`
--

LOCK TABLES `glpi_profiles_reminders` WRITE;
/*!40000 ALTER TABLE `glpi_profiles_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_profiles_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_profiles_rssfeeds`
--

DROP TABLE IF EXISTS `glpi_profiles_rssfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_profiles_rssfeeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rssfeeds_id` int(11) NOT NULL DEFAULT '0',
  `profiles_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rssfeeds_id` (`rssfeeds_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_profiles_rssfeeds`
--

LOCK TABLES `glpi_profiles_rssfeeds` WRITE;
/*!40000 ALTER TABLE `glpi_profiles_rssfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_profiles_rssfeeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_profiles_users`
--

DROP TABLE IF EXISTS `glpi_profiles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_profiles_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `profiles_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '1',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `users_id` (`users_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_profiles_users`
--

LOCK TABLES `glpi_profiles_users` WRITE;
/*!40000 ALTER TABLE `glpi_profiles_users` DISABLE KEYS */;
INSERT INTO `glpi_profiles_users` VALUES (2,2,4,0,1,0),(3,3,1,0,1,0),(4,4,6,0,1,0),(5,5,2,0,1,0),(6,6,3,0,0,0),(7,7,4,0,0,0);
/*!40000 ALTER TABLE `glpi_profiles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projectcosts`
--

DROP TABLE IF EXISTS `glpi_projectcosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projectcosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projects_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `cost` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `budgets_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `projects_id` (`projects_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projectcosts`
--

LOCK TABLES `glpi_projectcosts` WRITE;
/*!40000 ALTER TABLE `glpi_projectcosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_projectcosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projects`
--

DROP TABLE IF EXISTS `glpi_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `projects_id` int(11) NOT NULL DEFAULT '0',
  `projectstates_id` int(11) NOT NULL DEFAULT '0',
  `projecttypes_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `plan_start_date` datetime DEFAULT NULL,
  `plan_end_date` datetime DEFAULT NULL,
  `real_start_date` datetime DEFAULT NULL,
  `real_end_date` datetime DEFAULT NULL,
  `percent_done` int(11) NOT NULL DEFAULT '0',
  `show_on_global_gantt` tinyint(1) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `comment` longtext COLLATE utf8_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `date_creation` datetime DEFAULT NULL,
  `projecttemplates_id` int(11) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `code` (`code`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `projects_id` (`projects_id`),
  KEY `projectstates_id` (`projectstates_id`),
  KEY `projecttypes_id` (`projecttypes_id`),
  KEY `priority` (`priority`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `users_id` (`users_id`),
  KEY `groups_id` (`groups_id`),
  KEY `plan_start_date` (`plan_start_date`),
  KEY `plan_end_date` (`plan_end_date`),
  KEY `real_start_date` (`real_start_date`),
  KEY `real_end_date` (`real_end_date`),
  KEY `percent_done` (`percent_done`),
  KEY `show_on_global_gantt` (`show_on_global_gantt`),
  KEY `date_creation` (`date_creation`),
  KEY `projecttemplates_id` (`projecttemplates_id`),
  KEY `is_template` (`is_template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projects`
--

LOCK TABLES `glpi_projects` WRITE;
/*!40000 ALTER TABLE `glpi_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projectstates`
--

DROP TABLE IF EXISTS `glpi_projectstates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projectstates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_finished` tinyint(1) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_finished` (`is_finished`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projectstates`
--

LOCK TABLES `glpi_projectstates` WRITE;
/*!40000 ALTER TABLE `glpi_projectstates` DISABLE KEYS */;
INSERT INTO `glpi_projectstates` VALUES (1,'New',NULL,'#06ff00',0,NULL,NULL),(2,'Processing',NULL,'#ffb800',0,NULL,NULL),(3,'Closed',NULL,'#ff0000',1,NULL,NULL);
/*!40000 ALTER TABLE `glpi_projectstates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projecttasks`
--

DROP TABLE IF EXISTS `glpi_projecttasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projecttasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `comment` longtext COLLATE utf8_unicode_ci,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `projects_id` int(11) NOT NULL DEFAULT '0',
  `projecttasks_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `plan_start_date` datetime DEFAULT NULL,
  `plan_end_date` datetime DEFAULT NULL,
  `real_start_date` datetime DEFAULT NULL,
  `real_end_date` datetime DEFAULT NULL,
  `planned_duration` int(11) NOT NULL DEFAULT '0',
  `effective_duration` int(11) NOT NULL DEFAULT '0',
  `projectstates_id` int(11) NOT NULL DEFAULT '0',
  `projecttasktypes_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `percent_done` int(11) NOT NULL DEFAULT '0',
  `is_milestone` tinyint(1) NOT NULL DEFAULT '0',
  `projecttasktemplates_id` int(11) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `projects_id` (`projects_id`),
  KEY `projecttasks_id` (`projecttasks_id`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `users_id` (`users_id`),
  KEY `plan_start_date` (`plan_start_date`),
  KEY `plan_end_date` (`plan_end_date`),
  KEY `real_start_date` (`real_start_date`),
  KEY `real_end_date` (`real_end_date`),
  KEY `percent_done` (`percent_done`),
  KEY `projectstates_id` (`projectstates_id`),
  KEY `projecttasktypes_id` (`projecttasktypes_id`),
  KEY `projecttasktemplates_id` (`projecttasktemplates_id`),
  KEY `is_template` (`is_template`),
  KEY `is_milestone` (`is_milestone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projecttasks`
--

LOCK TABLES `glpi_projecttasks` WRITE;
/*!40000 ALTER TABLE `glpi_projecttasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_projecttasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projecttasks_tickets`
--

DROP TABLE IF EXISTS `glpi_projecttasks_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projecttasks_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `projecttasks_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`projecttasks_id`),
  KEY `projects_id` (`projecttasks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projecttasks_tickets`
--

LOCK TABLES `glpi_projecttasks_tickets` WRITE;
/*!40000 ALTER TABLE `glpi_projecttasks_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_projecttasks_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projecttaskteams`
--

DROP TABLE IF EXISTS `glpi_projecttaskteams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projecttaskteams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projecttasks_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`projecttasks_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projecttaskteams`
--

LOCK TABLES `glpi_projecttaskteams` WRITE;
/*!40000 ALTER TABLE `glpi_projecttaskteams` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_projecttaskteams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projecttasktemplates`
--

DROP TABLE IF EXISTS `glpi_projecttasktemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projecttasktemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `comment` longtext COLLATE utf8_unicode_ci,
  `projects_id` int(11) NOT NULL DEFAULT '0',
  `projecttasks_id` int(11) NOT NULL DEFAULT '0',
  `plan_start_date` datetime DEFAULT NULL,
  `plan_end_date` datetime DEFAULT NULL,
  `real_start_date` datetime DEFAULT NULL,
  `real_end_date` datetime DEFAULT NULL,
  `planned_duration` int(11) NOT NULL DEFAULT '0',
  `effective_duration` int(11) NOT NULL DEFAULT '0',
  `projectstates_id` int(11) NOT NULL DEFAULT '0',
  `projecttasktypes_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `percent_done` int(11) NOT NULL DEFAULT '0',
  `is_milestone` tinyint(1) NOT NULL DEFAULT '0',
  `comments` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `projects_id` (`projects_id`),
  KEY `projecttasks_id` (`projecttasks_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  KEY `users_id` (`users_id`),
  KEY `plan_start_date` (`plan_start_date`),
  KEY `plan_end_date` (`plan_end_date`),
  KEY `real_start_date` (`real_start_date`),
  KEY `real_end_date` (`real_end_date`),
  KEY `percent_done` (`percent_done`),
  KEY `projectstates_id` (`projectstates_id`),
  KEY `projecttasktypes_id` (`projecttasktypes_id`),
  KEY `is_milestone` (`is_milestone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projecttasktemplates`
--

LOCK TABLES `glpi_projecttasktemplates` WRITE;
/*!40000 ALTER TABLE `glpi_projecttasktemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_projecttasktemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projecttasktypes`
--

DROP TABLE IF EXISTS `glpi_projecttasktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projecttasktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projecttasktypes`
--

LOCK TABLES `glpi_projecttasktypes` WRITE;
/*!40000 ALTER TABLE `glpi_projecttasktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_projecttasktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projectteams`
--

DROP TABLE IF EXISTS `glpi_projectteams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projectteams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projects_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`projects_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projectteams`
--

LOCK TABLES `glpi_projectteams` WRITE;
/*!40000 ALTER TABLE `glpi_projectteams` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_projectteams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projecttypes`
--

DROP TABLE IF EXISTS `glpi_projecttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projecttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projecttypes`
--

LOCK TABLES `glpi_projecttypes` WRITE;
/*!40000 ALTER TABLE `glpi_projecttypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_projecttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_queuednotifications`
--

DROP TABLE IF EXISTS `glpi_queuednotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_queuednotifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `notificationtemplates_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `sent_try` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `send_time` datetime DEFAULT NULL,
  `sent_time` datetime DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci,
  `sender` text COLLATE utf8_unicode_ci,
  `sendername` text COLLATE utf8_unicode_ci,
  `recipient` text COLLATE utf8_unicode_ci,
  `recipientname` text COLLATE utf8_unicode_ci,
  `replyto` text COLLATE utf8_unicode_ci,
  `replytoname` text COLLATE utf8_unicode_ci,
  `headers` text COLLATE utf8_unicode_ci,
  `body_html` longtext COLLATE utf8_unicode_ci,
  `body_text` longtext COLLATE utf8_unicode_ci,
  `messageid` text COLLATE utf8_unicode_ci,
  `documents` text COLLATE utf8_unicode_ci,
  `mode` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'See Notification_NotificationTemplate::MODE_* constants',
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`,`notificationtemplates_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `entities_id` (`entities_id`),
  KEY `sent_try` (`sent_try`),
  KEY `create_time` (`create_time`),
  KEY `send_time` (`send_time`),
  KEY `sent_time` (`sent_time`),
  KEY `mode` (`mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_queuednotifications`
--

LOCK TABLES `glpi_queuednotifications` WRITE;
/*!40000 ALTER TABLE `glpi_queuednotifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_queuednotifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_rackmodels`
--

DROP TABLE IF EXISTS `glpi_rackmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_rackmodels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `product_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_rackmodels`
--

LOCK TABLES `glpi_rackmodels` WRITE;
/*!40000 ALTER TABLE `glpi_rackmodels` DISABLE KEYS */;
INSERT INTO `glpi_rackmodels` VALUES (1,'EDA 1.1.1','','EDA 1.1.1','2019-02-15 03:07:48','2019-02-15 03:07:48'),(2,'EDA 1.1.2','','EDA 1.1.2','2019-02-15 03:08:25','2019-02-15 03:08:25'),(3,'EDA 1.1.3','','EDA 1.1.3','2019-02-15 03:10:37','2019-02-15 03:10:37'),(4,'EDA 1.1.4','','EDA 1.1.4','2019-02-15 03:11:07','2019-02-15 03:11:07'),(5,'EDA 1.1.5','','EDA 1.1.5','2019-02-15 03:11:29','2019-02-15 03:11:29'),(6,'EDA 1.1.6','','EDA 1.1.6','2019-02-15 03:11:45','2019-02-15 03:11:45'),(7,'EDA 1.1.7','','EDA 1.1.7','2019-02-15 03:12:27','2019-02-15 03:12:27');
/*!40000 ALTER TABLE `glpi_rackmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_racks`
--

DROP TABLE IF EXISTS `glpi_racks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_racks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rackmodels_id` int(11) DEFAULT NULL,
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `racktypes_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `number_units` int(11) DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `dcrooms_id` int(11) NOT NULL DEFAULT '0',
  `room_orientation` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bgcolor` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_power` int(11) NOT NULL DEFAULT '0',
  `mesured_power` int(11) NOT NULL DEFAULT '0',
  `max_weight` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `rackmodels_id` (`rackmodels_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `racktypes_id` (`racktypes_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `group_id_tech` (`groups_id_tech`),
  KEY `is_template` (`is_template`),
  KEY `is_deleted` (`is_deleted`),
  KEY `dcrooms_id` (`dcrooms_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_racks`
--

LOCK TABLES `glpi_racks` WRITE;
/*!40000 ALTER TABLE `glpi_racks` DISABLE KEYS */;
INSERT INTO `glpi_racks` VALUES (1,'шк.01','',0,0,1,'03H2418D54','002',0,1,0,1,0,1,600,1800,1200,42,0,NULL,0,0,1,NULL,'#fec95c',10000,1100,50,'2019-02-14 05:33:17','2019-02-11 09:50:18');
/*!40000 ALTER TABLE `glpi_racks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_racktypes`
--

DROP TABLE IF EXISTS `glpi_racktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_racktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_creation` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_racktypes`
--

LOCK TABLES `glpi_racktypes` WRITE;
/*!40000 ALTER TABLE `glpi_racktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_racktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_registeredids`
--

DROP TABLE IF EXISTS `glpi_registeredids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_registeredids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `device_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'USB, PCI ...',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `item` (`items_id`,`itemtype`),
  KEY `device_type` (`device_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_registeredids`
--

LOCK TABLES `glpi_registeredids` WRITE;
/*!40000 ALTER TABLE `glpi_registeredids` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_registeredids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_reminders`
--

DROP TABLE IF EXISTS `glpi_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `begin` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `is_planned` tinyint(1) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  `begin_view_date` datetime DEFAULT NULL,
  `end_view_date` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `users_id` (`users_id`),
  KEY `is_planned` (`is_planned`),
  KEY `state` (`state`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_reminders`
--

LOCK TABLES `glpi_reminders` WRITE;
/*!40000 ALTER TABLE `glpi_reminders` DISABLE KEYS */;
INSERT INTO `glpi_reminders` VALUES (1,'2019-02-12 06:34:30',4,'Выполнить заявку','&lt;p&gt;Разместить сервер&lt;/p&gt;','2019-02-13 08:00:00','2019-02-13 08:30:00',1,'2019-02-12 06:34:30',1,NULL,NULL,'2019-02-12 06:34:30'),(2,'2019-02-15 03:52:39',2,'Новая заметка','&lt;p&gt;Тест&lt;/p&gt;','2019-02-15 08:00:00','2019-02-15 08:30:00',1,'2019-02-15 03:55:38',1,'2019-02-15 00:00:00','2019-02-16 00:00:00','2019-02-15 03:52:39'),(3,'2019-02-15 04:59:19',2,'Новая заметка','&lt;p&gt;Провести дебаты&lt;/p&gt;','2019-02-15 08:00:00','2019-02-15 08:30:00',1,'2019-02-15 05:01:05',1,'2019-02-15 00:00:00','2019-02-28 00:00:00','2019-02-15 04:59:19'),(4,'2019-02-15 05:00:07',2,'Новая заметка','&lt;p&gt;Провести встречу&lt;/p&gt;','2019-02-15 13:00:00','2019-02-15 13:30:00',1,'2019-02-15 05:00:07',1,NULL,NULL,'2019-02-15 05:00:07');
/*!40000 ALTER TABLE `glpi_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_reminders_users`
--

DROP TABLE IF EXISTS `glpi_reminders_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_reminders_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reminders_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_reminders_users`
--

LOCK TABLES `glpi_reminders_users` WRITE;
/*!40000 ALTER TABLE `glpi_reminders_users` DISABLE KEYS */;
INSERT INTO `glpi_reminders_users` VALUES (1,3,7);
/*!40000 ALTER TABLE `glpi_reminders_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_requesttypes`
--

DROP TABLE IF EXISTS `glpi_requesttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_requesttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_helpdesk_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_followup_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_mail_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_mailfollowup_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_ticketheader` tinyint(1) NOT NULL DEFAULT '1',
  `is_itilfollowup` tinyint(1) NOT NULL DEFAULT '1',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_helpdesk_default` (`is_helpdesk_default`),
  KEY `is_followup_default` (`is_followup_default`),
  KEY `is_mail_default` (`is_mail_default`),
  KEY `is_mailfollowup_default` (`is_mailfollowup_default`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_active` (`is_active`),
  KEY `is_ticketheader` (`is_ticketheader`),
  KEY `is_itilfollowup` (`is_itilfollowup`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_requesttypes`
--

LOCK TABLES `glpi_requesttypes` WRITE;
/*!40000 ALTER TABLE `glpi_requesttypes` DISABLE KEYS */;
INSERT INTO `glpi_requesttypes` VALUES (1,'Helpdesk',1,1,0,0,1,1,1,NULL,NULL,NULL),(2,'E-Mail',0,0,1,1,1,1,1,NULL,NULL,NULL),(3,'Phone',0,0,0,0,1,1,1,NULL,NULL,NULL),(4,'Direct',0,0,0,0,1,1,1,NULL,NULL,NULL),(5,'Written',0,0,0,0,1,1,1,NULL,NULL,NULL),(6,'Other',0,0,0,0,1,1,1,NULL,NULL,NULL),(7,'Formcreator',0,0,0,0,1,1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `glpi_requesttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_reservationitems`
--

DROP TABLE IF EXISTS `glpi_reservationitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_reservationitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `items_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_active` (`is_active`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_reservationitems`
--

LOCK TABLES `glpi_reservationitems` WRITE;
/*!40000 ALTER TABLE `glpi_reservationitems` DISABLE KEYS */;
INSERT INTO `glpi_reservationitems` VALUES (1,'Computer',0,0,1,NULL,1,0);
/*!40000 ALTER TABLE `glpi_reservationitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_reservations`
--

DROP TABLE IF EXISTS `glpi_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_reservations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservationitems_id` int(11) NOT NULL DEFAULT '0',
  `begin` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `group` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `reservationitems_id` (`reservationitems_id`),
  KEY `users_id` (`users_id`),
  KEY `resagroup` (`reservationitems_id`,`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_reservations`
--

LOCK TABLES `glpi_reservations` WRITE;
/*!40000 ALTER TABLE `glpi_reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_rssfeeds`
--

DROP TABLE IF EXISTS `glpi_rssfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_rssfeeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `url` text COLLATE utf8_unicode_ci,
  `refresh_rate` int(11) NOT NULL DEFAULT '86400',
  `max_items` int(11) NOT NULL DEFAULT '20',
  `have_error` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `users_id` (`users_id`),
  KEY `date_mod` (`date_mod`),
  KEY `have_error` (`have_error`),
  KEY `is_active` (`is_active`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_rssfeeds`
--

LOCK TABLES `glpi_rssfeeds` WRITE;
/*!40000 ALTER TABLE `glpi_rssfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_rssfeeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_rssfeeds_users`
--

DROP TABLE IF EXISTS `glpi_rssfeeds_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_rssfeeds_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rssfeeds_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rssfeeds_id` (`rssfeeds_id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_rssfeeds_users`
--

LOCK TABLES `glpi_rssfeeds_users` WRITE;
/*!40000 ALTER TABLE `glpi_rssfeeds_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_rssfeeds_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_ruleactions`
--

DROP TABLE IF EXISTS `glpi_ruleactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_ruleactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `action_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'VALUE IN (assign, regex_result, append_regex_result, affectbyip, affectbyfqdn, affectbymac)',
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rules_id` (`rules_id`),
  KEY `field_value` (`field`(50),`value`(50))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_ruleactions`
--

LOCK TABLES `glpi_ruleactions` WRITE;
/*!40000 ALTER TABLE `glpi_ruleactions` DISABLE KEYS */;
INSERT INTO `glpi_ruleactions` VALUES (2,2,'assign','entities_id','0'),(3,3,'assign','entities_id','0'),(4,4,'assign','_refuse_email_no_response','1'),(5,5,'assign','_refuse_email_no_response','1'),(6,6,'fromitem','locations_id','1'),(7,7,'fromuser','locations_id','1'),(8,8,'assign','_import_category','1'),(9,9,'regex_result','_affect_user_by_regex','#0'),(10,10,'regex_result','_affect_user_by_regex','#0'),(11,11,'regex_result','_affect_user_by_regex','#0'),(12,12,'append_regex_result','name','1000');
/*!40000 ALTER TABLE `glpi_ruleactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_rulecriterias`
--

DROP TABLE IF EXISTS `glpi_rulecriterias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_rulecriterias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rules_id` int(11) NOT NULL DEFAULT '0',
  `criteria` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT '0' COMMENT 'see define.php PATTERN_* and REGEX_* constant',
  `pattern` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `rules_id` (`rules_id`),
  KEY `condition` (`condition`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_rulecriterias`
--

LOCK TABLES `glpi_rulecriterias` WRITE;
/*!40000 ALTER TABLE `glpi_rulecriterias` DISABLE KEYS */;
INSERT INTO `glpi_rulecriterias` VALUES (2,2,'uid',0,'*'),(3,2,'samaccountname',0,'*'),(4,2,'MAIL_EMAIL',0,'*'),(5,3,'subject',6,'/.*/'),(6,4,'x-auto-response-suppress',6,'/\\S+/'),(7,5,'auto-submitted',6,'/^(?!.*no).+$/i'),(9,6,'locations_id',9,'1'),(10,6,'items_locations',8,'1'),(11,7,'locations_id',9,'1'),(12,7,'users_locations',8,'1'),(13,8,'name',0,'*'),(14,9,'_itemtype',0,'Computer'),(15,9,'_auto',0,'1'),(16,9,'contact',6,'/(.*)@/'),(17,10,'_itemtype',0,'Computer'),(18,10,'_auto',0,'1'),(19,10,'contact',6,'/(.*),/'),(20,11,'_itemtype',0,'Computer'),(21,11,'_auto',0,'1'),(22,11,'contact',6,'/(.*)/'),(24,13,'name',0,'x64'),(25,13,'name',0,'i386');
/*!40000 ALTER TABLE `glpi_rulecriterias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_rulerightparameters`
--

DROP TABLE IF EXISTS `glpi_rulerightparameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_rulerightparameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_rulerightparameters`
--

LOCK TABLES `glpi_rulerightparameters` WRITE;
/*!40000 ALTER TABLE `glpi_rulerightparameters` DISABLE KEYS */;
INSERT INTO `glpi_rulerightparameters` VALUES (1,'(LDAP)Organization','o','',NULL,NULL),(2,'(LDAP)Common Name','cn','',NULL,NULL),(3,'(LDAP)Department Number','departmentnumber','',NULL,NULL),(4,'(LDAP)Email','mail','',NULL,NULL),(5,'Object Class','objectclass','',NULL,NULL),(6,'(LDAP)User ID','uid','',NULL,NULL),(7,'(LDAP)Telephone Number','phone','',NULL,NULL),(8,'(LDAP)Employee Number','employeenumber','',NULL,NULL),(9,'(LDAP)Manager','manager','',NULL,NULL),(10,'(LDAP)DistinguishedName','dn','',NULL,NULL),(12,'(AD)User ID','samaccountname','',NULL,NULL),(13,'(LDAP) Title','title','',NULL,NULL),(14,'(LDAP) MemberOf','memberof','',NULL,NULL);
/*!40000 ALTER TABLE `glpi_rulerightparameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_rules`
--

DROP TABLE IF EXISTS `glpi_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `sub_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ranking` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `match` char(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'see define.php *_MATCHING constant',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT '0',
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_active` (`is_active`),
  KEY `sub_type` (`sub_type`),
  KEY `date_mod` (`date_mod`),
  KEY `is_recursive` (`is_recursive`),
  KEY `condition` (`condition`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_rules`
--

LOCK TABLES `glpi_rules` WRITE;
/*!40000 ALTER TABLE `glpi_rules` DISABLE KEYS */;
INSERT INTO `glpi_rules` VALUES (2,0,'RuleRight',1,'Root','','OR',1,NULL,NULL,0,'500717c8-2bd6e957-53a12b5fd35745.02608131',0,NULL),(3,0,'RuleMailCollector',3,'Root','','OR',1,NULL,NULL,0,'500717c8-2bd6e957-53a12b5fd36404.54713349',0,NULL),(4,0,'RuleMailCollector',1,'X-Auto-Response-Suppress','Exclude Auto-Reply emails using X-Auto-Response-Suppress header','AND',0,NULL,'2011-01-18 11:40:42',1,'500717c8-2bd6e957-53a12b5fd36d97.94503423',0,NULL),(5,0,'RuleMailCollector',2,'Auto-Reply Auto-Submitted','Exclude Auto-Reply emails using Auto-Submitted header','OR',1,NULL,'2011-01-18 11:40:42',1,'500717c8-2bd6e957-53a12b5fd376c2.87642651',0,NULL),(6,0,'RuleTicket',1,'Ticket location from item','','AND',0,'Automatically generated by GLPI 0.84',NULL,1,'500717c8-2bd6e957-53a12b5fd37f94.10365341',1,NULL),(7,0,'RuleTicket',2,'Ticket location from user','','AND',0,'Automatically generated by GLPI 0.84',NULL,1,'500717c8-2bd6e957-53a12b5fd38869.86002585',1,NULL),(8,0,'RuleSoftwareCategory',1,'Import category from inventory tool','','AND',0,'Automatically generated by GLPI 9.2',NULL,1,'500717c8-2bd6e957-53a12b5fd38869.86003425',1,NULL),(9,0,'RuleAsset',1,'Domain user assignation','','AND',1,'Сгенерировано автоматически GLPI 9.4',NULL,1,'fbeb1115-7a37b143-5a3a6fc1afdc17.92779763',3,NULL),(10,0,'RuleAsset',2,'Multiple users: assign to the first','','AND',1,'Сгенерировано автоматически GLPI 9.4',NULL,1,'fbeb1115-7a37b143-5a3a6fc1b03762.88595154',3,NULL),(11,0,'RuleAsset',3,'One user assignation','','AND',1,'Сгенерировано автоматически GLPI 9.4',NULL,1,'fbeb1115-7a37b143-5a3a6fc1b073e1.16257440',3,NULL),(12,0,'RuleDictionnaryNetworkEquipmentType',1,'network_device','Сетевое оборудование','AND',1,'','2019-02-15 06:30:11',0,'749a0a43-e5de59b9-5c665c47b59e76.06354091',0,'2019-02-15 06:29:27'),(13,0,'RuleDictionnaryOperatingSystemArchitecture',1,'i386','x64','OR',1,'','2019-02-22 10:37:44',0,'749a0a43-f37490bd-5c6fd0a03458b3.03107752',0,'2019-02-22 10:36:16');
/*!40000 ALTER TABLE `glpi_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_savedsearches`
--

DROP TABLE IF EXISTS `glpi_savedsearches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_savedsearches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT 'see SavedSearch:: constants',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `is_private` tinyint(1) NOT NULL DEFAULT '1',
  `entities_id` int(11) NOT NULL DEFAULT '-1',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `query` text COLLATE utf8_unicode_ci,
  `last_execution_time` int(11) DEFAULT NULL,
  `do_count` tinyint(1) NOT NULL DEFAULT '2' COMMENT 'Do or do not count results on list display see SavedSearch::COUNT_* constants',
  `last_execution_date` datetime DEFAULT NULL,
  `counter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `itemtype` (`itemtype`),
  KEY `entities_id` (`entities_id`),
  KEY `users_id` (`users_id`),
  KEY `is_private` (`is_private`),
  KEY `is_recursive` (`is_recursive`),
  KEY `last_execution_time` (`last_execution_time`),
  KEY `last_execution_date` (`last_execution_date`),
  KEY `do_count` (`do_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_savedsearches`
--

LOCK TABLES `glpi_savedsearches` WRITE;
/*!40000 ALTER TABLE `glpi_savedsearches` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_savedsearches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_savedsearches_alerts`
--

DROP TABLE IF EXISTS `glpi_savedsearches_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_savedsearches_alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `savedsearches_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `operator` tinyint(1) NOT NULL,
  `value` int(11) NOT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`savedsearches_id`,`operator`,`value`),
  KEY `name` (`name`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_savedsearches_alerts`
--

LOCK TABLES `glpi_savedsearches_alerts` WRITE;
/*!40000 ALTER TABLE `glpi_savedsearches_alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_savedsearches_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_savedsearches_users`
--

DROP TABLE IF EXISTS `glpi_savedsearches_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_savedsearches_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `itemtype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `savedsearches_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`itemtype`),
  KEY `savedsearches_id` (`savedsearches_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_savedsearches_users`
--

LOCK TABLES `glpi_savedsearches_users` WRITE;
/*!40000 ALTER TABLE `glpi_savedsearches_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_savedsearches_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_slalevelactions`
--

DROP TABLE IF EXISTS `glpi_slalevelactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_slalevelactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slalevels_id` int(11) NOT NULL DEFAULT '0',
  `action_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slalevels_id` (`slalevels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_slalevelactions`
--

LOCK TABLES `glpi_slalevelactions` WRITE;
/*!40000 ALTER TABLE `glpi_slalevelactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_slalevelactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_slalevelcriterias`
--

DROP TABLE IF EXISTS `glpi_slalevelcriterias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_slalevelcriterias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slalevels_id` int(11) NOT NULL DEFAULT '0',
  `criteria` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT '0' COMMENT 'see define.php PATTERN_* and REGEX_* constant',
  `pattern` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slalevels_id` (`slalevels_id`),
  KEY `condition` (`condition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_slalevelcriterias`
--

LOCK TABLES `glpi_slalevelcriterias` WRITE;
/*!40000 ALTER TABLE `glpi_slalevelcriterias` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_slalevelcriterias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_slalevels`
--

DROP TABLE IF EXISTS `glpi_slalevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_slalevels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slas_id` int(11) NOT NULL DEFAULT '0',
  `execution_time` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `match` char(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'see define.php *_MATCHING constant',
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_active` (`is_active`),
  KEY `slas_id` (`slas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_slalevels`
--

LOCK TABLES `glpi_slalevels` WRITE;
/*!40000 ALTER TABLE `glpi_slalevels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_slalevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_slalevels_tickets`
--

DROP TABLE IF EXISTS `glpi_slalevels_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_slalevels_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `slalevels_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`slalevels_id`),
  KEY `tickets_id` (`tickets_id`),
  KEY `slalevels_id` (`slalevels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_slalevels_tickets`
--

LOCK TABLES `glpi_slalevels_tickets` WRITE;
/*!40000 ALTER TABLE `glpi_slalevels_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_slalevels_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_slas`
--

DROP TABLE IF EXISTS `glpi_slas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_slas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `number_time` int(11) NOT NULL,
  `calendars_id` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `definition_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_of_working_day` tinyint(1) NOT NULL DEFAULT '0',
  `date_creation` datetime DEFAULT NULL,
  `slms_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `calendars_id` (`calendars_id`),
  KEY `slms_id` (`slms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_slas`
--

LOCK TABLES `glpi_slas` WRITE;
/*!40000 ALTER TABLE `glpi_slas` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_slas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_slms`
--

DROP TABLE IF EXISTS `glpi_slms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_slms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `calendars_id` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `calendars_id` (`calendars_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_slms`
--

LOCK TABLES `glpi_slms` WRITE;
/*!40000 ALTER TABLE `glpi_slms` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_slms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_softwarecategories`
--

DROP TABLE IF EXISTS `glpi_softwarecategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_softwarecategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `softwarecategories_id` int(11) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `softwarecategories_id` (`softwarecategories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_softwarecategories`
--

LOCK TABLES `glpi_softwarecategories` WRITE;
/*!40000 ALTER TABLE `glpi_softwarecategories` DISABLE KEYS */;
INSERT INTO `glpi_softwarecategories` VALUES (1,'FUSION',NULL,0,'FUSION',1,NULL,NULL);
/*!40000 ALTER TABLE `glpi_softwarecategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_softwarelicenses`
--

DROP TABLE IF EXISTS `glpi_softwarelicenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_softwarelicenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `softwares_id` int(11) NOT NULL DEFAULT '0',
  `softwarelicenses_id` int(11) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `number` int(11) NOT NULL DEFAULT '0',
  `softwarelicensetypes_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherserial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `softwareversions_id_buy` int(11) NOT NULL DEFAULT '0',
  `softwareversions_id_use` int(11) NOT NULL DEFAULT '0',
  `expire` date DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `is_valid` tinyint(1) NOT NULL DEFAULT '1',
  `date_creation` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `is_helpdesk_visible` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `states_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `expire` (`expire`),
  KEY `softwareversions_id_buy` (`softwareversions_id_buy`),
  KEY `entities_id` (`entities_id`),
  KEY `softwarelicensetypes_id` (`softwarelicensetypes_id`),
  KEY `softwareversions_id_use` (`softwareversions_id_use`),
  KEY `date_mod` (`date_mod`),
  KEY `softwares_id_expire` (`softwares_id`,`expire`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `users_id` (`users_id`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `groups_id` (`groups_id`),
  KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_creation` (`date_creation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_softwarelicenses`
--

LOCK TABLES `glpi_softwarelicenses` WRITE;
/*!40000 ALTER TABLE `glpi_softwarelicenses` DISABLE KEYS */;
INSERT INTO `glpi_softwarelicenses` VALUES (1,1,0,'OS Windows',1,0,0,10,1,'OS Windows','','',1,1,NULL,'','2019-02-22 05:43:22',1,'2019-02-22 05:43:22',0,2,5,6,0,0,0,0,NULL,1,0,NULL,NULL);
/*!40000 ALTER TABLE `glpi_softwarelicenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_softwarelicensetypes`
--

DROP TABLE IF EXISTS `glpi_softwarelicensetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_softwarelicensetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `softwarelicensetypes_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `softwarelicensetypes_id` (`softwarelicensetypes_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_softwarelicensetypes`
--

LOCK TABLES `glpi_softwarelicensetypes` WRITE;
/*!40000 ALTER TABLE `glpi_softwarelicensetypes` DISABLE KEYS */;
INSERT INTO `glpi_softwarelicensetypes` VALUES (1,'OEM','',NULL,NULL,0,0,NULL,NULL,0,1,'OEM');
/*!40000 ALTER TABLE `glpi_softwarelicensetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_softwares`
--

DROP TABLE IF EXISTS `glpi_softwares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_softwares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `is_update` tinyint(1) NOT NULL DEFAULT '0',
  `softwares_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_template` tinyint(1) NOT NULL DEFAULT '0',
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `ticket_tco` decimal(20,4) DEFAULT '0.0000',
  `is_helpdesk_visible` tinyint(1) NOT NULL DEFAULT '1',
  `softwarecategories_id` int(11) NOT NULL DEFAULT '0',
  `is_valid` tinyint(1) NOT NULL DEFAULT '1',
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_update` (`is_update`),
  KEY `softwarecategories_id` (`softwarecategories_id`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `softwares_id` (`softwares_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_softwares`
--

LOCK TABLES `glpi_softwares` WRITE;
/*!40000 ALTER TABLE `glpi_softwares` DISABLE KEYS */;
INSERT INTO `glpi_softwares` VALUES (1,0,0,'Ms Windows 10 ru x23-x64','',2,0,6,0,0,0,0,0,NULL,'2019-02-21 06:34:48',6,0,0.0000,1,0,1,'2019-02-21 06:34:48');
/*!40000 ALTER TABLE `glpi_softwares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_softwareversions`
--

DROP TABLE IF EXISTS `glpi_softwareversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_softwareversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `softwares_id` int(11) NOT NULL DEFAULT '0',
  `states_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `operatingsystems_id` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `softwares_id` (`softwares_id`),
  KEY `states_id` (`states_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `operatingsystems_id` (`operatingsystems_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_softwareversions`
--

LOCK TABLES `glpi_softwareversions` WRITE;
/*!40000 ALTER TABLE `glpi_softwareversions` DISABLE KEYS */;
INSERT INTO `glpi_softwareversions` VALUES (1,0,0,1,1,'10','',1,'2019-02-22 05:42:18','2019-02-22 05:42:18');
/*!40000 ALTER TABLE `glpi_softwareversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_solutiontemplates`
--

DROP TABLE IF EXISTS `glpi_solutiontemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_solutiontemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `solutiontypes_id` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `solutiontypes_id` (`solutiontypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_solutiontemplates`
--

LOCK TABLES `glpi_solutiontemplates` WRITE;
/*!40000 ALTER TABLE `glpi_solutiontemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_solutiontemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_solutiontypes`
--

DROP TABLE IF EXISTS `glpi_solutiontypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_solutiontypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '1',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_solutiontypes`
--

LOCK TABLES `glpi_solutiontypes` WRITE;
/*!40000 ALTER TABLE `glpi_solutiontypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_solutiontypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_ssovariables`
--

DROP TABLE IF EXISTS `glpi_ssovariables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_ssovariables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_ssovariables`
--

LOCK TABLES `glpi_ssovariables` WRITE;
/*!40000 ALTER TABLE `glpi_ssovariables` DISABLE KEYS */;
INSERT INTO `glpi_ssovariables` VALUES (1,'HTTP_AUTH_USER','',NULL,NULL),(2,'REMOTE_USER','',NULL,NULL),(3,'PHP_AUTH_USER','',NULL,NULL),(4,'USERNAME','',NULL,NULL),(5,'REDIRECT_REMOTE_USER','',NULL,NULL),(6,'HTTP_REMOTE_USER','',NULL,NULL);
/*!40000 ALTER TABLE `glpi_ssovariables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_states`
--

DROP TABLE IF EXISTS `glpi_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `states_id` int(11) NOT NULL DEFAULT '0',
  `completename` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `is_visible_computer` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_monitor` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_networkequipment` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_peripheral` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_phone` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_printer` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_softwareversion` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_softwarelicense` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_line` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_certificate` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_rack` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_enclosure` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_pdu` tinyint(1) NOT NULL DEFAULT '1',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`states_id`,`name`),
  KEY `name` (`name`),
  KEY `is_visible_computer` (`is_visible_computer`),
  KEY `is_visible_monitor` (`is_visible_monitor`),
  KEY `is_visible_networkequipment` (`is_visible_networkequipment`),
  KEY `is_visible_peripheral` (`is_visible_peripheral`),
  KEY `is_visible_phone` (`is_visible_phone`),
  KEY `is_visible_printer` (`is_visible_printer`),
  KEY `is_visible_softwareversion` (`is_visible_softwareversion`),
  KEY `is_visible_softwarelicense` (`is_visible_softwarelicense`),
  KEY `is_visible_line` (`is_visible_line`),
  KEY `is_visible_certificate` (`is_visible_certificate`),
  KEY `is_visible_rack` (`is_visible_rack`),
  KEY `is_visible_enclosure` (`is_visible_enclosure`),
  KEY `is_visible_pdu` (`is_visible_pdu`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_states`
--

LOCK TABLES `glpi_states` WRITE;
/*!40000 ALTER TABLE `glpi_states` DISABLE KEYS */;
INSERT INTO `glpi_states` VALUES (1,'on',0,0,'',0,'on',1,'[]',NULL,1,1,1,1,1,1,1,1,1,1,1,1,1,'2019-02-11 09:33:39','2019-02-11 09:33:39'),(2,'off',0,0,'',0,'off',1,'[]',NULL,1,1,1,1,1,1,1,1,1,1,1,1,1,'2019-02-11 09:33:48','2019-02-11 09:33:48');
/*!40000 ALTER TABLE `glpi_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_suppliers`
--

DROP TABLE IF EXISTS `glpi_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suppliertypes_id` int(11) NOT NULL DEFAULT '0',
  `address` text COLLATE utf8_unicode_ci,
  `postcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `town` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phonenumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `suppliertypes_id` (`suppliertypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_suppliers`
--

LOCK TABLES `glpi_suppliers` WRITE;
/*!40000 ALTER TABLE `glpi_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_suppliers_tickets`
--

DROP TABLE IF EXISTS `glpi_suppliers_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_suppliers_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `suppliers_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `use_notification` tinyint(1) NOT NULL DEFAULT '1',
  `alternative_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`type`,`suppliers_id`),
  KEY `group` (`suppliers_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_suppliers_tickets`
--

LOCK TABLES `glpi_suppliers_tickets` WRITE;
/*!40000 ALTER TABLE `glpi_suppliers_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_suppliers_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_suppliertypes`
--

DROP TABLE IF EXISTS `glpi_suppliertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_suppliertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_suppliertypes`
--

LOCK TABLES `glpi_suppliertypes` WRITE;
/*!40000 ALTER TABLE `glpi_suppliertypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_suppliertypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_taskcategories`
--

DROP TABLE IF EXISTS `glpi_taskcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_taskcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `taskcategories_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `completename` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `level` int(11) NOT NULL DEFAULT '0',
  `ancestors_cache` longtext COLLATE utf8_unicode_ci,
  `sons_cache` longtext COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_helpdeskvisible` tinyint(1) NOT NULL DEFAULT '1',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `knowbaseitemcategories_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `is_helpdeskvisible` (`is_helpdeskvisible`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_taskcategories`
--

LOCK TABLES `glpi_taskcategories` WRITE;
/*!40000 ALTER TABLE `glpi_taskcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_taskcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_tasktemplates`
--

DROP TABLE IF EXISTS `glpi_tasktemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_tasktemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `taskcategories_id` int(11) NOT NULL DEFAULT '0',
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `entities_id` (`entities_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_private` (`is_private`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_tasktemplates`
--

LOCK TABLES `glpi_tasktemplates` WRITE;
/*!40000 ALTER TABLE `glpi_tasktemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_tasktemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_ticketcosts`
--

DROP TABLE IF EXISTS `glpi_ticketcosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_ticketcosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `cost_time` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `cost_material` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `budgets_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `tickets_id` (`tickets_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_ticketcosts`
--

LOCK TABLES `glpi_ticketcosts` WRITE;
/*!40000 ALTER TABLE `glpi_ticketcosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_ticketcosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_ticketrecurrents`
--

DROP TABLE IF EXISTS `glpi_ticketrecurrents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_ticketrecurrents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `tickettemplates_id` int(11) NOT NULL DEFAULT '0',
  `begin_date` datetime DEFAULT NULL,
  `periodicity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_before` int(11) NOT NULL DEFAULT '0',
  `next_creation_date` datetime DEFAULT NULL,
  `calendars_id` int(11) NOT NULL DEFAULT '0',
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `tickettemplates_id` (`tickettemplates_id`),
  KEY `next_creation_date` (`next_creation_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_ticketrecurrents`
--

LOCK TABLES `glpi_ticketrecurrents` WRITE;
/*!40000 ALTER TABLE `glpi_ticketrecurrents` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_ticketrecurrents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_tickets`
--

DROP TABLE IF EXISTS `glpi_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `closedate` datetime DEFAULT NULL,
  `solvedate` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `users_id_lastupdater` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `users_id_recipient` int(11) NOT NULL DEFAULT '0',
  `requesttypes_id` int(11) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `urgency` int(11) NOT NULL DEFAULT '1',
  `impact` int(11) NOT NULL DEFAULT '1',
  `priority` int(11) NOT NULL DEFAULT '1',
  `itilcategories_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `global_validation` int(11) NOT NULL DEFAULT '1',
  `slas_id_ttr` int(11) NOT NULL DEFAULT '0',
  `slas_id_tto` int(11) NOT NULL DEFAULT '0',
  `slalevels_id_ttr` int(11) NOT NULL DEFAULT '0',
  `time_to_resolve` datetime DEFAULT NULL,
  `time_to_own` datetime DEFAULT NULL,
  `begin_waiting_date` datetime DEFAULT NULL,
  `sla_waiting_duration` int(11) NOT NULL DEFAULT '0',
  `ola_waiting_duration` int(11) NOT NULL DEFAULT '0',
  `olas_id_tto` int(11) NOT NULL DEFAULT '0',
  `olas_id_ttr` int(11) NOT NULL DEFAULT '0',
  `olalevels_id_ttr` int(11) NOT NULL DEFAULT '0',
  `internal_time_to_resolve` datetime DEFAULT NULL,
  `internal_time_to_own` datetime DEFAULT NULL,
  `waiting_duration` int(11) NOT NULL DEFAULT '0',
  `close_delay_stat` int(11) NOT NULL DEFAULT '0',
  `solve_delay_stat` int(11) NOT NULL DEFAULT '0',
  `takeintoaccount_delay_stat` int(11) NOT NULL DEFAULT '0',
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `validation_percent` int(11) NOT NULL DEFAULT '0',
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `closedate` (`closedate`),
  KEY `status` (`status`),
  KEY `priority` (`priority`),
  KEY `request_type` (`requesttypes_id`),
  KEY `date_mod` (`date_mod`),
  KEY `entities_id` (`entities_id`),
  KEY `users_id_recipient` (`users_id_recipient`),
  KEY `solvedate` (`solvedate`),
  KEY `urgency` (`urgency`),
  KEY `impact` (`impact`),
  KEY `global_validation` (`global_validation`),
  KEY `time_to_resolve` (`time_to_resolve`),
  KEY `time_to_own` (`time_to_own`),
  KEY `internal_time_to_resolve` (`internal_time_to_resolve`),
  KEY `internal_time_to_own` (`internal_time_to_own`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`),
  KEY `type` (`type`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `name` (`name`),
  KEY `locations_id` (`locations_id`),
  KEY `date_creation` (`date_creation`),
  KEY `ola_waiting_duration` (`ola_waiting_duration`),
  KEY `olas_id_tto` (`olas_id_tto`),
  KEY `olas_id_ttr` (`olas_id_ttr`),
  KEY `olalevels_id_ttr` (`olalevels_id_ttr`),
  KEY `slas_id_tto` (`slas_id_tto`),
  KEY `slas_id_ttr` (`slas_id_ttr`),
  KEY `slalevels_id_ttr` (`slalevels_id_ttr`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_tickets`
--

LOCK TABLES `glpi_tickets` WRITE;
/*!40000 ALTER TABLE `glpi_tickets` DISABLE KEYS */;
INSERT INTO `glpi_tickets` VALUES (1,0,'Перезагружается каждый час','2019-02-11 10:10:00',NULL,NULL,'2019-02-11 10:11:54',2,2,2,1,'Перезагружается каждый час',4,3,4,0,1,1,0,0,0,'2019-02-12 00:00:00','2019-02-11 16:10:00',NULL,0,0,0,0,0,NULL,NULL,0,0,0,114,0,0,1,0,'2019-02-11 10:11:54'),(2,0,'Тип подключения, Полоса пропускания','2019-02-13 04:45:00',NULL,NULL,'2019-02-15 09:55:22',2,1,4,7,'&lt;h1&gt;Форма данных&lt;/h1&gt;&lt;h2&gt;Тип подключения&lt;/h2&gt;&lt;div&gt;&lt;strong&gt;1) Полоса пропускания : &lt;/strong&gt; &lt;/div&gt;&lt;div&gt;&lt;strong&gt;2) СПД ЦОД : &lt;/strong&gt;MDA1.1-EX4200-3&lt;/div&gt;&lt;div&gt;&lt;strong&gt;3) Тип подключения : &lt;/strong&gt; &lt;/div&gt;&lt;div&gt;&lt;strong&gt;4) Порт : &lt;/strong&gt;&lt;br /&gt;0/0/0&lt;/div&gt;',3,3,3,0,1,1,0,0,0,NULL,NULL,NULL,0,0,0,0,0,NULL,NULL,0,0,0,80935,0,0,0,0,'2019-02-13 04:45:00'),(3,0,'Надо подумать','2019-02-22 00:00:00',NULL,NULL,'2019-02-22 08:28:24',2,2,2,1,'&lt;p&gt;Надо подумать&lt;/p&gt;',3,3,3,0,1,1,0,0,0,'2019-02-28 00:00:00',NULL,NULL,0,0,0,0,0,NULL,NULL,0,0,0,30504,0,0,0,0,'2019-02-22 08:28:24');
/*!40000 ALTER TABLE `glpi_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_tickets_tickets`
--

DROP TABLE IF EXISTS `glpi_tickets_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_tickets_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id_1` int(11) NOT NULL DEFAULT '0',
  `tickets_id_2` int(11) NOT NULL DEFAULT '0',
  `link` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id_1`,`tickets_id_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_tickets_tickets`
--

LOCK TABLES `glpi_tickets_tickets` WRITE;
/*!40000 ALTER TABLE `glpi_tickets_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_tickets_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_tickets_users`
--

DROP TABLE IF EXISTS `glpi_tickets_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_tickets_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `use_notification` tinyint(1) NOT NULL DEFAULT '1',
  `alternative_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`type`,`users_id`,`alternative_email`),
  KEY `user` (`users_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_tickets_users`
--

LOCK TABLES `glpi_tickets_users` WRITE;
/*!40000 ALTER TABLE `glpi_tickets_users` DISABLE KEYS */;
INSERT INTO `glpi_tickets_users` VALUES (1,1,2,1,1,''),(2,1,2,2,1,''),(3,2,4,1,1,''),(4,3,6,1,1,''),(5,3,2,2,1,'');
/*!40000 ALTER TABLE `glpi_tickets_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_ticketsatisfactions`
--

DROP TABLE IF EXISTS `glpi_ticketsatisfactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_ticketsatisfactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `date_begin` datetime DEFAULT NULL,
  `date_answered` datetime DEFAULT NULL,
  `satisfaction` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tickets_id` (`tickets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_ticketsatisfactions`
--

LOCK TABLES `glpi_ticketsatisfactions` WRITE;
/*!40000 ALTER TABLE `glpi_ticketsatisfactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_ticketsatisfactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_tickettasks`
--

DROP TABLE IF EXISTS `glpi_tickettasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_tickettasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `taskcategories_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `users_id_editor` int(11) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `actiontime` int(11) NOT NULL DEFAULT '0',
  `begin` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `users_id_tech` int(11) NOT NULL DEFAULT '0',
  `groups_id_tech` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tasktemplates_id` int(11) NOT NULL DEFAULT '0',
  `timeline_position` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `users_id` (`users_id`),
  KEY `users_id_editor` (`users_id_editor`),
  KEY `tickets_id` (`tickets_id`),
  KEY `is_private` (`is_private`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `state` (`state`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `tasktemplates_id` (`tasktemplates_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_tickettasks`
--

LOCK TABLES `glpi_tickettasks` WRITE;
/*!40000 ALTER TABLE `glpi_tickettasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_tickettasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_tickettemplatehiddenfields`
--

DROP TABLE IF EXISTS `glpi_tickettemplatehiddenfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_tickettemplatehiddenfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickettemplates_id` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickettemplates_id`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_tickettemplatehiddenfields`
--

LOCK TABLES `glpi_tickettemplatehiddenfields` WRITE;
/*!40000 ALTER TABLE `glpi_tickettemplatehiddenfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_tickettemplatehiddenfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_tickettemplatemandatoryfields`
--

DROP TABLE IF EXISTS `glpi_tickettemplatemandatoryfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_tickettemplatemandatoryfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickettemplates_id` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickettemplates_id`,`num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_tickettemplatemandatoryfields`
--

LOCK TABLES `glpi_tickettemplatemandatoryfields` WRITE;
/*!40000 ALTER TABLE `glpi_tickettemplatemandatoryfields` DISABLE KEYS */;
INSERT INTO `glpi_tickettemplatemandatoryfields` VALUES (1,1,21);
/*!40000 ALTER TABLE `glpi_tickettemplatemandatoryfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_tickettemplatepredefinedfields`
--

DROP TABLE IF EXISTS `glpi_tickettemplatepredefinedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_tickettemplatepredefinedfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tickettemplates_id` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `tickettemplates_id_id_num` (`tickettemplates_id`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_tickettemplatepredefinedfields`
--

LOCK TABLES `glpi_tickettemplatepredefinedfields` WRITE;
/*!40000 ALTER TABLE `glpi_tickettemplatepredefinedfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_tickettemplatepredefinedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_tickettemplates`
--

DROP TABLE IF EXISTS `glpi_tickettemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_tickettemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_tickettemplates`
--

LOCK TABLES `glpi_tickettemplates` WRITE;
/*!40000 ALTER TABLE `glpi_tickettemplates` DISABLE KEYS */;
INSERT INTO `glpi_tickettemplates` VALUES (1,'Default',0,1,NULL);
/*!40000 ALTER TABLE `glpi_tickettemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_ticketvalidations`
--

DROP TABLE IF EXISTS `glpi_ticketvalidations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_ticketvalidations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) NOT NULL DEFAULT '0',
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `users_id_validate` int(11) NOT NULL DEFAULT '0',
  `comment_submission` text COLLATE utf8_unicode_ci,
  `comment_validation` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '2',
  `submission_date` datetime DEFAULT NULL,
  `validation_date` datetime DEFAULT NULL,
  `timeline_position` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_validate` (`users_id_validate`),
  KEY `tickets_id` (`tickets_id`),
  KEY `submission_date` (`submission_date`),
  KEY `validation_date` (`validation_date`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_ticketvalidations`
--

LOCK TABLES `glpi_ticketvalidations` WRITE;
/*!40000 ALTER TABLE `glpi_ticketvalidations` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_ticketvalidations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_transfers`
--

DROP TABLE IF EXISTS `glpi_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keep_ticket` int(11) NOT NULL DEFAULT '0',
  `keep_networklink` int(11) NOT NULL DEFAULT '0',
  `keep_reservation` int(11) NOT NULL DEFAULT '0',
  `keep_history` int(11) NOT NULL DEFAULT '0',
  `keep_device` int(11) NOT NULL DEFAULT '0',
  `keep_infocom` int(11) NOT NULL DEFAULT '0',
  `keep_dc_monitor` int(11) NOT NULL DEFAULT '0',
  `clean_dc_monitor` int(11) NOT NULL DEFAULT '0',
  `keep_dc_phone` int(11) NOT NULL DEFAULT '0',
  `clean_dc_phone` int(11) NOT NULL DEFAULT '0',
  `keep_dc_peripheral` int(11) NOT NULL DEFAULT '0',
  `clean_dc_peripheral` int(11) NOT NULL DEFAULT '0',
  `keep_dc_printer` int(11) NOT NULL DEFAULT '0',
  `clean_dc_printer` int(11) NOT NULL DEFAULT '0',
  `keep_supplier` int(11) NOT NULL DEFAULT '0',
  `clean_supplier` int(11) NOT NULL DEFAULT '0',
  `keep_contact` int(11) NOT NULL DEFAULT '0',
  `clean_contact` int(11) NOT NULL DEFAULT '0',
  `keep_contract` int(11) NOT NULL DEFAULT '0',
  `clean_contract` int(11) NOT NULL DEFAULT '0',
  `keep_software` int(11) NOT NULL DEFAULT '0',
  `clean_software` int(11) NOT NULL DEFAULT '0',
  `keep_document` int(11) NOT NULL DEFAULT '0',
  `clean_document` int(11) NOT NULL DEFAULT '0',
  `keep_cartridgeitem` int(11) NOT NULL DEFAULT '0',
  `clean_cartridgeitem` int(11) NOT NULL DEFAULT '0',
  `keep_cartridge` int(11) NOT NULL DEFAULT '0',
  `keep_consumable` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `keep_disk` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_transfers`
--

LOCK TABLES `glpi_transfers` WRITE;
/*!40000 ALTER TABLE `glpi_transfers` DISABLE KEYS */;
INSERT INTO `glpi_transfers` VALUES (1,'complete',2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,NULL,NULL,1),(2,'plugin_uninstall',0,2,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,'2019-02-13 07:58:06',NULL,0);
/*!40000 ALTER TABLE `glpi_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_usercategories`
--

DROP TABLE IF EXISTS `glpi_usercategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_usercategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_usercategories`
--

LOCK TABLES `glpi_usercategories` WRITE;
/*!40000 ALTER TABLE `glpi_usercategories` DISABLE KEYS */;
INSERT INTO `glpi_usercategories` VALUES (1,'Разработчик','','2019-02-11 10:16:37','2019-02-11 10:16:37');
/*!40000 ALTER TABLE `glpi_usercategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_useremails`
--

DROP TABLE IF EXISTS `glpi_useremails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_useremails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_dynamic` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`email`),
  KEY `email` (`email`),
  KEY `is_default` (`is_default`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_useremails`
--

LOCK TABLES `glpi_useremails` WRITE;
/*!40000 ALTER TABLE `glpi_useremails` DISABLE KEYS */;
INSERT INTO `glpi_useremails` VALUES (1,6,1,0,'d.tailakov@mycloud.kz'),(2,7,1,0,'a.dosmagambetov@mycloud.kz');
/*!40000 ALTER TABLE `glpi_useremails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_users`
--

DROP TABLE IF EXISTS `glpi_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locations_id` int(11) NOT NULL DEFAULT '0',
  `language` char(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'see define.php CFG_GLPI[language] array',
  `use_mode` int(11) NOT NULL DEFAULT '0',
  `list_limit` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `comment` text COLLATE utf8_unicode_ci,
  `auths_id` int(11) NOT NULL DEFAULT '0',
  `authtype` int(11) NOT NULL DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_sync` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `profiles_id` int(11) NOT NULL DEFAULT '0',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `usertitles_id` int(11) NOT NULL DEFAULT '0',
  `usercategories_id` int(11) NOT NULL DEFAULT '0',
  `date_format` int(11) DEFAULT NULL,
  `number_format` int(11) DEFAULT NULL,
  `names_format` int(11) DEFAULT NULL,
  `csv_delimiter` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_ids_visible` tinyint(1) DEFAULT NULL,
  `use_flat_dropdowntree` tinyint(1) DEFAULT NULL,
  `show_jobs_at_login` tinyint(1) DEFAULT NULL,
  `priority_1` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority_2` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority_3` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority_4` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority_5` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority_6` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `followup_private` tinyint(1) DEFAULT NULL,
  `task_private` tinyint(1) DEFAULT NULL,
  `default_requesttypes_id` int(11) DEFAULT NULL,
  `password_forget_token` char(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_forget_token_date` datetime DEFAULT NULL,
  `user_dn` text COLLATE utf8_unicode_ci,
  `registration_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_count_on_tabs` tinyint(1) DEFAULT NULL,
  `refresh_ticket_list` int(11) DEFAULT NULL,
  `set_default_tech` tinyint(1) DEFAULT NULL,
  `personal_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `personal_token_date` datetime DEFAULT NULL,
  `api_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_token_date` datetime DEFAULT NULL,
  `display_count_on_home` int(11) DEFAULT NULL,
  `notification_to_myself` tinyint(1) DEFAULT NULL,
  `duedateok_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duedatewarning_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duedatecritical_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duedatewarning_less` int(11) DEFAULT NULL,
  `duedatecritical_less` int(11) DEFAULT NULL,
  `duedatewarning_unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duedatecritical_unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_options` text COLLATE utf8_unicode_ci,
  `is_deleted_ldap` tinyint(1) NOT NULL DEFAULT '0',
  `pdffont` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `keep_devices_when_purging_item` tinyint(1) DEFAULT NULL,
  `privatebookmarkorder` longtext COLLATE utf8_unicode_ci,
  `backcreated` tinyint(1) DEFAULT NULL,
  `task_state` int(11) DEFAULT NULL,
  `layout` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `palette` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `set_default_requester` tinyint(1) DEFAULT NULL,
  `lock_autolock_mode` tinyint(1) DEFAULT NULL,
  `lock_directunlock_notification` tinyint(1) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `highcontrast_css` tinyint(1) DEFAULT '0',
  `plannings` text COLLATE utf8_unicode_ci,
  `sync_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groups_id` int(11) NOT NULL DEFAULT '0',
  `users_id_supervisor` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicityloginauth` (`name`,`authtype`,`auths_id`),
  KEY `firstname` (`firstname`),
  KEY `realname` (`realname`),
  KEY `entities_id` (`entities_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `locations_id` (`locations_id`),
  KEY `usertitles_id` (`usertitles_id`),
  KEY `usercategories_id` (`usercategories_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `authitem` (`authtype`,`auths_id`),
  KEY `is_deleted_ldap` (`is_deleted_ldap`),
  KEY `date_creation` (`date_creation`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `sync_field` (`sync_field`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id_supervisor` (`users_id_supervisor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_users`
--

LOCK TABLES `glpi_users` WRITE;
/*!40000 ALTER TABLE `glpi_users` DISABLE KEYS */;
INSERT INTO `glpi_users` VALUES (2,'dixon','$2y$10$3L/boBVAyqNslVN6Pio5DuYS6RlQQyEE2ISAS9x6.4TwRIQWN6ZCK','','','','',NULL,0,NULL,2,20,1,NULL,0,1,'2019-03-02 05:24:36','2019-02-19 04:50:01',NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'cTuPRj7VS0XhsjNJgnwdVyLIjKGYPca2L0kHKApQ','2019-02-07 09:06:37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"NetworkPort\":{\"Computer\":{\"characteristics\":true,\"internet\":true,\"dynamic_import\":false,\"mac\":true,\"vlans\":true,\"virtual_ports\":false,\"port_opposite\":false,\"names\":false,\"aliases\":false,\"ipaddresses\":true,\"ipnetworks\":true}}}',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"filters\":{\"ChangeTask\":{\"color\":\"#E94A31\",\"display\":true,\"type\":\"event_filter\"},\"ProblemTask\":{\"color\":\"#5174F2\",\"display\":true,\"type\":\"event_filter\"},\"Reminder\":{\"color\":\"#51C9F2\",\"display\":true,\"type\":\"event_filter\"},\"TicketTask\":{\"color\":\"#FFCC29\",\"display\":true,\"type\":\"event_filter\"},\"ProjectTask\":{\"color\":\"#20C646\",\"display\":true,\"type\":\"event_filter\"},\"PluginExampleExample\":{\"color\":\"#364959\",\"display\":true,\"type\":\"event_filter\"}},\"plannings\":{\"user_2\":{\"color\":\"#FFEEC4\",\"display\":false,\"type\":\"user\"}}}',NULL,0,0),(3,'t_lovazov','$2y$10$aVGPQKMoYy4rlkwHA9SWpeK.nQ/r0sm4X1Q7ybH4i/pl/wECeP6YS','','','','Takhir','Lovazov',2,NULL,0,20,1,NULL,0,1,'2019-02-12 05:30:13','2019-02-12 02:37:11',NULL,0,1,0,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'lx5tiFGXwF2qp3geNj2QZi0o5BLXHoUvIHohz0DN','2019-02-12 02:36:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,0,0),(4,'v_shegula','$2y$10$aHDPSbvx16DSdKLLYrciwuY7efrRVQlehWsH4fqR25MG7Vy9eFj7q','','','','Щегула','Владимир',0,NULL,0,20,1,NULL,0,1,'2019-02-25 05:19:02','2019-02-14 10:42:42',NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'0tNbkEmC2OvWpVXPFhgm4rFHQ3FP12guUCsg3pIH','2019-02-07 09:11:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,0,0),(5,'t_aipov','$2y$10$h/ExquFeDR6henAEcEmFc.w8a9nyF0tRgs6ts.TdlYhghni6reyF6','','','','Аипов','Тлек',2,'en_GB',0,20,1,NULL,0,1,'2019-02-12 05:45:33','2019-02-12 05:45:33',NULL,0,0,0,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'DCjXB9zdNXcTeYQvOK7NmzubcFHf2dTv7YuKrFi8','2019-02-12 05:45:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,0,0),(6,'d_tailakov','$2y$10$BWOhtxSfLGMEvbnS246rbOfgYiZ1bwSGDI1RMUqPjPFskuTh8YHlW','','','+77471060515','Тайлаков','Дмитрий',0,NULL,0,NULL,1,'',0,1,'2019-02-19 04:39:09','2019-02-12 02:18:20',NULL,0,0,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'7i85zkCR61rJtXarbcxo3eAJUYdepmKmDiEMeyW9','2019-02-12 02:18:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2019-02-08 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-11 10:17:47',NULL,NULL,NULL,0,0),(7,'a_dosmagambetov','$2y$10$YBvYfv0KBRo.jPMdLhYM0un0mLB2Wk.1qpLMQGpIE4qLPqmIH/XSe','','','','Dosmagambetov','Anuar',0,NULL,0,NULL,1,'',0,1,NULL,'2019-02-15 04:38:48',NULL,0,0,0,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-15 04:33:54',0,NULL,NULL,0,0);
/*!40000 ALTER TABLE `glpi_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_usertitles`
--

DROP TABLE IF EXISTS `glpi_usertitles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_usertitles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_usertitles`
--

LOCK TABLES `glpi_usertitles` WRITE;
/*!40000 ALTER TABLE `glpi_usertitles` DISABLE KEYS */;
INSERT INTO `glpi_usertitles` VALUES (1,'Главный специалист','','2019-02-12 02:33:27','2019-02-12 02:33:27'),(2,'Ведущий специалист','','2019-02-12 02:33:38','2019-02-12 02:33:38'),(3,'Технический специалист','','2019-02-12 02:33:51','2019-02-12 02:33:51');
/*!40000 ALTER TABLE `glpi_usertitles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_virtualmachinestates`
--

DROP TABLE IF EXISTS `glpi_virtualmachinestates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_virtualmachinestates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_virtualmachinestates`
--

LOCK TABLES `glpi_virtualmachinestates` WRITE;
/*!40000 ALTER TABLE `glpi_virtualmachinestates` DISABLE KEYS */;
INSERT INTO `glpi_virtualmachinestates` VALUES (1,'on','','2019-02-11 10:06:18','2019-02-11 10:06:18'),(2,'off','','2019-02-11 10:06:22','2019-02-11 10:06:22');
/*!40000 ALTER TABLE `glpi_virtualmachinestates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_virtualmachinesystems`
--

DROP TABLE IF EXISTS `glpi_virtualmachinesystems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_virtualmachinesystems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_virtualmachinesystems`
--

LOCK TABLES `glpi_virtualmachinesystems` WRITE;
/*!40000 ALTER TABLE `glpi_virtualmachinesystems` DISABLE KEYS */;
INSERT INTO `glpi_virtualmachinesystems` VALUES (1,'LXC','LXC контейнер','2019-02-11 10:07:19','2019-02-11 10:07:19'),(2,'KVM','','2019-02-11 10:07:25','2019-02-11 10:07:25'),(3,'Windows','','2019-02-11 10:07:36','2019-02-11 10:07:36');
/*!40000 ALTER TABLE `glpi_virtualmachinesystems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_virtualmachinetypes`
--

DROP TABLE IF EXISTS `glpi_virtualmachinetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_virtualmachinetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_virtualmachinetypes`
--

LOCK TABLES `glpi_virtualmachinetypes` WRITE;
/*!40000 ALTER TABLE `glpi_virtualmachinetypes` DISABLE KEYS */;
INSERT INTO `glpi_virtualmachinetypes` VALUES (1,'nutanix','','2019-02-11 10:05:35','2019-02-11 10:05:35'),(2,'wm-ware','','2019-02-11 10:05:43','2019-02-11 10:05:43');
/*!40000 ALTER TABLE `glpi_virtualmachinetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_vlans`
--

DROP TABLE IF EXISTS `glpi_vlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_vlans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `tag` int(11) NOT NULL DEFAULT '0',
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `tag` (`tag`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_vlans`
--

LOCK TABLES `glpi_vlans` WRITE;
/*!40000 ALTER TABLE `glpi_vlans` DISABLE KEYS */;
INSERT INTO `glpi_vlans` VALUES (1,0,0,'1','VLAN1',1,'2019-02-13 04:52:49','2019-02-13 04:52:49'),(2,0,0,'2','VLAN2',2,'2019-02-13 04:53:01','2019-02-13 04:53:01'),(3,0,0,'3','',3,'2019-02-22 08:48:06','2019-02-22 08:48:06'),(4,0,0,'4','',4,'2019-02-22 08:48:10','2019-02-22 08:48:10'),(5,0,0,'5','',5,'2019-02-22 08:48:15','2019-02-22 08:48:15'),(6,0,0,'6','',6,'2019-02-22 08:48:20','2019-02-22 08:48:20'),(7,0,0,'7','',7,'2019-02-22 08:48:25','2019-02-22 08:48:25'),(8,0,0,'8','',8,'2019-02-22 08:48:30','2019-02-22 08:48:30'),(9,0,0,'9','',9,'2019-02-22 08:48:36','2019-02-22 08:48:36'),(10,0,0,'10','',10,'2019-02-22 08:48:41','2019-02-22 08:48:41');
/*!40000 ALTER TABLE `glpi_vlans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_wifinetworks`
--

DROP TABLE IF EXISTS `glpi_wifinetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_wifinetworks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `essid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ad-hoc, access_point',
  `comment` text COLLATE utf8_unicode_ci,
  `date_mod` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `essid` (`essid`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_wifinetworks`
--

LOCK TABLES `glpi_wifinetworks` WRITE;
/*!40000 ALTER TABLE `glpi_wifinetworks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_wifinetworks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-02 11:35:28
