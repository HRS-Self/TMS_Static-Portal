-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 10.166.148.183    Database: HBloxTMSCore_DEV05
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
  `Title` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClientId` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ClientSecret` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=638 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  UNIQUE KEY `unq-typePermission` (`AppTypeId`,`AppPermissionId`),
  KEY `idx_22e410e836875a66b482ca0fd94fcf54` (`AppPermissionId`),
  KEY `idx_b9ba5fb6caec5aeca348230a2bed78b8` (`AppTypeId`),
  CONSTRAINT `fk_87f3ca6afb7d5c9789a936b11c7b04e8` FOREIGN KEY (`AppTypeId`) REFERENCES `H_AAA_AppTypes` (`Id`),
  CONSTRAINT `fk_b56c7a1056d85043b43d37bf24130421` FOREIGN KEY (`AppPermissionId`) REFERENCES `H_AAA_AppPermissions` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=662 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=5256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `IsDefault` tinyint DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_cf754bf622395e7e9b68d1c10a975635` (`ActENUM`),
  KEY `idx_de5c092884f152cbaf5bbfadbd0fb67e` (`EntityId`,`ActENUM`),
  CONSTRAINT `fk_516314666c0b5b79b5e3a92b1f7987fe` FOREIGN KEY (`ActENUM`) REFERENCES `H_AAA_EntityScenarios` (`PermittedActENUM`),
  CONSTRAINT `fk_820741232917505e9eaf61cff911d85a` FOREIGN KEY (`EntityId`) REFERENCES `H_AAA_EntityScenarios` (`EntityId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  KEY `idx_e83826bc318f5a239e63f7ab42691145` (`Id`,`EntityId`),
  CONSTRAINT `fk_34532e3c334f527487d3f59493f89962` FOREIGN KEY (`ScenarioId`) REFERENCES `H_AAA_Scenarios` (`Id`),
  CONSTRAINT `fk_7baae7efd65c5c52ae2f0fd55cca9637` FOREIGN KEY (`EntityId`) REFERENCES `H_AAA_Synced_EntityProfile` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=582 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  KEY `idx_3e967e16ee1c5d79a53ef4995f33badc` (`JoinerActENUM`),
  KEY `idx_75b8d33fa3295c04b9bc0a8497435b18` (`TargetActENUM`),
  KEY `idx_df4f2f80fc765155b60c8c2a309c4f8f` (`ScenarioId`),
  CONSTRAINT `fk_3181e5806c8950a2a5ec8141ccb7f788` FOREIGN KEY (`ScenarioId`) REFERENCES `H_AAA_Scenarios` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `Email_hash` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailConfirmed` tinyint DEFAULT NULL,
  `CellPhone_fsx` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CellPhone_hash` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CellPhoneConfirmed` tinyint DEFAULT NULL,
  `IssuedBy` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RecordKey` varchar(37) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`)
) ENGINE=InnoDB AUTO_INCREMENT=13825 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  KEY `idx_4228c2a99f1050f49ad2ca13cd8b20fc` (`UserId`),
  KEY `idx_f818fe0ab9f5539b8c048cbe5ad88279` (`EntityRoleId`),
  CONSTRAINT `fk_15dfb14c346d55bda757506cbf287f8f` FOREIGN KEY (`EntityRoleId`) REFERENCES `H_AAA_EntityRoles` (`Id`),
  CONSTRAINT `fk_411d58565d2552e19e469c59d78b7385` FOREIGN KEY (`UserId`) REFERENCES `H_AAA_Synced_UserInfo` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=733 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_AppConfigs`
--

DROP TABLE IF EXISTS `H_AppConfigs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AppConfigs` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Item` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Value` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Signature` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Item` (`Item`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_CFG_ActionConfigBases`
--

DROP TABLE IF EXISTS `H_CFG_ActionConfigBases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_CFG_ActionConfigBases` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Code` varchar(63) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Code` (`Code`),
  UNIQUE KEY `RecordKey` (`RecordKey`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_CFG_ActorConfigs`
--

DROP TABLE IF EXISTS `H_CFG_ActorConfigs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_CFG_ActorConfigs` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `EntityId` bigint unsigned DEFAULT NULL,
  `VehicleId` bigint unsigned DEFAULT NULL,
  `UserId` bigint unsigned DEFAULT NULL,
  `ActENUM` int unsigned NOT NULL,
  `ScenarioId` bigint unsigned NOT NULL,
  `ConfigBaseId` bigint unsigned NOT NULL,
  `Value` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsOverridable` tinyint NOT NULL,
  `Signature` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_66acd0183b1f5dbcac21ce9c2aff6a74` (`ScenarioId`,`EntityId`),
  KEY `idx_132d21c7864b5e2990397e7fe1adfb4b` (`UserId`),
  KEY `idx_13a58f627c0859be83ffa102da6f44c6` (`VehicleId`),
  KEY `idx_0c3842766be85ce6a8f3e64529439338` (`ConfigBaseId`),
  CONSTRAINT `fk_80709b7d6be05ed894aa47139ab6a574` FOREIGN KEY (`ScenarioId`, `EntityId`) REFERENCES `H_AAA_EntityScenarios` (`Id`, `EntityId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_a47fa621be5750298be95f46dab32150` FOREIGN KEY (`VehicleId`) REFERENCES `H_Synced_VehicleProfile` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_af8f616cf39550c1a8ef1a9240f92aab` FOREIGN KEY (`ConfigBaseId`) REFERENCES `H_CFG_ActionConfigBases` (`Id`),
  CONSTRAINT `fk_e43d6904da245a40b596ba2d60b42885` FOREIGN KEY (`UserId`) REFERENCES `H_AAA_Synced_UserInfo` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_CFG_GlobalConfigs`
--

DROP TABLE IF EXISTS `H_CFG_GlobalConfigs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_CFG_GlobalConfigs` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ConfigBaseId` bigint unsigned NOT NULL,
  `Value` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsOverridable` tinyint NOT NULL,
  `Signature` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_9c9cedb3e9f156b5b1fdec90555dfb5b` (`ConfigBaseId`),
  CONSTRAINT `fk_de49bbf678405fda870c2ffe62c7f180` FOREIGN KEY (`ConfigBaseId`) REFERENCES `H_CFG_ActionConfigBases` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  KEY `fk_86031748e1aa573e969de51ce74b578a` (`ParentComponentBaseId`),
  CONSTRAINT `fk_86031748e1aa573e969de51ce74b578a` FOREIGN KEY (`ParentComponentBaseId`) REFERENCES `H_DP_ComponentsBases` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=472903 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `Description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Data` json NOT NULL,
  `DataExtra` json DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`,`CodeName`,`Version`)
) ENGINE=InnoDB AUTO_INCREMENT=506705 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
-- Table structure for table `H_ENUM_CalculateMethods`
--

DROP TABLE IF EXISTS `H_ENUM_CalculateMethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_CalculateMethods` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_CalculationItems`
--

DROP TABLE IF EXISTS `H_ENUM_CalculationItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_CalculationItems` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_CalculationTypes`
--

DROP TABLE IF EXISTS `H_ENUM_CalculationTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_CalculationTypes` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_CalculationUnits`
--

DROP TABLE IF EXISTS `H_ENUM_CalculationUnits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_CalculationUnits` (
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
-- Table structure for table `H_ENUM_FinTransactionMethods`
--

DROP TABLE IF EXISTS `H_ENUM_FinTransactionMethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_FinTransactionMethods` (
  `ENUM` int unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_PermitConditions`
--

DROP TABLE IF EXISTS `H_ENUM_PermitConditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_PermitConditions` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_RequestStatuses`
--

DROP TABLE IF EXISTS `H_ENUM_RequestStatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_RequestStatuses` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_RequestTypes`
--

DROP TABLE IF EXISTS `H_ENUM_RequestTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_RequestTypes` (
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
-- Table structure for table `H_ENUM_ServiceCategories`
--

DROP TABLE IF EXISTS `H_ENUM_ServiceCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_ServiceCategories` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_ServiceClasses`
--

DROP TABLE IF EXISTS `H_ENUM_ServiceClasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_ServiceClasses` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_ServiceTypes`
--

DROP TABLE IF EXISTS `H_ENUM_ServiceTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_ServiceTypes` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_TransportCategories`
--

DROP TABLE IF EXISTS `H_ENUM_TransportCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_TransportCategories` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_TransportRequestStatuses`
--

DROP TABLE IF EXISTS `H_ENUM_TransportRequestStatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_TransportRequestStatuses` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_TransportTransactItemStatuses`
--

DROP TABLE IF EXISTS `H_ENUM_TransportTransactItemStatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_TransportTransactItemStatuses` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_TransportTransactOfferStatuses`
--

DROP TABLE IF EXISTS `H_ENUM_TransportTransactOfferStatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_TransportTransactOfferStatuses` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title_UNIQUE` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_TransportTransactOfferTypes`
--

DROP TABLE IF EXISTS `H_ENUM_TransportTransactOfferTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_TransportTransactOfferTypes` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_TransportTransactStatuses`
--

DROP TABLE IF EXISTS `H_ENUM_TransportTransactStatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_TransportTransactStatuses` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ENUM_VehicleTypes`
--

DROP TABLE IF EXISTS `H_ENUM_VehicleTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ENUM_VehicleTypes` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
-- Table structure for table `H_FinAccounts`
--

DROP TABLE IF EXISTS `H_FinAccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_FinAccounts` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `EntityId` bigint unsigned DEFAULT NULL,
  `UserId` bigint unsigned DEFAULT NULL,
  `Discriminator` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RecordKey` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_0aa2b2b32b8353adbbbdec2786adc6ea` (`UserId`),
  KEY `idx_9c29026396f05f51b82d71177826d6be` (`EntityId`),
  CONSTRAINT `fk_347c7cebfc54596190cac72b2268102c` FOREIGN KEY (`EntityId`) REFERENCES `H_AAA_Synced_EntityProfile` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bb49d9a40fba5b838575f6b604b58c84` FOREIGN KEY (`UserId`) REFERENCES `H_AAA_Synced_UserInfo` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_FinTransactions`
--

DROP TABLE IF EXISTS `H_FinTransactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_FinTransactions` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `AccountId` bigint NOT NULL,
  `PerformedActENUM` int unsigned NOT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Direction` tinyint(1) NOT NULL,
  `Method` tinyint(1) NOT NULL,
  `ProviderRawResponse` text COLLATE utf8mb4_unicode_ci,
  `TransportTransactId` bigint unsigned DEFAULT NULL,
  `TransportBatchItemId` bigint unsigned DEFAULT NULL,
  `Description` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Discriminator` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_330914d8d7985c419146aee6f15cbe21` (`AccountId`),
  KEY `idx_bf52f73eb3a85f5f8400cbffefdd8dda` (`TransportBatchItemId`),
  KEY `idx_63c5c395867158c7838f95d838f3dedc` (`TransportTransactId`),
  KEY `idx_8bf213ad231b504b96c24bd549f058e3` (`CreatedAt_UTC`),
  CONSTRAINT `fk_54b2b360741452c7a24c458b69403beb` FOREIGN KEY (`TransportBatchItemId`) REFERENCES `H_TransportBatchItems` (`Id`),
  CONSTRAINT `fk_c0715daec42357d0b8799604cb2a687c` FOREIGN KEY (`AccountId`) REFERENCES `H_FinAccounts` (`Id`),
  CONSTRAINT `fk_e43f79c7e3a7544a8d0e8534e9681a32` FOREIGN KEY (`TransportTransactId`) REFERENCES `H_TransportTransacts` (`Id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=43483 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_CVODrivers`
--

DROP TABLE IF EXISTS `H_Synced_CVODrivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_CVODrivers` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CVOId` bigint unsigned NOT NULL,
  `DriverId` bigint unsigned NOT NULL,
  `HasRule` tinyint(1) DEFAULT NULL,
  `IssuedDate_UTC` datetime DEFAULT NULL,
  `ExpiryDate_UTC` datetime DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_78ade812d0415b228d64cef244baf4f2` (`DriverId`),
  KEY `idx_0a87b473154d5681bcfdd7109c91ae46` (`CVOId`),
  CONSTRAINT `fk_432034a24cc058abab1167924cef595c` FOREIGN KEY (`CVOId`) REFERENCES `H_Synced_CVOs` (`Id`),
  CONSTRAINT `fk_8703bb24fe115ced946f15ea254a9a78` FOREIGN KEY (`DriverId`) REFERENCES `H_Synced_Drivers` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_CVOServices`
--

DROP TABLE IF EXISTS `H_Synced_CVOServices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_CVOServices` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CVOId` bigint unsigned NOT NULL,
  `ServiceId` bigint unsigned NOT NULL,
  `ServiceCategory` tinyint NOT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_81073508953456b8a17b8d6ca570920b` (`ServiceId`),
  KEY `idx_f806f0b245e050fd938efbac2ed790af` (`CVOId`),
  CONSTRAINT `fk_136dd703862d5d8db81e6c0ab3f02f21` FOREIGN KEY (`CVOId`) REFERENCES `H_Synced_CVOs` (`Id`),
  CONSTRAINT `fk_9381f94cdf1759999f5ba360c6c4157a` FOREIGN KEY (`ServiceId`) REFERENCES `H_Synced_ServiceBases` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_CVOVehicles`
--

DROP TABLE IF EXISTS `H_Synced_CVOVehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_CVOVehicles` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CVOId` bigint unsigned NOT NULL,
  `VehicleId` bigint unsigned NOT NULL,
  `HasRule` tinyint(1) DEFAULT NULL,
  `IssuedDate_UTC` datetime DEFAULT NULL,
  `ExpiryDate_UTC` datetime DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_43131e8234f85023b4c230ffe82574c0` (`VehicleId`),
  KEY `idx_1134e9fede675a42acf9d09c99ec3b73` (`CVOId`),
  CONSTRAINT `fk_0bb654ef681358348c606fed7bdbc1cc` FOREIGN KEY (`VehicleId`) REFERENCES `H_Synced_VehicleProfile` (`Id`),
  CONSTRAINT `fk_291c28611441505b9ba72d95cd117477` FOREIGN KEY (`CVOId`) REFERENCES `H_Synced_CVOs` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_CVOs`
--

DROP TABLE IF EXISTS `H_Synced_CVOs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_CVOs` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `EntityId` bigint unsigned DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_62243b33a8db5ef3b38abf85c4cef3e1` (`EntityId`),
  CONSTRAINT `fk_2bc2810dcf9d5914b341e0336e4f79f0` FOREIGN KEY (`EntityId`) REFERENCES `H_AAA_Synced_EntityProfile` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_DistributorCVOs`
--

DROP TABLE IF EXISTS `H_Synced_DistributorCVOs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_DistributorCVOs` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DistributorId` bigint unsigned NOT NULL,
  `CVOId` bigint unsigned NOT NULL,
  `HasRule` tinyint(1) DEFAULT NULL,
  `IssuedDate_UTC` datetime DEFAULT NULL,
  `ExpiryDate_UTC` datetime DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_bb43b00769cb599e8956b2e2e5b611cb` (`CVOId`),
  KEY `idx_028be021f9815fe696e1175ee4b57a39` (`DistributorId`),
  CONSTRAINT `fk_42a2e9aba50953fd88c1bf13e69017ea` FOREIGN KEY (`DistributorId`) REFERENCES `H_Synced_Distributors` (`Id`),
  CONSTRAINT `fk_49036aa68f4c5eb4a24276d976184a69` FOREIGN KEY (`CVOId`) REFERENCES `H_Synced_CVOs` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_DistributorDrivers`
--

DROP TABLE IF EXISTS `H_Synced_DistributorDrivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_DistributorDrivers` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DistributorId` bigint unsigned NOT NULL,
  `DriverId` bigint unsigned NOT NULL,
  `HasRule` tinyint(1) DEFAULT NULL,
  `IssuedDate_UTC` datetime DEFAULT NULL,
  `ExpiryDate_UTC` datetime DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_919d8e22cdbe5d6b891b3c208aa19e13` (`DriverId`),
  KEY `idx_1e1cc8359eda5778a4a4c8f4f39b1c36` (`DistributorId`),
  CONSTRAINT `fk_c30be9570c6b5e4092cdf34860f9b076` FOREIGN KEY (`DriverId`) REFERENCES `H_Synced_Drivers` (`Id`),
  CONSTRAINT `fk_f3f6ff1263625c0ca7ad0f2355da99fa` FOREIGN KEY (`DistributorId`) REFERENCES `H_Synced_Distributors` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_Distributors`
--

DROP TABLE IF EXISTS `H_Synced_Distributors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_Distributors` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `EntityId` bigint unsigned DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_6727cf3684b75bfe9da65447f7dc61dd` (`EntityId`),
  CONSTRAINT `fk_0350fa7eeb785674bcf4bdd46b0acff2` FOREIGN KEY (`EntityId`) REFERENCES `H_AAA_Synced_EntityProfile` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_DriverPermitVehicleTypes`
--

DROP TABLE IF EXISTS `H_Synced_DriverPermitVehicleTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_DriverPermitVehicleTypes` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `PermitId` bigint unsigned NOT NULL,
  `VehicleType` tinyint NOT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_23f775e7f6555a52891d7b9a609e939d` (`PermitId`),
  CONSTRAINT `fk_47cc83bc5d5454acbea818e1c32fd713` FOREIGN KEY (`PermitId`) REFERENCES `H_Synced_Permits` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_Drivers`
--

DROP TABLE IF EXISTS `H_Synced_Drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_Drivers` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `UserId` bigint unsigned NOT NULL,
  `PersonCVOId` bigint unsigned DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_8b12b19470b958319dd1832ee9687b8e` (`PersonCVOId`),
  KEY `idx_46ea511680b35f76a58935c1fcb2f72d` (`UserId`),
  CONSTRAINT `fk_5820f58d3dad521bbc942723da27edf0` FOREIGN KEY (`PersonCVOId`) REFERENCES `H_Synced_CVOs` (`Id`),
  CONSTRAINT `fk_d85ddce73803531baf694f37361f9db9` FOREIGN KEY (`UserId`) REFERENCES `H_AAA_Synced_UserInfo` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_Features`
--

DROP TABLE IF EXISTS `H_Synced_Features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_Features` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_HUBDistributors`
--

DROP TABLE IF EXISTS `H_Synced_HUBDistributors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_HUBDistributors` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DistributorId` bigint unsigned NOT NULL,
  `HUBId` bigint unsigned NOT NULL,
  `ParticipationCategory` tinyint DEFAULT NULL,
  `HasRule` tinyint(1) DEFAULT NULL,
  `IssuedDate_UTC` datetime DEFAULT NULL,
  `ExpiryDate_UTC` datetime DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_4122e47d631c5c0db4a570b6ec180791` (`DistributorId`),
  KEY `idx_61b54bcad19c5187bbf8c8fd2c8e0308` (`HUBId`),
  CONSTRAINT `fk_10cc8efa5fd35aa6bcaf9ec92b65d6ce` FOREIGN KEY (`HUBId`) REFERENCES `H_Synced_HUBs` (`Id`),
  CONSTRAINT `fk_563d511dabac576e87f8b08cb9e18249` FOREIGN KEY (`DistributorId`) REFERENCES `H_Synced_Distributors` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_HUBs`
--

DROP TABLE IF EXISTS `H_Synced_HUBs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_HUBs` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `EntityId` bigint unsigned DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_c89fd8e2577b52a293fe2ea624f02d39` (`EntityId`),
  CONSTRAINT `fk_95773193c0a8566cb29b3ae0eed19438` FOREIGN KEY (`EntityId`) REFERENCES `H_AAA_Synced_EntityProfile` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_MasterServices`
--

DROP TABLE IF EXISTS `H_Synced_MasterServices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_MasterServices` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_PermitIssuers`
--

DROP TABLE IF EXISTS `H_Synced_PermitIssuers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_PermitIssuers` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `EntityId` bigint unsigned DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_1cf58637402e57e5b1d61a2db910c848` (`EntityId`),
  CONSTRAINT `fk_786d3550245350e8b41f05eadf7f5786` FOREIGN KEY (`EntityId`) REFERENCES `H_AAA_Synced_EntityProfile` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_PermitStatusVerifications`
--

DROP TABLE IF EXISTS `H_Synced_PermitStatusVerifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_PermitStatusVerifications` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `PermitStatusId` bigint unsigned NOT NULL,
  `ApproverUserId` bigint unsigned DEFAULT NULL,
  `ApproverEntityId` bigint unsigned DEFAULT NULL,
  `ApproverActENUM` int unsigned DEFAULT NULL,
  `ApprovalStatus` tinyint unsigned NOT NULL,
  `ApprovalStatusReason` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `RecordKey` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_465a9daa44e65181ae5b23e9eb14f5fb` (`PermitStatusId`),
  CONSTRAINT `fk_f6a5c233a5e4594db42b4ec8bdaa9b1c` FOREIGN KEY (`PermitStatusId`) REFERENCES `H_Synced_PermitStatuses` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_PermitStatuses`
--

DROP TABLE IF EXISTS `H_Synced_PermitStatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_PermitStatuses` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `PermitId` bigint unsigned NOT NULL,
  `ExpiryDate_UTC` datetime NOT NULL,
  `ConditionENUM` tinyint DEFAULT NULL,
  `ConditionEndDate_UTC` datetime DEFAULT NULL,
  `MediaRecordKey` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_c8bcd0795fab5926833810d514d109b1` (`PermitId`),
  CONSTRAINT `fk_1c4d7bb7b7f25de1a26307983e8b86c5` FOREIGN KEY (`PermitId`) REFERENCES `H_Synced_Permits` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_PermitTypes`
--

DROP TABLE IF EXISTS `H_Synced_PermitTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_PermitTypes` (
  `Id` int unsigned NOT NULL DEFAULT '0',
  `ActENUM` int unsigned NOT NULL,
  `ActivityClassENUM` int unsigned NOT NULL,
  `Title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AllowedServiceCategories` json DEFAULT NULL,
  `Extendable` tinyint(1) NOT NULL DEFAULT '0',
  `ProfileDependant` tinyint NOT NULL DEFAULT '0',
  `RecordKey` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_Permits`
--

DROP TABLE IF EXISTS `H_Synced_Permits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_Permits` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `HUBId` bigint unsigned DEFAULT NULL,
  `DistributorId` bigint unsigned DEFAULT NULL,
  `CVOId` bigint unsigned DEFAULT NULL,
  `VehicleId` bigint unsigned DEFAULT NULL,
  `DriverId` bigint unsigned DEFAULT NULL,
  `ActENUM` int unsigned NOT NULL,
  `PermitIssuerId` bigint unsigned NOT NULL,
  `PermitTypeId` int unsigned NOT NULL,
  `Code` varchar(48) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IssuedDate_UTC` datetime NOT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_58f1bdeb1b8d583799b3a22b448fff30` (`PermitIssuerId`),
  KEY `idx_c2644b9b4a24557d9373045c80414729` (`VehicleId`),
  KEY `idx_e9937ead9bc25771a1fe167698048e67` (`HUBId`),
  KEY `idx_60f50192e29c5357bececcf591134d9d` (`DistributorId`),
  KEY `idx_11168c623d045b5bb76dc5562fbbbecc` (`ActENUM`),
  KEY `idx_0590ff17145257828ff985893041cb94` (`DriverId`),
  KEY `idx_398cc783288c5a539127f6eeb3bc1e04` (`CVOId`),
  KEY `idx_PermitTypeId` (`PermitTypeId`),
  CONSTRAINT `fk_209158a5634c5b93aea73c9847b30282` FOREIGN KEY (`CVOId`) REFERENCES `H_Synced_CVOs` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_2cde1d471c6a5d5d96411a07d51ec501` FOREIGN KEY (`DriverId`) REFERENCES `H_Synced_Drivers` (`Id`),
  CONSTRAINT `fk_3b6d319a8568594d9e9bed0f2aab3f80` FOREIGN KEY (`HUBId`) REFERENCES `H_Synced_HUBs` (`Id`),
  CONSTRAINT `fk_5f51c4383a9157648db3537fbfcf25f0` FOREIGN KEY (`DistributorId`) REFERENCES `H_Synced_Distributors` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_71a6a12dcfa55dfb8f05d048717f2d0b` FOREIGN KEY (`ActENUM`) REFERENCES `H_AAA_EntityScenarios` (`PermittedActENUM`),
  CONSTRAINT `fk_789026469334513897c56d7b47e2550d` FOREIGN KEY (`PermitIssuerId`) REFERENCES `H_Synced_PermitIssuers` (`Id`),
  CONSTRAINT `fk_bf8d4181e45e5721a5b8bdedae057021` FOREIGN KEY (`VehicleId`) REFERENCES `H_Synced_VehicleProfile` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_ServiceBases`
--

DROP TABLE IF EXISTS `H_Synced_ServiceBases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_ServiceBases` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ServiceType` tinyint NOT NULL,
  `ServiceClass` tinyint NOT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_VehicleDrivers`
--

DROP TABLE IF EXISTS `H_Synced_VehicleDrivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_VehicleDrivers` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `VehicleId` bigint unsigned NOT NULL,
  `DriverId` bigint unsigned NOT NULL,
  `HasRule` tinyint(1) DEFAULT NULL,
  `IssuedDate_UTC` datetime DEFAULT NULL,
  `ExpiryDate_UTC` datetime DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_3710b008da5a5ae7b543184d61783350` (`DriverId`),
  KEY `idx_ae0fa68c0356592bbb2d02638944f319` (`VehicleId`),
  CONSTRAINT `fk_188ec21d42de5c5da5e687a3db69cea4` FOREIGN KEY (`DriverId`) REFERENCES `H_Synced_Drivers` (`Id`),
  CONSTRAINT `fk_1fd66758418e5f5ab6c102fadba537d5` FOREIGN KEY (`VehicleId`) REFERENCES `H_Synced_VehicleProfile` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_VehicleFeatures`
--

DROP TABLE IF EXISTS `H_Synced_VehicleFeatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_VehicleFeatures` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `FeatureId` bigint unsigned NOT NULL,
  `VehicleId` bigint unsigned DEFAULT NULL,
  `HasRule` tinyint(1) DEFAULT NULL,
  `IssuedDate_UTC` datetime DEFAULT NULL,
  `ExpiryDate_UTC` datetime DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_ce20775e5ea75a89beda31ced9eea9a2` (`FeatureId`),
  KEY `idx_1951f61749f25bc1bc67d6d0618084c1` (`VehicleId`),
  CONSTRAINT `fk_211272073f37542f9eeee65830d8b3e8` FOREIGN KEY (`FeatureId`) REFERENCES `H_Synced_Features` (`Id`),
  CONSTRAINT `fk_538e516b770c53ea9d054c0c9fd73f2c` FOREIGN KEY (`VehicleId`) REFERENCES `H_Synced_VehicleProfile` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Synced_VehicleProfile`
--

DROP TABLE IF EXISTS `H_Synced_VehicleProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Synced_VehicleProfile` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Plate` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VIN` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Make` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Model` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Province` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Color` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Year` int DEFAULT NULL,
  `TransportCategory` tinyint DEFAULT NULL,
  `Cargo_Height` int DEFAULT NULL,
  `Cargo_Weight` int DEFAULT NULL,
  `Cargo_Length` int DEFAULT NULL,
  `Cargo_Width` int DEFAULT NULL,
  `Capacity_Passengers` int DEFAULT NULL,
  `Capacity_Luggage` int DEFAULT NULL,
  `VehicleType` tinyint DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  UNIQUE KEY `Plate` (`Plate`),
  UNIQUE KEY `VIN` (`VIN`)
) ENGINE=InnoDB AUTO_INCREMENT=599 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportBatchItems`
--

DROP TABLE IF EXISTS `H_TransportBatchItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportBatchItems` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `BatchId` bigint unsigned NOT NULL,
  `ItemOrder` int unsigned NOT NULL,
  `TransportReqRideId` bigint unsigned DEFAULT NULL,
  `TransportReqDeliveryId` bigint unsigned DEFAULT NULL,
  `Discriminator` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `unq_9ca89c2916e15a99a16c17d541dbdd3b` (`BatchId`,`ItemOrder`),
  UNIQUE KEY `unq_98ed2a4c3cba5ae786127f8e98257f6c` (`BatchId`,`TransportReqDeliveryId`),
  UNIQUE KEY `unq_1afc866f8e825048ae217f26b8b6a52c` (`BatchId`,`TransportReqRideId`),
  KEY `idx_54130e9a99925b849617f74a39fa5d56` (`BatchId`),
  KEY `idx_37124d35dc4b5d6c951b90ea29c330e0` (`TransportReqRideId`),
  KEY `idx_59e66aa664a750449f1a93671b03b01e` (`TransportReqDeliveryId`),
  CONSTRAINT `fk_178d3fb9f59453488473204d5dac335c` FOREIGN KEY (`TransportReqRideId`) REFERENCES `H_TransportReqRides` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_9845b24976f45c529cbf46aa3cc7d59c` FOREIGN KEY (`BatchId`) REFERENCES `H_TransportBatches` (`Id`),
  CONSTRAINT `fk_dd8e36f6b275546485b47cc3bda11852` FOREIGN KEY (`TransportReqDeliveryId`) REFERENCES `H_TransportReqDeliveries` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportBatches`
--

DROP TABLE IF EXISTS `H_TransportBatches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportBatches` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `FMS_OId` bigint unsigned DEFAULT NULL,
  `DistributorId` bigint unsigned NOT NULL,
  `TotalFareAtDispatch` decimal(10,2) DEFAULT NULL,
  `FarePortionAmount_CVO` decimal(10,2) DEFAULT NULL,
  `FarePortionAmount_Distributor` decimal(10,2) DEFAULT NULL,
  `FarePortionAmount_Driver` decimal(10,2) DEFAULT NULL,
  `AllowedDiscountPercent` decimal(4,2) NOT NULL DEFAULT '0.00',
  `IsEditable` tinyint(1) NOT NULL DEFAULT '1',
  `IsChargePerItem` tinyint(1) NOT NULL DEFAULT '0',
  `RecordKey` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_9a4079011a575a5497ca745098cfc4d5` (`DistributorId`),
  CONSTRAINT `fk_427466ad11285ed0acd0d3381783f8a4` FOREIGN KEY (`DistributorId`) REFERENCES `H_Synced_Distributors` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportContactLocations`
--

DROP TABLE IF EXISTS `H_TransportContactLocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportContactLocations` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ContactId` bigint unsigned NOT NULL,
  `FavAdrLabel` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LocationId` bigint unsigned NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `unq_3e93a55dc7575cb7bc81bf061b09c784` (`ContactId`,`LocationId`),
  UNIQUE KEY `unq_10dc6978de035f83b2af971a9a754a58` (`ContactId`,`FavAdrLabel`),
  KEY `idx_5fb504a67d72544aa067e74c9a85dea1` (`LocationId`),
  CONSTRAINT `fk_3e3301a17b045e76a9d77609188eb0e0` FOREIGN KEY (`LocationId`) REFERENCES `H_TransportLocations` (`Id`),
  CONSTRAINT `fk_ad90078e21eb5f3daba825b6996927be` FOREIGN KEY (`ContactId`) REFERENCES `H_TransportContactRegistry` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=9146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportContactRegistry`
--

DROP TABLE IF EXISTS `H_TransportContactRegistry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportContactRegistry` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `PossibleUserId` bigint unsigned DEFAULT NULL,
  `Firstname_fsx` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Lastname_fsx` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PossibleEntityId` bigint unsigned DEFAULT NULL,
  `Title` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MainLocationId` bigint unsigned DEFAULT NULL,
  `Buzzer` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Language` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TimeZone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Currency` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SignatureUri` longtext COLLATE utf8mb4_unicode_ci,
  `PhotoUri` longtext COLLATE utf8mb4_unicode_ci,
  `BirthDate_fsx` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Notification_SMS_fsx` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Notification_Phone_fsx` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Notification_Phone_Extention_fsx` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Notification_Email_fsx` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Notification_WhatsApp_fsx` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_529ae918d70754afadb2fd676571bfe0` (`MainLocationId`),
  KEY `idx_df544bc9a51056c593960d66c59519e4` (`PossibleEntityId`),
  KEY `idx_ae8e15e8ca2d5c64858eaafe696a9b31` (`PossibleUserId`),
  CONSTRAINT `fk_132dd3860d7b5df6b288aef43aa82f05` FOREIGN KEY (`PossibleUserId`) REFERENCES `H_AAA_Synced_UserInfo` (`Id`),
  CONSTRAINT `fk_4a8a190c92095d3f8d98c79865423db3` FOREIGN KEY (`PossibleEntityId`) REFERENCES `H_AAA_Synced_EntityProfile` (`Id`),
  CONSTRAINT `fk_f07670b3510b5822b88f39dc681d9fa1` FOREIGN KEY (`MainLocationId`) REFERENCES `H_TransportLocations` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4212 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportCustomerContacts`
--

DROP TABLE IF EXISTS `H_TransportCustomerContacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportCustomerContacts` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ContactId` bigint unsigned NOT NULL,
  `CustomerId` bigint unsigned NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `unq_dd579112850f59f9828fc30572201b04` (`ContactId`,`CustomerId`),
  KEY `idx_16406c9304265654a823f92798a41367` (`ContactId`),
  KEY `idx_08a2f6b94e5756f5901bb4014f961888` (`CustomerId`),
  CONSTRAINT `fk_c29c79d647ad58f1a122a9b5ed638670` FOREIGN KEY (`ContactId`) REFERENCES `H_TransportContactRegistry` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_d97682aead72527bbc25a66598c28b11` FOREIGN KEY (`CustomerId`) REFERENCES `H_TransportCustomers` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportCustomerMasterGoods`
--

DROP TABLE IF EXISTS `H_TransportCustomerMasterGoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportCustomerMasterGoods` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CustomerId` bigint unsigned NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `unq_61e187a3162c56cca0cd88b34b361ead` (`CustomerId`,`Code`),
  KEY `idx_fbd8e35a40085b81a1c4c7b4f236fe28` (`CustomerId`),
  CONSTRAINT `fk_866081b9bd6c5f02a3771132b1efa6c3` FOREIGN KEY (`CustomerId`) REFERENCES `H_TransportCustomers` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportCustomers`
--

DROP TABLE IF EXISTS `H_TransportCustomers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportCustomers` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `EntityId` bigint unsigned DEFAULT NULL,
  `UserId` bigint unsigned DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `EntityId` (`EntityId`),
  UNIQUE KEY `UserId` (`UserId`),
  CONSTRAINT `fk_26749ba2b1595cab8fac5746b05fdad4` FOREIGN KEY (`UserId`) REFERENCES `H_AAA_Synced_UserInfo` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_d6839aa6b3225b7a83bc964cd8f41b4b` FOREIGN KEY (`EntityId`) REFERENCES `H_AAA_Synced_EntityProfile` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4068 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportDistributorCustomers`
--

DROP TABLE IF EXISTS `H_TransportDistributorCustomers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportDistributorCustomers` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `DistributorId` bigint unsigned NOT NULL,
  `CustomerId` bigint unsigned NOT NULL,
  `IssuedDate_UTC` datetime NOT NULL,
  `ExpiryDate_UTC` datetime NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_dc0962a752145080883f4d9e21d3ab6f` (`CustomerId`),
  KEY `idx_ddcbc87b40215d6fb0fffb863c1982d0` (`DistributorId`),
  CONSTRAINT `fk_edf2a4f0a0a850478af904ae13f385a6` FOREIGN KEY (`CustomerId`) REFERENCES `H_TransportCustomers` (`Id`),
  CONSTRAINT `fk_f3fad5da59d855928d15baea8e31b8ea` FOREIGN KEY (`DistributorId`) REFERENCES `H_Synced_Distributors` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4036 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportFareBaseInclutions`
--

DROP TABLE IF EXISTS `H_TransportFareBaseInclutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportFareBaseInclutions` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DistributorId` bigint unsigned NOT NULL,
  `CVOId` bigint unsigned NOT NULL,
  `TransportCategory` tinyint NOT NULL,
  `ServiceCategory` tinyint NOT NULL,
  `VehicleType` tinyint NOT NULL,
  `ServiceClass` tinyint NOT NULL,
  `IncludedSeatCounts` int NOT NULL DEFAULT '1',
  `IncludedLuggageCounts` int NOT NULL DEFAULT '1',
  `IncludedParcelCounts` int NOT NULL DEFAULT '1',
  `IncludedWeightKg` decimal(8,2) NOT NULL DEFAULT '0.10',
  `IncludedVolumeCubicM` decimal(8,3) NOT NULL DEFAULT '0.125',
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_FareBaseInclutions_CVOId` (`CVOId`),
  KEY `idx_FareBaseInclutions_DistributorId` (`DistributorId`),
  CONSTRAINT `fk_FareBaseInclutions_CVOId` FOREIGN KEY (`CVOId`) REFERENCES `H_Synced_CVOs` (`Id`),
  CONSTRAINT `fk_FareBaseInclutions_DistributorId` FOREIGN KEY (`DistributorId`) REFERENCES `H_Synced_Distributors` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportFareByGeoFence`
--

DROP TABLE IF EXISTS `H_TransportFareByGeoFence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportFareByGeoFence` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `TransportFareCalculationId` bigint unsigned NOT NULL,
  `SourceGeoFenceBaseId` bigint unsigned NOT NULL,
  `DestinationGeoFenceBaseId` bigint unsigned NOT NULL,
  `BaseFare` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `unq_44ef8caeb40a562baccdefb1d20f3824` (`TransportFareCalculationId`,`SourceGeoFenceBaseId`,`DestinationGeoFenceBaseId`),
  KEY `idx_b96b4c8cae6451d1b964cc04032abbb9` (`SourceGeoFenceBaseId`),
  KEY `idx_e486a750982c596092bc6294f10f1753` (`DestinationGeoFenceBaseId`),
  CONSTRAINT `fk_15e0b8692b4452f98862ebc5a6b66967` FOREIGN KEY (`TransportFareCalculationId`) REFERENCES `H_TransportFareCalculations` (`Id`),
  CONSTRAINT `fk_ac5a1dc9a7115957bd51026eeee71614` FOREIGN KEY (`DestinationGeoFenceBaseId`) REFERENCES `H_TransportGeoFenceBases` (`Id`),
  CONSTRAINT `fk_bafa29a0cfce5a9d99c4c0beaa58c32c` FOREIGN KEY (`SourceGeoFenceBaseId`) REFERENCES `H_TransportGeoFenceBases` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportFareByZone`
--

DROP TABLE IF EXISTS `H_TransportFareByZone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportFareByZone` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `TransportFareCalculationId` bigint unsigned NOT NULL,
  `SourceGeoFenceBaseId` bigint unsigned NOT NULL,
  `DestinationGeoFenceBaseId` bigint unsigned NOT NULL,
  `BaseFare` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `unq_7f87f880883f5d8d9b98801e09d2f48d` (`TransportFareCalculationId`,`SourceGeoFenceBaseId`,`DestinationGeoFenceBaseId`),
  KEY `idx_795d943c6bfe5de6b7183113f1127071` (`SourceGeoFenceBaseId`),
  KEY `idx_3578dd1e073f5b829e3cf822ce9e7e58` (`DestinationGeoFenceBaseId`),
  CONSTRAINT `fk_24c6072582df5b39932044b82c75d487` FOREIGN KEY (`DestinationGeoFenceBaseId`) REFERENCES `H_TransportGeoFenceBases` (`Id`),
  CONSTRAINT `fk_574ccae5de8059fd82c7ba8f5d71ed8a` FOREIGN KEY (`SourceGeoFenceBaseId`) REFERENCES `H_TransportGeoFenceBases` (`Id`),
  CONSTRAINT `fk_d2e2794a8614585988b586c83b85582e` FOREIGN KEY (`TransportFareCalculationId`) REFERENCES `H_TransportFareCalculations` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportFareCalculations`
--

DROP TABLE IF EXISTS `H_TransportFareCalculations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportFareCalculations` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DistributorId` bigint unsigned NOT NULL,
  `CVOId` bigint unsigned NOT NULL,
  `TransportCategory` tinyint NOT NULL,
  `ServiceCategory` tinyint NOT NULL,
  `VehicleType` tinyint NOT NULL,
  `ServiceClass` tinyint NOT NULL,
  `CalculationItem` tinyint NOT NULL,
  `CalculationType` tinyint NOT NULL,
  `CalculateMethod` tinyint NOT NULL,
  `CalculationPriority` int unsigned DEFAULT NULL,
  `CalculationUnit` tinyint DEFAULT NULL,
  `UnitAmount` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `PriceTable` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_96856a6a7c6e59b4a8256bde5eb67a27` (`CVOId`),
  KEY `idx_011f753086fd526c9b94b37902e0253b` (`DistributorId`),
  CONSTRAINT `fk_3b2f69b3bac55425a67888146d670183` FOREIGN KEY (`DistributorId`) REFERENCES `H_Synced_Distributors` (`Id`),
  CONSTRAINT `fk_84e2c50d17f95c9e893c5dd17b57a7e1` FOREIGN KEY (`CVOId`) REFERENCES `H_Synced_CVOs` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportGeoFenceBases`
--

DROP TABLE IF EXISTS `H_TransportGeoFenceBases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportGeoFenceBases` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Coordinates` json NOT NULL,
  `Order` int DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `ix_H_TransportGeoFenceBases_Order` (`Order`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportLocations`
--

DROP TABLE IF EXISTS `H_TransportLocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportLocations` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Latitude` decimal(12,9) NOT NULL,
  `Longitude` decimal(12,9) NOT NULL,
  `Address` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `City` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Province` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PostalCode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PlaceId` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GoogleFullAddress` text COLLATE utf8mb4_unicode_ci,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `PlaceId` (`PlaceId`)
) ENGINE=InnoDB AUTO_INCREMENT=5815 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportReqDeliveries`
--

DROP TABLE IF EXISTS `H_TransportReqDeliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportReqDeliveries` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `IsEditable` tinyint(1) NOT NULL DEFAULT '1',
  `CustomerId` bigint unsigned NOT NULL,
  `DistributorId` bigint unsigned NOT NULL,
  `CVOId` bigint unsigned DEFAULT NULL,
  `FromContactLocationId` bigint unsigned NOT NULL,
  `ToContactLocationId` bigint unsigned NOT NULL,
  `PickupAfterDateTime` datetime DEFAULT NULL,
  `PickupAfterDateTime_UTC` datetime DEFAULT NULL,
  `PickupBeforeDateTime` datetime DEFAULT NULL,
  `PickupBeforeDateTime_UTC` datetime DEFAULT NULL,
  `DropOffAfterDateTime` datetime DEFAULT NULL,
  `DropOffAfterDateTime_UTC` datetime DEFAULT NULL,
  `DropOffBeforeDateTime` datetime DEFAULT NULL,
  `DropOffBeforeDateTime_UTC` datetime DEFAULT NULL,
  `VehicleType` tinyint DEFAULT NULL,
  `VehicleProfileSubType` tinyint DEFAULT NULL,
  `ServiceClass` tinyint DEFAULT NULL,
  `ActionOnAbsentReceiver` tinyint NOT NULL,
  `Comments` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FareAtSubmission` decimal(10,2) NOT NULL DEFAULT '0.00',
  `PromoCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PaymentCategory` tinyint unsigned NOT NULL DEFAULT '2',
  `PaymentMethod` smallint unsigned DEFAULT NULL,
  `PaidAt_UTC` datetime DEFAULT NULL,
  `Status` int NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_9f379099a6fe542598181977c80f34c1` (`FromContactLocationId`),
  KEY `idx_5ec8eb27399353db8734fb76fbacb79d` (`ToContactLocationId`),
  KEY `idx_95409a7ca9975050a93a65d47709bb81` (`DistributorId`),
  KEY `idx_c069a1de967752d2be5cd31ce3c64dc0` (`CustomerId`),
  KEY `idx_60ad4586f3cc5524aba9c8704d2ccdbf` (`CVOId`),
  CONSTRAINT `fk_3b133f4a1dd95005b24b8e3e0f08e624` FOREIGN KEY (`DistributorId`) REFERENCES `H_Synced_Distributors` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_690bce2ed3c35f1a86b026fa7de84f5d` FOREIGN KEY (`FromContactLocationId`) REFERENCES `H_TransportContactLocations` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_9503dddfbd425021a5ebd4627fc42f78` FOREIGN KEY (`CVOId`) REFERENCES `H_Synced_CVOs` (`Id`),
  CONSTRAINT `fk_ba123a4ac62054a7a5424df85ec3665e` FOREIGN KEY (`ToContactLocationId`) REFERENCES `H_TransportContactLocations` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bfe1e5cebe7e5d759fdbd88f2c26ad18` FOREIGN KEY (`CustomerId`) REFERENCES `H_TransportCustomers` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportReqDeliveriesLog`
--

DROP TABLE IF EXISTS `H_TransportReqDeliveriesLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportReqDeliveriesLog` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `TransportReqDeliveryId` bigint unsigned NOT NULL,
  `IsEditable` tinyint(1) NOT NULL DEFAULT '1',
  `CustomerId` bigint unsigned NOT NULL,
  `DistributorId` bigint unsigned NOT NULL,
  `CVOId` bigint unsigned DEFAULT NULL,
  `FromContactLocationId` bigint unsigned NOT NULL,
  `ToContactLocationId` bigint unsigned NOT NULL,
  `PickupAfterDateTime` datetime DEFAULT NULL,
  `PickupAfterDateTime_UTC` datetime DEFAULT NULL,
  `PickupBeforeDateTime` datetime DEFAULT NULL,
  `PickupBeforeDateTime_UTC` datetime DEFAULT NULL,
  `DropOffAfterDateTime` datetime DEFAULT NULL,
  `DropOffAfterDateTime_UTC` datetime DEFAULT NULL,
  `DropOffBeforeDateTime` datetime DEFAULT NULL,
  `DropOffBeforeDateTime_UTC` datetime DEFAULT NULL,
  `VehicleType` tinyint DEFAULT NULL,
  `VehicleProfileSubType` tinyint DEFAULT NULL,
  `ServiceClass` tinyint DEFAULT NULL,
  `ActionOnAbsentReceiver` tinyint NOT NULL,
  `Comments` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FareAtSubmission` decimal(10,2) NOT NULL DEFAULT '0.00',
  `PromoCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PaymentCategory` tinyint unsigned NOT NULL DEFAULT '2',
  `PaymentMethod` smallint unsigned DEFAULT NULL,
  `PaidAt_UTC` datetime DEFAULT NULL,
  `Status` int NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_e0b893bedc665598ad0325d5f2cbd2ae` (`FromContactLocationId`),
  KEY `idx_1653a72f068b55839afd2d8b438b6092` (`ToContactLocationId`),
  KEY `idx_f8bb925f5cb55aca9111e4ec9550e848` (`TransportReqDeliveryId`),
  KEY `idx_f033d392b45e5756a8a1ab82af14ca99` (`DistributorId`),
  KEY `idx_6f80d4d04c705bfea9963dcdcb4dcb64` (`CustomerId`),
  KEY `idx_7888cd0a44f25d23bcf3ce212f39fdf3` (`TransportReqDeliveryId`,`ModifiedAt_UTC`,`Status`),
  KEY `idx_6d60c5957b0157068b3b8e0b4df2e06f` (`CVOId`),
  CONSTRAINT `fk_0150c825e8215ccfb96dc27fbf546a76` FOREIGN KEY (`DistributorId`) REFERENCES `H_Synced_Distributors` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_5abb86aaaff95b73831ac434a1a0f5db` FOREIGN KEY (`CVOId`) REFERENCES `H_Synced_CVOs` (`Id`),
  CONSTRAINT `fk_6a7432d7df33552d8b36d55e3136ae6e` FOREIGN KEY (`ToContactLocationId`) REFERENCES `H_TransportContactLocations` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bb2a3cc5bd4a5ae5b798bf846a71209b` FOREIGN KEY (`TransportReqDeliveryId`) REFERENCES `H_TransportReqDeliveries` (`Id`),
  CONSTRAINT `fk_e4bc84ca02065afe9755bee074b79aa2` FOREIGN KEY (`FromContactLocationId`) REFERENCES `H_TransportContactLocations` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportReqDeliveryAddons`
--

DROP TABLE IF EXISTS `H_TransportReqDeliveryAddons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportReqDeliveryAddons` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `TransportReqDeliveryId` bigint unsigned DEFAULT NULL,
  `CalculationItem` tinyint NOT NULL,
  `CalculationUnit` tinyint DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_ReqDeliveryAddons_DeliveryId` (`TransportReqDeliveryId`),
  CONSTRAINT `fk_ReqDeliveryAddons_DeliveryId` FOREIGN KEY (`TransportReqDeliveryId`) REFERENCES `H_TransportReqDeliveries` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportReqDeliveryGoods`
--

DROP TABLE IF EXISTS `H_TransportReqDeliveryGoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportReqDeliveryGoods` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `ReqDeliveryId` bigint unsigned NOT NULL,
  `CustomerGoodId` bigint unsigned NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_c1f512a7daf3511eb85c5c870407e204` (`ReqDeliveryId`),
  KEY `idx_17a998ec1bf6583b9e58b2dd3191d27c` (`CustomerGoodId`),
  CONSTRAINT `fk_32a25059f4b05a50acac9d842ea93f60` FOREIGN KEY (`ReqDeliveryId`) REFERENCES `H_TransportReqDeliveries` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cebf65649b565a229d9f3e3c8e40841a` FOREIGN KEY (`CustomerGoodId`) REFERENCES `H_TransportCustomerMasterGoods` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportReqRideAddons`
--

DROP TABLE IF EXISTS `H_TransportReqRideAddons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportReqRideAddons` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `TransportReqRideId` bigint unsigned DEFAULT NULL,
  `CalculationItem` tinyint NOT NULL,
  `CalculationUnit` tinyint DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_ReqRideAddons_ReqRideId` (`TransportReqRideId`),
  CONSTRAINT `fk_ReqRideAddons_TransportReqRideId` FOREIGN KEY (`TransportReqRideId`) REFERENCES `H_TransportReqRides` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportReqRidePassengers`
--

DROP TABLE IF EXISTS `H_TransportReqRidePassengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportReqRidePassengers` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `ReqRideId` bigint unsigned NOT NULL,
  `PassengerId` bigint unsigned NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_99dc6ab3e1ce55a98e857a9c8e98dfcf` (`PassengerId`),
  KEY `idx_6cfc8a7fa8375754b14b4683d00ecc88` (`ReqRideId`),
  CONSTRAINT `fk_3d51249a281d5b16816ee37f6351e3c6` FOREIGN KEY (`ReqRideId`) REFERENCES `H_TransportReqRides` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_7f7798315427514e940ec41783e96e69` FOREIGN KEY (`PassengerId`) REFERENCES `H_TransportCustomerContacts` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportReqRides`
--

DROP TABLE IF EXISTS `H_TransportReqRides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportReqRides` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `IsEditable` tinyint(1) NOT NULL DEFAULT '1',
  `CustomerId` bigint unsigned NOT NULL,
  `DistributorId` bigint unsigned NOT NULL,
  `CVOId` bigint unsigned DEFAULT NULL,
  `FromContactLocationId` bigint unsigned DEFAULT NULL,
  `ToContactLocationId` bigint unsigned DEFAULT NULL,
  `PickupAfterDateTime` datetime DEFAULT NULL,
  `PickupAfterDateTime_UTC` datetime DEFAULT NULL,
  `PickupBeforeDateTime` datetime DEFAULT NULL,
  `PickupBeforeDateTime_UTC` datetime DEFAULT NULL,
  `DropOffAfterDateTime` datetime DEFAULT NULL,
  `DropOffAfterDateTime_UTC` datetime DEFAULT NULL,
  `DropOffBeforeDateTime` datetime DEFAULT NULL,
  `DropOffBeforeDateTime_UTC` datetime DEFAULT NULL,
  `VehicleType` tinyint NOT NULL,
  `VehicleProfileSubType` tinyint DEFAULT NULL,
  `ServiceClass` tinyint NOT NULL,
  `ServiceCategory` tinyint NOT NULL,
  `TotalRequiredSeats` int NOT NULL DEFAULT '1',
  `NumberOfLuggages` int NOT NULL DEFAULT '0',
  `FeaturesJSON` json DEFAULT NULL,
  `Comments` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FareAtSubmission` decimal(10,2) NOT NULL DEFAULT '0.00',
  `PromoCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PaymentCategory` tinyint unsigned NOT NULL DEFAULT '1',
  `PaymentMethod` smallint unsigned DEFAULT NULL,
  `PaidAt_UTC` datetime DEFAULT NULL,
  `HubCarrierInfo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` tinyint NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_82bae466ae0056e4a2473b81cf103721` (`FromContactLocationId`),
  KEY `idx_33a56ac3d5e85248b015b3a63d17ac24` (`ToContactLocationId`),
  KEY `idx_5287849555da5216978efb149a8222fc` (`DistributorId`),
  KEY `idx_d45b39141e9e562abba5e33bb870ad49` (`CVOId`),
  KEY `idx_b484747990575f10acb604d8c2726ff8` (`CustomerId`),
  CONSTRAINT `fk_0bd8f97f32eb519080e7441c41828a97` FOREIGN KEY (`FromContactLocationId`) REFERENCES `H_TransportContactLocations` (`Id`),
  CONSTRAINT `fk_43b6fb1bec9855319c2606ee45b370d3` FOREIGN KEY (`CVOId`) REFERENCES `H_Synced_CVOs` (`Id`),
  CONSTRAINT `fk_4c1cc9dc027a5691877c44d79698b4b4` FOREIGN KEY (`CustomerId`) REFERENCES `H_TransportCustomers` (`Id`),
  CONSTRAINT `fk_5c9cd8072ca45a41b3695d9d1969bf02` FOREIGN KEY (`DistributorId`) REFERENCES `H_Synced_Distributors` (`Id`),
  CONSTRAINT `fk_e4690cf54d10515baac75813a611ae4f` FOREIGN KEY (`ToContactLocationId`) REFERENCES `H_TransportContactLocations` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportReqRidesLog`
--

DROP TABLE IF EXISTS `H_TransportReqRidesLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportReqRidesLog` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `TransportReqRideId` bigint unsigned NOT NULL,
  `IsEditable` tinyint(1) NOT NULL DEFAULT '1',
  `CustomerId` bigint unsigned NOT NULL,
  `DistributorId` bigint unsigned NOT NULL,
  `CVOId` bigint unsigned DEFAULT NULL,
  `FromContactLocationId` bigint unsigned DEFAULT NULL,
  `ToContactLocationId` bigint unsigned DEFAULT NULL,
  `PickupAfterDateTime` datetime DEFAULT NULL,
  `PickupAfterDateTime_UTC` datetime DEFAULT NULL,
  `PickupBeforeDateTime` datetime DEFAULT NULL,
  `PickupBeforeDateTime_UTC` datetime DEFAULT NULL,
  `DropOffAfterDateTime` datetime DEFAULT NULL,
  `DropOffAfterDateTime_UTC` datetime DEFAULT NULL,
  `DropOffBeforeDateTime` datetime DEFAULT NULL,
  `DropOffBeforeDateTime_UTC` datetime DEFAULT NULL,
  `VehicleType` tinyint NOT NULL,
  `VehicleProfileSubType` tinyint DEFAULT NULL,
  `ServiceClass` tinyint NOT NULL,
  `ServiceCategory` tinyint NOT NULL,
  `TotalRequiredSeats` int NOT NULL DEFAULT '1',
  `NumberOfLuggages` int NOT NULL DEFAULT '0',
  `FeaturesJSON` json DEFAULT NULL,
  `Comments` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FareAtSubmission` decimal(10,2) NOT NULL DEFAULT '0.00',
  `PromoCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PaymentCategory` tinyint unsigned NOT NULL DEFAULT '1',
  `PaymentMethod` smallint unsigned DEFAULT NULL,
  `PaidAt_UTC` datetime DEFAULT NULL,
  `HubCarrierInfo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` tinyint NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_17b639f95aa85e549aed651cbee871a1` (`FromContactLocationId`),
  KEY `idx_60922f607ccf5c318a91455c128805ad` (`ToContactLocationId`),
  KEY `idx_0a1804f36b965144a573cd974ff33b71` (`DistributorId`),
  KEY `idx_63e631696cce5948b9b0c2e0b3750bf5` (`CVOId`),
  KEY `idx_cb7a91a0cbb05b4f809c133d61e23022` (`CustomerId`),
  KEY `idx_d850c05852ab5d3eb3ae7ffcbaf0f50e` (`TransportReqRideId`,`ModifiedAt_UTC`,`Status`),
  CONSTRAINT `fk_16a45c44b0ea59b3a29c89b4c5f87ffe` FOREIGN KEY (`FromContactLocationId`) REFERENCES `H_TransportContactLocations` (`Id`),
  CONSTRAINT `fk_625c9a736a945ced8a7dfe3be76237d0` FOREIGN KEY (`CVOId`) REFERENCES `H_Synced_CVOs` (`Id`),
  CONSTRAINT `fk_8af5efab2d85545d84735c68c0ab5f23` FOREIGN KEY (`ToContactLocationId`) REFERENCES `H_TransportContactLocations` (`Id`),
  CONSTRAINT `fk_b7f6b002da6b55d6ba3f4bb3158016be` FOREIGN KEY (`DistributorId`) REFERENCES `H_Synced_Distributors` (`Id`),
  CONSTRAINT `fk_eb007facf7f352f3bba9434f45e142c9` FOREIGN KEY (`TransportReqRideId`) REFERENCES `H_TransportReqRides` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5295 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportTransactItemStages`
--

DROP TABLE IF EXISTS `H_TransportTransactItemStages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportTransactItemStages` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `TimeStamp_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TransactStepId` bigint unsigned NOT NULL,
  `Status` int NOT NULL,
  `Comments` text COLLATE utf8mb4_unicode_ci,
  `ImageUri` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SignatureUri` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `unq_1337e896aa7e52eba52400f93ed339c2` (`TransactStepId`,`Status`),
  KEY `idx_9db673d3ff6852de8b09e8e5b4df5351` (`TimeStamp_UTC`),
  CONSTRAINT `fk_4c14b49ab4735be0bbb478298f58de66` FOREIGN KEY (`TransactStepId`) REFERENCES `H_TransportTransactItems` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportTransactItems`
--

DROP TABLE IF EXISTS `H_TransportTransactItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportTransactItems` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `TransportTransactId` bigint unsigned NOT NULL,
  `TransportBatchItemId` bigint unsigned NOT NULL,
  `CurrentStatus` int NOT NULL,
  `AggregatedComments` text COLLATE utf8mb4_unicode_ci,
  `ImageUri` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SignatureUri` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `unq_88c2720a77bb5313828afe1b980f4d0a` (`TransportTransactId`,`TransportBatchItemId`),
  KEY `idx_0b36f2740b1e5378bd5e90975b16b94d` (`TransportBatchItemId`),
  KEY `idx_7509d33b7ef05d2091271ce46a85246c` (`TransportTransactId`),
  CONSTRAINT `fk_afef980b72a15fa39eb96546ffa01985` FOREIGN KEY (`TransportBatchItemId`) REFERENCES `H_TransportBatchItems` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ce3add242f1a5886aea4079e598f090b` FOREIGN KEY (`TransportTransactId`) REFERENCES `H_TransportTransacts` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportTransactStages`
--

DROP TABLE IF EXISTS `H_TransportTransactStages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportTransactStages` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `TimeStamp_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TransportTransactId` bigint unsigned NOT NULL,
  `Status` int NOT NULL,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `unq_9f8e7bbbb529545c9dac8cd84d7c26ab` (`TransportTransactId`,`Status`),
  KEY `idx_8349b675598259a1b09e4782654a46f0` (`TransportTransactId`),
  CONSTRAINT `fk_ab507463d5ec5cf6b839ba52acc599d9` FOREIGN KEY (`TransportTransactId`) REFERENCES `H_TransportTransacts` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=16365 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_TransportTransacts`
--

DROP TABLE IF EXISTS `H_TransportTransacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_TransportTransacts` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `FMS_OvId` bigint unsigned DEFAULT NULL,
  `BatchId` bigint unsigned NOT NULL,
  `PickupZoneId` bigint unsigned DEFAULT NULL,
  `CVOId` bigint unsigned DEFAULT NULL,
  `VehicleId` bigint unsigned DEFAULT NULL,
  `DriverId` bigint unsigned DEFAULT NULL,
  `CurrentStatus` int NOT NULL,
  `OfferType` int DEFAULT NULL,
  `PaidTripFare` decimal(10,2) DEFAULT NULL,
  `PaidAddonFee` decimal(10,2) DEFAULT NULL,
  `AppliedDiscount` decimal(10,2) DEFAULT NULL,
  `PaidTip` decimal(10,2) DEFAULT NULL,
  `PaidToll` decimal(10,2) DEFAULT NULL,
  `ActualTotalFareAtTripEnd` decimal(10,2) DEFAULT NULL,
  `DriverAgreedFareAmount` decimal(10,2) DEFAULT NULL,
  `EnforceItemsCreationSequense` tinyint(1) NOT NULL DEFAULT '1',
  `PaymentTransactionNumber` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExtraData` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `idx_9feaacd817f259609abd6e4a02e05f82` (`BatchId`),
  KEY `idx_e30e193687ce5eb4b6da644ea374db5f` (`CVOId`),
  KEY `idx_3315d56db2ed55d098ee6ad7d9c8f9ff` (`VehicleId`),
  KEY `idx_c256c39ec0ef559093f204c2f0fa09bb` (`DriverId`),
  KEY `ix_H_TransportTransacts_FMS_OvId` (`FMS_OvId`),
  KEY `ix_H_TransportTransacts_PickupZoneId` (`PickupZoneId`),
  CONSTRAINT `fk_27f45c0b2564521491fbf2f9bd8b02c6` FOREIGN KEY (`BatchId`) REFERENCES `H_TransportBatches` (`Id`),
  CONSTRAINT `fk_54120568ffae59ad8ec5552140884dfd` FOREIGN KEY (`VehicleId`) REFERENCES `H_Synced_VehicleProfile` (`Id`),
  CONSTRAINT `fk_6deb109f5855530ba4af2eb28fa15412` FOREIGN KEY (`DriverId`) REFERENCES `H_Synced_Drivers` (`Id`),
  CONSTRAINT `fk_ffbca03cc5995d5c9d5e427404e992f8` FOREIGN KEY (`CVOId`) REFERENCES `H_Synced_CVOs` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_H_TransportTransacts_PickupZoneId_ZoneBases` FOREIGN KEY (`PickupZoneId`) REFERENCES `_ZoneBases` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5295 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
-- Temporary view structure for view `Vi_BKC_AlivenessSessionZoneQueueEntrance`
--

DROP TABLE IF EXISTS `Vi_BKC_AlivenessSessionZoneQueueEntrance`;
/*!50001 DROP VIEW IF EXISTS `Vi_BKC_AlivenessSessionZoneQueueEntrance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_BKC_AlivenessSessionZoneQueueEntrance` AS SELECT 
 1 AS `AlivenessSessionId`,
 1 AS `CurrentOrderInQueue`,
 1 AS `EnteredQueueAt_UTC`,
 1 AS `EffectiveQueueZoneId`,
 1 AS `EffectiveQueuePriority`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_BKC_DriverStatus`
--

DROP TABLE IF EXISTS `Vi_BKC_DriverStatus`;
/*!50001 DROP VIEW IF EXISTS `Vi_BKC_DriverStatus`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_BKC_DriverStatus` AS SELECT 
 1 AS `DriverId`,
 1 AS `ActivitySessionId`,
 1 AS `StatusTimestamp_UTC`,
 1 AS `ActivityStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_BKC_LiveUserWsSessions`
--

DROP TABLE IF EXISTS `Vi_BKC_LiveUserWsSessions`;
/*!50001 DROP VIEW IF EXISTS `Vi_BKC_LiveUserWsSessions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_BKC_LiveUserWsSessions` AS SELECT 
 1 AS `Id`,
 1 AS `ClientType`,
 1 AS `ClientKey`,
 1 AS `UserRecordKey`,
 1 AS `ConnectedServer`,
 1 AS `OpenedAt`,
 1 AS `HearBeatenAt`,
 1 AS `ClosedAt`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_BKC_PermitStatusApprovals`
--

DROP TABLE IF EXISTS `Vi_BKC_PermitStatusApprovals`;
/*!50001 DROP VIEW IF EXISTS `Vi_BKC_PermitStatusApprovals`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_BKC_PermitStatusApprovals` AS SELECT 
 1 AS `Id`,
 1 AS `HUBId`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `VehicleId`,
 1 AS `DriverId`,
 1 AS `ActENUM`,
 1 AS `PermitIssuerId`,
 1 AS `PermitType`,
 1 AS `Code`,
 1 AS `AllowedServiceCategories`,
 1 AS `IssuedDate_UTC`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `ModifiedAt_UTC`,
 1 AS `RecordDeleted`,
 1 AS `RequestStatusId`,
 1 AS `RequestApprovalStatus`,
 1 AS `RequestApproverEntityId`,
 1 AS `RequestApproverActENUM`,
 1 AS `ApproverEntityId`,
 1 AS `ApproverActENUM`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_BKC_QueueSnapshot`
--

DROP TABLE IF EXISTS `Vi_BKC_QueueSnapshot`;
/*!50001 DROP VIEW IF EXISTS `Vi_BKC_QueueSnapshot`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_BKC_QueueSnapshot` AS SELECT 
 1 AS `ActivitySessionId`,
 1 AS `AlivenessSessionId`,
 1 AS `ServiceCategory`,
 1 AS `ParticipationCategory`,
 1 AS `DriverId`,
 1 AS `VehicleId`,
 1 AS `CurrentLocationZoneId`,
 1 AS `LocationSubZoneCode`,
 1 AS `EnteredLocationZoneAt_UTC`,
 1 AS `EffectiveQueueZoneId`,
 1 AS `AtQueueZoneSince_UTC`,
 1 AS `CurrentOrderInQueue`,
 1 AS `QueuePriority`,
 1 AS `PriorityStart_UTC`,
 1 AS `PriorityEnd_UTC`,
 1 AS `AvailabilityStatus`,
 1 AS `ComputedOrderInQueue`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_BKC_TransportFareCalculatorPrettier`
--

DROP TABLE IF EXISTS `Vi_BKC_TransportFareCalculatorPrettier`;
/*!50001 DROP VIEW IF EXISTS `Vi_BKC_TransportFareCalculatorPrettier`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_BKC_TransportFareCalculatorPrettier` AS SELECT 
 1 AS `Id`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `TransportCategory`,
 1 AS `ServiceCategory`,
 1 AS `VehicleType`,
 1 AS `ServiceClass`,
 1 AS `CalculationItem`,
 1 AS `CalculationType`,
 1 AS `CalculateMethod`,
 1 AS `CalculationPriority`,
 1 AS `CalculationUnit`,
 1 AS `UnitAmount`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_BKC_VehicleStatus`
--

DROP TABLE IF EXISTS `Vi_BKC_VehicleStatus`;
/*!50001 DROP VIEW IF EXISTS `Vi_BKC_VehicleStatus`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_BKC_VehicleStatus` AS SELECT 
 1 AS `VehicleId`,
 1 AS `ActivitySessionId`,
 1 AS `DriverId`,
 1 AS `CurrentActivityStatus`,
 1 AS `AlivenessSessionId`,
 1 AS `CurrentAlivenessStatus`,
 1 AS `CurrentAlivenessStatusReason`,
 1 AS `LastLongitude`,
 1 AS `LastLatitude`,
 1 AS `LastZonePuls_UTC`,
 1 AS `LastPosiPuls_UTC`,
 1 AS `CurrentLocationZoneId`,
 1 AS `EnteredLocationZoneAt_UTC`,
 1 AS `EffectiveQueueZoneId`,
 1 AS `AtQueueZoneSince_UTC`,
 1 AS `BookedOutZoneId`,
 1 AS `BookedOutAt_UTC`,
 1 AS `CurrentOrderInQueue`,
 1 AS `QueuePriority`,
 1 AS `PriorityStart_UTC`,
 1 AS `PriorityEnd_UTC`,
 1 AS `CurrentAvailabilityStatus`,
 1 AS `StatusNote`*/;
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
-- Temporary view structure for view `Vi_DPA_ActionConfigBase`
--

DROP TABLE IF EXISTS `Vi_DPA_ActionConfigBase`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_ActionConfigBase`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_ActionConfigBase` AS SELECT 
 1 AS `Id`,
 1 AS `Code`,
 1 AS `Description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_ActionConfigBaseSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_ActionConfigBaseSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_ActionConfigBaseSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_ActionConfigBaseSummary` AS SELECT 
 1 AS `Id`,
 1 AS `Code`,
 1 AS `Description`,
 1 AS `ActorConfigsCount`,
 1 AS `GlobalConfigsCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_ActorConfigsDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_ActorConfigsDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_ActorConfigsDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_ActorConfigsDetail` AS SELECT 
 1 AS `ActionConfigBaseId`,
 1 AS `ActionConfigBaseCode`,
 1 AS `ActionConfigBaseDescription`,
 1 AS `EntityId`,
 1 AS `VehicleId`,
 1 AS `UserId`,
 1 AS `ActENUM`,
 1 AS `ScenarioId`,
 1 AS `Value`,
 1 AS `IsOverridable`*/;
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
-- Temporary view structure for view `Vi_DPA_CVO`
--

DROP TABLE IF EXISTS `Vi_DPA_CVO`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_CVO`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_CVO` AS SELECT 
 1 AS `Id`,
 1 AS `EntityId`,
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
-- Temporary view structure for view `Vi_DPA_CVODriversSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_CVODriversSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_CVODriversSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_CVODriversSuperDetail` AS SELECT 
 1 AS `CVOId`,
 1 AS `CVOEntityId`,
 1 AS `CVOEntityTitle`,
 1 AS `CVOEntityAddress_fsx`,
 1 AS `CVOEntityCity`,
 1 AS `CVOEntityProvince`,
 1 AS `CVOEntityCountry`,
 1 AS `CVOEntityPostalCode_fsx`,
 1 AS `CVOEntityPhone_fsx`,
 1 AS `CVOEntityFaxNumber_fsx`,
 1 AS `CVOEntityEmail_fsx`,
 1 AS `CVOEntityDiscriminator`,
 1 AS `DriverId`,
 1 AS `HasRule`,
 1 AS `IssuedDate_UTC`,
 1 AS `ExpiryDate_UTC`,
 1 AS `DriverUserId`,
 1 AS `DriverPersonCVOId`,
 1 AS `DriverFirstname_fsx`,
 1 AS `DriverLastname_fsx`,
 1 AS `DriverUsername`,
 1 AS `DriverEmail_fsx`,
 1 AS `DriverEmail_hash`,
 1 AS `DriverEmailConfirmed`,
 1 AS `DriverCellPhone_fsx`,
 1 AS `DriverCellPhone_hash`,
 1 AS `DriverCellPhoneConfirmed`,
 1 AS `DriverIssuedBy`,
 1 AS `DriverRecordKey`,
 1 AS `DriverCreatedAt_UTC`,
 1 AS `DriverCreatedBy`,
 1 AS `DriverModifiedAt_UTC`,
 1 AS `DriverModifiedBy`,
 1 AS `DriverRecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_CVOPermitsExtraDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_CVOPermitsExtraDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_CVOPermitsExtraDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_CVOPermitsExtraDetail` AS SELECT 
 1 AS `CVOId`,
 1 AS `CVOEntityId`,
 1 AS `CVOEntityTitle`,
 1 AS `CVOEntityAddress_fsx`,
 1 AS `CVOEntityCity`,
 1 AS `CVOEntityProvince`,
 1 AS `CVOEntityCountry`,
 1 AS `CVOEntityPostalCode_fsx`,
 1 AS `CVOEntityPhone_fsx`,
 1 AS `CVOEntityFaxNumber_fsx`,
 1 AS `CVOEntityEmail_fsx`,
 1 AS `CVOEntityDiscriminator`,
 1 AS `HUBId`,
 1 AS `DistributorId`,
 1 AS `VehicleId`,
 1 AS `DriverId`,
 1 AS `ActENUM`,
 1 AS `PermitIssuerId`,
 1 AS `PermitTypeId`,
 1 AS `Code`,
 1 AS `IssuedDate_UTC`,
 1 AS `DriverUserId`,
 1 AS `DriverPersonCVOId`,
 1 AS `DriverFirstname_fsx`,
 1 AS `DriverLastname_fsx`,
 1 AS `DriverUsername`,
 1 AS `DriverEmail_fsx`,
 1 AS `DriverEmail_hash`,
 1 AS `DriverEmailConfirmed`,
 1 AS `DriverCellPhone_fsx`,
 1 AS `DriverCellPhone_hash`,
 1 AS `DriverCellPhoneConfirmed`,
 1 AS `DriverIssuedBy`,
 1 AS `DriverRecordKey`,
 1 AS `DriverCreatedAt_UTC`,
 1 AS `DriverCreatedBy`,
 1 AS `DriverModifiedAt_UTC`,
 1 AS `DriverModifiedBy`,
 1 AS `DriverRecordDeleted`,
 1 AS `EntityScenarioEntityId`,
 1 AS `EntityScenarioScenarioId`,
 1 AS `EntityScenarioTitle`,
 1 AS `EntityScenarioAddress_fsx`,
 1 AS `EntityScenarioCity`,
 1 AS `EntityScenarioProvince`,
 1 AS `EntityScenarioCountry`,
 1 AS `EntityScenarioPostalCode_fsx`,
 1 AS `EntityScenarioPhone_fsx`,
 1 AS `EntityScenarioFaxNumber_fsx`,
 1 AS `EntityScenarioEmail_fsx`,
 1 AS `EntityScenarioDiscriminator`,
 1 AS `PermitIssuerEntityId`,
 1 AS `PermitIssuerTitle`,
 1 AS `PermitIssuerAddress_fsx`,
 1 AS `PermitIssuerCity`,
 1 AS `PermitIssuerProvince`,
 1 AS `PermitIssuerCountry`,
 1 AS `PermitIssuerPostalCode_fsx`,
 1 AS `PermitIssuerPhone_fsx`,
 1 AS `PermitIssuerFaxNumber_fsx`,
 1 AS `PermitIssuerEmail_fsx`,
 1 AS `PermitIssuerDiscriminator`,
 1 AS `VehicleProfilePlate`,
 1 AS `VehicleProfileVIN`,
 1 AS `VehicleProfileMake`,
 1 AS `VehicleProfileModel`,
 1 AS `VehicleProfileProvince`,
 1 AS `VehicleProfileColor`,
 1 AS `VehicleProfileYear`,
 1 AS `VehicleProfileTransportCategory`,
 1 AS `VehicleProfileCargo_Height`,
 1 AS `VehicleProfileCargo_Weight`,
 1 AS `VehicleProfileCargo_Length`,
 1 AS `VehicleProfileCargo_Width`,
 1 AS `VehicleProfileCapacity_Passengers`,
 1 AS `VehicleProfileCapacity_Luggage`,
 1 AS `VehicleProfileVehicleType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_CVOServicesSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_CVOServicesSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_CVOServicesSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_CVOServicesSuperDetail` AS SELECT 
 1 AS `CVOId`,
 1 AS `CVOEntityId`,
 1 AS `CVOEntityTitle`,
 1 AS `CVOEntityAddress_fsx`,
 1 AS `CVOEntityCity`,
 1 AS `CVOEntityProvince`,
 1 AS `CVOEntityCountry`,
 1 AS `CVOEntityPostalCode_fsx`,
 1 AS `CVOEntityPhone_fsx`,
 1 AS `CVOEntityFaxNumber_fsx`,
 1 AS `CVOEntityEmail_fsx`,
 1 AS `CVOEntityDiscriminator`,
 1 AS `ServiceId`,
 1 AS `ServiceCategory`,
 1 AS `ServiceBaseServiceType`,
 1 AS `ServiceBaseServiceClass`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_CVOVehiclesSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_CVOVehiclesSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_CVOVehiclesSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_CVOVehiclesSuperDetail` AS SELECT 
 1 AS `CVOId`,
 1 AS `CVOEntityId`,
 1 AS `CVOEntityTitle`,
 1 AS `CVOEntityAddress_fsx`,
 1 AS `CVOEntityCity`,
 1 AS `CVOEntityProvince`,
 1 AS `CVOEntityCountry`,
 1 AS `CVOEntityPostalCode_fsx`,
 1 AS `CVOEntityPhone_fsx`,
 1 AS `CVOEntityFaxNumber_fsx`,
 1 AS `CVOEntityEmail_fsx`,
 1 AS `CVOEntityDiscriminator`,
 1 AS `VehicleId`,
 1 AS `HasRule`,
 1 AS `IssuedDate_UTC`,
 1 AS `ExpiryDate_UTC`,
 1 AS `VehicleProfilePlate`,
 1 AS `VehicleProfileVIN`,
 1 AS `VehicleProfileMake`,
 1 AS `VehicleProfileModel`,
 1 AS `VehicleProfileProvince`,
 1 AS `VehicleProfileColor`,
 1 AS `VehicleProfileYear`,
 1 AS `VehicleProfileTransportCategory`,
 1 AS `VehicleProfileCargo_Height`,
 1 AS `VehicleProfileCargo_Weight`,
 1 AS `VehicleProfileCargo_Length`,
 1 AS `VehicleProfileCargo_Width`,
 1 AS `VehicleProfileCapacity_Passengers`,
 1 AS `VehicleProfileCapacity_Luggage`,
 1 AS `VehicleProfileVehicleType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_ClientDeviceInfo`
--

DROP TABLE IF EXISTS `Vi_DPA_ClientDeviceInfo`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_ClientDeviceInfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_ClientDeviceInfo` AS SELECT 
 1 AS `Id`,
 1 AS `ClientOS`,
 1 AS `DeviceModel`,
 1 AS `AppID`,
 1 AS `VehicleQRCode`,
 1 AS `AppVersion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_DelegatedDispatchContract`
--

DROP TABLE IF EXISTS `Vi_DPA_DelegatedDispatchContract`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DelegatedDispatchContract`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_DelegatedDispatchContract` AS SELECT 
 1 AS `Id`,
 1 AS `RequestId`,
 1 AS `BatchId`,
 1 AS `DelegatedToType`,
 1 AS `DelegatedToId`,
 1 AS `Status`,
 1 AS `ExpiresAt_UTC`,
 1 AS `CompletedAt_UTC`,
 1 AS `DelegatedMethod`,
 1 AS `ScopeType`,
 1 AS `ScopeId`,
 1 AS `SessionId`,
 1 AS `WindowStart_UTC`,
 1 AS `WindowEnd_UTC`,
 1 AS `PolicyVersionRef`,
 1 AS `ConfigVersionRef`,
 1 AS `OperationModeSnapshot`,
 1 AS `DelegateServiceIdentity`,
 1 AS `ActivatedAt_UTC`,
 1 AS `AcceptedAt_UTC`,
 1 AS `ReclaimedAt_UTC`,
 1 AS `ReclaimReason`,
 1 AS `ReleaseReason`,
 1 AS `ParticipantFocus`,
 1 AS `ActorConfigRefs`,
 1 AS `BasketPolicyRef`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_DispatchRuleArtifactsDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_DispatchRuleArtifactsDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DispatchRuleArtifactsDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_DispatchRuleArtifactsDetail` AS SELECT 
 1 AS `DispatchRuleVersionId`,
 1 AS `DispatchRuleVersionRuleSetId`,
 1 AS `DispatchRuleVersionVersionNo`,
 1 AS `DispatchRuleVersionLifecycleState`,
 1 AS `DispatchRuleVersionSourceHash`,
 1 AS `DispatchRuleVersionCompiledArtifactId`,
 1 AS `DispatchRuleVersionValidationResult`,
 1 AS `DispatchRuleVersionActivatedAt_UTC`,
 1 AS `ArtifactType`,
 1 AS `ArtifactFormatVersion`,
 1 AS `ArtifactBlob`,
 1 AS `CompiledAt_UTC`,
 1 AS `CompileMode`,
 1 AS `CompileStatus`,
 1 AS `CompileError`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_DispatchRuleSet`
--

DROP TABLE IF EXISTS `Vi_DPA_DispatchRuleSet`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DispatchRuleSet`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_DispatchRuleSet` AS SELECT 
 1 AS `Id`,
 1 AS `Name`,
 1 AS `PolicyFamily`,
 1 AS `OwnerScopeType`,
 1 AS `OwnerScopeId`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_DispatchRuleSetSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_DispatchRuleSetSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DispatchRuleSetSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_DispatchRuleSetSummary` AS SELECT 
 1 AS `Id`,
 1 AS `Name`,
 1 AS `PolicyFamily`,
 1 AS `OwnerScopeType`,
 1 AS `OwnerScopeId`,
 1 AS `Status`,
 1 AS `DispatchRuleVersionsCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_DispatchRuleVersion`
--

DROP TABLE IF EXISTS `Vi_DPA_DispatchRuleVersion`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DispatchRuleVersion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_DispatchRuleVersion` AS SELECT 
 1 AS `Id`,
 1 AS `RuleSetId`,
 1 AS `VersionNo`,
 1 AS `LifecycleState`,
 1 AS `SourceHash`,
 1 AS `CompiledArtifactId`,
 1 AS `ValidationResult`,
 1 AS `ActivatedAt_UTC`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_DispatchRuleVersionSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_DispatchRuleVersionSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DispatchRuleVersionSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_DispatchRuleVersionSummary` AS SELECT 
 1 AS `Id`,
 1 AS `RuleSetId`,
 1 AS `VersionNo`,
 1 AS `LifecycleState`,
 1 AS `SourceHash`,
 1 AS `CompiledArtifactId`,
 1 AS `ValidationResult`,
 1 AS `ActivatedAt_UTC`,
 1 AS `DispatchRuleArtifactsCount`,
 1 AS `DispatchRulesCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_DispatchRuleVersionsDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_DispatchRuleVersionsDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DispatchRuleVersionsDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_DispatchRuleVersionsDetail` AS SELECT 
 1 AS `DispatchRuleSetId`,
 1 AS `DispatchRuleSetName`,
 1 AS `DispatchRuleSetPolicyFamily`,
 1 AS `DispatchRuleSetOwnerScopeType`,
 1 AS `DispatchRuleSetOwnerScopeId`,
 1 AS `DispatchRuleSetStatus`,
 1 AS `VersionNo`,
 1 AS `LifecycleState`,
 1 AS `SourceHash`,
 1 AS `CompiledArtifactId`,
 1 AS `ValidationResult`,
 1 AS `ActivatedAt_UTC`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_Distributor`
--

DROP TABLE IF EXISTS `Vi_DPA_Distributor`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_Distributor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_Distributor` AS SELECT 
 1 AS `Id`,
 1 AS `EntityId`,
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
-- Temporary view structure for view `Vi_DPA_DistributorCVOsSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_DistributorCVOsSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DistributorCVOsSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_DistributorCVOsSuperDetail` AS SELECT 
 1 AS `DistributorId`,
 1 AS `DistributorEntityId`,
 1 AS `DistributorEntityTitle`,
 1 AS `DistributorEntityAddress_fsx`,
 1 AS `DistributorEntityCity`,
 1 AS `DistributorEntityProvince`,
 1 AS `DistributorEntityCountry`,
 1 AS `DistributorEntityPostalCode_fsx`,
 1 AS `DistributorEntityPhone_fsx`,
 1 AS `DistributorEntityFaxNumber_fsx`,
 1 AS `DistributorEntityEmail_fsx`,
 1 AS `DistributorEntityDiscriminator`,
 1 AS `CVOId`,
 1 AS `HasRule`,
 1 AS `IssuedDate_UTC`,
 1 AS `ExpiryDate_UTC`,
 1 AS `CVOEntityId`,
 1 AS `CVOTitle`,
 1 AS `CVOAddress_fsx`,
 1 AS `CVOCity`,
 1 AS `CVOProvince`,
 1 AS `CVOCountry`,
 1 AS `CVOPostalCode_fsx`,
 1 AS `CVOPhone_fsx`,
 1 AS `CVOFaxNumber_fsx`,
 1 AS `CVOEmail_fsx`,
 1 AS `CVODiscriminator`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_DistributorDriversSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_DistributorDriversSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DistributorDriversSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_DistributorDriversSuperDetail` AS SELECT 
 1 AS `DistributorId`,
 1 AS `DistributorEntityId`,
 1 AS `DistributorEntityTitle`,
 1 AS `DistributorEntityAddress_fsx`,
 1 AS `DistributorEntityCity`,
 1 AS `DistributorEntityProvince`,
 1 AS `DistributorEntityCountry`,
 1 AS `DistributorEntityPostalCode_fsx`,
 1 AS `DistributorEntityPhone_fsx`,
 1 AS `DistributorEntityFaxNumber_fsx`,
 1 AS `DistributorEntityEmail_fsx`,
 1 AS `DistributorEntityDiscriminator`,
 1 AS `DriverId`,
 1 AS `HasRule`,
 1 AS `IssuedDate_UTC`,
 1 AS `ExpiryDate_UTC`,
 1 AS `DriverUserId`,
 1 AS `DriverPersonCVOId`,
 1 AS `DriverFirstname_fsx`,
 1 AS `DriverLastname_fsx`,
 1 AS `DriverUsername`,
 1 AS `DriverEmail_fsx`,
 1 AS `DriverEmail_hash`,
 1 AS `DriverEmailConfirmed`,
 1 AS `DriverCellPhone_fsx`,
 1 AS `DriverCellPhone_hash`,
 1 AS `DriverCellPhoneConfirmed`,
 1 AS `DriverIssuedBy`,
 1 AS `DriverRecordKey`,
 1 AS `DriverCreatedAt_UTC`,
 1 AS `DriverCreatedBy`,
 1 AS `DriverModifiedAt_UTC`,
 1 AS `DriverModifiedBy`,
 1 AS `DriverRecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_DistributorPermitsExtraDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_DistributorPermitsExtraDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DistributorPermitsExtraDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_DistributorPermitsExtraDetail` AS SELECT 
 1 AS `DistributorId`,
 1 AS `DistributorEntityId`,
 1 AS `DistributorEntityTitle`,
 1 AS `DistributorEntityAddress_fsx`,
 1 AS `DistributorEntityCity`,
 1 AS `DistributorEntityProvince`,
 1 AS `DistributorEntityCountry`,
 1 AS `DistributorEntityPostalCode_fsx`,
 1 AS `DistributorEntityPhone_fsx`,
 1 AS `DistributorEntityFaxNumber_fsx`,
 1 AS `DistributorEntityEmail_fsx`,
 1 AS `DistributorEntityDiscriminator`,
 1 AS `HUBId`,
 1 AS `CVOId`,
 1 AS `VehicleId`,
 1 AS `DriverId`,
 1 AS `ActENUM`,
 1 AS `PermitIssuerId`,
 1 AS `PermitTypeId`,
 1 AS `Code`,
 1 AS `IssuedDate_UTC`,
 1 AS `DriverUserId`,
 1 AS `DriverPersonCVOId`,
 1 AS `DriverFirstname_fsx`,
 1 AS `DriverLastname_fsx`,
 1 AS `DriverUsername`,
 1 AS `DriverEmail_fsx`,
 1 AS `DriverEmail_hash`,
 1 AS `DriverEmailConfirmed`,
 1 AS `DriverCellPhone_fsx`,
 1 AS `DriverCellPhone_hash`,
 1 AS `DriverCellPhoneConfirmed`,
 1 AS `DriverIssuedBy`,
 1 AS `DriverRecordKey`,
 1 AS `DriverCreatedAt_UTC`,
 1 AS `DriverCreatedBy`,
 1 AS `DriverModifiedAt_UTC`,
 1 AS `DriverModifiedBy`,
 1 AS `DriverRecordDeleted`,
 1 AS `EntityScenarioEntityId`,
 1 AS `EntityScenarioScenarioId`,
 1 AS `EntityScenarioTitle`,
 1 AS `EntityScenarioAddress_fsx`,
 1 AS `EntityScenarioCity`,
 1 AS `EntityScenarioProvince`,
 1 AS `EntityScenarioCountry`,
 1 AS `EntityScenarioPostalCode_fsx`,
 1 AS `EntityScenarioPhone_fsx`,
 1 AS `EntityScenarioFaxNumber_fsx`,
 1 AS `EntityScenarioEmail_fsx`,
 1 AS `EntityScenarioDiscriminator`,
 1 AS `PermitIssuerEntityId`,
 1 AS `PermitIssuerTitle`,
 1 AS `PermitIssuerAddress_fsx`,
 1 AS `PermitIssuerCity`,
 1 AS `PermitIssuerProvince`,
 1 AS `PermitIssuerCountry`,
 1 AS `PermitIssuerPostalCode_fsx`,
 1 AS `PermitIssuerPhone_fsx`,
 1 AS `PermitIssuerFaxNumber_fsx`,
 1 AS `PermitIssuerEmail_fsx`,
 1 AS `PermitIssuerDiscriminator`,
 1 AS `VehicleProfilePlate`,
 1 AS `VehicleProfileVIN`,
 1 AS `VehicleProfileMake`,
 1 AS `VehicleProfileModel`,
 1 AS `VehicleProfileProvince`,
 1 AS `VehicleProfileColor`,
 1 AS `VehicleProfileYear`,
 1 AS `VehicleProfileTransportCategory`,
 1 AS `VehicleProfileCargo_Height`,
 1 AS `VehicleProfileCargo_Weight`,
 1 AS `VehicleProfileCargo_Length`,
 1 AS `VehicleProfileCargo_Width`,
 1 AS `VehicleProfileCapacity_Passengers`,
 1 AS `VehicleProfileCapacity_Luggage`,
 1 AS `VehicleProfileVehicleType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_Driver`
--

DROP TABLE IF EXISTS `Vi_DPA_Driver`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_Driver`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_Driver` AS SELECT 
 1 AS `Id`,
 1 AS `UserId`,
 1 AS `PersonCVOId`,
 1 AS `UserFirstname_fsx`,
 1 AS `UserLastname_fsx`,
 1 AS `UserUsername`,
 1 AS `UserEmail_fsx`,
 1 AS `UserEmail_hash`,
 1 AS `UserEmailConfirmed`,
 1 AS `UserCellPhone_fsx`,
 1 AS `UserCellPhone_hash`,
 1 AS `UserCellPhoneConfirmed`,
 1 AS `UserIssuedBy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_DriverPermitVehicleTypesDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_DriverPermitVehicleTypesDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DriverPermitVehicleTypesDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_DriverPermitVehicleTypesDetail` AS SELECT 
 1 AS `PermitId`,
 1 AS `PermitHUBId`,
 1 AS `PermitDistributorId`,
 1 AS `PermitCVOId`,
 1 AS `PermitVehicleId`,
 1 AS `PermitDriverId`,
 1 AS `PermitActENUM`,
 1 AS `PermitPermitIssuerId`,
 1 AS `PermitPermitTypeId`,
 1 AS `PermitCode`,
 1 AS `PermitIssuedDate_UTC`,
 1 AS `VehicleType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_DriversSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_DriversSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DriversSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_DriversSuperDetail` AS SELECT 
 1 AS `CVOId`,
 1 AS `CVOEntityId`,
 1 AS `CVOEntityTitle`,
 1 AS `CVOEntityAddress_fsx`,
 1 AS `CVOEntityCity`,
 1 AS `CVOEntityProvince`,
 1 AS `CVOEntityCountry`,
 1 AS `CVOEntityPostalCode_fsx`,
 1 AS `CVOEntityPhone_fsx`,
 1 AS `CVOEntityFaxNumber_fsx`,
 1 AS `CVOEntityEmail_fsx`,
 1 AS `CVOEntityDiscriminator`,
 1 AS `UserId`,
 1 AS `UserInfoFirstname_fsx`,
 1 AS `UserInfoLastname_fsx`,
 1 AS `UserInfoUsername`,
 1 AS `UserInfoEmail_fsx`,
 1 AS `UserInfoEmail_hash`,
 1 AS `UserInfoEmailConfirmed`,
 1 AS `UserInfoCellPhone_fsx`,
 1 AS `UserInfoCellPhone_hash`,
 1 AS `UserInfoCellPhoneConfirmed`,
 1 AS `UserInfoIssuedBy`*/;
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
-- Temporary view structure for view `Vi_DPA_Feature`
--

DROP TABLE IF EXISTS `Vi_DPA_Feature`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_Feature`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_Feature` AS SELECT 
 1 AS `Id`,
 1 AS `Title`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_FeatureSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_FeatureSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_FeatureSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_FeatureSummary` AS SELECT 
 1 AS `Id`,
 1 AS `Title`,
 1 AS `VehiclesCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_HUB`
--

DROP TABLE IF EXISTS `Vi_DPA_HUB`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_HUB`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_HUB` AS SELECT 
 1 AS `Id`,
 1 AS `EntityId`,
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
-- Temporary view structure for view `Vi_DPA_HUBDistributorsSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_HUBDistributorsSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_HUBDistributorsSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_HUBDistributorsSuperDetail` AS SELECT 
 1 AS `HUBId`,
 1 AS `HUBEntityId`,
 1 AS `HUBEntityTitle`,
 1 AS `HUBEntityAddress_fsx`,
 1 AS `HUBEntityCity`,
 1 AS `HUBEntityProvince`,
 1 AS `HUBEntityCountry`,
 1 AS `HUBEntityPostalCode_fsx`,
 1 AS `HUBEntityPhone_fsx`,
 1 AS `HUBEntityFaxNumber_fsx`,
 1 AS `HUBEntityEmail_fsx`,
 1 AS `HUBEntityDiscriminator`,
 1 AS `DistributorId`,
 1 AS `ParticipationCategory`,
 1 AS `HasRule`,
 1 AS `IssuedDate_UTC`,
 1 AS `ExpiryDate_UTC`,
 1 AS `DistributorEntityId`,
 1 AS `DistributorTitle`,
 1 AS `DistributorAddress_fsx`,
 1 AS `DistributorCity`,
 1 AS `DistributorProvince`,
 1 AS `DistributorCountry`,
 1 AS `DistributorPostalCode_fsx`,
 1 AS `DistributorPhone_fsx`,
 1 AS `DistributorFaxNumber_fsx`,
 1 AS `DistributorEmail_fsx`,
 1 AS `DistributorDiscriminator`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_HUBPermitsExtraDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_HUBPermitsExtraDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_HUBPermitsExtraDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_HUBPermitsExtraDetail` AS SELECT 
 1 AS `HUBId`,
 1 AS `HUBEntityId`,
 1 AS `HUBEntityTitle`,
 1 AS `HUBEntityAddress_fsx`,
 1 AS `HUBEntityCity`,
 1 AS `HUBEntityProvince`,
 1 AS `HUBEntityCountry`,
 1 AS `HUBEntityPostalCode_fsx`,
 1 AS `HUBEntityPhone_fsx`,
 1 AS `HUBEntityFaxNumber_fsx`,
 1 AS `HUBEntityEmail_fsx`,
 1 AS `HUBEntityDiscriminator`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `VehicleId`,
 1 AS `DriverId`,
 1 AS `ActENUM`,
 1 AS `PermitIssuerId`,
 1 AS `PermitTypeId`,
 1 AS `Code`,
 1 AS `IssuedDate_UTC`,
 1 AS `DriverUserId`,
 1 AS `DriverPersonCVOId`,
 1 AS `DriverFirstname_fsx`,
 1 AS `DriverLastname_fsx`,
 1 AS `DriverUsername`,
 1 AS `DriverEmail_fsx`,
 1 AS `DriverEmail_hash`,
 1 AS `DriverEmailConfirmed`,
 1 AS `DriverCellPhone_fsx`,
 1 AS `DriverCellPhone_hash`,
 1 AS `DriverCellPhoneConfirmed`,
 1 AS `DriverIssuedBy`,
 1 AS `DriverRecordKey`,
 1 AS `DriverCreatedAt_UTC`,
 1 AS `DriverCreatedBy`,
 1 AS `DriverModifiedAt_UTC`,
 1 AS `DriverModifiedBy`,
 1 AS `DriverRecordDeleted`,
 1 AS `EntityScenarioEntityId`,
 1 AS `EntityScenarioScenarioId`,
 1 AS `EntityScenarioTitle`,
 1 AS `EntityScenarioAddress_fsx`,
 1 AS `EntityScenarioCity`,
 1 AS `EntityScenarioProvince`,
 1 AS `EntityScenarioCountry`,
 1 AS `EntityScenarioPostalCode_fsx`,
 1 AS `EntityScenarioPhone_fsx`,
 1 AS `EntityScenarioFaxNumber_fsx`,
 1 AS `EntityScenarioEmail_fsx`,
 1 AS `EntityScenarioDiscriminator`,
 1 AS `PermitIssuerEntityId`,
 1 AS `PermitIssuerTitle`,
 1 AS `PermitIssuerAddress_fsx`,
 1 AS `PermitIssuerCity`,
 1 AS `PermitIssuerProvince`,
 1 AS `PermitIssuerCountry`,
 1 AS `PermitIssuerPostalCode_fsx`,
 1 AS `PermitIssuerPhone_fsx`,
 1 AS `PermitIssuerFaxNumber_fsx`,
 1 AS `PermitIssuerEmail_fsx`,
 1 AS `PermitIssuerDiscriminator`,
 1 AS `VehicleProfilePlate`,
 1 AS `VehicleProfileVIN`,
 1 AS `VehicleProfileMake`,
 1 AS `VehicleProfileModel`,
 1 AS `VehicleProfileProvince`,
 1 AS `VehicleProfileColor`,
 1 AS `VehicleProfileYear`,
 1 AS `VehicleProfileTransportCategory`,
 1 AS `VehicleProfileCargo_Height`,
 1 AS `VehicleProfileCargo_Weight`,
 1 AS `VehicleProfileCargo_Length`,
 1 AS `VehicleProfileCargo_Width`,
 1 AS `VehicleProfileCapacity_Passengers`,
 1 AS `VehicleProfileCapacity_Luggage`,
 1 AS `VehicleProfileVehicleType`*/;
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
-- Temporary view structure for view `Vi_DPA_Permit`
--

DROP TABLE IF EXISTS `Vi_DPA_Permit`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_Permit`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_Permit` AS SELECT 
 1 AS `Id`,
 1 AS `HUBId`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `VehicleId`,
 1 AS `DriverId`,
 1 AS `ActENUM`,
 1 AS `PermitIssuerId`,
 1 AS `PermitTypeId`,
 1 AS `Code`,
 1 AS `IssuedDate_UTC`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_PermitIssuer`
--

DROP TABLE IF EXISTS `Vi_DPA_PermitIssuer`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_PermitIssuer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_PermitIssuer` AS SELECT 
 1 AS `Id`,
 1 AS `EntityId`,
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
-- Temporary view structure for view `Vi_DPA_PermitIssuerPermitsExtraDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_PermitIssuerPermitsExtraDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_PermitIssuerPermitsExtraDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_PermitIssuerPermitsExtraDetail` AS SELECT 
 1 AS `PermitIssuerId`,
 1 AS `PermitIssuerEntityId`,
 1 AS `PermitIssuerEntityTitle`,
 1 AS `PermitIssuerEntityAddress_fsx`,
 1 AS `PermitIssuerEntityCity`,
 1 AS `PermitIssuerEntityProvince`,
 1 AS `PermitIssuerEntityCountry`,
 1 AS `PermitIssuerEntityPostalCode_fsx`,
 1 AS `PermitIssuerEntityPhone_fsx`,
 1 AS `PermitIssuerEntityFaxNumber_fsx`,
 1 AS `PermitIssuerEntityEmail_fsx`,
 1 AS `PermitIssuerEntityDiscriminator`,
 1 AS `HUBId`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `VehicleId`,
 1 AS `DriverId`,
 1 AS `ActENUM`,
 1 AS `PermitTypeId`,
 1 AS `Code`,
 1 AS `IssuedDate_UTC`,
 1 AS `DriverUserId`,
 1 AS `DriverPersonCVOId`,
 1 AS `DriverFirstname_fsx`,
 1 AS `DriverLastname_fsx`,
 1 AS `DriverUsername`,
 1 AS `DriverEmail_fsx`,
 1 AS `DriverEmail_hash`,
 1 AS `DriverEmailConfirmed`,
 1 AS `DriverCellPhone_fsx`,
 1 AS `DriverCellPhone_hash`,
 1 AS `DriverCellPhoneConfirmed`,
 1 AS `DriverIssuedBy`,
 1 AS `DriverRecordKey`,
 1 AS `DriverCreatedAt_UTC`,
 1 AS `DriverCreatedBy`,
 1 AS `DriverModifiedAt_UTC`,
 1 AS `DriverModifiedBy`,
 1 AS `DriverRecordDeleted`,
 1 AS `EntityScenarioEntityId`,
 1 AS `EntityScenarioScenarioId`,
 1 AS `EntityScenarioTitle`,
 1 AS `EntityScenarioAddress_fsx`,
 1 AS `EntityScenarioCity`,
 1 AS `EntityScenarioProvince`,
 1 AS `EntityScenarioCountry`,
 1 AS `EntityScenarioPostalCode_fsx`,
 1 AS `EntityScenarioPhone_fsx`,
 1 AS `EntityScenarioFaxNumber_fsx`,
 1 AS `EntityScenarioEmail_fsx`,
 1 AS `EntityScenarioDiscriminator`,
 1 AS `VehicleProfilePlate`,
 1 AS `VehicleProfileVIN`,
 1 AS `VehicleProfileMake`,
 1 AS `VehicleProfileModel`,
 1 AS `VehicleProfileProvince`,
 1 AS `VehicleProfileColor`,
 1 AS `VehicleProfileYear`,
 1 AS `VehicleProfileTransportCategory`,
 1 AS `VehicleProfileCargo_Height`,
 1 AS `VehicleProfileCargo_Weight`,
 1 AS `VehicleProfileCargo_Length`,
 1 AS `VehicleProfileCargo_Width`,
 1 AS `VehicleProfileCapacity_Passengers`,
 1 AS `VehicleProfileCapacity_Luggage`,
 1 AS `VehicleProfileVehicleType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_PermitIssuerSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_PermitIssuerSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_PermitIssuerSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_PermitIssuerSummary` AS SELECT 
 1 AS `Id`,
 1 AS `EntityId`,
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
 1 AS `PermitsCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_PermitSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_PermitSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_PermitSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_PermitSummary` AS SELECT 
 1 AS `Id`,
 1 AS `HUBId`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `VehicleId`,
 1 AS `DriverId`,
 1 AS `ActENUM`,
 1 AS `PermitIssuerId`,
 1 AS `PermitTypeId`,
 1 AS `Code`,
 1 AS `IssuedDate_UTC`,
 1 AS `DriverVehicleTypesCount`,
 1 AS `StatusesCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_RollCallSession`
--

DROP TABLE IF EXISTS `Vi_DPA_RollCallSession`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_RollCallSession`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_RollCallSession` AS SELECT 
 1 AS `Id`,
 1 AS `DelegatedDispatchContractId`,
 1 AS `SessionStatus`,
 1 AS `ScopeType`,
 1 AS `ScopeId`,
 1 AS `WindowStart_UTC`,
 1 AS `WindowEnd_UTC`,
 1 AS `SignupClosesAt_UTC`,
 1 AS `ModeType`,
 1 AS `TopXPerZone`,
 1 AS `PrimaryGroupSnapshot`,
 1 AS `StartedAt_UTC`,
 1 AS `ClosedAt_UTC`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_RollCallSessionParticipantsDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_RollCallSessionParticipantsDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_RollCallSessionParticipantsDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_RollCallSessionParticipantsDetail` AS SELECT 
 1 AS `RollCallSessionId`,
 1 AS `RollCallSessionDelegatedDispatchContractId`,
 1 AS `RollCallSessionSessionStatus`,
 1 AS `RollCallSessionScopeType`,
 1 AS `RollCallSessionScopeId`,
 1 AS `RollCallSessionWindowStart_UTC`,
 1 AS `RollCallSessionWindowEnd_UTC`,
 1 AS `RollCallSessionSignupClosesAt_UTC`,
 1 AS `RollCallSessionModeType`,
 1 AS `RollCallSessionTopXPerZone`,
 1 AS `RollCallSessionPrimaryGroupSnapshot`,
 1 AS `RollCallSessionStartedAt_UTC`,
 1 AS `RollCallSessionClosedAt_UTC`,
 1 AS `ParticipantId`,
 1 AS `ActivitySessionId`,
 1 AS `PriorityGroupId`,
 1 AS `SignupAt_UTC`,
 1 AS `SignupOrder`,
 1 AS `RosterState`,
 1 AS `EligibilitySnapshot`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_RollCallSessionSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_RollCallSessionSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_RollCallSessionSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_RollCallSessionSummary` AS SELECT 
 1 AS `Id`,
 1 AS `DelegatedDispatchContractId`,
 1 AS `SessionStatus`,
 1 AS `ScopeType`,
 1 AS `ScopeId`,
 1 AS `WindowStart_UTC`,
 1 AS `WindowEnd_UTC`,
 1 AS `SignupClosesAt_UTC`,
 1 AS `ModeType`,
 1 AS `TopXPerZone`,
 1 AS `PrimaryGroupSnapshot`,
 1 AS `StartedAt_UTC`,
 1 AS `ClosedAt_UTC`,
 1 AS `ParticipantsCount`,
 1 AS `RollCallWavesCount`*/;
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
-- Temporary view structure for view `Vi_DPA_ServiceBase`
--

DROP TABLE IF EXISTS `Vi_DPA_ServiceBase`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_ServiceBase`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_ServiceBase` AS SELECT 
 1 AS `Id`,
 1 AS `ServiceType`,
 1 AS `ServiceClass`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_ServiceBaseSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_ServiceBaseSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_ServiceBaseSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_ServiceBaseSummary` AS SELECT 
 1 AS `Id`,
 1 AS `ServiceType`,
 1 AS `ServiceClass`,
 1 AS `CVOServicesCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportBatch`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportBatch`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportBatch`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportBatch` AS SELECT 
 1 AS `Id`,
 1 AS `FMS_OId`,
 1 AS `DistributorId`,
 1 AS `TotalFareAtDispatch`,
 1 AS `IsEditable`,
 1 AS `IsChargePerItem`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportBatchItemsSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportBatchItemsSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportBatchItemsSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportBatchItemsSuperDetail` AS SELECT 
 1 AS `TransportReqDeliveryId`,
 1 AS `TransportReqDeliveryIsEditable`,
 1 AS `TransportReqDeliveryCustomerId`,
 1 AS `TransportReqDeliveryDistributorId`,
 1 AS `TransportReqDeliveryCVOId`,
 1 AS `TransportReqDeliveryFromContactLocationId`,
 1 AS `TransportReqDeliveryToContactLocationId`,
 1 AS `TransportReqDeliveryPickupAfterDateTime`,
 1 AS `TransportReqDeliveryPickupBeforeDateTime`,
 1 AS `TransportReqDeliveryDropOffAfterDateTime`,
 1 AS `TransportReqDeliveryDropOffBeforeDateTime`,
 1 AS `TransportReqDeliveryVehicleType`,
 1 AS `TransportReqDeliveryVehicleProfileSubType`,
 1 AS `TransportReqDeliveryServiceClass`,
 1 AS `TransportReqDeliveryActionOnAbsentReceiver`,
 1 AS `TransportReqDeliveryComments`,
 1 AS `TransportReqDeliveryFareAtSubmission`,
 1 AS `TransportReqDeliveryPromoCode`,
 1 AS `TransportReqDeliveryStatus`,
 1 AS `BatchId`,
 1 AS `ItemOrder`,
 1 AS `TransportReqRideId`,
 1 AS `Discriminator`,
 1 AS `TransportReqRideIsEditable`,
 1 AS `TransportReqRideCustomerId`,
 1 AS `TransportReqRideDistributorId`,
 1 AS `TransportReqRideCVOId`,
 1 AS `TransportReqRideFromContactLocationId`,
 1 AS `TransportReqRideToContactLocationId`,
 1 AS `TransportReqRidePickupAfterDateTime`,
 1 AS `TransportReqRidePickupBeforeDateTime`,
 1 AS `TransportReqRideDropOffAfterDateTime`,
 1 AS `TransportReqRideDropOffBeforeDateTime`,
 1 AS `TransportReqRideVehicleType`,
 1 AS `TransportReqRideVehicleProfileSubType`,
 1 AS `TransportReqRideServiceClass`,
 1 AS `TransportReqRideTotalRequiredSeats`,
 1 AS `TransportReqRideNumberOfLuggages`,
 1 AS `TransportReqRideFeaturesJSON`,
 1 AS `TransportReqRideComments`,
 1 AS `TransportReqRideFareAtSubmission`,
 1 AS `TransportReqRidePromoCode`,
 1 AS `TransportReqRideHubCarrierInfo`,
 1 AS `TransportReqRideStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportContactLocation`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportContactLocation`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportContactLocation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportContactLocation` AS SELECT 
 1 AS `Id`,
 1 AS `ContactId`,
 1 AS `FavAdrLabel`,
 1 AS `LocationId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportContactLocationSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportContactLocationSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportContactLocationSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportContactLocationSummary` AS SELECT 
 1 AS `Id`,
 1 AS `ContactId`,
 1 AS `FavAdrLabel`,
 1 AS `LocationId`,
 1 AS `TransportReqDeliveriesCount`,
 1 AS `TransportReqRidesCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportContactLocationsSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportContactLocationsSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportContactLocationsSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportContactLocationsSuperDetail` AS SELECT 
 1 AS `TransportContactRegistryId`,
 1 AS `TransportContactRegistryPossibleUserId`,
 1 AS `TransportContactRegistryFirstname_fsx`,
 1 AS `TransportContactRegistryLastname_fsx`,
 1 AS `TransportContactRegistryPossibleEntityId`,
 1 AS `TransportContactRegistryTitle`,
 1 AS `TransportContactRegistryMainLocationId`,
 1 AS `TransportContactRegistryBuzzer`,
 1 AS `TransportContactRegistryLanguage`,
 1 AS `TransportContactRegistryTimeZone`,
 1 AS `TransportContactRegistryCurrency`,
 1 AS `TransportContactRegistrySignatureUri`,
 1 AS `TransportContactRegistryPhotoUri`,
 1 AS `TransportContactRegistryBirthDate_fsx`,
 1 AS `TransportContactRegistryNotification_SMS_fsx`,
 1 AS `TransportContactRegistryNotification_Phone_fsx`,
 1 AS `TransportContactRegistryNotification_Phone_Extention_fsx`,
 1 AS `TransportContactRegistryNotification_Email_fsx`,
 1 AS `TransportContactRegistryNotification_WhatsApp_fsx`,
 1 AS `TransportContactRegistryEntityTitle`,
 1 AS `TransportContactRegistryEntityAddress_fsx`,
 1 AS `TransportContactRegistryEntityCity`,
 1 AS `TransportContactRegistryEntityProvince`,
 1 AS `TransportContactRegistryEntityCountry`,
 1 AS `TransportContactRegistryEntityPostalCode_fsx`,
 1 AS `TransportContactRegistryEntityPhone_fsx`,
 1 AS `TransportContactRegistryEntityFaxNumber_fsx`,
 1 AS `TransportContactRegistryEntityEmail_fsx`,
 1 AS `TransportContactRegistryEntityDiscriminator`,
 1 AS `TransportContactRegistryUserFirstname_fsx`,
 1 AS `TransportContactRegistryUserLastname_fsx`,
 1 AS `TransportContactRegistryUserUsername`,
 1 AS `TransportContactRegistryUserEmail_fsx`,
 1 AS `TransportContactRegistryUserEmail_hash`,
 1 AS `TransportContactRegistryUserEmailConfirmed`,
 1 AS `TransportContactRegistryUserCellPhone_fsx`,
 1 AS `TransportContactRegistryUserCellPhone_hash`,
 1 AS `TransportContactRegistryUserCellPhoneConfirmed`,
 1 AS `TransportContactRegistryUserIssuedBy`,
 1 AS `FavAdrLabel`,
 1 AS `LocationId`,
 1 AS `TransportLocationTitle`,
 1 AS `TransportLocationLatitude`,
 1 AS `TransportLocationLongitude`,
 1 AS `TransportLocationAddress`,
 1 AS `TransportLocationCity`,
 1 AS `TransportLocationProvince`,
 1 AS `TransportLocationPostalCode`,
 1 AS `TransportLocationPlaceId`,
 1 AS `TransportLocationGoogleFullAddress`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportContactRegistriesSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportContactRegistriesSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportContactRegistriesSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportContactRegistriesSuperDetail` AS SELECT 
 1 AS `TransportLocationId`,
 1 AS `TransportLocationTitle`,
 1 AS `TransportLocationLatitude`,
 1 AS `TransportLocationLongitude`,
 1 AS `TransportLocationAddress`,
 1 AS `TransportLocationCity`,
 1 AS `TransportLocationProvince`,
 1 AS `TransportLocationPostalCode`,
 1 AS `TransportLocationPlaceId`,
 1 AS `TransportLocationGoogleFullAddress`,
 1 AS `PossibleUserId`,
 1 AS `Firstname_fsx`,
 1 AS `Lastname_fsx`,
 1 AS `PossibleEntityId`,
 1 AS `Title`,
 1 AS `Buzzer`,
 1 AS `Language`,
 1 AS `TimeZone`,
 1 AS `Currency`,
 1 AS `SignatureUri`,
 1 AS `PhotoUri`,
 1 AS `BirthDate_fsx`,
 1 AS `Notification_SMS_fsx`,
 1 AS `Notification_Phone_fsx`,
 1 AS `Notification_Phone_Extention_fsx`,
 1 AS `Notification_Email_fsx`,
 1 AS `Notification_WhatsApp_fsx`,
 1 AS `UserInfoFirstname_fsx`,
 1 AS `UserInfoLastname_fsx`,
 1 AS `UserInfoUsername`,
 1 AS `UserInfoEmail_fsx`,
 1 AS `UserInfoEmail_hash`,
 1 AS `UserInfoEmailConfirmed`,
 1 AS `UserInfoCellPhone_fsx`,
 1 AS `UserInfoCellPhone_hash`,
 1 AS `UserInfoCellPhoneConfirmed`,
 1 AS `UserInfoIssuedBy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportContactRegistry`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportContactRegistry`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportContactRegistry`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportContactRegistry` AS SELECT 
 1 AS `Id`,
 1 AS `PossibleUserId`,
 1 AS `Firstname_fsx`,
 1 AS `Lastname_fsx`,
 1 AS `PossibleEntityId`,
 1 AS `Title`,
 1 AS `MainLocationId`,
 1 AS `Buzzer`,
 1 AS `Language`,
 1 AS `TimeZone`,
 1 AS `Currency`,
 1 AS `SignatureUri`,
 1 AS `PhotoUri`,
 1 AS `BirthDate_fsx`,
 1 AS `Notification_SMS_fsx`,
 1 AS `Notification_Phone_fsx`,
 1 AS `Notification_Phone_Extention_fsx`,
 1 AS `Notification_Email_fsx`,
 1 AS `Notification_WhatsApp_fsx`,
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
 1 AS `UserFirstname_fsx`,
 1 AS `UserLastname_fsx`,
 1 AS `UserUsername`,
 1 AS `UserEmail_fsx`,
 1 AS `UserEmail_hash`,
 1 AS `UserEmailConfirmed`,
 1 AS `UserCellPhone_fsx`,
 1 AS `UserCellPhone_hash`,
 1 AS `UserCellPhoneConfirmed`,
 1 AS `UserIssuedBy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportContactRegistrySummary`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportContactRegistrySummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportContactRegistrySummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportContactRegistrySummary` AS SELECT 
 1 AS `Id`,
 1 AS `PossibleUserId`,
 1 AS `Firstname_fsx`,
 1 AS `Lastname_fsx`,
 1 AS `PossibleEntityId`,
 1 AS `Title`,
 1 AS `MainLocationId`,
 1 AS `Buzzer`,
 1 AS `Language`,
 1 AS `TimeZone`,
 1 AS `Currency`,
 1 AS `SignatureUri`,
 1 AS `PhotoUri`,
 1 AS `BirthDate_fsx`,
 1 AS `Notification_SMS_fsx`,
 1 AS `Notification_Phone_fsx`,
 1 AS `Notification_Phone_Extention_fsx`,
 1 AS `Notification_Email_fsx`,
 1 AS `Notification_WhatsApp_fsx`,
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
 1 AS `UserFirstname_fsx`,
 1 AS `UserLastname_fsx`,
 1 AS `UserUsername`,
 1 AS `UserEmail_fsx`,
 1 AS `UserEmail_hash`,
 1 AS `UserEmailConfirmed`,
 1 AS `UserCellPhone_fsx`,
 1 AS `UserCellPhone_hash`,
 1 AS `UserCellPhoneConfirmed`,
 1 AS `UserIssuedBy`,
 1 AS `TransportContactLocationsCount`,
 1 AS `TransportCustomerContactsCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportCustomerContactsSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportCustomerContactsSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportCustomerContactsSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportCustomerContactsSuperDetail` AS SELECT 
 1 AS `TransportContactRegistryId`,
 1 AS `TransportContactRegistryPossibleUserId`,
 1 AS `TransportContactRegistryFirstname_fsx`,
 1 AS `TransportContactRegistryLastname_fsx`,
 1 AS `TransportContactRegistryPossibleEntityId`,
 1 AS `TransportContactRegistryTitle`,
 1 AS `TransportContactRegistryMainLocationId`,
 1 AS `TransportContactRegistryBuzzer`,
 1 AS `TransportContactRegistryLanguage`,
 1 AS `TransportContactRegistryTimeZone`,
 1 AS `TransportContactRegistryCurrency`,
 1 AS `TransportContactRegistrySignatureUri`,
 1 AS `TransportContactRegistryPhotoUri`,
 1 AS `TransportContactRegistryBirthDate_fsx`,
 1 AS `TransportContactRegistryNotification_SMS_fsx`,
 1 AS `TransportContactRegistryNotification_Phone_fsx`,
 1 AS `TransportContactRegistryNotification_Phone_Extention_fsx`,
 1 AS `TransportContactRegistryNotification_Email_fsx`,
 1 AS `TransportContactRegistryNotification_WhatsApp_fsx`,
 1 AS `TransportContactRegistryUserFirstname_fsx`,
 1 AS `TransportContactRegistryUserLastname_fsx`,
 1 AS `TransportContactRegistryUserUsername`,
 1 AS `TransportContactRegistryUserEmail_fsx`,
 1 AS `TransportContactRegistryUserEmail_hash`,
 1 AS `TransportContactRegistryUserEmailConfirmed`,
 1 AS `TransportContactRegistryUserCellPhone_fsx`,
 1 AS `TransportContactRegistryUserCellPhone_hash`,
 1 AS `TransportContactRegistryUserCellPhoneConfirmed`,
 1 AS `TransportContactRegistryUserIssuedBy`,
 1 AS `CustomerId`,
 1 AS `TransportCustomerEntityId`,
 1 AS `TransportCustomerUserId`,
 1 AS `TransportCustomerFirstname_fsx`,
 1 AS `TransportCustomerLastname_fsx`,
 1 AS `TransportCustomerUsername`,
 1 AS `TransportCustomerEmail_fsx`,
 1 AS `TransportCustomerEmail_hash`,
 1 AS `TransportCustomerEmailConfirmed`,
 1 AS `TransportCustomerCellPhone_fsx`,
 1 AS `TransportCustomerCellPhone_hash`,
 1 AS `TransportCustomerCellPhoneConfirmed`,
 1 AS `TransportCustomerIssuedBy`,
 1 AS `TransportCustomerRecordKey`,
 1 AS `TransportCustomerCreatedAt_UTC`,
 1 AS `TransportCustomerCreatedBy`,
 1 AS `TransportCustomerModifiedAt_UTC`,
 1 AS `TransportCustomerModifiedBy`,
 1 AS `TransportCustomerRecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportFareBaseInclutionsSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportFareBaseInclutionsSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportFareBaseInclutionsSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportFareBaseInclutionsSuperDetail` AS SELECT 
 1 AS `DistributorId`,
 1 AS `DistributorEntityId`,
 1 AS `DistributorEntityTitle`,
 1 AS `DistributorEntityAddress_fsx`,
 1 AS `DistributorEntityCity`,
 1 AS `DistributorEntityProvince`,
 1 AS `DistributorEntityCountry`,
 1 AS `DistributorEntityPostalCode_fsx`,
 1 AS `DistributorEntityPhone_fsx`,
 1 AS `DistributorEntityFaxNumber_fsx`,
 1 AS `DistributorEntityEmail_fsx`,
 1 AS `DistributorEntityDiscriminator`,
 1 AS `CVOId`,
 1 AS `TransportCategory`,
 1 AS `ServiceCategory`,
 1 AS `VehicleType`,
 1 AS `ServiceClass`,
 1 AS `IncludedSeatCounts`,
 1 AS `IncludedLuggageCounts`,
 1 AS `IncludedParcelCounts`,
 1 AS `IncludedWeightKg`,
 1 AS `IncludedVolumeCubicM`,
 1 AS `CVOEntityId`,
 1 AS `CVOTitle`,
 1 AS `CVOAddress_fsx`,
 1 AS `CVOCity`,
 1 AS `CVOProvince`,
 1 AS `CVOCountry`,
 1 AS `CVOPostalCode_fsx`,
 1 AS `CVOPhone_fsx`,
 1 AS `CVOFaxNumber_fsx`,
 1 AS `CVOEmail_fsx`,
 1 AS `CVODiscriminator`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportFareCalculation`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportFareCalculation`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportFareCalculation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportFareCalculation` AS SELECT 
 1 AS `Id`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `TransportCategory`,
 1 AS `ServiceCategory`,
 1 AS `VehicleType`,
 1 AS `ServiceClass`,
 1 AS `CalculationItem`,
 1 AS `CalculationType`,
 1 AS `CalculateMethod`,
 1 AS `CalculationPriority`,
 1 AS `CalculationUnit`,
 1 AS `UnitAmount`,
 1 AS `Price`,
 1 AS `PriceTable`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportFareCalculationsSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportFareCalculationsSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportFareCalculationsSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportFareCalculationsSuperDetail` AS SELECT 
 1 AS `DistributorId`,
 1 AS `DistributorEntityId`,
 1 AS `DistributorEntityTitle`,
 1 AS `DistributorEntityAddress_fsx`,
 1 AS `DistributorEntityCity`,
 1 AS `DistributorEntityProvince`,
 1 AS `DistributorEntityCountry`,
 1 AS `DistributorEntityPostalCode_fsx`,
 1 AS `DistributorEntityPhone_fsx`,
 1 AS `DistributorEntityFaxNumber_fsx`,
 1 AS `DistributorEntityEmail_fsx`,
 1 AS `DistributorEntityDiscriminator`,
 1 AS `CVOId`,
 1 AS `TransportCategory`,
 1 AS `ServiceCategory`,
 1 AS `VehicleType`,
 1 AS `ServiceClass`,
 1 AS `CalculationItem`,
 1 AS `CalculationType`,
 1 AS `CalculateMethod`,
 1 AS `CalculationPriority`,
 1 AS `CalculationUnit`,
 1 AS `UnitAmount`,
 1 AS `Price`,
 1 AS `PriceTable`,
 1 AS `CVOEntityId`,
 1 AS `CVOTitle`,
 1 AS `CVOAddress_fsx`,
 1 AS `CVOCity`,
 1 AS `CVOProvince`,
 1 AS `CVOCountry`,
 1 AS `CVOPostalCode_fsx`,
 1 AS `CVOPhone_fsx`,
 1 AS `CVOFaxNumber_fsx`,
 1 AS `CVOEmail_fsx`,
 1 AS `CVODiscriminator`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportGeoFenceBase`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportGeoFenceBase`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportGeoFenceBase`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportGeoFenceBase` AS SELECT 
 1 AS `Id`,
 1 AS `Code`,
 1 AS `Title`,
 1 AS `Coordinates`,
 1 AS `Order`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportLocation`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportLocation`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportLocation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportLocation` AS SELECT 
 1 AS `Id`,
 1 AS `Title`,
 1 AS `Latitude`,
 1 AS `Longitude`,
 1 AS `Address`,
 1 AS `City`,
 1 AS `Province`,
 1 AS `PostalCode`,
 1 AS `PlaceId`,
 1 AS `GoogleFullAddress`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportLocationSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportLocationSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportLocationSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportLocationSummary` AS SELECT 
 1 AS `Id`,
 1 AS `Title`,
 1 AS `Latitude`,
 1 AS `Longitude`,
 1 AS `Address`,
 1 AS `City`,
 1 AS `Province`,
 1 AS `PostalCode`,
 1 AS `PlaceId`,
 1 AS `GoogleFullAddress`,
 1 AS `TransportContactLocationsCount`,
 1 AS `TransportContactRegistryCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportReqDeliveriesSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportReqDeliveriesSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportReqDeliveriesSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportReqDeliveriesSuperDetail` AS SELECT 
 1 AS `DistributorId`,
 1 AS `DistributorEntityId`,
 1 AS `DistributorEntityTitle`,
 1 AS `DistributorEntityAddress_fsx`,
 1 AS `DistributorEntityCity`,
 1 AS `DistributorEntityProvince`,
 1 AS `DistributorEntityCountry`,
 1 AS `DistributorEntityPostalCode_fsx`,
 1 AS `DistributorEntityPhone_fsx`,
 1 AS `DistributorEntityFaxNumber_fsx`,
 1 AS `DistributorEntityEmail_fsx`,
 1 AS `DistributorEntityDiscriminator`,
 1 AS `IsEditable`,
 1 AS `CustomerId`,
 1 AS `CVOId`,
 1 AS `FromContactLocationId`,
 1 AS `ToContactLocationId`,
 1 AS `PickupAfterDateTime`,
 1 AS `PickupAfterDateTime_UTC`,
 1 AS `PickupBeforeDateTime`,
 1 AS `PickupBeforeDateTime_UTC`,
 1 AS `DropOffAfterDateTime`,
 1 AS `DropOffAfterDateTime_UTC`,
 1 AS `DropOffBeforeDateTime`,
 1 AS `DropOffBeforeDateTime_UTC`,
 1 AS `VehicleType`,
 1 AS `VehicleProfileSubType`,
 1 AS `ServiceClass`,
 1 AS `ActionOnAbsentReceiver`,
 1 AS `Comments`,
 1 AS `FareAtSubmission`,
 1 AS `PromoCode`,
 1 AS `PaymentCategory`,
 1 AS `PaymentMethod`,
 1 AS `PaidAt_UTC`,
 1 AS `Status`,
 1 AS `TransportContactLocationContactId`,
 1 AS `TransportContactLocationFavAdrLabel`,
 1 AS `TransportContactLocationLocationId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportReqDelivery`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportReqDelivery`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportReqDelivery`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportReqDelivery` AS SELECT 
 1 AS `Id`,
 1 AS `IsEditable`,
 1 AS `CustomerId`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `FromContactLocationId`,
 1 AS `ToContactLocationId`,
 1 AS `PickupAfterDateTime`,
 1 AS `PickupBeforeDateTime`,
 1 AS `DropOffAfterDateTime`,
 1 AS `DropOffBeforeDateTime`,
 1 AS `VehicleType`,
 1 AS `VehicleProfileSubType`,
 1 AS `ServiceClass`,
 1 AS `ActionOnAbsentReceiver`,
 1 AS `Comments`,
 1 AS `FareAtSubmission`,
 1 AS `PromoCode`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportReqDeliveryGoodsSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportReqDeliveryGoodsSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportReqDeliveryGoodsSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportReqDeliveryGoodsSuperDetail` AS SELECT 
 1 AS `TransportReqDeliveryId`,
 1 AS `TransportReqDeliveryIsEditable`,
 1 AS `TransportReqDeliveryCustomerId`,
 1 AS `TransportReqDeliveryDistributorId`,
 1 AS `TransportReqDeliveryCVOId`,
 1 AS `TransportReqDeliveryFromContactLocationId`,
 1 AS `TransportReqDeliveryToContactLocationId`,
 1 AS `TransportReqDeliveryPickupAfterDateTime`,
 1 AS `TransportReqDeliveryPickupBeforeDateTime`,
 1 AS `TransportReqDeliveryDropOffAfterDateTime`,
 1 AS `TransportReqDeliveryDropOffBeforeDateTime`,
 1 AS `TransportReqDeliveryVehicleType`,
 1 AS `TransportReqDeliveryVehicleProfileSubType`,
 1 AS `TransportReqDeliveryServiceClass`,
 1 AS `TransportReqDeliveryActionOnAbsentReceiver`,
 1 AS `TransportReqDeliveryComments`,
 1 AS `TransportReqDeliveryFareAtSubmission`,
 1 AS `TransportReqDeliveryPromoCode`,
 1 AS `TransportReqDeliveryStatus`,
 1 AS `CustomerGoodId`,
 1 AS `TransportCustomerMasterGoodCode`,
 1 AS `TransportCustomerMasterGoodTitle`,
 1 AS `TransportCustomerMasterGoodDescription`,
 1 AS `TransportCustomerMasterGoodCustomerId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportReqDeliverySummary`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportReqDeliverySummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportReqDeliverySummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportReqDeliverySummary` AS SELECT 
 1 AS `Id`,
 1 AS `IsEditable`,
 1 AS `CustomerId`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `FromContactLocationId`,
 1 AS `ToContactLocationId`,
 1 AS `PickupAfterDateTime`,
 1 AS `PickupBeforeDateTime`,
 1 AS `DropOffAfterDateTime`,
 1 AS `DropOffBeforeDateTime`,
 1 AS `VehicleType`,
 1 AS `VehicleProfileSubType`,
 1 AS `ServiceClass`,
 1 AS `ActionOnAbsentReceiver`,
 1 AS `Comments`,
 1 AS `FareAtSubmission`,
 1 AS `PromoCode`,
 1 AS `Status`,
 1 AS `TransportBatchItemsCount`,
 1 AS `GoodsCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportReqRide`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportReqRide`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportReqRide`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportReqRide` AS SELECT 
 1 AS `Id`,
 1 AS `IsEditable`,
 1 AS `CustomerId`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `FromContactLocationId`,
 1 AS `ToContactLocationId`,
 1 AS `PickupAfterDateTime`,
 1 AS `PickupBeforeDateTime`,
 1 AS `DropOffAfterDateTime`,
 1 AS `DropOffBeforeDateTime`,
 1 AS `VehicleType`,
 1 AS `VehicleProfileSubType`,
 1 AS `ServiceClass`,
 1 AS `TotalRequiredSeats`,
 1 AS `NumberOfLuggages`,
 1 AS `FeaturesJSON`,
 1 AS `Comments`,
 1 AS `FareAtSubmission`,
 1 AS `PromoCode`,
 1 AS `HubCarrierInfo`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportReqRidePassengersSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportReqRidePassengersSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportReqRidePassengersSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportReqRidePassengersSuperDetail` AS SELECT 
 1 AS `TransportReqRideId`,
 1 AS `TransportReqRideIsEditable`,
 1 AS `TransportReqRideCustomerId`,
 1 AS `TransportReqRideDistributorId`,
 1 AS `TransportReqRideCVOId`,
 1 AS `TransportReqRideFromContactLocationId`,
 1 AS `TransportReqRideToContactLocationId`,
 1 AS `TransportReqRidePickupAfterDateTime`,
 1 AS `TransportReqRidePickupBeforeDateTime`,
 1 AS `TransportReqRideDropOffAfterDateTime`,
 1 AS `TransportReqRideDropOffBeforeDateTime`,
 1 AS `TransportReqRideVehicleType`,
 1 AS `TransportReqRideVehicleProfileSubType`,
 1 AS `TransportReqRideServiceClass`,
 1 AS `TransportReqRideTotalRequiredSeats`,
 1 AS `TransportReqRideNumberOfLuggages`,
 1 AS `TransportReqRideFeaturesJSON`,
 1 AS `TransportReqRideComments`,
 1 AS `TransportReqRideFareAtSubmission`,
 1 AS `TransportReqRidePromoCode`,
 1 AS `TransportReqRideHubCarrierInfo`,
 1 AS `TransportReqRideStatus`,
 1 AS `PassengerId`,
 1 AS `TransportCustomerContactContactId`,
 1 AS `TransportCustomerContactCustomerId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportReqRideSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportReqRideSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportReqRideSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportReqRideSummary` AS SELECT 
 1 AS `Id`,
 1 AS `IsEditable`,
 1 AS `CustomerId`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `FromContactLocationId`,
 1 AS `ToContactLocationId`,
 1 AS `PickupAfterDateTime`,
 1 AS `PickupBeforeDateTime`,
 1 AS `DropOffAfterDateTime`,
 1 AS `DropOffBeforeDateTime`,
 1 AS `VehicleType`,
 1 AS `VehicleProfileSubType`,
 1 AS `ServiceClass`,
 1 AS `TotalRequiredSeats`,
 1 AS `NumberOfLuggages`,
 1 AS `FeaturesJSON`,
 1 AS `Comments`,
 1 AS `FareAtSubmission`,
 1 AS `PromoCode`,
 1 AS `HubCarrierInfo`,
 1 AS `Status`,
 1 AS `TransportBatchItemsCount`,
 1 AS `PassengersCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportReqRidesSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportReqRidesSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportReqRidesSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportReqRidesSuperDetail` AS SELECT 
 1 AS `DistributorId`,
 1 AS `DistributorEntityId`,
 1 AS `DistributorEntityTitle`,
 1 AS `DistributorEntityAddress_fsx`,
 1 AS `DistributorEntityCity`,
 1 AS `DistributorEntityProvince`,
 1 AS `DistributorEntityCountry`,
 1 AS `DistributorEntityPostalCode_fsx`,
 1 AS `DistributorEntityPhone_fsx`,
 1 AS `DistributorEntityFaxNumber_fsx`,
 1 AS `DistributorEntityEmail_fsx`,
 1 AS `DistributorEntityDiscriminator`,
 1 AS `IsEditable`,
 1 AS `CustomerId`,
 1 AS `CVOId`,
 1 AS `FromContactLocationId`,
 1 AS `ToContactLocationId`,
 1 AS `PickupAfterDateTime`,
 1 AS `PickupAfterDateTime_UTC`,
 1 AS `PickupBeforeDateTime`,
 1 AS `PickupBeforeDateTime_UTC`,
 1 AS `DropOffAfterDateTime`,
 1 AS `DropOffAfterDateTime_UTC`,
 1 AS `DropOffBeforeDateTime`,
 1 AS `DropOffBeforeDateTime_UTC`,
 1 AS `VehicleType`,
 1 AS `VehicleProfileSubType`,
 1 AS `ServiceClass`,
 1 AS `ServiceCategory`,
 1 AS `TotalRequiredSeats`,
 1 AS `NumberOfLuggages`,
 1 AS `FeaturesJSON`,
 1 AS `Comments`,
 1 AS `FareAtSubmission`,
 1 AS `PromoCode`,
 1 AS `PaymentCategory`,
 1 AS `PaymentMethod`,
 1 AS `PaidAt_UTC`,
 1 AS `HubCarrierInfo`,
 1 AS `Status`,
 1 AS `TransportContactLocationContactId`,
 1 AS `TransportContactLocationFavAdrLabel`,
 1 AS `TransportContactLocationLocationId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportTransact`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportTransact`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportTransact`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportTransact` AS SELECT 
 1 AS `Id`,
 1 AS `FMS_OvId`,
 1 AS `BatchId`,
 1 AS `PickupZoneId`,
 1 AS `CVOId`,
 1 AS `VehicleId`,
 1 AS `DriverId`,
 1 AS `CurrentStatus`,
 1 AS `OfferType`,
 1 AS `PaidTripFare`,
 1 AS `PaidAddonFee`,
 1 AS `AppliedDiscount`,
 1 AS `PaidTip`,
 1 AS `PaidToll`,
 1 AS `ActualTotalFareAtTripEnd`,
 1 AS `DriverAgreedFareAmount`,
 1 AS `EnforceItemsCreationSequense`,
 1 AS `PaymentTransactionNumber`,
 1 AS `ExtraData`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_TransportTransactsSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_TransportTransactsSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportTransactsSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_TransportTransactsSuperDetail` AS SELECT 
 1 AS `CVOId`,
 1 AS `CVOEntityId`,
 1 AS `CVOEntityTitle`,
 1 AS `CVOEntityAddress_fsx`,
 1 AS `CVOEntityCity`,
 1 AS `CVOEntityProvince`,
 1 AS `CVOEntityCountry`,
 1 AS `CVOEntityPostalCode_fsx`,
 1 AS `CVOEntityPhone_fsx`,
 1 AS `CVOEntityFaxNumber_fsx`,
 1 AS `CVOEntityEmail_fsx`,
 1 AS `CVOEntityDiscriminator`,
 1 AS `FMS_OvId`,
 1 AS `BatchId`,
 1 AS `PickupZoneId`,
 1 AS `VehicleId`,
 1 AS `DriverId`,
 1 AS `CurrentStatus`,
 1 AS `OfferType`,
 1 AS `PaidTripFare`,
 1 AS `PaidAddonFee`,
 1 AS `AppliedDiscount`,
 1 AS `PaidTip`,
 1 AS `PaidToll`,
 1 AS `ActualTotalFareAtTripEnd`,
 1 AS `DriverAgreedFareAmount`,
 1 AS `EnforceItemsCreationSequense`,
 1 AS `PaymentTransactionNumber`,
 1 AS `ExtraData`,
 1 AS `TransportBatchFMS_OId`,
 1 AS `TransportBatchDistributorId`,
 1 AS `TransportBatchTotalFareAtDispatch`,
 1 AS `TransportBatchFarePortionAmount_CVO`,
 1 AS `TransportBatchFarePortionAmount_Distributor`,
 1 AS `TransportBatchFarePortionAmount_Driver`,
 1 AS `TransportBatchAllowedDiscountPercent`,
 1 AS `TransportBatchIsEditable`,
 1 AS `TransportBatchIsChargePerItem`*/;
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
 1 AS `UserInfoEmail_hash`,
 1 AS `UserInfoEmailConfirmed`,
 1 AS `UserInfoCellPhone_fsx`,
 1 AS `UserInfoCellPhone_hash`,
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
 1 AS `UserInfoEmail_hash`,
 1 AS `UserInfoEmailConfirmed`,
 1 AS `UserInfoCellPhone_fsx`,
 1 AS `UserInfoCellPhone_hash`,
 1 AS `UserInfoCellPhoneConfirmed`,
 1 AS `UserInfoIssuedBy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_Vehicle`
--

DROP TABLE IF EXISTS `Vi_DPA_Vehicle`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_Vehicle`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_Vehicle` AS SELECT 
 1 AS `Id`,
 1 AS `Plate`,
 1 AS `VIN`,
 1 AS `Make`,
 1 AS `Model`,
 1 AS `Province`,
 1 AS `Color`,
 1 AS `Year`,
 1 AS `TransportCategory`,
 1 AS `Cargo_Height`,
 1 AS `Cargo_Weight`,
 1 AS `Cargo_Length`,
 1 AS `Cargo_Width`,
 1 AS `Capacity_Passengers`,
 1 AS `Capacity_Luggage`,
 1 AS `VehicleType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_VehicleDriversSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_VehicleDriversSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_VehicleDriversSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_VehicleDriversSuperDetail` AS SELECT 
 1 AS `VehicleProfileId`,
 1 AS `VehicleProfilePlate`,
 1 AS `VehicleProfileVIN`,
 1 AS `VehicleProfileMake`,
 1 AS `VehicleProfileModel`,
 1 AS `VehicleProfileProvince`,
 1 AS `VehicleProfileColor`,
 1 AS `VehicleProfileYear`,
 1 AS `VehicleProfileTransportCategory`,
 1 AS `VehicleProfileCargo_Height`,
 1 AS `VehicleProfileCargo_Weight`,
 1 AS `VehicleProfileCargo_Length`,
 1 AS `VehicleProfileCargo_Width`,
 1 AS `VehicleProfileCapacity_Passengers`,
 1 AS `VehicleProfileCapacity_Luggage`,
 1 AS `VehicleProfileVehicleType`,
 1 AS `DriverId`,
 1 AS `HasRule`,
 1 AS `IssuedDate_UTC`,
 1 AS `ExpiryDate_UTC`,
 1 AS `DriverUserId`,
 1 AS `DriverPersonCVOId`,
 1 AS `DriverFirstname_fsx`,
 1 AS `DriverLastname_fsx`,
 1 AS `DriverUsername`,
 1 AS `DriverEmail_fsx`,
 1 AS `DriverEmail_hash`,
 1 AS `DriverEmailConfirmed`,
 1 AS `DriverCellPhone_fsx`,
 1 AS `DriverCellPhone_hash`,
 1 AS `DriverCellPhoneConfirmed`,
 1 AS `DriverIssuedBy`,
 1 AS `DriverRecordKey`,
 1 AS `DriverCreatedAt_UTC`,
 1 AS `DriverCreatedBy`,
 1 AS `DriverModifiedAt_UTC`,
 1 AS `DriverModifiedBy`,
 1 AS `DriverRecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_VehicleFeaturesSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_VehicleFeaturesSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_VehicleFeaturesSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_VehicleFeaturesSuperDetail` AS SELECT 
 1 AS `FeatureId`,
 1 AS `FeatureTitle`,
 1 AS `VehicleId`,
 1 AS `HasRule`,
 1 AS `IssuedDate_UTC`,
 1 AS `ExpiryDate_UTC`,
 1 AS `VehicleProfilePlate`,
 1 AS `VehicleProfileVIN`,
 1 AS `VehicleProfileMake`,
 1 AS `VehicleProfileModel`,
 1 AS `VehicleProfileProvince`,
 1 AS `VehicleProfileColor`,
 1 AS `VehicleProfileYear`,
 1 AS `VehicleProfileTransportCategory`,
 1 AS `VehicleProfileCargo_Height`,
 1 AS `VehicleProfileCargo_Weight`,
 1 AS `VehicleProfileCargo_Length`,
 1 AS `VehicleProfileCargo_Width`,
 1 AS `VehicleProfileCapacity_Passengers`,
 1 AS `VehicleProfileCapacity_Luggage`,
 1 AS `VehicleProfileVehicleType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_VehicleProfile`
--

DROP TABLE IF EXISTS `Vi_DPA_VehicleProfile`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_VehicleProfile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_VehicleProfile` AS SELECT 
 1 AS `Id`,
 1 AS `Plate`,
 1 AS `VIN`,
 1 AS `Make`,
 1 AS `Model`,
 1 AS `Province`,
 1 AS `Color`,
 1 AS `Year`,
 1 AS `TransportCategory`,
 1 AS `Cargo_Height`,
 1 AS `Cargo_Weight`,
 1 AS `Cargo_Length`,
 1 AS `Cargo_Width`,
 1 AS `Capacity_Passengers`,
 1 AS `Capacity_Luggage`,
 1 AS `VehicleType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_VehicleProfilePermitsExtraDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_VehicleProfilePermitsExtraDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_VehicleProfilePermitsExtraDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_VehicleProfilePermitsExtraDetail` AS SELECT 
 1 AS `VehicleProfileId`,
 1 AS `VehicleProfilePlate`,
 1 AS `VehicleProfileVIN`,
 1 AS `VehicleProfileMake`,
 1 AS `VehicleProfileModel`,
 1 AS `VehicleProfileProvince`,
 1 AS `VehicleProfileColor`,
 1 AS `VehicleProfileYear`,
 1 AS `VehicleProfileTransportCategory`,
 1 AS `VehicleProfileCargo_Height`,
 1 AS `VehicleProfileCargo_Weight`,
 1 AS `VehicleProfileCargo_Length`,
 1 AS `VehicleProfileCargo_Width`,
 1 AS `VehicleProfileCapacity_Passengers`,
 1 AS `VehicleProfileCapacity_Luggage`,
 1 AS `VehicleProfileVehicleType`,
 1 AS `HUBId`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `DriverId`,
 1 AS `ActENUM`,
 1 AS `PermitIssuerId`,
 1 AS `PermitTypeId`,
 1 AS `Code`,
 1 AS `IssuedDate_UTC`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_ZoneBase`
--

DROP TABLE IF EXISTS `Vi_DPA_ZoneBase`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_ZoneBase`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_ZoneBase` AS SELECT 
 1 AS `Id`,
 1 AS `Code`,
 1 AS `Title`,
 1 AS `Description`,
 1 AS `ZoneType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_ZoneGeofencesSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_ZoneGeofencesSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_ZoneGeofencesSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_ZoneGeofencesSuperDetail` AS SELECT 
 1 AS `TransportGeoFenceBaseId`,
 1 AS `TransportGeoFenceBaseCode`,
 1 AS `TransportGeoFenceBaseTitle`,
 1 AS `TransportGeoFenceBaseCoordinates`,
 1 AS `ZoneId`,
 1 AS `ZoneBaseCode`,
 1 AS `ZoneBaseTitle`,
 1 AS `ZoneBaseDescription`,
 1 AS `ZoneBaseZoneType`*/;
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
-- Temporary view structure for view `Vi_DPC_BatchReqRidesDetail`
--

DROP TABLE IF EXISTS `Vi_DPC_BatchReqRidesDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_BatchReqRidesDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_BatchReqRidesDetail` AS SELECT 
 1 AS `BatchId`,
 1 AS `ItemOrder`,
 1 AS `TransportReqRideId`,
 1 AS `IsEditable`,
 1 AS `IsReadOnly`,
 1 AS `FromContactLocationId`,
 1 AS `ToContactLocationId`,
 1 AS `TransportRequestStatusENUM`,
 1 AS `TransportRequestStatusTitle`,
 1 AS `ContactId`,
 1 AS `ServiceCategory`,
 1 AS `ServiceClass`,
 1 AS `VehicleType`,
 1 AS `CVOId`,
 1 AS `DistributorId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_CVO`
--

DROP TABLE IF EXISTS `Vi_DPC_CVO`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_CVO`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_CVO` AS SELECT 
 1 AS `Id`,
 1 AS `EntityId`,
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
-- Temporary view structure for view `Vi_DPC_ClientEntityPermittedActs`
--

DROP TABLE IF EXISTS `Vi_DPC_ClientEntityPermittedActs`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_ClientEntityPermittedActs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_ClientEntityPermittedActs` AS SELECT 
 1 AS `ClientEntityId`,
 1 AS `PermittedActENUM`,
 1 AS `Id`,
 1 AS `ActTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_ContactLocations`
--

DROP TABLE IF EXISTS `Vi_DPC_ContactLocations`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_ContactLocations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_ContactLocations` AS SELECT 
 1 AS `Id`,
 1 AS `FavAdrLabel`,
 1 AS `ContactId`,
 1 AS `LocationId`,
 1 AS `Title`,
 1 AS `Latitude`,
 1 AS `Longitude`,
 1 AS `Address`,
 1 AS `LocationCity`,
 1 AS `Province`,
 1 AS `PostalCode`,
 1 AS `PlaceId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_CvoVehicleTypes`
--

DROP TABLE IF EXISTS `Vi_DPC_CvoVehicleTypes`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_CvoVehicleTypes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_CvoVehicleTypes` AS SELECT 
 1 AS `CVOId`,
 1 AS `VehicleType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_Distributor`
--

DROP TABLE IF EXISTS `Vi_DPC_Distributor`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_Distributor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_Distributor` AS SELECT 
 1 AS `Id`,
 1 AS `EntityId`,
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
-- Temporary view structure for view `Vi_DPC_DistributorCVOs`
--

DROP TABLE IF EXISTS `Vi_DPC_DistributorCVOs`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_DistributorCVOs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_DistributorCVOs` AS SELECT 
 1 AS `DistributorId`,
 1 AS `DistributorEntityId`,
 1 AS `DistributorEntityTitle`,
 1 AS `CVOId`,
 1 AS `CVOEntityId`,
 1 AS `CVOEntityTitle`,
 1 AS `CVOServiceId`,
 1 AS `ServiceCategory`,
 1 AS `ServiceType`,
 1 AS `ServiceClass`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_DistributorCVOsDetail`
--

DROP TABLE IF EXISTS `Vi_DPC_DistributorCVOsDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_DistributorCVOsDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_DistributorCVOsDetail` AS SELECT 
 1 AS `Id`,
 1 AS `DistributorId`,
 1 AS `DistributorEntityId`,
 1 AS `DistributorEntityTitle`,
 1 AS `CvoId`,
 1 AS `CvoEntityId`,
 1 AS `CvoEntityTitle`,
 1 AS `CvoServiceId`,
 1 AS `ServiceCategory`,
 1 AS `ServiceType`,
 1 AS `ServiceClass`,
 1 AS `VehicleType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_ENUM_ActivityClasses`
--

DROP TABLE IF EXISTS `Vi_DPC_ENUM_ActivityClasses`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_ENUM_ActivityClasses`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_ENUM_ActivityClasses` AS SELECT 
 1 AS `Id`,
 1 AS `ENUM`,
 1 AS `Title`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_ENUM_Actors`
--

DROP TABLE IF EXISTS `Vi_DPC_ENUM_Actors`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_ENUM_Actors`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_ENUM_Actors` AS SELECT 
 1 AS `Id`,
 1 AS `ENUM`,
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
-- Temporary view structure for view `Vi_DPC_EntityRoleSummary`
--

DROP TABLE IF EXISTS `Vi_DPC_EntityRoleSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_EntityRoleSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_EntityRoleSummary` AS SELECT 
 1 AS `Id`,
 1 AS `Title`,
 1 AS `EntityId`,
 1 AS `ActENUM`,
 1 AS `ActorTitle`,
 1 AS `IsReadOnly`,
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
-- Temporary view structure for view `Vi_DPC_ReqRideDestinationContactLocation`
--

DROP TABLE IF EXISTS `Vi_DPC_ReqRideDestinationContactLocation`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_ReqRideDestinationContactLocation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_ReqRideDestinationContactLocation` AS SELECT 
 1 AS `Id`,
 1 AS `ContactId`,
 1 AS `LocationId`,
 1 AS `FavAdrLabel`,
 1 AS `Title`,
 1 AS `Latitude`,
 1 AS `Longitude`,
 1 AS `Address`,
 1 AS `LocationCity`,
 1 AS `Province`,
 1 AS `PostalCode`,
 1 AS `PlaceId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_ReqRidePassengers`
--

DROP TABLE IF EXISTS `Vi_DPC_ReqRidePassengers`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_ReqRidePassengers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_ReqRidePassengers` AS SELECT 
 1 AS `ReqRideId`,
 1 AS `CustomerId`,
 1 AS `VehicleTitle`,
 1 AS `VehicleType`,
 1 AS `ServiceClassTitle`,
 1 AS `ServiceClass`,
 1 AS `PassengerId`,
 1 AS `ContactId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_ReqRideSourceContactLocation`
--

DROP TABLE IF EXISTS `Vi_DPC_ReqRideSourceContactLocation`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_ReqRideSourceContactLocation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_ReqRideSourceContactLocation` AS SELECT 
 1 AS `Id`,
 1 AS `ContactId`,
 1 AS `LocationId`,
 1 AS `FavAdrLabel`,
 1 AS `Title`,
 1 AS `Latitude`,
 1 AS `Longitude`,
 1 AS `Address`,
 1 AS `LocationCity`,
 1 AS `Province`,
 1 AS `PostalCode`,
 1 AS `PlaceId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_TransportAddons`
--

DROP TABLE IF EXISTS `Vi_DPC_TransportAddons`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportAddons`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_TransportAddons` AS SELECT 
 1 AS `Id`,
 1 AS `CalculationItemTitle`,
 1 AS `CalculationUnitTitle`,
 1 AS `CalculateMethodTitle`,
 1 AS `UnitAmount`,
 1 AS `Price`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `CalculationItem`,
 1 AS `CalculationUnit`,
 1 AS `TransportCategory`,
 1 AS `ServiceCategory`,
 1 AS `VehicleType`,
 1 AS `ServiceClass`,
 1 AS `CalculationType`,
 1 AS `CalculateMethod`,
 1 AS `CalculationPriority`,
 1 AS `PriceTable`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_TransportBatchItemsDetail`
--

DROP TABLE IF EXISTS `Vi_DPC_TransportBatchItemsDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportBatchItemsDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_TransportBatchItemsDetail` AS SELECT 
 1 AS `Id`,
 1 AS `BatchId`,
 1 AS `BatchIsEditable`,
 1 AS `DistributorId`,
 1 AS `TotalFareAtDispatch`,
 1 AS `ItemId`,
 1 AS `ItemOrder`,
 1 AS `Discriminator`,
 1 AS `IsRide`,
 1 AS `ReqRideId`,
 1 AS `ReqRideIsEditable`,
 1 AS `ReqRideStatus`,
 1 AS `ReqDeliveryId`,
 1 AS `ReqDeliveryIsEditable`,
 1 AS `ReqDeliveryStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_TransportContactRegistry`
--

DROP TABLE IF EXISTS `Vi_DPC_TransportContactRegistry`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportContactRegistry`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_TransportContactRegistry` AS SELECT 
 1 AS `Id`,
 1 AS `PossibleUserId`,
 1 AS `Firstname_fsx`,
 1 AS `Lastname_fsx`,
 1 AS `PossibleEntityId`,
 1 AS `Title`,
 1 AS `MainLocationId`,
 1 AS `Buzzer`,
 1 AS `Language`,
 1 AS `TimeZone`,
 1 AS `Currency`,
 1 AS `SignatureUri`,
 1 AS `PhotoUri`,
 1 AS `BirthDate_fsx`,
 1 AS `Notification_SMS_fsx`,
 1 AS `Notification_Phone_fsx`,
 1 AS `Notification_Phone_Extention_fsx`,
 1 AS `Notification_Email_fsx`,
 1 AS `Notification_WhatsApp_fsx`,
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
 1 AS `UserFirstname_fsx`,
 1 AS `UserLastname_fsx`,
 1 AS `UserUsername`,
 1 AS `UserEmail_fsx`,
 1 AS `UserEmail_hash`,
 1 AS `UserEmailConfirmed`,
 1 AS `UserCellPhone_fsx`,
 1 AS `UserCellPhone_hash`,
 1 AS `UserCellPhoneConfirmed`,
 1 AS `UserIssuedBy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_TransportContactRegistryLastRecord`
--

DROP TABLE IF EXISTS `Vi_DPC_TransportContactRegistryLastRecord`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportContactRegistryLastRecord`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_TransportContactRegistryLastRecord` AS SELECT 
 1 AS `Id`,
 1 AS `PossibleUserId`,
 1 AS `Firstname_fsx`,
 1 AS `Lastname_fsx`,
 1 AS `PossibleEntityId`,
 1 AS `Title`,
 1 AS `MainLocationId`,
 1 AS `Buzzer`,
 1 AS `Language`,
 1 AS `TimeZone`,
 1 AS `Currency`,
 1 AS `SignatureUri`,
 1 AS `PhotoUri`,
 1 AS `BirthDate_fsx`,
 1 AS `Notification_SMS_fsx`,
 1 AS `Notification_Phone_fsx`,
 1 AS `Notification_Phone_Extention_fsx`,
 1 AS `Notification_Email_fsx`,
 1 AS `Notification_WhatsApp_fsx`,
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
 1 AS `UserFirstname_fsx`,
 1 AS `UserLastname_fsx`,
 1 AS `UserUsername`,
 1 AS `UserEmail_fsx`,
 1 AS `UserEmail_hash`,
 1 AS `UserEmailConfirmed`,
 1 AS `UserCellPhone_fsx`,
 1 AS `UserCellPhone_hash`,
 1 AS `UserCellPhoneConfirmed`,
 1 AS `UserIssuedBy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_TransportCustomerContactsDetail`
--

DROP TABLE IF EXISTS `Vi_DPC_TransportCustomerContactsDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportCustomerContactsDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_TransportCustomerContactsDetail` AS SELECT 
 1 AS `Id`,
 1 AS `CustomerId`,
 1 AS `ContactId`,
 1 AS `PossibleUserId`,
 1 AS `Firstname_fsx`,
 1 AS `Lastname_fsx`,
 1 AS `PossibleEntityId`,
 1 AS `Title`,
 1 AS `MainLocationId`,
 1 AS `Buzzer`,
 1 AS `Language`,
 1 AS `TimeZone`,
 1 AS `Currency`,
 1 AS `SignatureUri`,
 1 AS `PhotoUri`,
 1 AS `BirthDate_fsx`,
 1 AS `Notification_SMS_fsx`,
 1 AS `Notification_Phone_fsx`,
 1 AS `Notification_Phone_Extention_fsx`,
 1 AS `Notification_Email_fsx`,
 1 AS `Notification_WhatsApp_fsx`,
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
 1 AS `UserFirstname_fsx`,
 1 AS `UserLastname_fsx`,
 1 AS `UserUsername`,
 1 AS `UserEmail_fsx`,
 1 AS `UserEmail_hash`,
 1 AS `UserEmailConfirmed`,
 1 AS `UserCellPhone_fsx`,
 1 AS `UserCellPhone_hash`,
 1 AS `UserCellPhoneConfirmed`,
 1 AS `UserIssuedBy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_TransportCustomers`
--

DROP TABLE IF EXISTS `Vi_DPC_TransportCustomers`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportCustomers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_TransportCustomers` AS SELECT 
 1 AS `Id`,
 1 AS `CustomerType`,
 1 AS `UserOrEntityId`,
 1 AS `TransportCustomerFirstname_fsx`,
 1 AS `TransportCustomerLastname_fsx`,
 1 AS `TransportCustomerTitle`,
 1 AS `TransportCustomerPhone_fsx`,
 1 AS `TransportCustomerEmail_fsx`,
 1 AS `RecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_TransportCustomersSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPC_TransportCustomersSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportCustomersSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_TransportCustomersSuperDetail` AS SELECT 
 1 AS `CustomerId`,
 1 AS `EntityId`,
 1 AS `EntityTitle`,
 1 AS `EntityAddress_fsx`,
 1 AS `EntityPhone`,
 1 AS `EntityEmail_fsx`,
 1 AS `UserId`,
 1 AS `UserFirstname_fsx`,
 1 AS `UserLastname_fsx`,
 1 AS `UserEmail_fsx`,
 1 AS `UserCellPhone_fsx`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_TransportReqRideAddons`
--

DROP TABLE IF EXISTS `Vi_DPC_TransportReqRideAddons`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportReqRideAddons`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_TransportReqRideAddons` AS SELECT 
 1 AS `Id`,
 1 AS `TransportReqRideId`,
 1 AS `CalculationItem`,
 1 AS `CalculationItemTitle`,
 1 AS `CalculationUnit`,
 1 AS `CalculationUnitTitle`,
 1 AS `Amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_TransportReqRideSummary`
--

DROP TABLE IF EXISTS `Vi_DPC_TransportReqRideSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportReqRideSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_TransportReqRideSummary` AS SELECT 
 1 AS `TransportReqRideId`,
 1 AS `TransportReqRideIsEditable`,
 1 AS `TransportReqRideCustomerId`,
 1 AS `CustomerType`,
 1 AS `TransportCustomerTitle`,
 1 AS `TransportCustomerFirstname_fsx`,
 1 AS `TransportCustomerLastname_Fsx`,
 1 AS `TransportCustomerPhone_fsx`,
 1 AS `BatchId`,
 1 AS `ItemOrder`,
 1 AS `Discriminator`,
 1 AS `DistributorId`,
 1 AS `DistributorTitle`,
 1 AS `CVOId`,
 1 AS `CVOTitle`,
 1 AS `FromContactLocationId`,
 1 AS `FromContactLocationFavAdrLabel`,
 1 AS `FromContactLocationTitle`,
 1 AS `FromContactLocationLatitude`,
 1 AS `FromContactLocationLongitude`,
 1 AS `FromContactLocationAddress`,
 1 AS `FromContactLocationCity`,
 1 AS `FromContactLocationProvince`,
 1 AS `FromContactLocationPostalCode`,
 1 AS `FromContactLocationPlaceId`,
 1 AS `ToContactLocationId`,
 1 AS `ToContactLocationFavAdrLabel`,
 1 AS `ToContactLocationTitle`,
 1 AS `ToContactLocationLatitude`,
 1 AS `ToContactLocationLongitude`,
 1 AS `ToContactLocationAddress`,
 1 AS `ToContactLocationCity`,
 1 AS `ToContactLocationProvince`,
 1 AS `ToContactLocationPostalCode`,
 1 AS `ToContactLocationPlaceId`,
 1 AS `PickupAfterDateTime`,
 1 AS `PickupBeforeDateTime`,
 1 AS `DropOffAfterDateTime`,
 1 AS `DropOffBeforeDateTime`,
 1 AS `VehicleType`,
 1 AS `VehicleTypeTitle`,
 1 AS `VehicleProfileSubType`,
 1 AS `ServiceClass`,
 1 AS `ServiceClassTitle`,
 1 AS `TotalRequiredSeats`,
 1 AS `NumberOfLuggages`,
 1 AS `featuresJSON`,
 1 AS `Comments`,
 1 AS `FareAtSubmission`,
 1 AS `PromoCode`,
 1 AS `HubCarrierInfo`,
 1 AS `TransportReqRideStatus`,
 1 AS `TransportReqRideStatusTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_TransportReqRideUnifiedBase`
--

DROP TABLE IF EXISTS `Vi_DPC_TransportReqRideUnifiedBase`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportReqRideUnifiedBase`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_TransportReqRideUnifiedBase` AS SELECT 
 1 AS `Count`,
 1 AS `CustomerId`,
 1 AS `ReqOrBatch`,
 1 AS `ReqOrBatchTag`,
 1 AS `CaseId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_TransportReqRides`
--

DROP TABLE IF EXISTS `Vi_DPC_TransportReqRides`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportReqRides`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_TransportReqRides` AS SELECT 
 1 AS `Id`,
 1 AS `IsEditable`,
 1 AS `CustomerId`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `FromContactLocationId`,
 1 AS `ToContactLocationId`,
 1 AS `PickupAfterDateTime`,
 1 AS `PickupAfterDateTime_UTC`,
 1 AS `PickupBeforeDateTime`,
 1 AS `PickupBeforeDateTime_UTC`,
 1 AS `DropOffAfterDateTime`,
 1 AS `DropOffAfterDateTime_UTC`,
 1 AS `DropOffBeforeDateTime`,
 1 AS `DropOffBeforeDateTime_UTC`,
 1 AS `VehicleType`,
 1 AS `VehicleProfileSubType`,
 1 AS `ServiceClass`,
 1 AS `ServiceCategory`,
 1 AS `TotalRequiredSeats`,
 1 AS `NumberOfLuggages`,
 1 AS `FeaturesJSON`,
 1 AS `Comments`,
 1 AS `FareAtSubmission`,
 1 AS `PromoCode`,
 1 AS `PaymentCategory`,
 1 AS `PaymentMethod`,
 1 AS `PaidAt_UTC`,
 1 AS `HubCarrierInfo`,
 1 AS `Status`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `ServiceClassTitle`,
 1 AS `VehicleTypeTitle`,
 1 AS `IsReadOnly`,
 1 AS `CVOTitle`,
 1 AS `ServiceCategoryTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_TransportRideReservationUnified`
--

DROP TABLE IF EXISTS `Vi_DPC_TransportRideReservationUnified`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportRideReservationUnified`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_TransportRideReservationUnified` AS SELECT 
 1 AS `IsEditable`,
 1 AS `Count`,
 1 AS `CustomerId`,
 1 AS `ReqOrBatch`,
 1 AS `ReqOrBatchTag`,
 1 AS `CaseId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_TransportRideReservations`
--

DROP TABLE IF EXISTS `Vi_DPC_TransportRideReservations`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportRideReservations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_TransportRideReservations` AS SELECT 
 1 AS `BatchId`,
 1 AS `ReservationStatus`,
 1 AS `IsReadOnly`,
 1 AS `CustomerId`,
 1 AS `NumberOfRides`,
 1 AS `ReservedAt`,
 1 AS `FromLocationTitle`,
 1 AS `FromLocationAddress`,
 1 AS `ToLocationTitle`,
 1 AS `ToLocationAddress`,
 1 AS `VehicleType`,
 1 AS `VehicleProfileSubType`,
 1 AS `ServiceClass`,
 1 AS `PickupAfterDateTime`,
 1 AS `PickupBeforeDateTime`,
 1 AS `DropOffAfterDateTime`,
 1 AS `DropOffBeforeDateTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_UserEntityRoleDetail`
--

DROP TABLE IF EXISTS `Vi_DPC_UserEntityRoleDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_UserEntityRoleDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_UserEntityRoleDetail` AS SELECT 
 1 AS `EntityId`,
 1 AS `EntityTitle`,
 1 AS `RoleId`,
 1 AS `RoleTitle`,
 1 AS `UserId`,
 1 AS `ActEnum`,
 1 AS `ActTitle`,
 1 AS `IsReadOnly`*/;
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
-- Temporary view structure for view `Vi_SPC_ActorConfigListSummary`
--

DROP TABLE IF EXISTS `Vi_SPC_ActorConfigListSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_ActorConfigListSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_ActorConfigListSummary` AS SELECT 
 1 AS `Id`,
 1 AS `EntityId`,
 1 AS `VehicleId`,
 1 AS `UserId`,
 1 AS `ActENUM`,
 1 AS `ScenarioId`,
 1 AS `ConfigBaseId`,
 1 AS `Value`,
 1 AS `IsOverridable`,
 1 AS `Signature`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `ScenarioTitle`,
 1 AS `ConfigBaseCode`,
 1 AS `Firstname_fsx`,
 1 AS `Lastname_fsx`,
 1 AS `Username`,
 1 AS `Email_fsx`,
 1 AS `CellPhone_fsx`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_ActorConfigProfile`
--

DROP TABLE IF EXISTS `Vi_SPC_ActorConfigProfile`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_ActorConfigProfile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_ActorConfigProfile` AS SELECT 
 1 AS `Id`,
 1 AS `EntityId`,
 1 AS `VehicleId`,
 1 AS `UserId`,
 1 AS `ActENUM`,
 1 AS `ScenarioId`,
 1 AS `ConfigBaseId`,
 1 AS `Value`,
 1 AS `IsOverridable`,
 1 AS `Signature`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `ScenarioTitle`,
 1 AS `ConfigBaseCode`,
 1 AS `Firstname_fsx`,
 1 AS `Lastname_fsx`,
 1 AS `Username`,
 1 AS `Email_fsx`,
 1 AS `CellPhone_fsx`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_AppClientListSummary`
--

DROP TABLE IF EXISTS `Vi_SPC_AppClientListSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_AppClientListSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_AppClientListSummary` AS SELECT 
 1 AS `Id`,
 1 AS `Title`,
 1 AS `ClientId`,
 1 AS `AppTypeId`,
 1 AS `IsInactive`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `AppTypeTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_AppClientProfile`
--

DROP TABLE IF EXISTS `Vi_SPC_AppClientProfile`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_AppClientProfile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_AppClientProfile` AS SELECT 
 1 AS `Id`,
 1 AS `Title`,
 1 AS `ClientId`,
 1 AS `AppTypeId`,
 1 AS `IsInactive`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `AppTypeTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_AppTypeListSummary`
--

DROP TABLE IF EXISTS `Vi_SPC_AppTypeListSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_AppTypeListSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_AppTypeListSummary` AS SELECT 
 1 AS `Id`,
 1 AS `Code`,
 1 AS `Title`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `PermissionsCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_AppTypePermissions`
--

DROP TABLE IF EXISTS `Vi_SPC_AppTypePermissions`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_AppTypePermissions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_AppTypePermissions` AS SELECT 
 1 AS `Id`,
 1 AS `AppTypeId`,
 1 AS `AppPermissionId`,
 1 AS `Signature`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `AppTypeTitle`,
 1 AS `AppPermissionTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_BatchListSummary`
--

DROP TABLE IF EXISTS `Vi_SPC_BatchListSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_BatchListSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_BatchListSummary` AS SELECT 
 1 AS `Id`,
 1 AS `FMS_OId`,
 1 AS `DistributorId`,
 1 AS `TotalFareAtDispatch`,
 1 AS `FarePortionAmount_CVO`,
 1 AS `FarePortionAmount_Distributor`,
 1 AS `FarePortionAmount_Driver`,
 1 AS `AllowedDiscountPercent`,
 1 AS `IsEditable`,
 1 AS `IsChargePerItem`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `DistributorTitle`,
 1 AS `ItemsCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_BatchProfile`
--

DROP TABLE IF EXISTS `Vi_SPC_BatchProfile`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_BatchProfile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_BatchProfile` AS SELECT 
 1 AS `Id`,
 1 AS `FMS_OId`,
 1 AS `DistributorId`,
 1 AS `TotalFareAtDispatch`,
 1 AS `FarePortionAmount_CVO`,
 1 AS `FarePortionAmount_Distributor`,
 1 AS `FarePortionAmount_Driver`,
 1 AS `AllowedDiscountPercent`,
 1 AS `IsEditable`,
 1 AS `IsChargePerItem`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `DistributorTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_ContactLocationListSummary`
--

DROP TABLE IF EXISTS `Vi_SPC_ContactLocationListSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_ContactLocationListSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_ContactLocationListSummary` AS SELECT 
 1 AS `Id`,
 1 AS `ContactId`,
 1 AS `FavAdrLabel`,
 1 AS `LocationId`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `LocationTitle`,
 1 AS `ContactTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_ContactLocationProfile`
--

DROP TABLE IF EXISTS `Vi_SPC_ContactLocationProfile`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_ContactLocationProfile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_ContactLocationProfile` AS SELECT 
 1 AS `Id`,
 1 AS `ContactId`,
 1 AS `FavAdrLabel`,
 1 AS `LocationId`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `LocationTitle`,
 1 AS `ContactTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_CustomerContact`
--

DROP TABLE IF EXISTS `Vi_SPC_CustomerContact`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_CustomerContact`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_CustomerContact` AS SELECT 
 1 AS `Id`,
 1 AS `PossibleUserId`,
 1 AS `Firstname_fsx`,
 1 AS `Lastname_fsx`,
 1 AS `PossibleEntityId`,
 1 AS `Title`,
 1 AS `MainLocationId`,
 1 AS `Buzzer`,
 1 AS `Language`,
 1 AS `TimeZone`,
 1 AS `Currency`,
 1 AS `SignatureUri`,
 1 AS `PhotoUri`,
 1 AS `BirthDate_fsx`,
 1 AS `Notification_SMS_fsx`,
 1 AS `Notification_Phone_fsx`,
 1 AS `Notification_Phone_Extention_fsx`,
 1 AS `Notification_Email_fsx`,
 1 AS `Notification_WhatsApp_fsx`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `PossibleUserFirstname_fsx`,
 1 AS `PossibleUserLastname_fsx`,
 1 AS `Username`,
 1 AS `Email_fsx`,
 1 AS `CellPhone_fsx`,
 1 AS `PossibleEntityTitle`,
 1 AS `MainLocationTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_CustomerContacts`
--

DROP TABLE IF EXISTS `Vi_SPC_CustomerContacts`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_CustomerContacts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_CustomerContacts` AS SELECT 
 1 AS `Id`,
 1 AS `ContactId`,
 1 AS `CustomerId`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `ContactTitle`,
 1 AS `CustomerTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_CustomerDistributorCustomers`
--

DROP TABLE IF EXISTS `Vi_SPC_CustomerDistributorCustomers`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_CustomerDistributorCustomers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_CustomerDistributorCustomers` AS SELECT 
 1 AS `Id`,
 1 AS `DistributorId`,
 1 AS `CustomerId`,
 1 AS `IssuedDate_UTC`,
 1 AS `ExpiryDate_UTC`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `CustomerTitle`,
 1 AS `DistributorTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_CustomerListSummary`
--

DROP TABLE IF EXISTS `Vi_SPC_CustomerListSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_CustomerListSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_CustomerListSummary` AS SELECT 
 1 AS `Id`,
 1 AS `EntityId`,
 1 AS `UserId`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `Firstname_fsx`,
 1 AS `Lastname_fsx`,
 1 AS `Username`,
 1 AS `Email_fsx`,
 1 AS `CellPhone_fsx`,
 1 AS `EntityTitle`,
 1 AS `ContactsCount`,
 1 AS `MasterGoodsCount`,
 1 AS `DistributorCustomersCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_CustomerMasterGoods`
--

DROP TABLE IF EXISTS `Vi_SPC_CustomerMasterGoods`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_CustomerMasterGoods`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_CustomerMasterGoods` AS SELECT 
 1 AS `Id`,
 1 AS `Code`,
 1 AS `Title`,
 1 AS `Description`,
 1 AS `CustomerId`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `CustomerTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_CustomerProfile`
--

DROP TABLE IF EXISTS `Vi_SPC_CustomerProfile`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_CustomerProfile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_CustomerProfile` AS SELECT 
 1 AS `Id`,
 1 AS `EntityId`,
 1 AS `UserId`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `Firstname_fsx`,
 1 AS `Lastname_fsx`,
 1 AS `Username`,
 1 AS `Email_fsx`,
 1 AS `CellPhone_fsx`,
 1 AS `EntityTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_DeliveryListSummary`
--

DROP TABLE IF EXISTS `Vi_SPC_DeliveryListSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DeliveryListSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_DeliveryListSummary` AS SELECT 
 1 AS `Id`,
 1 AS `IsEditable`,
 1 AS `CustomerId`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `FromContactLocationId`,
 1 AS `ToContactLocationId`,
 1 AS `PickupAfterDateTime`,
 1 AS `PickupAfterDateTime_UTC`,
 1 AS `PickupBeforeDateTime`,
 1 AS `PickupBeforeDateTime_UTC`,
 1 AS `DropOffAfterDateTime`,
 1 AS `DropOffAfterDateTime_UTC`,
 1 AS `DropOffBeforeDateTime`,
 1 AS `DropOffBeforeDateTime_UTC`,
 1 AS `VehicleType`,
 1 AS `VehicleProfileSubType`,
 1 AS `ServiceClass`,
 1 AS `ActionOnAbsentReceiver`,
 1 AS `Comments`,
 1 AS `FareAtSubmission`,
 1 AS `PromoCode`,
 1 AS `PaymentCategory`,
 1 AS `PaymentMethod`,
 1 AS `PaidAt_UTC`,
 1 AS `Status`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `DistributorTitle`,
 1 AS `CVOTitle`,
 1 AS `CustomerTitle`,
 1 AS `BatchItemsCount`,
 1 AS `ReqDeliveryAddonsCount`,
 1 AS `ReqDeliveryGoodsCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_DeliveryProfile`
--

DROP TABLE IF EXISTS `Vi_SPC_DeliveryProfile`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DeliveryProfile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_DeliveryProfile` AS SELECT 
 1 AS `Id`,
 1 AS `IsEditable`,
 1 AS `CustomerId`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `FromContactLocationId`,
 1 AS `ToContactLocationId`,
 1 AS `PickupAfterDateTime`,
 1 AS `PickupAfterDateTime_UTC`,
 1 AS `PickupBeforeDateTime`,
 1 AS `PickupBeforeDateTime_UTC`,
 1 AS `DropOffAfterDateTime`,
 1 AS `DropOffAfterDateTime_UTC`,
 1 AS `DropOffBeforeDateTime`,
 1 AS `DropOffBeforeDateTime_UTC`,
 1 AS `VehicleType`,
 1 AS `VehicleProfileSubType`,
 1 AS `ServiceClass`,
 1 AS `ActionOnAbsentReceiver`,
 1 AS `Comments`,
 1 AS `FareAtSubmission`,
 1 AS `PromoCode`,
 1 AS `PaymentCategory`,
 1 AS `PaymentMethod`,
 1 AS `PaidAt_UTC`,
 1 AS `Status`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `DistributorTitle`,
 1 AS `CVOTitle`,
 1 AS `CustomerTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_DeliveryReqDeliveryGoods`
--

DROP TABLE IF EXISTS `Vi_SPC_DeliveryReqDeliveryGoods`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DeliveryReqDeliveryGoods`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_DeliveryReqDeliveryGoods` AS SELECT 
 1 AS `Id`,
 1 AS `ReqDeliveryId`,
 1 AS `CustomerGoodId`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `CustomerGoodTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_DispatchListSummary`
--

DROP TABLE IF EXISTS `Vi_SPC_DispatchListSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DispatchListSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_DispatchListSummary` AS SELECT 
 1 AS `Id`,
 1 AS `FMS_OvId`,
 1 AS `BatchId`,
 1 AS `PickupZoneId`,
 1 AS `CVOId`,
 1 AS `VehicleId`,
 1 AS `DriverId`,
 1 AS `CurrentStatus`,
 1 AS `OfferType`,
 1 AS `PaidTripFare`,
 1 AS `PaidAddonFee`,
 1 AS `AppliedDiscount`,
 1 AS `PaidTip`,
 1 AS `PaidToll`,
 1 AS `ActualTotalFareAtTripEnd`,
 1 AS `DriverAgreedFareAmount`,
 1 AS `EnforceItemsCreationSequense`,
 1 AS `PaymentTransactionNumber`,
 1 AS `ExtraData`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `CVOTitle`,
 1 AS `PickupZoneTitle`,
 1 AS `TransactItemsCount`,
 1 AS `TransactStagesCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_DispatchProfile`
--

DROP TABLE IF EXISTS `Vi_SPC_DispatchProfile`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DispatchProfile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_DispatchProfile` AS SELECT 
 1 AS `Id`,
 1 AS `FMS_OvId`,
 1 AS `BatchId`,
 1 AS `PickupZoneId`,
 1 AS `CVOId`,
 1 AS `VehicleId`,
 1 AS `DriverId`,
 1 AS `CurrentStatus`,
 1 AS `OfferType`,
 1 AS `PaidTripFare`,
 1 AS `PaidAddonFee`,
 1 AS `AppliedDiscount`,
 1 AS `PaidTip`,
 1 AS `PaidToll`,
 1 AS `ActualTotalFareAtTripEnd`,
 1 AS `DriverAgreedFareAmount`,
 1 AS `EnforceItemsCreationSequense`,
 1 AS `PaymentTransactionNumber`,
 1 AS `ExtraData`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `CVOTitle`,
 1 AS `PickupZoneTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_DistributorCustomers`
--

DROP TABLE IF EXISTS `Vi_SPC_DistributorCustomers`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DistributorCustomers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_DistributorCustomers` AS SELECT 
 1 AS `Id`,
 1 AS `DistributorId`,
 1 AS `CustomerId`,
 1 AS `IssuedDate_UTC`,
 1 AS `ExpiryDate_UTC`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `CustomerTitle`,
 1 AS `DistributorTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_FareBaseInclutionListSummary`
--

DROP TABLE IF EXISTS `Vi_SPC_FareBaseInclutionListSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_FareBaseInclutionListSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_FareBaseInclutionListSummary` AS SELECT 
 1 AS `Id`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `TransportCategory`,
 1 AS `ServiceCategory`,
 1 AS `VehicleType`,
 1 AS `ServiceClass`,
 1 AS `IncludedSeatCounts`,
 1 AS `IncludedLuggageCounts`,
 1 AS `IncludedParcelCounts`,
 1 AS `IncludedWeightKg`,
 1 AS `IncludedVolumeCubicM`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `CVOTitle`,
 1 AS `DistributorTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_FareBaseInclutionProfile`
--

DROP TABLE IF EXISTS `Vi_SPC_FareBaseInclutionProfile`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_FareBaseInclutionProfile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_FareBaseInclutionProfile` AS SELECT 
 1 AS `Id`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `TransportCategory`,
 1 AS `ServiceCategory`,
 1 AS `VehicleType`,
 1 AS `ServiceClass`,
 1 AS `IncludedSeatCounts`,
 1 AS `IncludedLuggageCounts`,
 1 AS `IncludedParcelCounts`,
 1 AS `IncludedWeightKg`,
 1 AS `IncludedVolumeCubicM`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `CVOTitle`,
 1 AS `DistributorTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_FareByGeoFenceListSummary`
--

DROP TABLE IF EXISTS `Vi_SPC_FareByGeoFenceListSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_FareByGeoFenceListSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_FareByGeoFenceListSummary` AS SELECT 
 1 AS `Id`,
 1 AS `TransportFareCalculationId`,
 1 AS `SourceGeoFenceBaseId`,
 1 AS `DestinationGeoFenceBaseId`,
 1 AS `BaseFare`,
 1 AS `DestinationGeoFenceBaseTitle`,
 1 AS `SourceGeoFenceBaseTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_FareByGeoFenceProfile`
--

DROP TABLE IF EXISTS `Vi_SPC_FareByGeoFenceProfile`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_FareByGeoFenceProfile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_FareByGeoFenceProfile` AS SELECT 
 1 AS `Id`,
 1 AS `TransportFareCalculationId`,
 1 AS `SourceGeoFenceBaseId`,
 1 AS `DestinationGeoFenceBaseId`,
 1 AS `BaseFare`,
 1 AS `DestinationGeoFenceBaseTitle`,
 1 AS `SourceGeoFenceBaseTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_FareByZoneListSummary`
--

DROP TABLE IF EXISTS `Vi_SPC_FareByZoneListSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_FareByZoneListSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_FareByZoneListSummary` AS SELECT 
 1 AS `Id`,
 1 AS `TransportFareCalculationId`,
 1 AS `SourceGeoFenceBaseId`,
 1 AS `DestinationGeoFenceBaseId`,
 1 AS `BaseFare`,
 1 AS `DestinationGeoFenceBaseTitle`,
 1 AS `SourceGeoFenceBaseTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_FareByZoneProfile`
--

DROP TABLE IF EXISTS `Vi_SPC_FareByZoneProfile`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_FareByZoneProfile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_FareByZoneProfile` AS SELECT 
 1 AS `Id`,
 1 AS `TransportFareCalculationId`,
 1 AS `SourceGeoFenceBaseId`,
 1 AS `DestinationGeoFenceBaseId`,
 1 AS `BaseFare`,
 1 AS `DestinationGeoFenceBaseTitle`,
 1 AS `SourceGeoFenceBaseTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_FareCalculationListSummary`
--

DROP TABLE IF EXISTS `Vi_SPC_FareCalculationListSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_FareCalculationListSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_FareCalculationListSummary` AS SELECT 
 1 AS `Id`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `TransportCategory`,
 1 AS `ServiceCategory`,
 1 AS `VehicleType`,
 1 AS `ServiceClass`,
 1 AS `CalculationItem`,
 1 AS `CalculationType`,
 1 AS `CalculateMethod`,
 1 AS `CalculationPriority`,
 1 AS `CalculationUnit`,
 1 AS `UnitAmount`,
 1 AS `Price`,
 1 AS `PriceTable`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `DistributorTitle`,
 1 AS `CVOTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_FareCalculationProfile`
--

DROP TABLE IF EXISTS `Vi_SPC_FareCalculationProfile`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_FareCalculationProfile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_FareCalculationProfile` AS SELECT 
 1 AS `Id`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `TransportCategory`,
 1 AS `ServiceCategory`,
 1 AS `VehicleType`,
 1 AS `ServiceClass`,
 1 AS `CalculationItem`,
 1 AS `CalculationType`,
 1 AS `CalculateMethod`,
 1 AS `CalculationPriority`,
 1 AS `CalculationUnit`,
 1 AS `UnitAmount`,
 1 AS `Price`,
 1 AS `PriceTable`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `DistributorTitle`,
 1 AS `CVOTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_GlobalConfigListSummary`
--

DROP TABLE IF EXISTS `Vi_SPC_GlobalConfigListSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_GlobalConfigListSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_GlobalConfigListSummary` AS SELECT 
 1 AS `Id`,
 1 AS `ConfigBaseId`,
 1 AS `Value`,
 1 AS `IsOverridable`,
 1 AS `Signature`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `ConfigBaseCode`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_GlobalConfigProfile`
--

DROP TABLE IF EXISTS `Vi_SPC_GlobalConfigProfile`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_GlobalConfigProfile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_GlobalConfigProfile` AS SELECT 
 1 AS `Id`,
 1 AS `ConfigBaseId`,
 1 AS `Value`,
 1 AS `IsOverridable`,
 1 AS `Signature`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `ConfigBaseCode`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_RideListSummary`
--

DROP TABLE IF EXISTS `Vi_SPC_RideListSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_RideListSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_RideListSummary` AS SELECT 
 1 AS `Id`,
 1 AS `IsEditable`,
 1 AS `CustomerId`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `FromContactLocationId`,
 1 AS `ToContactLocationId`,
 1 AS `PickupAfterDateTime`,
 1 AS `PickupAfterDateTime_UTC`,
 1 AS `PickupBeforeDateTime`,
 1 AS `PickupBeforeDateTime_UTC`,
 1 AS `DropOffAfterDateTime`,
 1 AS `DropOffAfterDateTime_UTC`,
 1 AS `DropOffBeforeDateTime`,
 1 AS `DropOffBeforeDateTime_UTC`,
 1 AS `VehicleType`,
 1 AS `VehicleProfileSubType`,
 1 AS `ServiceClass`,
 1 AS `ServiceCategory`,
 1 AS `TotalRequiredSeats`,
 1 AS `NumberOfLuggages`,
 1 AS `FeaturesJSON`,
 1 AS `Comments`,
 1 AS `FareAtSubmission`,
 1 AS `PromoCode`,
 1 AS `PaymentCategory`,
 1 AS `PaymentMethod`,
 1 AS `PaidAt_UTC`,
 1 AS `HubCarrierInfo`,
 1 AS `Status`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `CVOTitle`,
 1 AS `CustomerTitle`,
 1 AS `DistributorTitle`,
 1 AS `BatchItemsCount`,
 1 AS `ReqRideAddonsCount`,
 1 AS `ReqRidePassengersCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_RideProfile`
--

DROP TABLE IF EXISTS `Vi_SPC_RideProfile`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_RideProfile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_RideProfile` AS SELECT 
 1 AS `Id`,
 1 AS `IsEditable`,
 1 AS `CustomerId`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `FromContactLocationId`,
 1 AS `ToContactLocationId`,
 1 AS `PickupAfterDateTime`,
 1 AS `PickupAfterDateTime_UTC`,
 1 AS `PickupBeforeDateTime`,
 1 AS `PickupBeforeDateTime_UTC`,
 1 AS `DropOffAfterDateTime`,
 1 AS `DropOffAfterDateTime_UTC`,
 1 AS `DropOffBeforeDateTime`,
 1 AS `DropOffBeforeDateTime_UTC`,
 1 AS `VehicleType`,
 1 AS `VehicleProfileSubType`,
 1 AS `ServiceClass`,
 1 AS `ServiceCategory`,
 1 AS `TotalRequiredSeats`,
 1 AS `NumberOfLuggages`,
 1 AS `FeaturesJSON`,
 1 AS `Comments`,
 1 AS `FareAtSubmission`,
 1 AS `PromoCode`,
 1 AS `PaymentCategory`,
 1 AS `PaymentMethod`,
 1 AS `PaidAt_UTC`,
 1 AS `HubCarrierInfo`,
 1 AS `Status`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `CVOTitle`,
 1 AS `CustomerTitle`,
 1 AS `DistributorTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_ScenarioDataMap`
--

DROP TABLE IF EXISTS `Vi_SPC_ScenarioDataMap`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_ScenarioDataMap`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_ScenarioDataMap` AS SELECT 
 1 AS `Id`,
 1 AS `ScenarioId`,
 1 AS `TargetActENUM`,
 1 AS `PermitTableName`,
 1 AS `PermitEntityFieldName`,
 1 AS `SourceDataType`,
 1 AS `EntityId`,
 1 AS `BaseTableName`,
 1 AS `JoinerActENUM`,
 1 AS `JoinerFieldName`,
 1 AS `JoiningTableName`,
 1 AS `TargetFieldName`,
 1 AS `CachedQuerySQL`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `ScenarioTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_ScenarioEntityScenarios`
--

DROP TABLE IF EXISTS `Vi_SPC_ScenarioEntityScenarios`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_ScenarioEntityScenarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_ScenarioEntityScenarios` AS SELECT 
 1 AS `Id`,
 1 AS `EntityId`,
 1 AS `PermittedActENUM`,
 1 AS `ScenarioId`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `ScenarioTitle`,
 1 AS `EntityTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_ScenarioListSummary`
--

DROP TABLE IF EXISTS `Vi_SPC_ScenarioListSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_ScenarioListSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_ScenarioListSummary` AS SELECT 
 1 AS `Id`,
 1 AS `Description`,
 1 AS `ActivityClassENUM`,
 1 AS `ClientEntityId`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `ClientEntityTitle`,
 1 AS `EntityScenariosCount`,
 1 AS `DataMapCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_ScenarioProfile`
--

DROP TABLE IF EXISTS `Vi_SPC_ScenarioProfile`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_ScenarioProfile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_ScenarioProfile` AS SELECT 
 1 AS `Id`,
 1 AS `Description`,
 1 AS `ActivityClassENUM`,
 1 AS `ClientEntityId`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `ClientEntityTitle`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `_ActivitySessions`
--

DROP TABLE IF EXISTS `_ActivitySessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ActivitySessions` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DriverId` bigint unsigned NOT NULL,
  `VehicleId` bigint unsigned NOT NULL,
  `ServiceCategory` tinyint unsigned NOT NULL,
  `DriverIdAtHub` int unsigned DEFAULT NULL,
  `VehicleIdAtHub` int unsigned DEFAULT NULL,
  `VehicleCodeAtHub` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParticipationCategory` tinyint unsigned DEFAULT NULL,
  `StartAt_UTC` datetime NOT NULL,
  `StartReason` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CurrentStatus` bigint unsigned NOT NULL,
  `LastPuls_UTC` datetime DEFAULT NULL,
  `EndAt_UTC` datetime DEFAULT NULL,
  `EndReason` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CVOId` bigint unsigned NOT NULL,
  `DistributorId` bigint unsigned NOT NULL,
  `HUBId` bigint unsigned DEFAULT NULL,
  `ClientInfoId` bigint unsigned DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT NULL,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UX_ActivitySessions_OpenDriver` ((if((`EndAt_UTC` is null),`DriverId`,NULL))),
  UNIQUE KEY `UX_ActivitySessions_OpenVehicle` ((if((`EndAt_UTC` is null),`VehicleId`,NULL))),
  KEY `DriverId` (`DriverId`),
  KEY `idx_ActivitySessions_CVOId` (`CVOId`),
  KEY `idx_ActivitySessions_DistributorId` (`DistributorId`),
  KEY `idx_ActivitySessions_HUBId` (`HUBId`),
  KEY `idx_ActivitySessions_ClientInfoId` (`ClientInfoId`),
  KEY `idx_ActivitySessions_vehicle_end_start` (`VehicleId`,`EndAt_UTC`,`StartAt_UTC`),
  KEY `idx_ActivitySessions_CurrentStatus` (`CurrentStatus`),
  CONSTRAINT `_ActivitySessions_ibfk_1` FOREIGN KEY (`DriverId`) REFERENCES `H_Synced_Drivers` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `_ActivitySessions_ibfk_2` FOREIGN KEY (`VehicleId`) REFERENCES `H_Synced_VehicleProfile` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `_ActivitySessions_ibfk_3` FOREIGN KEY (`CVOId`) REFERENCES `H_Synced_CVOs` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `_ActivitySessions_ibfk_4` FOREIGN KEY (`DistributorId`) REFERENCES `H_Synced_Distributors` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `_ActivitySessions_ibfk_5` FOREIGN KEY (`HUBId`) REFERENCES `H_Synced_HUBs` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `_ActivitySessions_ibfk_6` FOREIGN KEY (`ClientInfoId`) REFERENCES `_ClientDeviceInfo` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3595 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_ActivitySessionsViolations`
--

DROP TABLE IF EXISTS `_ActivitySessionsViolations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ActivitySessionsViolations` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ActivitySessionId` bigint unsigned NOT NULL,
  `ViolationStart_UTC` datetime NOT NULL,
  `ViolationStatus` bigint unsigned NOT NULL,
  `ViolationType` bigint unsigned NOT NULL,
  `ViolationEnd_UTC` datetime DEFAULT NULL,
  `ViolationNote` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT NULL,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ActivitySessionId` (`ActivitySessionId`),
  CONSTRAINT `_ActivitySessionsViolations_ibfk_1` FOREIGN KEY (`ActivitySessionId`) REFERENCES `_ActivitySessions` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_ActivityStatusLog`
--

DROP TABLE IF EXISTS `_ActivityStatusLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ActivityStatusLog` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Timestamp_UTC` datetime NOT NULL,
  `ActivitySessionId` bigint unsigned NOT NULL,
  `Status` bigint unsigned NOT NULL,
  `StatusNote` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_ActivityStatusLog_session_ts` (`ActivitySessionId`,`Timestamp_UTC`),
  CONSTRAINT `_ActivityStatusLog_ibfk_1` FOREIGN KEY (`ActivitySessionId`) REFERENCES `_ActivitySessions` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AgentJobLocks`
--

DROP TABLE IF EXISTS `_AgentJobLocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_AgentJobLocks` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `JobKey` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PartitionKey` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `LockedByAppClientId` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LockedByInstanceId` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LockAcquiredAt_UTC` datetime NOT NULL,
  `LockExpiresAt_UTC` datetime NOT NULL,
  `HeartbeatAt_UTC` datetime DEFAULT NULL,
  `Attempts` int unsigned NOT NULL DEFAULT '0',
  `StateJson` json DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ux_Job_Partition` (`JobKey`,`PartitionKey`),
  KEY `ix_Expiry` (`LockExpiresAt_UTC`),
  KEY `ix_Job_Partition_Expiry` (`JobKey`,`PartitionKey`,`LockExpiresAt_UTC`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AgentJobRunsLog`
--

DROP TABLE IF EXISTS `_AgentJobRunsLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_AgentJobRunsLog` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `JobKey` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PartitionKey` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `TriggeredBy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AppClientId` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `InstanceId` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ScheduledAt_UTC` datetime DEFAULT NULL,
  `StartedAt_UTC` datetime NOT NULL,
  `FinishedAt_UTC` datetime DEFAULT NULL,
  `Outcome` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ErrorCode` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ErrorMessage` text COLLATE utf8mb4_unicode_ci,
  `MetricsJson` json DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ix_Job_Start` (`JobKey`,`StartedAt_UTC`),
  KEY `ix_Start` (`StartedAt_UTC`),
  KEY `ix_Outcome` (`Outcome`)
) ENGINE=InnoDB AUTO_INCREMENT=817477 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AgentRegistry`
--

DROP TABLE IF EXISTS `_AgentRegistry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_AgentRegistry` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `AppClientId` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `InstanceId` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AgentId` int unsigned DEFAULT NULL,
  `StartedAt_UTC` datetime NOT NULL,
  `LastHeartbeatAt_UTC` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ux_AppClientId_InstanceId` (`AppClientId`,`InstanceId`),
  KEY `ix_AgentId` (`AgentId`),
  KEY `ix_LastHeartbeat` (`LastHeartbeatAt_UTC`)
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AlivenessSessionAvailabilityStatus`
--

DROP TABLE IF EXISTS `_AlivenessSessionAvailabilityStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_AlivenessSessionAvailabilityStatus` (
  `AlivenessSessionId` bigint unsigned NOT NULL,
  `Status` bigint unsigned NOT NULL,
  `StatusNote` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT NULL,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`AlivenessSessionId`),
  KEY `idx_AlivenessSessionAvailabilityStatus_session` (`AlivenessSessionId`),
  CONSTRAINT `_AlivenessSessionAvailabilityStatus_ibfk_1` FOREIGN KEY (`AlivenessSessionId`) REFERENCES `_AlivenessSessions` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AlivenessSessionLocationZoneDwell`
--

DROP TABLE IF EXISTS `_AlivenessSessionLocationZoneDwell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_AlivenessSessionLocationZoneDwell` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `AlivenessSessionId` bigint unsigned NOT NULL,
  `ZoneId` bigint unsigned NOT NULL,
  `EnteredAt_UTC` datetime NOT NULL,
  `ExitedAt_UTC` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_ASLocationZoneDwell_open` (`AlivenessSessionId`,`ExitedAt_UTC`),
  KEY `idx_ASLocationZoneDwell_zone_entered` (`ZoneId`,`EnteredAt_UTC`),
  CONSTRAINT `_AlivenessSessionLocationZoneDwell_ibfk_1` FOREIGN KEY (`AlivenessSessionId`) REFERENCES `_AlivenessSessions` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `_AlivenessSessionLocationZoneDwell_ibfk_2` FOREIGN KEY (`ZoneId`) REFERENCES `_ZoneBases` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3093 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AlivenessSessionQueueStatus`
--

DROP TABLE IF EXISTS `_AlivenessSessionQueueStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_AlivenessSessionQueueStatus` (
  `AlivenessSessionId` bigint unsigned NOT NULL,
  `CurrentLocationZoneId` bigint unsigned DEFAULT NULL,
  `LocationSubZoneCode` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EnteredLocationZoneAt_UTC` datetime DEFAULT NULL,
  `EffectiveQueueZoneId` bigint unsigned DEFAULT NULL,
  `AtQueueZoneSince_UTC` datetime DEFAULT NULL,
  `CurrentOrderInQueue` int DEFAULT NULL,
  `QueuePriority` int DEFAULT NULL,
  `PriorityStart_UTC` datetime DEFAULT NULL,
  `PriorityEnd_UTC` datetime DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT NULL,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `BookedOutZoneId` bigint unsigned DEFAULT NULL,
  `BookedOutAt_UTC` datetime DEFAULT NULL,
  PRIMARY KEY (`AlivenessSessionId`),
  KEY `idx_AlivenessSessionQueueStatus_session` (`AlivenessSessionId`),
  KEY `_AlivenessSessionQueueStatus_ibfk_2` (`CurrentLocationZoneId`),
  KEY `_AlivenessSessionQueueStatus_ibfk_3_idx` (`EffectiveQueueZoneId`),
  KEY `_AlivenessSessionQueueStatus_BookedOutZoneId_foreign_idx` (`BookedOutZoneId`),
  CONSTRAINT `_AlivenessSessionQueueStatus_BookedOutZoneId_foreign_idx` FOREIGN KEY (`BookedOutZoneId`) REFERENCES `_ZoneBases` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `_AlivenessSessionQueueStatus_ibfk_1` FOREIGN KEY (`AlivenessSessionId`) REFERENCES `_AlivenessSessions` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `_AlivenessSessionQueueStatus_ibfk_2` FOREIGN KEY (`CurrentLocationZoneId`) REFERENCES `_ZoneBases` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `_AlivenessSessionQueueStatus_ibfk_3` FOREIGN KEY (`EffectiveQueueZoneId`) REFERENCES `_ZoneBases` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AlivenessSessionQueueZoneDwell`
--

DROP TABLE IF EXISTS `_AlivenessSessionQueueZoneDwell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_AlivenessSessionQueueZoneDwell` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `AlivenessSessionId` bigint unsigned NOT NULL,
  `ZoneId` bigint unsigned NOT NULL,
  `EnteredAt_UTC` datetime NOT NULL,
  `ExitedAt_UTC` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_ASQueueZoneDwell_open` (`AlivenessSessionId`,`ExitedAt_UTC`),
  KEY `idx_ASQueueZoneDwell_zone_entered` (`ZoneId`,`EnteredAt_UTC`),
  CONSTRAINT `_AlivenessSessionQueueZoneDwell_ibfk_1` FOREIGN KEY (`AlivenessSessionId`) REFERENCES `_AlivenessSessions` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `_AlivenessSessionQueueZoneDwell_ibfk_2` FOREIGN KEY (`ZoneId`) REFERENCES `_ZoneBases` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AlivenessSessions`
--

DROP TABLE IF EXISTS `_AlivenessSessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_AlivenessSessions` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ActivitySessionId` bigint unsigned NOT NULL,
  `StartAt_UTC` datetime NOT NULL,
  `StartReason` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CurrentStatus` bigint unsigned NOT NULL,
  `LastZonePuls_UTC` datetime DEFAULT NULL,
  `LastPosiPuls_UTC` datetime DEFAULT NULL,
  `EndAt_UTC` datetime DEFAULT NULL,
  `EndReason` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT NULL,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `LastLongitude` decimal(12,9) DEFAULT NULL,
  `LastLatitude` decimal(12,9) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_AlivenessSessions_act_end_start` (`ActivitySessionId`,`EndAt_UTC`,`StartAt_UTC`),
  KEY `idx_AlivenessSessions_CurrentStatus` (`CurrentStatus`),
  CONSTRAINT `_AlivenessSessions_ibfk_1` FOREIGN KEY (`ActivitySessionId`) REFERENCES `_ActivitySessions` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2981 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AlivenessStatusLog`
--

DROP TABLE IF EXISTS `_AlivenessStatusLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_AlivenessStatusLog` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Timestamp_UTC` datetime NOT NULL,
  `AlivenessSessionId` bigint unsigned NOT NULL,
  `Status` bigint unsigned NOT NULL,
  `StatusNote` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_AlivenessStatusLog_session_ts` (`AlivenessSessionId`,`Timestamp_UTC`),
  CONSTRAINT `_AlivenessStatusLog_ibfk_1` FOREIGN KEY (`AlivenessSessionId`) REFERENCES `_AlivenessSessions` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10819 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_ClientDeviceInfo`
--

DROP TABLE IF EXISTS `_ClientDeviceInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ClientDeviceInfo` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ClientOS` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DeviceModel` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AppID` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VehicleQRCode` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AppVersion` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT NULL,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_DelegatedDispatchContracts`
--

DROP TABLE IF EXISTS `_DelegatedDispatchContracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_DelegatedDispatchContracts` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `RequestId` bigint unsigned DEFAULT NULL,
  `BatchId` bigint unsigned DEFAULT NULL,
  `DelegatedToType` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DelegatedToId` bigint unsigned DEFAULT NULL,
  `Status` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ExpiresAt_UTC` datetime DEFAULT NULL,
  `CompletedAt_UTC` datetime DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  `DelegatedMethod` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ScopeType` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ScopeId` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SessionId` bigint unsigned DEFAULT NULL,
  `WindowStart_UTC` datetime DEFAULT NULL,
  `WindowEnd_UTC` datetime DEFAULT NULL,
  `PolicyVersionRef` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ConfigVersionRef` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OperationModeSnapshot` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DelegateServiceIdentity` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActivatedAt_UTC` datetime DEFAULT NULL,
  `AcceptedAt_UTC` datetime DEFAULT NULL,
  `ReclaimedAt_UTC` datetime DEFAULT NULL,
  `ReclaimReason` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReleaseReason` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParticipantFocus` json DEFAULT NULL,
  `ActorConfigRefs` json DEFAULT NULL,
  `BasketPolicyRef` json DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ix_DelegContract_RequestId` (`RequestId`),
  KEY `ix_DelegContract_Status` (`Status`),
  KEY `ix_DelegContract_Req_Status` (`RequestId`,`Status`),
  KEY `ix_DelegContract_Method` (`DelegatedMethod`),
  KEY `ix_DelegContract_Method_Status` (`DelegatedMethod`,`Status`),
  KEY `ix_DelegContract_SessionId` (`SessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_DelegatedDispatchProgressSignals`
--

DROP TABLE IF EXISTS `_DelegatedDispatchProgressSignals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_DelegatedDispatchProgressSignals` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ContractId` bigint unsigned NOT NULL,
  `SignalType` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SignalPayload` json DEFAULT NULL,
  `ReceivedAt_UTC` datetime NOT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `DelegateServiceIdentity` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SessionId` bigint unsigned DEFAULT NULL,
  `WaveId` bigint unsigned DEFAULT NULL,
  `AffectedRequestIds` json DEFAULT NULL,
  `ProgressSummary` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Reason` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmittedAt_UTC` datetime DEFAULT NULL,
  `FactMaterializationRef` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ix_DelegSignal_ContractId` (`ContractId`),
  KEY `ix_DelegSignal_Contract_RecAt` (`ContractId`,`ReceivedAt_UTC`),
  KEY `ix_DelegSignal_SessionId` (`SessionId`),
  KEY `ix_DelegSignal_SignalType` (`SignalType`),
  KEY `ix_DelegatedProgress_FactProv` (`FactMaterializationRef`),
  CONSTRAINT `_DelegatedDispatchProgressSignals_ibfk_1` FOREIGN KEY (`ContractId`) REFERENCES `_DelegatedDispatchContracts` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_DispatchOffers`
--

DROP TABLE IF EXISTS `_DispatchOffers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_DispatchOffers` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `TransportTransactId` bigint unsigned NOT NULL,
  `ActivitySessionId` bigint unsigned NOT NULL,
  `OfferType` int DEFAULT NULL,
  `SentAt_UTC` datetime NOT NULL,
  `ExpiryAt_UTC` datetime DEFAULT NULL,
  `RespondedAt_UTC` datetime DEFAULT NULL,
  `ResponseType` int DEFAULT NULL,
  `ResponseBid` decimal(10,2) DEFAULT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ix_DispatchOffers_TransportTransactId` (`TransportTransactId`),
  KEY `ix_DispatchOffers_ActivitySessionId` (`ActivitySessionId`),
  KEY `ix_DispatchOffers_ExpiryAt_UTC` (`ExpiryAt_UTC`),
  CONSTRAINT `_DispatchOffers_ibfk_1` FOREIGN KEY (`TransportTransactId`) REFERENCES `H_TransportTransacts` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `_DispatchOffers_ibfk_2` FOREIGN KEY (`ActivitySessionId`) REFERENCES `_ActivitySessions` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5551 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_DispatchRuleArtifacts`
--

DROP TABLE IF EXISTS `_DispatchRuleArtifacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_DispatchRuleArtifacts` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `RuleVersionId` bigint unsigned NOT NULL,
  `ArtifactType` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'execution-plan',
  `ArtifactFormatVersion` int unsigned NOT NULL,
  `ArtifactBlob` json NOT NULL,
  `CompiledAt_UTC` datetime NOT NULL,
  `CompileMode` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CompileStatus` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CompileError` json DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ix_DispatchRuleArtifacts_VersionId` (`RuleVersionId`),
  KEY `ix_DispatchRuleArtifacts_Version_Mode_Status` (`RuleVersionId`,`CompileMode`,`CompileStatus`),
  CONSTRAINT `_DispatchRuleArtifacts_ibfk_1` FOREIGN KEY (`RuleVersionId`) REFERENCES `_DispatchRuleVersions` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_DispatchRuleSets`
--

DROP TABLE IF EXISTS `_DispatchRuleSets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_DispatchRuleSets` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PolicyFamily` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OwnerScopeType` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OwnerScopeId` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ix_DispatchRuleSets_Scope` (`PolicyFamily`,`OwnerScopeType`,`OwnerScopeId`),
  KEY `ix_DispatchRuleSets_Status` (`Status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_DispatchRuleVersions`
--

DROP TABLE IF EXISTS `_DispatchRuleVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_DispatchRuleVersions` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `RuleSetId` bigint unsigned NOT NULL,
  `VersionNo` int unsigned NOT NULL,
  `LifecycleState` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Draft',
  `SourceHash` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CompiledArtifactId` bigint unsigned DEFAULT NULL,
  `ValidationResult` json DEFAULT NULL,
  `ActivatedAt_UTC` datetime DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ux_DispatchRuleVersions_Set_Version` (`RuleSetId`,`VersionNo`),
  KEY `ix_DispatchRuleVersions_State` (`LifecycleState`),
  KEY `ix_DispatchRuleVersions_Set_State` (`RuleSetId`,`LifecycleState`),
  CONSTRAINT `_DispatchRuleVersions_ibfk_1` FOREIGN KEY (`RuleSetId`) REFERENCES `_DispatchRuleSets` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_DispatchRules`
--

DROP TABLE IF EXISTS `_DispatchRules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_DispatchRules` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `RuleVersionId` bigint unsigned NOT NULL,
  `RuleOrder` int unsigned NOT NULL,
  `StopEvaluation` tinyint(1) NOT NULL DEFAULT '0',
  `PredicateSource` json NOT NULL,
  `ActionSource` json NOT NULL,
  `IsEnabled` tinyint(1) NOT NULL DEFAULT '1',
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ux_DispatchRules_Version_Order` (`RuleVersionId`,`RuleOrder`),
  KEY `ix_DispatchRules_VersionId` (`RuleVersionId`),
  CONSTRAINT `_DispatchRules_ibfk_1` FOREIGN KEY (`RuleVersionId`) REFERENCES `_DispatchRuleVersions` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_ENUM_ActivityStatus`
--

DROP TABLE IF EXISTS `_ENUM_ActivityStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ENUM_ActivityStatus` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_ENUM_AlivenessStatus`
--

DROP TABLE IF EXISTS `_ENUM_AlivenessStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ENUM_AlivenessStatus` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_ENUM_AvailabilityStatus`
--

DROP TABLE IF EXISTS `_ENUM_AvailabilityStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ENUM_AvailabilityStatus` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_ENUM_ViolationStatus`
--

DROP TABLE IF EXISTS `_ENUM_ViolationStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ENUM_ViolationStatus` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_ENUM_ViolationType`
--

DROP TABLE IF EXISTS `_ENUM_ViolationType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ENUM_ViolationType` (
  `ENUM` bigint unsigned NOT NULL,
  `Title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ENUM`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_FactMaterializationProvenance`
--

DROP TABLE IF EXISTS `_FactMaterializationProvenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_FactMaterializationProvenance` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `RunId` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ConsumerKind` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ConsumerScopeId` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FactCatalogVersionRef` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MaterializerVersionRef` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SourceSnapshotRefsJson` json NOT NULL,
  `MissingFactsJson` json NOT NULL,
  `MaterializedAt_UTC` datetime NOT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ux_FactProv_RecordKey` (`RecordKey`),
  KEY `ix_FactProv_RunId` (`RunId`),
  KEY `ix_FactProv_Consumer_Scope` (`ConsumerKind`,`ConsumerScopeId`),
  KEY `ix_FactProv_MaterializedAt` (`MaterializedAt_UTC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_RideBatchingRetryState`
--

DROP TABLE IF EXISTS `_RideBatchingRetryState`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_RideBatchingRetryState` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `RequestId` bigint unsigned NOT NULL,
  `RawStateVersionKey` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LastTriggeredAt_UTC` datetime NOT NULL,
  `NextEligibleTriggerAt_UTC` datetime NOT NULL,
  `TriggerCount` int unsigned NOT NULL DEFAULT '1',
  `LastResult` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ux_RideBatchingRetry_Req_StateVer` (`RequestId`,`RawStateVersionKey`),
  KEY `ix_RideBatchingRetry_NextEligible` (`NextEligibleTriggerAt_UTC`),
  KEY `ix_RideBatchingRetry_RequestId` (`RequestId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_RideDispatchApprovalItems`
--

DROP TABLE IF EXISTS `_RideDispatchApprovalItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_RideDispatchApprovalItems` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ActionIdentity` json NOT NULL,
  `RequestId` bigint unsigned NOT NULL,
  `BatchId` bigint unsigned NOT NULL,
  `TransactId` bigint unsigned DEFAULT NULL,
  `PolicyVersionId` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PreconditionSummary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ApprovalStatus` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ApproverActorId` bigint unsigned DEFAULT NULL,
  `RequestedAt_UTC` datetime NOT NULL,
  `DecidedAt_UTC` datetime DEFAULT NULL,
  `ExpiresAt_UTC` datetime DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ix_DispApproval_RequestId` (`RequestId`),
  KEY `ix_DispApproval_Status` (`ApprovalStatus`),
  KEY `ix_DispApproval_Req_Status` (`RequestId`,`ApprovalStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_RideDispatchCycleDecisions`
--

DROP TABLE IF EXISTS `_RideDispatchCycleDecisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_RideDispatchCycleDecisions` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `RunId` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RequestId` bigint unsigned NOT NULL,
  `BatchId` bigint unsigned DEFAULT NULL,
  `TransactId` bigint unsigned DEFAULT NULL,
  `DerivedRequestStatus` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BehaviorClass` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DecisionType` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DecisionReason` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ActionIdentity` json DEFAULT NULL,
  `PolicyVersionId` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RecordedAt_UTC` datetime NOT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `FactMaterializationRef` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ix_DispCycleDecision_RunId` (`RunId`),
  KEY `ix_DispCycleDecision_Req_RecAt` (`RequestId`,`RecordedAt_UTC`),
  KEY `ix_DispDecisions_FactProv` (`FactMaterializationRef`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_RideDispatchNotifications`
--

DROP TABLE IF EXISTS `_RideDispatchNotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_RideDispatchNotifications` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `RequestId` bigint unsigned NOT NULL,
  `NotificationType` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NotificationPayloadRef` json DEFAULT NULL,
  `DedupKey` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SentAt_UTC` datetime NOT NULL,
  `Result` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ix_DispNotif_RequestId` (`RequestId`),
  KEY `ix_DispNotif_DedupKey` (`DedupKey`),
  KEY `ix_DispNotif_SentAt` (`SentAt_UTC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_RollCallSessionParticipants`
--

DROP TABLE IF EXISTS `_RollCallSessionParticipants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_RollCallSessionParticipants` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `SessionId` bigint unsigned NOT NULL,
  `ParticipantId` bigint unsigned NOT NULL,
  `ActivitySessionId` bigint unsigned DEFAULT NULL,
  `PriorityGroupId` bigint unsigned DEFAULT NULL,
  `SignupAt_UTC` datetime NOT NULL,
  `SignupOrder` int unsigned NOT NULL,
  `RosterState` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EligibilitySnapshot` json DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ux_RollCallPart_Session_Participant` (`SessionId`,`ParticipantId`),
  KEY `ix_RollCallPart_SessionId` (`SessionId`),
  KEY `ix_RollCallPart_Session_Roster` (`SessionId`,`RosterState`),
  CONSTRAINT `_RollCallSessionParticipants_ibfk_1` FOREIGN KEY (`SessionId`) REFERENCES `_RollCallSessions` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_RollCallSessions`
--

DROP TABLE IF EXISTS `_RollCallSessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_RollCallSessions` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DelegatedDispatchContractId` bigint unsigned NOT NULL,
  `SessionStatus` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ScopeType` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ScopeId` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `WindowStart_UTC` datetime NOT NULL,
  `WindowEnd_UTC` datetime NOT NULL,
  `SignupClosesAt_UTC` datetime DEFAULT NULL,
  `ModeType` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TopXPerZone` int unsigned DEFAULT NULL,
  `PrimaryGroupSnapshot` json DEFAULT NULL,
  `StartedAt_UTC` datetime DEFAULT NULL,
  `ClosedAt_UTC` datetime DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ix_RollCallSess_ContractId` (`DelegatedDispatchContractId`),
  KEY `ix_RollCallSess_Status` (`SessionStatus`),
  KEY `ix_RollCallSess_Scope_Status` (`ScopeType`,`ScopeId`,`SessionStatus`),
  CONSTRAINT `_RollCallSessions_ibfk_1` FOREIGN KEY (`DelegatedDispatchContractId`) REFERENCES `_DelegatedDispatchContracts` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_RollCallWaves`
--

DROP TABLE IF EXISTS `_RollCallWaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_RollCallWaves` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `SessionId` bigint unsigned NOT NULL,
  `WaveNo` int unsigned NOT NULL,
  `WaveStatus` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `WaveStart_UTC` datetime DEFAULT NULL,
  `WaveEnd_UTC` datetime DEFAULT NULL,
  `Capacity` int unsigned DEFAULT NULL,
  `PrimaryGroupSnapshot` json DEFAULT NULL,
  `LowerGroupExpansionState` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WaveAuditSnapshot` json DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ux_RollCallWave_Session_WaveNo` (`SessionId`,`WaveNo`),
  KEY `ix_RollCallWave_SessionId` (`SessionId`),
  KEY `ix_RollCallWave_Status` (`WaveStatus`),
  CONSTRAINT `_RollCallWaves_ibfk_1` FOREIGN KEY (`SessionId`) REFERENCES `_RollCallSessions` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_TransportBatchPlanMaterializations`
--

DROP TABLE IF EXISTS `_TransportBatchPlanMaterializations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_TransportBatchPlanMaterializations` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `PlanVersionId` bigint unsigned NOT NULL,
  `ProposedBatchKey` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdempotencyKey` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `State` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CoreBatchId` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CoreItemMappingJson` json NOT NULL,
  `MaterializedAt_UTC` datetime DEFAULT NULL,
  `FailureSummary` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ux_TBPMat_IdempotencyKey` (`IdempotencyKey`),
  KEY `ix_TBPMat_PlanVersion_BatchKey` (`PlanVersionId`,`ProposedBatchKey`),
  KEY `ix_TBPMat_State` (`State`),
  KEY `ix_TBPMat_CoreBatchId` (`CoreBatchId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_TransportBatchPlanVersionRequests`
--

DROP TABLE IF EXISTS `_TransportBatchPlanVersionRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_TransportBatchPlanVersionRequests` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `PlanVersionId` bigint unsigned NOT NULL,
  `ProposedBatchKey` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RequestId` bigint unsigned NOT NULL,
  `Role` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MetricsJson` json NOT NULL,
  `EligibilityJson` json NOT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ix_TBPVR_PlanVersion_BatchKey` (`PlanVersionId`,`ProposedBatchKey`),
  KEY `ix_TBPVR_Request_PlanVersion` (`RequestId`,`PlanVersionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_TransportBatchPlanVersionStops`
--

DROP TABLE IF EXISTS `_TransportBatchPlanVersionStops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_TransportBatchPlanVersionStops` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `PlanVersionId` bigint unsigned NOT NULL,
  `ProposedBatchKey` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `StopOrder` int unsigned NOT NULL,
  `StopKind` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RequestId` bigint unsigned NOT NULL,
  `LocationRef` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MetricsJson` json NOT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ux_TBPVStops_PlanVersion_BatchKey_StopOrder` (`PlanVersionId`,`ProposedBatchKey`,`StopOrder`),
  KEY `ix_TBPVStops_Request_PlanVersion` (`RequestId`,`PlanVersionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_TransportBatchPlanVersions`
--

DROP TABLE IF EXISTS `_TransportBatchPlanVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_TransportBatchPlanVersions` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `PlanningScopeId` bigint unsigned NOT NULL,
  `State` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SupersedesPlanVersionId` bigint unsigned DEFAULT NULL,
  `ObjectiveProfile` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Score` double NOT NULL,
  `GroupCount` int unsigned NOT NULL,
  `ExcludedRequestCount` int unsigned NOT NULL,
  `RationaleSummary` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReplayInputHash` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SelectedAt_UTC` datetime DEFAULT NULL,
  `MaterializedAt_UTC` datetime DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ix_TBPV_Scope_State` (`PlanningScopeId`,`State`),
  KEY `ix_TBPV_Supersedes` (`SupersedesPlanVersionId`),
  KEY `ix_TBPV_ReplayInputHash` (`ReplayInputHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_TransportBatchPlanningScopes`
--

DROP TABLE IF EXISTS `_TransportBatchPlanningScopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_TransportBatchPlanningScopes` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Domain` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ScopeType` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DistributorScopeId` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `InputSnapshotHash` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PolicyActivationRef` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RoutingMatrixRef` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RequestSetHash` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CurrentPlanVersionId` bigint unsigned DEFAULT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ix_TBPS_Domain_ScopeType_Status` (`Domain`,`ScopeType`,`Status`),
  KEY `ix_TBPS_Distributor` (`DistributorScopeId`),
  KEY `ix_TBPS_InputSnapshotHash` (`InputSnapshotHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_VehicleStatusLog`
--

DROP TABLE IF EXISTS `_VehicleStatusLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_VehicleStatusLog` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Timestamp_UTC` datetime NOT NULL,
  `VehicleId` bigint unsigned NOT NULL,
  `ActivitySessionId` bigint unsigned NOT NULL,
  `ActivityStatus` bigint unsigned NOT NULL,
  `AlivenessSessionId` bigint unsigned NOT NULL,
  `AlivenessStatus` bigint unsigned NOT NULL,
  `LocationZoneId` bigint unsigned DEFAULT NULL,
  `QueueZoneId` bigint unsigned DEFAULT NULL,
  `BookedOutZoneId` bigint unsigned DEFAULT NULL,
  `OrderInQueue` int DEFAULT NULL,
  `QueuePriority` int DEFAULT NULL,
  `PriorityStart_UTC` datetime DEFAULT NULL,
  `PriorityEnd_UTC` datetime DEFAULT NULL,
  `AvailabilityStatus` bigint unsigned NOT NULL,
  `StatusNote` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `VehicleId` (`VehicleId`),
  KEY `ActivitySessionId` (`ActivitySessionId`),
  KEY `AlivenessSessionId` (`AlivenessSessionId`),
  KEY `ZoneId` (`QueueZoneId`),
  KEY `_VehicleStatusLog_ibfk_5_idx` (`LocationZoneId`),
  KEY `LocationZoneId` (`LocationZoneId`),
  KEY `QueueZoneId` (`QueueZoneId`),
  KEY `BookedOutZoneId` (`BookedOutZoneId`),
  CONSTRAINT `_VehicleStatusLog_BookedOutZoneId_foreign_idx` FOREIGN KEY (`BookedOutZoneId`) REFERENCES `_ZoneBases` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `_VehicleStatusLog_ibfk_1` FOREIGN KEY (`VehicleId`) REFERENCES `H_Synced_VehicleProfile` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `_VehicleStatusLog_ibfk_2` FOREIGN KEY (`ActivitySessionId`) REFERENCES `_ActivitySessions` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `_VehicleStatusLog_ibfk_3` FOREIGN KEY (`AlivenessSessionId`) REFERENCES `_AlivenessSessions` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `_VehicleStatusLog_ibfk_4` FOREIGN KEY (`QueueZoneId`) REFERENCES `_ZoneBases` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `_VehicleStatusLog_ibfk_5` FOREIGN KEY (`LocationZoneId`) REFERENCES `_ZoneBases` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13525 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_WatchdogInterventions`
--

DROP TABLE IF EXISTS `_WatchdogInterventions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_WatchdogInterventions` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `RunId` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RequestId` bigint unsigned NOT NULL,
  `BatchId` bigint unsigned NOT NULL,
  `TransactId` bigint unsigned NOT NULL,
  `DerivedRequestStatus` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ActionType` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ActionReason` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NotificationSent` tinyint(1) NOT NULL DEFAULT '0',
  `RevokeRequested` tinyint(1) NOT NULL DEFAULT '0',
  `PolicyVersionId` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RecordedAt_UTC` datetime NOT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `DelegatedDispatchContractId` bigint unsigned DEFAULT NULL,
  `FactMaterializationRef` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ix_WatchdogIntv_RunId` (`RunId`),
  KEY `ix_WatchdogIntv_Req_RecAt` (`RequestId`,`RecordedAt_UTC`),
  KEY `ix_WatchdogIntv_TransactId` (`TransactId`),
  KEY `ix_WatchdogIntv_DelegatedContractId` (`DelegatedDispatchContractId`),
  KEY `ix_WatchdogInter_FactProv` (`FactMaterializationRef`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_ZoneBases`
--

DROP TABLE IF EXISTS `_ZoneBases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ZoneBases` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ZoneType` tinyint unsigned NOT NULL DEFAULT '1',
  `CreatedAt_UTC` datetime NOT NULL,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Code` (`Code`,`ZoneType`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_ZoneGeofences`
--

DROP TABLE IF EXISTS `_ZoneGeofences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ZoneGeofences` (
  `Id` bigint unsigned NOT NULL,
  `ZoneId` bigint unsigned NOT NULL,
  `GeofenceBaseId` bigint unsigned NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `GeofenceBaseId` (`GeofenceBaseId`),
  CONSTRAINT `_ZoneGeofences_ibfk_2` FOREIGN KEY (`GeofenceBaseId`) REFERENCES `H_TransportGeoFenceBases` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Final view structure for view `Vi_BKC_AlivenessSessionZoneQueueEntrance`
--

/*!50001 DROP VIEW IF EXISTS `Vi_BKC_AlivenessSessionZoneQueueEntrance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_BKC_AlivenessSessionZoneQueueEntrance` AS select `q`.`AlivenessSessionId` AS `AlivenessSessionId`,`q`.`CurrentOrderInQueue` AS `CurrentOrderInQueue`,greatest(coalesce(`a`.`ModifiedAt_UTC`,'2000-01-01'),coalesce(`q`.`AtQueueZoneSince_UTC`,'2000-01-01')) AS `EnteredQueueAt_UTC`,`q`.`EffectiveQueueZoneId` AS `EffectiveQueueZoneId`,(case when (`q`.`PriorityEnd_UTC` > utc_timestamp()) then `q`.`QueuePriority` else 10 end) AS `EffectiveQueuePriority`,`a`.`Status` AS `Status` from (`_AlivenessSessionQueueStatus` `q` left join `_AlivenessSessionAvailabilityStatus` `a` on((`a`.`AlivenessSessionId` = `q`.`AlivenessSessionId`))) where (`a`.`Status` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_BKC_DriverStatus`
--

/*!50001 DROP VIEW IF EXISTS `Vi_BKC_DriverStatus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_BKC_DriverStatus` AS select `act`.`DriverId` AS `DriverId`,`act`.`Id` AS `ActivitySessionId`,`asl`.`Timestamp_UTC` AS `StatusTimestamp_UTC`,`asl`.`Status` AS `ActivityStatus` from (`_ActivityStatusLog` `asl` join `_ActivitySessions` `act` on((`act`.`Id` = `asl`.`ActivitySessionId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_BKC_LiveUserWsSessions`
--

/*!50001 DROP VIEW IF EXISTS `Vi_BKC_LiveUserWsSessions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_BKC_LiveUserWsSessions` AS select `cs`.`Id` AS `Id`,`cs`.`ClientType` AS `ClientType`,`cs`.`ClientKey` AS `ClientKey`,`cs`.`ClientKey` AS `UserRecordKey`,`cs`.`ConnectedServer` AS `ConnectedServer`,`cs`.`OpenedAt` AS `OpenedAt`,`cs`.`HearBeatenAt` AS `HearBeatenAt`,`cs`.`ClosedAt` AS `ClosedAt`,`cs`.`Status` AS `Status` from (`TMS-Msg-DEV01`.`ConnectSessions` `cs` join (select `TMS-Msg-DEV01`.`ConnectSessions`.`ClientType` AS `ClientType`,`TMS-Msg-DEV01`.`ConnectSessions`.`ClientKey` AS `ClientKey`,max(`TMS-Msg-DEV01`.`ConnectSessions`.`Id`) AS `MaxId` from `TMS-Msg-DEV01`.`ConnectSessions` where ((`TMS-Msg-DEV01`.`ConnectSessions`.`ClientType` = 'User') and (`TMS-Msg-DEV01`.`ConnectSessions`.`Status` = 0) and (`TMS-Msg-DEV01`.`ConnectSessions`.`ClosedAt` is null) and (`TMS-Msg-DEV01`.`ConnectSessions`.`HearBeatenAt` >= (utc_timestamp() - interval 65 second)) and ((`TMS-Msg-DEV01`.`ConnectSessions`.`RecordDeleted` is null) or (`TMS-Msg-DEV01`.`ConnectSessions`.`RecordDeleted` = 0))) group by `TMS-Msg-DEV01`.`ConnectSessions`.`ClientType`,`TMS-Msg-DEV01`.`ConnectSessions`.`ClientKey`) `latest` on(((`cs`.`ClientType` = `latest`.`ClientType`) and (`cs`.`ClientKey` = `latest`.`ClientKey`) and (`cs`.`Id` = `latest`.`MaxId`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_BKC_PermitStatusApprovals`
--

/*!50001 DROP VIEW IF EXISTS `Vi_BKC_PermitStatusApprovals`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_BKC_PermitStatusApprovals` AS select `p`.`Id` AS `Id`,`p`.`HUBId` AS `HUBId`,`p`.`DistributorId` AS `DistributorId`,`p`.`CVOId` AS `CVOId`,`p`.`VehicleId` AS `VehicleId`,`p`.`DriverId` AS `DriverId`,`p`.`ActENUM` AS `ActENUM`,`p`.`PermitIssuerId` AS `PermitIssuerId`,`p`.`PermitTypeId` AS `PermitType`,`p`.`Code` AS `Code`,`pt`.`AllowedServiceCategories` AS `AllowedServiceCategories`,`p`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`p`.`RecordKey` AS `RecordKey`,`p`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`p`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`p`.`RecordDeleted` AS `RecordDeleted`,`psv`.`Id` AS `RequestStatusId`,`psv`.`ApprovalStatus` AS `RequestApprovalStatus`,`psv`.`ApproverEntityId` AS `RequestApproverEntityId`,`psv`.`ApproverActENUM` AS `RequestApproverActENUM`,(case when (`psv`.`ApprovalStatus` = 5) then `psv`.`ApproverEntityId` else NULL end) AS `ApproverEntityId`,(case when (`psv`.`ApprovalStatus` = 5) then `psv`.`ApproverActENUM` else NULL end) AS `ApproverActENUM` from (((`H_Synced_Permits` `p` left join `H_Synced_PermitTypes` `pt` on((`pt`.`Id` = `p`.`PermitTypeId`))) join (select `ranked_ps`.`Id` AS `Id`,`ranked_ps`.`PermitId` AS `PermitId`,`ranked_ps`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`ranked_ps`.`ConditionENUM` AS `ConditionENUM`,`ranked_ps`.`ConditionEndDate_UTC` AS `ConditionEndDate_UTC`,`ranked_ps`.`MediaRecordKey` AS `MediaRecordKey`,`ranked_ps`.`RecordKey` AS `RecordKey`,`ranked_ps`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`ranked_ps`.`CreatedBy` AS `CreatedBy`,`ranked_ps`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`ranked_ps`.`ModifiedBy` AS `ModifiedBy`,`ranked_ps`.`RecordDeleted` AS `RecordDeleted`,`ranked_ps`.`RowNum` AS `RowNum` from (select `ps1`.`Id` AS `Id`,`ps1`.`PermitId` AS `PermitId`,`ps1`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`ps1`.`ConditionENUM` AS `ConditionENUM`,`ps1`.`ConditionEndDate_UTC` AS `ConditionEndDate_UTC`,`ps1`.`MediaRecordKey` AS `MediaRecordKey`,`ps1`.`RecordKey` AS `RecordKey`,`ps1`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`ps1`.`CreatedBy` AS `CreatedBy`,`ps1`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`ps1`.`ModifiedBy` AS `ModifiedBy`,`ps1`.`RecordDeleted` AS `RecordDeleted`,row_number() OVER (PARTITION BY `ps1`.`PermitId` ORDER BY `ps1`.`Id` desc )  AS `RowNum` from `H_Synced_PermitStatuses` `ps1` where ((`ps1`.`RecordDeleted` is null) or (`ps1`.`RecordDeleted` = 0))) `ranked_ps` where (`ranked_ps`.`RowNum` = 1)) `ps` on((`ps`.`PermitId` = `p`.`Id`))) left join `H_Synced_PermitStatusVerifications` `psv` on(((`psv`.`PermitStatusId` = `ps`.`Id`) and ((`psv`.`RecordDeleted` is null) or (`psv`.`RecordDeleted` = 0))))) where (((`p`.`RecordDeleted` is null) or (`p`.`RecordDeleted` = 0)) and (0 <> (case when (`ps`.`ConditionENUM` = 0) then 0 when (`ps`.`ConditionENUM` is null) then (`ps`.`ExpiryDate_UTC` > utc_timestamp()) when (`ps`.`ConditionENUM` = 4) then 0 when (`ps`.`ConditionENUM` = 1) then ((`ps`.`ConditionEndDate_UTC` is not null) and (`ps`.`ConditionEndDate_UTC` <= utc_timestamp()) and (`ps`.`ExpiryDate_UTC` > utc_timestamp())) when (`ps`.`ConditionENUM` = 2) then (case when (`ps`.`ConditionEndDate_UTC` is null) then (`ps`.`ExpiryDate_UTC` > utc_timestamp()) when (`ps`.`ConditionEndDate_UTC` <= utc_timestamp()) then (`ps`.`ExpiryDate_UTC` > utc_timestamp()) else 1 end) when (`ps`.`ConditionENUM` = 3) then (case when (`ps`.`ConditionEndDate_UTC` is null) then (`ps`.`ExpiryDate_UTC` > utc_timestamp()) when (`ps`.`ConditionEndDate_UTC` <= utc_timestamp()) then (`ps`.`ExpiryDate_UTC` > utc_timestamp()) else (greatest(`ps`.`ExpiryDate_UTC`,`ps`.`ConditionEndDate_UTC`) > utc_timestamp()) end) else (`ps`.`ExpiryDate_UTC` > utc_timestamp()) end))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_BKC_QueueSnapshot`
--

/*!50001 DROP VIEW IF EXISTS `Vi_BKC_QueueSnapshot`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_BKC_QueueSnapshot` AS select `ac`.`Id` AS `ActivitySessionId`,`latest_as`.`Id` AS `AlivenessSessionId`,`ac`.`ServiceCategory` AS `ServiceCategory`,`ac`.`ParticipationCategory` AS `ParticipationCategory`,`ac`.`DriverId` AS `DriverId`,`ac`.`VehicleId` AS `VehicleId`,`asq`.`CurrentLocationZoneId` AS `CurrentLocationZoneId`,`asq`.`LocationSubZoneCode` AS `LocationSubZoneCode`,`asq`.`EnteredLocationZoneAt_UTC` AS `EnteredLocationZoneAt_UTC`,`asq`.`EffectiveQueueZoneId` AS `EffectiveQueueZoneId`,`asq`.`AtQueueZoneSince_UTC` AS `AtQueueZoneSince_UTC`,`asq`.`CurrentOrderInQueue` AS `CurrentOrderInQueue`,`asq`.`QueuePriority` AS `QueuePriority`,`asq`.`PriorityStart_UTC` AS `PriorityStart_UTC`,`asq`.`PriorityEnd_UTC` AS `PriorityEnd_UTC`,`asav`.`Status` AS `AvailabilityStatus`,row_number() OVER (PARTITION BY `ac`.`ServiceCategory`,`ac`.`ParticipationCategory`,`asq`.`EffectiveQueueZoneId` ORDER BY (case when ((`asq`.`QueuePriority` between 1 and 9) and (`asq`.`PriorityEnd_UTC` is not null) and (`asq`.`PriorityEnd_UTC` > utc_timestamp())) then `asq`.`QueuePriority` else 10 end),`asq`.`AtQueueZoneSince_UTC`,`asq`.`AlivenessSessionId` )  AS `ComputedOrderInQueue` from (((`_ActivitySessions` `ac` join (select `alv`.`Id` AS `Id`,`alv`.`ActivitySessionId` AS `ActivitySessionId`,max(`alv`.`Id`) OVER (PARTITION BY `alv`.`ActivitySessionId` )  AS `MaxAlivenessId` from `_AlivenessSessions` `alv` where ((`alv`.`CurrentStatus` <> 4) and (`alv`.`EndAt_UTC` is null))) `latest_as` on(((`latest_as`.`ActivitySessionId` = `ac`.`Id`) and (`latest_as`.`Id` = `latest_as`.`MaxAlivenessId`)))) join `_AlivenessSessionQueueStatus` `asq` on((`asq`.`AlivenessSessionId` = `latest_as`.`Id`))) join `_AlivenessSessionAvailabilityStatus` `asav` on((`asav`.`AlivenessSessionId` = `latest_as`.`Id`))) where ((`ac`.`EndAt_UTC` is null) and (`asav`.`Status` in (1,8,9)) and (`asq`.`EffectiveQueueZoneId` is not null) and (`asq`.`AtQueueZoneSince_UTC` is not null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_BKC_TransportFareCalculatorPrettier`
--

/*!50001 DROP VIEW IF EXISTS `Vi_BKC_TransportFareCalculatorPrettier`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_BKC_TransportFareCalculatorPrettier` AS select `FC`.`Id` AS `Id`,`FC`.`DistributorId` AS `DistributorId`,`FC`.`CVOId` AS `CVOId`,`TC`.`Title` AS `TransportCategory`,`SCat`.`Title` AS `ServiceCategory`,`VT`.`Title` AS `VehicleType`,`SCls`.`Title` AS `ServiceClass`,`CI`.`Title` AS `CalculationItem`,`CT`.`Title` AS `CalculationType`,`CM`.`Title` AS `CalculateMethod`,`FC`.`CalculationPriority` AS `CalculationPriority`,`CU`.`Title` AS `CalculationUnit`,`FC`.`UnitAmount` AS `UnitAmount`,`FC`.`Price` AS `Price` from ((((((((`H_TransportFareCalculations` `FC` join `H_ENUM_TransportCategories` `TC` on((`TC`.`ENUM` = `FC`.`TransportCategory`))) join `H_ENUM_ServiceCategories` `SCat` on((`SCat`.`ENUM` = `FC`.`ServiceCategory`))) join `H_ENUM_VehicleTypes` `VT` on((`VT`.`ENUM` = `FC`.`VehicleType`))) join `H_ENUM_ServiceClasses` `SCls` on((`SCls`.`ENUM` = `FC`.`ServiceClass`))) join `H_ENUM_CalculationItems` `CI` on((`CI`.`ENUM` = `FC`.`CalculationItem`))) join `H_ENUM_CalculationTypes` `CT` on((`CT`.`ENUM` = `FC`.`CalculationType`))) join `H_ENUM_CalculateMethods` `CM` on((`CM`.`ENUM` = `FC`.`CalculateMethod`))) join `H_ENUM_CalculationUnits` `CU` on((`CU`.`ENUM` = `FC`.`CalculationUnit`))) where ((0 <> `FC`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_BKC_VehicleStatus`
--

/*!50001 DROP VIEW IF EXISTS `Vi_BKC_VehicleStatus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_BKC_VehicleStatus` AS select `v`.`Id` AS `VehicleId`,`act`.`Id` AS `ActivitySessionId`,`act`.`DriverId` AS `DriverId`,`act`.`CurrentStatus` AS `CurrentActivityStatus`,`alive`.`Id` AS `AlivenessSessionId`,`alive`.`CurrentStatus` AS `CurrentAlivenessStatus`,`alive`.`EndReason` AS `CurrentAlivenessStatusReason`,`alive`.`LastLongitude` AS `LastLongitude`,`alive`.`LastLatitude` AS `LastLatitude`,`alive`.`LastZonePuls_UTC` AS `LastZonePuls_UTC`,`alive`.`LastPosiPuls_UTC` AS `LastPosiPuls_UTC`,`qs`.`CurrentLocationZoneId` AS `CurrentLocationZoneId`,`qs`.`EnteredLocationZoneAt_UTC` AS `EnteredLocationZoneAt_UTC`,`qs`.`EffectiveQueueZoneId` AS `EffectiveQueueZoneId`,`qs`.`AtQueueZoneSince_UTC` AS `AtQueueZoneSince_UTC`,`qs`.`BookedOutZoneId` AS `BookedOutZoneId`,`qs`.`BookedOutAt_UTC` AS `BookedOutAt_UTC`,`qs`.`CurrentOrderInQueue` AS `CurrentOrderInQueue`,`qs`.`QueuePriority` AS `QueuePriority`,`qs`.`PriorityStart_UTC` AS `PriorityStart_UTC`,`qs`.`PriorityEnd_UTC` AS `PriorityEnd_UTC`,`avail`.`Status` AS `CurrentAvailabilityStatus`,`avail`.`StatusNote` AS `StatusNote` from ((((`H_Synced_VehicleProfile` `v` left join `_ActivitySessions` `act` on(((`act`.`VehicleId` = `v`.`Id`) and (`act`.`EndAt_UTC` is null) and (`act`.`Id` = (select `a2`.`Id` from `_ActivitySessions` `a2` where (`a2`.`VehicleId` = `v`.`Id`) order by `a2`.`StartAt_UTC` desc,`a2`.`Id` desc limit 1))))) left join `_AlivenessSessions` `alive` on(((`alive`.`ActivitySessionId` = `act`.`Id`) and (`alive`.`EndAt_UTC` is null) and (`alive`.`Id` = (select `al2`.`Id` from `_AlivenessSessions` `al2` where (`al2`.`ActivitySessionId` = `act`.`Id`) order by `al2`.`StartAt_UTC` desc,`al2`.`Id` desc limit 1))))) left join `_AlivenessSessionQueueStatus` `qs` on((`qs`.`AlivenessSessionId` = `alive`.`Id`))) left join `_AlivenessSessionAvailabilityStatus` `avail` on((`avail`.`AlivenessSessionId` = `alive`.`Id`))) */;
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
-- Final view structure for view `Vi_DPA_ActionConfigBase`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_ActionConfigBase`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_ActionConfigBase` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Code` AS `Code`,`BaseTable`.`Description` AS `Description` from `H_CFG_ActionConfigBases` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_ActionConfigBaseSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_ActionConfigBaseSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_ActionConfigBaseSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Code` AS `Code`,`BaseTable`.`Description` AS `Description`,`TempQuery0`.`RelatedEntityCount` AS `ActorConfigsCount`,`TempQuery1`.`RelatedEntityCount` AS `GlobalConfigsCount` from ((`H_CFG_ActionConfigBases` `BaseTable` left join (select `RT0`.`ConfigBaseId` AS `ConfigBaseId`,count(`RT0`.`ConfigBaseId`) AS `RelatedEntityCount` from `H_CFG_ActorConfigs` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`ConfigBaseId`) `TempQuery0` on((`TempQuery0`.`ConfigBaseId` = `BaseTable`.`Id`))) left join (select `RT1`.`ConfigBaseId` AS `ConfigBaseId`,count(`RT1`.`ConfigBaseId`) AS `RelatedEntityCount` from `H_CFG_GlobalConfigs` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`ConfigBaseId`) `TempQuery1` on((`TempQuery1`.`ConfigBaseId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_ActorConfigsDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_ActorConfigsDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_ActorConfigsDetail` AS select `BaseTable`.`Id` AS `ActionConfigBaseId`,`BaseTable`.`Code` AS `ActionConfigBaseCode`,`BaseTable`.`Description` AS `ActionConfigBaseDescription`,`RJT`.`EntityId` AS `EntityId`,`RJT`.`VehicleId` AS `VehicleId`,`RJT`.`UserId` AS `UserId`,`RJT`.`ActENUM` AS `ActENUM`,`RJT`.`ScenarioId` AS `ScenarioId`,`RJT`.`Value` AS `Value`,`RJT`.`IsOverridable` AS `IsOverridable` from (`H_CFG_ActionConfigBases` `BaseTable` join `H_CFG_ActorConfigs` `RJT` on(((`RJT`.`ConfigBaseId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
-- Final view structure for view `Vi_DPA_CVO`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_CVO`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_CVO` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`EntityId` AS `EntityId`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator` from (`H_Synced_CVOs` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_CVODriversSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_CVODriversSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_CVODriversSuperDetail` AS select `BaseTable`.`Id` AS `CVOId`,`BaseTable`.`EntityId` AS `CVOEntityId`,`AP`.`Title` AS `CVOEntityTitle`,`AP`.`Address_fsx` AS `CVOEntityAddress_fsx`,`AP`.`City` AS `CVOEntityCity`,`AP`.`Province` AS `CVOEntityProvince`,`AP`.`Country` AS `CVOEntityCountry`,`AP`.`PostalCode_fsx` AS `CVOEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `CVOEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `CVOEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `CVOEntityEmail_fsx`,`AP`.`Discriminator` AS `CVOEntityDiscriminator`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`HasRule` AS `HasRule`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`RJT`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`PJT0`.`UserId` AS `DriverUserId`,`PJT0`.`PersonCVOId` AS `DriverPersonCVOId`,`PUI_0_0`.`Firstname_fsx` AS `DriverFirstname_fsx`,`PUI_0_0`.`Lastname_fsx` AS `DriverLastname_fsx`,`PUI_0_0`.`Username` AS `DriverUsername`,`PUI_0_0`.`Email_fsx` AS `DriverEmail_fsx`,`PUI_0_0`.`Email_hash` AS `DriverEmail_hash`,`PUI_0_0`.`EmailConfirmed` AS `DriverEmailConfirmed`,`PUI_0_0`.`CellPhone_fsx` AS `DriverCellPhone_fsx`,`PUI_0_0`.`CellPhone_hash` AS `DriverCellPhone_hash`,`PUI_0_0`.`CellPhoneConfirmed` AS `DriverCellPhoneConfirmed`,`PUI_0_0`.`IssuedBy` AS `DriverIssuedBy`,`PUI_0_0`.`RecordKey` AS `DriverRecordKey`,`PUI_0_0`.`CreatedAt_UTC` AS `DriverCreatedAt_UTC`,`PUI_0_0`.`CreatedBy` AS `DriverCreatedBy`,`PUI_0_0`.`ModifiedAt_UTC` AS `DriverModifiedAt_UTC`,`PUI_0_0`.`ModifiedBy` AS `DriverModifiedBy`,`PUI_0_0`.`RecordDeleted` AS `DriverRecordDeleted` from ((((`H_Synced_CVOs` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_Synced_CVODrivers` `RJT` on(((`RJT`.`CVOId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_Synced_Drivers` `PJT0` on(((`RJT`.`DriverId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `PUI_0_0` on(((`PJT0`.`UserId` = `PUI_0_0`.`Id`) and ((0 <> `PUI_0_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_CVOPermitsExtraDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_CVOPermitsExtraDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_CVOPermitsExtraDetail` AS select `BaseTable`.`Id` AS `CVOId`,`BaseTable`.`EntityId` AS `CVOEntityId`,`AP`.`Title` AS `CVOEntityTitle`,`AP`.`Address_fsx` AS `CVOEntityAddress_fsx`,`AP`.`City` AS `CVOEntityCity`,`AP`.`Province` AS `CVOEntityProvince`,`AP`.`Country` AS `CVOEntityCountry`,`AP`.`PostalCode_fsx` AS `CVOEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `CVOEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `CVOEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `CVOEntityEmail_fsx`,`AP`.`Discriminator` AS `CVOEntityDiscriminator`,`RJT`.`HUBId` AS `HUBId`,`RJT`.`DistributorId` AS `DistributorId`,`RJT`.`VehicleId` AS `VehicleId`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`ActENUM` AS `ActENUM`,`RJT`.`PermitIssuerId` AS `PermitIssuerId`,`RJT`.`PermitTypeId` AS `PermitTypeId`,`RJT`.`Code` AS `Code`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`PJT0`.`UserId` AS `DriverUserId`,`PJT0`.`PersonCVOId` AS `DriverPersonCVOId`,`PUI_0_0`.`Firstname_fsx` AS `DriverFirstname_fsx`,`PUI_0_0`.`Lastname_fsx` AS `DriverLastname_fsx`,`PUI_0_0`.`Username` AS `DriverUsername`,`PUI_0_0`.`Email_fsx` AS `DriverEmail_fsx`,`PUI_0_0`.`Email_hash` AS `DriverEmail_hash`,`PUI_0_0`.`EmailConfirmed` AS `DriverEmailConfirmed`,`PUI_0_0`.`CellPhone_fsx` AS `DriverCellPhone_fsx`,`PUI_0_0`.`CellPhone_hash` AS `DriverCellPhone_hash`,`PUI_0_0`.`CellPhoneConfirmed` AS `DriverCellPhoneConfirmed`,`PUI_0_0`.`IssuedBy` AS `DriverIssuedBy`,`PUI_0_0`.`RecordKey` AS `DriverRecordKey`,`PUI_0_0`.`CreatedAt_UTC` AS `DriverCreatedAt_UTC`,`PUI_0_0`.`CreatedBy` AS `DriverCreatedBy`,`PUI_0_0`.`ModifiedAt_UTC` AS `DriverModifiedAt_UTC`,`PUI_0_0`.`ModifiedBy` AS `DriverModifiedBy`,`PUI_0_0`.`RecordDeleted` AS `DriverRecordDeleted`,`PJT1`.`EntityId` AS `EntityScenarioEntityId`,`PJT1`.`ScenarioId` AS `EntityScenarioScenarioId`,`PEP_1_0`.`Title` AS `EntityScenarioTitle`,`PEP_1_0`.`Address_fsx` AS `EntityScenarioAddress_fsx`,`PEP_1_0`.`City` AS `EntityScenarioCity`,`PEP_1_0`.`Province` AS `EntityScenarioProvince`,`PEP_1_0`.`Country` AS `EntityScenarioCountry`,`PEP_1_0`.`PostalCode_fsx` AS `EntityScenarioPostalCode_fsx`,`PEP_1_0`.`Phone_fsx` AS `EntityScenarioPhone_fsx`,`PEP_1_0`.`FaxNumber_fsx` AS `EntityScenarioFaxNumber_fsx`,`PEP_1_0`.`Email_fsx` AS `EntityScenarioEmail_fsx`,`PEP_1_0`.`Discriminator` AS `EntityScenarioDiscriminator`,`PJT2`.`EntityId` AS `PermitIssuerEntityId`,`PEP_2_0`.`Title` AS `PermitIssuerTitle`,`PEP_2_0`.`Address_fsx` AS `PermitIssuerAddress_fsx`,`PEP_2_0`.`City` AS `PermitIssuerCity`,`PEP_2_0`.`Province` AS `PermitIssuerProvince`,`PEP_2_0`.`Country` AS `PermitIssuerCountry`,`PEP_2_0`.`PostalCode_fsx` AS `PermitIssuerPostalCode_fsx`,`PEP_2_0`.`Phone_fsx` AS `PermitIssuerPhone_fsx`,`PEP_2_0`.`FaxNumber_fsx` AS `PermitIssuerFaxNumber_fsx`,`PEP_2_0`.`Email_fsx` AS `PermitIssuerEmail_fsx`,`PEP_2_0`.`Discriminator` AS `PermitIssuerDiscriminator`,`PJT3`.`Plate` AS `VehicleProfilePlate`,`PJT3`.`VIN` AS `VehicleProfileVIN`,`PJT3`.`Make` AS `VehicleProfileMake`,`PJT3`.`Model` AS `VehicleProfileModel`,`PJT3`.`Province` AS `VehicleProfileProvince`,`PJT3`.`Color` AS `VehicleProfileColor`,`PJT3`.`Year` AS `VehicleProfileYear`,`PJT3`.`TransportCategory` AS `VehicleProfileTransportCategory`,`PJT3`.`Cargo_Height` AS `VehicleProfileCargo_Height`,`PJT3`.`Cargo_Weight` AS `VehicleProfileCargo_Weight`,`PJT3`.`Cargo_Length` AS `VehicleProfileCargo_Length`,`PJT3`.`Cargo_Width` AS `VehicleProfileCargo_Width`,`PJT3`.`Capacity_Passengers` AS `VehicleProfileCapacity_Passengers`,`PJT3`.`Capacity_Luggage` AS `VehicleProfileCapacity_Luggage`,`PJT3`.`VehicleType` AS `VehicleProfileVehicleType` from (((((((((`H_Synced_CVOs` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_Synced_Permits` `RJT` on(((`RJT`.`CVOId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_Synced_Drivers` `PJT0` on(((`RJT`.`DriverId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `PUI_0_0` on(((`PJT0`.`UserId` = `PUI_0_0`.`Id`) and ((0 <> `PUI_0_0`.`RecordDeleted`) is not true)))) join `H_AAA_EntityScenarios` `PJT1` on(((`RJT`.`ActENUM` = `PJT1`.`PermittedActENUM`) and ((0 <> `PJT1`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_EntityProfile` `PEP_1_0` on(((`PJT1`.`EntityId` = `PEP_1_0`.`Id`) and ((0 <> `PEP_1_0`.`RecordDeleted`) is not true)))) join `H_Synced_PermitIssuers` `PJT2` on(((`RJT`.`PermitIssuerId` = `PJT2`.`Id`) and ((0 <> `PJT2`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_EntityProfile` `PEP_2_0` on(((`PJT2`.`EntityId` = `PEP_2_0`.`Id`) and ((0 <> `PEP_2_0`.`RecordDeleted`) is not true)))) join `H_Synced_VehicleProfile` `PJT3` on(((`RJT`.`VehicleId` = `PJT3`.`Id`) and ((0 <> `PJT3`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_CVOServicesSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_CVOServicesSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_CVOServicesSuperDetail` AS select `BaseTable`.`Id` AS `CVOId`,`BaseTable`.`EntityId` AS `CVOEntityId`,`AP`.`Title` AS `CVOEntityTitle`,`AP`.`Address_fsx` AS `CVOEntityAddress_fsx`,`AP`.`City` AS `CVOEntityCity`,`AP`.`Province` AS `CVOEntityProvince`,`AP`.`Country` AS `CVOEntityCountry`,`AP`.`PostalCode_fsx` AS `CVOEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `CVOEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `CVOEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `CVOEntityEmail_fsx`,`AP`.`Discriminator` AS `CVOEntityDiscriminator`,`RJT`.`ServiceId` AS `ServiceId`,`RJT`.`ServiceCategory` AS `ServiceCategory`,`PJT0`.`ServiceType` AS `ServiceBaseServiceType`,`PJT0`.`ServiceClass` AS `ServiceBaseServiceClass` from (((`H_Synced_CVOs` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_Synced_CVOServices` `RJT` on(((`RJT`.`CVOId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_Synced_ServiceBases` `PJT0` on(((`RJT`.`ServiceId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_CVOVehiclesSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_CVOVehiclesSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_CVOVehiclesSuperDetail` AS select `BaseTable`.`Id` AS `CVOId`,`BaseTable`.`EntityId` AS `CVOEntityId`,`AP`.`Title` AS `CVOEntityTitle`,`AP`.`Address_fsx` AS `CVOEntityAddress_fsx`,`AP`.`City` AS `CVOEntityCity`,`AP`.`Province` AS `CVOEntityProvince`,`AP`.`Country` AS `CVOEntityCountry`,`AP`.`PostalCode_fsx` AS `CVOEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `CVOEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `CVOEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `CVOEntityEmail_fsx`,`AP`.`Discriminator` AS `CVOEntityDiscriminator`,`RJT`.`VehicleId` AS `VehicleId`,`RJT`.`HasRule` AS `HasRule`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`RJT`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`PJT0`.`Plate` AS `VehicleProfilePlate`,`PJT0`.`VIN` AS `VehicleProfileVIN`,`PJT0`.`Make` AS `VehicleProfileMake`,`PJT0`.`Model` AS `VehicleProfileModel`,`PJT0`.`Province` AS `VehicleProfileProvince`,`PJT0`.`Color` AS `VehicleProfileColor`,`PJT0`.`Year` AS `VehicleProfileYear`,`PJT0`.`TransportCategory` AS `VehicleProfileTransportCategory`,`PJT0`.`Cargo_Height` AS `VehicleProfileCargo_Height`,`PJT0`.`Cargo_Weight` AS `VehicleProfileCargo_Weight`,`PJT0`.`Cargo_Length` AS `VehicleProfileCargo_Length`,`PJT0`.`Cargo_Width` AS `VehicleProfileCargo_Width`,`PJT0`.`Capacity_Passengers` AS `VehicleProfileCapacity_Passengers`,`PJT0`.`Capacity_Luggage` AS `VehicleProfileCapacity_Luggage`,`PJT0`.`VehicleType` AS `VehicleProfileVehicleType` from (((`H_Synced_CVOs` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_Synced_CVOVehicles` `RJT` on(((`RJT`.`CVOId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_Synced_VehicleProfile` `PJT0` on(((`RJT`.`VehicleId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_ClientDeviceInfo`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_ClientDeviceInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_ClientDeviceInfo` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`ClientOS` AS `ClientOS`,`BaseTable`.`DeviceModel` AS `DeviceModel`,`BaseTable`.`AppID` AS `AppID`,`BaseTable`.`VehicleQRCode` AS `VehicleQRCode`,`BaseTable`.`AppVersion` AS `AppVersion` from `_ClientDeviceInfo` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_DelegatedDispatchContract`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DelegatedDispatchContract`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_DelegatedDispatchContract` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`RequestId` AS `RequestId`,`BaseTable`.`BatchId` AS `BatchId`,`BaseTable`.`DelegatedToType` AS `DelegatedToType`,`BaseTable`.`DelegatedToId` AS `DelegatedToId`,`BaseTable`.`Status` AS `Status`,`BaseTable`.`ExpiresAt_UTC` AS `ExpiresAt_UTC`,`BaseTable`.`CompletedAt_UTC` AS `CompletedAt_UTC`,`BaseTable`.`DelegatedMethod` AS `DelegatedMethod`,`BaseTable`.`ScopeType` AS `ScopeType`,`BaseTable`.`ScopeId` AS `ScopeId`,`BaseTable`.`SessionId` AS `SessionId`,`BaseTable`.`WindowStart_UTC` AS `WindowStart_UTC`,`BaseTable`.`WindowEnd_UTC` AS `WindowEnd_UTC`,`BaseTable`.`PolicyVersionRef` AS `PolicyVersionRef`,`BaseTable`.`ConfigVersionRef` AS `ConfigVersionRef`,`BaseTable`.`OperationModeSnapshot` AS `OperationModeSnapshot`,`BaseTable`.`DelegateServiceIdentity` AS `DelegateServiceIdentity`,`BaseTable`.`ActivatedAt_UTC` AS `ActivatedAt_UTC`,`BaseTable`.`AcceptedAt_UTC` AS `AcceptedAt_UTC`,`BaseTable`.`ReclaimedAt_UTC` AS `ReclaimedAt_UTC`,`BaseTable`.`ReclaimReason` AS `ReclaimReason`,`BaseTable`.`ReleaseReason` AS `ReleaseReason`,`BaseTable`.`ParticipantFocus` AS `ParticipantFocus`,`BaseTable`.`ActorConfigRefs` AS `ActorConfigRefs`,`BaseTable`.`BasketPolicyRef` AS `BasketPolicyRef` from `_DelegatedDispatchContracts` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_DispatchRuleArtifactsDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DispatchRuleArtifactsDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_DispatchRuleArtifactsDetail` AS select `BaseTable`.`Id` AS `DispatchRuleVersionId`,`BaseTable`.`RuleSetId` AS `DispatchRuleVersionRuleSetId`,`BaseTable`.`VersionNo` AS `DispatchRuleVersionVersionNo`,`BaseTable`.`LifecycleState` AS `DispatchRuleVersionLifecycleState`,`BaseTable`.`SourceHash` AS `DispatchRuleVersionSourceHash`,`BaseTable`.`CompiledArtifactId` AS `DispatchRuleVersionCompiledArtifactId`,`BaseTable`.`ValidationResult` AS `DispatchRuleVersionValidationResult`,`BaseTable`.`ActivatedAt_UTC` AS `DispatchRuleVersionActivatedAt_UTC`,`RJT`.`ArtifactType` AS `ArtifactType`,`RJT`.`ArtifactFormatVersion` AS `ArtifactFormatVersion`,`RJT`.`ArtifactBlob` AS `ArtifactBlob`,`RJT`.`CompiledAt_UTC` AS `CompiledAt_UTC`,`RJT`.`CompileMode` AS `CompileMode`,`RJT`.`CompileStatus` AS `CompileStatus`,`RJT`.`CompileError` AS `CompileError` from (`_DispatchRuleVersions` `BaseTable` join `_DispatchRuleArtifacts` `RJT` on(((`RJT`.`RuleVersionId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_DispatchRuleSet`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DispatchRuleSet`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_DispatchRuleSet` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Name` AS `Name`,`BaseTable`.`PolicyFamily` AS `PolicyFamily`,`BaseTable`.`OwnerScopeType` AS `OwnerScopeType`,`BaseTable`.`OwnerScopeId` AS `OwnerScopeId`,`BaseTable`.`Status` AS `Status` from `_DispatchRuleSets` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_DispatchRuleSetSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DispatchRuleSetSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_DispatchRuleSetSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Name` AS `Name`,`BaseTable`.`PolicyFamily` AS `PolicyFamily`,`BaseTable`.`OwnerScopeType` AS `OwnerScopeType`,`BaseTable`.`OwnerScopeId` AS `OwnerScopeId`,`BaseTable`.`Status` AS `Status`,`TempQuery0`.`RelatedEntityCount` AS `DispatchRuleVersionsCount` from (`_DispatchRuleSets` `BaseTable` left join (select `RT0`.`RuleSetId` AS `RuleSetId`,count(`RT0`.`RuleSetId`) AS `RelatedEntityCount` from `_DispatchRuleVersions` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`RuleSetId`) `TempQuery0` on((`TempQuery0`.`RuleSetId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_DispatchRuleVersion`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DispatchRuleVersion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_DispatchRuleVersion` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`RuleSetId` AS `RuleSetId`,`BaseTable`.`VersionNo` AS `VersionNo`,`BaseTable`.`LifecycleState` AS `LifecycleState`,`BaseTable`.`SourceHash` AS `SourceHash`,`BaseTable`.`CompiledArtifactId` AS `CompiledArtifactId`,`BaseTable`.`ValidationResult` AS `ValidationResult`,`BaseTable`.`ActivatedAt_UTC` AS `ActivatedAt_UTC` from `_DispatchRuleVersions` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_DispatchRuleVersionSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DispatchRuleVersionSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_DispatchRuleVersionSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`RuleSetId` AS `RuleSetId`,`BaseTable`.`VersionNo` AS `VersionNo`,`BaseTable`.`LifecycleState` AS `LifecycleState`,`BaseTable`.`SourceHash` AS `SourceHash`,`BaseTable`.`CompiledArtifactId` AS `CompiledArtifactId`,`BaseTable`.`ValidationResult` AS `ValidationResult`,`BaseTable`.`ActivatedAt_UTC` AS `ActivatedAt_UTC`,`TempQuery0`.`RelatedEntityCount` AS `DispatchRuleArtifactsCount`,`TempQuery1`.`RelatedEntityCount` AS `DispatchRulesCount` from ((`_DispatchRuleVersions` `BaseTable` left join (select `RT0`.`RuleVersionId` AS `RuleVersionId`,count(`RT0`.`RuleVersionId`) AS `RelatedEntityCount` from `_DispatchRuleArtifacts` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`RuleVersionId`) `TempQuery0` on((`TempQuery0`.`RuleVersionId` = `BaseTable`.`Id`))) left join (select `RT1`.`RuleVersionId` AS `RuleVersionId`,count(`RT1`.`RuleVersionId`) AS `RelatedEntityCount` from `_DispatchRules` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`RuleVersionId`) `TempQuery1` on((`TempQuery1`.`RuleVersionId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_DispatchRuleVersionsDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DispatchRuleVersionsDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_DispatchRuleVersionsDetail` AS select `BaseTable`.`Id` AS `DispatchRuleSetId`,`BaseTable`.`Name` AS `DispatchRuleSetName`,`BaseTable`.`PolicyFamily` AS `DispatchRuleSetPolicyFamily`,`BaseTable`.`OwnerScopeType` AS `DispatchRuleSetOwnerScopeType`,`BaseTable`.`OwnerScopeId` AS `DispatchRuleSetOwnerScopeId`,`BaseTable`.`Status` AS `DispatchRuleSetStatus`,`RJT`.`VersionNo` AS `VersionNo`,`RJT`.`LifecycleState` AS `LifecycleState`,`RJT`.`SourceHash` AS `SourceHash`,`RJT`.`CompiledArtifactId` AS `CompiledArtifactId`,`RJT`.`ValidationResult` AS `ValidationResult`,`RJT`.`ActivatedAt_UTC` AS `ActivatedAt_UTC` from (`_DispatchRuleSets` `BaseTable` join `_DispatchRuleVersions` `RJT` on(((`RJT`.`RuleSetId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_Distributor`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_Distributor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_Distributor` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`EntityId` AS `EntityId`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator` from (`H_Synced_Distributors` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_DistributorCVOsSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DistributorCVOsSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_DistributorCVOsSuperDetail` AS select `BaseTable`.`Id` AS `DistributorId`,`BaseTable`.`EntityId` AS `DistributorEntityId`,`AP`.`Title` AS `DistributorEntityTitle`,`AP`.`Address_fsx` AS `DistributorEntityAddress_fsx`,`AP`.`City` AS `DistributorEntityCity`,`AP`.`Province` AS `DistributorEntityProvince`,`AP`.`Country` AS `DistributorEntityCountry`,`AP`.`PostalCode_fsx` AS `DistributorEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `DistributorEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `DistributorEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `DistributorEntityEmail_fsx`,`AP`.`Discriminator` AS `DistributorEntityDiscriminator`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`HasRule` AS `HasRule`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`RJT`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`PJT0`.`EntityId` AS `CVOEntityId`,`PEP_0_0`.`Title` AS `CVOTitle`,`PEP_0_0`.`Address_fsx` AS `CVOAddress_fsx`,`PEP_0_0`.`City` AS `CVOCity`,`PEP_0_0`.`Province` AS `CVOProvince`,`PEP_0_0`.`Country` AS `CVOCountry`,`PEP_0_0`.`PostalCode_fsx` AS `CVOPostalCode_fsx`,`PEP_0_0`.`Phone_fsx` AS `CVOPhone_fsx`,`PEP_0_0`.`FaxNumber_fsx` AS `CVOFaxNumber_fsx`,`PEP_0_0`.`Email_fsx` AS `CVOEmail_fsx`,`PEP_0_0`.`Discriminator` AS `CVODiscriminator` from ((((`H_Synced_Distributors` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_Synced_DistributorCVOs` `RJT` on(((`RJT`.`DistributorId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_Synced_CVOs` `PJT0` on(((`RJT`.`CVOId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_EntityProfile` `PEP_0_0` on(((`PJT0`.`EntityId` = `PEP_0_0`.`Id`) and ((0 <> `PEP_0_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_DistributorDriversSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DistributorDriversSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_DistributorDriversSuperDetail` AS select `BaseTable`.`Id` AS `DistributorId`,`BaseTable`.`EntityId` AS `DistributorEntityId`,`AP`.`Title` AS `DistributorEntityTitle`,`AP`.`Address_fsx` AS `DistributorEntityAddress_fsx`,`AP`.`City` AS `DistributorEntityCity`,`AP`.`Province` AS `DistributorEntityProvince`,`AP`.`Country` AS `DistributorEntityCountry`,`AP`.`PostalCode_fsx` AS `DistributorEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `DistributorEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `DistributorEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `DistributorEntityEmail_fsx`,`AP`.`Discriminator` AS `DistributorEntityDiscriminator`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`HasRule` AS `HasRule`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`RJT`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`PJT0`.`UserId` AS `DriverUserId`,`PJT0`.`PersonCVOId` AS `DriverPersonCVOId`,`PUI_0_0`.`Firstname_fsx` AS `DriverFirstname_fsx`,`PUI_0_0`.`Lastname_fsx` AS `DriverLastname_fsx`,`PUI_0_0`.`Username` AS `DriverUsername`,`PUI_0_0`.`Email_fsx` AS `DriverEmail_fsx`,`PUI_0_0`.`Email_hash` AS `DriverEmail_hash`,`PUI_0_0`.`EmailConfirmed` AS `DriverEmailConfirmed`,`PUI_0_0`.`CellPhone_fsx` AS `DriverCellPhone_fsx`,`PUI_0_0`.`CellPhone_hash` AS `DriverCellPhone_hash`,`PUI_0_0`.`CellPhoneConfirmed` AS `DriverCellPhoneConfirmed`,`PUI_0_0`.`IssuedBy` AS `DriverIssuedBy`,`PUI_0_0`.`RecordKey` AS `DriverRecordKey`,`PUI_0_0`.`CreatedAt_UTC` AS `DriverCreatedAt_UTC`,`PUI_0_0`.`CreatedBy` AS `DriverCreatedBy`,`PUI_0_0`.`ModifiedAt_UTC` AS `DriverModifiedAt_UTC`,`PUI_0_0`.`ModifiedBy` AS `DriverModifiedBy`,`PUI_0_0`.`RecordDeleted` AS `DriverRecordDeleted` from ((((`H_Synced_Distributors` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_Synced_DistributorDrivers` `RJT` on(((`RJT`.`DistributorId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_Synced_Drivers` `PJT0` on(((`RJT`.`DriverId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `PUI_0_0` on(((`PJT0`.`UserId` = `PUI_0_0`.`Id`) and ((0 <> `PUI_0_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_DistributorPermitsExtraDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DistributorPermitsExtraDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_DistributorPermitsExtraDetail` AS select `BaseTable`.`Id` AS `DistributorId`,`BaseTable`.`EntityId` AS `DistributorEntityId`,`AP`.`Title` AS `DistributorEntityTitle`,`AP`.`Address_fsx` AS `DistributorEntityAddress_fsx`,`AP`.`City` AS `DistributorEntityCity`,`AP`.`Province` AS `DistributorEntityProvince`,`AP`.`Country` AS `DistributorEntityCountry`,`AP`.`PostalCode_fsx` AS `DistributorEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `DistributorEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `DistributorEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `DistributorEntityEmail_fsx`,`AP`.`Discriminator` AS `DistributorEntityDiscriminator`,`RJT`.`HUBId` AS `HUBId`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`VehicleId` AS `VehicleId`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`ActENUM` AS `ActENUM`,`RJT`.`PermitIssuerId` AS `PermitIssuerId`,`RJT`.`PermitTypeId` AS `PermitTypeId`,`RJT`.`Code` AS `Code`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`PJT0`.`UserId` AS `DriverUserId`,`PJT0`.`PersonCVOId` AS `DriverPersonCVOId`,`PUI_0_0`.`Firstname_fsx` AS `DriverFirstname_fsx`,`PUI_0_0`.`Lastname_fsx` AS `DriverLastname_fsx`,`PUI_0_0`.`Username` AS `DriverUsername`,`PUI_0_0`.`Email_fsx` AS `DriverEmail_fsx`,`PUI_0_0`.`Email_hash` AS `DriverEmail_hash`,`PUI_0_0`.`EmailConfirmed` AS `DriverEmailConfirmed`,`PUI_0_0`.`CellPhone_fsx` AS `DriverCellPhone_fsx`,`PUI_0_0`.`CellPhone_hash` AS `DriverCellPhone_hash`,`PUI_0_0`.`CellPhoneConfirmed` AS `DriverCellPhoneConfirmed`,`PUI_0_0`.`IssuedBy` AS `DriverIssuedBy`,`PUI_0_0`.`RecordKey` AS `DriverRecordKey`,`PUI_0_0`.`CreatedAt_UTC` AS `DriverCreatedAt_UTC`,`PUI_0_0`.`CreatedBy` AS `DriverCreatedBy`,`PUI_0_0`.`ModifiedAt_UTC` AS `DriverModifiedAt_UTC`,`PUI_0_0`.`ModifiedBy` AS `DriverModifiedBy`,`PUI_0_0`.`RecordDeleted` AS `DriverRecordDeleted`,`PJT1`.`EntityId` AS `EntityScenarioEntityId`,`PJT1`.`ScenarioId` AS `EntityScenarioScenarioId`,`PEP_1_0`.`Title` AS `EntityScenarioTitle`,`PEP_1_0`.`Address_fsx` AS `EntityScenarioAddress_fsx`,`PEP_1_0`.`City` AS `EntityScenarioCity`,`PEP_1_0`.`Province` AS `EntityScenarioProvince`,`PEP_1_0`.`Country` AS `EntityScenarioCountry`,`PEP_1_0`.`PostalCode_fsx` AS `EntityScenarioPostalCode_fsx`,`PEP_1_0`.`Phone_fsx` AS `EntityScenarioPhone_fsx`,`PEP_1_0`.`FaxNumber_fsx` AS `EntityScenarioFaxNumber_fsx`,`PEP_1_0`.`Email_fsx` AS `EntityScenarioEmail_fsx`,`PEP_1_0`.`Discriminator` AS `EntityScenarioDiscriminator`,`PJT2`.`EntityId` AS `PermitIssuerEntityId`,`PEP_2_0`.`Title` AS `PermitIssuerTitle`,`PEP_2_0`.`Address_fsx` AS `PermitIssuerAddress_fsx`,`PEP_2_0`.`City` AS `PermitIssuerCity`,`PEP_2_0`.`Province` AS `PermitIssuerProvince`,`PEP_2_0`.`Country` AS `PermitIssuerCountry`,`PEP_2_0`.`PostalCode_fsx` AS `PermitIssuerPostalCode_fsx`,`PEP_2_0`.`Phone_fsx` AS `PermitIssuerPhone_fsx`,`PEP_2_0`.`FaxNumber_fsx` AS `PermitIssuerFaxNumber_fsx`,`PEP_2_0`.`Email_fsx` AS `PermitIssuerEmail_fsx`,`PEP_2_0`.`Discriminator` AS `PermitIssuerDiscriminator`,`PJT3`.`Plate` AS `VehicleProfilePlate`,`PJT3`.`VIN` AS `VehicleProfileVIN`,`PJT3`.`Make` AS `VehicleProfileMake`,`PJT3`.`Model` AS `VehicleProfileModel`,`PJT3`.`Province` AS `VehicleProfileProvince`,`PJT3`.`Color` AS `VehicleProfileColor`,`PJT3`.`Year` AS `VehicleProfileYear`,`PJT3`.`TransportCategory` AS `VehicleProfileTransportCategory`,`PJT3`.`Cargo_Height` AS `VehicleProfileCargo_Height`,`PJT3`.`Cargo_Weight` AS `VehicleProfileCargo_Weight`,`PJT3`.`Cargo_Length` AS `VehicleProfileCargo_Length`,`PJT3`.`Cargo_Width` AS `VehicleProfileCargo_Width`,`PJT3`.`Capacity_Passengers` AS `VehicleProfileCapacity_Passengers`,`PJT3`.`Capacity_Luggage` AS `VehicleProfileCapacity_Luggage`,`PJT3`.`VehicleType` AS `VehicleProfileVehicleType` from (((((((((`H_Synced_Distributors` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_Synced_Permits` `RJT` on(((`RJT`.`DistributorId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_Synced_Drivers` `PJT0` on(((`RJT`.`DriverId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `PUI_0_0` on(((`PJT0`.`UserId` = `PUI_0_0`.`Id`) and ((0 <> `PUI_0_0`.`RecordDeleted`) is not true)))) join `H_AAA_EntityScenarios` `PJT1` on(((`RJT`.`ActENUM` = `PJT1`.`PermittedActENUM`) and ((0 <> `PJT1`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_EntityProfile` `PEP_1_0` on(((`PJT1`.`EntityId` = `PEP_1_0`.`Id`) and ((0 <> `PEP_1_0`.`RecordDeleted`) is not true)))) join `H_Synced_PermitIssuers` `PJT2` on(((`RJT`.`PermitIssuerId` = `PJT2`.`Id`) and ((0 <> `PJT2`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_EntityProfile` `PEP_2_0` on(((`PJT2`.`EntityId` = `PEP_2_0`.`Id`) and ((0 <> `PEP_2_0`.`RecordDeleted`) is not true)))) join `H_Synced_VehicleProfile` `PJT3` on(((`RJT`.`VehicleId` = `PJT3`.`Id`) and ((0 <> `PJT3`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_Driver`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_Driver`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_Driver` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`UserId` AS `UserId`,`BaseTable`.`PersonCVOId` AS `PersonCVOId`,`UI`.`Firstname_fsx` AS `UserFirstname_fsx`,`UI`.`Lastname_fsx` AS `UserLastname_fsx`,`UI`.`Username` AS `UserUsername`,`UI`.`Email_fsx` AS `UserEmail_fsx`,`UI`.`Email_hash` AS `UserEmail_hash`,`UI`.`EmailConfirmed` AS `UserEmailConfirmed`,`UI`.`CellPhone_fsx` AS `UserCellPhone_fsx`,`UI`.`CellPhone_hash` AS `UserCellPhone_hash`,`UI`.`CellPhoneConfirmed` AS `UserCellPhoneConfirmed`,`UI`.`IssuedBy` AS `UserIssuedBy` from (`H_Synced_Drivers` `BaseTable` join `H_AAA_Synced_UserInfo` `UI` on(((`BaseTable`.`UserId` = `UI`.`Id`) and ((0 <> `UI`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_DriverPermitVehicleTypesDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DriverPermitVehicleTypesDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_DriverPermitVehicleTypesDetail` AS select `BaseTable`.`Id` AS `PermitId`,`BaseTable`.`HUBId` AS `PermitHUBId`,`BaseTable`.`DistributorId` AS `PermitDistributorId`,`BaseTable`.`CVOId` AS `PermitCVOId`,`BaseTable`.`VehicleId` AS `PermitVehicleId`,`BaseTable`.`DriverId` AS `PermitDriverId`,`BaseTable`.`ActENUM` AS `PermitActENUM`,`BaseTable`.`PermitIssuerId` AS `PermitPermitIssuerId`,`BaseTable`.`PermitTypeId` AS `PermitPermitTypeId`,`BaseTable`.`Code` AS `PermitCode`,`BaseTable`.`IssuedDate_UTC` AS `PermitIssuedDate_UTC`,`RJT`.`VehicleType` AS `VehicleType` from (`H_Synced_Permits` `BaseTable` join `H_Synced_DriverPermitVehicleTypes` `RJT` on(((`RJT`.`PermitId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_DriversSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DriversSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_DriversSuperDetail` AS select `BaseTable`.`Id` AS `CVOId`,`BaseTable`.`EntityId` AS `CVOEntityId`,`AP`.`Title` AS `CVOEntityTitle`,`AP`.`Address_fsx` AS `CVOEntityAddress_fsx`,`AP`.`City` AS `CVOEntityCity`,`AP`.`Province` AS `CVOEntityProvince`,`AP`.`Country` AS `CVOEntityCountry`,`AP`.`PostalCode_fsx` AS `CVOEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `CVOEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `CVOEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `CVOEntityEmail_fsx`,`AP`.`Discriminator` AS `CVOEntityDiscriminator`,`RJT`.`UserId` AS `UserId`,`PJT0`.`Firstname_fsx` AS `UserInfoFirstname_fsx`,`PJT0`.`Lastname_fsx` AS `UserInfoLastname_fsx`,`PJT0`.`Username` AS `UserInfoUsername`,`PJT0`.`Email_fsx` AS `UserInfoEmail_fsx`,`PJT0`.`Email_hash` AS `UserInfoEmail_hash`,`PJT0`.`EmailConfirmed` AS `UserInfoEmailConfirmed`,`PJT0`.`CellPhone_fsx` AS `UserInfoCellPhone_fsx`,`PJT0`.`CellPhone_hash` AS `UserInfoCellPhone_hash`,`PJT0`.`CellPhoneConfirmed` AS `UserInfoCellPhoneConfirmed`,`PJT0`.`IssuedBy` AS `UserInfoIssuedBy` from (((`H_Synced_CVOs` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_Synced_Drivers` `RJT` on(((`RJT`.`PersonCVOId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `PJT0` on(((`RJT`.`UserId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
-- Final view structure for view `Vi_DPA_Feature`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_Feature`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_Feature` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Title` AS `Title` from `H_Synced_Features` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_FeatureSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_FeatureSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_FeatureSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Title` AS `Title`,`TempQuery0`.`RelatedEntityCount` AS `VehiclesCount` from (`H_Synced_Features` `BaseTable` left join (select `RT0`.`FeatureId` AS `FeatureId`,count(`RT0`.`FeatureId`) AS `RelatedEntityCount` from `H_Synced_VehicleFeatures` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`FeatureId`) `TempQuery0` on((`TempQuery0`.`FeatureId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_HUB`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_HUB`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_HUB` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`EntityId` AS `EntityId`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator` from (`H_Synced_HUBs` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_HUBDistributorsSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_HUBDistributorsSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_HUBDistributorsSuperDetail` AS select `BaseTable`.`Id` AS `HUBId`,`BaseTable`.`EntityId` AS `HUBEntityId`,`AP`.`Title` AS `HUBEntityTitle`,`AP`.`Address_fsx` AS `HUBEntityAddress_fsx`,`AP`.`City` AS `HUBEntityCity`,`AP`.`Province` AS `HUBEntityProvince`,`AP`.`Country` AS `HUBEntityCountry`,`AP`.`PostalCode_fsx` AS `HUBEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `HUBEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `HUBEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `HUBEntityEmail_fsx`,`AP`.`Discriminator` AS `HUBEntityDiscriminator`,`RJT`.`DistributorId` AS `DistributorId`,`RJT`.`ParticipationCategory` AS `ParticipationCategory`,`RJT`.`HasRule` AS `HasRule`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`RJT`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`PJT0`.`EntityId` AS `DistributorEntityId`,`PEP_0_0`.`Title` AS `DistributorTitle`,`PEP_0_0`.`Address_fsx` AS `DistributorAddress_fsx`,`PEP_0_0`.`City` AS `DistributorCity`,`PEP_0_0`.`Province` AS `DistributorProvince`,`PEP_0_0`.`Country` AS `DistributorCountry`,`PEP_0_0`.`PostalCode_fsx` AS `DistributorPostalCode_fsx`,`PEP_0_0`.`Phone_fsx` AS `DistributorPhone_fsx`,`PEP_0_0`.`FaxNumber_fsx` AS `DistributorFaxNumber_fsx`,`PEP_0_0`.`Email_fsx` AS `DistributorEmail_fsx`,`PEP_0_0`.`Discriminator` AS `DistributorDiscriminator` from ((((`H_Synced_HUBs` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_Synced_HUBDistributors` `RJT` on(((`RJT`.`HUBId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_Synced_Distributors` `PJT0` on(((`RJT`.`DistributorId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_EntityProfile` `PEP_0_0` on(((`PJT0`.`EntityId` = `PEP_0_0`.`Id`) and ((0 <> `PEP_0_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_HUBPermitsExtraDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_HUBPermitsExtraDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_HUBPermitsExtraDetail` AS select `BaseTable`.`Id` AS `HUBId`,`BaseTable`.`EntityId` AS `HUBEntityId`,`AP`.`Title` AS `HUBEntityTitle`,`AP`.`Address_fsx` AS `HUBEntityAddress_fsx`,`AP`.`City` AS `HUBEntityCity`,`AP`.`Province` AS `HUBEntityProvince`,`AP`.`Country` AS `HUBEntityCountry`,`AP`.`PostalCode_fsx` AS `HUBEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `HUBEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `HUBEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `HUBEntityEmail_fsx`,`AP`.`Discriminator` AS `HUBEntityDiscriminator`,`RJT`.`DistributorId` AS `DistributorId`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`VehicleId` AS `VehicleId`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`ActENUM` AS `ActENUM`,`RJT`.`PermitIssuerId` AS `PermitIssuerId`,`RJT`.`PermitTypeId` AS `PermitTypeId`,`RJT`.`Code` AS `Code`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`PJT0`.`UserId` AS `DriverUserId`,`PJT0`.`PersonCVOId` AS `DriverPersonCVOId`,`PUI_0_0`.`Firstname_fsx` AS `DriverFirstname_fsx`,`PUI_0_0`.`Lastname_fsx` AS `DriverLastname_fsx`,`PUI_0_0`.`Username` AS `DriverUsername`,`PUI_0_0`.`Email_fsx` AS `DriverEmail_fsx`,`PUI_0_0`.`Email_hash` AS `DriverEmail_hash`,`PUI_0_0`.`EmailConfirmed` AS `DriverEmailConfirmed`,`PUI_0_0`.`CellPhone_fsx` AS `DriverCellPhone_fsx`,`PUI_0_0`.`CellPhone_hash` AS `DriverCellPhone_hash`,`PUI_0_0`.`CellPhoneConfirmed` AS `DriverCellPhoneConfirmed`,`PUI_0_0`.`IssuedBy` AS `DriverIssuedBy`,`PUI_0_0`.`RecordKey` AS `DriverRecordKey`,`PUI_0_0`.`CreatedAt_UTC` AS `DriverCreatedAt_UTC`,`PUI_0_0`.`CreatedBy` AS `DriverCreatedBy`,`PUI_0_0`.`ModifiedAt_UTC` AS `DriverModifiedAt_UTC`,`PUI_0_0`.`ModifiedBy` AS `DriverModifiedBy`,`PUI_0_0`.`RecordDeleted` AS `DriverRecordDeleted`,`PJT1`.`EntityId` AS `EntityScenarioEntityId`,`PJT1`.`ScenarioId` AS `EntityScenarioScenarioId`,`PEP_1_0`.`Title` AS `EntityScenarioTitle`,`PEP_1_0`.`Address_fsx` AS `EntityScenarioAddress_fsx`,`PEP_1_0`.`City` AS `EntityScenarioCity`,`PEP_1_0`.`Province` AS `EntityScenarioProvince`,`PEP_1_0`.`Country` AS `EntityScenarioCountry`,`PEP_1_0`.`PostalCode_fsx` AS `EntityScenarioPostalCode_fsx`,`PEP_1_0`.`Phone_fsx` AS `EntityScenarioPhone_fsx`,`PEP_1_0`.`FaxNumber_fsx` AS `EntityScenarioFaxNumber_fsx`,`PEP_1_0`.`Email_fsx` AS `EntityScenarioEmail_fsx`,`PEP_1_0`.`Discriminator` AS `EntityScenarioDiscriminator`,`PJT2`.`EntityId` AS `PermitIssuerEntityId`,`PEP_2_0`.`Title` AS `PermitIssuerTitle`,`PEP_2_0`.`Address_fsx` AS `PermitIssuerAddress_fsx`,`PEP_2_0`.`City` AS `PermitIssuerCity`,`PEP_2_0`.`Province` AS `PermitIssuerProvince`,`PEP_2_0`.`Country` AS `PermitIssuerCountry`,`PEP_2_0`.`PostalCode_fsx` AS `PermitIssuerPostalCode_fsx`,`PEP_2_0`.`Phone_fsx` AS `PermitIssuerPhone_fsx`,`PEP_2_0`.`FaxNumber_fsx` AS `PermitIssuerFaxNumber_fsx`,`PEP_2_0`.`Email_fsx` AS `PermitIssuerEmail_fsx`,`PEP_2_0`.`Discriminator` AS `PermitIssuerDiscriminator`,`PJT3`.`Plate` AS `VehicleProfilePlate`,`PJT3`.`VIN` AS `VehicleProfileVIN`,`PJT3`.`Make` AS `VehicleProfileMake`,`PJT3`.`Model` AS `VehicleProfileModel`,`PJT3`.`Province` AS `VehicleProfileProvince`,`PJT3`.`Color` AS `VehicleProfileColor`,`PJT3`.`Year` AS `VehicleProfileYear`,`PJT3`.`TransportCategory` AS `VehicleProfileTransportCategory`,`PJT3`.`Cargo_Height` AS `VehicleProfileCargo_Height`,`PJT3`.`Cargo_Weight` AS `VehicleProfileCargo_Weight`,`PJT3`.`Cargo_Length` AS `VehicleProfileCargo_Length`,`PJT3`.`Cargo_Width` AS `VehicleProfileCargo_Width`,`PJT3`.`Capacity_Passengers` AS `VehicleProfileCapacity_Passengers`,`PJT3`.`Capacity_Luggage` AS `VehicleProfileCapacity_Luggage`,`PJT3`.`VehicleType` AS `VehicleProfileVehicleType` from (((((((((`H_Synced_HUBs` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_Synced_Permits` `RJT` on(((`RJT`.`HUBId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_Synced_Drivers` `PJT0` on(((`RJT`.`DriverId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `PUI_0_0` on(((`PJT0`.`UserId` = `PUI_0_0`.`Id`) and ((0 <> `PUI_0_0`.`RecordDeleted`) is not true)))) join `H_AAA_EntityScenarios` `PJT1` on(((`RJT`.`ActENUM` = `PJT1`.`PermittedActENUM`) and ((0 <> `PJT1`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_EntityProfile` `PEP_1_0` on(((`PJT1`.`EntityId` = `PEP_1_0`.`Id`) and ((0 <> `PEP_1_0`.`RecordDeleted`) is not true)))) join `H_Synced_PermitIssuers` `PJT2` on(((`RJT`.`PermitIssuerId` = `PJT2`.`Id`) and ((0 <> `PJT2`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_EntityProfile` `PEP_2_0` on(((`PJT2`.`EntityId` = `PEP_2_0`.`Id`) and ((0 <> `PEP_2_0`.`RecordDeleted`) is not true)))) join `H_Synced_VehicleProfile` `PJT3` on(((`RJT`.`VehicleId` = `PJT3`.`Id`) and ((0 <> `PJT3`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
-- Final view structure for view `Vi_DPA_Permit`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_Permit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_Permit` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`HUBId` AS `HUBId`,`BaseTable`.`DistributorId` AS `DistributorId`,`BaseTable`.`CVOId` AS `CVOId`,`BaseTable`.`VehicleId` AS `VehicleId`,`BaseTable`.`DriverId` AS `DriverId`,`BaseTable`.`ActENUM` AS `ActENUM`,`BaseTable`.`PermitIssuerId` AS `PermitIssuerId`,`BaseTable`.`PermitTypeId` AS `PermitTypeId`,`BaseTable`.`Code` AS `Code`,`BaseTable`.`IssuedDate_UTC` AS `IssuedDate_UTC` from `H_Synced_Permits` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_PermitIssuer`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_PermitIssuer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_PermitIssuer` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`EntityId` AS `EntityId`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator` from (`H_Synced_PermitIssuers` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_PermitIssuerPermitsExtraDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_PermitIssuerPermitsExtraDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_PermitIssuerPermitsExtraDetail` AS select `BaseTable`.`Id` AS `PermitIssuerId`,`BaseTable`.`EntityId` AS `PermitIssuerEntityId`,`AP`.`Title` AS `PermitIssuerEntityTitle`,`AP`.`Address_fsx` AS `PermitIssuerEntityAddress_fsx`,`AP`.`City` AS `PermitIssuerEntityCity`,`AP`.`Province` AS `PermitIssuerEntityProvince`,`AP`.`Country` AS `PermitIssuerEntityCountry`,`AP`.`PostalCode_fsx` AS `PermitIssuerEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `PermitIssuerEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `PermitIssuerEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `PermitIssuerEntityEmail_fsx`,`AP`.`Discriminator` AS `PermitIssuerEntityDiscriminator`,`RJT`.`HUBId` AS `HUBId`,`RJT`.`DistributorId` AS `DistributorId`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`VehicleId` AS `VehicleId`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`ActENUM` AS `ActENUM`,`RJT`.`PermitTypeId` AS `PermitTypeId`,`RJT`.`Code` AS `Code`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`PJT0`.`UserId` AS `DriverUserId`,`PJT0`.`PersonCVOId` AS `DriverPersonCVOId`,`PUI_0_0`.`Firstname_fsx` AS `DriverFirstname_fsx`,`PUI_0_0`.`Lastname_fsx` AS `DriverLastname_fsx`,`PUI_0_0`.`Username` AS `DriverUsername`,`PUI_0_0`.`Email_fsx` AS `DriverEmail_fsx`,`PUI_0_0`.`Email_hash` AS `DriverEmail_hash`,`PUI_0_0`.`EmailConfirmed` AS `DriverEmailConfirmed`,`PUI_0_0`.`CellPhone_fsx` AS `DriverCellPhone_fsx`,`PUI_0_0`.`CellPhone_hash` AS `DriverCellPhone_hash`,`PUI_0_0`.`CellPhoneConfirmed` AS `DriverCellPhoneConfirmed`,`PUI_0_0`.`IssuedBy` AS `DriverIssuedBy`,`PUI_0_0`.`RecordKey` AS `DriverRecordKey`,`PUI_0_0`.`CreatedAt_UTC` AS `DriverCreatedAt_UTC`,`PUI_0_0`.`CreatedBy` AS `DriverCreatedBy`,`PUI_0_0`.`ModifiedAt_UTC` AS `DriverModifiedAt_UTC`,`PUI_0_0`.`ModifiedBy` AS `DriverModifiedBy`,`PUI_0_0`.`RecordDeleted` AS `DriverRecordDeleted`,`PJT1`.`EntityId` AS `EntityScenarioEntityId`,`PJT1`.`ScenarioId` AS `EntityScenarioScenarioId`,`PEP_1_0`.`Title` AS `EntityScenarioTitle`,`PEP_1_0`.`Address_fsx` AS `EntityScenarioAddress_fsx`,`PEP_1_0`.`City` AS `EntityScenarioCity`,`PEP_1_0`.`Province` AS `EntityScenarioProvince`,`PEP_1_0`.`Country` AS `EntityScenarioCountry`,`PEP_1_0`.`PostalCode_fsx` AS `EntityScenarioPostalCode_fsx`,`PEP_1_0`.`Phone_fsx` AS `EntityScenarioPhone_fsx`,`PEP_1_0`.`FaxNumber_fsx` AS `EntityScenarioFaxNumber_fsx`,`PEP_1_0`.`Email_fsx` AS `EntityScenarioEmail_fsx`,`PEP_1_0`.`Discriminator` AS `EntityScenarioDiscriminator`,`PJT2`.`Plate` AS `VehicleProfilePlate`,`PJT2`.`VIN` AS `VehicleProfileVIN`,`PJT2`.`Make` AS `VehicleProfileMake`,`PJT2`.`Model` AS `VehicleProfileModel`,`PJT2`.`Province` AS `VehicleProfileProvince`,`PJT2`.`Color` AS `VehicleProfileColor`,`PJT2`.`Year` AS `VehicleProfileYear`,`PJT2`.`TransportCategory` AS `VehicleProfileTransportCategory`,`PJT2`.`Cargo_Height` AS `VehicleProfileCargo_Height`,`PJT2`.`Cargo_Weight` AS `VehicleProfileCargo_Weight`,`PJT2`.`Cargo_Length` AS `VehicleProfileCargo_Length`,`PJT2`.`Cargo_Width` AS `VehicleProfileCargo_Width`,`PJT2`.`Capacity_Passengers` AS `VehicleProfileCapacity_Passengers`,`PJT2`.`Capacity_Luggage` AS `VehicleProfileCapacity_Luggage`,`PJT2`.`VehicleType` AS `VehicleProfileVehicleType` from (((((((`H_Synced_PermitIssuers` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_Synced_Permits` `RJT` on(((`RJT`.`PermitIssuerId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_Synced_Drivers` `PJT0` on(((`RJT`.`DriverId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `PUI_0_0` on(((`PJT0`.`UserId` = `PUI_0_0`.`Id`) and ((0 <> `PUI_0_0`.`RecordDeleted`) is not true)))) join `H_AAA_EntityScenarios` `PJT1` on(((`RJT`.`ActENUM` = `PJT1`.`PermittedActENUM`) and ((0 <> `PJT1`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_EntityProfile` `PEP_1_0` on(((`PJT1`.`EntityId` = `PEP_1_0`.`Id`) and ((0 <> `PEP_1_0`.`RecordDeleted`) is not true)))) join `H_Synced_VehicleProfile` `PJT2` on(((`RJT`.`VehicleId` = `PJT2`.`Id`) and ((0 <> `PJT2`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_PermitIssuerSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_PermitIssuerSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_PermitIssuerSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`EntityId` AS `EntityId`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator`,`TempQuery0`.`RelatedEntityCount` AS `PermitsCount` from ((`H_Synced_PermitIssuers` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) left join (select `RT0`.`PermitIssuerId` AS `PermitIssuerId`,count(`RT0`.`PermitIssuerId`) AS `RelatedEntityCount` from `H_Synced_Permits` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`PermitIssuerId`) `TempQuery0` on((`TempQuery0`.`PermitIssuerId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_PermitSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_PermitSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_PermitSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`HUBId` AS `HUBId`,`BaseTable`.`DistributorId` AS `DistributorId`,`BaseTable`.`CVOId` AS `CVOId`,`BaseTable`.`VehicleId` AS `VehicleId`,`BaseTable`.`DriverId` AS `DriverId`,`BaseTable`.`ActENUM` AS `ActENUM`,`BaseTable`.`PermitIssuerId` AS `PermitIssuerId`,`BaseTable`.`PermitTypeId` AS `PermitTypeId`,`BaseTable`.`Code` AS `Code`,`BaseTable`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`TempQuery0`.`RelatedEntityCount` AS `DriverVehicleTypesCount`,`TempQuery1`.`RelatedEntityCount` AS `StatusesCount` from ((`H_Synced_Permits` `BaseTable` left join (select `RT0`.`PermitId` AS `PermitId`,count(`RT0`.`PermitId`) AS `RelatedEntityCount` from `H_Synced_DriverPermitVehicleTypes` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`PermitId`) `TempQuery0` on((`TempQuery0`.`PermitId` = `BaseTable`.`Id`))) left join (select `RT1`.`PermitId` AS `PermitId`,count(`RT1`.`PermitId`) AS `RelatedEntityCount` from `H_Synced_PermitStatuses` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`PermitId`) `TempQuery1` on((`TempQuery1`.`PermitId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_RollCallSession`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_RollCallSession`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_RollCallSession` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`DelegatedDispatchContractId` AS `DelegatedDispatchContractId`,`BaseTable`.`SessionStatus` AS `SessionStatus`,`BaseTable`.`ScopeType` AS `ScopeType`,`BaseTable`.`ScopeId` AS `ScopeId`,`BaseTable`.`WindowStart_UTC` AS `WindowStart_UTC`,`BaseTable`.`WindowEnd_UTC` AS `WindowEnd_UTC`,`BaseTable`.`SignupClosesAt_UTC` AS `SignupClosesAt_UTC`,`BaseTable`.`ModeType` AS `ModeType`,`BaseTable`.`TopXPerZone` AS `TopXPerZone`,`BaseTable`.`PrimaryGroupSnapshot` AS `PrimaryGroupSnapshot`,`BaseTable`.`StartedAt_UTC` AS `StartedAt_UTC`,`BaseTable`.`ClosedAt_UTC` AS `ClosedAt_UTC` from `_RollCallSessions` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_RollCallSessionParticipantsDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_RollCallSessionParticipantsDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_RollCallSessionParticipantsDetail` AS select `BaseTable`.`Id` AS `RollCallSessionId`,`BaseTable`.`DelegatedDispatchContractId` AS `RollCallSessionDelegatedDispatchContractId`,`BaseTable`.`SessionStatus` AS `RollCallSessionSessionStatus`,`BaseTable`.`ScopeType` AS `RollCallSessionScopeType`,`BaseTable`.`ScopeId` AS `RollCallSessionScopeId`,`BaseTable`.`WindowStart_UTC` AS `RollCallSessionWindowStart_UTC`,`BaseTable`.`WindowEnd_UTC` AS `RollCallSessionWindowEnd_UTC`,`BaseTable`.`SignupClosesAt_UTC` AS `RollCallSessionSignupClosesAt_UTC`,`BaseTable`.`ModeType` AS `RollCallSessionModeType`,`BaseTable`.`TopXPerZone` AS `RollCallSessionTopXPerZone`,`BaseTable`.`PrimaryGroupSnapshot` AS `RollCallSessionPrimaryGroupSnapshot`,`BaseTable`.`StartedAt_UTC` AS `RollCallSessionStartedAt_UTC`,`BaseTable`.`ClosedAt_UTC` AS `RollCallSessionClosedAt_UTC`,`RJT`.`ParticipantId` AS `ParticipantId`,`RJT`.`ActivitySessionId` AS `ActivitySessionId`,`RJT`.`PriorityGroupId` AS `PriorityGroupId`,`RJT`.`SignupAt_UTC` AS `SignupAt_UTC`,`RJT`.`SignupOrder` AS `SignupOrder`,`RJT`.`RosterState` AS `RosterState`,`RJT`.`EligibilitySnapshot` AS `EligibilitySnapshot` from (`_RollCallSessions` `BaseTable` join `_RollCallSessionParticipants` `RJT` on(((`RJT`.`SessionId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_RollCallSessionSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_RollCallSessionSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_RollCallSessionSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`DelegatedDispatchContractId` AS `DelegatedDispatchContractId`,`BaseTable`.`SessionStatus` AS `SessionStatus`,`BaseTable`.`ScopeType` AS `ScopeType`,`BaseTable`.`ScopeId` AS `ScopeId`,`BaseTable`.`WindowStart_UTC` AS `WindowStart_UTC`,`BaseTable`.`WindowEnd_UTC` AS `WindowEnd_UTC`,`BaseTable`.`SignupClosesAt_UTC` AS `SignupClosesAt_UTC`,`BaseTable`.`ModeType` AS `ModeType`,`BaseTable`.`TopXPerZone` AS `TopXPerZone`,`BaseTable`.`PrimaryGroupSnapshot` AS `PrimaryGroupSnapshot`,`BaseTable`.`StartedAt_UTC` AS `StartedAt_UTC`,`BaseTable`.`ClosedAt_UTC` AS `ClosedAt_UTC`,`TempQuery0`.`RelatedEntityCount` AS `ParticipantsCount`,`TempQuery1`.`RelatedEntityCount` AS `RollCallWavesCount` from ((`_RollCallSessions` `BaseTable` left join (select `RT0`.`SessionId` AS `SessionId`,count(`RT0`.`SessionId`) AS `RelatedEntityCount` from `_RollCallSessionParticipants` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`SessionId`) `TempQuery0` on((`TempQuery0`.`SessionId` = `BaseTable`.`Id`))) left join (select `RT1`.`SessionId` AS `SessionId`,count(`RT1`.`SessionId`) AS `RelatedEntityCount` from `_RollCallWaves` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`SessionId`) `TempQuery1` on((`TempQuery1`.`SessionId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
-- Final view structure for view `Vi_DPA_ServiceBase`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_ServiceBase`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_ServiceBase` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`ServiceType` AS `ServiceType`,`BaseTable`.`ServiceClass` AS `ServiceClass` from `H_Synced_ServiceBases` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_ServiceBaseSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_ServiceBaseSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_ServiceBaseSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`ServiceType` AS `ServiceType`,`BaseTable`.`ServiceClass` AS `ServiceClass`,`TempQuery0`.`RelatedEntityCount` AS `CVOServicesCount` from (`H_Synced_ServiceBases` `BaseTable` left join (select `RT0`.`ServiceId` AS `ServiceId`,count(`RT0`.`ServiceId`) AS `RelatedEntityCount` from `H_Synced_CVOServices` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`ServiceId`) `TempQuery0` on((`TempQuery0`.`ServiceId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportBatch`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportBatch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportBatch` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`FMS_OId` AS `FMS_OId`,`BaseTable`.`DistributorId` AS `DistributorId`,`BaseTable`.`TotalFareAtDispatch` AS `TotalFareAtDispatch`,`BaseTable`.`IsEditable` AS `IsEditable`,`BaseTable`.`IsChargePerItem` AS `IsChargePerItem` from `H_TransportBatches` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportBatchItemsSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportBatchItemsSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportBatchItemsSuperDetail` AS select `BaseTable`.`Id` AS `TransportReqDeliveryId`,`BaseTable`.`IsEditable` AS `TransportReqDeliveryIsEditable`,`BaseTable`.`CustomerId` AS `TransportReqDeliveryCustomerId`,`BaseTable`.`DistributorId` AS `TransportReqDeliveryDistributorId`,`BaseTable`.`CVOId` AS `TransportReqDeliveryCVOId`,`BaseTable`.`FromContactLocationId` AS `TransportReqDeliveryFromContactLocationId`,`BaseTable`.`ToContactLocationId` AS `TransportReqDeliveryToContactLocationId`,`BaseTable`.`PickupAfterDateTime` AS `TransportReqDeliveryPickupAfterDateTime`,`BaseTable`.`PickupBeforeDateTime` AS `TransportReqDeliveryPickupBeforeDateTime`,`BaseTable`.`DropOffAfterDateTime` AS `TransportReqDeliveryDropOffAfterDateTime`,`BaseTable`.`DropOffBeforeDateTime` AS `TransportReqDeliveryDropOffBeforeDateTime`,`BaseTable`.`VehicleType` AS `TransportReqDeliveryVehicleType`,`BaseTable`.`VehicleProfileSubType` AS `TransportReqDeliveryVehicleProfileSubType`,`BaseTable`.`ServiceClass` AS `TransportReqDeliveryServiceClass`,`BaseTable`.`ActionOnAbsentReceiver` AS `TransportReqDeliveryActionOnAbsentReceiver`,`BaseTable`.`Comments` AS `TransportReqDeliveryComments`,`BaseTable`.`FareAtSubmission` AS `TransportReqDeliveryFareAtSubmission`,`BaseTable`.`PromoCode` AS `TransportReqDeliveryPromoCode`,`BaseTable`.`Status` AS `TransportReqDeliveryStatus`,`RJT`.`BatchId` AS `BatchId`,`RJT`.`ItemOrder` AS `ItemOrder`,`RJT`.`TransportReqRideId` AS `TransportReqRideId`,`RJT`.`Discriminator` AS `Discriminator`,`PJT0`.`IsEditable` AS `TransportReqRideIsEditable`,`PJT0`.`CustomerId` AS `TransportReqRideCustomerId`,`PJT0`.`DistributorId` AS `TransportReqRideDistributorId`,`PJT0`.`CVOId` AS `TransportReqRideCVOId`,`PJT0`.`FromContactLocationId` AS `TransportReqRideFromContactLocationId`,`PJT0`.`ToContactLocationId` AS `TransportReqRideToContactLocationId`,`PJT0`.`PickupAfterDateTime` AS `TransportReqRidePickupAfterDateTime`,`PJT0`.`PickupBeforeDateTime` AS `TransportReqRidePickupBeforeDateTime`,`PJT0`.`DropOffAfterDateTime` AS `TransportReqRideDropOffAfterDateTime`,`PJT0`.`DropOffBeforeDateTime` AS `TransportReqRideDropOffBeforeDateTime`,`PJT0`.`VehicleType` AS `TransportReqRideVehicleType`,`PJT0`.`VehicleProfileSubType` AS `TransportReqRideVehicleProfileSubType`,`PJT0`.`ServiceClass` AS `TransportReqRideServiceClass`,`PJT0`.`TotalRequiredSeats` AS `TransportReqRideTotalRequiredSeats`,`PJT0`.`NumberOfLuggages` AS `TransportReqRideNumberOfLuggages`,`PJT0`.`FeaturesJSON` AS `TransportReqRideFeaturesJSON`,`PJT0`.`Comments` AS `TransportReqRideComments`,`PJT0`.`FareAtSubmission` AS `TransportReqRideFareAtSubmission`,`PJT0`.`PromoCode` AS `TransportReqRidePromoCode`,`PJT0`.`HubCarrierInfo` AS `TransportReqRideHubCarrierInfo`,`PJT0`.`Status` AS `TransportReqRideStatus` from ((`H_TransportReqDeliveries` `BaseTable` join `H_TransportBatchItems` `RJT` on(((`RJT`.`TransportReqDeliveryId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_TransportReqRides` `PJT0` on(((`RJT`.`TransportReqRideId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportContactLocation`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportContactLocation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportContactLocation` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`ContactId` AS `ContactId`,`BaseTable`.`FavAdrLabel` AS `FavAdrLabel`,`BaseTable`.`LocationId` AS `LocationId` from `H_TransportContactLocations` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportContactLocationSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportContactLocationSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportContactLocationSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`ContactId` AS `ContactId`,`BaseTable`.`FavAdrLabel` AS `FavAdrLabel`,`BaseTable`.`LocationId` AS `LocationId`,`TempQuery0`.`RelatedEntityCount` AS `TransportReqDeliveriesCount`,`TempQuery1`.`RelatedEntityCount` AS `TransportReqRidesCount` from ((`H_TransportContactLocations` `BaseTable` left join (select `RT0`.`FromContactLocationId` AS `FromContactLocationId`,count(`RT0`.`FromContactLocationId`) AS `RelatedEntityCount` from `H_TransportReqDeliveries` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`FromContactLocationId`) `TempQuery0` on((`TempQuery0`.`FromContactLocationId` = `BaseTable`.`Id`))) left join (select `RT1`.`FromContactLocationId` AS `FromContactLocationId`,count(`RT1`.`FromContactLocationId`) AS `RelatedEntityCount` from `H_TransportReqRides` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`FromContactLocationId`) `TempQuery1` on((`TempQuery1`.`FromContactLocationId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportContactLocationsSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportContactLocationsSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportContactLocationsSuperDetail` AS select `BaseTable`.`Id` AS `TransportContactRegistryId`,`BaseTable`.`PossibleUserId` AS `TransportContactRegistryPossibleUserId`,`BaseTable`.`Firstname_fsx` AS `TransportContactRegistryFirstname_fsx`,`BaseTable`.`Lastname_fsx` AS `TransportContactRegistryLastname_fsx`,`BaseTable`.`PossibleEntityId` AS `TransportContactRegistryPossibleEntityId`,`BaseTable`.`Title` AS `TransportContactRegistryTitle`,`BaseTable`.`MainLocationId` AS `TransportContactRegistryMainLocationId`,`BaseTable`.`Buzzer` AS `TransportContactRegistryBuzzer`,`BaseTable`.`Language` AS `TransportContactRegistryLanguage`,`BaseTable`.`TimeZone` AS `TransportContactRegistryTimeZone`,`BaseTable`.`Currency` AS `TransportContactRegistryCurrency`,`BaseTable`.`SignatureUri` AS `TransportContactRegistrySignatureUri`,`BaseTable`.`PhotoUri` AS `TransportContactRegistryPhotoUri`,`BaseTable`.`BirthDate_fsx` AS `TransportContactRegistryBirthDate_fsx`,`BaseTable`.`Notification_SMS_fsx` AS `TransportContactRegistryNotification_SMS_fsx`,`BaseTable`.`Notification_Phone_fsx` AS `TransportContactRegistryNotification_Phone_fsx`,`BaseTable`.`Notification_Phone_Extention_fsx` AS `TransportContactRegistryNotification_Phone_Extention_fsx`,`BaseTable`.`Notification_Email_fsx` AS `TransportContactRegistryNotification_Email_fsx`,`BaseTable`.`Notification_WhatsApp_fsx` AS `TransportContactRegistryNotification_WhatsApp_fsx`,`AP`.`Title` AS `TransportContactRegistryEntityTitle`,`AP`.`Address_fsx` AS `TransportContactRegistryEntityAddress_fsx`,`AP`.`City` AS `TransportContactRegistryEntityCity`,`AP`.`Province` AS `TransportContactRegistryEntityProvince`,`AP`.`Country` AS `TransportContactRegistryEntityCountry`,`AP`.`PostalCode_fsx` AS `TransportContactRegistryEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `TransportContactRegistryEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `TransportContactRegistryEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `TransportContactRegistryEntityEmail_fsx`,`AP`.`Discriminator` AS `TransportContactRegistryEntityDiscriminator`,`UI`.`Firstname_fsx` AS `TransportContactRegistryUserFirstname_fsx`,`UI`.`Lastname_fsx` AS `TransportContactRegistryUserLastname_fsx`,`UI`.`Username` AS `TransportContactRegistryUserUsername`,`UI`.`Email_fsx` AS `TransportContactRegistryUserEmail_fsx`,`UI`.`Email_hash` AS `TransportContactRegistryUserEmail_hash`,`UI`.`EmailConfirmed` AS `TransportContactRegistryUserEmailConfirmed`,`UI`.`CellPhone_fsx` AS `TransportContactRegistryUserCellPhone_fsx`,`UI`.`CellPhone_hash` AS `TransportContactRegistryUserCellPhone_hash`,`UI`.`CellPhoneConfirmed` AS `TransportContactRegistryUserCellPhoneConfirmed`,`UI`.`IssuedBy` AS `TransportContactRegistryUserIssuedBy`,`RJT`.`FavAdrLabel` AS `FavAdrLabel`,`RJT`.`LocationId` AS `LocationId`,`PJT0`.`Title` AS `TransportLocationTitle`,`PJT0`.`Latitude` AS `TransportLocationLatitude`,`PJT0`.`Longitude` AS `TransportLocationLongitude`,`PJT0`.`Address` AS `TransportLocationAddress`,`PJT0`.`City` AS `TransportLocationCity`,`PJT0`.`Province` AS `TransportLocationProvince`,`PJT0`.`PostalCode` AS `TransportLocationPostalCode`,`PJT0`.`PlaceId` AS `TransportLocationPlaceId`,`PJT0`.`GoogleFullAddress` AS `TransportLocationGoogleFullAddress` from ((((`H_TransportContactRegistry` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`PossibleEntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `UI` on(((`BaseTable`.`PossibleUserId` = `UI`.`Id`) and ((0 <> `UI`.`RecordDeleted`) is not true)))) join `H_TransportContactLocations` `RJT` on(((`RJT`.`ContactId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_TransportLocations` `PJT0` on(((`RJT`.`LocationId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportContactRegistriesSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportContactRegistriesSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportContactRegistriesSuperDetail` AS select `BaseTable`.`Id` AS `TransportLocationId`,`BaseTable`.`Title` AS `TransportLocationTitle`,`BaseTable`.`Latitude` AS `TransportLocationLatitude`,`BaseTable`.`Longitude` AS `TransportLocationLongitude`,`BaseTable`.`Address` AS `TransportLocationAddress`,`BaseTable`.`City` AS `TransportLocationCity`,`BaseTable`.`Province` AS `TransportLocationProvince`,`BaseTable`.`PostalCode` AS `TransportLocationPostalCode`,`BaseTable`.`PlaceId` AS `TransportLocationPlaceId`,`BaseTable`.`GoogleFullAddress` AS `TransportLocationGoogleFullAddress`,`RJT`.`PossibleUserId` AS `PossibleUserId`,`RJT`.`Firstname_fsx` AS `Firstname_fsx`,`RJT`.`Lastname_fsx` AS `Lastname_fsx`,`RJT`.`PossibleEntityId` AS `PossibleEntityId`,`RJT`.`Title` AS `Title`,`RJT`.`Buzzer` AS `Buzzer`,`RJT`.`Language` AS `Language`,`RJT`.`TimeZone` AS `TimeZone`,`RJT`.`Currency` AS `Currency`,`RJT`.`SignatureUri` AS `SignatureUri`,`RJT`.`PhotoUri` AS `PhotoUri`,`RJT`.`BirthDate_fsx` AS `BirthDate_fsx`,`RJT`.`Notification_SMS_fsx` AS `Notification_SMS_fsx`,`RJT`.`Notification_Phone_fsx` AS `Notification_Phone_fsx`,`RJT`.`Notification_Phone_Extention_fsx` AS `Notification_Phone_Extention_fsx`,`RJT`.`Notification_Email_fsx` AS `Notification_Email_fsx`,`RJT`.`Notification_WhatsApp_fsx` AS `Notification_WhatsApp_fsx`,`PJT0`.`Firstname_fsx` AS `UserInfoFirstname_fsx`,`PJT0`.`Lastname_fsx` AS `UserInfoLastname_fsx`,`PJT0`.`Username` AS `UserInfoUsername`,`PJT0`.`Email_fsx` AS `UserInfoEmail_fsx`,`PJT0`.`Email_hash` AS `UserInfoEmail_hash`,`PJT0`.`EmailConfirmed` AS `UserInfoEmailConfirmed`,`PJT0`.`CellPhone_fsx` AS `UserInfoCellPhone_fsx`,`PJT0`.`CellPhone_hash` AS `UserInfoCellPhone_hash`,`PJT0`.`CellPhoneConfirmed` AS `UserInfoCellPhoneConfirmed`,`PJT0`.`IssuedBy` AS `UserInfoIssuedBy` from ((`H_TransportLocations` `BaseTable` join `H_TransportContactRegistry` `RJT` on(((`RJT`.`MainLocationId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `PJT0` on(((`RJT`.`PossibleUserId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportContactRegistry`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportContactRegistry`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportContactRegistry` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`PossibleUserId` AS `PossibleUserId`,`BaseTable`.`Firstname_fsx` AS `Firstname_fsx`,`BaseTable`.`Lastname_fsx` AS `Lastname_fsx`,`BaseTable`.`PossibleEntityId` AS `PossibleEntityId`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`MainLocationId` AS `MainLocationId`,`BaseTable`.`Buzzer` AS `Buzzer`,`BaseTable`.`Language` AS `Language`,`BaseTable`.`TimeZone` AS `TimeZone`,`BaseTable`.`Currency` AS `Currency`,`BaseTable`.`SignatureUri` AS `SignatureUri`,`BaseTable`.`PhotoUri` AS `PhotoUri`,`BaseTable`.`BirthDate_fsx` AS `BirthDate_fsx`,`BaseTable`.`Notification_SMS_fsx` AS `Notification_SMS_fsx`,`BaseTable`.`Notification_Phone_fsx` AS `Notification_Phone_fsx`,`BaseTable`.`Notification_Phone_Extention_fsx` AS `Notification_Phone_Extention_fsx`,`BaseTable`.`Notification_Email_fsx` AS `Notification_Email_fsx`,`BaseTable`.`Notification_WhatsApp_fsx` AS `Notification_WhatsApp_fsx`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator`,`UI`.`Firstname_fsx` AS `UserFirstname_fsx`,`UI`.`Lastname_fsx` AS `UserLastname_fsx`,`UI`.`Username` AS `UserUsername`,`UI`.`Email_fsx` AS `UserEmail_fsx`,`UI`.`Email_hash` AS `UserEmail_hash`,`UI`.`EmailConfirmed` AS `UserEmailConfirmed`,`UI`.`CellPhone_fsx` AS `UserCellPhone_fsx`,`UI`.`CellPhone_hash` AS `UserCellPhone_hash`,`UI`.`CellPhoneConfirmed` AS `UserCellPhoneConfirmed`,`UI`.`IssuedBy` AS `UserIssuedBy` from ((`H_TransportContactRegistry` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`PossibleEntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `UI` on(((`BaseTable`.`PossibleUserId` = `UI`.`Id`) and ((0 <> `UI`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportContactRegistrySummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportContactRegistrySummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportContactRegistrySummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`PossibleUserId` AS `PossibleUserId`,`BaseTable`.`Firstname_fsx` AS `Firstname_fsx`,`BaseTable`.`Lastname_fsx` AS `Lastname_fsx`,`BaseTable`.`PossibleEntityId` AS `PossibleEntityId`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`MainLocationId` AS `MainLocationId`,`BaseTable`.`Buzzer` AS `Buzzer`,`BaseTable`.`Language` AS `Language`,`BaseTable`.`TimeZone` AS `TimeZone`,`BaseTable`.`Currency` AS `Currency`,`BaseTable`.`SignatureUri` AS `SignatureUri`,`BaseTable`.`PhotoUri` AS `PhotoUri`,`BaseTable`.`BirthDate_fsx` AS `BirthDate_fsx`,`BaseTable`.`Notification_SMS_fsx` AS `Notification_SMS_fsx`,`BaseTable`.`Notification_Phone_fsx` AS `Notification_Phone_fsx`,`BaseTable`.`Notification_Phone_Extention_fsx` AS `Notification_Phone_Extention_fsx`,`BaseTable`.`Notification_Email_fsx` AS `Notification_Email_fsx`,`BaseTable`.`Notification_WhatsApp_fsx` AS `Notification_WhatsApp_fsx`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator`,`UI`.`Firstname_fsx` AS `UserFirstname_fsx`,`UI`.`Lastname_fsx` AS `UserLastname_fsx`,`UI`.`Username` AS `UserUsername`,`UI`.`Email_fsx` AS `UserEmail_fsx`,`UI`.`Email_hash` AS `UserEmail_hash`,`UI`.`EmailConfirmed` AS `UserEmailConfirmed`,`UI`.`CellPhone_fsx` AS `UserCellPhone_fsx`,`UI`.`CellPhone_hash` AS `UserCellPhone_hash`,`UI`.`CellPhoneConfirmed` AS `UserCellPhoneConfirmed`,`UI`.`IssuedBy` AS `UserIssuedBy`,`TempQuery0`.`RelatedEntityCount` AS `TransportContactLocationsCount`,`TempQuery1`.`RelatedEntityCount` AS `TransportCustomerContactsCount` from ((((`H_TransportContactRegistry` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`PossibleEntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `UI` on(((`BaseTable`.`PossibleUserId` = `UI`.`Id`) and ((0 <> `UI`.`RecordDeleted`) is not true)))) left join (select `RT0`.`ContactId` AS `ContactId`,count(`RT0`.`ContactId`) AS `RelatedEntityCount` from `H_TransportContactLocations` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`ContactId`) `TempQuery0` on((`TempQuery0`.`ContactId` = `BaseTable`.`Id`))) left join (select `RT1`.`ContactId` AS `ContactId`,count(`RT1`.`ContactId`) AS `RelatedEntityCount` from `H_TransportCustomerContacts` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`ContactId`) `TempQuery1` on((`TempQuery1`.`ContactId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportCustomerContactsSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportCustomerContactsSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportCustomerContactsSuperDetail` AS select `BaseTable`.`Id` AS `TransportContactRegistryId`,`BaseTable`.`PossibleUserId` AS `TransportContactRegistryPossibleUserId`,`BaseTable`.`Firstname_fsx` AS `TransportContactRegistryFirstname_fsx`,`BaseTable`.`Lastname_fsx` AS `TransportContactRegistryLastname_fsx`,`BaseTable`.`PossibleEntityId` AS `TransportContactRegistryPossibleEntityId`,`BaseTable`.`Title` AS `TransportContactRegistryTitle`,`BaseTable`.`MainLocationId` AS `TransportContactRegistryMainLocationId`,`BaseTable`.`Buzzer` AS `TransportContactRegistryBuzzer`,`BaseTable`.`Language` AS `TransportContactRegistryLanguage`,`BaseTable`.`TimeZone` AS `TransportContactRegistryTimeZone`,`BaseTable`.`Currency` AS `TransportContactRegistryCurrency`,`BaseTable`.`SignatureUri` AS `TransportContactRegistrySignatureUri`,`BaseTable`.`PhotoUri` AS `TransportContactRegistryPhotoUri`,`BaseTable`.`BirthDate_fsx` AS `TransportContactRegistryBirthDate_fsx`,`BaseTable`.`Notification_SMS_fsx` AS `TransportContactRegistryNotification_SMS_fsx`,`BaseTable`.`Notification_Phone_fsx` AS `TransportContactRegistryNotification_Phone_fsx`,`BaseTable`.`Notification_Phone_Extention_fsx` AS `TransportContactRegistryNotification_Phone_Extention_fsx`,`BaseTable`.`Notification_Email_fsx` AS `TransportContactRegistryNotification_Email_fsx`,`BaseTable`.`Notification_WhatsApp_fsx` AS `TransportContactRegistryNotification_WhatsApp_fsx`,`UI`.`Firstname_fsx` AS `TransportContactRegistryUserFirstname_fsx`,`UI`.`Lastname_fsx` AS `TransportContactRegistryUserLastname_fsx`,`UI`.`Username` AS `TransportContactRegistryUserUsername`,`UI`.`Email_fsx` AS `TransportContactRegistryUserEmail_fsx`,`UI`.`Email_hash` AS `TransportContactRegistryUserEmail_hash`,`UI`.`EmailConfirmed` AS `TransportContactRegistryUserEmailConfirmed`,`UI`.`CellPhone_fsx` AS `TransportContactRegistryUserCellPhone_fsx`,`UI`.`CellPhone_hash` AS `TransportContactRegistryUserCellPhone_hash`,`UI`.`CellPhoneConfirmed` AS `TransportContactRegistryUserCellPhoneConfirmed`,`UI`.`IssuedBy` AS `TransportContactRegistryUserIssuedBy`,`RJT`.`CustomerId` AS `CustomerId`,`PJT0`.`EntityId` AS `TransportCustomerEntityId`,`PJT0`.`UserId` AS `TransportCustomerUserId`,`PUI_0_0`.`Firstname_fsx` AS `TransportCustomerFirstname_fsx`,`PUI_0_0`.`Lastname_fsx` AS `TransportCustomerLastname_fsx`,`PUI_0_0`.`Username` AS `TransportCustomerUsername`,`PUI_0_0`.`Email_fsx` AS `TransportCustomerEmail_fsx`,`PUI_0_0`.`Email_hash` AS `TransportCustomerEmail_hash`,`PUI_0_0`.`EmailConfirmed` AS `TransportCustomerEmailConfirmed`,`PUI_0_0`.`CellPhone_fsx` AS `TransportCustomerCellPhone_fsx`,`PUI_0_0`.`CellPhone_hash` AS `TransportCustomerCellPhone_hash`,`PUI_0_0`.`CellPhoneConfirmed` AS `TransportCustomerCellPhoneConfirmed`,`PUI_0_0`.`IssuedBy` AS `TransportCustomerIssuedBy`,`PUI_0_0`.`RecordKey` AS `TransportCustomerRecordKey`,`PUI_0_0`.`CreatedAt_UTC` AS `TransportCustomerCreatedAt_UTC`,`PUI_0_0`.`CreatedBy` AS `TransportCustomerCreatedBy`,`PUI_0_0`.`ModifiedAt_UTC` AS `TransportCustomerModifiedAt_UTC`,`PUI_0_0`.`ModifiedBy` AS `TransportCustomerModifiedBy`,`PUI_0_0`.`RecordDeleted` AS `TransportCustomerRecordDeleted` from ((((`H_TransportContactRegistry` `BaseTable` join `H_AAA_Synced_UserInfo` `UI` on(((`BaseTable`.`PossibleUserId` = `UI`.`Id`) and ((0 <> `UI`.`RecordDeleted`) is not true)))) join `H_TransportCustomerContacts` `RJT` on(((`RJT`.`ContactId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_TransportCustomers` `PJT0` on(((`RJT`.`CustomerId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `PUI_0_0` on(((`PJT0`.`UserId` = `PUI_0_0`.`Id`) and ((0 <> `PUI_0_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportFareBaseInclutionsSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportFareBaseInclutionsSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportFareBaseInclutionsSuperDetail` AS select `BaseTable`.`Id` AS `DistributorId`,`BaseTable`.`EntityId` AS `DistributorEntityId`,`AP`.`Title` AS `DistributorEntityTitle`,`AP`.`Address_fsx` AS `DistributorEntityAddress_fsx`,`AP`.`City` AS `DistributorEntityCity`,`AP`.`Province` AS `DistributorEntityProvince`,`AP`.`Country` AS `DistributorEntityCountry`,`AP`.`PostalCode_fsx` AS `DistributorEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `DistributorEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `DistributorEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `DistributorEntityEmail_fsx`,`AP`.`Discriminator` AS `DistributorEntityDiscriminator`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`TransportCategory` AS `TransportCategory`,`RJT`.`ServiceCategory` AS `ServiceCategory`,`RJT`.`VehicleType` AS `VehicleType`,`RJT`.`ServiceClass` AS `ServiceClass`,`RJT`.`IncludedSeatCounts` AS `IncludedSeatCounts`,`RJT`.`IncludedLuggageCounts` AS `IncludedLuggageCounts`,`RJT`.`IncludedParcelCounts` AS `IncludedParcelCounts`,`RJT`.`IncludedWeightKg` AS `IncludedWeightKg`,`RJT`.`IncludedVolumeCubicM` AS `IncludedVolumeCubicM`,`PJT0`.`EntityId` AS `CVOEntityId`,`PEP_0_0`.`Title` AS `CVOTitle`,`PEP_0_0`.`Address_fsx` AS `CVOAddress_fsx`,`PEP_0_0`.`City` AS `CVOCity`,`PEP_0_0`.`Province` AS `CVOProvince`,`PEP_0_0`.`Country` AS `CVOCountry`,`PEP_0_0`.`PostalCode_fsx` AS `CVOPostalCode_fsx`,`PEP_0_0`.`Phone_fsx` AS `CVOPhone_fsx`,`PEP_0_0`.`FaxNumber_fsx` AS `CVOFaxNumber_fsx`,`PEP_0_0`.`Email_fsx` AS `CVOEmail_fsx`,`PEP_0_0`.`Discriminator` AS `CVODiscriminator` from ((((`H_Synced_Distributors` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_TransportFareBaseInclutions` `RJT` on(((`RJT`.`DistributorId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_Synced_CVOs` `PJT0` on(((`RJT`.`CVOId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_EntityProfile` `PEP_0_0` on(((`PJT0`.`EntityId` = `PEP_0_0`.`Id`) and ((0 <> `PEP_0_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportFareCalculation`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportFareCalculation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportFareCalculation` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`DistributorId` AS `DistributorId`,`BaseTable`.`CVOId` AS `CVOId`,`BaseTable`.`TransportCategory` AS `TransportCategory`,`BaseTable`.`ServiceCategory` AS `ServiceCategory`,`BaseTable`.`VehicleType` AS `VehicleType`,`BaseTable`.`ServiceClass` AS `ServiceClass`,`BaseTable`.`CalculationItem` AS `CalculationItem`,`BaseTable`.`CalculationType` AS `CalculationType`,`BaseTable`.`CalculateMethod` AS `CalculateMethod`,`BaseTable`.`CalculationPriority` AS `CalculationPriority`,`BaseTable`.`CalculationUnit` AS `CalculationUnit`,`BaseTable`.`UnitAmount` AS `UnitAmount`,`BaseTable`.`Price` AS `Price`,`BaseTable`.`PriceTable` AS `PriceTable` from `H_TransportFareCalculations` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportFareCalculationsSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportFareCalculationsSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportFareCalculationsSuperDetail` AS select `BaseTable`.`Id` AS `DistributorId`,`BaseTable`.`EntityId` AS `DistributorEntityId`,`AP`.`Title` AS `DistributorEntityTitle`,`AP`.`Address_fsx` AS `DistributorEntityAddress_fsx`,`AP`.`City` AS `DistributorEntityCity`,`AP`.`Province` AS `DistributorEntityProvince`,`AP`.`Country` AS `DistributorEntityCountry`,`AP`.`PostalCode_fsx` AS `DistributorEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `DistributorEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `DistributorEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `DistributorEntityEmail_fsx`,`AP`.`Discriminator` AS `DistributorEntityDiscriminator`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`TransportCategory` AS `TransportCategory`,`RJT`.`ServiceCategory` AS `ServiceCategory`,`RJT`.`VehicleType` AS `VehicleType`,`RJT`.`ServiceClass` AS `ServiceClass`,`RJT`.`CalculationItem` AS `CalculationItem`,`RJT`.`CalculationType` AS `CalculationType`,`RJT`.`CalculateMethod` AS `CalculateMethod`,`RJT`.`CalculationPriority` AS `CalculationPriority`,`RJT`.`CalculationUnit` AS `CalculationUnit`,`RJT`.`UnitAmount` AS `UnitAmount`,`RJT`.`Price` AS `Price`,`RJT`.`PriceTable` AS `PriceTable`,`PJT0`.`EntityId` AS `CVOEntityId`,`PEP_0_0`.`Title` AS `CVOTitle`,`PEP_0_0`.`Address_fsx` AS `CVOAddress_fsx`,`PEP_0_0`.`City` AS `CVOCity`,`PEP_0_0`.`Province` AS `CVOProvince`,`PEP_0_0`.`Country` AS `CVOCountry`,`PEP_0_0`.`PostalCode_fsx` AS `CVOPostalCode_fsx`,`PEP_0_0`.`Phone_fsx` AS `CVOPhone_fsx`,`PEP_0_0`.`FaxNumber_fsx` AS `CVOFaxNumber_fsx`,`PEP_0_0`.`Email_fsx` AS `CVOEmail_fsx`,`PEP_0_0`.`Discriminator` AS `CVODiscriminator` from ((((`H_Synced_Distributors` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_TransportFareCalculations` `RJT` on(((`RJT`.`DistributorId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_Synced_CVOs` `PJT0` on(((`RJT`.`CVOId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_EntityProfile` `PEP_0_0` on(((`PJT0`.`EntityId` = `PEP_0_0`.`Id`) and ((0 <> `PEP_0_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportGeoFenceBase`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportGeoFenceBase`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportGeoFenceBase` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Code` AS `Code`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`Coordinates` AS `Coordinates`,`BaseTable`.`Order` AS `Order` from `H_TransportGeoFenceBases` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportLocation`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportLocation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportLocation` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`Latitude` AS `Latitude`,`BaseTable`.`Longitude` AS `Longitude`,`BaseTable`.`Address` AS `Address`,`BaseTable`.`City` AS `City`,`BaseTable`.`Province` AS `Province`,`BaseTable`.`PostalCode` AS `PostalCode`,`BaseTable`.`PlaceId` AS `PlaceId`,`BaseTable`.`GoogleFullAddress` AS `GoogleFullAddress` from `H_TransportLocations` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportLocationSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportLocationSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportLocationSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`Latitude` AS `Latitude`,`BaseTable`.`Longitude` AS `Longitude`,`BaseTable`.`Address` AS `Address`,`BaseTable`.`City` AS `City`,`BaseTable`.`Province` AS `Province`,`BaseTable`.`PostalCode` AS `PostalCode`,`BaseTable`.`PlaceId` AS `PlaceId`,`BaseTable`.`GoogleFullAddress` AS `GoogleFullAddress`,`TempQuery0`.`RelatedEntityCount` AS `TransportContactLocationsCount`,`TempQuery1`.`RelatedEntityCount` AS `TransportContactRegistryCount` from ((`H_TransportLocations` `BaseTable` left join (select `RT0`.`LocationId` AS `LocationId`,count(`RT0`.`LocationId`) AS `RelatedEntityCount` from `H_TransportContactLocations` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`LocationId`) `TempQuery0` on((`TempQuery0`.`LocationId` = `BaseTable`.`Id`))) left join (select `RT1`.`MainLocationId` AS `MainLocationId`,count(`RT1`.`MainLocationId`) AS `RelatedEntityCount` from `H_TransportContactRegistry` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`MainLocationId`) `TempQuery1` on((`TempQuery1`.`MainLocationId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportReqDeliveriesSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportReqDeliveriesSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportReqDeliveriesSuperDetail` AS select `BaseTable`.`Id` AS `DistributorId`,`BaseTable`.`EntityId` AS `DistributorEntityId`,`AP`.`Title` AS `DistributorEntityTitle`,`AP`.`Address_fsx` AS `DistributorEntityAddress_fsx`,`AP`.`City` AS `DistributorEntityCity`,`AP`.`Province` AS `DistributorEntityProvince`,`AP`.`Country` AS `DistributorEntityCountry`,`AP`.`PostalCode_fsx` AS `DistributorEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `DistributorEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `DistributorEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `DistributorEntityEmail_fsx`,`AP`.`Discriminator` AS `DistributorEntityDiscriminator`,`RJT`.`IsEditable` AS `IsEditable`,`RJT`.`CustomerId` AS `CustomerId`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`FromContactLocationId` AS `FromContactLocationId`,`RJT`.`ToContactLocationId` AS `ToContactLocationId`,`RJT`.`PickupAfterDateTime` AS `PickupAfterDateTime`,`RJT`.`PickupAfterDateTime_UTC` AS `PickupAfterDateTime_UTC`,`RJT`.`PickupBeforeDateTime` AS `PickupBeforeDateTime`,`RJT`.`PickupBeforeDateTime_UTC` AS `PickupBeforeDateTime_UTC`,`RJT`.`DropOffAfterDateTime` AS `DropOffAfterDateTime`,`RJT`.`DropOffAfterDateTime_UTC` AS `DropOffAfterDateTime_UTC`,`RJT`.`DropOffBeforeDateTime` AS `DropOffBeforeDateTime`,`RJT`.`DropOffBeforeDateTime_UTC` AS `DropOffBeforeDateTime_UTC`,`RJT`.`VehicleType` AS `VehicleType`,`RJT`.`VehicleProfileSubType` AS `VehicleProfileSubType`,`RJT`.`ServiceClass` AS `ServiceClass`,`RJT`.`ActionOnAbsentReceiver` AS `ActionOnAbsentReceiver`,`RJT`.`Comments` AS `Comments`,`RJT`.`FareAtSubmission` AS `FareAtSubmission`,`RJT`.`PromoCode` AS `PromoCode`,`RJT`.`PaymentCategory` AS `PaymentCategory`,`RJT`.`PaymentMethod` AS `PaymentMethod`,`RJT`.`PaidAt_UTC` AS `PaidAt_UTC`,`RJT`.`Status` AS `Status`,`PJT0`.`ContactId` AS `TransportContactLocationContactId`,`PJT0`.`FavAdrLabel` AS `TransportContactLocationFavAdrLabel`,`PJT0`.`LocationId` AS `TransportContactLocationLocationId` from (((`H_Synced_Distributors` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_TransportReqDeliveries` `RJT` on(((`RJT`.`DistributorId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_TransportContactLocations` `PJT0` on(((`RJT`.`FromContactLocationId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportReqDelivery`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportReqDelivery`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportReqDelivery` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`IsEditable` AS `IsEditable`,`BaseTable`.`CustomerId` AS `CustomerId`,`BaseTable`.`DistributorId` AS `DistributorId`,`BaseTable`.`CVOId` AS `CVOId`,`BaseTable`.`FromContactLocationId` AS `FromContactLocationId`,`BaseTable`.`ToContactLocationId` AS `ToContactLocationId`,`BaseTable`.`PickupAfterDateTime` AS `PickupAfterDateTime`,`BaseTable`.`PickupBeforeDateTime` AS `PickupBeforeDateTime`,`BaseTable`.`DropOffAfterDateTime` AS `DropOffAfterDateTime`,`BaseTable`.`DropOffBeforeDateTime` AS `DropOffBeforeDateTime`,`BaseTable`.`VehicleType` AS `VehicleType`,`BaseTable`.`VehicleProfileSubType` AS `VehicleProfileSubType`,`BaseTable`.`ServiceClass` AS `ServiceClass`,`BaseTable`.`ActionOnAbsentReceiver` AS `ActionOnAbsentReceiver`,`BaseTable`.`Comments` AS `Comments`,`BaseTable`.`FareAtSubmission` AS `FareAtSubmission`,`BaseTable`.`PromoCode` AS `PromoCode`,`BaseTable`.`Status` AS `Status` from `H_TransportReqDeliveries` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportReqDeliveryGoodsSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportReqDeliveryGoodsSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportReqDeliveryGoodsSuperDetail` AS select `BaseTable`.`Id` AS `TransportReqDeliveryId`,`BaseTable`.`IsEditable` AS `TransportReqDeliveryIsEditable`,`BaseTable`.`CustomerId` AS `TransportReqDeliveryCustomerId`,`BaseTable`.`DistributorId` AS `TransportReqDeliveryDistributorId`,`BaseTable`.`CVOId` AS `TransportReqDeliveryCVOId`,`BaseTable`.`FromContactLocationId` AS `TransportReqDeliveryFromContactLocationId`,`BaseTable`.`ToContactLocationId` AS `TransportReqDeliveryToContactLocationId`,`BaseTable`.`PickupAfterDateTime` AS `TransportReqDeliveryPickupAfterDateTime`,`BaseTable`.`PickupBeforeDateTime` AS `TransportReqDeliveryPickupBeforeDateTime`,`BaseTable`.`DropOffAfterDateTime` AS `TransportReqDeliveryDropOffAfterDateTime`,`BaseTable`.`DropOffBeforeDateTime` AS `TransportReqDeliveryDropOffBeforeDateTime`,`BaseTable`.`VehicleType` AS `TransportReqDeliveryVehicleType`,`BaseTable`.`VehicleProfileSubType` AS `TransportReqDeliveryVehicleProfileSubType`,`BaseTable`.`ServiceClass` AS `TransportReqDeliveryServiceClass`,`BaseTable`.`ActionOnAbsentReceiver` AS `TransportReqDeliveryActionOnAbsentReceiver`,`BaseTable`.`Comments` AS `TransportReqDeliveryComments`,`BaseTable`.`FareAtSubmission` AS `TransportReqDeliveryFareAtSubmission`,`BaseTable`.`PromoCode` AS `TransportReqDeliveryPromoCode`,`BaseTable`.`Status` AS `TransportReqDeliveryStatus`,`RJT`.`CustomerGoodId` AS `CustomerGoodId`,`PJT0`.`Code` AS `TransportCustomerMasterGoodCode`,`PJT0`.`Title` AS `TransportCustomerMasterGoodTitle`,`PJT0`.`Description` AS `TransportCustomerMasterGoodDescription`,`PJT0`.`CustomerId` AS `TransportCustomerMasterGoodCustomerId` from ((`H_TransportReqDeliveries` `BaseTable` join `H_TransportReqDeliveryGoods` `RJT` on(((`RJT`.`ReqDeliveryId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_TransportCustomerMasterGoods` `PJT0` on(((`RJT`.`CustomerGoodId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportReqDeliverySummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportReqDeliverySummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportReqDeliverySummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`IsEditable` AS `IsEditable`,`BaseTable`.`CustomerId` AS `CustomerId`,`BaseTable`.`DistributorId` AS `DistributorId`,`BaseTable`.`CVOId` AS `CVOId`,`BaseTable`.`FromContactLocationId` AS `FromContactLocationId`,`BaseTable`.`ToContactLocationId` AS `ToContactLocationId`,`BaseTable`.`PickupAfterDateTime` AS `PickupAfterDateTime`,`BaseTable`.`PickupBeforeDateTime` AS `PickupBeforeDateTime`,`BaseTable`.`DropOffAfterDateTime` AS `DropOffAfterDateTime`,`BaseTable`.`DropOffBeforeDateTime` AS `DropOffBeforeDateTime`,`BaseTable`.`VehicleType` AS `VehicleType`,`BaseTable`.`VehicleProfileSubType` AS `VehicleProfileSubType`,`BaseTable`.`ServiceClass` AS `ServiceClass`,`BaseTable`.`ActionOnAbsentReceiver` AS `ActionOnAbsentReceiver`,`BaseTable`.`Comments` AS `Comments`,`BaseTable`.`FareAtSubmission` AS `FareAtSubmission`,`BaseTable`.`PromoCode` AS `PromoCode`,`BaseTable`.`Status` AS `Status`,`TempQuery0`.`RelatedEntityCount` AS `TransportBatchItemsCount`,`TempQuery1`.`RelatedEntityCount` AS `GoodsCount` from ((`H_TransportReqDeliveries` `BaseTable` left join (select `RT0`.`TransportReqDeliveryId` AS `TransportReqDeliveryId`,count(`RT0`.`TransportReqDeliveryId`) AS `RelatedEntityCount` from `H_TransportBatchItems` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`TransportReqDeliveryId`) `TempQuery0` on((`TempQuery0`.`TransportReqDeliveryId` = `BaseTable`.`Id`))) left join (select `RT1`.`ReqDeliveryId` AS `ReqDeliveryId`,count(`RT1`.`ReqDeliveryId`) AS `RelatedEntityCount` from `H_TransportReqDeliveryGoods` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`ReqDeliveryId`) `TempQuery1` on((`TempQuery1`.`ReqDeliveryId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportReqRide`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportReqRide`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportReqRide` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`IsEditable` AS `IsEditable`,`BaseTable`.`CustomerId` AS `CustomerId`,`BaseTable`.`DistributorId` AS `DistributorId`,`BaseTable`.`CVOId` AS `CVOId`,`BaseTable`.`FromContactLocationId` AS `FromContactLocationId`,`BaseTable`.`ToContactLocationId` AS `ToContactLocationId`,`BaseTable`.`PickupAfterDateTime` AS `PickupAfterDateTime`,`BaseTable`.`PickupBeforeDateTime` AS `PickupBeforeDateTime`,`BaseTable`.`DropOffAfterDateTime` AS `DropOffAfterDateTime`,`BaseTable`.`DropOffBeforeDateTime` AS `DropOffBeforeDateTime`,`BaseTable`.`VehicleType` AS `VehicleType`,`BaseTable`.`VehicleProfileSubType` AS `VehicleProfileSubType`,`BaseTable`.`ServiceClass` AS `ServiceClass`,`BaseTable`.`TotalRequiredSeats` AS `TotalRequiredSeats`,`BaseTable`.`NumberOfLuggages` AS `NumberOfLuggages`,`BaseTable`.`FeaturesJSON` AS `FeaturesJSON`,`BaseTable`.`Comments` AS `Comments`,`BaseTable`.`FareAtSubmission` AS `FareAtSubmission`,`BaseTable`.`PromoCode` AS `PromoCode`,`BaseTable`.`HubCarrierInfo` AS `HubCarrierInfo`,`BaseTable`.`Status` AS `Status` from `H_TransportReqRides` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportReqRidePassengersSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportReqRidePassengersSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportReqRidePassengersSuperDetail` AS select `BaseTable`.`Id` AS `TransportReqRideId`,`BaseTable`.`IsEditable` AS `TransportReqRideIsEditable`,`BaseTable`.`CustomerId` AS `TransportReqRideCustomerId`,`BaseTable`.`DistributorId` AS `TransportReqRideDistributorId`,`BaseTable`.`CVOId` AS `TransportReqRideCVOId`,`BaseTable`.`FromContactLocationId` AS `TransportReqRideFromContactLocationId`,`BaseTable`.`ToContactLocationId` AS `TransportReqRideToContactLocationId`,`BaseTable`.`PickupAfterDateTime` AS `TransportReqRidePickupAfterDateTime`,`BaseTable`.`PickupBeforeDateTime` AS `TransportReqRidePickupBeforeDateTime`,`BaseTable`.`DropOffAfterDateTime` AS `TransportReqRideDropOffAfterDateTime`,`BaseTable`.`DropOffBeforeDateTime` AS `TransportReqRideDropOffBeforeDateTime`,`BaseTable`.`VehicleType` AS `TransportReqRideVehicleType`,`BaseTable`.`VehicleProfileSubType` AS `TransportReqRideVehicleProfileSubType`,`BaseTable`.`ServiceClass` AS `TransportReqRideServiceClass`,`BaseTable`.`TotalRequiredSeats` AS `TransportReqRideTotalRequiredSeats`,`BaseTable`.`NumberOfLuggages` AS `TransportReqRideNumberOfLuggages`,`BaseTable`.`FeaturesJSON` AS `TransportReqRideFeaturesJSON`,`BaseTable`.`Comments` AS `TransportReqRideComments`,`BaseTable`.`FareAtSubmission` AS `TransportReqRideFareAtSubmission`,`BaseTable`.`PromoCode` AS `TransportReqRidePromoCode`,`BaseTable`.`HubCarrierInfo` AS `TransportReqRideHubCarrierInfo`,`BaseTable`.`Status` AS `TransportReqRideStatus`,`RJT`.`PassengerId` AS `PassengerId`,`PJT0`.`ContactId` AS `TransportCustomerContactContactId`,`PJT0`.`CustomerId` AS `TransportCustomerContactCustomerId` from ((`H_TransportReqRides` `BaseTable` join `H_TransportReqRidePassengers` `RJT` on(((`RJT`.`ReqRideId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_TransportCustomerContacts` `PJT0` on(((`RJT`.`PassengerId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportReqRideSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportReqRideSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportReqRideSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`IsEditable` AS `IsEditable`,`BaseTable`.`CustomerId` AS `CustomerId`,`BaseTable`.`DistributorId` AS `DistributorId`,`BaseTable`.`CVOId` AS `CVOId`,`BaseTable`.`FromContactLocationId` AS `FromContactLocationId`,`BaseTable`.`ToContactLocationId` AS `ToContactLocationId`,`BaseTable`.`PickupAfterDateTime` AS `PickupAfterDateTime`,`BaseTable`.`PickupBeforeDateTime` AS `PickupBeforeDateTime`,`BaseTable`.`DropOffAfterDateTime` AS `DropOffAfterDateTime`,`BaseTable`.`DropOffBeforeDateTime` AS `DropOffBeforeDateTime`,`BaseTable`.`VehicleType` AS `VehicleType`,`BaseTable`.`VehicleProfileSubType` AS `VehicleProfileSubType`,`BaseTable`.`ServiceClass` AS `ServiceClass`,`BaseTable`.`TotalRequiredSeats` AS `TotalRequiredSeats`,`BaseTable`.`NumberOfLuggages` AS `NumberOfLuggages`,`BaseTable`.`FeaturesJSON` AS `FeaturesJSON`,`BaseTable`.`Comments` AS `Comments`,`BaseTable`.`FareAtSubmission` AS `FareAtSubmission`,`BaseTable`.`PromoCode` AS `PromoCode`,`BaseTable`.`HubCarrierInfo` AS `HubCarrierInfo`,`BaseTable`.`Status` AS `Status`,`TempQuery0`.`RelatedEntityCount` AS `TransportBatchItemsCount`,`TempQuery1`.`RelatedEntityCount` AS `PassengersCount` from ((`H_TransportReqRides` `BaseTable` left join (select `RT0`.`TransportReqRideId` AS `TransportReqRideId`,count(`RT0`.`TransportReqRideId`) AS `RelatedEntityCount` from `H_TransportBatchItems` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`TransportReqRideId`) `TempQuery0` on((`TempQuery0`.`TransportReqRideId` = `BaseTable`.`Id`))) left join (select `RT1`.`ReqRideId` AS `ReqRideId`,count(`RT1`.`ReqRideId`) AS `RelatedEntityCount` from `H_TransportReqRidePassengers` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`ReqRideId`) `TempQuery1` on((`TempQuery1`.`ReqRideId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportReqRidesSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportReqRidesSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportReqRidesSuperDetail` AS select `BaseTable`.`Id` AS `DistributorId`,`BaseTable`.`EntityId` AS `DistributorEntityId`,`AP`.`Title` AS `DistributorEntityTitle`,`AP`.`Address_fsx` AS `DistributorEntityAddress_fsx`,`AP`.`City` AS `DistributorEntityCity`,`AP`.`Province` AS `DistributorEntityProvince`,`AP`.`Country` AS `DistributorEntityCountry`,`AP`.`PostalCode_fsx` AS `DistributorEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `DistributorEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `DistributorEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `DistributorEntityEmail_fsx`,`AP`.`Discriminator` AS `DistributorEntityDiscriminator`,`RJT`.`IsEditable` AS `IsEditable`,`RJT`.`CustomerId` AS `CustomerId`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`FromContactLocationId` AS `FromContactLocationId`,`RJT`.`ToContactLocationId` AS `ToContactLocationId`,`RJT`.`PickupAfterDateTime` AS `PickupAfterDateTime`,`RJT`.`PickupAfterDateTime_UTC` AS `PickupAfterDateTime_UTC`,`RJT`.`PickupBeforeDateTime` AS `PickupBeforeDateTime`,`RJT`.`PickupBeforeDateTime_UTC` AS `PickupBeforeDateTime_UTC`,`RJT`.`DropOffAfterDateTime` AS `DropOffAfterDateTime`,`RJT`.`DropOffAfterDateTime_UTC` AS `DropOffAfterDateTime_UTC`,`RJT`.`DropOffBeforeDateTime` AS `DropOffBeforeDateTime`,`RJT`.`DropOffBeforeDateTime_UTC` AS `DropOffBeforeDateTime_UTC`,`RJT`.`VehicleType` AS `VehicleType`,`RJT`.`VehicleProfileSubType` AS `VehicleProfileSubType`,`RJT`.`ServiceClass` AS `ServiceClass`,`RJT`.`ServiceCategory` AS `ServiceCategory`,`RJT`.`TotalRequiredSeats` AS `TotalRequiredSeats`,`RJT`.`NumberOfLuggages` AS `NumberOfLuggages`,`RJT`.`FeaturesJSON` AS `FeaturesJSON`,`RJT`.`Comments` AS `Comments`,`RJT`.`FareAtSubmission` AS `FareAtSubmission`,`RJT`.`PromoCode` AS `PromoCode`,`RJT`.`PaymentCategory` AS `PaymentCategory`,`RJT`.`PaymentMethod` AS `PaymentMethod`,`RJT`.`PaidAt_UTC` AS `PaidAt_UTC`,`RJT`.`HubCarrierInfo` AS `HubCarrierInfo`,`RJT`.`Status` AS `Status`,`PJT0`.`ContactId` AS `TransportContactLocationContactId`,`PJT0`.`FavAdrLabel` AS `TransportContactLocationFavAdrLabel`,`PJT0`.`LocationId` AS `TransportContactLocationLocationId` from (((`H_Synced_Distributors` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_TransportReqRides` `RJT` on(((`RJT`.`DistributorId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_TransportContactLocations` `PJT0` on(((`RJT`.`FromContactLocationId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportTransact`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportTransact`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportTransact` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`FMS_OvId` AS `FMS_OvId`,`BaseTable`.`BatchId` AS `BatchId`,`BaseTable`.`PickupZoneId` AS `PickupZoneId`,`BaseTable`.`CVOId` AS `CVOId`,`BaseTable`.`VehicleId` AS `VehicleId`,`BaseTable`.`DriverId` AS `DriverId`,`BaseTable`.`CurrentStatus` AS `CurrentStatus`,`BaseTable`.`OfferType` AS `OfferType`,`BaseTable`.`PaidTripFare` AS `PaidTripFare`,`BaseTable`.`PaidAddonFee` AS `PaidAddonFee`,`BaseTable`.`AppliedDiscount` AS `AppliedDiscount`,`BaseTable`.`PaidTip` AS `PaidTip`,`BaseTable`.`PaidToll` AS `PaidToll`,`BaseTable`.`ActualTotalFareAtTripEnd` AS `ActualTotalFareAtTripEnd`,`BaseTable`.`DriverAgreedFareAmount` AS `DriverAgreedFareAmount`,`BaseTable`.`EnforceItemsCreationSequense` AS `EnforceItemsCreationSequense`,`BaseTable`.`PaymentTransactionNumber` AS `PaymentTransactionNumber`,`BaseTable`.`ExtraData` AS `ExtraData` from `H_TransportTransacts` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_TransportTransactsSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_TransportTransactsSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_TransportTransactsSuperDetail` AS select `BaseTable`.`Id` AS `CVOId`,`BaseTable`.`EntityId` AS `CVOEntityId`,`AP`.`Title` AS `CVOEntityTitle`,`AP`.`Address_fsx` AS `CVOEntityAddress_fsx`,`AP`.`City` AS `CVOEntityCity`,`AP`.`Province` AS `CVOEntityProvince`,`AP`.`Country` AS `CVOEntityCountry`,`AP`.`PostalCode_fsx` AS `CVOEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `CVOEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `CVOEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `CVOEntityEmail_fsx`,`AP`.`Discriminator` AS `CVOEntityDiscriminator`,`RJT`.`FMS_OvId` AS `FMS_OvId`,`RJT`.`BatchId` AS `BatchId`,`RJT`.`PickupZoneId` AS `PickupZoneId`,`RJT`.`VehicleId` AS `VehicleId`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`CurrentStatus` AS `CurrentStatus`,`RJT`.`OfferType` AS `OfferType`,`RJT`.`PaidTripFare` AS `PaidTripFare`,`RJT`.`PaidAddonFee` AS `PaidAddonFee`,`RJT`.`AppliedDiscount` AS `AppliedDiscount`,`RJT`.`PaidTip` AS `PaidTip`,`RJT`.`PaidToll` AS `PaidToll`,`RJT`.`ActualTotalFareAtTripEnd` AS `ActualTotalFareAtTripEnd`,`RJT`.`DriverAgreedFareAmount` AS `DriverAgreedFareAmount`,`RJT`.`EnforceItemsCreationSequense` AS `EnforceItemsCreationSequense`,`RJT`.`PaymentTransactionNumber` AS `PaymentTransactionNumber`,`RJT`.`ExtraData` AS `ExtraData`,`PJT0`.`FMS_OId` AS `TransportBatchFMS_OId`,`PJT0`.`DistributorId` AS `TransportBatchDistributorId`,`PJT0`.`TotalFareAtDispatch` AS `TransportBatchTotalFareAtDispatch`,`PJT0`.`FarePortionAmount_CVO` AS `TransportBatchFarePortionAmount_CVO`,`PJT0`.`FarePortionAmount_Distributor` AS `TransportBatchFarePortionAmount_Distributor`,`PJT0`.`FarePortionAmount_Driver` AS `TransportBatchFarePortionAmount_Driver`,`PJT0`.`AllowedDiscountPercent` AS `TransportBatchAllowedDiscountPercent`,`PJT0`.`IsEditable` AS `TransportBatchIsEditable`,`PJT0`.`IsChargePerItem` AS `TransportBatchIsChargePerItem` from (((`H_Synced_CVOs` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_TransportTransacts` `RJT` on(((`RJT`.`CVOId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_TransportBatches` `PJT0` on(((`RJT`.`BatchId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_UserAppSettingsSuperDetail` AS select `BaseTable`.`Id` AS `AppClientId`,`BaseTable`.`Title` AS `AppClientTitle`,`BaseTable`.`ClientId` AS `AppClientClientId`,`BaseTable`.`ClientSecret` AS `AppClientClientSecret`,`BaseTable`.`AppTypeId` AS `AppClientAppTypeId`,`BaseTable`.`IsInactive` AS `AppClientIsInactive`,`RJT`.`UserId` AS `UserId`,`RJT`.`Setting_fsx` AS `Setting_fsx`,`PJT0`.`Firstname_fsx` AS `UserInfoFirstname_fsx`,`PJT0`.`Lastname_fsx` AS `UserInfoLastname_fsx`,`PJT0`.`Username` AS `UserInfoUsername`,`PJT0`.`Email_fsx` AS `UserInfoEmail_fsx`,`PJT0`.`Email_hash` AS `UserInfoEmail_hash`,`PJT0`.`EmailConfirmed` AS `UserInfoEmailConfirmed`,`PJT0`.`CellPhone_fsx` AS `UserInfoCellPhone_fsx`,`PJT0`.`CellPhone_hash` AS `UserInfoCellPhone_hash`,`PJT0`.`CellPhoneConfirmed` AS `UserInfoCellPhoneConfirmed`,`PJT0`.`IssuedBy` AS `UserInfoIssuedBy` from ((`H_AAA_AppClients` `BaseTable` join `H_AAA_UserAppSettings` `RJT` on(((`RJT`.`AppClientId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `PJT0` on(((`RJT`.`UserId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_UserEntityRolesSuperDetail` AS select `BaseTable`.`Id` AS `EntityRoleId`,`BaseTable`.`Title` AS `EntityRoleTitle`,`BaseTable`.`EntityId` AS `EntityRoleEntityId`,`BaseTable`.`ActENUM` AS `EntityRoleActENUM`,`BaseTable`.`IsDefault` AS `EntityRoleIsDefault`,`AP`.`Title` AS `EntityRoleEntityTitle`,`AP`.`Address_fsx` AS `EntityRoleEntityAddress_fsx`,`AP`.`City` AS `EntityRoleEntityCity`,`AP`.`Province` AS `EntityRoleEntityProvince`,`AP`.`Country` AS `EntityRoleEntityCountry`,`AP`.`PostalCode_fsx` AS `EntityRoleEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityRoleEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityRoleEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityRoleEntityEmail_fsx`,`AP`.`Discriminator` AS `EntityRoleEntityDiscriminator`,`RJT`.`UserId` AS `UserId`,`PJT0`.`Firstname_fsx` AS `UserInfoFirstname_fsx`,`PJT0`.`Lastname_fsx` AS `UserInfoLastname_fsx`,`PJT0`.`Username` AS `UserInfoUsername`,`PJT0`.`Email_fsx` AS `UserInfoEmail_fsx`,`PJT0`.`Email_hash` AS `UserInfoEmail_hash`,`PJT0`.`EmailConfirmed` AS `UserInfoEmailConfirmed`,`PJT0`.`CellPhone_fsx` AS `UserInfoCellPhone_fsx`,`PJT0`.`CellPhone_hash` AS `UserInfoCellPhone_hash`,`PJT0`.`CellPhoneConfirmed` AS `UserInfoCellPhoneConfirmed`,`PJT0`.`IssuedBy` AS `UserInfoIssuedBy` from (((`H_AAA_EntityRoles` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_AAA_UserEntityRoles` `RJT` on(((`RJT`.`EntityRoleId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `PJT0` on(((`RJT`.`UserId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where (((0 <> `BaseTable`.`RecordDeleted`) is not true) and ((0 <> `BaseTable`.`IsDefault`) is not true)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_Vehicle`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_Vehicle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_Vehicle` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Plate` AS `Plate`,`BaseTable`.`VIN` AS `VIN`,`BaseTable`.`Make` AS `Make`,`BaseTable`.`Model` AS `Model`,`BaseTable`.`Province` AS `Province`,`BaseTable`.`Color` AS `Color`,`BaseTable`.`Year` AS `Year`,`BaseTable`.`TransportCategory` AS `TransportCategory`,`BaseTable`.`Cargo_Height` AS `Cargo_Height`,`BaseTable`.`Cargo_Weight` AS `Cargo_Weight`,`BaseTable`.`Cargo_Length` AS `Cargo_Length`,`BaseTable`.`Cargo_Width` AS `Cargo_Width`,`BaseTable`.`Capacity_Passengers` AS `Capacity_Passengers`,`BaseTable`.`Capacity_Luggage` AS `Capacity_Luggage`,`BaseTable`.`VehicleType` AS `VehicleType` from `H_Synced_VehicleProfile` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_VehicleDriversSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_VehicleDriversSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_VehicleDriversSuperDetail` AS select `BaseTable`.`Id` AS `VehicleProfileId`,`BaseTable`.`Plate` AS `VehicleProfilePlate`,`BaseTable`.`VIN` AS `VehicleProfileVIN`,`BaseTable`.`Make` AS `VehicleProfileMake`,`BaseTable`.`Model` AS `VehicleProfileModel`,`BaseTable`.`Province` AS `VehicleProfileProvince`,`BaseTable`.`Color` AS `VehicleProfileColor`,`BaseTable`.`Year` AS `VehicleProfileYear`,`BaseTable`.`TransportCategory` AS `VehicleProfileTransportCategory`,`BaseTable`.`Cargo_Height` AS `VehicleProfileCargo_Height`,`BaseTable`.`Cargo_Weight` AS `VehicleProfileCargo_Weight`,`BaseTable`.`Cargo_Length` AS `VehicleProfileCargo_Length`,`BaseTable`.`Cargo_Width` AS `VehicleProfileCargo_Width`,`BaseTable`.`Capacity_Passengers` AS `VehicleProfileCapacity_Passengers`,`BaseTable`.`Capacity_Luggage` AS `VehicleProfileCapacity_Luggage`,`BaseTable`.`VehicleType` AS `VehicleProfileVehicleType`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`HasRule` AS `HasRule`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`RJT`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`PJT0`.`UserId` AS `DriverUserId`,`PJT0`.`PersonCVOId` AS `DriverPersonCVOId`,`PUI_0_0`.`Firstname_fsx` AS `DriverFirstname_fsx`,`PUI_0_0`.`Lastname_fsx` AS `DriverLastname_fsx`,`PUI_0_0`.`Username` AS `DriverUsername`,`PUI_0_0`.`Email_fsx` AS `DriverEmail_fsx`,`PUI_0_0`.`Email_hash` AS `DriverEmail_hash`,`PUI_0_0`.`EmailConfirmed` AS `DriverEmailConfirmed`,`PUI_0_0`.`CellPhone_fsx` AS `DriverCellPhone_fsx`,`PUI_0_0`.`CellPhone_hash` AS `DriverCellPhone_hash`,`PUI_0_0`.`CellPhoneConfirmed` AS `DriverCellPhoneConfirmed`,`PUI_0_0`.`IssuedBy` AS `DriverIssuedBy`,`PUI_0_0`.`RecordKey` AS `DriverRecordKey`,`PUI_0_0`.`CreatedAt_UTC` AS `DriverCreatedAt_UTC`,`PUI_0_0`.`CreatedBy` AS `DriverCreatedBy`,`PUI_0_0`.`ModifiedAt_UTC` AS `DriverModifiedAt_UTC`,`PUI_0_0`.`ModifiedBy` AS `DriverModifiedBy`,`PUI_0_0`.`RecordDeleted` AS `DriverRecordDeleted` from (((`H_Synced_VehicleProfile` `BaseTable` join `H_Synced_VehicleDrivers` `RJT` on(((`RJT`.`VehicleId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_Synced_Drivers` `PJT0` on(((`RJT`.`DriverId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `PUI_0_0` on(((`PJT0`.`UserId` = `PUI_0_0`.`Id`) and ((0 <> `PUI_0_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_VehicleFeaturesSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_VehicleFeaturesSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_VehicleFeaturesSuperDetail` AS select `BaseTable`.`Id` AS `FeatureId`,`BaseTable`.`Title` AS `FeatureTitle`,`RJT`.`VehicleId` AS `VehicleId`,`RJT`.`HasRule` AS `HasRule`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`RJT`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`PJT0`.`Plate` AS `VehicleProfilePlate`,`PJT0`.`VIN` AS `VehicleProfileVIN`,`PJT0`.`Make` AS `VehicleProfileMake`,`PJT0`.`Model` AS `VehicleProfileModel`,`PJT0`.`Province` AS `VehicleProfileProvince`,`PJT0`.`Color` AS `VehicleProfileColor`,`PJT0`.`Year` AS `VehicleProfileYear`,`PJT0`.`TransportCategory` AS `VehicleProfileTransportCategory`,`PJT0`.`Cargo_Height` AS `VehicleProfileCargo_Height`,`PJT0`.`Cargo_Weight` AS `VehicleProfileCargo_Weight`,`PJT0`.`Cargo_Length` AS `VehicleProfileCargo_Length`,`PJT0`.`Cargo_Width` AS `VehicleProfileCargo_Width`,`PJT0`.`Capacity_Passengers` AS `VehicleProfileCapacity_Passengers`,`PJT0`.`Capacity_Luggage` AS `VehicleProfileCapacity_Luggage`,`PJT0`.`VehicleType` AS `VehicleProfileVehicleType` from ((`H_Synced_Features` `BaseTable` join `H_Synced_VehicleFeatures` `RJT` on(((`RJT`.`FeatureId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_Synced_VehicleProfile` `PJT0` on(((`RJT`.`VehicleId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_VehicleProfile`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_VehicleProfile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_VehicleProfile` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Plate` AS `Plate`,`BaseTable`.`VIN` AS `VIN`,`BaseTable`.`Make` AS `Make`,`BaseTable`.`Model` AS `Model`,`BaseTable`.`Province` AS `Province`,`BaseTable`.`Color` AS `Color`,`BaseTable`.`Year` AS `Year`,`BaseTable`.`TransportCategory` AS `TransportCategory`,`BaseTable`.`Cargo_Height` AS `Cargo_Height`,`BaseTable`.`Cargo_Weight` AS `Cargo_Weight`,`BaseTable`.`Cargo_Length` AS `Cargo_Length`,`BaseTable`.`Cargo_Width` AS `Cargo_Width`,`BaseTable`.`Capacity_Passengers` AS `Capacity_Passengers`,`BaseTable`.`Capacity_Luggage` AS `Capacity_Luggage`,`BaseTable`.`VehicleType` AS `VehicleType` from `H_Synced_VehicleProfile` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_VehicleProfilePermitsExtraDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_VehicleProfilePermitsExtraDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_VehicleProfilePermitsExtraDetail` AS select `BaseTable`.`Id` AS `VehicleProfileId`,`BaseTable`.`Plate` AS `VehicleProfilePlate`,`BaseTable`.`VIN` AS `VehicleProfileVIN`,`BaseTable`.`Make` AS `VehicleProfileMake`,`BaseTable`.`Model` AS `VehicleProfileModel`,`BaseTable`.`Province` AS `VehicleProfileProvince`,`BaseTable`.`Color` AS `VehicleProfileColor`,`BaseTable`.`Year` AS `VehicleProfileYear`,`BaseTable`.`TransportCategory` AS `VehicleProfileTransportCategory`,`BaseTable`.`Cargo_Height` AS `VehicleProfileCargo_Height`,`BaseTable`.`Cargo_Weight` AS `VehicleProfileCargo_Weight`,`BaseTable`.`Cargo_Length` AS `VehicleProfileCargo_Length`,`BaseTable`.`Cargo_Width` AS `VehicleProfileCargo_Width`,`BaseTable`.`Capacity_Passengers` AS `VehicleProfileCapacity_Passengers`,`BaseTable`.`Capacity_Luggage` AS `VehicleProfileCapacity_Luggage`,`BaseTable`.`VehicleType` AS `VehicleProfileVehicleType`,`RJT`.`HUBId` AS `HUBId`,`RJT`.`DistributorId` AS `DistributorId`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`ActENUM` AS `ActENUM`,`RJT`.`PermitIssuerId` AS `PermitIssuerId`,`RJT`.`PermitTypeId` AS `PermitTypeId`,`RJT`.`Code` AS `Code`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC` from (`H_Synced_VehicleProfile` `BaseTable` join `H_Synced_Permits` `RJT` on(((`RJT`.`VehicleId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_ZoneBase`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_ZoneBase`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_ZoneBase` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Code` AS `Code`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`Description` AS `Description`,`BaseTable`.`ZoneType` AS `ZoneType` from `_ZoneBases` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_ZoneGeofencesSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_ZoneGeofencesSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_ZoneGeofencesSuperDetail` AS select `BaseTable`.`Id` AS `TransportGeoFenceBaseId`,`BaseTable`.`Code` AS `TransportGeoFenceBaseCode`,`BaseTable`.`Title` AS `TransportGeoFenceBaseTitle`,`BaseTable`.`Coordinates` AS `TransportGeoFenceBaseCoordinates`,`RJT`.`ZoneId` AS `ZoneId`,`PJT0`.`Code` AS `ZoneBaseCode`,`PJT0`.`Title` AS `ZoneBaseTitle`,`PJT0`.`Description` AS `ZoneBaseDescription`,`PJT0`.`ZoneType` AS `ZoneBaseZoneType` from ((`H_TransportGeoFenceBases` `BaseTable` join `_ZoneGeofences` `RJT` on(((`RJT`.`GeofenceBaseId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `_ZoneBases` `PJT0` on(((`RJT`.`ZoneId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
-- Final view structure for view `Vi_DPC_BatchReqRidesDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_BatchReqRidesDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_BatchReqRidesDetail` AS select `Batches`.`Id` AS `BatchId`,`BatchItems`.`ItemOrder` AS `ItemOrder`,`BatchItems`.`TransportReqRideId` AS `TransportReqRideId`,`ReqRides`.`IsEditable` AS `IsEditable`,(case when (`ReqRides`.`IsEditable` = 1) then 0 else 1 end) AS `IsReadOnly`,`ReqRides`.`FromContactLocationId` AS `FromContactLocationId`,`ReqRides`.`ToContactLocationId` AS `ToContactLocationId`,`ReqRides`.`Status` AS `TransportRequestStatusENUM`,`RequestStatuses`.`Title` AS `TransportRequestStatusTitle`,`ViReqRidePassengers`.`ContactId` AS `ContactId`,`ReqRides`.`ServiceCategory` AS `ServiceCategory`,`ReqRides`.`ServiceClass` AS `ServiceClass`,`ReqRides`.`VehicleType` AS `VehicleType`,`ReqRides`.`CVOId` AS `CVOId`,`ReqRides`.`DistributorId` AS `DistributorId` from ((((`H_TransportBatches` `Batches` join `H_TransportBatchItems` `BatchItems` on((`Batches`.`Id` = `BatchItems`.`BatchId`))) join `H_TransportReqRides` `ReqRides` on((`BatchItems`.`TransportReqRideId` = `ReqRides`.`Id`))) join `H_ENUM_TransportRequestStatuses` `RequestStatuses` on((`ReqRides`.`Status` = `RequestStatuses`.`ENUM`))) left join `Vi_DPC_ReqRidePassengers` `ViReqRidePassengers` on((`ReqRides`.`Id` = `ViReqRidePassengers`.`ReqRideId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_CVO`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_CVO`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_CVO` AS select `CVO`.`Id` AS `Id`,`CVO`.`EntityId` AS `EntityId`,`EP`.`Title` AS `EntityTitle`,`EP`.`Address_fsx` AS `EntityAddress_fsx`,`EP`.`City` AS `EntityCity`,`EP`.`Province` AS `EntityProvince`,`EP`.`Country` AS `EntityCountry`,`EP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`EP`.`Phone_fsx` AS `EntityPhone_fsx`,`EP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`EP`.`Email_fsx` AS `EntityEmail_fsx`,`EP`.`Discriminator` AS `EntityDiscriminator` from (`H_Synced_CVOs` `CVO` join `H_AAA_Synced_EntityProfile` `EP` on(((`CVO`.`EntityId` = `EP`.`Id`) and ((0 <> `EP`.`RecordDeleted`) is not true)))) where ((0 <> `CVO`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_ClientEntityPermittedActs`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_ClientEntityPermittedActs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_ClientEntityPermittedActs` AS select distinct `S`.`ClientEntityId` AS `ClientEntityId`,`ES`.`PermittedActENUM` AS `PermittedActENUM`,`ES`.`PermittedActENUM` AS `Id`,`AC`.`Title` AS `ActTitle` from ((`H_AAA_Scenarios` `S` join `H_AAA_EntityScenarios` `ES` on((`S`.`Id` = `ES`.`ScenarioId`))) join `H_ENUM_Actors` `AC` on((`ES`.`PermittedActENUM` = `AC`.`ENUM`))) where (((0 <> `S`.`RecordDeleted`) is not true) and ((0 <> `ES`.`RecordDeleted`) is not true)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_ContactLocations`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_ContactLocations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_ContactLocations` AS select `TCL`.`Id` AS `Id`,`TCL`.`FavAdrLabel` AS `FavAdrLabel`,`TCL`.`ContactId` AS `ContactId`,`TL`.`Id` AS `LocationId`,`TL`.`Title` AS `Title`,`TL`.`Latitude` AS `Latitude`,`TL`.`Longitude` AS `Longitude`,`TL`.`Address` AS `Address`,`TL`.`City` AS `LocationCity`,`TL`.`Province` AS `Province`,`TL`.`PostalCode` AS `PostalCode`,`TL`.`PlaceId` AS `PlaceId` from ((`H_TransportContactLocations` `TCL` join `H_TransportContactRegistry` `TCR` on(((`TCL`.`ContactId` = `TCR`.`Id`) and ((0 <> `TCR`.`RecordDeleted`) is not true)))) join `H_TransportLocations` `TL` on(((`TCL`.`LocationId` = `TL`.`Id`) and ((0 <> `TL`.`RecordDeleted`) is not true)))) where ((0 <> `TCL`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_CvoVehicleTypes`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_CvoVehicleTypes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_CvoVehicleTypes` AS select `SY_CVO_VEH`.`CVOId` AS `CVOId`,`SY_VEH_PROF`.`VehicleType` AS `VehicleType` from (`H_Synced_CVOVehicles` `SY_CVO_VEH` join `H_Synced_VehicleProfile` `SY_VEH_PROF` on((`SY_CVO_VEH`.`VehicleId` = `SY_VEH_PROF`.`Id`))) where ((`SY_CVO_VEH`.`ExpiryDate_UTC` > now()) and ((0 <> `SY_CVO_VEH`.`RecordDeleted`) is not true) and ((0 <> `SY_VEH_PROF`.`RecordDeleted`) is not true) and (`SY_VEH_PROF`.`VehicleType` is not null)) group by `SY_CVO_VEH`.`CVOId`,`SY_VEH_PROF`.`VehicleType` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_Distributor`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_Distributor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_Distributor` AS select `D`.`Id` AS `Id`,`D`.`EntityId` AS `EntityId`,`EP`.`Title` AS `EntityTitle`,`EP`.`Address_fsx` AS `EntityAddress_fsx`,`EP`.`City` AS `EntityCity`,`EP`.`Province` AS `EntityProvince`,`EP`.`Country` AS `EntityCountry`,`EP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`EP`.`Phone_fsx` AS `EntityPhone_fsx`,`EP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`EP`.`Email_fsx` AS `EntityEmail_fsx`,`EP`.`Discriminator` AS `EntityDiscriminator` from (`H_Synced_Distributors` `D` join `H_AAA_Synced_EntityProfile` `EP` on(((`D`.`EntityId` = `EP`.`Id`) and ((0 <> `EP`.`RecordDeleted`) is not true)))) where ((0 <> `D`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_DistributorCVOs`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_DistributorCVOs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_DistributorCVOs` AS select `D`.`Id` AS `DistributorId`,`D`.`EntityId` AS `DistributorEntityId`,`EP`.`Title` AS `DistributorEntityTitle`,`DC`.`CVOId` AS `CVOId`,`C`.`EntityId` AS `CVOEntityId`,`EP_CVO`.`Title` AS `CVOEntityTitle`,`CS`.`Id` AS `CVOServiceId`,`CS`.`ServiceCategory` AS `ServiceCategory`,`SERVICE_BASES`.`ServiceType` AS `ServiceType`,`SERVICE_BASES`.`ServiceClass` AS `ServiceClass` from ((((((`H_Synced_DistributorCVOs` `DC` join `H_Synced_Distributors` `D` on(((`DC`.`DistributorId` = `D`.`Id`) and ((0 <> `D`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_EntityProfile` `EP` on(((`D`.`EntityId` = `EP`.`Id`) and ((0 <> `EP`.`RecordDeleted`) is not true)))) join `H_Synced_CVOs` `C` on(((`DC`.`CVOId` = `C`.`Id`) and ((0 <> `C`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_EntityProfile` `EP_CVO` on(((`C`.`EntityId` = `EP_CVO`.`Id`) and ((0 <> `EP_CVO`.`RecordDeleted`) is not true)))) join `H_Synced_CVOServices` `CS` on(((`DC`.`CVOId` = `CS`.`CVOId`) and ((0 <> `CS`.`RecordDeleted`) is not true)))) left join `H_Synced_ServiceBases` `SERVICE_BASES` on(((`CS`.`ServiceId` = `SERVICE_BASES`.`Id`) and ((0 <> `SERVICE_BASES`.`RecordDeleted`) is not true)))) where (((0 <> `DC`.`RecordDeleted`) is not true) and (`DC`.`ExpiryDate_UTC` > now())) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_DistributorCVOsDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_DistributorCVOsDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_DistributorCVOsDetail` AS select `DC`.`Id` AS `Id`,`D`.`Id` AS `DistributorId`,`D`.`EntityId` AS `DistributorEntityId`,`EP`.`Title` AS `DistributorEntityTitle`,`DC`.`CVOId` AS `CvoId`,`C`.`EntityId` AS `CvoEntityId`,`EP_CVO`.`Title` AS `CvoEntityTitle`,`CS`.`Id` AS `CvoServiceId`,`CS`.`ServiceCategory` AS `ServiceCategory`,`SERVICE_BASES`.`ServiceType` AS `ServiceType`,`SERVICE_BASES`.`ServiceClass` AS `ServiceClass`,`VI_CVO_VEH_TYPE`.`VehicleType` AS `VehicleType` from (((((((`H_Synced_DistributorCVOs` `DC` join `H_Synced_Distributors` `D` on(((`DC`.`DistributorId` = `D`.`Id`) and ((0 <> `D`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_EntityProfile` `EP` on(((`D`.`EntityId` = `EP`.`Id`) and ((0 <> `EP`.`RecordDeleted`) is not true)))) join `H_Synced_CVOs` `C` on(((`DC`.`CVOId` = `C`.`Id`) and ((0 <> `C`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_EntityProfile` `EP_CVO` on(((`C`.`EntityId` = `EP_CVO`.`Id`) and ((0 <> `EP_CVO`.`RecordDeleted`) is not true)))) join `H_Synced_CVOServices` `CS` on(((`DC`.`CVOId` = `CS`.`CVOId`) and ((0 <> `CS`.`RecordDeleted`) is not true)))) left join `Vi_DPC_CvoVehicleTypes` `VI_CVO_VEH_TYPE` on((`DC`.`CVOId` = `VI_CVO_VEH_TYPE`.`CVOId`))) left join `H_Synced_ServiceBases` `SERVICE_BASES` on(((`CS`.`ServiceId` = `SERVICE_BASES`.`Id`) and ((0 <> `SERVICE_BASES`.`RecordDeleted`) is not true)))) where (((0 <> `DC`.`RecordDeleted`) is not true) and (`DC`.`ExpiryDate_UTC` > now())) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_ENUM_ActivityClasses`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_ENUM_ActivityClasses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_ENUM_ActivityClasses` AS select `H_ENUM_ActivityClasses`.`ENUM` AS `Id`,`H_ENUM_ActivityClasses`.`ENUM` AS `ENUM`,`H_ENUM_ActivityClasses`.`Title` AS `Title` from `H_ENUM_ActivityClasses` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_ENUM_Actors`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_ENUM_Actors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_ENUM_Actors` AS select `H_ENUM_Actors`.`ENUM` AS `Id`,`H_ENUM_Actors`.`ENUM` AS `ENUM`,`H_ENUM_Actors`.`Title` AS `Title` from `H_ENUM_Actors` */;
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
/*!50001 VIEW `Vi_DPC_ENUM_ComponentType` AS select lpad((`Upto100`.`Sequence` - 1),2,'0') AS `id`,replace(substring_index(substring_index(substring_index(trim(trailing ')' from `information_schema`.`columns`.`COLUMN_TYPE`),'(',-(1)),',',`Upto100`.`Sequence`),',',-(1)),'\'','') AS `title` from (`information_schema`.`COLUMNS` `columns` join (select (((`A`.`t` * 10) + `B`.`u`) + 1) AS `Sequence` from ((select 0 AS `t` union select 1 AS `1` union select 2 AS `2` union select 3 AS `3` union select 4 AS `4` union select 5 AS `5` union select 6 AS `6` union select 7 AS `7` union select 8 AS `8` union select 9 AS `9`) `A` join (select 0 AS `u` union select 1 AS `1` union select 2 AS `2` union select 3 AS `3` union select 4 AS `4` union select 5 AS `5` union select 6 AS `6` union select 7 AS `7` union select 8 AS `8` union select 9 AS `9`) `B`) order by `Sequence`) `Upto100` on(((char_length(`information_schema`.`columns`.`COLUMN_TYPE`) - char_length(replace(`information_schema`.`columns`.`COLUMN_TYPE`,',',''))) >= (`Upto100`.`Sequence` - 1)))) where ((`information_schema`.`columns`.`TABLE_NAME` = 'H_DP_ComponentsBases') and (`information_schema`.`columns`.`COLUMN_NAME` = 'Type') and (`information_schema`.`columns`.`TABLE_SCHEMA` = 'HBloxTMSCore_DEV05')) order by `Upto100`.`Sequence` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_EntityRoleSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_EntityRoleSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_EntityRoleSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`EntityId` AS `EntityId`,`BaseTable`.`ActENUM` AS `ActENUM`,`EA`.`Title` AS `ActorTitle`,(case when (`BaseTable`.`ActENUM` = 0) then 1 else 0 end) AS `IsReadOnly`,`BaseTable`.`IsDefault` AS `IsDefault`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator`,`TempQuery0`.`RelatedEntityCount` AS `PermissionsCount`,`TempQuery2`.`RelatedEntityCount` AS `UsersCount` from ((((`H_AAA_EntityRoles` `BaseTable` join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_ENUM_Actors` `EA` on((`BaseTable`.`ActENUM` = `EA`.`ENUM`))) left join (select `RT0`.`RoleId` AS `RoleId`,count(`RT0`.`RoleId`) AS `RelatedEntityCount` from `H_AAA_EntityRolePermissions` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`RoleId`) `TempQuery0` on((`TempQuery0`.`RoleId` = `BaseTable`.`Id`))) left join (select `RT2`.`EntityRoleId` AS `EntityRoleId`,count(`RT2`.`EntityRoleId`) AS `RelatedEntityCount` from `H_AAA_UserEntityRoles` `RT2` where ((0 <> `RT2`.`RecordDeleted`) is not true) group by `RT2`.`EntityRoleId`) `TempQuery2` on((`TempQuery2`.`EntityRoleId` = `BaseTable`.`Id`))) where (((0 <> `BaseTable`.`RecordDeleted`) is not true) and ((0 <> `BaseTable`.`IsDefault`) is not true)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_ReqRideDestinationContactLocation`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_ReqRideDestinationContactLocation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_ReqRideDestinationContactLocation` AS select `TRR`.`Id` AS `Id`,`TCL`.`ContactId` AS `ContactId`,`TL`.`Id` AS `LocationId`,`TCL`.`FavAdrLabel` AS `FavAdrLabel`,`TL`.`Title` AS `Title`,`TL`.`Latitude` AS `Latitude`,`TL`.`Longitude` AS `Longitude`,`TL`.`Address` AS `Address`,`TL`.`City` AS `LocationCity`,`TL`.`Province` AS `Province`,`TL`.`PostalCode` AS `PostalCode`,`TL`.`PlaceId` AS `PlaceId` from ((`H_TransportReqRides` `TRR` join `H_TransportContactLocations` `TCL` on(((`TRR`.`ToContactLocationId` = `TCL`.`Id`) and ((0 <> `TCL`.`RecordDeleted`) is not true)))) join `H_TransportLocations` `TL` on(((`TCL`.`LocationId` = `TL`.`Id`) and ((0 <> `TL`.`RecordDeleted`) is not true)))) where ((0 <> `TRR`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_ReqRidePassengers`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_ReqRidePassengers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_ReqRidePassengers` AS select `TRR`.`Id` AS `ReqRideId`,`TRR`.`CustomerId` AS `CustomerId`,`VT`.`Title` AS `VehicleTitle`,`TRR`.`VehicleType` AS `VehicleType`,`SC`.`Title` AS `ServiceClassTitle`,`TRR`.`ServiceClass` AS `ServiceClass`,`TRRP`.`PassengerId` AS `PassengerId`,`TCC`.`ContactId` AS `ContactId` from ((((`H_TransportReqRides` `TRR` join `H_TransportReqRidePassengers` `TRRP` on(((`TRR`.`Id` = `TRRP`.`ReqRideId`) and ((0 <> `TRRP`.`RecordDeleted`) is not true)))) join `H_TransportCustomerContacts` `TCC` on(((`TRRP`.`PassengerId` = `TCC`.`Id`) and ((0 <> `TCC`.`RecordDeleted`) is not true)))) join `H_ENUM_VehicleTypes` `VT` on((`TRR`.`VehicleType` = `VT`.`ENUM`))) join `H_ENUM_ServiceClasses` `SC` on((`TRR`.`ServiceClass` = `SC`.`ENUM`))) where ((0 <> `TRR`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_ReqRideSourceContactLocation`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_ReqRideSourceContactLocation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_ReqRideSourceContactLocation` AS select `TRR`.`Id` AS `Id`,`TCL`.`ContactId` AS `ContactId`,`TL`.`Id` AS `LocationId`,`TCL`.`FavAdrLabel` AS `FavAdrLabel`,`TL`.`Title` AS `Title`,`TL`.`Latitude` AS `Latitude`,`TL`.`Longitude` AS `Longitude`,`TL`.`Address` AS `Address`,`TL`.`City` AS `LocationCity`,`TL`.`Province` AS `Province`,`TL`.`PostalCode` AS `PostalCode`,`TL`.`PlaceId` AS `PlaceId` from ((`H_TransportReqRides` `TRR` join `H_TransportContactLocations` `TCL` on(((`TRR`.`FromContactLocationId` = `TCL`.`Id`) and ((0 <> `TCL`.`RecordDeleted`) is not true)))) join `H_TransportLocations` `TL` on(((`TCL`.`LocationId` = `TL`.`Id`) and ((0 <> `TL`.`RecordDeleted`) is not true)))) where ((0 <> `TRR`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_TransportAddons`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportAddons`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_TransportAddons` AS select `TFC`.`Id` AS `Id`,`CI`.`Title` AS `CalculationItemTitle`,`CU`.`Title` AS `CalculationUnitTitle`,`CM`.`Title` AS `CalculateMethodTitle`,`TFC`.`UnitAmount` AS `UnitAmount`,`TFC`.`Price` AS `Price`,`TFC`.`DistributorId` AS `DistributorId`,`TFC`.`CVOId` AS `CVOId`,`TFC`.`CalculationItem` AS `CalculationItem`,`TFC`.`CalculationUnit` AS `CalculationUnit`,`TFC`.`TransportCategory` AS `TransportCategory`,`TFC`.`ServiceCategory` AS `ServiceCategory`,`TFC`.`VehicleType` AS `VehicleType`,`TFC`.`ServiceClass` AS `ServiceClass`,`TFC`.`CalculationType` AS `CalculationType`,`TFC`.`CalculateMethod` AS `CalculateMethod`,`TFC`.`CalculationPriority` AS `CalculationPriority`,`TFC`.`PriceTable` AS `PriceTable` from (((`H_TransportFareCalculations` `TFC` join `H_ENUM_CalculationItems` `CI` on((`TFC`.`CalculationItem` = `CI`.`ENUM`))) join `H_ENUM_CalculationUnits` `CU` on((`TFC`.`CalculationUnit` = `CU`.`ENUM`))) join `H_ENUM_CalculateMethods` `CM` on((`TFC`.`CalculateMethod` = `CM`.`ENUM`))) where (((0 <> `TFC`.`RecordDeleted`) is not true) and (`TFC`.`CalculationItem` <> 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_TransportBatchItemsDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportBatchItemsDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_TransportBatchItemsDetail` AS select `TBI`.`Id` AS `Id`,`TB`.`Id` AS `BatchId`,`TB`.`IsEditable` AS `BatchIsEditable`,`TB`.`DistributorId` AS `DistributorId`,`TB`.`TotalFareAtDispatch` AS `TotalFareAtDispatch`,`TBI`.`Id` AS `ItemId`,`TBI`.`ItemOrder` AS `ItemOrder`,`TBI`.`Discriminator` AS `Discriminator`,(case when (`TRR`.`Id` is not null) then true else false end) AS `IsRide`,`TRR`.`Id` AS `ReqRideId`,`TRR`.`IsEditable` AS `ReqRideIsEditable`,`TRR`.`Status` AS `ReqRideStatus`,`TRD`.`Id` AS `ReqDeliveryId`,`TRD`.`IsEditable` AS `ReqDeliveryIsEditable`,`TRD`.`Status` AS `ReqDeliveryStatus` from (((`H_TransportBatches` `TB` join `H_TransportBatchItems` `TBI` on(((`TB`.`Id` = `TBI`.`BatchId`) and ((0 <> `TBI`.`RecordDeleted`) is not true)))) left join `H_TransportReqRides` `TRR` on(((`TBI`.`TransportReqRideId` = `TRR`.`Id`) and ((0 <> `TRR`.`RecordDeleted`) is not true)))) left join `H_TransportReqDeliveries` `TRD` on(((`TBI`.`TransportReqDeliveryId` = `TRD`.`Id`) and ((0 <> `TRD`.`RecordDeleted`) is not true)))) where ((0 <> `TB`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_TransportContactRegistry`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportContactRegistry`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_TransportContactRegistry` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`PossibleUserId` AS `PossibleUserId`,`BaseTable`.`Firstname_fsx` AS `Firstname_fsx`,`BaseTable`.`Lastname_fsx` AS `Lastname_fsx`,`BaseTable`.`PossibleEntityId` AS `PossibleEntityId`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`MainLocationId` AS `MainLocationId`,`BaseTable`.`Buzzer` AS `Buzzer`,`BaseTable`.`Language` AS `Language`,`BaseTable`.`TimeZone` AS `TimeZone`,`BaseTable`.`Currency` AS `Currency`,`BaseTable`.`SignatureUri` AS `SignatureUri`,`BaseTable`.`PhotoUri` AS `PhotoUri`,`BaseTable`.`BirthDate_fsx` AS `BirthDate_fsx`,`BaseTable`.`Notification_SMS_fsx` AS `Notification_SMS_fsx`,`BaseTable`.`Notification_Phone_fsx` AS `Notification_Phone_fsx`,`BaseTable`.`Notification_Phone_Extention_fsx` AS `Notification_Phone_Extention_fsx`,`BaseTable`.`Notification_Email_fsx` AS `Notification_Email_fsx`,`BaseTable`.`Notification_WhatsApp_fsx` AS `Notification_WhatsApp_fsx`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator`,`UI`.`Firstname_fsx` AS `UserFirstname_fsx`,`UI`.`Lastname_fsx` AS `UserLastname_fsx`,`UI`.`Username` AS `UserUsername`,`UI`.`Email_fsx` AS `UserEmail_fsx`,`UI`.`Email_hash` AS `UserEmail_hash`,`UI`.`EmailConfirmed` AS `UserEmailConfirmed`,`UI`.`CellPhone_fsx` AS `UserCellPhone_fsx`,`UI`.`CellPhone_hash` AS `UserCellPhone_hash`,`UI`.`CellPhoneConfirmed` AS `UserCellPhoneConfirmed`,`UI`.`IssuedBy` AS `UserIssuedBy` from ((`H_TransportContactRegistry` `BaseTable` left join `H_AAA_Synced_EntityProfile` `AP` on(((`BaseTable`.`PossibleEntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) left join `H_AAA_Synced_UserInfo` `UI` on(((`BaseTable`.`PossibleUserId` = `UI`.`Id`) and ((0 <> `UI`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_TransportContactRegistryLastRecord`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportContactRegistryLastRecord`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_TransportContactRegistryLastRecord` AS select `TransportContactRegistry`.`Id` AS `Id`,`TransportContactRegistry`.`PossibleUserId` AS `PossibleUserId`,`TransportContactRegistry`.`Firstname_fsx` AS `Firstname_fsx`,`TransportContactRegistry`.`Lastname_fsx` AS `Lastname_fsx`,`TransportContactRegistry`.`PossibleEntityId` AS `PossibleEntityId`,`TransportContactRegistry`.`Title` AS `Title`,`TransportContactRegistry`.`MainLocationId` AS `MainLocationId`,`TransportContactRegistry`.`Buzzer` AS `Buzzer`,`TransportContactRegistry`.`Language` AS `Language`,`TransportContactRegistry`.`TimeZone` AS `TimeZone`,`TransportContactRegistry`.`Currency` AS `Currency`,`TransportContactRegistry`.`SignatureUri` AS `SignatureUri`,`TransportContactRegistry`.`PhotoUri` AS `PhotoUri`,`TransportContactRegistry`.`BirthDate_fsx` AS `BirthDate_fsx`,`TransportContactRegistry`.`Notification_SMS_fsx` AS `Notification_SMS_fsx`,`TransportContactRegistry`.`Notification_Phone_fsx` AS `Notification_Phone_fsx`,`TransportContactRegistry`.`Notification_Phone_Extention_fsx` AS `Notification_Phone_Extention_fsx`,`TransportContactRegistry`.`Notification_Email_fsx` AS `Notification_Email_fsx`,`TransportContactRegistry`.`Notification_WhatsApp_fsx` AS `Notification_WhatsApp_fsx`,`TransportContactRegistry`.`EntityTitle` AS `EntityTitle`,`TransportContactRegistry`.`EntityAddress_fsx` AS `EntityAddress_fsx`,`TransportContactRegistry`.`EntityCity` AS `EntityCity`,`TransportContactRegistry`.`EntityProvince` AS `EntityProvince`,`TransportContactRegistry`.`EntityCountry` AS `EntityCountry`,`TransportContactRegistry`.`EntityPostalCode_fsx` AS `EntityPostalCode_fsx`,`TransportContactRegistry`.`EntityPhone_fsx` AS `EntityPhone_fsx`,`TransportContactRegistry`.`EntityFaxNumber_fsx` AS `EntityFaxNumber_fsx`,`TransportContactRegistry`.`EntityEmail_fsx` AS `EntityEmail_fsx`,`TransportContactRegistry`.`EntityDiscriminator` AS `EntityDiscriminator`,`TransportContactRegistry`.`UserFirstname_fsx` AS `UserFirstname_fsx`,`TransportContactRegistry`.`UserLastname_fsx` AS `UserLastname_fsx`,`TransportContactRegistry`.`UserUsername` AS `UserUsername`,`TransportContactRegistry`.`UserEmail_fsx` AS `UserEmail_fsx`,`TransportContactRegistry`.`UserEmail_hash` AS `UserEmail_hash`,`TransportContactRegistry`.`UserEmailConfirmed` AS `UserEmailConfirmed`,`TransportContactRegistry`.`UserCellPhone_fsx` AS `UserCellPhone_fsx`,`TransportContactRegistry`.`UserCellPhone_hash` AS `UserCellPhone_hash`,`TransportContactRegistry`.`UserCellPhoneConfirmed` AS `UserCellPhoneConfirmed`,`TransportContactRegistry`.`UserIssuedBy` AS `UserIssuedBy` from (select `Vi_DPC_TransportContactRegistry`.`Id` AS `Id`,`Vi_DPC_TransportContactRegistry`.`PossibleUserId` AS `PossibleUserId`,`Vi_DPC_TransportContactRegistry`.`Firstname_fsx` AS `Firstname_fsx`,`Vi_DPC_TransportContactRegistry`.`Lastname_fsx` AS `Lastname_fsx`,`Vi_DPC_TransportContactRegistry`.`PossibleEntityId` AS `PossibleEntityId`,`Vi_DPC_TransportContactRegistry`.`Title` AS `Title`,`Vi_DPC_TransportContactRegistry`.`MainLocationId` AS `MainLocationId`,`Vi_DPC_TransportContactRegistry`.`Buzzer` AS `Buzzer`,`Vi_DPC_TransportContactRegistry`.`Language` AS `Language`,`Vi_DPC_TransportContactRegistry`.`TimeZone` AS `TimeZone`,`Vi_DPC_TransportContactRegistry`.`Currency` AS `Currency`,`Vi_DPC_TransportContactRegistry`.`SignatureUri` AS `SignatureUri`,`Vi_DPC_TransportContactRegistry`.`PhotoUri` AS `PhotoUri`,`Vi_DPC_TransportContactRegistry`.`BirthDate_fsx` AS `BirthDate_fsx`,`Vi_DPC_TransportContactRegistry`.`Notification_SMS_fsx` AS `Notification_SMS_fsx`,`Vi_DPC_TransportContactRegistry`.`Notification_Phone_fsx` AS `Notification_Phone_fsx`,`Vi_DPC_TransportContactRegistry`.`Notification_Phone_Extention_fsx` AS `Notification_Phone_Extention_fsx`,`Vi_DPC_TransportContactRegistry`.`Notification_Email_fsx` AS `Notification_Email_fsx`,`Vi_DPC_TransportContactRegistry`.`Notification_WhatsApp_fsx` AS `Notification_WhatsApp_fsx`,`Vi_DPC_TransportContactRegistry`.`EntityTitle` AS `EntityTitle`,`Vi_DPC_TransportContactRegistry`.`EntityAddress_fsx` AS `EntityAddress_fsx`,`Vi_DPC_TransportContactRegistry`.`EntityCity` AS `EntityCity`,`Vi_DPC_TransportContactRegistry`.`EntityProvince` AS `EntityProvince`,`Vi_DPC_TransportContactRegistry`.`EntityCountry` AS `EntityCountry`,`Vi_DPC_TransportContactRegistry`.`EntityPostalCode_fsx` AS `EntityPostalCode_fsx`,`Vi_DPC_TransportContactRegistry`.`EntityPhone_fsx` AS `EntityPhone_fsx`,`Vi_DPC_TransportContactRegistry`.`EntityFaxNumber_fsx` AS `EntityFaxNumber_fsx`,`Vi_DPC_TransportContactRegistry`.`EntityEmail_fsx` AS `EntityEmail_fsx`,`Vi_DPC_TransportContactRegistry`.`EntityDiscriminator` AS `EntityDiscriminator`,`Vi_DPC_TransportContactRegistry`.`UserFirstname_fsx` AS `UserFirstname_fsx`,`Vi_DPC_TransportContactRegistry`.`UserLastname_fsx` AS `UserLastname_fsx`,`Vi_DPC_TransportContactRegistry`.`UserUsername` AS `UserUsername`,`Vi_DPC_TransportContactRegistry`.`UserEmail_fsx` AS `UserEmail_fsx`,`Vi_DPC_TransportContactRegistry`.`UserEmail_hash` AS `UserEmail_hash`,`Vi_DPC_TransportContactRegistry`.`UserEmailConfirmed` AS `UserEmailConfirmed`,`Vi_DPC_TransportContactRegistry`.`UserCellPhone_fsx` AS `UserCellPhone_fsx`,`Vi_DPC_TransportContactRegistry`.`UserCellPhone_hash` AS `UserCellPhone_hash`,`Vi_DPC_TransportContactRegistry`.`UserCellPhoneConfirmed` AS `UserCellPhoneConfirmed`,`Vi_DPC_TransportContactRegistry`.`UserIssuedBy` AS `UserIssuedBy` from `Vi_DPC_TransportContactRegistry`) `TransportContactRegistry` where `TransportContactRegistry`.`Id` in (select max(`TransportContactRegistry_Max`.`Id`) from (select `Vi_DPC_TransportContactRegistry`.`Id` AS `Id`,`Vi_DPC_TransportContactRegistry`.`UserCellPhone_fsx` AS `UserCellPhone_fsx` from `Vi_DPC_TransportContactRegistry`) `TransportContactRegistry_Max` group by `TransportContactRegistry_Max`.`UserCellPhone_fsx`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_TransportCustomerContactsDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportCustomerContactsDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_TransportCustomerContactsDetail` AS select `T_CUS_CON`.`Id` AS `Id`,`T_CUS_CON`.`CustomerId` AS `CustomerId`,`T_CUS_CON`.`ContactId` AS `ContactId`,`VI_CON_LAST_REC`.`PossibleUserId` AS `PossibleUserId`,`VI_CON_LAST_REC`.`Firstname_fsx` AS `Firstname_fsx`,`VI_CON_LAST_REC`.`Lastname_fsx` AS `Lastname_fsx`,`VI_CON_LAST_REC`.`PossibleEntityId` AS `PossibleEntityId`,`VI_CON_LAST_REC`.`Title` AS `Title`,`VI_CON_LAST_REC`.`MainLocationId` AS `MainLocationId`,`VI_CON_LAST_REC`.`Buzzer` AS `Buzzer`,`VI_CON_LAST_REC`.`Language` AS `Language`,`VI_CON_LAST_REC`.`TimeZone` AS `TimeZone`,`VI_CON_LAST_REC`.`Currency` AS `Currency`,`VI_CON_LAST_REC`.`SignatureUri` AS `SignatureUri`,`VI_CON_LAST_REC`.`PhotoUri` AS `PhotoUri`,`VI_CON_LAST_REC`.`BirthDate_fsx` AS `BirthDate_fsx`,`VI_CON_LAST_REC`.`Notification_SMS_fsx` AS `Notification_SMS_fsx`,`VI_CON_LAST_REC`.`Notification_Phone_fsx` AS `Notification_Phone_fsx`,`VI_CON_LAST_REC`.`Notification_Phone_Extention_fsx` AS `Notification_Phone_Extention_fsx`,`VI_CON_LAST_REC`.`Notification_Email_fsx` AS `Notification_Email_fsx`,`VI_CON_LAST_REC`.`Notification_WhatsApp_fsx` AS `Notification_WhatsApp_fsx`,`VI_CON_LAST_REC`.`EntityTitle` AS `EntityTitle`,`VI_CON_LAST_REC`.`EntityAddress_fsx` AS `EntityAddress_fsx`,`VI_CON_LAST_REC`.`EntityCity` AS `EntityCity`,`VI_CON_LAST_REC`.`EntityProvince` AS `EntityProvince`,`VI_CON_LAST_REC`.`EntityCountry` AS `EntityCountry`,`VI_CON_LAST_REC`.`EntityPostalCode_fsx` AS `EntityPostalCode_fsx`,`VI_CON_LAST_REC`.`EntityPhone_fsx` AS `EntityPhone_fsx`,`VI_CON_LAST_REC`.`EntityFaxNumber_fsx` AS `EntityFaxNumber_fsx`,`VI_CON_LAST_REC`.`EntityEmail_fsx` AS `EntityEmail_fsx`,`VI_CON_LAST_REC`.`EntityDiscriminator` AS `EntityDiscriminator`,`VI_CON_LAST_REC`.`UserFirstname_fsx` AS `UserFirstname_fsx`,`VI_CON_LAST_REC`.`UserLastname_fsx` AS `UserLastname_fsx`,`VI_CON_LAST_REC`.`UserUsername` AS `UserUsername`,`VI_CON_LAST_REC`.`UserEmail_fsx` AS `UserEmail_fsx`,`VI_CON_LAST_REC`.`UserEmail_hash` AS `UserEmail_hash`,`VI_CON_LAST_REC`.`UserEmailConfirmed` AS `UserEmailConfirmed`,`VI_CON_LAST_REC`.`UserCellPhone_fsx` AS `UserCellPhone_fsx`,`VI_CON_LAST_REC`.`UserCellPhone_hash` AS `UserCellPhone_hash`,`VI_CON_LAST_REC`.`UserCellPhoneConfirmed` AS `UserCellPhoneConfirmed`,`VI_CON_LAST_REC`.`UserIssuedBy` AS `UserIssuedBy` from (`H_TransportCustomerContacts` `T_CUS_CON` join `Vi_DPC_TransportContactRegistryLastRecord` `VI_CON_LAST_REC` on((`T_CUS_CON`.`ContactId` = `VI_CON_LAST_REC`.`Id`))) where ((0 <> `T_CUS_CON`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_TransportCustomers`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportCustomers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_TransportCustomers` AS select `TransportCustomers`.`Id` AS `Id`,'User' AS `CustomerType`,`TransportCustomers`.`UserId` AS `UserOrEntityId`,`UserInfo`.`Firstname_fsx` AS `TransportCustomerFirstname_fsx`,`UserInfo`.`Lastname_fsx` AS `TransportCustomerLastname_fsx`,NULL AS `TransportCustomerTitle`,`UserInfo`.`CellPhone_fsx` AS `TransportCustomerPhone_fsx`,`UserInfo`.`Email_fsx` AS `TransportCustomerEmail_fsx`,`TransportCustomers`.`RecordDeleted` AS `RecordDeleted` from (`H_TransportCustomers` `TransportCustomers` join `H_AAA_Synced_UserInfo` `UserInfo` on((`UserInfo`.`Id` = `TransportCustomers`.`UserId`))) union all select `TransportCustomers`.`Id` AS `TransportCustomerId`,'Entity' AS `CustomerType`,`TransportCustomers`.`EntityId` AS `UserOrEntityId`,NULL AS `TransportCustomersFirstname_fsx`,NULL AS `TransportCustomersLastname_fsx`,`EntityProfile`.`Title` AS `TransportCustomersTitle`,`EntityProfile`.`Phone_fsx` AS `TransportCustomersPhone_fsx`,`EntityProfile`.`Email_fsx` AS `TransportCustomerEmail_fsx`,`TransportCustomers`.`RecordDeleted` AS `RecordDeleted` from (`H_TransportCustomers` `TransportCustomers` join `H_AAA_Synced_EntityProfile` `EntityProfile` on((`EntityProfile`.`Id` = `TransportCustomers`.`EntityId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_TransportCustomersSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportCustomersSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_TransportCustomersSuperDetail` AS select `TCustomers`.`Id` AS `CustomerId`,`TCustomers`.`EntityId` AS `EntityId`,`EntityProfile`.`Title` AS `EntityTitle`,`EntityProfile`.`Address_fsx` AS `EntityAddress_fsx`,`EntityProfile`.`Phone_fsx` AS `EntityPhone`,`EntityProfile`.`Email_fsx` AS `EntityEmail_fsx`,`TCustomers`.`UserId` AS `UserId`,`UserInfo`.`Firstname_fsx` AS `UserFirstname_fsx`,`UserInfo`.`Lastname_fsx` AS `UserLastname_fsx`,`UserInfo`.`Email_fsx` AS `UserEmail_fsx`,`UserInfo`.`CellPhone_fsx` AS `UserCellPhone_fsx` from ((`H_TransportCustomers` `TCustomers` left join `H_AAA_Synced_EntityProfile` `EntityProfile` on((`TCustomers`.`EntityId` = `EntityProfile`.`Id`))) left join `H_AAA_Synced_UserInfo` `UserInfo` on((`TCustomers`.`UserId` = `UserInfo`.`Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_TransportReqRideAddons`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportReqRideAddons`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_TransportReqRideAddons` AS select `TRRA`.`Id` AS `Id`,`TRRA`.`TransportReqRideId` AS `TransportReqRideId`,`TRRA`.`CalculationItem` AS `CalculationItem`,`CI`.`Title` AS `CalculationItemTitle`,`TRRA`.`CalculationUnit` AS `CalculationUnit`,`CU`.`Title` AS `CalculationUnitTitle`,`TRRA`.`Amount` AS `Amount` from ((`H_TransportReqRideAddons` `TRRA` join `H_ENUM_CalculationItems` `CI` on((`TRRA`.`CalculationItem` = `CI`.`ENUM`))) join `H_ENUM_CalculationUnits` `CU` on((`TRRA`.`CalculationUnit` = `CU`.`ENUM`))) where ((0 <> `TRRA`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_TransportReqRideSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportReqRideSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_TransportReqRideSummary` AS select `TransportReqRide`.`Id` AS `TransportReqRideId`,`TransportReqRide`.`IsEditable` AS `TransportReqRideIsEditable`,`TransportReqRide`.`CustomerId` AS `TransportReqRideCustomerId`,`TransportCustomers`.`CustomerType` AS `CustomerType`,`TransportCustomers`.`TransportCustomerTitle` AS `TransportCustomerTitle`,`TransportCustomers`.`TransportCustomerFirstname_fsx` AS `TransportCustomerFirstname_fsx`,`TransportCustomers`.`TransportCustomerLastname_fsx` AS `TransportCustomerLastname_Fsx`,`TransportCustomers`.`TransportCustomerPhone_fsx` AS `TransportCustomerPhone_fsx`,`TransportBatchItems`.`BatchId` AS `BatchId`,`TransportBatchItems`.`ItemOrder` AS `ItemOrder`,`TransportBatchItems`.`Discriminator` AS `Discriminator`,`TransportReqRide`.`DistributorId` AS `DistributorId`,`Distributor`.`EntityTitle` AS `DistributorTitle`,`TransportReqRide`.`CVOId` AS `CVOId`,`CVO`.`EntityTitle` AS `CVOTitle`,`TransportReqRide`.`FromContactLocationId` AS `FromContactLocationId`,`FromTransportLocation`.`FavAdrLabel` AS `FromContactLocationFavAdrLabel`,`FromTransportLocation`.`Title` AS `FromContactLocationTitle`,`FromTransportLocation`.`Latitude` AS `FromContactLocationLatitude`,`FromTransportLocation`.`Longitude` AS `FromContactLocationLongitude`,`FromTransportLocation`.`Address` AS `FromContactLocationAddress`,`FromTransportLocation`.`LocationCity` AS `FromContactLocationCity`,`FromTransportLocation`.`Province` AS `FromContactLocationProvince`,`FromTransportLocation`.`PostalCode` AS `FromContactLocationPostalCode`,`FromTransportLocation`.`PlaceId` AS `FromContactLocationPlaceId`,`TransportReqRide`.`ToContactLocationId` AS `ToContactLocationId`,`ToTransportLocation`.`FavAdrLabel` AS `ToContactLocationFavAdrLabel`,`ToTransportLocation`.`Title` AS `ToContactLocationTitle`,`ToTransportLocation`.`Latitude` AS `ToContactLocationLatitude`,`ToTransportLocation`.`Longitude` AS `ToContactLocationLongitude`,`ToTransportLocation`.`Address` AS `ToContactLocationAddress`,`ToTransportLocation`.`LocationCity` AS `ToContactLocationCity`,`ToTransportLocation`.`Province` AS `ToContactLocationProvince`,`ToTransportLocation`.`PostalCode` AS `ToContactLocationPostalCode`,`ToTransportLocation`.`PlaceId` AS `ToContactLocationPlaceId`,`TransportReqRide`.`PickupAfterDateTime` AS `PickupAfterDateTime`,`TransportReqRide`.`PickupBeforeDateTime` AS `PickupBeforeDateTime`,`TransportReqRide`.`DropOffAfterDateTime` AS `DropOffAfterDateTime`,`TransportReqRide`.`DropOffBeforeDateTime` AS `DropOffBeforeDateTime`,`TransportReqRide`.`VehicleType` AS `VehicleType`,`VehicleTypes`.`Title` AS `VehicleTypeTitle`,`TransportReqRide`.`VehicleProfileSubType` AS `VehicleProfileSubType`,`TransportReqRide`.`ServiceClass` AS `ServiceClass`,`ServiceClasses`.`Title` AS `ServiceClassTitle`,`TransportReqRide`.`TotalRequiredSeats` AS `TotalRequiredSeats`,`TransportReqRide`.`NumberOfLuggages` AS `NumberOfLuggages`,`TransportReqRide`.`FeaturesJSON` AS `featuresJSON`,`TransportReqRide`.`Comments` AS `Comments`,`TransportReqRide`.`FareAtSubmission` AS `FareAtSubmission`,`TransportReqRide`.`PromoCode` AS `PromoCode`,`TransportReqRide`.`HubCarrierInfo` AS `HubCarrierInfo`,`TransportReqRide`.`Status` AS `TransportReqRideStatus`,`ReqStatuses`.`Title` AS `TransportReqRideStatusTitle` from ((((((((((`H_TransportReqRides` `TransportReqRide` join `H_TransportBatchItems` `TransportBatchItems` on(((`TransportBatchItems`.`TransportReqRideId` = `TransportReqRide`.`Id`) and ((0 <> `TransportBatchItems`.`RecordDeleted`) is not true)))) join `Vi_DPC_TransportCustomers` `TransportCustomers` on((`TransportReqRide`.`CustomerId` = `TransportCustomers`.`Id`))) join `Vi_DPC_CVO` `CVO` on((`TransportReqRide`.`CVOId` = `CVO`.`Id`))) join `Vi_DPC_Distributor` `Distributor` on((`TransportReqRide`.`DistributorId` = `Distributor`.`Id`))) join `Vi_DPC_ReqRidePassengers` `ReqRidePassengers` on((`TransportReqRide`.`Id` = `ReqRidePassengers`.`ReqRideId`))) join `Vi_DPC_ContactLocations` `FromTransportLocation` on(((`TransportReqRide`.`FromContactLocationId` = `FromTransportLocation`.`Id`) and (`ReqRidePassengers`.`ContactId` = `FromTransportLocation`.`ContactId`)))) join `Vi_DPC_ContactLocations` `ToTransportLocation` on(((`TransportReqRide`.`ToContactLocationId` = `ToTransportLocation`.`Id`) and (`ReqRidePassengers`.`ContactId` = `ToTransportLocation`.`ContactId`)))) join `H_ENUM_VehicleTypes` `VehicleTypes` on((`TransportReqRide`.`VehicleType` = `VehicleTypes`.`ENUM`))) join `H_ENUM_ServiceClasses` `ServiceClasses` on((`TransportReqRide`.`ServiceClass` = `ServiceClasses`.`ENUM`))) join `H_ENUM_TransportRequestStatuses` `ReqStatuses` on((`TransportReqRide`.`Status` = `ReqStatuses`.`ENUM`))) where ((0 <> `TransportReqRide`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_TransportReqRideUnifiedBase`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportReqRideUnifiedBase`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_TransportReqRideUnifiedBase` AS select count(0) AS `Count`,`c`.`CustomerId` AS `CustomerId`,`c`.`ReqOrBatch` AS `ReqOrBatch`,`c`.`ReqOrBatchTag` AS `ReqOrBatchTag`,`c`.`CaseId` AS `CaseId` from (select `TB`.`Id` AS `TransportBatchId`,(case when (`TB`.`Id` is null) then 1 else 2 end) AS `ReqOrBatch`,(case when (`TB`.`Id` is null) then 'Request' else 'Batch' end) AS `ReqOrBatchTag`,(case when (`TB`.`Id` is null) then `TRR`.`Id` else concat(`TB`.`Id`) end) AS `CaseId`,`TRR`.`CustomerId` AS `CustomerId` from ((`H_TransportReqRides` `TRR` left join `H_TransportBatchItems` `TBI` on((`TRR`.`Id` = `TBI`.`TransportReqRideId`))) left join `H_TransportBatches` `TB` on((`TB`.`Id` = `TBI`.`BatchId`))) where (`TRR`.`CustomerId` = 2)) `c` group by `c`.`ReqOrBatch`,`c`.`ReqOrBatchTag`,`c`.`CaseId`,`c`.`CustomerId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_TransportReqRides`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportReqRides`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_TransportReqRides` AS select `TRR`.`Id` AS `Id`,`TRR`.`IsEditable` AS `IsEditable`,`TRR`.`CustomerId` AS `CustomerId`,`TRR`.`DistributorId` AS `DistributorId`,`TRR`.`CVOId` AS `CVOId`,`TRR`.`FromContactLocationId` AS `FromContactLocationId`,`TRR`.`ToContactLocationId` AS `ToContactLocationId`,`TRR`.`PickupAfterDateTime` AS `PickupAfterDateTime`,`TRR`.`PickupAfterDateTime_UTC` AS `PickupAfterDateTime_UTC`,`TRR`.`PickupBeforeDateTime` AS `PickupBeforeDateTime`,`TRR`.`PickupBeforeDateTime_UTC` AS `PickupBeforeDateTime_UTC`,`TRR`.`DropOffAfterDateTime` AS `DropOffAfterDateTime`,`TRR`.`DropOffAfterDateTime_UTC` AS `DropOffAfterDateTime_UTC`,`TRR`.`DropOffBeforeDateTime` AS `DropOffBeforeDateTime`,`TRR`.`DropOffBeforeDateTime_UTC` AS `DropOffBeforeDateTime_UTC`,`TRR`.`VehicleType` AS `VehicleType`,`TRR`.`VehicleProfileSubType` AS `VehicleProfileSubType`,`TRR`.`ServiceClass` AS `ServiceClass`,`TRR`.`ServiceCategory` AS `ServiceCategory`,`TRR`.`TotalRequiredSeats` AS `TotalRequiredSeats`,`TRR`.`NumberOfLuggages` AS `NumberOfLuggages`,`TRR`.`FeaturesJSON` AS `FeaturesJSON`,`TRR`.`Comments` AS `Comments`,`TRR`.`FareAtSubmission` AS `FareAtSubmission`,`TRR`.`PromoCode` AS `PromoCode`,`TRR`.`PaymentCategory` AS `PaymentCategory`,`TRR`.`PaymentMethod` AS `PaymentMethod`,`TRR`.`PaidAt_UTC` AS `PaidAt_UTC`,`TRR`.`HubCarrierInfo` AS `HubCarrierInfo`,`TRR`.`Status` AS `Status`,`TRR`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`TRR`.`CreatedBy` AS `CreatedBy`,`TRR`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`TRR`.`ModifiedBy` AS `ModifiedBy`,`TRR`.`RecordDeleted` AS `RecordDeleted`,`SC`.`Title` AS `ServiceClassTitle`,`VT`.`Title` AS `VehicleTypeTitle`,(case when (`TRR`.`IsEditable` = 1) then 0 else 1 end) AS `IsReadOnly`,`VI_DCVO`.`CvoEntityTitle` AS `CVOTitle`,`ESC`.`Title` AS `ServiceCategoryTitle` from (((((`H_TransportReqRides` `TRR` join `H_ENUM_ServiceClasses` `SC` on((`TRR`.`ServiceClass` = `SC`.`ENUM`))) join `H_ENUM_VehicleTypes` `VT` on((`TRR`.`VehicleType` = `VT`.`ENUM`))) left join `Vi_DPC_CVO` `VI_CVO` on((`TRR`.`CVOId` = `VI_CVO`.`Id`))) left join `Vi_DPC_DistributorCVOsDetail` `VI_DCVO` on(((`TRR`.`CVOId` = `VI_DCVO`.`CvoId`) and (`TRR`.`ServiceCategory` = `VI_DCVO`.`ServiceCategory`) and (`TRR`.`ServiceClass` = `VI_DCVO`.`ServiceClass`) and (`TRR`.`DistributorId` = `VI_DCVO`.`DistributorId`) and (`TRR`.`VehicleType` = `VI_DCVO`.`VehicleType`)))) left join `H_ENUM_ServiceCategories` `ESC` on((`VI_DCVO`.`ServiceCategory` = `ESC`.`ENUM`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_TransportRideReservationUnified`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportRideReservationUnified`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_TransportRideReservationUnified` AS select `TRR`.`IsEditable` AS `IsEditable`,`TRRU`.`Count` AS `Count`,`TRRU`.`CustomerId` AS `CustomerId`,`TRRU`.`ReqOrBatch` AS `ReqOrBatch`,`TRRU`.`ReqOrBatchTag` AS `ReqOrBatchTag`,`TRRU`.`CaseId` AS `CaseId` from (`H_TransportReqRides` `TRR` join `Vi_DPC_TransportReqRideUnifiedBase` `TRRU` on((`TRR`.`Id` = `TRRU`.`CaseId`))) where (`TRRU`.`ReqOrBatch` = 1) union all select `TB`.`IsEditable` AS `IsEditable`,`TRRU`.`Count` AS `Count`,`TRRU`.`CustomerId` AS `CustomerId`,`TRRU`.`ReqOrBatch` AS `ReqOrBatch`,`TRRU`.`ReqOrBatchTag` AS `ReqOrBatchTag`,`TRRU`.`CaseId` AS `CaseId` from (`H_TransportBatches` `TB` join `Vi_DPC_TransportReqRideUnifiedBase` `TRRU` on((`TB`.`Id` = `TRRU`.`CaseId`))) where (`TRRU`.`ReqOrBatch` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_TransportRideReservations`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_TransportRideReservations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_TransportRideReservations` AS select `x`.`BatchId` AS `BatchId`,`x`.`IsEditable` AS `ReservationStatus`,(case when (`x`.`IsEditable` = 1) then 0 else 1 end) AS `IsReadOnly`,`x`.`CustomerId` AS `CustomerId`,`x`.`NumberOfRides` AS `NumberOfRides`,max((case when (`x`.`rn_first` = 1) then `x`.`CreatedAt_UTC` end)) AS `ReservedAt`,max((case when (`x`.`rn_first` = 1) then `floc`.`Title` end)) AS `FromLocationTitle`,max((case when (`x`.`rn_first` = 1) then `floc`.`Address` end)) AS `FromLocationAddress`,max((case when (`x`.`rn_last` = 1) then `tloc`.`Title` end)) AS `ToLocationTitle`,max((case when (`x`.`rn_last` = 1) then `tloc`.`Address` end)) AS `ToLocationAddress`,max((case when (`x`.`rn_first` = 1) then `x`.`VehicleType` end)) AS `VehicleType`,max((case when (`x`.`rn_first` = 1) then `x`.`VehicleProfileSubType` end)) AS `VehicleProfileSubType`,max((case when (`x`.`rn_first` = 1) then `x`.`ServiceClass` end)) AS `ServiceClass`,max((case when (`x`.`rn_first` = 1) then `x`.`PickupAfterDateTime` end)) AS `PickupAfterDateTime`,max((case when (`x`.`rn_first` = 1) then `x`.`PickupBeforeDateTime` end)) AS `PickupBeforeDateTime`,max((case when (`x`.`rn_last` = 1) then `x`.`DropOffAfterDateTime` end)) AS `DropOffAfterDateTime`,max((case when (`x`.`rn_last` = 1) then `x`.`DropOffBeforeDateTime` end)) AS `DropOffBeforeDateTime` from (((((select `b`.`Id` AS `BatchId`,`b`.`IsEditable` AS `IsEditable`,`tr`.`Id` AS `RideId`,`tr`.`CustomerId` AS `CustomerId`,`tr`.`FromContactLocationId` AS `FromContactLocationId`,`tr`.`ToContactLocationId` AS `ToContactLocationId`,`tr`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`tr`.`VehicleType` AS `VehicleType`,`tr`.`VehicleProfileSubType` AS `VehicleProfileSubType`,`tr`.`ServiceClass` AS `ServiceClass`,`tr`.`PickupAfterDateTime` AS `PickupAfterDateTime`,`tr`.`PickupBeforeDateTime` AS `PickupBeforeDateTime`,`tr`.`DropOffAfterDateTime` AS `DropOffAfterDateTime`,`tr`.`DropOffBeforeDateTime` AS `DropOffBeforeDateTime`,count(0) OVER (PARTITION BY `b`.`Id` )  AS `NumberOfRides`,row_number() OVER (PARTITION BY `b`.`Id` ORDER BY `tr`.`Id` )  AS `rn_first`,row_number() OVER (PARTITION BY `b`.`Id` ORDER BY `tr`.`Id` desc )  AS `rn_last` from ((`H_TransportBatches` `b` join `H_TransportBatchItems` `bi` on(((`bi`.`BatchId` = `b`.`Id`) and ((0 <> `bi`.`RecordDeleted`) is not true) and (`bi`.`TransportReqRideId` is not null)))) join `H_TransportReqRides` `tr` on(((`tr`.`Id` = `bi`.`TransportReqRideId`) and ((0 <> `tr`.`RecordDeleted`) is not true)))) where ((0 <> `b`.`RecordDeleted`) is not true)) `x` left join `H_TransportContactLocations` `fcl` on(((`fcl`.`Id` = `x`.`FromContactLocationId`) and ((0 <> `fcl`.`RecordDeleted`) is not true)))) left join `H_TransportLocations` `floc` on(((`floc`.`Id` = `fcl`.`LocationId`) and ((0 <> `floc`.`RecordDeleted`) is not true)))) left join `H_TransportContactLocations` `tcl` on(((`tcl`.`Id` = `x`.`ToContactLocationId`) and ((0 <> `tcl`.`RecordDeleted`) is not true)))) left join `H_TransportLocations` `tloc` on(((`tloc`.`Id` = `tcl`.`LocationId`) and ((0 <> `tloc`.`RecordDeleted`) is not true)))) group by `x`.`BatchId`,`x`.`IsEditable`,`x`.`CustomerId`,`x`.`NumberOfRides` union all select NULL AS `BatchId`,`tr`.`IsEditable` AS `ReservationStatus`,(case when (`tr`.`IsEditable` = 1) then 0 else 1 end) AS `IsReadOnly`,`tr`.`CustomerId` AS `CustomerId`,1 AS `NumberOfRides`,`tr`.`CreatedAt_UTC` AS `ReservedAt`,`floc`.`Title` AS `FromLocationTitle`,`floc`.`Address` AS `FromLocationAddress`,`tloc`.`Title` AS `ToLocationTitle`,`tloc`.`Address` AS `ToLocationAddress`,`tr`.`VehicleType` AS `VehicleType`,`tr`.`VehicleProfileSubType` AS `VehicleProfileSubType`,`tr`.`ServiceClass` AS `ServiceClass`,`tr`.`PickupAfterDateTime` AS `PickupAfterDateTime`,`tr`.`PickupBeforeDateTime` AS `PickupBeforeDateTime`,`tr`.`DropOffAfterDateTime` AS `DropOffAfterDateTime`,`tr`.`DropOffBeforeDateTime` AS `DropOffBeforeDateTime` from (((((`H_TransportReqRides` `tr` left join `H_TransportBatchItems` `bi` on(((`bi`.`TransportReqRideId` = `tr`.`Id`) and ((0 <> `bi`.`RecordDeleted`) is not true)))) left join `H_TransportContactLocations` `fcl` on(((`fcl`.`Id` = `tr`.`FromContactLocationId`) and ((0 <> `fcl`.`RecordDeleted`) is not true)))) left join `H_TransportLocations` `floc` on(((`floc`.`Id` = `fcl`.`LocationId`) and ((0 <> `floc`.`RecordDeleted`) is not true)))) left join `H_TransportContactLocations` `tcl` on(((`tcl`.`Id` = `tr`.`ToContactLocationId`) and ((0 <> `tcl`.`RecordDeleted`) is not true)))) left join `H_TransportLocations` `tloc` on(((`tloc`.`Id` = `tcl`.`LocationId`) and ((0 <> `tloc`.`RecordDeleted`) is not true)))) where (((0 <> `tr`.`RecordDeleted`) is not true) and (`bi`.`Id` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_UserEntityRoleDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_UserEntityRoleDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_UserEntityRoleDetail` AS select `EP`.`Id` AS `EntityId`,`EP`.`Title` AS `EntityTitle`,`ER`.`Id` AS `RoleId`,`ER`.`Title` AS `RoleTitle`,`UER`.`UserId` AS `UserId`,`ER`.`ActENUM` AS `ActEnum`,`AE`.`Title` AS `ActTitle`,(case when (`ER`.`ActENUM` = 0) then 1 else 0 end) AS `IsReadOnly` from (((`H_AAA_UserEntityRoles` `UER` join `H_AAA_EntityRoles` `ER` on((`UER`.`EntityRoleId` = `ER`.`Id`))) join `H_AAA_Synced_EntityProfile` `EP` on((`ER`.`EntityId` = `EP`.`Id`))) join `H_ENUM_Actors` `AE` on((`AE`.`ENUM` = `ER`.`ActENUM`))) where (((0 <> `UER`.`RecordDeleted`) is not true) and ((0 <> `ER`.`RecordDeleted`) is not true) and ((0 <> `EP`.`RecordDeleted`) is not true)) */;
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
/*!50001 VIEW `Vi_DP_ENUM_ComponentType` AS select lpad((`Upto100`.`Sequence` - 1),2,'0') AS `id`,replace(substring_index(substring_index(substring_index(trim(trailing ')' from `information_schema`.`columns`.`COLUMN_TYPE`),'(',-(1)),',',`Upto100`.`Sequence`),',',-(1)),'\'','') AS `title` from (`information_schema`.`COLUMNS` `columns` join (select (((`A`.`t` * 10) + `B`.`u`) + 1) AS `Sequence` from ((select 0 AS `t` union select 1 AS `1` union select 2 AS `2` union select 3 AS `3` union select 4 AS `4` union select 5 AS `5` union select 6 AS `6` union select 7 AS `7` union select 8 AS `8` union select 9 AS `9`) `A` join (select 0 AS `u` union select 1 AS `1` union select 2 AS `2` union select 3 AS `3` union select 4 AS `4` union select 5 AS `5` union select 6 AS `6` union select 7 AS `7` union select 8 AS `8` union select 9 AS `9`) `B`) order by `Sequence`) `Upto100` on(((char_length(`information_schema`.`columns`.`COLUMN_TYPE`) - char_length(replace(`information_schema`.`columns`.`COLUMN_TYPE`,',',''))) >= (`Upto100`.`Sequence` - 1)))) where ((`information_schema`.`columns`.`TABLE_NAME` = 'H_DP_ComponentsBases') and (`information_schema`.`columns`.`COLUMN_NAME` = 'Type') and (`information_schema`.`columns`.`TABLE_SCHEMA` = 'HBloxTMSCore_DEV05')) order by `Upto100`.`Sequence` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_ActorConfigListSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_ActorConfigListSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_ActorConfigListSummary` AS select `m`.`Id` AS `Id`,`m`.`EntityId` AS `EntityId`,`m`.`VehicleId` AS `VehicleId`,`m`.`UserId` AS `UserId`,`m`.`ActENUM` AS `ActENUM`,`m`.`ScenarioId` AS `ScenarioId`,`m`.`ConfigBaseId` AS `ConfigBaseId`,`m`.`Value` AS `Value`,`m`.`IsOverridable` AS `IsOverridable`,`m`.`Signature` AS `Signature`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h0e`.`Title` AS `ScenarioTitle`,`h2`.`Code` AS `ConfigBaseCode`,`h3`.`Firstname_fsx` AS `Firstname_fsx`,`h3`.`Lastname_fsx` AS `Lastname_fsx`,`h3`.`Username` AS `Username`,`h3`.`Email_fsx` AS `Email_fsx`,`h3`.`CellPhone_fsx` AS `CellPhone_fsx` from ((((`H_CFG_ActorConfigs` `m` left join `H_AAA_EntityScenarios` `h0` on((`h0`.`Id` = `m`.`ScenarioId`))) left join `H_AAA_Synced_EntityProfile` `h0e` on((`h0e`.`Id` = `h0`.`EntityId`))) left join `H_CFG_ActionConfigBases` `h2` on((`h2`.`Id` = `m`.`ConfigBaseId`))) left join `H_AAA_Synced_UserInfo` `h3` on((`h3`.`Id` = `m`.`UserId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_ActorConfigProfile`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_ActorConfigProfile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_ActorConfigProfile` AS select `m`.`Id` AS `Id`,`m`.`EntityId` AS `EntityId`,`m`.`VehicleId` AS `VehicleId`,`m`.`UserId` AS `UserId`,`m`.`ActENUM` AS `ActENUM`,`m`.`ScenarioId` AS `ScenarioId`,`m`.`ConfigBaseId` AS `ConfigBaseId`,`m`.`Value` AS `Value`,`m`.`IsOverridable` AS `IsOverridable`,`m`.`Signature` AS `Signature`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h0e`.`Title` AS `ScenarioTitle`,`h2`.`Code` AS `ConfigBaseCode`,`h3`.`Firstname_fsx` AS `Firstname_fsx`,`h3`.`Lastname_fsx` AS `Lastname_fsx`,`h3`.`Username` AS `Username`,`h3`.`Email_fsx` AS `Email_fsx`,`h3`.`CellPhone_fsx` AS `CellPhone_fsx` from ((((`H_CFG_ActorConfigs` `m` left join `H_AAA_EntityScenarios` `h0` on((`h0`.`Id` = `m`.`ScenarioId`))) left join `H_AAA_Synced_EntityProfile` `h0e` on((`h0e`.`Id` = `h0`.`EntityId`))) left join `H_CFG_ActionConfigBases` `h2` on((`h2`.`Id` = `m`.`ConfigBaseId`))) left join `H_AAA_Synced_UserInfo` `h3` on((`h3`.`Id` = `m`.`UserId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_AppClientListSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_AppClientListSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_AppClientListSummary` AS select `m`.`Id` AS `Id`,`m`.`Title` AS `Title`,`m`.`ClientId` AS `ClientId`,`m`.`AppTypeId` AS `AppTypeId`,`m`.`IsInactive` AS `IsInactive`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h0`.`Title` AS `AppTypeTitle` from (`H_AAA_AppClients` `m` left join `H_AAA_AppTypes` `h0` on((`h0`.`Id` = `m`.`AppTypeId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_AppClientProfile`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_AppClientProfile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_AppClientProfile` AS select `m`.`Id` AS `Id`,`m`.`Title` AS `Title`,`m`.`ClientId` AS `ClientId`,`m`.`AppTypeId` AS `AppTypeId`,`m`.`IsInactive` AS `IsInactive`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h0`.`Title` AS `AppTypeTitle` from (`H_AAA_AppClients` `m` left join `H_AAA_AppTypes` `h0` on((`h0`.`Id` = `m`.`AppTypeId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_AppTypeListSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_AppTypeListSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_AppTypeListSummary` AS select `m`.`Id` AS `Id`,`m`.`Code` AS `Code`,`m`.`Title` AS `Title`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,(select count(0) from `H_AAA_AppTypePermissions` `cc` where ((`cc`.`AppTypeId` = `m`.`Id`) and (`cc`.`RecordDeleted` is null))) AS `PermissionsCount` from `H_AAA_AppTypes` `m` where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_AppTypePermissions`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_AppTypePermissions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_AppTypePermissions` AS select `j`.`Id` AS `Id`,`j`.`AppTypeId` AS `AppTypeId`,`j`.`AppPermissionId` AS `AppPermissionId`,`j`.`Signature` AS `Signature`,`j`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`j`.`CreatedBy` AS `CreatedBy`,`j`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`j`.`ModifiedBy` AS `ModifiedBy`,`j`.`RecordDeleted` AS `RecordDeleted`,`h0`.`Title` AS `AppTypeTitle`,`h1`.`Title` AS `AppPermissionTitle` from ((`H_AAA_AppTypePermissions` `j` left join `H_AAA_AppTypes` `h0` on((`h0`.`Id` = `j`.`AppTypeId`))) left join `H_AAA_AppPermissions` `h1` on((`h1`.`Id` = `j`.`AppPermissionId`))) where (`j`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_BatchListSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_BatchListSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_BatchListSummary` AS select `m`.`Id` AS `Id`,`m`.`FMS_OId` AS `FMS_OId`,`m`.`DistributorId` AS `DistributorId`,`m`.`TotalFareAtDispatch` AS `TotalFareAtDispatch`,`m`.`FarePortionAmount_CVO` AS `FarePortionAmount_CVO`,`m`.`FarePortionAmount_Distributor` AS `FarePortionAmount_Distributor`,`m`.`FarePortionAmount_Driver` AS `FarePortionAmount_Driver`,`m`.`AllowedDiscountPercent` AS `AllowedDiscountPercent`,`m`.`IsEditable` AS `IsEditable`,`m`.`IsChargePerItem` AS `IsChargePerItem`,`m`.`RecordKey` AS `RecordKey`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h0e`.`Title` AS `DistributorTitle`,(select count(0) from `H_TransportBatchItems` `cc` where ((`cc`.`BatchId` = `m`.`Id`) and (`cc`.`RecordDeleted` is null))) AS `ItemsCount` from ((`H_TransportBatches` `m` left join `H_Synced_Distributors` `h0` on((`h0`.`Id` = `m`.`DistributorId`))) left join `H_AAA_Synced_EntityProfile` `h0e` on((`h0e`.`Id` = `h0`.`EntityId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_BatchProfile`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_BatchProfile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_BatchProfile` AS select `m`.`Id` AS `Id`,`m`.`FMS_OId` AS `FMS_OId`,`m`.`DistributorId` AS `DistributorId`,`m`.`TotalFareAtDispatch` AS `TotalFareAtDispatch`,`m`.`FarePortionAmount_CVO` AS `FarePortionAmount_CVO`,`m`.`FarePortionAmount_Distributor` AS `FarePortionAmount_Distributor`,`m`.`FarePortionAmount_Driver` AS `FarePortionAmount_Driver`,`m`.`AllowedDiscountPercent` AS `AllowedDiscountPercent`,`m`.`IsEditable` AS `IsEditable`,`m`.`IsChargePerItem` AS `IsChargePerItem`,`m`.`RecordKey` AS `RecordKey`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h0e`.`Title` AS `DistributorTitle` from ((`H_TransportBatches` `m` left join `H_Synced_Distributors` `h0` on((`h0`.`Id` = `m`.`DistributorId`))) left join `H_AAA_Synced_EntityProfile` `h0e` on((`h0e`.`Id` = `h0`.`EntityId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_ContactLocationListSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_ContactLocationListSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_ContactLocationListSummary` AS select `m`.`Id` AS `Id`,`m`.`ContactId` AS `ContactId`,`m`.`FavAdrLabel` AS `FavAdrLabel`,`m`.`LocationId` AS `LocationId`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h0`.`Title` AS `LocationTitle`,`h1e`.`Title` AS `ContactTitle` from (((`H_TransportContactLocations` `m` left join `H_TransportLocations` `h0` on((`h0`.`Id` = `m`.`LocationId`))) left join `H_TransportContactRegistry` `h1` on((`h1`.`Id` = `m`.`ContactId`))) left join `H_AAA_Synced_EntityProfile` `h1e` on((`h1e`.`Id` = `h1`.`PossibleEntityId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_ContactLocationProfile`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_ContactLocationProfile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_ContactLocationProfile` AS select `m`.`Id` AS `Id`,`m`.`ContactId` AS `ContactId`,`m`.`FavAdrLabel` AS `FavAdrLabel`,`m`.`LocationId` AS `LocationId`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h0`.`Title` AS `LocationTitle`,`h1e`.`Title` AS `ContactTitle` from (((`H_TransportContactLocations` `m` left join `H_TransportLocations` `h0` on((`h0`.`Id` = `m`.`LocationId`))) left join `H_TransportContactRegistry` `h1` on((`h1`.`Id` = `m`.`ContactId`))) left join `H_AAA_Synced_EntityProfile` `h1e` on((`h1e`.`Id` = `h1`.`PossibleEntityId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_CustomerContact`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_CustomerContact`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_CustomerContact` AS select `j`.`Id` AS `Id`,`j`.`PossibleUserId` AS `PossibleUserId`,`j`.`Firstname_fsx` AS `Firstname_fsx`,`j`.`Lastname_fsx` AS `Lastname_fsx`,`j`.`PossibleEntityId` AS `PossibleEntityId`,`j`.`Title` AS `Title`,`j`.`MainLocationId` AS `MainLocationId`,`j`.`Buzzer` AS `Buzzer`,`j`.`Language` AS `Language`,`j`.`TimeZone` AS `TimeZone`,`j`.`Currency` AS `Currency`,`j`.`SignatureUri` AS `SignatureUri`,`j`.`PhotoUri` AS `PhotoUri`,`j`.`BirthDate_fsx` AS `BirthDate_fsx`,`j`.`Notification_SMS_fsx` AS `Notification_SMS_fsx`,`j`.`Notification_Phone_fsx` AS `Notification_Phone_fsx`,`j`.`Notification_Phone_Extention_fsx` AS `Notification_Phone_Extention_fsx`,`j`.`Notification_Email_fsx` AS `Notification_Email_fsx`,`j`.`Notification_WhatsApp_fsx` AS `Notification_WhatsApp_fsx`,`j`.`RecordKey` AS `RecordKey`,`j`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`j`.`CreatedBy` AS `CreatedBy`,`j`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`j`.`ModifiedBy` AS `ModifiedBy`,`j`.`RecordDeleted` AS `RecordDeleted`,`h0`.`Firstname_fsx` AS `PossibleUserFirstname_fsx`,`h0`.`Lastname_fsx` AS `PossibleUserLastname_fsx`,`h0`.`Username` AS `Username`,`h0`.`Email_fsx` AS `Email_fsx`,`h0`.`CellPhone_fsx` AS `CellPhone_fsx`,`h1`.`Title` AS `PossibleEntityTitle`,`h2`.`Title` AS `MainLocationTitle` from (((`H_TransportContactRegistry` `j` left join `H_AAA_Synced_UserInfo` `h0` on((`h0`.`Id` = `j`.`PossibleUserId`))) left join `H_AAA_Synced_EntityProfile` `h1` on((`h1`.`Id` = `j`.`PossibleEntityId`))) left join `H_TransportLocations` `h2` on((`h2`.`Id` = `j`.`MainLocationId`))) where (`j`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_CustomerContacts`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_CustomerContacts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_CustomerContacts` AS select `j`.`Id` AS `Id`,`j`.`ContactId` AS `ContactId`,`j`.`CustomerId` AS `CustomerId`,`j`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`j`.`CreatedBy` AS `CreatedBy`,`j`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`j`.`ModifiedBy` AS `ModifiedBy`,`j`.`RecordDeleted` AS `RecordDeleted`,`h0e`.`Title` AS `ContactTitle`,`h1e`.`Title` AS `CustomerTitle` from ((((`H_TransportCustomerContacts` `j` left join `H_TransportContactRegistry` `h0` on((`h0`.`Id` = `j`.`ContactId`))) left join `H_AAA_Synced_EntityProfile` `h0e` on((`h0e`.`Id` = `h0`.`PossibleEntityId`))) left join `H_TransportCustomers` `h1` on((`h1`.`Id` = `j`.`CustomerId`))) left join `H_AAA_Synced_EntityProfile` `h1e` on((`h1e`.`Id` = `h1`.`EntityId`))) where (`j`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_CustomerDistributorCustomers`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_CustomerDistributorCustomers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_CustomerDistributorCustomers` AS select `j`.`Id` AS `Id`,`j`.`DistributorId` AS `DistributorId`,`j`.`CustomerId` AS `CustomerId`,`j`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`j`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`j`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`j`.`CreatedBy` AS `CreatedBy`,`j`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`j`.`ModifiedBy` AS `ModifiedBy`,`j`.`RecordDeleted` AS `RecordDeleted`,`h0e`.`Title` AS `CustomerTitle`,`h1e`.`Title` AS `DistributorTitle` from ((((`H_TransportDistributorCustomers` `j` left join `H_TransportCustomers` `h0` on((`h0`.`Id` = `j`.`CustomerId`))) left join `H_AAA_Synced_EntityProfile` `h0e` on((`h0e`.`Id` = `h0`.`EntityId`))) left join `H_Synced_Distributors` `h1` on((`h1`.`Id` = `j`.`DistributorId`))) left join `H_AAA_Synced_EntityProfile` `h1e` on((`h1e`.`Id` = `h1`.`EntityId`))) where (`j`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_CustomerListSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_CustomerListSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_CustomerListSummary` AS select `m`.`Id` AS `Id`,`m`.`EntityId` AS `EntityId`,`m`.`UserId` AS `UserId`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h0`.`Firstname_fsx` AS `Firstname_fsx`,`h0`.`Lastname_fsx` AS `Lastname_fsx`,`h0`.`Username` AS `Username`,`h0`.`Email_fsx` AS `Email_fsx`,`h0`.`CellPhone_fsx` AS `CellPhone_fsx`,`h1`.`Title` AS `EntityTitle`,(select count(0) from `H_TransportCustomerContacts` `cc` where ((`cc`.`CustomerId` = `m`.`Id`) and (`cc`.`RecordDeleted` is null))) AS `ContactsCount`,(select count(0) from `H_TransportCustomerMasterGoods` `cc` where ((`cc`.`CustomerId` = `m`.`Id`) and (`cc`.`RecordDeleted` is null))) AS `MasterGoodsCount`,(select count(0) from `H_TransportDistributorCustomers` `cc` where ((`cc`.`CustomerId` = `m`.`Id`) and (`cc`.`RecordDeleted` is null))) AS `DistributorCustomersCount` from ((`H_TransportCustomers` `m` left join `H_AAA_Synced_UserInfo` `h0` on((`h0`.`Id` = `m`.`UserId`))) left join `H_AAA_Synced_EntityProfile` `h1` on((`h1`.`Id` = `m`.`EntityId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_CustomerMasterGoods`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_CustomerMasterGoods`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_CustomerMasterGoods` AS select `j`.`Id` AS `Id`,`j`.`Code` AS `Code`,`j`.`Title` AS `Title`,`j`.`Description` AS `Description`,`j`.`CustomerId` AS `CustomerId`,`j`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`j`.`CreatedBy` AS `CreatedBy`,`j`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`j`.`ModifiedBy` AS `ModifiedBy`,`j`.`RecordDeleted` AS `RecordDeleted`,`h0e`.`Title` AS `CustomerTitle` from ((`H_TransportCustomerMasterGoods` `j` left join `H_TransportCustomers` `h0` on((`h0`.`Id` = `j`.`CustomerId`))) left join `H_AAA_Synced_EntityProfile` `h0e` on((`h0e`.`Id` = `h0`.`EntityId`))) where (`j`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_CustomerProfile`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_CustomerProfile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_CustomerProfile` AS select `m`.`Id` AS `Id`,`m`.`EntityId` AS `EntityId`,`m`.`UserId` AS `UserId`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h0`.`Firstname_fsx` AS `Firstname_fsx`,`h0`.`Lastname_fsx` AS `Lastname_fsx`,`h0`.`Username` AS `Username`,`h0`.`Email_fsx` AS `Email_fsx`,`h0`.`CellPhone_fsx` AS `CellPhone_fsx`,`h1`.`Title` AS `EntityTitle` from ((`H_TransportCustomers` `m` left join `H_AAA_Synced_UserInfo` `h0` on((`h0`.`Id` = `m`.`UserId`))) left join `H_AAA_Synced_EntityProfile` `h1` on((`h1`.`Id` = `m`.`EntityId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_DeliveryListSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DeliveryListSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_DeliveryListSummary` AS select `m`.`Id` AS `Id`,`m`.`IsEditable` AS `IsEditable`,`m`.`CustomerId` AS `CustomerId`,`m`.`DistributorId` AS `DistributorId`,`m`.`CVOId` AS `CVOId`,`m`.`FromContactLocationId` AS `FromContactLocationId`,`m`.`ToContactLocationId` AS `ToContactLocationId`,`m`.`PickupAfterDateTime` AS `PickupAfterDateTime`,`m`.`PickupAfterDateTime_UTC` AS `PickupAfterDateTime_UTC`,`m`.`PickupBeforeDateTime` AS `PickupBeforeDateTime`,`m`.`PickupBeforeDateTime_UTC` AS `PickupBeforeDateTime_UTC`,`m`.`DropOffAfterDateTime` AS `DropOffAfterDateTime`,`m`.`DropOffAfterDateTime_UTC` AS `DropOffAfterDateTime_UTC`,`m`.`DropOffBeforeDateTime` AS `DropOffBeforeDateTime`,`m`.`DropOffBeforeDateTime_UTC` AS `DropOffBeforeDateTime_UTC`,`m`.`VehicleType` AS `VehicleType`,`m`.`VehicleProfileSubType` AS `VehicleProfileSubType`,`m`.`ServiceClass` AS `ServiceClass`,`m`.`ActionOnAbsentReceiver` AS `ActionOnAbsentReceiver`,`m`.`Comments` AS `Comments`,`m`.`FareAtSubmission` AS `FareAtSubmission`,`m`.`PromoCode` AS `PromoCode`,`m`.`PaymentCategory` AS `PaymentCategory`,`m`.`PaymentMethod` AS `PaymentMethod`,`m`.`PaidAt_UTC` AS `PaidAt_UTC`,`m`.`Status` AS `Status`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h0e`.`Title` AS `DistributorTitle`,`h2e`.`Title` AS `CVOTitle`,`h4e`.`Title` AS `CustomerTitle`,(select count(0) from `H_TransportBatchItems` `cc` where ((`cc`.`TransportReqDeliveryId` = `m`.`Id`) and (`cc`.`RecordDeleted` is null))) AS `BatchItemsCount`,(select count(0) from `H_TransportReqDeliveryAddons` `cc` where ((`cc`.`TransportReqDeliveryId` = `m`.`Id`) and (`cc`.`RecordDeleted` is null))) AS `ReqDeliveryAddonsCount`,(select count(0) from `H_TransportReqDeliveryGoods` `cc` where ((`cc`.`ReqDeliveryId` = `m`.`Id`) and (`cc`.`RecordDeleted` is null))) AS `ReqDeliveryGoodsCount` from ((((((`H_TransportReqDeliveries` `m` left join `H_Synced_Distributors` `h0` on((`h0`.`Id` = `m`.`DistributorId`))) left join `H_AAA_Synced_EntityProfile` `h0e` on((`h0e`.`Id` = `h0`.`EntityId`))) left join `H_Synced_CVOs` `h2` on((`h2`.`Id` = `m`.`CVOId`))) left join `H_AAA_Synced_EntityProfile` `h2e` on((`h2e`.`Id` = `h2`.`EntityId`))) left join `H_TransportCustomers` `h4` on((`h4`.`Id` = `m`.`CustomerId`))) left join `H_AAA_Synced_EntityProfile` `h4e` on((`h4e`.`Id` = `h4`.`EntityId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_DeliveryProfile`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DeliveryProfile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_DeliveryProfile` AS select `m`.`Id` AS `Id`,`m`.`IsEditable` AS `IsEditable`,`m`.`CustomerId` AS `CustomerId`,`m`.`DistributorId` AS `DistributorId`,`m`.`CVOId` AS `CVOId`,`m`.`FromContactLocationId` AS `FromContactLocationId`,`m`.`ToContactLocationId` AS `ToContactLocationId`,`m`.`PickupAfterDateTime` AS `PickupAfterDateTime`,`m`.`PickupAfterDateTime_UTC` AS `PickupAfterDateTime_UTC`,`m`.`PickupBeforeDateTime` AS `PickupBeforeDateTime`,`m`.`PickupBeforeDateTime_UTC` AS `PickupBeforeDateTime_UTC`,`m`.`DropOffAfterDateTime` AS `DropOffAfterDateTime`,`m`.`DropOffAfterDateTime_UTC` AS `DropOffAfterDateTime_UTC`,`m`.`DropOffBeforeDateTime` AS `DropOffBeforeDateTime`,`m`.`DropOffBeforeDateTime_UTC` AS `DropOffBeforeDateTime_UTC`,`m`.`VehicleType` AS `VehicleType`,`m`.`VehicleProfileSubType` AS `VehicleProfileSubType`,`m`.`ServiceClass` AS `ServiceClass`,`m`.`ActionOnAbsentReceiver` AS `ActionOnAbsentReceiver`,`m`.`Comments` AS `Comments`,`m`.`FareAtSubmission` AS `FareAtSubmission`,`m`.`PromoCode` AS `PromoCode`,`m`.`PaymentCategory` AS `PaymentCategory`,`m`.`PaymentMethod` AS `PaymentMethod`,`m`.`PaidAt_UTC` AS `PaidAt_UTC`,`m`.`Status` AS `Status`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h0e`.`Title` AS `DistributorTitle`,`h2e`.`Title` AS `CVOTitle`,`h4e`.`Title` AS `CustomerTitle` from ((((((`H_TransportReqDeliveries` `m` left join `H_Synced_Distributors` `h0` on((`h0`.`Id` = `m`.`DistributorId`))) left join `H_AAA_Synced_EntityProfile` `h0e` on((`h0e`.`Id` = `h0`.`EntityId`))) left join `H_Synced_CVOs` `h2` on((`h2`.`Id` = `m`.`CVOId`))) left join `H_AAA_Synced_EntityProfile` `h2e` on((`h2e`.`Id` = `h2`.`EntityId`))) left join `H_TransportCustomers` `h4` on((`h4`.`Id` = `m`.`CustomerId`))) left join `H_AAA_Synced_EntityProfile` `h4e` on((`h4e`.`Id` = `h4`.`EntityId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_DeliveryReqDeliveryGoods`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DeliveryReqDeliveryGoods`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_DeliveryReqDeliveryGoods` AS select `j`.`Id` AS `Id`,`j`.`ReqDeliveryId` AS `ReqDeliveryId`,`j`.`CustomerGoodId` AS `CustomerGoodId`,`j`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`j`.`CreatedBy` AS `CreatedBy`,`j`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`j`.`ModifiedBy` AS `ModifiedBy`,`j`.`RecordDeleted` AS `RecordDeleted`,`h1`.`Title` AS `CustomerGoodTitle` from (`H_TransportReqDeliveryGoods` `j` left join `H_TransportCustomerMasterGoods` `h1` on((`h1`.`Id` = `j`.`CustomerGoodId`))) where (`j`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_DispatchListSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DispatchListSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_DispatchListSummary` AS select `m`.`Id` AS `Id`,`m`.`FMS_OvId` AS `FMS_OvId`,`m`.`BatchId` AS `BatchId`,`m`.`PickupZoneId` AS `PickupZoneId`,`m`.`CVOId` AS `CVOId`,`m`.`VehicleId` AS `VehicleId`,`m`.`DriverId` AS `DriverId`,`m`.`CurrentStatus` AS `CurrentStatus`,`m`.`OfferType` AS `OfferType`,`m`.`PaidTripFare` AS `PaidTripFare`,`m`.`PaidAddonFee` AS `PaidAddonFee`,`m`.`AppliedDiscount` AS `AppliedDiscount`,`m`.`PaidTip` AS `PaidTip`,`m`.`PaidToll` AS `PaidToll`,`m`.`ActualTotalFareAtTripEnd` AS `ActualTotalFareAtTripEnd`,`m`.`DriverAgreedFareAmount` AS `DriverAgreedFareAmount`,`m`.`EnforceItemsCreationSequense` AS `EnforceItemsCreationSequense`,`m`.`PaymentTransactionNumber` AS `PaymentTransactionNumber`,`m`.`ExtraData` AS `ExtraData`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h3e`.`Title` AS `CVOTitle`,`h4`.`Title` AS `PickupZoneTitle`,(select count(0) from `H_TransportTransactItems` `cc` where (`cc`.`TransportTransactId` = `m`.`Id`)) AS `TransactItemsCount`,(select count(0) from `H_TransportTransactStages` `cc` where (`cc`.`TransportTransactId` = `m`.`Id`)) AS `TransactStagesCount` from (((`H_TransportTransacts` `m` left join `H_Synced_CVOs` `h3` on((`h3`.`Id` = `m`.`CVOId`))) left join `H_AAA_Synced_EntityProfile` `h3e` on((`h3e`.`Id` = `h3`.`EntityId`))) left join `_ZoneBases` `h4` on((`h4`.`Id` = `m`.`PickupZoneId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_DispatchProfile`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DispatchProfile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_DispatchProfile` AS select `m`.`Id` AS `Id`,`m`.`FMS_OvId` AS `FMS_OvId`,`m`.`BatchId` AS `BatchId`,`m`.`PickupZoneId` AS `PickupZoneId`,`m`.`CVOId` AS `CVOId`,`m`.`VehicleId` AS `VehicleId`,`m`.`DriverId` AS `DriverId`,`m`.`CurrentStatus` AS `CurrentStatus`,`m`.`OfferType` AS `OfferType`,`m`.`PaidTripFare` AS `PaidTripFare`,`m`.`PaidAddonFee` AS `PaidAddonFee`,`m`.`AppliedDiscount` AS `AppliedDiscount`,`m`.`PaidTip` AS `PaidTip`,`m`.`PaidToll` AS `PaidToll`,`m`.`ActualTotalFareAtTripEnd` AS `ActualTotalFareAtTripEnd`,`m`.`DriverAgreedFareAmount` AS `DriverAgreedFareAmount`,`m`.`EnforceItemsCreationSequense` AS `EnforceItemsCreationSequense`,`m`.`PaymentTransactionNumber` AS `PaymentTransactionNumber`,`m`.`ExtraData` AS `ExtraData`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h3e`.`Title` AS `CVOTitle`,`h4`.`Title` AS `PickupZoneTitle` from (((`H_TransportTransacts` `m` left join `H_Synced_CVOs` `h3` on((`h3`.`Id` = `m`.`CVOId`))) left join `H_AAA_Synced_EntityProfile` `h3e` on((`h3e`.`Id` = `h3`.`EntityId`))) left join `_ZoneBases` `h4` on((`h4`.`Id` = `m`.`PickupZoneId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_DistributorCustomers`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DistributorCustomers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_DistributorCustomers` AS select `j`.`Id` AS `Id`,`j`.`DistributorId` AS `DistributorId`,`j`.`CustomerId` AS `CustomerId`,`j`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`j`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`j`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`j`.`CreatedBy` AS `CreatedBy`,`j`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`j`.`ModifiedBy` AS `ModifiedBy`,`j`.`RecordDeleted` AS `RecordDeleted`,`h0e`.`Title` AS `CustomerTitle`,`h1e`.`Title` AS `DistributorTitle` from ((((`H_TransportDistributorCustomers` `j` left join `H_TransportCustomers` `h0` on((`h0`.`Id` = `j`.`CustomerId`))) left join `H_AAA_Synced_EntityProfile` `h0e` on((`h0e`.`Id` = `h0`.`EntityId`))) left join `H_Synced_Distributors` `h1` on((`h1`.`Id` = `j`.`DistributorId`))) left join `H_AAA_Synced_EntityProfile` `h1e` on((`h1e`.`Id` = `h1`.`EntityId`))) where (`j`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_FareBaseInclutionListSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_FareBaseInclutionListSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_FareBaseInclutionListSummary` AS select `m`.`Id` AS `Id`,`m`.`DistributorId` AS `DistributorId`,`m`.`CVOId` AS `CVOId`,`m`.`TransportCategory` AS `TransportCategory`,`m`.`ServiceCategory` AS `ServiceCategory`,`m`.`VehicleType` AS `VehicleType`,`m`.`ServiceClass` AS `ServiceClass`,`m`.`IncludedSeatCounts` AS `IncludedSeatCounts`,`m`.`IncludedLuggageCounts` AS `IncludedLuggageCounts`,`m`.`IncludedParcelCounts` AS `IncludedParcelCounts`,`m`.`IncludedWeightKg` AS `IncludedWeightKg`,`m`.`IncludedVolumeCubicM` AS `IncludedVolumeCubicM`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h0e`.`Title` AS `CVOTitle`,`h1e`.`Title` AS `DistributorTitle` from ((((`H_TransportFareBaseInclutions` `m` left join `H_Synced_CVOs` `h0` on((`h0`.`Id` = `m`.`CVOId`))) left join `H_AAA_Synced_EntityProfile` `h0e` on((`h0e`.`Id` = `h0`.`EntityId`))) left join `H_Synced_Distributors` `h1` on((`h1`.`Id` = `m`.`DistributorId`))) left join `H_AAA_Synced_EntityProfile` `h1e` on((`h1e`.`Id` = `h1`.`EntityId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_FareBaseInclutionProfile`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_FareBaseInclutionProfile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_FareBaseInclutionProfile` AS select `m`.`Id` AS `Id`,`m`.`DistributorId` AS `DistributorId`,`m`.`CVOId` AS `CVOId`,`m`.`TransportCategory` AS `TransportCategory`,`m`.`ServiceCategory` AS `ServiceCategory`,`m`.`VehicleType` AS `VehicleType`,`m`.`ServiceClass` AS `ServiceClass`,`m`.`IncludedSeatCounts` AS `IncludedSeatCounts`,`m`.`IncludedLuggageCounts` AS `IncludedLuggageCounts`,`m`.`IncludedParcelCounts` AS `IncludedParcelCounts`,`m`.`IncludedWeightKg` AS `IncludedWeightKg`,`m`.`IncludedVolumeCubicM` AS `IncludedVolumeCubicM`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h0e`.`Title` AS `CVOTitle`,`h1e`.`Title` AS `DistributorTitle` from ((((`H_TransportFareBaseInclutions` `m` left join `H_Synced_CVOs` `h0` on((`h0`.`Id` = `m`.`CVOId`))) left join `H_AAA_Synced_EntityProfile` `h0e` on((`h0e`.`Id` = `h0`.`EntityId`))) left join `H_Synced_Distributors` `h1` on((`h1`.`Id` = `m`.`DistributorId`))) left join `H_AAA_Synced_EntityProfile` `h1e` on((`h1e`.`Id` = `h1`.`EntityId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_FareByGeoFenceListSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_FareByGeoFenceListSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_FareByGeoFenceListSummary` AS select `m`.`Id` AS `Id`,`m`.`TransportFareCalculationId` AS `TransportFareCalculationId`,`m`.`SourceGeoFenceBaseId` AS `SourceGeoFenceBaseId`,`m`.`DestinationGeoFenceBaseId` AS `DestinationGeoFenceBaseId`,`m`.`BaseFare` AS `BaseFare`,`h1`.`Title` AS `DestinationGeoFenceBaseTitle`,`h2`.`Title` AS `SourceGeoFenceBaseTitle` from ((`H_TransportFareByGeoFence` `m` left join `H_TransportGeoFenceBases` `h1` on((`h1`.`Id` = `m`.`DestinationGeoFenceBaseId`))) left join `H_TransportGeoFenceBases` `h2` on((`h2`.`Id` = `m`.`SourceGeoFenceBaseId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_FareByGeoFenceProfile`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_FareByGeoFenceProfile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_FareByGeoFenceProfile` AS select `m`.`Id` AS `Id`,`m`.`TransportFareCalculationId` AS `TransportFareCalculationId`,`m`.`SourceGeoFenceBaseId` AS `SourceGeoFenceBaseId`,`m`.`DestinationGeoFenceBaseId` AS `DestinationGeoFenceBaseId`,`m`.`BaseFare` AS `BaseFare`,`h1`.`Title` AS `DestinationGeoFenceBaseTitle`,`h2`.`Title` AS `SourceGeoFenceBaseTitle` from ((`H_TransportFareByGeoFence` `m` left join `H_TransportGeoFenceBases` `h1` on((`h1`.`Id` = `m`.`DestinationGeoFenceBaseId`))) left join `H_TransportGeoFenceBases` `h2` on((`h2`.`Id` = `m`.`SourceGeoFenceBaseId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_FareByZoneListSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_FareByZoneListSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_FareByZoneListSummary` AS select `m`.`Id` AS `Id`,`m`.`TransportFareCalculationId` AS `TransportFareCalculationId`,`m`.`SourceGeoFenceBaseId` AS `SourceGeoFenceBaseId`,`m`.`DestinationGeoFenceBaseId` AS `DestinationGeoFenceBaseId`,`m`.`BaseFare` AS `BaseFare`,`h0`.`Title` AS `DestinationGeoFenceBaseTitle`,`h1`.`Title` AS `SourceGeoFenceBaseTitle` from ((`H_TransportFareByZone` `m` left join `H_TransportGeoFenceBases` `h0` on((`h0`.`Id` = `m`.`DestinationGeoFenceBaseId`))) left join `H_TransportGeoFenceBases` `h1` on((`h1`.`Id` = `m`.`SourceGeoFenceBaseId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_FareByZoneProfile`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_FareByZoneProfile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_FareByZoneProfile` AS select `m`.`Id` AS `Id`,`m`.`TransportFareCalculationId` AS `TransportFareCalculationId`,`m`.`SourceGeoFenceBaseId` AS `SourceGeoFenceBaseId`,`m`.`DestinationGeoFenceBaseId` AS `DestinationGeoFenceBaseId`,`m`.`BaseFare` AS `BaseFare`,`h0`.`Title` AS `DestinationGeoFenceBaseTitle`,`h1`.`Title` AS `SourceGeoFenceBaseTitle` from ((`H_TransportFareByZone` `m` left join `H_TransportGeoFenceBases` `h0` on((`h0`.`Id` = `m`.`DestinationGeoFenceBaseId`))) left join `H_TransportGeoFenceBases` `h1` on((`h1`.`Id` = `m`.`SourceGeoFenceBaseId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_FareCalculationListSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_FareCalculationListSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_FareCalculationListSummary` AS select `m`.`Id` AS `Id`,`m`.`DistributorId` AS `DistributorId`,`m`.`CVOId` AS `CVOId`,`m`.`TransportCategory` AS `TransportCategory`,`m`.`ServiceCategory` AS `ServiceCategory`,`m`.`VehicleType` AS `VehicleType`,`m`.`ServiceClass` AS `ServiceClass`,`m`.`CalculationItem` AS `CalculationItem`,`m`.`CalculationType` AS `CalculationType`,`m`.`CalculateMethod` AS `CalculateMethod`,`m`.`CalculationPriority` AS `CalculationPriority`,`m`.`CalculationUnit` AS `CalculationUnit`,`m`.`UnitAmount` AS `UnitAmount`,`m`.`Price` AS `Price`,`m`.`PriceTable` AS `PriceTable`,`m`.`RecordKey` AS `RecordKey`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h0e`.`Title` AS `DistributorTitle`,`h1e`.`Title` AS `CVOTitle` from ((((`H_TransportFareCalculations` `m` left join `H_Synced_Distributors` `h0` on((`h0`.`Id` = `m`.`DistributorId`))) left join `H_AAA_Synced_EntityProfile` `h0e` on((`h0e`.`Id` = `h0`.`EntityId`))) left join `H_Synced_CVOs` `h1` on((`h1`.`Id` = `m`.`CVOId`))) left join `H_AAA_Synced_EntityProfile` `h1e` on((`h1e`.`Id` = `h1`.`EntityId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_FareCalculationProfile`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_FareCalculationProfile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_FareCalculationProfile` AS select `m`.`Id` AS `Id`,`m`.`DistributorId` AS `DistributorId`,`m`.`CVOId` AS `CVOId`,`m`.`TransportCategory` AS `TransportCategory`,`m`.`ServiceCategory` AS `ServiceCategory`,`m`.`VehicleType` AS `VehicleType`,`m`.`ServiceClass` AS `ServiceClass`,`m`.`CalculationItem` AS `CalculationItem`,`m`.`CalculationType` AS `CalculationType`,`m`.`CalculateMethod` AS `CalculateMethod`,`m`.`CalculationPriority` AS `CalculationPriority`,`m`.`CalculationUnit` AS `CalculationUnit`,`m`.`UnitAmount` AS `UnitAmount`,`m`.`Price` AS `Price`,`m`.`PriceTable` AS `PriceTable`,`m`.`RecordKey` AS `RecordKey`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h0e`.`Title` AS `DistributorTitle`,`h1e`.`Title` AS `CVOTitle` from ((((`H_TransportFareCalculations` `m` left join `H_Synced_Distributors` `h0` on((`h0`.`Id` = `m`.`DistributorId`))) left join `H_AAA_Synced_EntityProfile` `h0e` on((`h0e`.`Id` = `h0`.`EntityId`))) left join `H_Synced_CVOs` `h1` on((`h1`.`Id` = `m`.`CVOId`))) left join `H_AAA_Synced_EntityProfile` `h1e` on((`h1e`.`Id` = `h1`.`EntityId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_GlobalConfigListSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_GlobalConfigListSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_GlobalConfigListSummary` AS select `m`.`Id` AS `Id`,`m`.`ConfigBaseId` AS `ConfigBaseId`,`m`.`Value` AS `Value`,`m`.`IsOverridable` AS `IsOverridable`,`m`.`Signature` AS `Signature`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h0`.`Code` AS `ConfigBaseCode` from (`H_CFG_GlobalConfigs` `m` left join `H_CFG_ActionConfigBases` `h0` on((`h0`.`Id` = `m`.`ConfigBaseId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_GlobalConfigProfile`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_GlobalConfigProfile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_GlobalConfigProfile` AS select `m`.`Id` AS `Id`,`m`.`ConfigBaseId` AS `ConfigBaseId`,`m`.`Value` AS `Value`,`m`.`IsOverridable` AS `IsOverridable`,`m`.`Signature` AS `Signature`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h0`.`Code` AS `ConfigBaseCode` from (`H_CFG_GlobalConfigs` `m` left join `H_CFG_ActionConfigBases` `h0` on((`h0`.`Id` = `m`.`ConfigBaseId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_RideListSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_RideListSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_RideListSummary` AS select `m`.`Id` AS `Id`,`m`.`IsEditable` AS `IsEditable`,`m`.`CustomerId` AS `CustomerId`,`m`.`DistributorId` AS `DistributorId`,`m`.`CVOId` AS `CVOId`,`m`.`FromContactLocationId` AS `FromContactLocationId`,`m`.`ToContactLocationId` AS `ToContactLocationId`,`m`.`PickupAfterDateTime` AS `PickupAfterDateTime`,`m`.`PickupAfterDateTime_UTC` AS `PickupAfterDateTime_UTC`,`m`.`PickupBeforeDateTime` AS `PickupBeforeDateTime`,`m`.`PickupBeforeDateTime_UTC` AS `PickupBeforeDateTime_UTC`,`m`.`DropOffAfterDateTime` AS `DropOffAfterDateTime`,`m`.`DropOffAfterDateTime_UTC` AS `DropOffAfterDateTime_UTC`,`m`.`DropOffBeforeDateTime` AS `DropOffBeforeDateTime`,`m`.`DropOffBeforeDateTime_UTC` AS `DropOffBeforeDateTime_UTC`,`m`.`VehicleType` AS `VehicleType`,`m`.`VehicleProfileSubType` AS `VehicleProfileSubType`,`m`.`ServiceClass` AS `ServiceClass`,`m`.`ServiceCategory` AS `ServiceCategory`,`m`.`TotalRequiredSeats` AS `TotalRequiredSeats`,`m`.`NumberOfLuggages` AS `NumberOfLuggages`,`m`.`FeaturesJSON` AS `FeaturesJSON`,`m`.`Comments` AS `Comments`,`m`.`FareAtSubmission` AS `FareAtSubmission`,`m`.`PromoCode` AS `PromoCode`,`m`.`PaymentCategory` AS `PaymentCategory`,`m`.`PaymentMethod` AS `PaymentMethod`,`m`.`PaidAt_UTC` AS `PaidAt_UTC`,`m`.`HubCarrierInfo` AS `HubCarrierInfo`,`m`.`Status` AS `Status`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h1e`.`Title` AS `CVOTitle`,`h2e`.`Title` AS `CustomerTitle`,`h3e`.`Title` AS `DistributorTitle`,(select count(0) from `H_TransportBatchItems` `cc` where ((`cc`.`TransportReqRideId` = `m`.`Id`) and (`cc`.`RecordDeleted` is null))) AS `BatchItemsCount`,(select count(0) from `H_TransportReqRideAddons` `cc` where ((`cc`.`TransportReqRideId` = `m`.`Id`) and (`cc`.`RecordDeleted` is null))) AS `ReqRideAddonsCount`,(select count(0) from `H_TransportReqRidePassengers` `cc` where ((`cc`.`ReqRideId` = `m`.`Id`) and (`cc`.`RecordDeleted` is null))) AS `ReqRidePassengersCount` from ((((((`H_TransportReqRides` `m` left join `H_Synced_CVOs` `h1` on((`h1`.`Id` = `m`.`CVOId`))) left join `H_AAA_Synced_EntityProfile` `h1e` on((`h1e`.`Id` = `h1`.`EntityId`))) left join `H_TransportCustomers` `h2` on((`h2`.`Id` = `m`.`CustomerId`))) left join `H_AAA_Synced_EntityProfile` `h2e` on((`h2e`.`Id` = `h2`.`EntityId`))) left join `H_Synced_Distributors` `h3` on((`h3`.`Id` = `m`.`DistributorId`))) left join `H_AAA_Synced_EntityProfile` `h3e` on((`h3e`.`Id` = `h3`.`EntityId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_RideProfile`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_RideProfile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_RideProfile` AS select `m`.`Id` AS `Id`,`m`.`IsEditable` AS `IsEditable`,`m`.`CustomerId` AS `CustomerId`,`m`.`DistributorId` AS `DistributorId`,`m`.`CVOId` AS `CVOId`,`m`.`FromContactLocationId` AS `FromContactLocationId`,`m`.`ToContactLocationId` AS `ToContactLocationId`,`m`.`PickupAfterDateTime` AS `PickupAfterDateTime`,`m`.`PickupAfterDateTime_UTC` AS `PickupAfterDateTime_UTC`,`m`.`PickupBeforeDateTime` AS `PickupBeforeDateTime`,`m`.`PickupBeforeDateTime_UTC` AS `PickupBeforeDateTime_UTC`,`m`.`DropOffAfterDateTime` AS `DropOffAfterDateTime`,`m`.`DropOffAfterDateTime_UTC` AS `DropOffAfterDateTime_UTC`,`m`.`DropOffBeforeDateTime` AS `DropOffBeforeDateTime`,`m`.`DropOffBeforeDateTime_UTC` AS `DropOffBeforeDateTime_UTC`,`m`.`VehicleType` AS `VehicleType`,`m`.`VehicleProfileSubType` AS `VehicleProfileSubType`,`m`.`ServiceClass` AS `ServiceClass`,`m`.`ServiceCategory` AS `ServiceCategory`,`m`.`TotalRequiredSeats` AS `TotalRequiredSeats`,`m`.`NumberOfLuggages` AS `NumberOfLuggages`,`m`.`FeaturesJSON` AS `FeaturesJSON`,`m`.`Comments` AS `Comments`,`m`.`FareAtSubmission` AS `FareAtSubmission`,`m`.`PromoCode` AS `PromoCode`,`m`.`PaymentCategory` AS `PaymentCategory`,`m`.`PaymentMethod` AS `PaymentMethod`,`m`.`PaidAt_UTC` AS `PaidAt_UTC`,`m`.`HubCarrierInfo` AS `HubCarrierInfo`,`m`.`Status` AS `Status`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h1e`.`Title` AS `CVOTitle`,`h2e`.`Title` AS `CustomerTitle`,`h3e`.`Title` AS `DistributorTitle` from ((((((`H_TransportReqRides` `m` left join `H_Synced_CVOs` `h1` on((`h1`.`Id` = `m`.`CVOId`))) left join `H_AAA_Synced_EntityProfile` `h1e` on((`h1e`.`Id` = `h1`.`EntityId`))) left join `H_TransportCustomers` `h2` on((`h2`.`Id` = `m`.`CustomerId`))) left join `H_AAA_Synced_EntityProfile` `h2e` on((`h2e`.`Id` = `h2`.`EntityId`))) left join `H_Synced_Distributors` `h3` on((`h3`.`Id` = `m`.`DistributorId`))) left join `H_AAA_Synced_EntityProfile` `h3e` on((`h3e`.`Id` = `h3`.`EntityId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_ScenarioDataMap`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_ScenarioDataMap`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_ScenarioDataMap` AS select `j`.`Id` AS `Id`,`j`.`ScenarioId` AS `ScenarioId`,`j`.`TargetActENUM` AS `TargetActENUM`,`j`.`PermitTableName` AS `PermitTableName`,`j`.`PermitEntityFieldName` AS `PermitEntityFieldName`,`j`.`SourceDataType` AS `SourceDataType`,`j`.`EntityId` AS `EntityId`,`j`.`BaseTableName` AS `BaseTableName`,`j`.`JoinerActENUM` AS `JoinerActENUM`,`j`.`JoinerFieldName` AS `JoinerFieldName`,`j`.`JoiningTableName` AS `JoiningTableName`,`j`.`TargetFieldName` AS `TargetFieldName`,`j`.`CachedQuerySQL` AS `CachedQuerySQL`,`j`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`j`.`CreatedBy` AS `CreatedBy`,`j`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`j`.`ModifiedBy` AS `ModifiedBy`,`j`.`RecordDeleted` AS `RecordDeleted`,`h0e`.`Title` AS `ScenarioTitle` from ((`H_AAA_ScenarioDataMap` `j` left join `H_AAA_Scenarios` `h0` on((`h0`.`Id` = `j`.`ScenarioId`))) left join `H_AAA_Synced_EntityProfile` `h0e` on((`h0e`.`Id` = `h0`.`ClientEntityId`))) where (`j`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_ScenarioEntityScenarios`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_ScenarioEntityScenarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_ScenarioEntityScenarios` AS select `j`.`Id` AS `Id`,`j`.`EntityId` AS `EntityId`,`j`.`PermittedActENUM` AS `PermittedActENUM`,`j`.`ScenarioId` AS `ScenarioId`,`j`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`j`.`CreatedBy` AS `CreatedBy`,`j`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`j`.`ModifiedBy` AS `ModifiedBy`,`j`.`RecordDeleted` AS `RecordDeleted`,`h0e`.`Title` AS `ScenarioTitle`,`h1`.`Title` AS `EntityTitle` from (((`H_AAA_EntityScenarios` `j` left join `H_AAA_Scenarios` `h0` on((`h0`.`Id` = `j`.`ScenarioId`))) left join `H_AAA_Synced_EntityProfile` `h0e` on((`h0e`.`Id` = `h0`.`ClientEntityId`))) left join `H_AAA_Synced_EntityProfile` `h1` on((`h1`.`Id` = `j`.`EntityId`))) where (`j`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_ScenarioListSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_ScenarioListSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_ScenarioListSummary` AS select `m`.`Id` AS `Id`,`m`.`Description` AS `Description`,`m`.`ActivityClassENUM` AS `ActivityClassENUM`,`m`.`ClientEntityId` AS `ClientEntityId`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h0`.`Title` AS `ClientEntityTitle`,(select count(0) from `H_AAA_EntityScenarios` `cc` where ((`cc`.`ScenarioId` = `m`.`Id`) and (`cc`.`RecordDeleted` is null))) AS `EntityScenariosCount`,(select count(0) from `H_AAA_ScenarioDataMap` `cc` where ((`cc`.`ScenarioId` = `m`.`Id`) and (`cc`.`RecordDeleted` is null))) AS `DataMapCount` from (`H_AAA_Scenarios` `m` left join `H_AAA_Synced_EntityProfile` `h0` on((`h0`.`Id` = `m`.`ClientEntityId`))) where (`m`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_ScenarioProfile`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_ScenarioProfile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_ScenarioProfile` AS select `m`.`Id` AS `Id`,`m`.`Description` AS `Description`,`m`.`ActivityClassENUM` AS `ActivityClassENUM`,`m`.`ClientEntityId` AS `ClientEntityId`,`m`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`m`.`CreatedBy` AS `CreatedBy`,`m`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`m`.`ModifiedBy` AS `ModifiedBy`,`m`.`RecordDeleted` AS `RecordDeleted`,`h0`.`Title` AS `ClientEntityTitle` from (`H_AAA_Scenarios` `m` left join `H_AAA_Synced_EntityProfile` `h0` on((`h0`.`Id` = `m`.`ClientEntityId`))) where (`m`.`RecordDeleted` is null) */;
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

-- Dump completed on 2026-06-22 21:36:25
