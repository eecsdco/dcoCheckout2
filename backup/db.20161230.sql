-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: dcocheckout
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.04.1

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','production','2016-12-26 01:46:55','2016-12-26 01:46:55');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `loan_length_seconds` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Audio and Video','2016-12-26 01:46:55','2016-12-26 01:46:55','Cables, adapters, monitors, and other audio visual equipment',172800),(2,'Peripherals, Adapters, and Miscellaneous Items','2016-12-26 01:46:55','2016-12-26 01:46:55','Mice, keyboards, monitors, disk drives, and power cables',172800),(3,'Software and Operating Systems','2016-12-26 01:46:55','2016-12-26 01:46:55','Microsoft Office, Windows, and Linux',172800),(4,'Networking','2016-12-26 01:46:55','2016-12-26 01:46:55','Ethernet cables, adapters, and wifi equipment',259200),(5,'Tools','2016-12-26 01:46:55','2016-12-26 01:46:55','Screwdrivers, wrenches, pliers, and miscellaneous tools',172800),(6,'Loaner Computers','2016-12-26 01:46:55','2016-12-26 01:46:55','Computer for short and long term checkout',259200),(7,'Media and Media Readers','2016-12-26 01:46:55','2016-12-26 01:46:55','USB flash drives, hard drives, blank CD\'s/DVD/s, etc., Optical Readers',259200);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
INSERT INTO `notices` VALUES (1,'Wired Network Registration','To connect new computers (or computers that have changed rooms) to the DCO wired network, you must notify DCO. We will update our database with the information you provide.','2016-12-26 01:46:56','2016-12-26 01:46:56'),(2,'Microsoft Notice','Microsoft Software, per our license agreement with Microsoft, may only be installed on machines purchased with University of Michigan or Departmental funds. This software must not be duplicated.','2016-12-26 01:46:56','2016-12-26 01:46:56');
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offices`
--

DROP TABLE IF EXISTS `offices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offices`
--

LOCK TABLES `offices` WRITE;
/*!40000 ALTER TABLE `offices` DISABLE KEYS */;
INSERT INTO `offices` VALUES (1,'2917 BBB','Departmental Computing Organization\r\n2917 Bob and Betty Beyster Building\r\n2260 Hayward St\r\nAnn Arbor, MI 48109','2016-12-26 01:46:56','2016-12-26 01:46:56'),(2,'4403 EECS','Departmental Computing Organization\r\n4403 Electrical Engineering and Computer Science Building\r\n1301 Beal Ave\r\nAnn Arbor, MI, 48109','2016-12-26 01:46:56','2016-12-26 01:46:56');
/*!40000 ALTER TABLE `offices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_id` int(11) NOT NULL,
  `borrower` varchar(255) NOT NULL,
  `note` text,
  `agent` varchar(255) NOT NULL,
  `out` datetime NOT NULL,
  `in` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `due` datetime DEFAULT NULL,
  `return_approved` datetime DEFAULT NULL,
  `option` varchar(255) DEFAULT NULL,
  `office_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_records_on_office_id` (`office_id`) USING BTREE,
  KEY `index_records_on_title_id` (`title_id`) USING BTREE,
  CONSTRAINT `fk_rails_8ee9395c82` FOREIGN KEY (`office_id`) REFERENCES `offices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
INSERT INTO `records` VALUES (15,8,'rpradeep','Migrated from old system: [\'3825\', \'rpradeep\', \'3\', \'74\', \'\', \'CSE\', \'rpradeep\', \'1468010343\', \'\', \'out\', \'74\', \'1\', \'Software\', \'Microsoft Windows 10 (64 Bit)\', \'\', \'Microsoft\', \'10.0\', \'0\', \'2016-07-08 20:39:03\']','rpradeep','2016-07-09 00:39:03','2016-12-29 00:47:21','2016-12-26 02:04:46','2016-12-29 00:47:22','2016-07-16 00:39:03','2016-12-29 00:47:22','Windows 10',1),(17,3,'vpoura','Migrated from old system: [\'3846\', \'vpoura\', \'4\', \'53\', \'\', \'EECS\', \'mmgeorg\', \'1469731024\', \'\', \'out\', \'53\', \'1\', \'Accessory\', \'Video Cable (DVI, VGA, HDMI, etc.)\', \'\', \'\', \'\', \'0\', \'2016-07-28 18:37:04\']','mmgeorg','2016-07-28 22:37:04',NULL,'2016-12-26 02:04:46','2016-12-26 02:04:46','2016-07-11 22:37:04',NULL,'',2),(18,5,'vpoura','Migrated from old system: [\'3847\', \'vpoura\', \'4\', \'69\', \'\', \'EECS\', \'mmgeorg\', \'1469731082\', \'\', \'out\', \'69\', \'1\', \'Accessory\', \'USB Ethernet Adapter\', \'\', \'\', \'\', \'null\', \'2016-07-28 18:38:02\']','mmgeorg','2016-07-28 22:38:02',NULL,'2016-12-26 02:04:46','2016-12-26 02:04:46','2016-08-02 22:38:02',NULL,'',2),(19,5,'vpoura','Migrated from old system: [\'3847\', \'vpoura\', \'4\', \'69\', \'\', \'EECS\', \'mmgeorg\', \'1469731082\', \'\', \'out\', \'69\', \'1\', \'Accessory\', \'USB Ethernet Adapter\', \'\', \'\', \'\', \'null\', \'2016-07-28 18:38:02\']','mmgeorg','2016-07-28 22:38:02',NULL,'2016-12-26 02:04:46','2016-12-26 02:04:46','2016-08-02 22:38:02',NULL,'',2),(20,13,'hsiwu','Migrated from old system: [\'3852\', \'hsiwu\', \'2\', \'39\', \'Screwdriver\', \'CSE\', \'sheebs\', \'1470259209\', \'\', \'out\', \'39\', \'1\', \'Tools\', \'Other (specify in note)\', \'\', \'\', \'\', \'0\', \'2016-08-03 21:20:09\']','sheebs','2016-08-04 01:20:09',NULL,'2016-12-26 02:04:46','2016-12-26 02:04:46','2016-08-06 01:20:09',NULL,'',1),(21,6,'mdsnazir','Migrated from old system: [\'3857\', \'mdsnazir\', \'7\', \'25\', \"Hiskins\' Student\", \'EECS\', \'mmgeorg\', \'1470335636\', \'\', \'out\', \'25\', \'1\', \'Accessory\', \'Mouse\', \'\', \'\', \'\', \'0\', \'2016-08-04 18:33:56\']','mmgeorg','2016-08-04 22:33:56',NULL,'2016-12-26 02:04:46','2016-12-26 02:04:46','2016-08-10 22:33:56',NULL,'',2),(22,7,'mdsnazir','Migrated from old system: [\'3858\', \'mdsnazir\', \'7\', \'24\', \"Hiskins\' Student\", \'EECS\', \'mmgeorg\', \'1470335666\', \'\', \'out\', \'24\', \'1\', \'Accessory\', \'Keyboard\', \'\', \'\', \'\', \'0\', \'2016-08-04 18:34:26\']','mmgeorg','2016-08-04 22:34:26',NULL,'2016-12-26 02:04:46','2016-12-26 02:04:46','2016-08-11 22:34:26',NULL,'',2),(23,21,'mdsnazir','Migrated from old system: [\'3860\', \'mdsnazir\', \'7\', \'20\', \"Hiskins\' Student\", \'EECS\', \'mmgeorg\', \'1470335738\', \'\', \'out\', \'20\', \'1\', \'Monitor\', \'LCD\', \'\', \'\', \'\', \'0\', \'2016-08-04 18:35:38\']','mmgeorg','2016-08-04 22:35:38',NULL,'2016-12-26 02:04:47','2016-12-26 02:04:47','2016-08-11 22:35:38',NULL,'',2),(24,29,'ducle','Migrated from old system: [\'3869\', \'ducle\', \'2\', \'55\', \'\', \'CSE\', \'travigd\', \'1470766923\', \'\', \'out\', \'55\', \'1\', \'Accessory\', \'Video Adapter (Mac mini DVI, VGA, etc.)\', \'\', \'\', \'\', \'0\', \'2016-08-09 18:22:03\']','travigd','2016-08-09 22:22:03',NULL,'2016-12-26 02:04:47','2016-12-26 02:04:47','2016-08-11 22:22:03',NULL,'',1),(25,29,'sphaney','Migrated from old system: [\'3870\', \'sphaney\', \'14\', \'55\', \'\', \'CSE\', \'sphaney\', \'1470771117\', \'\', \'out\', \'55\', \'1\', \'Accessory\', \'Video Adapter (Mac mini DVI, VGA, etc.)\', \'\', \'\', \'\', \'0\', \'2016-08-09 19:31:57\']','sphaney','2016-08-09 23:31:57',NULL,'2016-12-26 02:04:47','2016-12-26 02:04:47','2016-08-25 23:31:57',NULL,'',1),(26,29,'subarno','Migrated from old system: [\'3875\', \'subarno\', \'0\', \'55\', \'displayport to dvi\', \'CSE\', \'travigd\', \'1471032232\', \'\', \'out\', \'55\', \'1\', \'Accessory\', \'Video Adapter (Mac mini DVI, VGA, etc.)\', \'\', \'\', \'\', \'0\', \'2016-08-12 20:03:52\']','travigd','2016-08-13 00:03:52',NULL,'2016-12-26 02:04:47','2016-12-26 02:04:47','2016-08-13 00:03:52',NULL,'',1),(27,3,'mngom','Migrated from old system: [\'3876\', \'mngom\', \'2\', \'53\', \'2 cables\', \'CSE\', \'mngom\', \'1471269529\', \'\', \'out\', \'53\', \'1\', \'Accessory\', \'Video Cable (DVI, VGA, HDMI, etc.)\', \'\', \'\', \'\', \'0\', \'2016-08-15 13:58:49\']','mngom','2016-08-15 17:58:49',NULL,'2016-12-26 02:04:47','2016-12-26 02:04:47','2016-08-17 17:58:49',NULL,'',1),(28,23,'armruval','Migrated from old system: [\'3877\', \'armruval\', \'91\', \'50\', \'\', \'CSE\', \'armruval\', \'1471271684\', \'\', \'out\', \'50\', \'1\', \'Accessory\', \'Network Router\', \'\', \'\', \'\', \'0\', \'2016-08-15 14:34:44\']','armruval','2016-08-15 18:34:44',NULL,'2016-12-26 02:04:47','2016-12-26 02:04:47','2016-11-15 19:34:44',NULL,'',1),(29,28,'hsiwu','Migrated from old system: [\'3881\', \'hsiwu\', \'26\', \'75\', \'\', \'CSE\', \'sheebs\', \'1471453214\', \'\', \'out\', \'75\', \'1\', \'Accessory\', \'USB Flash Drive\', \'\', \'8G\', \'\', \'0\', \'2016-08-17 17:00:14\']','sheebs','2016-08-17 21:00:14',NULL,'2016-12-26 02:04:47','2016-12-26 02:04:47','2016-09-17 21:00:14',NULL,'',1),(30,29,'noahisch','Migrated from old system: [\'3915\', \'noahisch\', \'22\', \'55\', \'\', \'CSE\', \'noahisch\', \'1473885209\', \'\', \'out\', \'55\', \'1\', \'Accessory\', \'Video Adapter (Mac mini DVI, VGA, etc.)\', \'\', \'\', \'\', \'0\', \'2016-09-14 20:33:29\']','noahisch','2016-09-15 00:33:29',NULL,'2016-12-26 02:04:47','2016-12-26 02:04:47','2016-10-07 00:33:29',NULL,'',1),(31,29,'aniketde','Migrated from old system: [\'3919\', \'aniketde\', \'2\', \'55\', \'\', \'CSE\', \'aniketde\', \'1474300496\', \'\', \'out\', \'55\', \'1\', \'Accessory\', \'Video Adapter (Mac mini DVI, VGA, etc.)\', \'\', \'\', \'\', \'0\', \'2016-09-19 15:54:56\']','aniketde','2016-09-19 19:54:56',NULL,'2016-12-26 02:04:47','2016-12-26 02:04:47','2016-09-21 19:54:56',NULL,'',1),(32,3,'manikafa','Migrated from old system: [\'3921\', \'manikafa\', \'14\', \'53\', \'\', \'EECS\', \'manikafa\', \'1474315219\', \'\', \'out\', \'53\', \'1\', \'Accessory\', \'Video Cable (DVI, VGA, HDMI, etc.)\', \'\', \'\', \'\', \'0\', \'2016-09-19 20:00:19\']','manikafa','2016-09-20 00:00:19',NULL,'2016-12-26 02:04:47','2016-12-26 02:04:48','2016-09-20 00:00:19',NULL,'',2),(33,29,'yajchen','Migrated from old system: [\'3924\', \'yajchen\', \'2\', \'55\', \'\', \'CSE\', \'yajchen\', \'1474402074\', \'\', \'out\', \'55\', \'1\', \'Accessory\', \'Video Adapter (Mac mini DVI, VGA, etc.)\', \'\', \'\', \'\', \'0\', \'2016-09-20 20:07:54\']','yajchen','2016-09-21 00:07:54',NULL,'2016-12-26 02:04:48','2016-12-26 02:04:48','2016-09-21 00:07:54',NULL,'',1),(34,1,'ysahin','Migrated from old system: [\'3934\', \'ysahin\', \'4\', \'58\', \'\', \'CSE\', \'ysahin\', \'1475178186\', \'\', \'out\', \'58\', \'1\', \'Accessory\', \'Laptop Power Supply (Mac)\', \'\', \'Macbook 85W Magsafe\', \'80\', \'\', \'2016-09-29 19:43:06\']','ysahin','2016-09-29 23:43:06','2016-12-29 00:42:08','2016-12-26 02:04:48','2016-12-29 00:42:09','2016-10-03 23:43:06','2016-12-29 00:42:09','Apple (MagSafe)',1),(35,29,'habtemlu','Migrated from old system: [\'3935\', \'habtemlu\', \'4\', \'55\', \'\', \'CSE\', \'sheebs\', \'1475179079\', \'\', \'out\', \'55\', \'1\', \'Accessory\', \'Video Adapter (Mac mini DVI, VGA, etc.)\', \'\', \'\', \'\', \'0\', \'2016-09-29 19:57:59\']','sheebs','2016-09-29 23:57:59',NULL,'2016-12-26 02:04:48','2016-12-26 02:04:48','2016-10-03 23:57:59',NULL,'',1),(36,23,'pprasert','Migrated from old system: [\'3953\', \'pprasert\', \'48\', \'26\', \'1 8 ports\r\n1 5 port\', \'CSE\', \'victorbp\', \'1476471162\', \'\', \'out\', \'26\', \'1\', \'Accessory\', \'Network Switch\', \'\', \'\', \'\', \'0\', \'2016-10-14 18:52:42\']','victorbp','2016-10-14 22:52:42',NULL,'2016-12-26 02:04:48','2016-12-26 02:04:48','2016-11-30 23:52:42',NULL,'',1),(37,2,'salessaf','Migrated from old system: [\'3960\', \'salessaf\', \'2\', \'68\', \'memory card hub\', \'CSE\', \'salessaf\', \'1477515725\', \'\', \'out\', \'68\', \'1\', \'Accessory\', \'USB Hub\', \'\', \'StarTech 4 port\', \'\', \'0\', \'2016-10-26 21:02:05\']','salessaf','2016-10-27 01:02:05',NULL,'2016-12-26 02:04:48','2016-12-26 02:04:48','2016-10-29 01:02:05',NULL,'',1),(38,30,'fshirani','Migrated from old system: [\'3962\', \'fshirani\', \'4\', \'30\', \'Pointer\', \'EECS\', \'fshirani\', \'1477595870\', \'\', \'out\', \'30\', \'1\', \'Accessory\', \'Other (specify in note)\', \'\', \'\', \'\', \'0\', \'2016-10-27 19:17:50\']','fshirani','2016-10-27 23:17:50',NULL,'2016-12-26 02:04:48','2016-12-26 02:04:48','2016-10-27 23:17:50',NULL,'',2),(39,30,'fshirani','Migrated from old system: [\'3963\', \'fshirani\', \'4\', \'30\', \'Laser Pointer\', \'EECS\', \'liz\', \'1477595907\', \'\', \'out\', \'30\', \'1\', \'Accessory\', \'Other (specify in note)\', \'\', \'\', \'\', \'0\', \'2016-10-27 19:18:27\']','liz','2016-10-27 23:18:27',NULL,'2016-12-26 02:04:48','2016-12-26 02:04:48','2016-11-02 23:18:27',NULL,'',2),(40,3,'dhiman','Migrated from old system: [\'3964\', \'dhiman\', \'3\', \'53\', \'Used for machine: zonule.eecs.umich.edu in Post docs room.\', \'EECS\', \'dhiman\', \'1477671617\', \'\', \'out\', \'53\', \'1\', \'Accessory\', \'Video Cable (DVI, VGA, HDMI, etc.)\', \'\', \'\', \'\', \'0\', \'2016-10-28 16:20:17\']','dhiman','2016-10-28 20:20:17',NULL,'2016-12-26 02:04:48','2016-12-26 02:04:48','2016-11-01 20:20:17',NULL,'',2),(41,1,'joneslew','Migrated from old system: [\'3967\', \'joneslew\', \'4\', \'58\', \'\', \'CSE\', \'victorbp\', \'1478204739\', \'\', \'out\', \'58\', \'1\', \'Accessory\', \'Laptop Power Supply (Mac)\', \'\', \'Macbook 85W Magsafe\', \'80\', \'\', \'2016-11-03 20:25:39\']','victorbp','2016-11-04 00:25:39',NULL,'2016-12-26 02:04:48','2016-12-26 02:04:48','2016-11-12 01:25:39',NULL,'',1),(42,21,'armruval','Migrated from old system: [\'3968\', \'armruval\', \'166\', \'20\', \'for mando\', \'CSE\', \'armruval\', \'1478388135\', \'\', \'out\', \'20\', \'1\', \'Monitor\', \'LCD\', \'\', \'\', \'\', \'0\', \'2016-11-05 23:22:15\']','armruval','2016-11-06 03:22:15',NULL,'2016-12-26 02:04:48','2016-12-26 02:04:48','2017-04-02 03:22:15',NULL,'',1),(43,8,'oweisse','Migrated from old system: [\'3971\', \'oweisse\', \'3\', \'74\', \'\', \'CSE\', \'oweisse\', \'1479495516\', \'\', \'out\', \'74\', \'1\', \'Software\', \'Microsoft Windows 10 (64 Bit)\', \'\', \'Microsoft\', \'10.0\', \'0\', \'2016-11-18 18:58:36\']','oweisse','2016-11-18 23:58:36',NULL,'2016-12-26 02:04:49','2016-12-26 02:04:49','2016-11-21 23:58:36',NULL,'',1),(44,4,'oweisse','Migrated from old system: [\'3973\', \'oweisse\', \'2\', \'23\', \'\', \'CSE\', \'oweisse\', \'1479740304\', \'\', \'out\', \'23\', \'1\', \'Accessory\', \'External CD/DVD Drive\', \'\', \'\', \'\', \'0\', \'2016-11-21 14:58:24\']','oweisse','2016-11-21 19:58:24',NULL,'2016-12-26 02:04:49','2016-12-26 02:04:49','2016-11-23 19:58:24',NULL,'',1),(45,8,'oweisse','Migrated from old system: [\'3974\', \'oweisse\', \'2\', \'73\', \'\', \'CSE\', \'oweisse\', \'1479740327\', \'\', \'out\', \'73\', \'1\', \'Software\', \'Microsoft Office 2016 (Windows)\', \'\', \'Microsoft\', \'\', \'0\', \'2016-11-21 14:58:47\']','oweisse','2016-11-21 19:58:47','2016-12-29 01:49:50','2016-12-26 02:04:49','2016-12-29 01:49:51','2016-11-23 19:58:47','2016-12-29 01:49:51','',1),(46,2,'ypwu','Migrated from old system: [\'3975\', \'ypwu\', \'10\', \'53\', \'\', \'EECS\', \'ypwu\', \'1479752051\', \'\', \'out\', \'53\', \'1\', \'Accessory\', \'Video Cable (DVI, VGA, HDMI, etc.)\', \'\', \'\', \'\', \'0\', \'2016-11-21 18:14:11\']','ypwu','2016-11-21 23:14:11',NULL,'2016-12-26 02:04:49','2016-12-26 02:04:49','2016-12-01 23:14:11',NULL,'',2),(47,29,'amlan','Migrated from old system: [\'3976\', \'amlan\', \'2\', \'55\', \'\', \'CSE\', \'amlan\', \'1479914291\', \'\', \'out\', \'55\', \'1\', \'Accessory\', \'Video Adapter (Mac mini DVI, VGA, etc.)\', \'\', \'\', \'\', \'0\', \'2016-11-23 15:18:11\']','amlan','2016-11-23 20:18:11',NULL,'2016-12-26 02:04:49','2016-12-26 02:04:49','2016-11-25 20:18:11',NULL,'',1),(48,3,'hjseo','Migrated from old system: [\'3978\', \'hjseo\', \'2\', \'53\', \'\', \'EECS\', \'hjseo\', \'1479930333\', \'\', \'out\', \'53\', \'1\', \'Accessory\', \'Video Cable (DVI, VGA, HDMI, etc.)\', \'\', \'\', \'\', \'0\', \'2016-11-23 19:45:33\']','hjseo','2016-11-24 00:45:33',NULL,'2016-12-26 02:04:49','2016-12-26 02:04:49','2016-11-26 00:45:33',NULL,'',2),(49,8,'hchwa','Migrated from old system: [\'3980\', \'hchwa\', \'2\', \'73\', \'\', \'CSE\', \'hchwa\', \'1480370360\', \'\', \'out\', \'73\', \'1\', \'Software\', \'Microsoft Office 2016 (Windows)\', \'\', \'Microsoft\', \'\', \'0\', \'2016-11-28 21:59:20\']','hchwa','2016-11-29 02:59:20','2016-12-28 23:55:07','2016-12-26 02:04:49','2016-12-28 23:55:09','2016-11-29 02:59:20','2016-12-28 23:55:09','',1),(50,18,'salimehy','Migrated from old system: [\'3982\', \'salimehy\', \'7\', \'65\', \'\', \'EECS\', \'lrandolp\', \'1480523577\', \'\', \'out\', \'65\', \'1\', \'Computer\', \'Laptop - HP ProBook\', \'\', \'HP ProBook\', \'\', \'0\', \'2016-11-30 16:32:57\']','lrandolp','2016-11-30 21:32:57','2016-12-30 18:07:35','2016-12-26 02:04:49','2016-12-30 18:07:38','2016-12-07 21:32:57','2016-12-30 18:07:38','',2),(51,17,'dharapa','Migrated from old system: [\'3983\', \'dharapa\', \'2\', \'19\', \'aquarius\r\ndell laptop\', \'CSE\', \'travigd\', \'1480535359\', \'\', \'out\', \'19\', \'1\', \'Computer\', \'Other (specify in note)\', \'\', \'\', \'\', \'\', \'2016-11-30 19:49:19\']','travigd','2016-12-01 00:49:19',NULL,'2016-12-26 02:04:49','2016-12-26 02:04:49','2016-12-03 00:49:19',NULL,'',1),(52,8,'bradjc','Migrated from old system: [\'3984\', \'bradjc\', \'4\', \'74\', \'\', \'CSE\', \'bradjc\', \'1480628235\', \'\', \'out\', \'74\', \'1\', \'Software\', \'Microsoft Windows 10 (64 Bit)\', \'\', \'Microsoft\', \'10.0\', \'0\', \'2016-12-01 21:37:15\']','bradjc','2016-12-02 02:37:15',NULL,'2016-12-26 02:04:49','2016-12-26 02:04:49','2016-12-06 02:37:15',NULL,'',1),(53,8,'bradjc','Migrated from old system: [\'3985\', \'bradjc\', \'4\', \'73\', \'\', \'CSE\', \'bradjc\', \'1480628247\', \'\', \'out\', \'73\', \'1\', \'Software\', \'Microsoft Office 2016 (Windows)\', \'\', \'Microsoft\', \'\', \'0\', \'2016-12-01 21:37:27\']','bradjc','2016-12-02 02:37:27',NULL,'2016-12-26 02:04:50','2016-12-26 02:04:50','2016-12-06 02:37:27',NULL,'',1),(54,8,'kmfawaz','Migrated from old system: [\'3987\', \'kmfawaz\', \'3\', \'74\', \'\', \'CSE\', \'kmfawaz\', \'1480711153\', \'\', \'out\', \'74\', \'1\', \'Software\', \'Microsoft Windows 10 (64 Bit)\', \'\', \'Microsoft\', \'10.0\', \'0\', \'2016-12-02 20:39:13\']','kmfawaz','2016-12-03 01:39:13',NULL,'2016-12-26 02:04:50','2016-12-26 02:04:50','2016-12-06 01:39:13',NULL,'',1),(55,29,'akolli','Migrated from old system: [\'3988\', \'akolli\', \'4\', \'55\', \'\', \'CSE\', \'akolli\', \'1481227258\', \'\', \'out\', \'55\', \'1\', \'Accessory\', \'Video Adapter (Mac mini DVI, VGA, etc.)\', \'\', \'\', \'\', \'0\', \'2016-12-08 20:00:58\']','akolli','2016-12-09 01:00:58',NULL,'2016-12-26 02:04:50','2016-12-26 02:04:50','2016-12-13 01:00:58',NULL,'',1),(56,5,'mazina','Migrated from old system: [\'3992\', \'mazina\', \'4\', \'69\', \'\', \'CSE\', \'mazina\', \'1481822637\', \'\', \'out\', \'69\', \'1\', \'Accessory\', \'USB Ethernet Adapter\', \'\', \'\', \'\', \'null\', \'2016-12-15 17:23:57\']','mazina','2016-12-15 22:23:57','2016-12-30 20:54:08','2016-12-26 02:04:50','2016-12-30 20:54:11','2016-12-19 22:23:57','2016-12-30 20:54:11','',1),(57,8,'mazina','Migrated from old system: [\'3993\', \'mazina\', \'4\', \'72\', \'\', \'CSE\', \'mazina\', \'1481822671\', \'\', \'out\', \'72\', \'1\', \'Software\', \'Microsoft Office 2016 (Mac)\', \'\', \'Microsoft\', \'\', \'0\', \'2016-12-15 17:24:31\']','mazina','2016-12-15 22:24:31','2016-12-30 20:54:32','2016-12-26 02:04:50','2016-12-30 20:54:33','2016-12-19 22:24:31','2016-12-30 20:54:33','',1),(58,13,'travigd','','travigd','2016-12-28 23:30:57','2016-12-28 23:51:46','2016-12-28 23:30:57','2016-12-28 23:53:19','2016-12-21 23:30:57','2016-12-28 23:53:19',NULL,1);
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20160729185839'),('20160729190145'),('20160729190501'),('20160730155319'),('20160730202618'),('20160730225554'),('20160730225720'),('20160801133052'),('20160801133111'),('20160801184123'),('20160801191012'),('20160802020545'),('20160802172102'),('20160802172118'),('20160802172123'),('20160802172132'),('20160802172143'),('20160802175052'),('20160808015930'),('20160808020800'),('20160808155724'),('20160811145019'),('20160811164209'),('20160818032950'),('20160818201314');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `n_available` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `loan_length_seconds` int(11) DEFAULT NULL,
  `notice_id` int(11) DEFAULT NULL,
  `office_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `options_str` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_titles_on_category_id` (`category_id`) USING BTREE,
  KEY `index_titles_on_notice_id` (`notice_id`) USING BTREE,
  KEY `index_titles_on_office_id` (`office_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titles`
--

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
INSERT INTO `titles` VALUES (1,2,'Laptop Power Supply','Power supply (a la carte, i.e. not checked out in addition to a laptop)',NULL,'2016-12-26 01:46:56','2016-12-26 01:46:56',172800,NULL,NULL,1,'Apple (MagSafe)\nDell\nHP\nLenovo\nOther'),(2,1,'USB Hub','Used to connect multiple USB devices to a single USB port on a computer.',NULL,'2016-12-26 01:46:56','2016-12-26 01:46:56',172800,NULL,NULL,1,''),(3,1,'Video Cable','Digital video cable used to connect computers to displays. Please specify the type (e.g. VGA to VGA or HDMI to DVI)',NULL,'2016-12-26 01:46:56','2016-12-26 01:46:56',172800,NULL,NULL,1,''),(4,7,'Optical (CD/DVD) Disk Drive','A disk drive capable of reading and/or writing to CD\'s and/or DVD\'s',NULL,'2016-12-26 01:46:56','2016-12-26 01:46:56',172800,NULL,NULL,1,''),(5,4,'USB Ethernet Adapter','Used to connect computers (usually laptops) that have no ethernet ports to wired networks.',NULL,'2016-12-26 01:46:56','2016-12-26 01:46:56',172800,1,NULL,1,'USB\nThunderBolt'),(6,2,'Mouse','Not the kind that goes squeak!',NULL,'2016-12-26 01:46:56','2016-12-26 01:46:56',172800,NULL,NULL,1,''),(7,2,'Keyboard','typetypetype',NULL,'2016-12-26 01:46:56','2016-12-26 01:46:56',172800,NULL,NULL,1,''),(8,3,'Microsoft Windows','Windows',NULL,'2016-12-26 01:46:56','2016-12-26 01:46:56',172800,2,NULL,1,'Windows 10 - USB\nWindows 10 - DVD\nWindows 8 - USB\nWindows 8 - DVD\nWindows 7 - USB\nWindows 7 - DVD'),(9,3,'Microsoft Office','Microsoft Office. DCO may be able to install this on your computer remotely (be sure to ask).',NULL,'2016-12-26 01:46:56','2016-12-26 01:46:56',172800,2,NULL,1,'2016\n2013'),(10,3,'Apple macOS','This software is subject to licensing restrictions.',NULL,'2016-12-26 01:46:56','2016-12-26 01:46:56',172800,2,NULL,1,'2016\n2013'),(11,3,'Miscellaneous Software','Please leave a description of the software (and the install media type) in the note field.',NULL,'2016-12-26 01:46:56','2016-12-26 01:46:56',172800,2,NULL,1,'2016\n2013'),(12,2,'Power Strip','Power strip',NULL,'2016-12-26 01:46:56','2016-12-26 01:46:56',172800,NULL,NULL,1,''),(13,5,'Hand Tool','Please give a description of the tool in the note field.',NULL,'2016-12-26 01:46:56','2016-12-26 01:46:56',172800,NULL,NULL,1,''),(14,3,'Ubuntu Linux Installation Media','Ubuntu Linux 16.04 Xenial Xerus',NULL,'2016-12-26 01:46:56','2016-12-26 01:46:56',172800,NULL,NULL,1,'USB Installed\nDVD Installer'),(15,3,'RedHat Linux Installation Media','RedHat Linux 7',NULL,'2016-12-26 01:46:56','2016-12-26 01:46:56',172800,NULL,NULL,1,'USB Installer\nDVD Installer'),(16,3,'Miscellaneous Linux Installation Media','Please leave the Linux Distribution in the note field.',NULL,'2016-12-26 01:46:56','2016-12-26 01:46:56',172800,NULL,NULL,1,'USB Installer\nDVD Installer'),(17,6,'Dell Studio 1558','Laptop available for short term or long term loan. Can be loaded with Linux or Windows.\r\n\r\nPlease make sure you also take (and return!) the laptop with the associated power brick.\r\n\r\nIntel Core i3, 2.27 GHz\r\n4GB RAM',3,'2016-12-26 01:46:56','2016-12-29 00:03:05',259200,NULL,1,1,'Aquarius (Service Tag F965BM1)\nCapricorn (Service Tag JNVJYL1)\nVirgon (Service Tag G965BM1)'),(18,6,'HP ProBook','Laptop available for short term or long term loan. Can be loaded with Linux or Windows.',NULL,'2016-12-26 01:46:56','2016-12-26 01:46:56',259200,NULL,1,1,''),(19,6,'Tablet Computer','Tablet available for short term loan.',NULL,'2016-12-26 01:46:57','2016-12-26 01:46:57',259200,NULL,NULL,1,'iPad\nSurface 2'),(20,2,'Book','A DCO owned book. Please specify the title of the book in the note field.',NULL,'2016-12-26 01:46:57','2016-12-26 01:46:57',172800,NULL,NULL,1,''),(21,1,'Monitor','Please leave a description of the monitor make and model in the note field.',NULL,'2016-12-26 01:46:57','2016-12-29 00:16:30',172800,NULL,NULL,1,''),(22,1,'Projector','Please leave a description of the projector make and model in the note field.',NULL,'2016-12-26 01:46:57','2016-12-29 00:16:44',172800,NULL,NULL,1,''),(23,4,'Ethernet Switch','A switch to connect multiple computers',NULL,'2016-12-26 01:46:57','2016-12-26 01:46:57',259200,NULL,NULL,1,'TRENDnet 5 Port\nTRENDnet 8 Port\nOther'),(24,4,'WiFi Router','Connect wireless devices',NULL,'2016-12-26 01:46:57','2016-12-26 01:46:57',259200,NULL,NULL,1,''),(25,7,'USB Hard Drive Adapter','A USB adapter to connect SATA or IDE hard drives',NULL,'2016-12-26 01:46:57','2016-12-29 00:16:54',172800,NULL,NULL,1,'Dock Style (hard drive fits inside)\nAdapter Style (like one long cable)'),(26,7,'SATA Hard Drive','SATA Hard Drive (usually used inside of computers)',NULL,'2016-12-26 01:46:57','2016-12-26 01:46:57',259200,NULL,NULL,1,''),(27,7,'USB Hard Drive','External USB Hard Drive (useful for backups)',NULL,'2016-12-26 01:46:57','2016-12-26 01:46:57',259200,NULL,NULL,1,''),(28,7,'USB Flash Drive','USB Flash Drive',NULL,'2016-12-26 01:46:57','2016-12-26 01:46:57',259200,NULL,NULL,1,''),(29,1,'Video Adapter','Please specify the type in the note field.',NULL,'2016-12-26 01:46:57','2016-12-26 01:46:57',172800,NULL,NULL,1,''),(30,2,'Miscellaneous Accessory','Miscaellaneosuasifjas accesorry ',NULL,'2016-12-26 01:46:57','2016-12-26 01:46:57',172800,NULL,NULL,1,''),(31,6,'Lenovo G50','Lenovo G50',NULL,'2016-12-26 01:46:57','2016-12-29 00:07:33',259200,NULL,NULL,1,'Gemini (S/N PF05UUDS)');
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-30 16:03:50
