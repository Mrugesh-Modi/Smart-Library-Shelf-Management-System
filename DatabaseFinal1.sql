CREATE DATABASE  IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `library`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_allfloor_misplacedbookdata_slsms`
--

DROP TABLE IF EXISTS `tbl_allfloor_misplacedbookdata_slsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_allfloor_misplacedbookdata_slsms` (
  `Sr_no` int NOT NULL AUTO_INCREMENT,
  `floorid` tinyint NOT NULL,
  `shelf_id` varchar(4) NOT NULL,
  `shelf_tier_id` varchar(6) NOT NULL,
  `bookid` varchar(4) NOT NULL,
  `Timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Sr_no`,`floorid`,`shelf_tier_id`,`bookid`,`shelf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_allfloor_misplacedbookdata_slsms`
--

LOCK TABLES `tbl_allfloor_misplacedbookdata_slsms` WRITE;
/*!40000 ALTER TABLE `tbl_allfloor_misplacedbookdata_slsms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_allfloor_misplacedbookdata_slsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bookconfigration_slsms`
--

DROP TABLE IF EXISTS `tbl_bookconfigration_slsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bookconfigration_slsms` (
  `book_lib_id` varchar(4) NOT NULL,
  `Book_id` varchar(5) NOT NULL,
  PRIMARY KEY (`book_lib_id`,`Book_id`),
  CONSTRAINT `fk_bookinfo_bookconfiguration` FOREIGN KEY (`book_lib_id`) REFERENCES `tbl_bookinfo_master_slsms` (`Book_lib_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bookconfigration_slsms`
--

LOCK TABLES `tbl_bookconfigration_slsms` WRITE;
/*!40000 ALTER TABLE `tbl_bookconfigration_slsms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_bookconfigration_slsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bookinfo_master_slsms`
--

DROP TABLE IF EXISTS `tbl_bookinfo_master_slsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bookinfo_master_slsms` (
  `Book_lib_id` varchar(4) NOT NULL,
  `book_sub_section_id` tinyint NOT NULL,
  `book_title` varchar(256) DEFAULT NULL,
  `book_author` varchar(256) DEFAULT NULL,
  `book_publication` varchar(256) DEFAULT NULL,
  `book_ISBN_13` char(17) NOT NULL,
  `book_language` varchar(20) DEFAULT NULL,
  `book_paperback` smallint DEFAULT NULL,
  `book_dimension` varchar(25) DEFAULT NULL,
  `TimeStamp` datetime DEFAULT NULL,
  `userinfo` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`Book_lib_id`,`book_sub_section_id`),
  UNIQUE KEY `book_ISBN_13_UNIQUE` (`book_ISBN_13`),
  KEY `fk_shelfsubsection_bookinfo_slsms_idx` (`book_sub_section_id`),
  CONSTRAINT `fk_shelfsubsection_bookinfo_slsms` FOREIGN KEY (`book_sub_section_id`) REFERENCES `tbl_shelfsubsection_slsms` (`sub_section_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bookinfo_master_slsms`
--

LOCK TABLES `tbl_bookinfo_master_slsms` WRITE;
/*!40000 ALTER TABLE `tbl_bookinfo_master_slsms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_bookinfo_master_slsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_categorywise_arrngement_onfloor_slsms`
--

DROP TABLE IF EXISTS `tbl_categorywise_arrngement_onfloor_slsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_categorywise_arrngement_onfloor_slsms` (
  `floor_id` tinyint NOT NULL,
  `sub_section_id` tinyint NOT NULL,
  `No_of_allowed_shelves` tinyint DEFAULT NULL,
  PRIMARY KEY (`floor_id`,`sub_section_id`),
  KEY `tbl_categorywise_arrngement_onfloor_slsms_ibfk_2` (`sub_section_id`),
  CONSTRAINT `tbl_categorywise_arrngement_onfloor_slsms_ibfk_1` FOREIGN KEY (`floor_id`) REFERENCES `tbl_floorinfo_master_slsms` (`floor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_categorywise_arrngement_onfloor_slsms_ibfk_2` FOREIGN KEY (`sub_section_id`) REFERENCES `tbl_shelfsubsection_slsms` (`sub_section_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categorywise_arrngement_onfloor_slsms`
--

LOCK TABLES `tbl_categorywise_arrngement_onfloor_slsms` WRITE;
/*!40000 ALTER TABLE `tbl_categorywise_arrngement_onfloor_slsms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_categorywise_arrngement_onfloor_slsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_configuredbookreport_slsms`
--

DROP TABLE IF EXISTS `tbl_configuredbookreport_slsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_configuredbookreport_slsms` (
  `Bookid` varchar(4) NOT NULL,
  `Timestamp` datetime NOT NULL,
  `flag` tinyint DEFAULT NULL,
  PRIMARY KEY (`Bookid`),
  CONSTRAINT `fk_tbl_bookinfo_tbl_configuredbookreport` FOREIGN KEY (`Bookid`) REFERENCES `tbl_bookinfo_master_slsms` (`Book_lib_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_configuredbookreport_slsms`
--

LOCK TABLES `tbl_configuredbookreport_slsms` WRITE;
/*!40000 ALTER TABLE `tbl_configuredbookreport_slsms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_configuredbookreport_slsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_coursedetails_slsms`
--

DROP TABLE IF EXISTS `tbl_coursedetails_slsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_coursedetails_slsms` (
  `course_id` varchar(256) NOT NULL,
  `institute_id` varchar(256) DEFAULT NULL,
  `course_name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `tbl_coursedetails_slsms_ibfk_1` (`institute_id`),
  CONSTRAINT `tbl_coursedetails_slsms_ibfk_1` FOREIGN KEY (`institute_id`) REFERENCES `tbl_instituteinfo_master_slsms` (`institute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_coursedetails_slsms`
--

LOCK TABLES `tbl_coursedetails_slsms` WRITE;
/*!40000 ALTER TABLE `tbl_coursedetails_slsms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_coursedetails_slsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_extraallbookslots_slsms`
--

DROP TABLE IF EXISTS `tbl_extraallbookslots_slsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_extraallbookslots_slsms` (
  `Book_lib_id` varchar(4) NOT NULL,
  `book_quantity` smallint DEFAULT NULL,
  `start_bookid_range` varchar(5) DEFAULT NULL,
  `end_bookid_range` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`Book_lib_id`),
  CONSTRAINT `fk_bookconfiguration_extrabookslots` FOREIGN KEY (`Book_lib_id`) REFERENCES `tbl_bookconfigration_slsms` (`book_lib_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_extraallbookslots_slsms`
--

LOCK TABLES `tbl_extraallbookslots_slsms` WRITE;
/*!40000 ALTER TABLE `tbl_extraallbookslots_slsms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_extraallbookslots_slsms` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbl_extraallbookslots_slsms_AFTER_UPDATE` AFTER UPDATE ON `tbl_extraallbookslots_slsms` FOR EACH ROW BEGIN
	if(!NEW.book_quantity <> OLD.book_quantity) then
    insert into tbl_configuredbookreport_slsms values(OLD.Book_lib_id,now(),2) on duplicate key update Timestamp=now(),flag=2;
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_facultyinfo_master_slsms`
--

DROP TABLE IF EXISTS `tbl_facultyinfo_master_slsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_facultyinfo_master_slsms` (
  `enrollment_no` varchar(256) NOT NULL,
  `course_id` varchar(256) DEFAULT NULL,
  `faculty_name` varchar(256) DEFAULT NULL,
  `faculty_birthdate` date DEFAULT NULL,
  `faculty_password` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  KEY `tbl_facultyinfo_master_slsms_ibfk_1` (`course_id`),
  CONSTRAINT `tbl_facultyinfo_master_slsms_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `tbl_coursedetails_slsms` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_facultyinfo_master_slsms`
--

LOCK TABLES `tbl_facultyinfo_master_slsms` WRITE;
/*!40000 ALTER TABLE `tbl_facultyinfo_master_slsms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_facultyinfo_master_slsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_facultyregistered_slsms`
--

DROP TABLE IF EXISTS `tbl_facultyregistered_slsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_facultyregistered_slsms` (
  `enrollment_no` varchar(256) NOT NULL,
  `faculty_email` varchar(256) DEFAULT NULL,
  `faculty_phone_number` char(14) DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `tbl_facultyregistered_slsms_ibfk_1` FOREIGN KEY (`enrollment_no`) REFERENCES `tbl_facultyinfo_master_slsms` (`enrollment_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_facultyregistered_slsms`
--

LOCK TABLES `tbl_facultyregistered_slsms` WRITE;
/*!40000 ALTER TABLE `tbl_facultyregistered_slsms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_facultyregistered_slsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_floorinfo_master_slsms`
--

DROP TABLE IF EXISTS `tbl_floorinfo_master_slsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_floorinfo_master_slsms` (
  `floor_id` tinyint NOT NULL AUTO_INCREMENT,
  `max_allowed_shelve` tinyint NOT NULL,
  `main_section_id` tinyint NOT NULL,
  PRIMARY KEY (`floor_id`,`main_section_id`),
  KEY `fk_shelfmainsection_floorinfo_idx` (`main_section_id`),
  CONSTRAINT `tbl_floorinfo_master_slsms_ibfk_1` FOREIGN KEY (`main_section_id`) REFERENCES `tbl_shelfmainsection_master_slsms` (`main_section_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_floorinfo_master_slsms`
--

LOCK TABLES `tbl_floorinfo_master_slsms` WRITE;
/*!40000 ALTER TABLE `tbl_floorinfo_master_slsms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_floorinfo_master_slsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_instituteinfo_master_slsms`
--

DROP TABLE IF EXISTS `tbl_instituteinfo_master_slsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_instituteinfo_master_slsms` (
  `institute_id` varchar(256) NOT NULL,
  `institute_name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`institute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_instituteinfo_master_slsms`
--

LOCK TABLES `tbl_instituteinfo_master_slsms` WRITE;
/*!40000 ALTER TABLE `tbl_instituteinfo_master_slsms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_instituteinfo_master_slsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_nativeuserinfo_master_slsms`
--

DROP TABLE IF EXISTS `tbl_nativeuserinfo_master_slsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_nativeuserinfo_master_slsms` (
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `username` varchar(256) NOT NULL,
  `pass` text CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `u_role` varchar(13) NOT NULL,
  `email_id` varchar(256) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `last_logout` timestamp NULL DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `email_id_UNIQUE` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_nativeuserinfo_master_slsms`
--

LOCK TABLES `tbl_nativeuserinfo_master_slsms` WRITE;
/*!40000 ALTER TABLE `tbl_nativeuserinfo_master_slsms` DISABLE KEYS */;
INSERT INTO `tbl_nativeuserinfo_master_slsms` VALUES ('Admin','Admin','Admin','Administrator',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_nativeuserinfo_master_slsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_notassignedbookslots_slsms`
--

DROP TABLE IF EXISTS `tbl_notassignedbookslots_slsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_notassignedbookslots_slsms` (
  `Book_lib_id` varchar(4) NOT NULL,
  `book_quantity` smallint DEFAULT NULL,
  `start_bookid_range` varchar(5) DEFAULT NULL,
  `end_bookid_range` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`Book_lib_id`),
  CONSTRAINT `fk_bookconfig_notassignedbook_slsms` FOREIGN KEY (`Book_lib_id`) REFERENCES `tbl_bookconfigration_slsms` (`book_lib_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_notassignedbookslots_slsms`
--

LOCK TABLES `tbl_notassignedbookslots_slsms` WRITE;
/*!40000 ALTER TABLE `tbl_notassignedbookslots_slsms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_notassignedbookslots_slsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_rfid_reader_configuration_slsms`
--

DROP TABLE IF EXISTS `tbl_rfid_reader_configuration_slsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_rfid_reader_configuration_slsms` (
  `rfid_reader_uid` varchar(10) NOT NULL,
  `universal_product_code` bigint NOT NULL,
  PRIMARY KEY (`rfid_reader_uid`),
  UNIQUE KEY `universal_product_code_UNIQUE` (`universal_product_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_rfid_reader_configuration_slsms`
--

LOCK TABLES `tbl_rfid_reader_configuration_slsms` WRITE;
/*!40000 ALTER TABLE `tbl_rfid_reader_configuration_slsms` DISABLE KEYS */;
INSERT INTO `tbl_rfid_reader_configuration_slsms` VALUES ('Reader_1',123456789012);
/*!40000 ALTER TABLE `tbl_rfid_reader_configuration_slsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_shelfinfo_slsms`
--

DROP TABLE IF EXISTS `tbl_shelfinfo_slsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_shelfinfo_slsms` (
  `shelf_id` char(4) NOT NULL,
  `no_of_tiers` tinyint DEFAULT NULL,
  `floor_id` tinyint NOT NULL,
  `sub_section_id` tinyint NOT NULL,
  PRIMARY KEY (`shelf_id`,`floor_id`,`sub_section_id`),
  KEY `tbl_shelfinfo_slsms_ibfk_1` (`floor_id`),
  KEY `tbl_shelfinfo_slsms_ibfk_2` (`sub_section_id`),
  CONSTRAINT `tbl_shelfinfo_slsms_ibfk_1` FOREIGN KEY (`floor_id`) REFERENCES `tbl_floorinfo_master_slsms` (`floor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_shelfinfo_slsms_ibfk_2` FOREIGN KEY (`sub_section_id`) REFERENCES `tbl_shelfsubsection_slsms` (`sub_section_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_shelfinfo_slsms`
--

LOCK TABLES `tbl_shelfinfo_slsms` WRITE;
/*!40000 ALTER TABLE `tbl_shelfinfo_slsms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_shelfinfo_slsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_shelfmainsection_master_slsms`
--

DROP TABLE IF EXISTS `tbl_shelfmainsection_master_slsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_shelfmainsection_master_slsms` (
  `main_section_id` tinyint NOT NULL AUTO_INCREMENT,
  `main_section_type` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`main_section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_shelfmainsection_master_slsms`
--

LOCK TABLES `tbl_shelfmainsection_master_slsms` WRITE;
/*!40000 ALTER TABLE `tbl_shelfmainsection_master_slsms` DISABLE KEYS */;
INSERT INTO `tbl_shelfmainsection_master_slsms` VALUES (1,'Fiction'),(2,'Non-Fiction');
/*!40000 ALTER TABLE `tbl_shelfmainsection_master_slsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_shelfsubsection_slsms`
--

DROP TABLE IF EXISTS `tbl_shelfsubsection_slsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_shelfsubsection_slsms` (
  `sub_section_id` tinyint NOT NULL,
  `main_section_id` tinyint NOT NULL,
  `sub_section_type` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`sub_section_id`,`main_section_id`),
  KEY `tbl_shelfsubsection_slsms_ibfk_1` (`main_section_id`),
  CONSTRAINT `tbl_shelfsubsection_slsms_ibfk_1` FOREIGN KEY (`main_section_id`) REFERENCES `tbl_shelfmainsection_master_slsms` (`main_section_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_shelfsubsection_slsms`
--

LOCK TABLES `tbl_shelfsubsection_slsms` WRITE;
/*!40000 ALTER TABLE `tbl_shelfsubsection_slsms` DISABLE KEYS */;
INSERT INTO `tbl_shelfsubsection_slsms` VALUES (101,1,'Action and adventure'),(102,1,'Alternate history '),(103,1,'Anthology '),(104,1,'Chick lit '),(105,1,'Children\'s '),(106,1,'Comic book '),(107,1,'Coming-of-age '),(108,1,'Crime '),(109,1,'Drama '),(110,1,'Fairytale '),(111,2,'Programming Language'),(112,2,'Autobiography '),(113,2,'Biography '),(114,2,'Book review '),(115,2,'Cookbook '),(116,2,'Encyclopedia '),(117,2,'Textbook '),(118,2,'Travel '),(119,2,'Science '),(120,2,'History ');
/*!40000 ALTER TABLE `tbl_shelfsubsection_slsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_shelftierconfiguration_slsms`
--

DROP TABLE IF EXISTS `tbl_shelftierconfiguration_slsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_shelftierconfiguration_slsms` (
  `shelf_id` char(4) NOT NULL,
  `shelf_tier_id` varchar(6) NOT NULL,
  `book_lib_id` varchar(4) DEFAULT NULL,
  `max_allowed_book` tinyint DEFAULT NULL,
  `present_book` tinyint DEFAULT NULL,
  `start_bookid_range` varchar(5) DEFAULT NULL,
  `end_bookid_range` varchar(5) DEFAULT NULL,
  `rfid_reader_Uid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`shelf_id`,`shelf_tier_id`),
  KEY `fk_reader_idx` (`rfid_reader_Uid`),
  CONSTRAINT `fk_reader` FOREIGN KEY (`rfid_reader_Uid`) REFERENCES `tbl_rfid_reader_configuration_slsms` (`rfid_reader_uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_shelfinfo_shelftierconfiguration` FOREIGN KEY (`shelf_id`) REFERENCES `tbl_shelfinfo_slsms` (`shelf_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_shelftierconfiguration_slsms`
--

LOCK TABLES `tbl_shelftierconfiguration_slsms` WRITE;
/*!40000 ALTER TABLE `tbl_shelftierconfiguration_slsms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_shelftierconfiguration_slsms` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbl_shelftierconfiguration_slsms_AFTER_UPDATE` AFTER UPDATE ON `tbl_shelftierconfiguration_slsms` FOR EACH ROW BEGIN
    if(!NEW.book_lib_id <> OLD.book_lib_id) then
    insert into tbl_configuredbookreport_slsms values(OLD.book_lib_id,now(),1) on duplicate key update Timestamp=now(),flag=1;
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_studentinfo_master_slsms`
--

DROP TABLE IF EXISTS `tbl_studentinfo_master_slsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_studentinfo_master_slsms` (
  `enrollment_no` char(15) NOT NULL,
  `course_id` varchar(256) DEFAULT NULL,
  `student_name` varchar(256) DEFAULT NULL,
  `student_birthdate` date DEFAULT NULL,
  `student_password` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  KEY `tbl_studentinfo_master_slsms_ibfk_1` (`course_id`),
  CONSTRAINT `tbl_studentinfo_master_slsms_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `tbl_coursedetails_slsms` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_studentinfo_master_slsms`
--

LOCK TABLES `tbl_studentinfo_master_slsms` WRITE;
/*!40000 ALTER TABLE `tbl_studentinfo_master_slsms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_studentinfo_master_slsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_studentregistered_slsms`
--

DROP TABLE IF EXISTS `tbl_studentregistered_slsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_studentregistered_slsms` (
  `enrollment_no` char(15) NOT NULL,
  `student_email` varchar(256) DEFAULT NULL,
  `student_phone_number` char(14) DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `tbl_studentregistered_slsms_ibfk_1` FOREIGN KEY (`enrollment_no`) REFERENCES `tbl_studentinfo_master_slsms` (`enrollment_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_studentregistered_slsms`
--

LOCK TABLES `tbl_studentregistered_slsms` WRITE;
/*!40000 ALTER TABLE `tbl_studentregistered_slsms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_studentregistered_slsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'library'
--

--
-- Dumping routines for database 'library'
--
/*!50003 DROP PROCEDURE IF EXISTS `pro_addLibrarian_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_addLibrarian_slsms`(lib_name varchar(256),emailid varchar(256),pass varchar(10),username varchar(256))
BEGIN
	insert into tbl_nativeuserinfo_master_slsms(name,username,pass,u_role,email_id,status) values (lib_name,username,sha2(pass,512),"Librarian",emailid,1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_addrfidreader_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_addrfidreader_slsms`(upc bigint)
BEGIN
	declare shelftierid varchar(6) default null;
    declare booklibid varchar(4) default null;
    declare startbookidrange varchar(5) default null;
    declare endbookidrange varchar(5) default null;
    declare floorid tinyint default 0;
    declare shelfid varchar(4) default 0;
    declare lastreaderuid varchar(10);
    /*generate uid for reader*/
    select rfid_reader_uid into lastreaderuid from tbl_rfid_reader_configuration_slsms order by rfid_reader_uid desc limit 1;
	if lastreaderuid is not null then
		set lastreaderuid=concat("Reader_",(substr(lastreaderuid,8)+1));
	else
		set lastreaderuid="Reader_1";
    end if;
    /* inserting data into reader table*/
    insert into  tbl_rfid_reader_configuration_slsms values(lastreaderuid,upc);
    /*check inserted sucessfull if yes then assigend reader uid on tier of shelf */
    if row_count() > 0 then
		select tbl_shelftierconfiguration_slsms.shelf_id,shelf_tier_id,floor_id,book_lib_id,start_bookid_range,end_bookid_range into shelfid,shelftierid,floorid,booklibid,startbookidrange,endbookidrange from  tbl_shelftierconfiguration_slsms,tbl_shelfinfo_slsms where tbl_shelfinfo_slsms.shelf_id=tbl_shelftierconfiguration_slsms.shelf_id and rfid_reader_Uid is null and book_lib_id is not null and present_book is not null limit 1;
		if shelftierid is not null then
			update tbl_shelftierconfiguration_slsms set rfid_reader_Uid=lastreaderuid where shelf_tier_id=shelftierid;
			select floorid,shelfid,shelftierid,booklibid,(substr(endbookidrange,2)-substr(startbookidrange,2))+1 as TotalNoofBooks,lastreaderuid ;
        else
			select "0";
        end if;
		
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_admin_dashboard_report_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_admin_dashboard_report_slsms`(flag tinyint)
BEGIN
	if flag=1 then
		select count(floor_id) from tbl_floorinfo_master_slsms;
	elseif flag=2 then
		select count(shelf_id) from tbl_shelfinfo_slsms;
	elseif flag=3 then
		select count(rfid_reader_uid) from tbl_rfid_reader_configuration_slsms;
	elseif flag=4 then
		select count(Book_id) from tbl_bookconfigration_slsms;
	elseif flag=5 then
		select count(institute_id) from tbl_instituteinfo_master_slsms;
	elseif flag=6 then
		select count(course_id) from tbl_coursedetails_slsms;
	elseif flag=7 then
		select count(username) from tbl_nativeuserinfo_master_slsms where u_role="Librarian";
    elseif flag=8 then
		SELECT library.tbl_floorinfo_master_slsms.floor_id,main_section_type,max_allowed_shelve FROM library.tbl_shelfmainsection_master_slsms,library.tbl_floorinfo_master_slsms where library.tbl_shelfmainsection_master_slsms.main_section_id=library.tbl_floorinfo_master_slsms.main_section_id;
    elseif flag=9 then
		select rfid_reader_uid,universal_product_code from tbl_rfid_reader_configuration_slsms;
     elseif flag=10 then
		select tbl_rfid_reader_configuration_slsms.rfid_reader_uid,universal_product_code,shelf_id,shelf_tier_id from tbl_shelftierconfiguration_slsms,tbl_rfid_reader_configuration_slsms where tbl_rfid_reader_configuration_slsms.rfid_reader_uid = tbl_shelftierconfiguration_slsms.rfid_reader_Uid;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_assignedReaderToShelf_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_assignedReaderToShelf_slsms`()
BEGIN
	declare done int default 0;
    declare readerid varchar(10);
	declare shelftierid varchar(6);
	declare cursor1 cursor for select  tbl_rfid_reader_configuration_slsms.rfid_reader_uid from  tbl_rfid_reader_configuration_slsms where rfid_reader_uid not in(select rfid_reader_Uid from tbl_shelftierconfiguration_slsms where rfid_reader_Uid is not null) order by rfid_reader_uid;
	declare cursor2 cursor for select  shelf_tier_id from tbl_shelftierconfiguration_slsms where present_book is not null and rfid_reader_Uid is null;
	declare continue handler for not found set done=1;
    open cursor1;
    open cursor2;
    label1:loop
		fetch cursor1 into readerid;
        fetch cursor2 into shelftierid;
        if done =1 then
        leave label1;
        end if;
        update tbl_shelftierconfiguration_slsms set rfid_reader_Uid=readerid where shelf_tier_id=shelftierid;
    end loop label1;
    close cursor1;
    close cursor2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_bookconfigurationonshelf_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_bookconfigurationonshelf_slsms`(booklibid varchar(4),maxallowedbook int,subsectionid tinyint,bookquantity smallint,flag varchar(10))
BEGIN
	declare shelftierid tinyint;
    declare readercount tinyint;
    declare exist tinyint;
    if flag="insert" then
		call pro_newbookconfiguration_slsms(booklibid,maxallowedbook,subsectionid,bookquantity);
    elseif flag="update" then
		call pro_updatebookconfiguration_slsms(booklibid,bookquantity);
    end if;
    select  count(tbl_rfid_reader_configuration_slsms.rfid_reader_uid) into readercount from  tbl_rfid_reader_configuration_slsms where rfid_reader_uid not in(select rfid_reader_Uid from tbl_shelftierconfiguration_slsms where rfid_reader_Uid is not null);
	select  count(shelf_tier_id) into shelftierid from tbl_shelftierconfiguration_slsms where present_book is not null and rfid_reader_Uid is null;
	if readercount > 0 and shelftierid > 0 then
		call pro_assignedReaderToShelf_slsms();
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_bookdetailReport_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_bookdetailReport_slsms`(bookid varchar(4),flag tinyint)
BEGIN
	declare flagextra int;
    declare flagnotassigned int;
    declare flagtierinfo int;
    select book_title,sub_section_type,main_section_type from tbl_shelfmainsection_master_slsms,tbl_shelfsubsection_slsms,tbl_bookinfo_master_slsms where tbl_shelfmainsection_master_slsms.main_section_id=tbl_shelfsubsection_slsms.main_section_id and tbl_shelfsubsection_slsms.sub_section_id= tbl_bookinfo_master_slsms.book_sub_section_id and Book_lib_id=bookid;
    
	select exists(select book_lib_id from tbl_shelftierconfiguration_slsms where book_lib_id=bookid) into flagtierinfo;
    select exists(select * from tbl_extraallbookslots_slsms where Book_lib_id=bookid) into flagextra;
    select exists(select * from tbl_notassignedbookslots_slsms where Book_lib_id=bookid) into flagnotassigned;
    
    if flag=1 then
		if flagtierinfo = 1 then
			select tbl_shelftierconfiguration_slsms.*,floor_id from tbl_shelfinfo_slsms,tbl_shelftierconfiguration_slsms where tbl_shelfinfo_slsms.shelf_id=tbl_shelftierconfiguration_slsms.shelf_id and book_lib_id=bookid;
		end if;
    end if;
    
    if flagextra = 1 then
		select "Extra Book details",book_quantity,start_bookid_range,end_bookid_range from tbl_extraallbookslots_slsms where Book_lib_id=bookid;
	elseif flagnotassigned = 1 then
		select "Un-Allocated Book Details",book_quantity,start_bookid_range,end_bookid_range  from tbl_notassignedbookslots_slsms where Book_lib_id=bookid;
    end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_change_password_librarian` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_change_password_librarian`(uname varchar(256),pass varchar(256))
BEGIN
	update tbl_nativeuserinfo_master_slsms set pass=sha2(pass,512) where username=uname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_checkexisitngshelves_emptyshelves_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_checkexisitngshelves_emptyshelves_slsms`(floorid tinyint)
BEGIN
	declare done int default 0;
    declare subsectionid int;
    declare subsectiontype varchar(256);
    declare noofallowedshelves tinyint;
    declare noofemptyshelves tinyint;
    declare configuration tinyint;
    declare exisiting_empty_shelvesdata text default "";
    declare cursor1 cursor for select tbl_shelfsubsection_slsms.sub_section_id,sub_section_type,No_of_allowed_shelves from tbl_categorywise_arrngement_onfloor_slsms,tbl_shelfsubsection_slsms where tbl_shelfsubsection_slsms.sub_section_id=tbl_categorywise_arrngement_onfloor_slsms.sub_section_id and floor_id=floorid;
    declare continue handler for not found set done=1;
    open cursor1;
    label1:loop
		fetch cursor1 into subsectionid,subsectiontype,noofallowedshelves;
		if done=1 then
			leave label1;
		end if;
        select count(shelf_id) into configuration from tbl_shelfinfo_slsms where no_of_tiers is null and sub_section_id=subsectionid and floor_id=floorid;
        if(configuration > 0) then
				select concat_ws(",",exisiting_empty_shelvesdata,subsectionid,subsectiontype,noofallowedshelves,configuration) into exisiting_empty_shelvesdata;
		else
				select count(distinct tbl_shelfinfo_slsms.shelf_id) into noofemptyshelves  from tbl_shelftierconfiguration_slsms,tbl_shelfinfo_slsms where tbl_shelfinfo_slsms.shelf_id=tbl_shelftierconfiguration_slsms.shelf_id and book_lib_id is null and sub_section_id=subsectionid and floor_id=floorid;
				select concat_ws(",",exisiting_empty_shelvesdata,subsectionid,subsectiontype,noofallowedshelves,noofemptyshelves) into exisiting_empty_shelvesdata;
        end if;
    end loop label1;
		select substr(exisiting_empty_shelvesdata,2);
    close cursor1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_checkfloorhasbooks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_checkfloorhasbooks`(floorid tinyint)
BEGIN
	declare bookcount int;
	select count(book_lib_id) into bookcount from tbl_shelfinfo_slsms,tbl_shelftierconfiguration_slsms where tbl_shelfinfo_slsms.shelf_id =tbl_shelftierconfiguration_slsms.shelf_id and floor_id=7;
	if(bookcount > 0) then
		select true;
	else
		select false;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_checkmaxallowedshelvesonfloor_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_checkmaxallowedshelvesonfloor_slsms`(floorid tinyint)
BEGIN
	select max_allowed_shelve from tbl_floorinfo_master_slsms where floor_id=floorid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_checkmissplacedbook_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_checkmissplacedbook_slsms`(floorid tinyint)
BEGIN
	select rfid_reader_Uid ,book_lib_id,tbl_shelftierconfiguration_slsms.shelf_id,shelf_tier_id,present_book from tbl_shelftierconfiguration_slsms,tbl_shelfinfo_slsms where tbl_shelfinfo_slsms.shelf_id = tbl_shelftierconfiguration_slsms.shelf_id and floor_id=floorid and rfid_reader_Uid Is not null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_check_facultycredential_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_check_facultycredential_slsms`(IN Enrollment varchar(256),In Password varchar(256),OUT checkcredential boolean,OUT registerdfaculty boolean)
begin
         declare credential varchar(256);
	 declare registerd varchar(256);
	select enrollment_no INTO credential  from tbl_facultyinfo_master_slsms where enrollment_no=Enrollment and faculty_password=Password;
        select credential;
	IF credential!="NULL" THEN	
	   	set checkcredential=true;
		select enrollment_no INTO registerd  from tbl_facultyregistered_slsms where enrollment_no=credential;

		IF registerd!="NULL" THEN
			set registerdfaculty=true;		
			
		ELSE
			set registerdfaculty=false;

		END IF;
				
	ELSE 
		set checkcredential=false;
					
	END IF;
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_check_floorhasbooks_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_check_floorhasbooks_slsms`(floorid tinyint)
BEGIN
	declare bookcount int;
	select count(book_lib_id) into bookcount from tbl_shelfinfo_slsms,tbl_shelftierconfiguration_slsms where tbl_shelfinfo_slsms.shelf_id =tbl_shelftierconfiguration_slsms.shelf_id and floor_id=floorid;
	if(bookcount > 0) then
		select true;
	else
		select false;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_check_institutename_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_check_institutename_slsms`(institutename varchar(256))
BEGIN
	declare db_institutename varchar(256);
	select institute_name into db_institutename from tbl_instituteinfo_master_slsms where institute_name=institutename;
	select row_count();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_check_nativeuserinfo_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_check_nativeuserinfo_slsms`(uname varchar(256),pass_word text)
BEGIN
select u_role,username,last_login,tbl_nativeuserinfo_master_slsms.status from tbl_nativeuserinfo_master_slsms where username=uname and pass=sha2(pass_word,512);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_check_studentcredential_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_check_studentcredential_slsms`(IN Enrollment char(15),IN Password varchar(256),OUT checkcredential boolean,OUT registerdStudent boolean)
begin
	declare credential char(15);
	declare registerd char(15);
	select enrollment_no INTO credential  from tbl_studentinfo_master_slsms where enrollment_no=Enrollment and student_password=Password;
        select credential;
	IF credential!="NULL" THEN	
	   	set checkcredential=true;
		select enrollment_no INTO registerd  from tbl_studentregistered_slsms where enrollment_no=credential;

		IF registerd!="NULL" THEN
			set registerdStudent=true;		
			
		ELSE
			set registerdStudent=false;

		END IF;
				
	ELSE 
		set checkcredential=false;
					
	END IF;
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_dashboard_googlechartreports_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_dashboard_googlechartreports_slsms`()
BEGIN
	select tbl_shelfsubsection_slsms.sub_section_type,count(Book_id) from tbl_shelfsubsection_slsms,tbl_bookinfo_master_slsms,tbl_bookconfigration_slsms where tbl_shelfsubsection_slsms.sub_section_id=tbl_bookinfo_master_slsms.book_sub_section_id and tbl_bookinfo_master_slsms.Book_lib_id=tbl_bookconfigration_slsms.book_lib_id  group by sub_section_type order by count(book_id) desc limit 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_deleteconfiguredbookreport_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_deleteconfiguredbookreport_slsms`(bookid varchar(4))
BEGIN
	delete from tbl_configuredbookreport_slsms where Bookid=bookid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_Deletefloor_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_Deletefloor_slsms`(l_floor_id int)
BEGIN
declare count int;
Delete from tbl_floorinfo_master_slsms where floor_id=l_floor_id;
select exists(select * from tbl_floorinfo_master_slsms) into count;
if count = 0 then
alter table tbl_floorinfo_master_slsms auto_increment=0;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_deleteshelfconfiguration_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_deleteshelfconfiguration_slsms`(l_shelfid CHAR(4))
BEGIN
delete from tbl_shelfconfiguration_slsms where shelf_id=l_shelfid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_deleteshelf_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_deleteshelf_slsms`(l_shelfid CHAR(4))
BEGIN
delete from tbl_shelfinfo_master_slsms where shelf_id=l_shelfid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_displayallbookreports_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_displayallbookreports_slsms`()
BEGIN
	declare bookid char(4);
    declare bookname varchar(255);
    declare floor tinyint;
    declare shelfid char(4);
    declare totalnoofbook int;
    declare subsectiontype varchar(100);
    declare nooftier tinyint;
    declare flag int;
    declare done int default 0;
    declare cursor1 cursor for select Book_lib_id from tbl_bookinfo_master_slsms;
    declare continue handler for not found set done=1;
    open cursor1;
    label1:loop
		fetch cursor1 into bookid;
        if(done=1)then
			leave label1;
        end if;
        select count(book_id),book_title,sub_section_type into totalnoofbook,bookname,subsectiontype  from tbl_bookinfo_master_slsms,tbl_bookconfigration_slsms,tbl_shelfsubsection_slsms where tbl_shelfsubsection_slsms.sub_section_id=tbl_bookinfo_master_slsms.book_sub_section_id and  tbl_bookinfo_master_slsms.Book_lib_id=tbl_bookconfigration_slsms.book_lib_id and tbl_bookinfo_master_slsms.Book_lib_id=bookid;
        select exists(select book_lib_id from tbl_shelftierconfiguration_slsms where book_lib_id=bookid) into flag;
        if(flag=1) then
			select distinct(tbl_shelfinfo_slsms.shelf_id),floor_id,no_of_tiers into shelfid,floor,nooftier from tbl_shelfinfo_slsms,tbl_shelftierconfiguration_slsms where  tbl_shelfinfo_slsms.shelf_id=tbl_shelftierconfiguration_slsms.shelf_id and book_lib_id=bookid; 
        else
			set shelfid="-";
            set floor=0;
            set nooftier=0;
		end if;
        if (floor=0) then
			select bookid,bookname,"-",shelfid,"-",subsectiontype,totalnoofbook;
        else
			select bookid,bookname,floor,shelfid,nooftier,subsectiontype,totalnoofbook;
        end if;
    end loop label1;
    
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_extrabookslot_reports_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_extrabookslot_reports_slsms`()
BEGIN
	select tbl_extraallbookslots_slsms.Book_lib_id,book_title,book_quantity from tbl_bookinfo_master_slsms,tbl_extraallbookslots_slsms where tbl_bookinfo_master_slsms.Book_lib_id=tbl_extraallbookslots_slsms.Book_lib_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_facultyregistration_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_facultyregistration_slsms`(IN Enrollment varchar(256),IN Email varchar(256),IN Contect_No Char(14))
begin
	insert into tbl_facultyregistered_slsms values(Enrollment,Email,Contect_No);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_generate_librarian_username_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_generate_librarian_username_slsms`()
BEGIN
	declare uname varchar(256);
	declare counter int;
    select username into uname from tbl_nativeuserinfo_master_slsms where u_role="Librarian" order by username desc limit 1;
	select count(username) into counter from tbl_nativeuserinfo_master_slsms where u_role="Librarian";
    if uname is null then
		select "librarian_lib1@utu.ac.in";
	else
		set counter=counter+1;
		set uname=concat("librarian_lib",counter,"@utu.ac.in");
        select uname;
    end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_genrate_insertid_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_genrate_insertid_slsms`( lib_id varchar(4), quantity int)
BEGIN
declare counter int default 0; 
declare new_bookid varchar(5);
loop1:loop
if counter=quantity then
leave loop1;
end if;
set counter =counter+1;
set new_bookid=concat(lib_id,LPAD(counter,3,0));
insert into tbl_bookconfigration_slsms value(lib_id,new_bookid);
end loop loop1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getallfloors_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_getallfloors_slsms`()
BEGIN
SELECT floor_id from tbl_floorinfo_master_slsms;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getallshelf_floor_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_getallshelf_floor_slsms`(floorid int)
BEGIN
	select max_allowed_shelve from tbl_floorinfo_master_slsms where floor_id=floorid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getfloorofshelf_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_getfloorofshelf_slsms`(l_shelfid CHAR(4))
BEGIN
select Floor_id from tbl_shelfconfiguration_slsms where shelf_id=l_shelfid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getfloor_data_catergorywise_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_getfloor_data_catergorywise_slsms`(floorid tinyint)
BEGIN
	select sub_section_type,No_of_allowed_shelves from tbl_shelfsubsection_slsms,tbl_categorywise_arrngement_onfloor_slsms where tbl_shelfsubsection_slsms.sub_section_id=tbl_categorywise_arrngement_onfloor_slsms.sub_section_id and floor_id=floorid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getfloor_data_except_categorywise_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_getfloor_data_except_categorywise_slsms`(floorid tinyint)
BEGIN
	declare mainsectionid tinyint;
    select main_section_id into mainsectionid from tbl_floorinfo_master_slsms where floor_id=floorid;
    select sub_section_id,sub_section_type from tbl_shelfsubsection_slsms where main_section_id=mainsectionid and  sub_section_id Not In(select sub_section_id from tbl_categorywise_arrngement_onfloor_slsms where floor_id=floorid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getlastfloor_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_getlastfloor_slsms`()
BEGIN
declare f_id tinyint;
SELECT floor_id into f_id FROM tbl_floorinfo_master_slsms ORDER BY floor_id desc LIMIT 1;
if f_id is null then
	set f_id=0;
    select f_id;
else
	select f_id;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getnoofshelfinfloor_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_getnoofshelfinfloor_slsms`(floorid tinyint)
BEGIN
	select count(distinct shelf_id) from tbl_shelftierconfiguration_slsms where rfid_reader_Uid is not null and shelf_id IN (select shelf_id from tbl_shelfinfo_slsms where floor_id=floorid and no_of_tiers is not null);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getnooftiersofshelf_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_getnooftiersofshelf_slsms`(l_shelfid CHAR(4))
BEGIN
select no_of_tiers from tbl_shelfinfo_master_slsms where shelf_id=l_shelfid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getselectedfloor_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_getselectedfloor_slsms`(l_floor_id int)
BEGIN
select max_allowed_shelve from tbl_floorinfo_master_slsms where floor_id=l_floor_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_gettierinshelf_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_gettierinshelf_slsms`(floorid CHAR(4))
BEGIN
declare done int default 0;
declare shelfid char(4);
declare count int;
declare cursor1 cursor for select shelf_id from tbl_shelfinfo_slsms where floor_id=floorid and no_of_tiers is not null;
declare continue handler for not found set done=1;
open cursor1;
label1:loop
fetch cursor1 into shelfid;
 if done =1 then
        leave label1;
 end if;
	select count(shelf_id) into count from tbl_shelftierconfiguration_slsms where shelf_id=shelfid and book_lib_id is not null and rfid_reader_Uid is not null;
	if(count > 0)then
		select count;
    end if;
end loop label1;
close cursor1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_insertcategorywisearrngementonfloor_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_insertcategorywisearrngementonfloor_slsms`(floorid int,sub_section_id int,no_of_allowed_shelves int)
BEGIN
	insert into tbl_categorywise_arrngement_onfloor_slsms values(floorid,sub_section_id,no_of_allowed_shelves);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_insertCourse_details_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_insertCourse_details_slsms`(instituename varchar(256),coursename varchar(256))
BEGIN
	declare old_courseid char(4);
    declare new_courseid char(4);
    declare pro_institue_id char(4);
	select course_id into old_courseid from tbl_coursedetails_slsms order by course_id desc limit 1;
    if old_courseid is null then
		set new_courseid="C101";
	else
		set new_courseid=concat("C",substr(old_courseid,2)+1);
	end if;
    select institute_id into pro_institue_id from tbl_instituteinfo_master_slsms where institute_name=instituename;
	insert into tbl_coursedetails_slsms values (new_courseid,pro_institue_id,coursename);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_insertdata_allfloor_misplacedbookdata_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_insertdata_allfloor_misplacedbookdata_slsms`(floor_id tinyint,shelfid varchar(4),shelftierid varchar(6),book_id varchar(4))
BEGIN
	insert into tbl_allfloor_misplacedbookdata_slsms (floorid,shelf_id,shelf_tier_id,bookid,Timestamp) values (floor_id,shelfid,shelftierid,book_id,now());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_insertfloor_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_insertfloor_slsms`(max_allowed_shelves int,mainsectiontype varchar(256),OUT floorid int)
BEGIN
declare mainsectionid int;
select main_section_id into mainsectionid from tbl_shelfmainsection_master_slsms where main_section_type=mainsectiontype;
INSERT INTO tbl_floorinfo_master_slsms (max_allowed_shelve,main_section_id) values(max_allowed_shelves,mainsectionid);
set floorid=last_insert_id();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_insertInstitute_details_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_insertInstitute_details_slsms`(institue_name varchar(256))
BEGIN
	declare old_institueid char(4);
    declare new_instituteid char(4);
	select institute_id into old_institueid from tbl_instituteinfo_master_slsms order by institute_id desc limit 1;
    if old_institueid is null then
		set new_instituteid="I101";
	else
		set new_instituteid=concat("I",substr(old_institueid,2)+1);
	end if;
    insert into tbl_instituteinfo_master_slsms values(new_instituteid,institue_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_insertshelf_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_insertshelf_slsms`(sub_section_id int,floorid int)
BEGIN
	declare old_shelfid char(4);
    declare new_shelfid char(4);
	select shelf_id into old_shelfid from tbl_shelfinfo_slsms where floor_id=floorid order by shelf_id desc limit 1;
    if old_shelfid is null then
		set new_shelfid=concat("S",floorid,"01");
	else
		set new_shelfid=concat("S",substr(old_shelfid,2)+1);
	end if;
    INSERT INTO tbl_shelfinfo_slsms values (new_shelfid,null,floorid,sub_section_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_insert_bookdata_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_insert_bookdata_slsms`(booktitle varchar(256),subsectionid int,bookauthor varchar(256),bookpublication varchar(256),bookISBN  char(17),booklanguage varchar(256),bookpaperback int,bookquanitity smallint,bookdimension varchar(45),userinfo varchar(256))
BEGIN
declare old_lib_id varchar(4);
declare new_lib_id varchar(4);
select book_lib_id into	old_lib_id from tbl_bookinfo_master_slsms order by book_lib_id desc limit 1;
if old_lib_id is null then	
set new_lib_id ="B1";
else 
set new_lib_id = concat("B",substr(old_lib_id,2)+1);
end if;
insert into tbl_bookinfo_master_slsms values (new_lib_id,subsectionid,booktitle,bookauthor,bookpublication,bookISBN,booklanguage,bookpaperback,bookdimension,now(),userinfo);
call pro_genrate_insertid_slsms(new_lib_id,bookquanitity);
select new_lib_id,"insert";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_insert_update_bookdata_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_insert_update_bookdata_slsms`(booktitle varchar(256),subsectionid int,bookauthor varchar(256),bookpublication varchar(256),bookISBN  char(17),booklanguage varchar(256),bookpaperback int,bookquantity smallint,bookdimension varchar(45),userinfo varchar(256))
BEGIN
declare lib_id varchar(4);
select Book_lib_id into lib_id from tbl_bookinfo_master_slsms where book_title=booktitle;
if lib_id is null then
call pro_insert_bookdata_slsms(booktitle,subsectionid,bookauthor,bookpublication,bookISBN,booklanguage,bookpaperback,bookquantity,bookdimension,userinfo);
else
call pro_update_bookdata_slsms(lib_id,bookquantity,userinfo);
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_librarian_changeemailpass_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_librarian_changeemailpass_slsms`(uname varchar(256),emailid varchar(256),pass text)
BEGIN
	if emailid is not null then
		update tbl_nativeuserinfo_master_slsms set email_id=emailid where username=uname;
	elseif pass is not null then
		update tbl_nativeuserinfo_master_slsms set pass=sha2(pass,512),last_logout=null,last_login=null where username=uname;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_librarian_dashboard_report_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_librarian_dashboard_report_slsms`(flag tinyint)
BEGIN
	if flag=1 then
		select distinct count(Bookid) from tbl_configuredbookreport_slsms;
	elseif flag=2 then
		select count(book_id) from tbl_bookconfigration_slsms;
	elseif flag=3 then
		select count(enrollment_no) from tbl_studentregistered_slsms;
	elseif flag=4 then
		select count(enrollment_no) from tbl_facultyinfo_master_slsms;
	elseif flag=5 then
		select count(sub_section_id) from tbl_shelfsubsection_slsms;
	elseif flag=6 then
		select sum(book_quantity) from tbl_notassignedbookslots_slsms;
	elseif flag=7 then
		select count(Book_lib_id) from tbl_extraallbookslots_slsms;
	end if;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_librarian_enabledisable_remove_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_librarian_enabledisable_remove_slsms`(uname varchar(256),state varchar(20),del varchar(20))
BEGIN
	if state is not null then
		if state="1" then
        update tbl_nativeuserinfo_master_slsms set status=1 where username=uname;
		else
        update tbl_nativeuserinfo_master_slsms set status=0 where username=uname;
        end if;
    elseif del is not null then
		delete from tbl_nativeuserinfo_master_slsms where username=uname;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_librarian_list_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_librarian_list_slsms`()
BEGIN
	select name,username,status from tbl_nativeuserinfo_master_slsms where u_role="Librarian";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_locationofbook_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_locationofbook_slsms`(bookid varchar(20))
BEGIN
	select floor_id,tbl_shelftierconfiguration_slsms.shelf_id,shelf_tier_id from tbl_shelfinfo_slsms,tbl_shelftierconfiguration_slsms where book_lib_id=bookid limit 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_login_logout_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_login_logout_status`(uname varchar(256),loginflag boolean,logoutflag boolean)
BEGIN
	if loginflag=true then
		update tbl_nativeuserinfo_master_slsms set last_login=now() where username=uname;
	elseif logoutflag=true then
		update tbl_nativeuserinfo_master_slsms set last_logout=now() where username=uname;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_manage_exisiting_shelves_delete_shelves` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_manage_exisiting_shelves_delete_shelves`(floorid tinyint,subsectionid int,noofdelete tinyint,maxallowedshelves tinyint)
BEGIN
	declare rowaffected int;
    update tbl_floorinfo_master_slsms set max_allowed_shelve=max_allowed_shelve-noofdelete where floor_id=floorid;
    if(noofdelete = maxallowedshelves) then
		delete from tbl_categorywise_arrngement_onfloor_slsms where floor_id=floorid and sub_section_id=subsectionid;
	else
		update tbl_categorywise_arrngement_onfloor_slsms set No_of_allowed_shelves=No_of_allowed_shelves-noofdelete where floor_id=floorid and sub_section_id=subsectionid;
	end if;
	delete from tbl_shelfinfo_slsms where sub_section_id=subsectionid and floor_id=floorid order by shelf_id desc limit noofdelete;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_manage_exisiting_shelves_swap_shelves` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_manage_exisiting_shelves_swap_shelves`(floorid tinyint,subsectionid1 int,subsectionid2 int,noofshelves tinyint)
BEGIN
	declare noofbooklimit tinyint;
	update tbl_categorywise_arrngement_onfloor_slsms set No_of_allowed_shelves=No_of_allowed_shelves-noofshelves where floor_id=floorid and sub_section_id=subsectionid1;
    update tbl_categorywise_arrngement_onfloor_slsms set No_of_allowed_shelves=No_of_allowed_shelves+noofshelves where floor_id=floorid and sub_section_id=subsectionid2;
    select sum(no_of_tiers) into noofbooklimit from (select no_of_tiers from tbl_shelfinfo_slsms where floor_id=2 and sub_section_id=102 order by shelf_id desc limit 2) t;
    update tbl_shelfinfo_slsms set sub_section_id=subsectionid2 where floor_id=floorid and sub_section_id=subsectionid1 order by shelf_id desc limit noofshelves;
    set noofbooklimit=noofbooklimit/2;
    call pro_notassignedbookToassignedbook_slsms(noofbooklimit);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_newbookconfiguration_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_newbookconfiguration_slsms`(booklibid varchar(4),maxallowedbook tinyint,subsectionid tinyint,bookquantity smallint)
BEGIN
declare done int default 0;
declare shelfid varchar(4);
declare shelftierid varchar(8);
declare total int;
declare firstcounter int default 0;
declare secondcounter int default 0;
declare bookconfigonshelf_data CURSOR for SELECT tbl_shelftierconfiguration_slsms.shelf_id,shelf_tier_id from tbl_shelftierconfiguration_slsms,tbl_shelfinfo_slsms where tbl_shelfinfo_slsms.shelf_id=tbl_shelftierconfiguration_slsms.shelf_id and sub_section_id=subsectionid and book_lib_id is null limit 2;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
open bookconfigonshelf_data;
set total=bookquantity;
label1:loop
	fetch bookconfigonshelf_data into shelfid,shelftierid;
	if done =1 then
		leave label1;
	end if;
    update tbl_shelftierconfiguration_slsms set book_lib_id=booklibid,max_allowed_book=maxallowedbook where shelf_id=shelfid and shelf_tier_id=shelftierid;	
	if maxallowedbook >= bookquantity then
		if firstcounter =0 then
			update tbl_shelftierconfiguration_slsms set present_book=bookquantity,start_bookid_range=concat(booklibid,LPAD(1,3,0)),end_bookid_range=concat(booklibid,LPAD(bookquantity,3,0)) where shelf_id=shelfid and shelf_tier_id=shelftierid;	
			set firstcounter=firstcounter+1;
            set total=0;
		end if;
    else
		if secondcounter=0 then
			update tbl_shelftierconfiguration_slsms set present_book=maxallowedbook,start_bookid_range=concat(booklibid,LPAD(1,3,0)),end_bookid_range=concat(booklibid,LPAD(maxallowedbook,3,0)) where shelf_id=shelfid and shelf_tier_id=shelftierid;	
			set secondcounter=secondcounter+1;
            set total=total-maxallowedbook;
        else
			if total >=maxallowedbook then
				update tbl_shelftierconfiguration_slsms set present_book=maxallowedbook,start_bookid_range=concat(booklibid,LPAD(maxallowedbook+1,3,0)),end_bookid_range=concat(booklibid,LPAD(maxallowedbook*2,3,0)) where shelf_id=shelfid and shelf_tier_id=shelftierid;	
				set total=total-maxallowedbook;
            else
				update tbl_shelftierconfiguration_slsms set present_book=total,start_bookid_range=concat(booklibid,LPAD(maxallowedbook+1,3,0)),end_bookid_range=concat(booklibid,LPAD(maxallowedbook+1+total,3,0)) where shelf_id=shelfid and shelf_tier_id=shelftierid;
				set total=total-maxallowedbook;
            end if;
        end if;	
    end if;
end loop label1;
close bookconfigonshelf_data;
if total > 0 and total != bookquantity then 
insert into tbl_extraallbookslots_slsms values(booklibid,total,concat(booklibid,LPAD(bookquantity-total+1,3,0)),concat(booklibid,LPAD(bookquantity,3,0)));
select "extraslots";
elseif total=bookquantity then
insert into tbl_notassignedbookslots_slsms values(booklibid,total,concat(booklibid,LPAD(1,3,0)),concat(booklibid,LPAD(total,3,0)));
select "notassigned";
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_newlyconfiguredbookreport_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_newlyconfiguredbookreport_slsms`()
BEGIN
	select tbl_configuredbookreport_slsms.Bookid,tbl_bookinfo_master_slsms.book_title,tbl_configuredbookreport_slsms.Timestamp,flag from tbl_bookinfo_master_slsms,tbl_configuredbookreport_slsms where tbl_bookinfo_master_slsms.Book_lib_id=tbl_configuredbookreport_slsms.Bookid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_notassignedbookToassignedbook_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_notassignedbookToassignedbook_slsms`(noofbooklimit int)
BEGIN
	declare done int default 0;
    declare booklibid varchar(10);
    declare dimension decimal(4,2);
    declare subsectionid int;
    declare bookquentity int;
    declare maxallowedbookontier int;
    declare cursor1 cursor for select tbl_notassignedbookslots_slsms.Book_lib_id,cast(substring_index(substring_index(book_dimension,"*",2),"*",-1) as decimal(4,2)) as dimension,tbl_bookinfo_master_slsms.book_sub_section_id,book_quantity from tbl_bookinfo_master_slsms,tbl_notassignedbookslots_slsms where tbl_bookinfo_master_slsms.Book_lib_id=tbl_notassignedbookslots_slsms.Book_lib_id limit noofbooklimit;
    declare continue handler for not found set done=1;
    open cursor1;
    label1:loop
		fetch cursor1 into booklibid,dimension,subsectionid,bookquentity;
        if done=1 then
			leave label1;
        end if;
        set maxallowedbookontier=floor(80/dimension)-2;
        call pro_bookconfigurationonshelf_slsms(booklibid,maxallowedbookontier,subsectionid,bookquentity,"insert");
		delete from tbl_notassignedbookslots_slsms where Book_lib_id=booklibid;
    end loop label1;
    close cursor1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_retrieveallallowedfloor_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_retrieveallallowedfloor_slsms`()
BEGIN
declare done INT DEFAULT 0;
declare l_floor_id VARCHAR(256);
declare l_max_allowed_shelf INT;
declare countshelf INT;
declare cur1 CURSOR for select * from tbl_floorinfo_master_slsms;
declare CONTINUE HANDLER FOR NOT FOUND set done=1;
open cur1;
loop1: loop
fetch cur1 into l_floor_id,l_max_allowed_shelf;
if done=1 then
leave loop1;
END IF;
select count(Floor_id) into countshelf from tbl_shelfconfiguration_slsms where Floor_id=l_floor_id;
IF countshelf<=l_max_allowed_shelf THEN
select l_floor_id as "all floors" ;
END IF; 
END loop loop1;
CLOSE cur1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_retrieveallsubsectiontype_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_retrieveallsubsectiontype_slsms`()
BEGIN
select sub_section_id,sub_section_type from  tbl_shelfsubsection_slsms;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_retrievebookinfomation_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_retrievebookinfomation_slsms`(title varchar(256))
BEGIN
select sub_section_type,book_author,book_publication,book_ISBN_13,book_language,book_paperback,book_dimension,book_sub_section_id from tbl_bookinfo_master_slsms,tbl_shelfsubsection_slsms where tbl_shelfsubsection_slsms.sub_section_id=tbl_bookinfo_master_slsms.book_sub_section_id and book_title=title;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_retrievelastshelf_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_retrievelastshelf_slsms`()
BEGIN
DECLARE getid CHAR(4);
DECLARE lastid CHAR(4);
set getid = SUBSTR((SELECT shelf_id FROM tbl_shelfinfo_master_slsms ORDER BY shelf_id DESC LIMIT 1), 2, 3)+1;
IF getid IS NULL THEN
set lastid=CONCAT("S","101");
ELSE
set lastid=CONCAT("S",getid);
END IF;
SELECT lastid as "ShelfId";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_retrievemainsectiontype` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_retrievemainsectiontype`()
BEGIN
select main_section_type from tbl_shelfmainsection_master_slsms;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_retriveSubsectionBasedOnMainSection` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_retriveSubsectionBasedOnMainSection`(mainsectiontype varchar(20))
BEGIN
declare mainsectionid TINYINT;
select main_section_id into mainsectionid from tbl_shelfmainsection_master_slsms where main_section_type=mainsectiontype;
select sub_section_type,sub_section_id from tbl_shelfsubsection_slsms where main_section_id=mainsectionid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_retrivesubsectiondetails_fromfloor_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_retrivesubsectiondetails_fromfloor_slsms`(floorid int)
BEGIN
	select distinct tbl_shelfinfo_slsms.sub_section_id,sub_section_type from tbl_shelfsubsection_slsms,tbl_shelfinfo_slsms where tbl_shelfsubsection_slsms.sub_section_id=tbl_shelfinfo_slsms.sub_section_id and floor_id=floorid and no_of_tiers is null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_retrive_facultyinfo_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_retrive_facultyinfo_slsms`(IN Enrollment varchar(256))
begin
	select tbl_facultyinfo_master_slsms.enrollment_no,tbl_facultyinfo_master_slsms.faculty_name,tbl_coursedetails_slsms.course_name,tbl_facultyinfo_master_slsms.faculty_birthdate from tbl_facultyinfo_master_slsms,tbl_coursedetails_slsms where tbl_coursedetails_slsms.course_id=tbl_facultyinfo_master_slsms.course_id and tbl_facultyinfo_master_slsms.enrollment_no=Enrollment;  
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_retrive_lastshelfid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_retrive_lastshelfid`()
BEGIN
	select shelf_id from tbl_shelfinfo_slsms order by shelf_id desc limit 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_retrive_librarianmail_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_retrive_librarianmail_slsms`(uname varchar(256))
BEGIN
	select email_id from tbl_nativeuserinfo_master_slsms where username=uname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_retrive_noofshelves_basedon_subsection` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_retrive_noofshelves_basedon_subsection`(subsectionid int,floorid int)
BEGIN
	select count(shelf_id) from tbl_shelfinfo_slsms where no_of_tiers is null and sub_section_id=subsectionid and floor_id=floorid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_retrive_searchbook_name_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_retrive_searchbook_name_slsms`( searchdata varchar(40),searchtype varchar(40))
BEGIN
declare  l_searchdata varchar(40);
set l_searchdata=concat('%',searchdata,'%');
if searchtype="title" then
select book_title from tbl_bookinfo_master_slsms where book_title like l_searchdata limit 10;
elseif searchtype="author" then 
select book_author from tbl_bookinfo_master_slsms where book_author like l_searchdata limit 10;
elseif searchtype="isbn" then 
select book_ISBN_13 from tbl_bookinfo_master_slsms where book_ISBN_13 like l_searchdata limit 10;
elseif searchtype="publication" then 
select book_publication from tbl_bookinfo_master_slsms where book_publication like l_searchdata limit 10;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_retrive_studentinfo_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_retrive_studentinfo_slsms`(IN Enrollment varchar(256))
begin
	select tbl_studentinfo_master_slsms.enrollment_no,tbl_studentinfo_master_slsms.student_name,tbl_coursedetails_slsms.course_name,tbl_studentinfo_master_slsms.student_birthdate from tbl_studentinfo_master_slsms,tbl_coursedetails_slsms where tbl_coursedetails_slsms.course_id=tbl_studentinfo_master_slsms.course_id and tbl_studentinfo_master_slsms.enrollment_no=Enrollment;  
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_searchbook_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_searchbook_slsms`(searchdata varchar(256),searchtype varchar(40))
BEGIN
declare bookid varchar(256);
if searchtype="title" then
select Book_lib_id into bookid from tbl_bookinfo_master_slsms where book_title = searchdata ;
elseif searchtype="author" then 
select Book_lib_id into bookid from tbl_bookinfo_master_slsms where book_author =searchdata;
elseif searchtype="isbn" then 
select Book_lib_id into bookid from tbl_bookinfo_master_slsms where book_ISBN_13 =searchdata;
elseif searchtype="publication" then 
select Book_lib_id into bookid  from tbl_bookinfo_master_slsms where book_publication =searchdata ;
end if;
select floor_id,tbl_shelftierconfiguration_slsms.shelf_id,tbl_shelftierconfiguration_slsms.shelf_tier_id ,no_of_tiers from tbl_shelfinfo_slsms,tbl_shelftierconfiguration_slsms where tbl_shelfinfo_slsms.shelf_id= tbl_shelftierconfiguration_slsms.shelf_id and book_lib_id=bookid limit 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_shelfconfigure_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_shelfconfigure_slsms`(l_shelfid CHAR(4),l_floor_id TINYINT)
BEGIN
INSERT INTO tbl_shelfconfiguration_slsms values(l_shelfid,l_floor_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_shelf_tierconfiguration_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_shelf_tierconfiguration_slsms`(nooftier int,floorid int,subsectionid int )
BEGIN
	declare shelfid char(4);
	declare count int default 0;
    declare shelf_tier_id char(6);
    SELECT shelf_id into shelfid FROM library.tbl_shelfinfo_slsms where floor_id=floorid and sub_section_id=subsectionid and no_of_tiers is NULL limit 1;
	update tbl_shelfinfo_slsms set no_of_tiers=nooftier where  shelf_id=shelfid;
    if row_count()>0 then
		label1:loop
			if count=nooftier then
				leave label1;
			end if;
            set count=count+1;
            set shelf_tier_id=concat(shelfid,"_",count);
            insert into tbl_shelftierconfiguration_slsms(shelf_id,shelf_tier_id) values(shelfid,shelf_tier_id);
        end loop;
	end if;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_studentregistration_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_studentregistration_slsms`(IN Enrollment char(15),IN Email varchar(256),IN Contect_No Char(14))
begin
	insert into tbl_studentregistered_slsms values(Enrollment,Email,Contect_No);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_updatebookconfiguration_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_updatebookconfiguration_slsms`(booklibid varchar(4),bookquantity smallint)
BEGIN
	declare check_book_lib_id  varchar(4);
    declare shelftierid varchar(6);
    declare maxallowedbook tinyint;
    declare presentbook tinyint;
    declare endbookidrange varchar(5);
    declare b_quantity smallint;
    declare total int;
    declare extrabooktotal tinyint default 0;
    declare done int default 0;
    declare bookconfigonshelf_data CURSOR for select shelf_tier_id,max_allowed_book,present_book,end_bookid_range from tbl_shelftierconfiguration_slsms where (max_allowed_book > present_book or present_book is null) and  book_lib_id=booklibid;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    select Book_lib_id into check_book_lib_id from tbl_notassignedbookslots_slsms where Book_lib_id=booklibid;
    if(check_book_lib_id is not null) then
		update tbl_notassignedbookslots_slsms set book_quantity=book_quantity+bookquantity,end_bookid_range=concat("B",substr(end_bookid_range,2)+bookquantity) where Book_lib_id=check_book_lib_id;
    else
    set b_quantity=bookquantity;
    open bookconfigonshelf_data;
	label1:loop
				fetch bookconfigonshelf_data into shelftierid,maxallowedbook,presentbook,endbookidrange;
				if done =1 then
					leave label1;
				end if;
				if presentbook is not null then
					set total =maxallowedbook-presentbook;
					set bookquantity=bookquantity-total;
					if bookquantity > 0 then
						update tbl_shelftierconfiguration_slsms set present_book=present_book+total,end_bookid_range=concat(booklibid,LPAD(substr(end_bookid_range,3)+total,3,0)) where shelf_tier_id=shelftierid;
						set extrabooktotal=bookquantity;
					else
						update tbl_shelftierconfiguration_slsms set present_book=present_book+b_quantity,end_bookid_range=concat(booklibid,LPAD((substr(end_bookid_range,3)+b_quantity),3,0)) where shelf_tier_id=shelftierid;
						leave label1;
					end if;
				else
					if maxallowedbook >= bookquantity then 
						update tbl_shelftierconfiguration_slsms set present_book=bookquantity,start_bookid_range=concat(booklibid,LPAD(maxallowedbook+1,3,0)),end_bookid_range=concat(booklibid,LPAD(maxallowedbook+bookquantity,3,0)) where shelf_tier_id=shelftierid;
					else
						set extrabooktotal=bookquantity-maxallowedbook;
						update tbl_shelftierconfiguration_slsms set present_book=maxallowedbook,start_bookid_range=concat(booklibid,LPAD(maxallowedbook+1,3,0)),end_bookid_range=concat(booklibid,LPAD(maxallowedbook*2,3,0)) where shelf_tier_id=shelftierid;
					end if;
				end if;
			end loop label1;
		close bookconfigonshelf_data;
	select Book_lib_id into check_book_lib_id from tbl_extraallbookslots_slsms where Book_lib_id=booklibid;
	if check_book_lib_id is not null then
		update tbl_extraallbookslots_slsms set book_quantity=book_quantity+bookquantity,end_bookid_range=concat(booklibid,(substr(end_bookid_range,3)+bookquantity)) where Book_lib_id=check_book_lib_id;
    end if;
    if extrabooktotal > 0 then
		insert into tbl_extraallbookslots_slsms values(booklibid,extrabooktotal,concat(booklibid,LPAD(maxallowedbook*2+1,3,0)),concat(booklibid,LPAD((maxallowedbook*2)+extrabooktotal,3,0)));
    end if;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_updatecategorywisearrangementonfloor_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_updatecategorywisearrangementonfloor_slsms`(floorid tinyint,subsectiontype varchar(256),noofshelves tinyint)
BEGIN
	declare subsectionid tinyint;
    select sub_section_id into subsectionid from tbl_shelfsubsection_slsms where sub_section_type=subsectiontype;
    update tbl_categorywise_arrngement_onfloor_slsms set No_of_allowed_shelves=No_of_allowed_shelves+noofshelves where sub_section_id=subsectionid and floor_id=floorid;
	select subsectionid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_updatefloorofshelf_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_updatefloorofshelf_slsms`(l_shelfid CHAR(4),l_floor_id INT)
BEGIN
Update tbl_shelfconfiguration_slsms set Floor_id=l_floor_id where shelf_id=l_shelfid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_Updatefloor_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_Updatefloor_slsms`(l_floor_id int,max_allowed_shelves int)
BEGIN
Update tbl_floorinfo_master_slsms set max_allowed_shelve=max_allowed_shelves where floor_id=l_floor_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_updateshelf_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_updateshelf_slsms`(l_shelfid CHAR(4),l_no_of_tiers INT)
BEGIN
Update tbl_shelfinfo_master_slsms set no_of_tiers=l_no_of_tiers where shelf_id=l_shelfid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_update_bookdata_slsms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_update_bookdata_slsms`(lib_id varchar(4),quantity smallint,userinfo varchar(256))
BEGIN
declare counter int default 0;
declare old_bookid char(5);
declare new_bookid char(5);
update tbl_bookinfo_master_slsms set TimeStamp=now(), userinfo=userinfo where Book_lib_id=lib_id;
select Book_id into old_bookid from tbl_bookconfigration_slsms where book_lib_id=lib_id order by Book_id desc limit 1;
loop1:loop
if counter =quantity then 
leave loop1;
end if;
set counter=counter+1;
set new_bookid=concat("B",substr(old_bookid,2)+counter);
insert into tbl_bookconfigration_slsms values(lib_id,new_bookid);
end loop loop1;
select lib_id,"update";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-16 17:19:28
