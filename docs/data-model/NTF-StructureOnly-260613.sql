-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 10.166.148.183    Database: HBloxNTF_DEV01
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.2

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
-- Table structure for table `H_AAA_AppClients`
--

DROP TABLE IF EXISTS `H_AAA_AppClients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_AppClients` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClientId` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ClientSecret` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AppTypeId` bigint unsigned NOT NULL,
  `IsInactive` tinyint NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ClientId` (`ClientId`),
  KEY `idx_1a7a587ecc0d5597b346ed7a276adc56` (`AppTypeId`),
  CONSTRAINT `fk_1827405acb205be6a3ce66d25810972f` FOREIGN KEY (`AppTypeId`) REFERENCES `H_AAA_AppTypes` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_AAA_AppPermissions`
--

DROP TABLE IF EXISTS `H_AAA_AppPermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_AppPermissions` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CodeUri` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_AAA_AppTypePermissions`
--

DROP TABLE IF EXISTS `H_AAA_AppTypePermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_AppTypePermissions` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `AppTypeId` bigint unsigned NOT NULL,
  `AppPermissionId` bigint unsigned NOT NULL,
  `Signature` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_22e410e836875a66b482ca0fd94fcf54` (`AppPermissionId`),
  KEY `idx_b9ba5fb6caec5aeca348230a2bed78b8` (`AppTypeId`),
  CONSTRAINT `fk_87f3ca6afb7d5c9789a936b11c7b04e8` FOREIGN KEY (`AppTypeId`) REFERENCES `H_AAA_AppTypes` (`Id`),
  CONSTRAINT `fk_b56c7a1056d85043b43d37bf24130421` FOREIGN KEY (`AppPermissionId`) REFERENCES `H_AAA_AppPermissions` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_AAA_AppTypes`
--

DROP TABLE IF EXISTS `H_AAA_AppTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_AppTypes` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `H_AAA_EntityProfile`
--

DROP TABLE IF EXISTS `H_AAA_EntityProfile`;
/*!50001 DROP VIEW IF EXISTS `H_AAA_EntityProfile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `H_AAA_EntityProfile` AS SELECT 
 1 AS `Id`,
 1 AS `PartyCode`,
 1 AS `Title`,
 1 AS `Address_fsx`,
 1 AS `City`,
 1 AS `Province`,
 1 AS `Country`,
 1 AS `PostalCode_fsx`,
 1 AS `Phone_fsx`,
 1 AS `FaxNumber_fsx`,
 1 AS `Email_fsx`,
 1 AS `Discriminator`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `H_AAA_EntityRolePermissions`
--

DROP TABLE IF EXISTS `H_AAA_EntityRolePermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_EntityRolePermissions` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `RoleId` bigint unsigned NOT NULL,
  `PermissionId` bigint unsigned NOT NULL,
  `Signature` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_d34e86ed23f5563d99921392400705b6` (`PermissionId`),
  KEY `idx_f47b158ccaf354198ee75769a2c85336` (`RoleId`),
  CONSTRAINT `fk_0b8c184a32f353a9bc14170f4f8e811a` FOREIGN KEY (`PermissionId`) REFERENCES `H_AAA_Permissions` (`Id`),
  CONSTRAINT `fk_80cefff5d47957b783c90f6159750346` FOREIGN KEY (`RoleId`) REFERENCES `H_AAA_EntityRoles` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_AAA_EntityRoles`
--

DROP TABLE IF EXISTS `H_AAA_EntityRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_EntityRoles` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EntityId` bigint unsigned NOT NULL,
  `ActENUM` int unsigned NOT NULL,
  `IsDefault` tinyint(1) DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_cf754bf622395e7e9b68d1c10a975635` (`ActENUM`),
  KEY `idx_de5c092884f152cbaf5bbfadbd0fb67e` (`EntityId`,`ActENUM`),
  CONSTRAINT `fk_516314666c0b5b79b5e3a92b1f7987fe` FOREIGN KEY (`ActENUM`) REFERENCES `H_AAA_EntityScenarios` (`PermittedActENUM`),
  CONSTRAINT `fk_7d5eb43373e7529a899d0f5f64f0f0b7` FOREIGN KEY (`EntityId`, `ActENUM`) REFERENCES `H_AAA_EntityScenarios` (`EntityId`, `PermittedActENUM`),
  CONSTRAINT `fk_820741232917505e9eaf61cff911d85a` FOREIGN KEY (`EntityId`) REFERENCES `H_AAA_EntityScenarios` (`EntityId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_AAA_EntityScenarios`
--

DROP TABLE IF EXISTS `H_AAA_EntityScenarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_EntityScenarios` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `EntityId` bigint unsigned NOT NULL,
  `PermittedActENUM` int unsigned NOT NULL,
  `ScenarioId` bigint unsigned NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_54e3697a0c625ced9311863212b1711d` (`PermittedActENUM`),
  KEY `idx_74d1cc3c33805e3eb68245b088504ef4` (`EntityId`,`PermittedActENUM`,`ScenarioId`),
  KEY `idx_98413c401e3f5fb9af31949039ff2db3` (`EntityId`),
  KEY `idx_b4f8c5ec590054c4a88a6ca6a5bac48d` (`ScenarioId`),
  CONSTRAINT `fk_34532e3c334f527487d3f59493f89962` FOREIGN KEY (`ScenarioId`) REFERENCES `H_AAA_Scenarios` (`Id`),
  CONSTRAINT `fk_7baae7efd65c5c52ae2f0fd55cca9637` FOREIGN KEY (`EntityId`) REFERENCES `H_AAA_Synced_EntityProfile` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_AAA_Permissions`
--

DROP TABLE IF EXISTS `H_AAA_Permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_Permissions` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CodeUri` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_AAA_ScenarioDataMap`
--

DROP TABLE IF EXISTS `H_AAA_ScenarioDataMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_ScenarioDataMap` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ScenarioId` bigint unsigned NOT NULL,
  `TargetActENUM` int unsigned NOT NULL,
  `PermitTableName` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PermitEntityFieldName` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SourceDataType` enum('EntityId','BaseTable','Join') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EntityId` bigint unsigned DEFAULT NULL,
  `BaseTableName` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JoinerActENUM` int unsigned DEFAULT NULL,
  `JoinerFieldName` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JoiningTableName` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TargetFieldName` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CachedQuerySQL` mediumtext COLLATE utf8mb4_unicode_ci,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_75b8d33fa3295c04b9bc0a8497435b18` (`TargetActENUM`),
  KEY `idx_3e967e16ee1c5d79a53ef4995f33badc` (`JoinerActENUM`),
  KEY `idx_df4f2f80fc765155b60c8c2a309c4f8f` (`ScenarioId`),
  CONSTRAINT `fk_3181e5806c8950a2a5ec8141ccb7f788` FOREIGN KEY (`ScenarioId`) REFERENCES `H_AAA_Scenarios` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_AAA_Scenarios`
--

DROP TABLE IF EXISTS `H_AAA_Scenarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_Scenarios` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Description` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActivityClassENUM` int unsigned NOT NULL,
  `ClientEntityId` bigint unsigned NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `unq_fb712219ad0957f680a41fb1b4961d25` (`ActivityClassENUM`,`ClientEntityId`),
  KEY `idx_8a499dbca8665b80b87db70962a54b4e` (`ClientEntityId`,`ActivityClassENUM`),
  CONSTRAINT `fk_96c9ad1b994f5260a0a5612fee99c796` FOREIGN KEY (`ClientEntityId`) REFERENCES `H_AAA_Synced_EntityProfile` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_AAA_Synced_EntityProfile`
--

DROP TABLE IF EXISTS `H_AAA_Synced_EntityProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_Synced_EntityProfile` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `PartyCode` varchar(48) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Address_fsx` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `City` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Province` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Country` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PostalCode_fsx` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Phone_fsx` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FaxNumber_fsx` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email_fsx` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Discriminator` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `PartyCode` (`PartyCode`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_AAA_Synced_UserInfo`
--

DROP TABLE IF EXISTS `H_AAA_Synced_UserInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_Synced_UserInfo` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Firstname_fsx` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Lastname_fsx` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Username` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email_fsx` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailConfirmed` tinyint DEFAULT NULL,
  `CellPhone_fsx` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CellPhoneConfirmed` tinyint DEFAULT NULL,
  `IssuedBy` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_AAA_Synced_UserProfile`
--

DROP TABLE IF EXISTS `H_AAA_Synced_UserProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_Synced_UserProfile` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `UserId` bigint unsigned NOT NULL,
  `Address_fsx` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `City` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Province` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Country` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Language` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TimeZone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Currency` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SignatureUri` longtext COLLATE utf8mb4_unicode_ci,
  `PhotoUri` longtext COLLATE utf8mb4_unicode_ci,
  `PostalCode_fsx` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BirthDate_fsx` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Notification_SMS_fsx` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Notification_Phone_fsx` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Notification_Email_fsx` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Notification_WhatsApp_fsx` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserId` (`UserId`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  CONSTRAINT `fk_ea76a6ff530c5f1cb115f1d1a04870c6` FOREIGN KEY (`UserId`) REFERENCES `H_AAA_Synced_UserInfo` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_AAA_TableAuditConfigs`
--

DROP TABLE IF EXISTS `H_AAA_TableAuditConfigs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_TableAuditConfigs` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `TableName` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActive` tinyint NOT NULL DEFAULT '1',
  `IsIndividualManaged` tinyint(1) NOT NULL DEFAULT '0',
  `Signature` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_AAA_TableAudits`
--

DROP TABLE IF EXISTS `H_AAA_TableAudits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_TableAudits` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `TableName` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TableRowId` bigint unsigned NOT NULL,
  `Actor` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Action` enum('Create','Update','Delete') COLLATE utf8mb4_unicode_ci NOT NULL,
  `PreviousData` json DEFAULT NULL,
  `CurrentData` json DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_AAA_UserAppSettings`
--

DROP TABLE IF EXISTS `H_AAA_UserAppSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_UserAppSettings` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `UserId` bigint unsigned NOT NULL,
  `AppClientId` bigint unsigned NOT NULL,
  `Setting_fsx` text COLLATE utf8mb4_unicode_ci,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `unq_user_app_settings_user_app_record_deleted` (`UserId`,`AppClientId`,`RecordDeleted`),
  KEY `idx_user_app_settings_user_id` (`UserId`),
  KEY `idx_user_app_settings_app_client_id` (`AppClientId`),
  CONSTRAINT `fk_user_app_settings_app_client` FOREIGN KEY (`AppClientId`) REFERENCES `H_AAA_AppClients` (`Id`),
  CONSTRAINT `fk_user_app_settings_user_info` FOREIGN KEY (`UserId`) REFERENCES `H_AAA_Synced_UserInfo` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_AAA_UserEntityRoles`
--

DROP TABLE IF EXISTS `H_AAA_UserEntityRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_UserEntityRoles` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `UserId` bigint unsigned NOT NULL,
  `EntityRoleId` bigint unsigned NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_f818fe0ab9f5539b8c048cbe5ad88279` (`EntityRoleId`),
  KEY `idx_4228c2a99f1050f49ad2ca13cd8b20fc` (`UserId`),
  CONSTRAINT `fk_15dfb14c346d55bda757506cbf287f8f` FOREIGN KEY (`EntityRoleId`) REFERENCES `H_AAA_EntityRoles` (`Id`),
  CONSTRAINT `fk_411d58565d2552e19e469c59d78b7385` FOREIGN KEY (`UserId`) REFERENCES `H_AAA_Synced_UserInfo` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_APIs`
--

DROP TABLE IF EXISTS `H_APIs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_APIs` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `APIId` bigint unsigned NOT NULL,
  `Protocol` varchar(32) DEFAULT NULL,
  `Host` varchar(256) DEFAULT NULL,
  `Port` mediumint unsigned DEFAULT NULL,
  `Version` varchar(32) DEFAULT NULL,
  `ModuleId` varchar(32) DEFAULT NULL,
  `Path` varchar(256) NOT NULL,
  `Name` varchar(256) NOT NULL,
  `Signature` varchar(256) DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `APIId` (`APIId`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_DP_ActorVersions`
--

DROP TABLE IF EXISTS `H_DP_ActorVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_DP_ActorVersions` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ScenarioId` int unsigned NOT NULL,
  `EntityId` int unsigned NOT NULL,
  `ComponentType` enum('breadcrumb','built-page','button','form','grid','header','footer','input-field','lookup-field','menu','modal','page','wizard','search-bar','label','select','radio-group','upload-files','take-photo','multiselect','signature','select-day','calendar','checkbox','select-color','report','container','chart','list','dpgv','date-picker','time-picker','role-builder','ui-config','blue-print','list-report','widget','autocomplete','country-select') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ComponentCodeName` bigint unsigned NOT NULL,
  `Version` bigint unsigned NOT NULL,
  `Comments` tinytext COLLATE utf8mb4_unicode_ci,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_9d8c610b7aea58c8aa960e62761e71f0` (`ComponentCodeName`,`Version`,`ComponentType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_DP_ComponentChildren`
--

DROP TABLE IF EXISTS `H_DP_ComponentChildren`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_DP_ComponentChildren` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ParentComponentBaseId` bigint unsigned NOT NULL,
  `DP_ChildComponentType` enum('breadcrumb','built-page','button','form','grid','header','footer','input-field','lookup-field','menu','modal','page','wizard','search-bar','label','select','radio-group','upload-files','take-photo','multiselect','signature','select-day','calendar','checkbox','select-color','report','container','chart','list','dpgv','date-picker','time-picker','role-builder','ui-config','blue-print','list-report','widget','autocomplete','country-select') COLLATE utf8mb4_unicode_ci NOT NULL,
  `DP_ChildComponentCodeName` bigint unsigned NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_0157d40cb78a54bb89475e9ec3704fa8` (`ParentComponentBaseId`),
  KEY `idx_671433b76fb358218bc46b81fcf73aa0` (`DP_ChildComponentType`,`DP_ChildComponentCodeName`),
  CONSTRAINT `fk_4d3d2121b4aa5dcca0d5a5d97f09a6a4` FOREIGN KEY (`DP_ChildComponentType`, `DP_ChildComponentCodeName`) REFERENCES `H_DP_ComponentsBases` (`Type`, `CodeName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_86031748e1aa573e969de51ce74b578a` FOREIGN KEY (`ParentComponentBaseId`) REFERENCES `H_DP_ComponentsBases` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=37656 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_DP_ComponentsBases`
--

DROP TABLE IF EXISTS `H_DP_ComponentsBases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_DP_ComponentsBases` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Type` enum('breadcrumb','built-page','button','form','grid','header','footer','input-field','lookup-field','menu','modal','page','wizard','search-bar','label','select','radio-group','upload-files','take-photo','multiselect','signature','select-day','calendar','checkbox','select-color','report','container','chart','list','dpgv','date-picker','time-picker','role-builder','ui-config','blue-print','list-report','widget','autocomplete','country-select') COLLATE utf8mb4_unicode_ci NOT NULL,
  `CodeName` bigint unsigned NOT NULL,
  `Version` bigint unsigned NOT NULL,
  `Description` mediumtext COLLATE utf8mb4_unicode_ci,
  `Data` json NOT NULL,
  `DataExtra` json DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`,`CodeName`,`Version`),
  UNIQUE KEY `unq_274bcffeacd7590c8debc2b510fe25ce` (`Type`,`CodeName`,`Version`),
  KEY `idx_3215abd1124b5f1dae5532558239939d` (`Type`,`CodeName`)
) ENGINE=InnoDB AUTO_INCREMENT=42178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_DP_ENUM_EventTypes`
--

DROP TABLE IF EXISTS `H_DP_ENUM_EventTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_DP_ENUM_EventTypes` (
  `ENUM` int unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_DP_EventOutbox`
--

DROP TABLE IF EXISTS `H_DP_EventOutbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_DP_EventOutbox` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `EventTypeENUM` int unsigned NOT NULL,
  `Payload` json NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_ActivityClasses`
--

DROP TABLE IF EXISTS `H_ENUM_ActivityClasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_ActivityClasses` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_Actors`
--

DROP TABLE IF EXISTS `H_ENUM_Actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_Actors` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_ActorsSorts`
--

DROP TABLE IF EXISTS `H_ENUM_ActorsSorts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_ActorsSorts` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_DataSourceTypes`
--

DROP TABLE IF EXISTS `H_ENUM_DataSourceTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_DataSourceTypes` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_EventTypes`
--

DROP TABLE IF EXISTS `H_ENUM_EventTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_EventTypes` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_NotificationChannelTypes`
--

DROP TABLE IF EXISTS `H_ENUM_NotificationChannelTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_NotificationChannelTypes` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_NotificationPlatforms`
--

DROP TABLE IF EXISTS `H_ENUM_NotificationPlatforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_NotificationPlatforms` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_NotificationStatuses`
--

DROP TABLE IF EXISTS `H_ENUM_NotificationStatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_NotificationStatuses` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_NotificationTemplates`
--

DROP TABLE IF EXISTS `H_ENUM_NotificationTemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_NotificationTemplates` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_ScenarioDataMapCheckingTypes`
--

DROP TABLE IF EXISTS `H_ENUM_ScenarioDataMapCheckingTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_ScenarioDataMapCheckingTypes` (
  `ENUM` int unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_EntityNotificationSettings`
--

DROP TABLE IF EXISTS `H_EntityNotificationSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_EntityNotificationSettings` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `EntityId` bigint unsigned NOT NULL,
  `IsEnabledInApp` tinyint(1) NOT NULL DEFAULT '1',
  `IsEnabledEmail` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_09ce4f31cf7758cfa34147888f7f2ea9` (`EntityId`),
  CONSTRAINT `fk_ec93a1a45f865a3caa8f4ee2926903fc` FOREIGN KEY (`EntityId`) REFERENCES `H_AAA_Synced_EntityProfile` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_EntityNotificationSettingsLog`
--

DROP TABLE IF EXISTS `H_EntityNotificationSettingsLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_EntityNotificationSettingsLog` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `EntityNotificationSettingId` bigint unsigned NOT NULL,
  `EntityId` bigint unsigned NOT NULL,
  `IsEnabledInApp` tinyint(1) NOT NULL DEFAULT '1',
  `IsEnabledEmail` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_3eb97bae21175daa9191f9a6136022a2` (`EntityId`),
  KEY `idx_eb4c65a18ed051ffa27edb333e20ba90` (`EntityNotificationSettingId`),
  CONSTRAINT `fk_573a21ea0b7b5b00859597f662d14c18` FOREIGN KEY (`EntityNotificationSettingId`) REFERENCES `H_EntityNotificationSettings` (`Id`),
  CONSTRAINT `fk_b514b2be469752a58ce62628c1ca8c61` FOREIGN KEY (`EntityId`) REFERENCES `H_AAA_Synced_EntityProfile` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_EventHandlerListenersMap`
--

DROP TABLE IF EXISTS `H_EventHandlerListenersMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_EventHandlerListenersMap` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `BoxTypeENUM` tinyint unsigned NOT NULL,
  `EventTypeENUM` int unsigned NOT NULL,
  `ServiceENUM` int unsigned NOT NULL,
  `HandlingStructure` json DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_EventHandlerProcessingQueue`
--

DROP TABLE IF EXISTS `H_EventHandlerProcessingQueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_EventHandlerProcessingQueue` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `EventHandlerListenersMapId` bigint unsigned NOT NULL,
  `EventTypeENUM` int unsigned NOT NULL,
  `ServiceENUM` int unsigned NOT NULL,
  `Message` json DEFAULT NULL,
  `RetryCount` tinyint unsigned NOT NULL DEFAULT '0',
  `Status` tinyint unsigned NOT NULL DEFAULT '1',
  `StatusReason` tinytext,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `EventHandlerListenersMapId` (`EventHandlerListenersMapId`),
  CONSTRAINT `H_EventHandlerProcessingQueue_ibfk_1` FOREIGN KEY (`EventHandlerListenersMapId`) REFERENCES `H_EventHandlerListenersMap` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_EventInbox`
--

DROP TABLE IF EXISTS `H_EventInbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_EventInbox` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `AppId` int unsigned NOT NULL,
  `EventTypeENUM` int unsigned NOT NULL,
  `EventTypeScope` varchar(128) DEFAULT NULL,
  `EventInitiatorUserGUId` varchar(36) DEFAULT NULL,
  `EventInitiatorEntityGUId` varchar(36) DEFAULT NULL,
  `ActorActENUM` int unsigned DEFAULT NULL,
  `ActivityClassENUM` int unsigned DEFAULT NULL,
  `Message` json NOT NULL,
  `Audiences` json NOT NULL,
  `Status` tinyint unsigned NOT NULL DEFAULT '1',
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_EventOutbox`
--

DROP TABLE IF EXISTS `H_EventOutbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_EventOutbox` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `EventTypeENUM` int unsigned NOT NULL,
  `EventTypeScope` varchar(128) DEFAULT NULL,
  `EventInitiatorUserGUId` varchar(36) DEFAULT NULL,
  `EventInitiatorEntityGUId` varchar(36) DEFAULT NULL,
  `ActorActENUM` int unsigned DEFAULT NULL,
  `ActivityClassENUM` int unsigned DEFAULT NULL,
  `Message` json NOT NULL,
  `Audiences` json NOT NULL,
  `Status` tinyint unsigned NOT NULL DEFAULT '1',
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_NotificationQueue`
--

DROP TABLE IF EXISTS `H_NotificationQueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_NotificationQueue` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `NotificationRequestId` bigint unsigned NOT NULL,
  `UserId` bigint unsigned DEFAULT NULL,
  `EntityId` bigint unsigned DEFAULT NULL,
  `ChannelType` tinyint NOT NULL,
  `Destination_fsx` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` tinyint NOT NULL,
  `Reason` mediumtext COLLATE utf8mb4_unicode_ci,
  `RetryCount` int NOT NULL DEFAULT '0',
  `BroadcastedAt_UTC` datetime DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_8275069dcbea58ccb5a6a50191252a16` (`UserId`),
  KEY `idx_4bc9211edc385338bdaeff49a4955cc0` (`EntityId`),
  KEY `idx_94ba4c99d58f5fc3aaaccb675c67005e` (`NotificationRequestId`),
  CONSTRAINT `fk_59005d7006775de2a0bcef6e71370151` FOREIGN KEY (`UserId`) REFERENCES `H_AAA_Synced_UserInfo` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_60405a6357d65b3d8efe24733c693b6a` FOREIGN KEY (`NotificationRequestId`) REFERENCES `H_NotificationRequests` (`Id`),
  CONSTRAINT `fk_ffb79923bd25550a816c134ba0606181` FOREIGN KEY (`EntityId`) REFERENCES `H_AAA_Synced_EntityProfile` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_NotificationRequests`
--

DROP TABLE IF EXISTS `H_NotificationRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_NotificationRequests` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `HasRule` tinyint(1) NOT NULL,
  `UserRecordKey` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EntityRecordKey` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RuleRecordKey` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Body` json NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=898 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_NotificationRetryLog`
--

DROP TABLE IF EXISTS `H_NotificationRetryLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_NotificationRetryLog` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `NotificationQueueId` bigint unsigned NOT NULL,
  `Status` tinyint NOT NULL,
  `Reason` mediumtext COLLATE utf8mb4_unicode_ci,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_cade9c7bc52453df9bc54e4193948e9e` (`NotificationQueueId`),
  CONSTRAINT `fk_6e923694f22653129f039f207adb2f9d` FOREIGN KEY (`NotificationQueueId`) REFERENCES `H_NotificationQueue` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_NotificationTemplateSettings`
--

DROP TABLE IF EXISTS `H_NotificationTemplateSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_NotificationTemplateSettings` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `NotificationTypeENUM` int unsigned NOT NULL,
  `NotificationTemplateENUM` int unsigned NOT NULL,
  `NotificationPlatformENUM` int unsigned NOT NULL,
  `Settings` json NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_SYNC_DataSyncSessionDetail`
--

DROP TABLE IF EXISTS `H_SYNC_DataSyncSessionDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_SYNC_DataSyncSessionDetail` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `SessionId` bigint unsigned NOT NULL,
  `StartedAt_UTC` datetime DEFAULT NULL,
  `FinishedAt_UTC` datetime DEFAULT NULL,
  `Source` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Destination` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CheckModificationSince_UTC` datetime DEFAULT NULL,
  `CheckModificationTill_UTC` datetime DEFAULT NULL,
  `SourceLastModifiedAt_UTC` datetime NOT NULL,
  `DestModifiedAt_UTC` datetime DEFAULT NULL,
  `DestUpdateStartedAt_UTC` datetime NOT NULL,
  `TotalSyncRequiredRecords` int unsigned DEFAULT NULL,
  `ProcessedRecords` int unsigned DEFAULT NULL,
  `SyncSucceeded` int unsigned DEFAULT NULL,
  `SyncFailed` int unsigned DEFAULT NULL,
  `LastError` longtext COLLATE utf8mb4_unicode_ci,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_eb0f203c6b905ac18fcfffc9c1f1cbbf` (`SessionId`),
  CONSTRAINT `fk_6c37e5e86e455ba891fa82505b92e6f7` FOREIGN KEY (`SessionId`) REFERENCES `H_SYNC_DataSyncSessions` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_SYNC_DataSyncSessions`
--

DROP TABLE IF EXISTS `H_SYNC_DataSyncSessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_SYNC_DataSyncSessions` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Actor` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` tinyint unsigned NOT NULL,
  `Summary` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TotalVerifiedSources` int unsigned DEFAULT NULL,
  `SyncRequiredSources` int unsigned DEFAULT NULL,
  `ProcessedSource` int unsigned DEFAULT NULL,
  `SyncSucceeded` int unsigned DEFAULT NULL,
  `SyncFailed` int unsigned DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=44241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_UserNotificationSettings`
--

DROP TABLE IF EXISTS `H_UserNotificationSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_UserNotificationSettings` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `UserId` bigint unsigned NOT NULL,
  `IsEnabledInApp` tinyint(1) NOT NULL DEFAULT '1',
  `IsEnabledEmail` tinyint(1) NOT NULL DEFAULT '0',
  `IsEnabledSMS` tinyint(1) NOT NULL DEFAULT '0',
  `IsEnabledPhone` tinyint(1) NOT NULL DEFAULT '0',
  `IsEnabledWhatsApp` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_3e261e7beed656dc8b28b6e70c1e551d` (`UserId`),
  CONSTRAINT `fk_1f6e6724cfb75c2c9326be6cb0a23a5c` FOREIGN KEY (`UserId`) REFERENCES `H_AAA_Synced_UserInfo` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_UserNotificationSettingsLog`
--

DROP TABLE IF EXISTS `H_UserNotificationSettingsLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_UserNotificationSettingsLog` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `UserNotificationSettingId` bigint unsigned NOT NULL,
  `UserId` bigint unsigned NOT NULL,
  `IsEnabledInApp` tinyint(1) NOT NULL DEFAULT '1',
  `IsEnabledEmail` tinyint(1) NOT NULL DEFAULT '0',
  `IsEnabledSMS` tinyint(1) NOT NULL DEFAULT '0',
  `IsEnabledPhone` tinyint(1) NOT NULL DEFAULT '0',
  `IsEnabledWhatsApp` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_b4751a041303591b9148e4050257a274` (`UserId`),
  KEY `idx_a337a4e374d9580cad5a953af27a4047` (`UserNotificationSettingId`),
  CONSTRAINT `fk_08b82498802c5cce8fa90a7c3499a364` FOREIGN KEY (`UserNotificationSettingId`) REFERENCES `H_UserNotificationSettings` (`Id`),
  CONSTRAINT `fk_af0e730f7cb25c8c92fac5ae406fe277` FOREIGN KEY (`UserId`) REFERENCES `H_AAA_Synced_UserInfo` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SequelizeMeta`
--

DROP TABLE IF EXISTS `SequelizeMeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `Test_Hamid`
--

DROP TABLE IF EXISTS `Test_Hamid`;
/*!50001 DROP VIEW IF EXISTS `Test_Hamid`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Test_Hamid` AS SELECT 
 1 AS `Id`,
 1 AS `Firstname_fsx`,
 1 AS `Lastname_fsx`,
 1 AS `Username`,
 1 AS `Email_fsx`,
 1 AS `EmailConfirmed`,
 1 AS `CellPhone_fsx`,
 1 AS `CellPhoneConfirmed`,
 1 AS `IssuedBy`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_BK_AAA_AllowedActPermissions`
--

DROP TABLE IF EXISTS `Vi_BK_AAA_AllowedActPermissions`;
/*!50001 DROP VIEW IF EXISTS `Vi_BK_AAA_AllowedActPermissions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_BK_AAA_AllowedActPermissions` AS SELECT 
 1 AS `Id`,
 1 AS `ActENUM`,
 1 AS `PermissionId`,
 1 AS `Title`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_BK_AAA_AppPermissionCheck`
--

DROP TABLE IF EXISTS `Vi_BK_AAA_AppPermissionCheck`;
/*!50001 DROP VIEW IF EXISTS `Vi_BK_AAA_AppPermissionCheck`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_BK_AAA_AppPermissionCheck` AS SELECT 
 1 AS `Id`,
 1 AS `AppTypeId`,
 1 AS `AppPermissionId`,
 1 AS `CodeUri`,
 1 AS `Signature`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_BK_AAA_ScenarioDetails`
--

DROP TABLE IF EXISTS `Vi_BK_AAA_ScenarioDetails`;
/*!50001 DROP VIEW IF EXISTS `Vi_BK_AAA_ScenarioDetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_BK_AAA_ScenarioDetails` AS SELECT 
 1 AS `Id`,
 1 AS `ScenarioId`,
 1 AS `EntityId`,
 1 AS `AuthorityEntityId`,
 1 AS `ActENUM`,
 1 AS `ActivityClassENUM`,
 1 AS `Description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_BK_AAA_UserEntityProfileCheck`
--

DROP TABLE IF EXISTS `Vi_BK_AAA_UserEntityProfileCheck`;
/*!50001 DROP VIEW IF EXISTS `Vi_BK_AAA_UserEntityProfileCheck`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_BK_AAA_UserEntityProfileCheck` AS SELECT 
 1 AS `Id`,
 1 AS `EntityId`,
 1 AS `EntityTitle`,
 1 AS `UserId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_BK_AAA_UserEntityRoleCheck`
--

DROP TABLE IF EXISTS `Vi_BK_AAA_UserEntityRoleCheck`;
/*!50001 DROP VIEW IF EXISTS `Vi_BK_AAA_UserEntityRoleCheck`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_BK_AAA_UserEntityRoleCheck` AS SELECT 
 1 AS `Id`,
 1 AS `UserId`,
 1 AS `RoleId`,
 1 AS `EntityId`,
 1 AS `ActEnum`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_BK_AAA_UserPermissionCheck`
--

DROP TABLE IF EXISTS `Vi_BK_AAA_UserPermissionCheck`;
/*!50001 DROP VIEW IF EXISTS `Vi_BK_AAA_UserPermissionCheck`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_BK_AAA_UserPermissionCheck` AS SELECT 
 1 AS `Id`,
 1 AS `UserId`,
 1 AS `RoleId`,
 1 AS `EntityId`,
 1 AS `PermittedAct`,
 1 AS `PermissionId`,
 1 AS `CodeUri`,
 1 AS `Signature`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_AppClient`
--

DROP TABLE IF EXISTS `Vi_DPA_AppClient`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_AppClient`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_AppClient` AS SELECT 
 1 AS `Id`,
 1 AS `Title`,
 1 AS `ClientId`,
 1 AS `ClientSecret`,
 1 AS `AppTypeId`,
 1 AS `IsInactive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_AppClientSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_AppClientSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_AppClientSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_AppClientSummary` AS SELECT 
 1 AS `Id`,
 1 AS `Title`,
 1 AS `ClientId`,
 1 AS `ClientSecret`,
 1 AS `AppTypeId`,
 1 AS `IsInactive`,
 1 AS `UserAppSettingsCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_AppClientsDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_AppClientsDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_AppClientsDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_AppClientsDetail` AS SELECT 
 1 AS `AppTypeId`,
 1 AS `AppTypeCode`,
 1 AS `AppTypeTitle`,
 1 AS `Title`,
 1 AS `ClientId`,
 1 AS `ClientSecret`,
 1 AS `IsInactive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_AppPermission`
--

DROP TABLE IF EXISTS `Vi_DPA_AppPermission`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_AppPermission`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_AppPermission` AS SELECT 
 1 AS `Id`,
 1 AS `Title`,
 1 AS `CodeUri`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_AppPermissionSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_AppPermissionSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_AppPermissionSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_AppPermissionSummary` AS SELECT 
 1 AS `Id`,
 1 AS `Title`,
 1 AS `CodeUri`,
 1 AS `AppTypePermissionsCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_AppType`
--

DROP TABLE IF EXISTS `Vi_DPA_AppType`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_AppType`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_AppType` AS SELECT 
 1 AS `Id`,
 1 AS `Code`,
 1 AS `Title`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_AppTypePermissionsSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_AppTypePermissionsSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_AppTypePermissionsSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_AppTypePermissionsSuperDetail` AS SELECT 
 1 AS `AppPermissionId`,
 1 AS `AppPermissionTitle`,
 1 AS `AppPermissionCodeUri`,
 1 AS `AppTypeId`,
 1 AS `AppTypeCode`,
 1 AS `AppTypeTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_AppTypeSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_AppTypeSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_AppTypeSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_AppTypeSummary` AS SELECT 
 1 AS `Id`,
 1 AS `Code`,
 1 AS `Title`,
 1 AS `AppClientsCount`,
 1 AS `PermissionsCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_EntityRole`
--

DROP TABLE IF EXISTS `Vi_DPA_EntityRole`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_EntityRole`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_EntityRole` AS SELECT 
 1 AS `Id`,
 1 AS `Title`,
 1 AS `EntityId`,
 1 AS `ActENUM`,
 1 AS `IsDefault`,
 1 AS `EntityTitle`,
 1 AS `EntityAddress_fsx`,
 1 AS `EntityCity`,
 1 AS `EntityProvince`,
 1 AS `EntityCountry`,
 1 AS `EntityPostalCode_fsx`,
 1 AS `EntityPhone_fsx`,
 1 AS `EntityFaxNumber_fsx`,
 1 AS `EntityEmail_fsx`,
 1 AS `EntityDiscriminator`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_EntityRolePermissionsSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_EntityRolePermissionsSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_EntityRolePermissionsSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_EntityRolePermissionsSuperDetail` AS SELECT 
 1 AS `EntityRoleId`,
 1 AS `EntityRoleTitle`,
 1 AS `EntityRoleEntityId`,
 1 AS `EntityRoleActENUM`,
 1 AS `EntityRoleIsDefault`,
 1 AS `EntityRoleEntityTitle`,
 1 AS `EntityRoleEntityAddress_fsx`,
 1 AS `EntityRoleEntityCity`,
 1 AS `EntityRoleEntityProvince`,
 1 AS `EntityRoleEntityCountry`,
 1 AS `EntityRoleEntityPostalCode_fsx`,
 1 AS `EntityRoleEntityPhone_fsx`,
 1 AS `EntityRoleEntityFaxNumber_fsx`,
 1 AS `EntityRoleEntityEmail_fsx`,
 1 AS `EntityRoleEntityDiscriminator`,
 1 AS `PermissionId`,
 1 AS `PermissionTitle`,
 1 AS `PermissionCodeUri`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_EntityRoleSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_EntityRoleSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_EntityRoleSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_EntityRoleSummary` AS SELECT 
 1 AS `Id`,
 1 AS `Title`,
 1 AS `EntityId`,
 1 AS `ActENUM`,
 1 AS `IsDefault`,
 1 AS `EntityTitle`,
 1 AS `EntityAddress_fsx`,
 1 AS `EntityCity`,
 1 AS `EntityProvince`,
 1 AS `EntityCountry`,
 1 AS `EntityPostalCode_fsx`,
 1 AS `EntityPhone_fsx`,
 1 AS `EntityFaxNumber_fsx`,
 1 AS `EntityEmail_fsx`,
 1 AS `EntityDiscriminator`,
 1 AS `PermissionsCount`,
 1 AS `UsersCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_EntityRolesDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_EntityRolesDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_EntityRolesDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_EntityRolesDetail` AS SELECT 
 1 AS `EntityScenarioId`,
 1 AS `EntityScenarioEntityId`,
 1 AS `EntityScenarioPermittedActENUM`,
 1 AS `EntityScenarioScenarioId`,
 1 AS `EntityScenarioEntityTitle`,
 1 AS `EntityScenarioEntityAddress_fsx`,
 1 AS `EntityScenarioEntityCity`,
 1 AS `EntityScenarioEntityProvince`,
 1 AS `EntityScenarioEntityCountry`,
 1 AS `EntityScenarioEntityPostalCode_fsx`,
 1 AS `EntityScenarioEntityPhone_fsx`,
 1 AS `EntityScenarioEntityFaxNumber_fsx`,
 1 AS `EntityScenarioEntityEmail_fsx`,
 1 AS `EntityScenarioEntityDiscriminator`,
 1 AS `Title`,
 1 AS `EntityId`,
 1 AS `IsDefault`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_EntityScenario`
--

DROP TABLE IF EXISTS `Vi_DPA_EntityScenario`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_EntityScenario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_EntityScenario` AS SELECT 
 1 AS `Id`,
 1 AS `EntityId`,
 1 AS `PermittedActENUM`,
 1 AS `ScenarioId`,
 1 AS `EntityTitle`,
 1 AS `EntityAddress_fsx`,
 1 AS `EntityCity`,
 1 AS `EntityProvince`,
 1 AS `EntityCountry`,
 1 AS `EntityPostalCode_fsx`,
 1 AS `EntityPhone_fsx`,
 1 AS `EntityFaxNumber_fsx`,
 1 AS `EntityEmail_fsx`,
 1 AS `EntityDiscriminator`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_EntityScenarioSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_EntityScenarioSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_EntityScenarioSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_EntityScenarioSummary` AS SELECT 
 1 AS `Id`,
 1 AS `EntityId`,
 1 AS `PermittedActENUM`,
 1 AS `ScenarioId`,
 1 AS `EntityTitle`,
 1 AS `EntityAddress_fsx`,
 1 AS `EntityCity`,
 1 AS `EntityProvince`,
 1 AS `EntityCountry`,
 1 AS `EntityPostalCode_fsx`,
 1 AS `EntityPhone_fsx`,
 1 AS `EntityFaxNumber_fsx`,
 1 AS `EntityEmail_fsx`,
 1 AS `EntityDiscriminator`,
 1 AS `EntityRolesCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_EntityScenariosSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_EntityScenariosSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_EntityScenariosSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_EntityScenariosSuperDetail` AS SELECT 
 1 AS `ScenarioId`,
 1 AS `ScenarioDescription`,
 1 AS `ScenarioActivityClassENUM`,
 1 AS `ScenarioClientEntityId`,
 1 AS `ScenarioEntityTitle`,
 1 AS `ScenarioEntityAddress_fsx`,
 1 AS `ScenarioEntityCity`,
 1 AS `ScenarioEntityProvince`,
 1 AS `ScenarioEntityCountry`,
 1 AS `ScenarioEntityPostalCode_fsx`,
 1 AS `ScenarioEntityPhone_fsx`,
 1 AS `ScenarioEntityFaxNumber_fsx`,
 1 AS `ScenarioEntityEmail_fsx`,
 1 AS `ScenarioEntityDiscriminator`,
 1 AS `EntityId`,
 1 AS `PermittedActENUM`,
 1 AS `EntityProfileTitle`,
 1 AS `EntityProfileAddress_fsx`,
 1 AS `EntityProfileCity`,
 1 AS `EntityProfileProvince`,
 1 AS `EntityProfileCountry`,
 1 AS `EntityProfilePostalCode_fsx`,
 1 AS `EntityProfilePhone_fsx`,
 1 AS `EntityProfileFaxNumber_fsx`,
 1 AS `EntityProfileEmail_fsx`,
 1 AS `EntityProfileDiscriminator`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_NotificationQueuesSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_NotificationQueuesSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_NotificationQueuesSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_NotificationQueuesSuperDetail` AS SELECT 
 1 AS `NotificationRequestId`,
 1 AS `NotificationRequestHasRule`,
 1 AS `NotificationRequestUserRecordKey`,
 1 AS `NotificationRequestEntityRecordKey`,
 1 AS `NotificationRequestRuleRecordKey`,
 1 AS `NotificationRequestBody`,
 1 AS `UserId`,
 1 AS `EntityId`,
 1 AS `ChannelType`,
 1 AS `Destination_fsx`,
 1 AS `Status`,
 1 AS `Reason`,
 1 AS `RetryCount`,
 1 AS `BroadcastedAt_UTC`,
 1 AS `UserInfoFirstname_fsx`,
 1 AS `UserInfoLastname_fsx`,
 1 AS `UserInfoUsername`,
 1 AS `UserInfoEmail_fsx`,
 1 AS `UserInfoEmailConfirmed`,
 1 AS `UserInfoCellPhone_fsx`,
 1 AS `UserInfoCellPhoneConfirmed`,
 1 AS `UserInfoIssuedBy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_NotificationRequest`
--

DROP TABLE IF EXISTS `Vi_DPA_NotificationRequest`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_NotificationRequest`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_NotificationRequest` AS SELECT 
 1 AS `Id`,
 1 AS `HasRule`,
 1 AS `UserRecordKey`,
 1 AS `EntityRecordKey`,
 1 AS `RuleRecordKey`,
 1 AS `Body`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_NotificationRequestSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_NotificationRequestSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_NotificationRequestSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_NotificationRequestSummary` AS SELECT 
 1 AS `Id`,
 1 AS `HasRule`,
 1 AS `UserRecordKey`,
 1 AS `EntityRecordKey`,
 1 AS `RuleRecordKey`,
 1 AS `Body`,
 1 AS `NotificationQueueCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_Permission`
--

DROP TABLE IF EXISTS `Vi_DPA_Permission`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_Permission`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_Permission` AS SELECT 
 1 AS `Id`,
 1 AS `Title`,
 1 AS `CodeUri`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_PermissionSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_PermissionSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_PermissionSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_PermissionSummary` AS SELECT 
 1 AS `Id`,
 1 AS `Title`,
 1 AS `CodeUri`,
 1 AS `EntityRolesCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_Scenario`
--

DROP TABLE IF EXISTS `Vi_DPA_Scenario`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_Scenario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_Scenario` AS SELECT 
 1 AS `Id`,
 1 AS `Description`,
 1 AS `ActivityClassENUM`,
 1 AS `ClientEntityId`,
 1 AS `EntityTitle`,
 1 AS `EntityAddress_fsx`,
 1 AS `EntityCity`,
 1 AS `EntityProvince`,
 1 AS `EntityCountry`,
 1 AS `EntityPostalCode_fsx`,
 1 AS `EntityPhone_fsx`,
 1 AS `EntityFaxNumber_fsx`,
 1 AS `EntityEmail_fsx`,
 1 AS `EntityDiscriminator`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_ScenarioSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_ScenarioSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_ScenarioSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_ScenarioSummary` AS SELECT 
 1 AS `Id`,
 1 AS `Description`,
 1 AS `ActivityClassENUM`,
 1 AS `ClientEntityId`,
 1 AS `EntityTitle`,
 1 AS `EntityAddress_fsx`,
 1 AS `EntityCity`,
 1 AS `EntityProvince`,
 1 AS `EntityCountry`,
 1 AS `EntityPostalCode_fsx`,
 1 AS `EntityPhone_fsx`,
 1 AS `EntityFaxNumber_fsx`,
 1 AS `EntityEmail_fsx`,
 1 AS `EntityDiscriminator`,
 1 AS `EntitysCount`,
 1 AS `DataMapCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_UserAppSettingsSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_UserAppSettingsSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_UserAppSettingsSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_UserAppSettingsSuperDetail` AS SELECT 
 1 AS `AppClientId`,
 1 AS `AppClientTitle`,
 1 AS `AppClientClientId`,
 1 AS `AppClientClientSecret`,
 1 AS `AppClientAppTypeId`,
 1 AS `AppClientIsInactive`,
 1 AS `UserId`,
 1 AS `Setting_fsx`,
 1 AS `UserInfoFirstname_fsx`,
 1 AS `UserInfoLastname_fsx`,
 1 AS `UserInfoUsername`,
 1 AS `UserInfoEmail_fsx`,
 1 AS `UserInfoEmailConfirmed`,
 1 AS `UserInfoCellPhone_fsx`,
 1 AS `UserInfoCellPhoneConfirmed`,
 1 AS `UserInfoIssuedBy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_UserEntityRolesSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_UserEntityRolesSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_UserEntityRolesSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_UserEntityRolesSuperDetail` AS SELECT 
 1 AS `EntityRoleId`,
 1 AS `EntityRoleTitle`,
 1 AS `EntityRoleEntityId`,
 1 AS `EntityRoleActENUM`,
 1 AS `EntityRoleIsDefault`,
 1 AS `EntityRoleEntityTitle`,
 1 AS `EntityRoleEntityAddress_fsx`,
 1 AS `EntityRoleEntityCity`,
 1 AS `EntityRoleEntityProvince`,
 1 AS `EntityRoleEntityCountry`,
 1 AS `EntityRoleEntityPostalCode_fsx`,
 1 AS `EntityRoleEntityPhone_fsx`,
 1 AS `EntityRoleEntityFaxNumber_fsx`,
 1 AS `EntityRoleEntityEmail_fsx`,
 1 AS `EntityRoleEntityDiscriminator`,
 1 AS `UserId`,
 1 AS `UserInfoFirstname_fsx`,
 1 AS `UserInfoLastname_fsx`,
 1 AS `UserInfoUsername`,
 1 AS `UserInfoEmail_fsx`,
 1 AS `UserInfoEmailConfirmed`,
 1 AS `UserInfoCellPhone_fsx`,
 1 AS `UserInfoCellPhoneConfirmed`,
 1 AS `UserInfoIssuedBy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_AAA_RolePermissionDetail`
--

DROP TABLE IF EXISTS `Vi_DPC_AAA_RolePermissionDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_AAA_RolePermissionDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_AAA_RolePermissionDetail` AS SELECT 
 1 AS `RoleId`,
 1 AS `HasPermission`,
 1 AS `ActENUM`,
 1 AS `PermissionId`,
 1 AS `Title`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_ENUM_ComponentType`
--

DROP TABLE IF EXISTS `Vi_DPC_ENUM_ComponentType`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_ENUM_ComponentType`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_ENUM_ComponentType` AS SELECT 
 1 AS `id`,
 1 AS `title`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_InAppNotifications`
--

DROP TABLE IF EXISTS `Vi_DPC_InAppNotifications`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_InAppNotifications`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_InAppNotifications` AS SELECT 
 1 AS `Id`,
 1 AS `UserId`,
 1 AS `EntityId`,
 1 AS `UserRecordKey`,
 1 AS `EntityRecordKey`,
 1 AS `Status`,
 1 AS `Body`,
 1 AS `Text`,
 1 AS `Subject`,
 1 AS `BroadcastedAt_UTC`,
 1 AS `CreatedAt_UTC`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_UserNotificationSettingsWithUserRecordKey`
--

DROP TABLE IF EXISTS `Vi_DPC_UserNotificationSettingsWithUserRecordKey`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_UserNotificationSettingsWithUserRecordKey`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_UserNotificationSettingsWithUserRecordKey` AS SELECT 
 1 AS `Id`,
 1 AS `UserId`,
 1 AS `IsEnabledInApp`,
 1 AS `IsEnabledEmail`,
 1 AS `IsEnabledSMS`,
 1 AS `IsEnabledPhone`,
 1 AS `IsEnabledWhatsApp`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `UserRecordKey`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DP_ENUM_ComponentType`
--

DROP TABLE IF EXISTS `Vi_DP_ENUM_ComponentType`;
/*!50001 DROP VIEW IF EXISTS `Vi_DP_ENUM_ComponentType`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DP_ENUM_ComponentType` AS SELECT 
 1 AS `id`,
 1 AS `title`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `H_AAA_EntityProfile`
--

/*!50001 DROP VIEW IF EXISTS `H_AAA_EntityProfile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `H_AAA_EntityProfile` AS select `H_AAA_Synced_EntityProfile`.`Id` AS `Id`,`H_AAA_Synced_EntityProfile`.`PartyCode` AS `PartyCode`,`H_AAA_Synced_EntityProfile`.`Title` AS `Title`,`H_AAA_Synced_EntityProfile`.`Address_fsx` AS `Address_fsx`,`H_AAA_Synced_EntityProfile`.`City` AS `City`,`H_AAA_Synced_EntityProfile`.`Province` AS `Province`,`H_AAA_Synced_EntityProfile`.`Country` AS `Country`,`H_AAA_Synced_EntityProfile`.`PostalCode_fsx` AS `PostalCode_fsx`,`H_AAA_Synced_EntityProfile`.`Phone_fsx` AS `Phone_fsx`,`H_AAA_Synced_EntityProfile`.`FaxNumber_fsx` AS `FaxNumber_fsx`,`H_AAA_Synced_EntityProfile`.`Email_fsx` AS `Email_fsx`,`H_AAA_Synced_EntityProfile`.`Discriminator` AS `Discriminator`,`H_AAA_Synced_EntityProfile`.`RecordKey` AS `RecordKey`,`H_AAA_Synced_EntityProfile`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`H_AAA_Synced_EntityProfile`.`CreatedBy` AS `CreatedBy`,`H_AAA_Synced_EntityProfile`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`H_AAA_Synced_EntityProfile`.`ModifiedBy` AS `ModifiedBy`,`H_AAA_Synced_EntityProfile`.`RecordDeleted` AS `RecordDeleted` from `H_AAA_Synced_EntityProfile` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Test_Hamid`
--

/*!50001 DROP VIEW IF EXISTS `Test_Hamid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Test_Hamid` AS select `H_AAA_Synced_UserInfo`.`Id` AS `Id`,`H_AAA_Synced_UserInfo`.`Firstname_fsx` AS `Firstname_fsx`,`H_AAA_Synced_UserInfo`.`Lastname_fsx` AS `Lastname_fsx`,`H_AAA_Synced_UserInfo`.`Username` AS `Username`,`H_AAA_Synced_UserInfo`.`Email_fsx` AS `Email_fsx`,`H_AAA_Synced_UserInfo`.`EmailConfirmed` AS `EmailConfirmed`,`H_AAA_Synced_UserInfo`.`CellPhone_fsx` AS `CellPhone_fsx`,`H_AAA_Synced_UserInfo`.`CellPhoneConfirmed` AS `CellPhoneConfirmed`,`H_AAA_Synced_UserInfo`.`IssuedBy` AS `IssuedBy`,`H_AAA_Synced_UserInfo`.`RecordKey` AS `RecordKey`,`H_AAA_Synced_UserInfo`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`H_AAA_Synced_UserInfo`.`CreatedBy` AS `CreatedBy`,`H_AAA_Synced_UserInfo`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`H_AAA_Synced_UserInfo`.`ModifiedBy` AS `ModifiedBy`,`H_AAA_Synced_UserInfo`.`RecordDeleted` AS `RecordDeleted` from `H_AAA_Synced_UserInfo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_BK_AAA_AllowedActPermissions`
--

/*!50001 DROP VIEW IF EXISTS `Vi_BK_AAA_AllowedActPermissions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_BK_AAA_AllowedActPermissions` AS select `ERP`.`Id` AS `Id`,`ER`.`ActENUM` AS `ActENUM`,`ERP`.`PermissionId` AS `PermissionId`,`P`.`Title` AS `Title` from ((`H_AAA_EntityRoles` `ER` join `H_AAA_EntityRolePermissions` `ERP` on(((`ERP`.`RoleId` = `ER`.`Id`) and (`ER`.`IsDefault` = 0)))) join `H_AAA_Permissions` `P` on((`P`.`Id` = `ERP`.`PermissionId`))) where (((0 <> `ER`.`RecordDeleted`) is not true) and ((0 <> `ERP`.`RecordDeleted`) is not true) and ((0 <> `P`.`RecordDeleted`) is not true)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_BK_AAA_AppPermissionCheck`
--

/*!50001 DROP VIEW IF EXISTS `Vi_BK_AAA_AppPermissionCheck`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_BK_AAA_AppPermissionCheck` AS select `ATP`.`Id` AS `Id`,`AT`.`Id` AS `AppTypeId`,`AP`.`Id` AS `AppPermissionId`,`AP`.`CodeUri` AS `CodeUri`,`ATP`.`Signature` AS `Signature` from ((`H_AAA_AppTypePermissions` `ATP` join `H_AAA_AppTypes` `AT` on((`ATP`.`AppTypeId` = `AT`.`Id`))) join `H_AAA_AppPermissions` `AP` on((`ATP`.`AppPermissionId` = `AP`.`Id`))) where (((0 <> `AT`.`RecordDeleted`) is not true) and ((0 <> `AP`.`RecordDeleted`) is not true) and ((0 <> `ATP`.`RecordDeleted`) is not true)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_BK_AAA_ScenarioDetails`
--

/*!50001 DROP VIEW IF EXISTS `Vi_BK_AAA_ScenarioDetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_BK_AAA_ScenarioDetails` AS select distinct `_ES`.`ScenarioId` AS `Id`,`_ES`.`ScenarioId` AS `ScenarioId`,`_ES`.`EntityId` AS `EntityId`,`S`.`ClientEntityId` AS `AuthorityEntityId`,`_ES`.`PermittedActENUM` AS `ActENUM`,`S`.`ActivityClassENUM` AS `ActivityClassENUM`,`S`.`Description` AS `Description` from (`H_AAA_EntityScenarios` `_ES` join `H_AAA_Scenarios` `S` on((`_ES`.`ScenarioId` = `S`.`Id`))) where (((0 <> `_ES`.`RecordDeleted`) is not true) and ((0 <> `S`.`RecordDeleted`) is not true)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_BK_AAA_UserEntityProfileCheck`
--

/*!50001 DROP VIEW IF EXISTS `Vi_BK_AAA_UserEntityProfileCheck`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_BK_AAA_UserEntityProfileCheck` AS select distinct `EP`.`Id` AS `Id`,`EP`.`Id` AS `EntityId`,`EP`.`Title` AS `EntityTitle`,`UER`.`UserId` AS `UserId` from ((`H_AAA_UserEntityRoles` `UER` join `H_AAA_EntityRoles` `ER` on((`UER`.`EntityRoleId` = `ER`.`Id`))) join `H_AAA_Synced_EntityProfile` `EP` on((`ER`.`EntityId` = `EP`.`Id`))) where (((0 <> `UER`.`RecordDeleted`) is not true) and ((0 <> `ER`.`RecordDeleted`) is not true)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_BK_AAA_UserEntityRoleCheck`
--

/*!50001 DROP VIEW IF EXISTS `Vi_BK_AAA_UserEntityRoleCheck`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_BK_AAA_UserEntityRoleCheck` AS select distinct `UER`.`UserId` AS `Id`,`UER`.`UserId` AS `UserId`,`ER`.`Id` AS `RoleId`,`ER`.`EntityId` AS `EntityId`,`ER`.`ActENUM` AS `ActEnum` from ((`H_AAA_EntityRolePermissions` `ERP` join `H_AAA_EntityRoles` `ER` on((`ERP`.`RoleId` = `ER`.`Id`))) join `H_AAA_UserEntityRoles` `UER` on((`ERP`.`RoleId` = `UER`.`EntityRoleId`))) where (((0 <> `ERP`.`RecordDeleted`) is not true) and ((0 <> `ER`.`RecordDeleted`) is not true) and ((0 <> `UER`.`RecordDeleted`) is not true)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_BK_AAA_UserPermissionCheck`
--

/*!50001 DROP VIEW IF EXISTS `Vi_BK_AAA_UserPermissionCheck`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_BK_AAA_UserPermissionCheck` AS select `ERP`.`Id` AS `Id`,`UER`.`UserId` AS `UserId`,`ERP`.`RoleId` AS `RoleId`,`ER`.`EntityId` AS `EntityId`,`ER`.`ActENUM` AS `PermittedAct`,`P`.`Id` AS `PermissionId`,`P`.`CodeUri` AS `CodeUri`,`ERP`.`Signature` AS `Signature` from (((`H_AAA_EntityRolePermissions` `ERP` join `H_AAA_EntityRoles` `ER` on((`ERP`.`RoleId` = `ER`.`Id`))) join `H_AAA_Permissions` `P` on((`ERP`.`PermissionId` = `P`.`Id`))) join `H_AAA_UserEntityRoles` `UER` on((`ERP`.`RoleId` = `UER`.`EntityRoleId`))) where (((0 <> `ERP`.`RecordDeleted`) is not true) and ((0 <> `ER`.`RecordDeleted`) is not true) and ((0 <> `P`.`RecordDeleted`) is not true) and ((0 <> `UER`.`RecordDeleted`) is not true) and (`ER`.`IsDefault` = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_AppClient`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_AppClient`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_AppClient` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`ClientId` AS `ClientId`,`BaseTable`.`ClientSecret` AS `ClientSecret`,`BaseTable`.`AppTypeId` AS `AppTypeId`,`BaseTable`.`IsInactive` AS `IsInactive` from `H_AAA_AppClients` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_AppClientSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_AppClientSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_AppClientSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`ClientId` AS `ClientId`,`BaseTable`.`ClientSecret` AS `ClientSecret`,`BaseTable`.`AppTypeId` AS `AppTypeId`,`BaseTable`.`IsInactive` AS `IsInactive`,`TempQuery0`.`RelatedEntityCount` AS `UserAppSettingsCount` from (`H_AAA_AppClients` `BaseTable` left join (select `RT0`.`AppClientId` AS `AppClientId`,count(`RT0`.`AppClientId`) AS `RelatedEntityCount` from `H_AAA_UserAppSettings` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`AppClientId`) `TempQuery0` on((`TempQuery0`.`AppClientId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_AppClientsDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_AppClientsDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_AppClientsDetail` AS select `BaseTable`.`Id` AS `AppTypeId`,`BaseTable`.`Code` AS `AppTypeCode`,`BaseTable`.`Title` AS `AppTypeTitle`,`RJT`.`Title` AS `Title`,`RJT`.`ClientId` AS `ClientId`,`RJT`.`ClientSecret` AS `ClientSecret`,`RJT`.`IsInactive` AS `IsInactive` from (`H_AAA_AppTypes` `BaseTable` join `H_AAA_AppClients` `RJT` on(((`RJT`.`AppTypeId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_AppPermission`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_AppPermission`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_AppPermission` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`CodeUri` AS `CodeUri` from `H_AAA_AppPermissions` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_AppPermissionSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_AppPermissionSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_AppPermissionSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`CodeUri` AS `CodeUri`,`TempQuery0`.`RelatedEntityCount` AS `AppTypePermissionsCount` from (`H_AAA_AppPermissions` `BaseTable` left join (select `RT0`.`AppPermissionId` AS `AppPermissionId`,count(`RT0`.`AppPermissionId`) AS `RelatedEntityCount` from `H_AAA_AppTypePermissions` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`AppPermissionId`) `TempQuery0` on((`TempQuery0`.`AppPermissionId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_AppType`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_AppType`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_AppType` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Code` AS `Code`,`BaseTable`.`Title` AS `Title` from `H_AAA_AppTypes` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_AppTypePermissionsSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_AppTypePermissionsSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_AppTypePermissionsSuperDetail` AS select `BaseTable`.`Id` AS `AppPermissionId`,`BaseTable`.`Title` AS `AppPermissionTitle`,`BaseTable`.`CodeUri` AS `AppPermissionCodeUri`,`RJT`.`AppTypeId` AS `AppTypeId`,`PJT0`.`Code` AS `AppTypeCode`,`PJT0`.`Title` AS `AppTypeTitle` from ((`H_AAA_AppPermissions` `BaseTable` join `H_AAA_AppTypePermissions` `RJT` on(((`RJT`.`AppPermissionId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_AAA_AppTypes` `PJT0` on(((`RJT`.`AppTypeId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_AppTypeSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_AppTypeSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_AppTypeSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Code` AS `Code`,`BaseTable`.`Title` AS `Title`,`TempQuery0`.`RelatedEntityCount` AS `AppClientsCount`,`TempQuery1`.`RelatedEntityCount` AS `PermissionsCount` from ((`H_AAA_AppTypes` `BaseTable` left join (select `RT0`.`AppTypeId` AS `AppTypeId`,count(`RT0`.`AppTypeId`) AS `RelatedEntityCount` from `H_AAA_AppClients` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`AppTypeId`) `TempQuery0` on((`TempQuery0`.`AppTypeId` = `BaseTable`.`Id`))) left join (select `RT1`.`AppTypeId` AS `AppTypeId`,count(`RT1`.`AppTypeId`) AS `RelatedEntityCount` from `H_AAA_AppTypePermissions` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`AppTypeId`) `TempQuery1` on((`TempQuery1`.`AppTypeId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_EntityRole`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_EntityRole`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_EntityRole` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`EntityId` AS `EntityId`,`BaseTable`.`ActENUM` AS `ActENUM`,`BaseTable`.`IsDefault` AS `IsDefault`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator` from (`H_AAA_EntityRoles` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) where (((0 <> `BaseTable`.`RecordDeleted`) is not true) and ((0 <> `BaseTable`.`IsDefault`) is not true)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_EntityRolePermissionsSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_EntityRolePermissionsSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_EntityRolePermissionsSuperDetail` AS select `BaseTable`.`Id` AS `EntityRoleId`,`BaseTable`.`Title` AS `EntityRoleTitle`,`BaseTable`.`EntityId` AS `EntityRoleEntityId`,`BaseTable`.`ActENUM` AS `EntityRoleActENUM`,`BaseTable`.`IsDefault` AS `EntityRoleIsDefault`,`AP`.`Title` AS `EntityRoleEntityTitle`,`AP`.`Address_fsx` AS `EntityRoleEntityAddress_fsx`,`AP`.`City` AS `EntityRoleEntityCity`,`AP`.`Province` AS `EntityRoleEntityProvince`,`AP`.`Country` AS `EntityRoleEntityCountry`,`AP`.`PostalCode_fsx` AS `EntityRoleEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityRoleEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityRoleEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityRoleEntityEmail_fsx`,`AP`.`Discriminator` AS `EntityRoleEntityDiscriminator`,`RJT`.`PermissionId` AS `PermissionId`,`PJT0`.`Title` AS `PermissionTitle`,`PJT0`.`CodeUri` AS `PermissionCodeUri` from (((`H_AAA_EntityRoles` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_AAA_EntityRolePermissions` `RJT` on(((`RJT`.`RoleId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_AAA_Permissions` `PJT0` on(((`RJT`.`PermissionId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where (((0 <> `BaseTable`.`RecordDeleted`) is not true) and ((0 <> `BaseTable`.`IsDefault`) is not true)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_EntityRoleSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_EntityRoleSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_EntityRoleSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`EntityId` AS `EntityId`,`BaseTable`.`ActENUM` AS `ActENUM`,`BaseTable`.`IsDefault` AS `IsDefault`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator`,`TempQuery0`.`RelatedEntityCount` AS `PermissionsCount`,`TempQuery2`.`RelatedEntityCount` AS `UsersCount` from (((`H_AAA_EntityRoles` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) left join (select `RT0`.`RoleId` AS `RoleId`,count(`RT0`.`RoleId`) AS `RelatedEntityCount` from `H_AAA_EntityRolePermissions` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`RoleId`) `TempQuery0` on((`TempQuery0`.`RoleId` = `BaseTable`.`Id`))) left join (select `RT2`.`EntityRoleId` AS `EntityRoleId`,count(`RT2`.`EntityRoleId`) AS `RelatedEntityCount` from `H_AAA_UserEntityRoles` `RT2` where ((0 <> `RT2`.`RecordDeleted`) is not true) group by `RT2`.`EntityRoleId`) `TempQuery2` on((`TempQuery2`.`EntityRoleId` = `BaseTable`.`Id`))) where (((0 <> `BaseTable`.`RecordDeleted`) is not true) and ((0 <> `BaseTable`.`IsDefault`) is not true)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_EntityRolesDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_EntityRolesDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_EntityRolesDetail` AS select `BaseTable`.`Id` AS `EntityScenarioId`,`BaseTable`.`EntityId` AS `EntityScenarioEntityId`,`BaseTable`.`PermittedActENUM` AS `EntityScenarioPermittedActENUM`,`BaseTable`.`ScenarioId` AS `EntityScenarioScenarioId`,`AP`.`Title` AS `EntityScenarioEntityTitle`,`AP`.`Address_fsx` AS `EntityScenarioEntityAddress_fsx`,`AP`.`City` AS `EntityScenarioEntityCity`,`AP`.`Province` AS `EntityScenarioEntityProvince`,`AP`.`Country` AS `EntityScenarioEntityCountry`,`AP`.`PostalCode_fsx` AS `EntityScenarioEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityScenarioEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityScenarioEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityScenarioEntityEmail_fsx`,`AP`.`Discriminator` AS `EntityScenarioEntityDiscriminator`,`RJT`.`Title` AS `Title`,`RJT`.`EntityId` AS `EntityId`,`RJT`.`IsDefault` AS `IsDefault` from ((`H_AAA_EntityScenarios` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_AAA_EntityRoles` `RJT` on(((`RJT`.`ActENUM` = `BaseTable`.`PermittedActENUM`) and ((0 <> `RJT`.`RecordDeleted`) is not true) and ((0 <> `RJT`.`IsDefault`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_EntityScenario`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_EntityScenario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_EntityScenario` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`EntityId` AS `EntityId`,`BaseTable`.`PermittedActENUM` AS `PermittedActENUM`,`BaseTable`.`ScenarioId` AS `ScenarioId`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator` from (`H_AAA_EntityScenarios` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_EntityScenarioSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_EntityScenarioSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_EntityScenarioSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`EntityId` AS `EntityId`,`BaseTable`.`PermittedActENUM` AS `PermittedActENUM`,`BaseTable`.`ScenarioId` AS `ScenarioId`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator`,`TempQuery0`.`RelatedEntityCount` AS `EntityRolesCount` from ((`H_AAA_EntityScenarios` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) left join (select `RT0`.`ActENUM` AS `ActENUM`,count(`RT0`.`ActENUM`) AS `RelatedEntityCount` from `H_AAA_EntityRoles` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`ActENUM`) `TempQuery0` on((`TempQuery0`.`ActENUM` = `BaseTable`.`PermittedActENUM`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_EntityScenariosSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_EntityScenariosSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_EntityScenariosSuperDetail` AS select `BaseTable`.`Id` AS `ScenarioId`,`BaseTable`.`Description` AS `ScenarioDescription`,`BaseTable`.`ActivityClassENUM` AS `ScenarioActivityClassENUM`,`BaseTable`.`ClientEntityId` AS `ScenarioClientEntityId`,`AP`.`Title` AS `ScenarioEntityTitle`,`AP`.`Address_fsx` AS `ScenarioEntityAddress_fsx`,`AP`.`City` AS `ScenarioEntityCity`,`AP`.`Province` AS `ScenarioEntityProvince`,`AP`.`Country` AS `ScenarioEntityCountry`,`AP`.`PostalCode_fsx` AS `ScenarioEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `ScenarioEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `ScenarioEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `ScenarioEntityEmail_fsx`,`AP`.`Discriminator` AS `ScenarioEntityDiscriminator`,`RJT`.`EntityId` AS `EntityId`,`RJT`.`PermittedActENUM` AS `PermittedActENUM`,`PJT0`.`Title` AS `EntityProfileTitle`,`PJT0`.`Address_fsx` AS `EntityProfileAddress_fsx`,`PJT0`.`City` AS `EntityProfileCity`,`PJT0`.`Province` AS `EntityProfileProvince`,`PJT0`.`Country` AS `EntityProfileCountry`,`PJT0`.`PostalCode_fsx` AS `EntityProfilePostalCode_fsx`,`PJT0`.`Phone_fsx` AS `EntityProfilePhone_fsx`,`PJT0`.`FaxNumber_fsx` AS `EntityProfileFaxNumber_fsx`,`PJT0`.`Email_fsx` AS `EntityProfileEmail_fsx`,`PJT0`.`Discriminator` AS `EntityProfileDiscriminator` from (((`H_AAA_Scenarios` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`ClientEntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_AAA_EntityScenarios` `RJT` on(((`RJT`.`ScenarioId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_EntityProfile` `PJT0` on(((`RJT`.`EntityId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_NotificationQueuesSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_NotificationQueuesSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_NotificationQueuesSuperDetail` AS select `BaseTable`.`Id` AS `NotificationRequestId`,`BaseTable`.`HasRule` AS `NotificationRequestHasRule`,`BaseTable`.`UserRecordKey` AS `NotificationRequestUserRecordKey`,`BaseTable`.`EntityRecordKey` AS `NotificationRequestEntityRecordKey`,`BaseTable`.`RuleRecordKey` AS `NotificationRequestRuleRecordKey`,`BaseTable`.`Body` AS `NotificationRequestBody`,`RJT`.`UserId` AS `UserId`,`RJT`.`EntityId` AS `EntityId`,`RJT`.`ChannelType` AS `ChannelType`,`RJT`.`Destination_fsx` AS `Destination_fsx`,`RJT`.`Status` AS `Status`,`RJT`.`Reason` AS `Reason`,`RJT`.`RetryCount` AS `RetryCount`,`RJT`.`BroadcastedAt_UTC` AS `BroadcastedAt_UTC`,`PJT0`.`Firstname_fsx` AS `UserInfoFirstname_fsx`,`PJT0`.`Lastname_fsx` AS `UserInfoLastname_fsx`,`PJT0`.`Username` AS `UserInfoUsername`,`PJT0`.`Email_fsx` AS `UserInfoEmail_fsx`,`PJT0`.`EmailConfirmed` AS `UserInfoEmailConfirmed`,`PJT0`.`CellPhone_fsx` AS `UserInfoCellPhone_fsx`,`PJT0`.`CellPhoneConfirmed` AS `UserInfoCellPhoneConfirmed`,`PJT0`.`IssuedBy` AS `UserInfoIssuedBy` from ((`H_NotificationRequests` `BaseTable` join `H_NotificationQueue` `RJT` on(((`RJT`.`NotificationRequestId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `PJT0` on(((`RJT`.`UserId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_NotificationRequest`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_NotificationRequest`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_NotificationRequest` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`HasRule` AS `HasRule`,`BaseTable`.`UserRecordKey` AS `UserRecordKey`,`BaseTable`.`EntityRecordKey` AS `EntityRecordKey`,`BaseTable`.`RuleRecordKey` AS `RuleRecordKey`,`BaseTable`.`Body` AS `Body` from `H_NotificationRequests` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_NotificationRequestSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_NotificationRequestSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_NotificationRequestSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`HasRule` AS `HasRule`,`BaseTable`.`UserRecordKey` AS `UserRecordKey`,`BaseTable`.`EntityRecordKey` AS `EntityRecordKey`,`BaseTable`.`RuleRecordKey` AS `RuleRecordKey`,`BaseTable`.`Body` AS `Body`,`TempQuery0`.`RelatedEntityCount` AS `NotificationQueueCount` from (`H_NotificationRequests` `BaseTable` left join (select `RT0`.`NotificationRequestId` AS `NotificationRequestId`,count(`RT0`.`NotificationRequestId`) AS `RelatedEntityCount` from `H_NotificationQueue` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`NotificationRequestId`) `TempQuery0` on((`TempQuery0`.`NotificationRequestId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_Permission`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_Permission`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_Permission` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`CodeUri` AS `CodeUri` from `H_AAA_Permissions` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_PermissionSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_PermissionSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_PermissionSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`CodeUri` AS `CodeUri`,`TempQuery0`.`RelatedEntityCount` AS `EntityRolesCount` from (`H_AAA_Permissions` `BaseTable` left join (select `RT0`.`PermissionId` AS `PermissionId`,count(`RT0`.`PermissionId`) AS `RelatedEntityCount` from `H_AAA_EntityRolePermissions` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`PermissionId`) `TempQuery0` on((`TempQuery0`.`PermissionId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_Scenario`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_Scenario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_Scenario` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Description` AS `Description`,`BaseTable`.`ActivityClassENUM` AS `ActivityClassENUM`,`BaseTable`.`ClientEntityId` AS `ClientEntityId`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator` from (`H_AAA_Scenarios` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`ClientEntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_ScenarioSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_ScenarioSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_ScenarioSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Description` AS `Description`,`BaseTable`.`ActivityClassENUM` AS `ActivityClassENUM`,`BaseTable`.`ClientEntityId` AS `ClientEntityId`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator`,`TempQuery0`.`RelatedEntityCount` AS `EntitysCount`,`TempQuery1`.`RelatedEntityCount` AS `DataMapCount` from (((`H_AAA_Scenarios` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`ClientEntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) left join (select `RT0`.`ScenarioId` AS `ScenarioId`,count(`RT0`.`ScenarioId`) AS `RelatedEntityCount` from `H_AAA_EntityScenarios` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`ScenarioId`) `TempQuery0` on((`TempQuery0`.`ScenarioId` = `BaseTable`.`Id`))) left join (select `RT1`.`ScenarioId` AS `ScenarioId`,count(`RT1`.`ScenarioId`) AS `RelatedEntityCount` from `H_AAA_ScenarioDataMap` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`ScenarioId`) `TempQuery1` on((`TempQuery1`.`ScenarioId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_UserAppSettingsSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_UserAppSettingsSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_UserAppSettingsSuperDetail` AS select `BaseTable`.`Id` AS `AppClientId`,`BaseTable`.`Title` AS `AppClientTitle`,`BaseTable`.`ClientId` AS `AppClientClientId`,`BaseTable`.`ClientSecret` AS `AppClientClientSecret`,`BaseTable`.`AppTypeId` AS `AppClientAppTypeId`,`BaseTable`.`IsInactive` AS `AppClientIsInactive`,`RJT`.`UserId` AS `UserId`,`RJT`.`Setting_fsx` AS `Setting_fsx`,`PJT0`.`Firstname_fsx` AS `UserInfoFirstname_fsx`,`PJT0`.`Lastname_fsx` AS `UserInfoLastname_fsx`,`PJT0`.`Username` AS `UserInfoUsername`,`PJT0`.`Email_fsx` AS `UserInfoEmail_fsx`,`PJT0`.`EmailConfirmed` AS `UserInfoEmailConfirmed`,`PJT0`.`CellPhone_fsx` AS `UserInfoCellPhone_fsx`,`PJT0`.`CellPhoneConfirmed` AS `UserInfoCellPhoneConfirmed`,`PJT0`.`IssuedBy` AS `UserInfoIssuedBy` from ((`H_AAA_AppClients` `BaseTable` join `H_AAA_UserAppSettings` `RJT` on(((`RJT`.`AppClientId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `PJT0` on(((`RJT`.`UserId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_UserEntityRolesSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_UserEntityRolesSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_UserEntityRolesSuperDetail` AS select `BaseTable`.`Id` AS `EntityRoleId`,`BaseTable`.`Title` AS `EntityRoleTitle`,`BaseTable`.`EntityId` AS `EntityRoleEntityId`,`BaseTable`.`ActENUM` AS `EntityRoleActENUM`,`BaseTable`.`IsDefault` AS `EntityRoleIsDefault`,`AP`.`Title` AS `EntityRoleEntityTitle`,`AP`.`Address_fsx` AS `EntityRoleEntityAddress_fsx`,`AP`.`City` AS `EntityRoleEntityCity`,`AP`.`Province` AS `EntityRoleEntityProvince`,`AP`.`Country` AS `EntityRoleEntityCountry`,`AP`.`PostalCode_fsx` AS `EntityRoleEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityRoleEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityRoleEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityRoleEntityEmail_fsx`,`AP`.`Discriminator` AS `EntityRoleEntityDiscriminator`,`RJT`.`UserId` AS `UserId`,`PJT0`.`Firstname_fsx` AS `UserInfoFirstname_fsx`,`PJT0`.`Lastname_fsx` AS `UserInfoLastname_fsx`,`PJT0`.`Username` AS `UserInfoUsername`,`PJT0`.`Email_fsx` AS `UserInfoEmail_fsx`,`PJT0`.`EmailConfirmed` AS `UserInfoEmailConfirmed`,`PJT0`.`CellPhone_fsx` AS `UserInfoCellPhone_fsx`,`PJT0`.`CellPhoneConfirmed` AS `UserInfoCellPhoneConfirmed`,`PJT0`.`IssuedBy` AS `UserInfoIssuedBy` from (((`H_AAA_EntityRoles` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_AAA_UserEntityRoles` `RJT` on(((`RJT`.`EntityRoleId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `PJT0` on(((`RJT`.`UserId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where (((0 <> `BaseTable`.`RecordDeleted`) is not true) and ((0 <> `BaseTable`.`IsDefault`) is not true)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_AAA_RolePermissionDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_AAA_RolePermissionDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_AAA_RolePermissionDetail` AS select `ER`.`Id` AS `RoleId`,(case when ((`ERP`.`PermissionId` is null) or ((0 <> `ERP`.`RecordDeleted`) is true)) then 'No' else 'Yes' end) AS `HasPermission`,`AllP`.`ActENUM` AS `ActENUM`,`AllP`.`PermissionId` AS `PermissionId`,`AllP`.`Title` AS `Title` from ((`Vi_BK_AAA_AllowedActPermissions` `AllP` left join `H_AAA_EntityRoles` `ER` on((`AllP`.`ActENUM` = `ER`.`ActENUM`))) left join `H_AAA_EntityRolePermissions` `ERP` on(((`ERP`.`RoleId` = `ER`.`Id`) and (`ERP`.`PermissionId` = `AllP`.`PermissionId`)))) where (((0 <> `ER`.`IsDefault`) is not true) and ((0 <> `ER`.`RecordDeleted`) is not true)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_ENUM_ComponentType`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_ENUM_ComponentType`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_ENUM_ComponentType` AS select lpad((`Upto100`.`Sequence` - 1),2,'0') AS `id`,replace(substring_index(substring_index(substring_index(trim(trailing ')' from `information_schema`.`columns`.`COLUMN_TYPE`),'(',-(1)),',',`Upto100`.`Sequence`),',',-(1)),'\'','') AS `title` from (`information_schema`.`COLUMNS` `columns` join (select (((`A`.`t` * 10) + `B`.`u`) + 1) AS `Sequence` from ((select 0 AS `t` union select 1 AS `1` union select 2 AS `2` union select 3 AS `3` union select 4 AS `4` union select 5 AS `5` union select 6 AS `6` union select 7 AS `7` union select 8 AS `8` union select 9 AS `9`) `A` join (select 0 AS `u` union select 1 AS `1` union select 2 AS `2` union select 3 AS `3` union select 4 AS `4` union select 5 AS `5` union select 6 AS `6` union select 7 AS `7` union select 8 AS `8` union select 9 AS `9`) `B`) order by `Sequence`) `Upto100` on(((char_length(`information_schema`.`columns`.`COLUMN_TYPE`) - char_length(replace(`information_schema`.`columns`.`COLUMN_TYPE`,',',''))) >= (`Upto100`.`Sequence` - 1)))) where ((`information_schema`.`columns`.`TABLE_NAME` = 'H_DP_ComponentsBases') and (`information_schema`.`columns`.`COLUMN_NAME` = 'Type') and (`information_schema`.`columns`.`TABLE_SCHEMA` = 'HBloxNTF_DEV01')) order by `Upto100`.`Sequence` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_InAppNotifications`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_InAppNotifications`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_InAppNotifications` AS select `NQ`.`Id` AS `Id`,`NQ`.`UserId` AS `UserId`,`NQ`.`EntityId` AS `EntityId`,`UI`.`RecordKey` AS `UserRecordKey`,`EP`.`RecordKey` AS `EntityRecordKey`,`NQ`.`Status` AS `Status`,`NR`.`Body` AS `Body`,json_unquote(json_extract(`NR`.`Body`,'$.text')) AS `Text`,json_unquote(json_extract(`NR`.`Body`,'$.subject')) AS `Subject`,`NQ`.`BroadcastedAt_UTC` AS `BroadcastedAt_UTC`,`NQ`.`CreatedAt_UTC` AS `CreatedAt_UTC` from (((`H_NotificationQueue` `NQ` join `H_NotificationRequests` `NR` on(((`NQ`.`NotificationRequestId` = `NR`.`Id`) and ((0 <> `NR`.`RecordDeleted`) is not true)))) left join `H_AAA_Synced_UserInfo` `UI` on(((`NQ`.`UserId` = `UI`.`Id`) and ((0 <> `UI`.`RecordDeleted`) is not true)))) left join `H_AAA_Synced_EntityProfile` `EP` on(((`NQ`.`EntityId` = `EP`.`Id`) and ((0 <> `EP`.`RecordDeleted`) is not true)))) where ((`NQ`.`ChannelType` = 1) and (`NQ`.`Status` in (3,5)) and ((0 <> `NQ`.`RecordDeleted`) is not true)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_UserNotificationSettingsWithUserRecordKey`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_UserNotificationSettingsWithUserRecordKey`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_UserNotificationSettingsWithUserRecordKey` AS select `UNS`.`Id` AS `Id`,`UNS`.`UserId` AS `UserId`,`UNS`.`IsEnabledInApp` AS `IsEnabledInApp`,`UNS`.`IsEnabledEmail` AS `IsEnabledEmail`,`UNS`.`IsEnabledSMS` AS `IsEnabledSMS`,`UNS`.`IsEnabledPhone` AS `IsEnabledPhone`,`UNS`.`IsEnabledWhatsApp` AS `IsEnabledWhatsApp`,`UNS`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`UNS`.`CreatedBy` AS `CreatedBy`,`UNS`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`UNS`.`ModifiedBy` AS `ModifiedBy`,`UNS`.`RecordDeleted` AS `RecordDeleted`,`UI`.`RecordKey` AS `UserRecordKey` from (`H_UserNotificationSettings` `UNS` join `H_AAA_Synced_UserInfo` `UI` on((`UI`.`Id` = `UNS`.`UserId`))) where (((0 <> `UNS`.`RecordDeleted`) is not true) and ((0 <> `UI`.`RecordDeleted`) is not true)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DP_ENUM_ComponentType`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DP_ENUM_ComponentType`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DP_ENUM_ComponentType` AS select lpad((`Upto100`.`Sequence` - 1),2,'0') AS `id`,replace(substring_index(substring_index(substring_index(trim(trailing ')' from `information_schema`.`columns`.`COLUMN_TYPE`),'(',-(1)),',',`Upto100`.`Sequence`),',',-(1)),'\'','') AS `title` from (`information_schema`.`COLUMNS` `columns` join (select (((`A`.`t` * 10) + `B`.`u`) + 1) AS `Sequence` from ((select 0 AS `t` union select 1 AS `1` union select 2 AS `2` union select 3 AS `3` union select 4 AS `4` union select 5 AS `5` union select 6 AS `6` union select 7 AS `7` union select 8 AS `8` union select 9 AS `9`) `A` join (select 0 AS `u` union select 1 AS `1` union select 2 AS `2` union select 3 AS `3` union select 4 AS `4` union select 5 AS `5` union select 6 AS `6` union select 7 AS `7` union select 8 AS `8` union select 9 AS `9`) `B`) order by `Sequence`) `Upto100` on(((char_length(`information_schema`.`columns`.`COLUMN_TYPE`) - char_length(replace(`information_schema`.`columns`.`COLUMN_TYPE`,',',''))) >= (`Upto100`.`Sequence` - 1)))) where ((`information_schema`.`columns`.`TABLE_NAME` = 'H_DP_ComponentsBases') and (`information_schema`.`columns`.`COLUMN_NAME` = 'Type') and (`information_schema`.`columns`.`TABLE_SCHEMA` = 'HBloxNTF_DEV01')) order by `Upto100`.`Sequence` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-13 13:54:55
