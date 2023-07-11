-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 202.21.32.156    Database: eSentinel_new
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

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
-- Table structure for table `aad`
--

DROP TABLE IF EXISTS `aad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aad` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `LocationId` int DEFAULT NULL,
  `EventTypeId` int DEFAULT NULL,
  `EventDate` timestamp NULL DEFAULT NULL,
  `Sensitivity` int DEFAULT NULL,
  `PipelineId` int DEFAULT NULL,
  `Image` varchar(100) DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aad_event`
--

DROP TABLE IF EXISTS `aad_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aad_event` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `EventTypeId` int DEFAULT NULL,
  `EventType` varchar(100) DEFAULT NULL,
  `SiteId` int DEFAULT NULL,
  `CameraId` int DEFAULT NULL,
  `PipelineId` int DEFAULT NULL,
  `AlertId` int DEFAULT NULL,
  `AlertTimeStamp` timestamp NULL DEFAULT NULL,
  `Image` varchar(100) DEFAULT NULL,
  `IsSend` tinyint(1) DEFAULT NULL,
  `IsFailedSend` tinyint(1) DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT NULL,
  `CreatedTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=536 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SiteId` int DEFAULT NULL,
  `Name` varchar(20) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Status` int NOT NULL DEFAULT '1',
  `CreatedBy` int DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_Area_Site_Id_idx` (`SiteId`),
  CONSTRAINT `FK_Area_Site_Id` FOREIGN KEY (`SiteId`) REFERENCES `site` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset`
--

DROP TABLE IF EXISTS `asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `AssetTypeId` int DEFAULT NULL,
  `DeviceId` int DEFAULT NULL,
  `SiteId` int DEFAULT NULL,
  `AreaId` int DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Purpose` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT '1',
  `IsDelete` tinyint(1) DEFAULT '0',
  `Status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asset_type`
--

DROP TABLE IF EXISTS `asset_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_type` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audit_trail`
--

DROP TABLE IF EXISTS `audit_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_trail` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Module` varchar(64) NOT NULL,
  `RefId` int NOT NULL,
  `Record` varchar(255) DEFAULT NULL,
  `Action` varchar(64) NOT NULL,
  `Changes` json DEFAULT NULL,
  `UserId` int NOT NULL,
  `TimeStamp` datetime NOT NULL,
  `SiteId` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmarks` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL COMMENT 'Creator UserId',
  `Name` varchar(50) DEFAULT NULL,
  `Description` text,
  `ZoomLevel` int DEFAULT NULL,
  `CenterLat` double DEFAULT NULL,
  `CenterLon` double DEFAULT NULL,
  `IsInitView` tinyint(1) DEFAULT '0',
  `LastModifiedDate` datetime DEFAULT NULL,
  `IsDelete` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `camera`
--

DROP TABLE IF EXISTS `camera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camera` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `AreaId` int DEFAULT NULL,
  `SiteId` int DEFAULT NULL,
  `CameraType` varchar(20) DEFAULT NULL,
  `Manufacturer` varchar(20) DEFAULT NULL,
  `Model` varchar(20) DEFAULT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Resolution` varchar(20) DEFAULT NULL,
  `Fps` int DEFAULT NULL,
  `IrEnabled` tinyint(1) DEFAULT '1',
  `Description` varchar(500) DEFAULT NULL,
  `ProcessType` varchar(10) DEFAULT NULL,
  `RtspUrl` varchar(200) DEFAULT NULL,
  `Status` int DEFAULT NULL,
  `CreatedBy` int DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_Site_Id_idx` (`SiteId`),
  KEY `FK_Camera_Area_Id_idx` (`AreaId`),
  CONSTRAINT `FK_Camera_Area_Id` FOREIGN KEY (`AreaId`) REFERENCES `area` (`Id`),
  CONSTRAINT `FK_Camera_Site_Id` FOREIGN KEY (`SiteId`) REFERENCES `site` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=910 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) DEFAULT NULL,
  `ModelId` int DEFAULT NULL,
  `Status` int DEFAULT NULL,
  `CreatedBy` int DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_Class_Model_Id_idx` (`ModelId`),
  CONSTRAINT `FK_Class_Model_Id` FOREIGN KEY (`ModelId`) REFERENCES `model` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=571 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_alarm`
--

DROP TABLE IF EXISTS `event_alarm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_alarm` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int DEFAULT NULL,
  `area_id` int DEFAULT NULL,
  `camera_id` int DEFAULT NULL,
  `pipeline_id` int DEFAULT NULL,
  `stream_id` int DEFAULT NULL,
  `model_id` int DEFAULT NULL,
  `event_timestamp` timestamp NULL DEFAULT NULL,
  `event_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bbox` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `score` decimal(8,7) DEFAULT NULL,
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=437911 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_category`
--

DROP TABLE IF EXISTS `event_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_category` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `EventType` varchar(45) DEFAULT NULL,
  `DisplayName` varchar(45) DEFAULT NULL,
  `Icon` varchar(45) DEFAULT NULL,
  `IconSrc` varchar(10) DEFAULT NULL,
  `IconColor` varchar(10) DEFAULT NULL,
  `CardColor` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_transactions`
--

DROP TABLE IF EXISTS `event_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_transactions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SiteId` int DEFAULT NULL,
  `AreaId` int DEFAULT NULL,
  `CameraId` int DEFAULT NULL,
  `PipelineId` int DEFAULT NULL,
  `ClassId` int DEFAULT NULL,
  `ModelId` int DEFAULT NULL,
  `EventTimeStamp` timestamp NULL DEFAULT NULL,
  `EventType` varchar(100) DEFAULT NULL,
  `Bbox` varchar(100) DEFAULT NULL,
  `Score` decimal(8,7) DEFAULT NULL,
  `FileName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_EventAlarm_Site_Id_idx` (`SiteId`),
  KEY `FK_EventAlarm_Area_idx` (`AreaId`),
  KEY `FK_EventAlarm_Camera_Id_idx` (`CameraId`),
  KEY `FK_EventAlarm_Pipeline_Id_idx` (`PipelineId`),
  KEY `FK_EventAlarm_Model_Id_idx` (`ModelId`),
  FULLTEXT KEY `idx_event_transactions_EventType` (`EventType`)
) ENGINE=InnoDB AUTO_INCREMENT=1985 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `favourite_asset`
--

DROP TABLE IF EXISTS `favourite_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourite_asset` (
  `UserId` int NOT NULL,
  `AssetId` int NOT NULL,
  `LastModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`UserId`,`AssetId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `journey_map`
--

DROP TABLE IF EXISTS `journey_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journey_map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `faceid` varchar(200) NOT NULL,
  `faceloc` varchar(45) NOT NULL,
  `time` timestamp NOT NULL,
  `site_area` varchar(45) NOT NULL,
  `camid` int NOT NULL,
  `cropped_face_path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `Version` int DEFAULT NULL,
  `Framework` varchar(20) DEFAULT NULL,
  `FrameworkVersion` int DEFAULT NULL,
  `BaseAlgorithm` varchar(20) DEFAULT NULL,
  `MinGpuRam` int DEFAULT '1',
  `NumberOfCuda` int DEFAULT '1000',
  `FileLocation` varchar(20) DEFAULT NULL,
  `PrimaryFileLoc` varchar(200) DEFAULT NULL,
  `PrimaryFileName` varchar(100) DEFAULT NULL,
  `SecondaryFileloc` varchar(200) DEFAULT NULL,
  `SecondaryFileName` varchar(100) DEFAULT NULL,
  `Status` int DEFAULT '1',
  `CreatedBy` int DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nationality`
--

DROP TABLE IF EXISTS `nationality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nationality` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nationality` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pipeline`
--

DROP TABLE IF EXISTS `pipeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pipeline` (
  `Id` int NOT NULL,
  `CameraId` int DEFAULT NULL,
  `ModelId` int DEFAULT NULL,
  `ProcessingType` varchar(5) DEFAULT NULL,
  `SkipFrames` int DEFAULT NULL,
  `DoTracking` tinyint DEFAULT NULL,
  `ZoneFlag` tinyint DEFAULT NULL,
  `ZoneTopLeftX` int DEFAULT NULL,
  `ZoneTopLeftY` int DEFAULT NULL,
  `ZoneBotRightX` int DEFAULT NULL,
  `ZoneBotRightY` int DEFAULT NULL,
  `Status` int DEFAULT '1',
  `CreatedBy` int DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pipeline_class_map`
--

DROP TABLE IF EXISTS `pipeline_class_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pipeline_class_map` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `PipelineId` int DEFAULT NULL,
  `ModelId` int DEFAULT NULL,
  `ClassId` int DEFAULT NULL,
  `CreatedBy` int DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=703 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Description` text NOT NULL,
  `AccessRights` json NOT NULL,
  `LastModifiedDate` datetime NOT NULL,
  `IsDelete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `race`
--

DROP TABLE IF EXISTS `race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `race` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `side_alert_view`
--

DROP TABLE IF EXISTS `side_alert_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `side_alert_view` (
  `Id` int NOT NULL,
  `SiteId` int DEFAULT NULL,
  `EventCategoryId` int DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT NULL,
  `CreatedTimeStamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `Sequence` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Location` varchar(200) DEFAULT NULL,
  `Description` varchar(300) DEFAULT NULL,
  `Status` int NOT NULL DEFAULT '1',
  `CreatedBy` int DEFAULT NULL,
  `CreatedTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SiteId` int DEFAULT NULL,
  `ClassificationId` int DEFAULT NULL,
  `PassNo` varchar(30) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `NRIC` varchar(10) DEFAULT NULL,
  `NRICHash` varchar(255) DEFAULT NULL,
  `NationalityId` int DEFAULT NULL,
  `Designation` varchar(100) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Race` varchar(100) DEFAULT NULL,
  `Remark` text,
  `IsDelete` tinyint(1) NOT NULL DEFAULT '0',
  `LastModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `OfficerId` (`PassNo`)
) ENGINE=InnoDB AUTO_INCREMENT=2472 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff_classification`
--

DROP TABLE IF EXISTS `staff_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_classification` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SiteId` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `AutoGenerate` tinyint NOT NULL DEFAULT '1',
  `Min` int DEFAULT NULL,
  `Max` int DEFAULT NULL,
  `IsDelete` tinyint(1) DEFAULT '0',
  `LastModifiedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff_face`
--

DROP TABLE IF EXISTS `staff_face`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_face` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `StaffId` int DEFAULT NULL,
  `FaceDate` datetime DEFAULT NULL,
  `Model` varchar(255) DEFAULT NULL COMMENT 'Nymo model name',
  `IsActive` tinyint(1) DEFAULT '1' COMMENT 'status in engine',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1725 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff_movement_hist`
--

DROP TABLE IF EXISTS `staff_movement_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_movement_hist` (
  `SiteId` int DEFAULT NULL,
  `StaffId` int NOT NULL,
  `CameraId` int DEFAULT NULL,
  `RecordTimestamp` timestamp NOT NULL,
  `FileName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CreationTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`StaffId`,`RecordTimestamp`),
  KEY `CameraId` (`CameraId`),
  KEY `idx_staff_movement_hist_SiteId` (`SiteId`),
  KEY `idx_staff_movement_hist_SiteId_CameraId` (`SiteId`,`CameraId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff_movement_live`
--

DROP TABLE IF EXISTS `staff_movement_live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_movement_live` (
  `SiteId` int DEFAULT NULL,
  `StaffId` int NOT NULL,
  `CameraId` int DEFAULT NULL,
  `RecordTimestamp` timestamp NULL DEFAULT NULL,
  `FileName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CreationTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`StaffId`),
  KEY `CameraId` (`CameraId`),
  KEY `idx_staff_movement_live_SiteId` (`SiteId`),
  KEY `idx_staff_movement_live_SiteId_CameraId` (`SiteId`,`CameraId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SiteId` varchar(100) DEFAULT NULL COMMENT 'Authorised Site Ids. Comma delimiter',
  `Username` varchar(128) NOT NULL,
  `Password` varchar(64) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `ProfileId` int NOT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `IsDelete` tinyint(1) NOT NULL DEFAULT '0',
  `LastModifiedDate` datetime NOT NULL,
  `RequiredPasswordChange` tinyint(1) NOT NULL DEFAULT '1',
  `Preferences` json DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-10 16:32:14
