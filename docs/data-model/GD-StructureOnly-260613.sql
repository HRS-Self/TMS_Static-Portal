-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 10.166.148.183    Database: HBloxTMSGD_DEV01
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=434 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=436 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
-- Table structure for table `H_AAA_EntityProfile`
--

DROP TABLE IF EXISTS `H_AAA_EntityProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_EntityProfile` (
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
  UNIQUE KEY `PartyCode` (`PartyCode`),
  UNIQUE KEY `unqPhone` (`Phone_fsx`),
  UNIQUE KEY `unqEmail` (`Email_fsx`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_AAA_EntityProfileLog`
--

DROP TABLE IF EXISTS `H_AAA_EntityProfileLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_EntityProfileLog` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `EntityProfileId` bigint unsigned NOT NULL,
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
  KEY `idx_9c10e40a54c559a399fc382c99e4a43b` (`EntityProfileId`),
  KEY `idx_c9dd3045207053e1ba116da548f6f8f6` (`PartyCode`),
  CONSTRAINT `fk_85a4d2630f785e0aa4b4bc00f7bcdd40` FOREIGN KEY (`EntityProfileId`) REFERENCES `H_AAA_EntityProfile` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  CONSTRAINT `fk_7baae7efd65c5c52ae2f0fd55cca9637` FOREIGN KEY (`EntityId`) REFERENCES `H_AAA_EntityProfile` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=424 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  CONSTRAINT `fk_96c9ad1b994f5260a0a5612fee99c796` FOREIGN KEY (`ClientEntityId`) REFERENCES `H_AAA_EntityProfile` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_AAA_Synced_RestrictedUserInfo`
--

DROP TABLE IF EXISTS `H_AAA_Synced_RestrictedUserInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_Synced_RestrictedUserInfo` (
  `UserId` bigint unsigned NOT NULL,
  `PasswordHash` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PasswordTemp` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PasswordTempExpires` datetime DEFAULT NULL,
  `PasswordTempFor` int DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `Setting_fsx` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserId` (`UserId`) /*!80000 INVISIBLE */,
  UNIQUE KEY `unq_user_App` (`UserId`,`AppClientId`,`RecordDeleted`),
  UNIQUE KEY `unq_user_app_settings_user_app_record_deleted` (`UserId`,`AppClientId`,`RecordDeleted`),
  KEY `fk_UserAppSettings_AppClients_idx` (`AppClientId`),
  KEY `idx_user_app_settings_user_id` (`UserId`),
  KEY `idx_user_app_settings_app_client_id` (`AppClientId`),
  CONSTRAINT `fk_user_app_settings_app_client` FOREIGN KEY (`AppClientId`) REFERENCES `H_AAA_AppClients` (`Id`),
  CONSTRAINT `fk_user_app_settings_user_info` FOREIGN KEY (`UserId`) REFERENCES `H_AAA_Synced_UserInfo` (`Id`),
  CONSTRAINT `fk_UserAppSettings_AppClients` FOREIGN KEY (`AppClientId`) REFERENCES `H_AAA_AppClients` (`Id`),
  CONSTRAINT `fk_UserAppSettings_USerInfo` FOREIGN KEY (`UserId`) REFERENCES `H_AAA_Synced_UserInfo` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_AAA_UserProfile`
--

DROP TABLE IF EXISTS `H_AAA_UserProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_UserProfile` (
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
  UNIQUE KEY `UserId` (`UserId`) /*!80000 INVISIBLE */,
  UNIQUE KEY `RecordKey` (`RecordKey`),
  CONSTRAINT `fk_ea76a6ff530c5f1cb115f1d1a04870c6` FOREIGN KEY (`UserId`) REFERENCES `H_AAA_Synced_UserInfo` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_AAA_UserProfileLog`
--

DROP TABLE IF EXISTS `H_AAA_UserProfileLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_AAA_UserProfileLog` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `UserProfileId` bigint unsigned NOT NULL,
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
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_521117dea6f7556699340a8a0f0e237d` (`UserProfileId`),
  KEY `idx_8554cf3889ac5966a96e1157ba5e86f9` (`UserId`),
  CONSTRAINT `fk_6553e3a73e765aa2ac007173d3eeefa3` FOREIGN KEY (`UserProfileId`) REFERENCES `H_AAA_UserProfile` (`Id`),
  CONSTRAINT `fk_8a4b1464d86c50718ccb9617d3a3aa29` FOREIGN KEY (`UserId`) REFERENCES `H_AAA_Synced_UserInfo` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_CFG_EntityConfigs`
--

DROP TABLE IF EXISTS `H_CFG_EntityConfigs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_CFG_EntityConfigs` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `PermitIssuerId` bigint unsigned DEFAULT NULL,
  `HUBId` bigint unsigned DEFAULT NULL,
  `DistributorId` bigint unsigned DEFAULT NULL,
  `CVOId` bigint unsigned DEFAULT NULL,
  `VehicleId` bigint unsigned DEFAULT NULL,
  `DriverId` bigint unsigned DEFAULT NULL,
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
  KEY `idx_47d3bba280185330a345542fc1295d28` (`ActENUM`),
  KEY `idx_46e50931538e5039ba3e9cb52f0a3f87` (`PermitIssuerId`),
  KEY `idx_1c4b5a6b2a5752e0af0917d97793d648` (`VehicleId`),
  KEY `idx_9dc2fd97d8365e3f9ec37b7f11865fab` (`DriverId`),
  KEY `idx_667830a134075068bf6a2ce8a7512997` (`HUBId`),
  KEY `idx_2c227a0fd0f45b579b1ae5d21915d5f3` (`DistributorId`),
  KEY `idx_9c405dc7838e53b8ad3bee585d4c0cf6` (`CVOId`),
  KEY `idx_f36f5b22ead9562595026630c98dfce0` (`ConfigBaseId`),
  KEY `idx_44e55c4cf13f5e18919fe8ee845e4903` (`ScenarioId`),
  CONSTRAINT `fk_19b8ce09df1c562eb76a7dbb1c74994c` FOREIGN KEY (`PermitIssuerId`) REFERENCES `H_PermitIssuers` (`Id`),
  CONSTRAINT `fk_4161c2541cc450f0bf405c2b347c1310` FOREIGN KEY (`ConfigBaseId`) REFERENCES `H_CFG_ActionConfigBases` (`Id`),
  CONSTRAINT `fk_4e84ef6155ed509296579bb6ba699227` FOREIGN KEY (`DistributorId`) REFERENCES `H_Distributors` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_62e3b7a3b4dc55e78b373da008bc13f3` FOREIGN KEY (`ScenarioId`) REFERENCES `H_AAA_EntityScenarios` (`ScenarioId`),
  CONSTRAINT `fk_718aae0e547855a3a728a23a146eeaec` FOREIGN KEY (`ActENUM`) REFERENCES `H_AAA_EntityScenarios` (`PermittedActENUM`),
  CONSTRAINT `fk_91e384e24b8253688d42b5cd6e1a5776` FOREIGN KEY (`CVOId`) REFERENCES `H_CVOs` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_d6d3d1b5d072598db26b891792ae1892` FOREIGN KEY (`HUBId`) REFERENCES `H_HUBs` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_de564db899f05eefb5fcce3b94033fe1` FOREIGN KEY (`DriverId`) REFERENCES `H_Drivers` (`Id`),
  CONSTRAINT `fk_deb7a617b2875d419efbf01f0277adc6` FOREIGN KEY (`VehicleId`) REFERENCES `H_VehicleProfile` (`Id`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_CVODrivers`
--

DROP TABLE IF EXISTS `H_CVODrivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_CVODrivers` (
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
  KEY `idx_eafc34e20c24574ea16209849b4b5389` (`CVOId`),
  KEY `idx_0d9c6d5832175612934a83925ae478e9` (`DriverId`),
  CONSTRAINT `fk_34b0b64ccdb557528f81ec80be4a2228` FOREIGN KEY (`CVOId`) REFERENCES `H_CVOs` (`Id`),
  CONSTRAINT `fk_5da0ef4345db52548a818dbfa8e3af61` FOREIGN KEY (`DriverId`) REFERENCES `H_Drivers` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_CVODriversLog`
--

DROP TABLE IF EXISTS `H_CVODriversLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_CVODriversLog` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CVODriverId` bigint unsigned NOT NULL,
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
  KEY `idx_cvodriverslog_codriverid` (`CVODriverId`),
  CONSTRAINT `fk_cvodriverslog_codriverid` FOREIGN KEY (`CVODriverId`) REFERENCES `H_CVODrivers` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_CVOServices`
--

DROP TABLE IF EXISTS `H_CVOServices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_CVOServices` (
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
  KEY `idx_6db80af6108e52089d6fbf588b9e6a35` (`CVOId`),
  KEY `idx_00b2e9c37aa450108edbb7f0e416509e` (`ServiceId`),
  CONSTRAINT `fk_a5b17275b6d653958d67548c5864df2e` FOREIGN KEY (`ServiceId`) REFERENCES `H_ServiceBases` (`Id`),
  CONSTRAINT `fk_def60bce068a56feb4b5be98de630d10` FOREIGN KEY (`CVOId`) REFERENCES `H_CVOs` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_CVOVehicles`
--

DROP TABLE IF EXISTS `H_CVOVehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_CVOVehicles` (
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
  KEY `idx_88e107a1b0835eee8f889c958fd4187d` (`CVOId`),
  KEY `idx_19be519948e85178bb812a5a2898561f` (`VehicleId`),
  CONSTRAINT `fk_08c6eb5eaa095b15a97d062985588bfb` FOREIGN KEY (`VehicleId`) REFERENCES `H_VehicleProfile` (`Id`),
  CONSTRAINT `fk_b581910dabb9579eb5bd02488c5f12e4` FOREIGN KEY (`CVOId`) REFERENCES `H_CVOs` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_CVOVehiclesLog`
--

DROP TABLE IF EXISTS `H_CVOVehiclesLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_CVOVehiclesLog` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CVOVehicleId` bigint unsigned NOT NULL,
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
  KEY `idx_cvovehicleslog_cvovehicleid` (`CVOVehicleId`),
  CONSTRAINT `fk_cvovehicleslog_cvovehicleid` FOREIGN KEY (`CVOVehicleId`) REFERENCES `H_CVOVehicles` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_CVOs`
--

DROP TABLE IF EXISTS `H_CVOs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_CVOs` (
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
  KEY `idx_761ba4fc4acb5831ad163ae2c6f43c45` (`EntityId`),
  CONSTRAINT `fk_9971757059995e988401056f3a08d2cb` FOREIGN KEY (`EntityId`) REFERENCES `H_AAA_EntityProfile` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=22928 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=155181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
-- Table structure for table `H_DistributorCVOs`
--

DROP TABLE IF EXISTS `H_DistributorCVOs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_DistributorCVOs` (
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
  KEY `idx_caedd3b9988853458fcb845cc8e67fe9` (`CVOId`),
  KEY `idx_f4901ef64e465f3ab93e43f8ae7bfb5f` (`DistributorId`),
  CONSTRAINT `fk_9ada873fe2735ed58d737d2ee171d6dd` FOREIGN KEY (`DistributorId`) REFERENCES `H_Distributors` (`Id`),
  CONSTRAINT `fk_ec08914edfe257a0849c9e6f4aa0173f` FOREIGN KEY (`CVOId`) REFERENCES `H_CVOs` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_DistributorCVOsLog`
--

DROP TABLE IF EXISTS `H_DistributorCVOsLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_DistributorCVOsLog` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DistributorCVOId` bigint unsigned NOT NULL,
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
  KEY `idx_distributorcvoslog_distributorcvoid` (`DistributorCVOId`),
  CONSTRAINT `fk_distributorcvoslog_distributorcvoid` FOREIGN KEY (`DistributorCVOId`) REFERENCES `H_DistributorCVOs` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_DistributorDrivers`
--

DROP TABLE IF EXISTS `H_DistributorDrivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_DistributorDrivers` (
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
  KEY `idx_94ce37e0d2c75b37930ca7c7f4922771` (`DistributorId`),
  KEY `idx_7dd4725bbc105ca1aab1b10357c860bc` (`DriverId`),
  CONSTRAINT `fk_248364e417fc5f419566efb613feb501` FOREIGN KEY (`DriverId`) REFERENCES `H_Drivers` (`Id`),
  CONSTRAINT `fk_808c3063db4a5caa9915f8cc85effc1f` FOREIGN KEY (`DistributorId`) REFERENCES `H_Distributors` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_DistributorDriversLog`
--

DROP TABLE IF EXISTS `H_DistributorDriversLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_DistributorDriversLog` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DistributorDriverId` bigint unsigned NOT NULL,
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
  KEY `idx_distributordriverslog_distributoddriverid` (`DistributorDriverId`),
  CONSTRAINT `fk_distributordriverslog_distributoddriverid` FOREIGN KEY (`DistributorDriverId`) REFERENCES `H_DistributorDrivers` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Distributors`
--

DROP TABLE IF EXISTS `H_Distributors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Distributors` (
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
  KEY `idx_0be09e2d09045f56a402975e6c7d152b` (`EntityId`),
  CONSTRAINT `fk_fce4886f46dd5cf19b79c19ed162ed92` FOREIGN KEY (`EntityId`) REFERENCES `H_AAA_EntityProfile` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_DriverPermitVehicleTypes`
--

DROP TABLE IF EXISTS `H_DriverPermitVehicleTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_DriverPermitVehicleTypes` (
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
  KEY `idx_308f0c505d79591ba0ceffacc474d1f7` (`PermitId`),
  CONSTRAINT `fk_e8bfb03c1c1858a1b1b3a04963b84dc7` FOREIGN KEY (`PermitId`) REFERENCES `H_Permits` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Drivers`
--

DROP TABLE IF EXISTS `H_Drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Drivers` (
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
  KEY `idx_148edbc96f5d58ee80edb0fabc91959d` (`PersonCVOId`),
  KEY `idx_4967d98ee89d5c9d99bbc8664da5d081` (`UserId`),
  CONSTRAINT `fk_161f084815c157c485032c5e35c6e157` FOREIGN KEY (`UserId`) REFERENCES `H_AAA_Synced_UserInfo` (`Id`),
  CONSTRAINT `fk_87afd1c1c60e5f6b8496ef236dd4261c` FOREIGN KEY (`PersonCVOId`) REFERENCES `H_CVOs` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
-- Table structure for table `H_Features`
--

DROP TABLE IF EXISTS `H_Features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Features` (
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
-- Table structure for table `H_HUBDistributors`
--

DROP TABLE IF EXISTS `H_HUBDistributors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_HUBDistributors` (
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
  KEY `idx_22858c321e205ad4ba17c839c7848717` (`DistributorId`),
  KEY `idx_cfd36a0cecee5edf961bf33d2d40754c` (`HUBId`),
  CONSTRAINT `fk_157ed9ab995d50cb850d45df349e0765` FOREIGN KEY (`HUBId`) REFERENCES `H_HUBs` (`Id`),
  CONSTRAINT `fk_8ace409aadbf515aa95de1866e8acb89` FOREIGN KEY (`DistributorId`) REFERENCES `H_Distributors` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_HUBDistributorsLog`
--

DROP TABLE IF EXISTS `H_HUBDistributorsLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_HUBDistributorsLog` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `HUBDistributorId` bigint unsigned NOT NULL,
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
  KEY `idx_hubdistributorslog_hubdistributorid` (`HUBDistributorId`),
  CONSTRAINT `fk_hubdistributorslog_hubdistributorid` FOREIGN KEY (`HUBDistributorId`) REFERENCES `H_HUBDistributors` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_HUBs`
--

DROP TABLE IF EXISTS `H_HUBs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_HUBs` (
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
  KEY `idx_60b3395b00ef5634b6374063d6cd7564` (`EntityId`),
  CONSTRAINT `fk_f29cd848c90554f4ad71415622063cd4` FOREIGN KEY (`EntityId`) REFERENCES `H_AAA_EntityProfile` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_MasterServices`
--

DROP TABLE IF EXISTS `H_MasterServices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_MasterServices` (
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
-- Table structure for table `H_PermitIssuers`
--

DROP TABLE IF EXISTS `H_PermitIssuers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_PermitIssuers` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `EntityId` bigint unsigned NOT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_260982db8a5657afbcab2263b7f55569` (`EntityId`),
  CONSTRAINT `fk_0ea129dd56b35cd89fe64738f470c025` FOREIGN KEY (`EntityId`) REFERENCES `H_AAA_EntityProfile` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_PermitStatusVerifications`
--

DROP TABLE IF EXISTS `H_PermitStatusVerifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_PermitStatusVerifications` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `PermitStatusId` bigint unsigned NOT NULL,
  `RequestStatusId` bigint unsigned NOT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `unq-permit-request` (`PermitStatusId`,`RequestStatusId`),
  KEY `idx_1b91b33b446555c0bcfd6052d8305be3` (`PermitStatusId`),
  KEY `idx_5d591f1cf73c5c7fb7b2c53c80e0cab7` (`RequestStatusId`),
  CONSTRAINT `fk_0f9e3e00a3cd515dab9130f6520153fc` FOREIGN KEY (`PermitStatusId`) REFERENCES `H_PermitStatuses` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ac2f9638e1f65dc6acdfa2dbceddc8d9` FOREIGN KEY (`RequestStatusId`) REFERENCES `H_RequestStatuses` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=707 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_PermitStatuses`
--

DROP TABLE IF EXISTS `H_PermitStatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_PermitStatuses` (
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
  KEY `idx_6f0ae66e8f095a63aa98c23a7a63a413` (`PermitId`),
  CONSTRAINT `fk_bb958b31fa2f597cb058c81f0b36a5ba` FOREIGN KEY (`PermitId`) REFERENCES `H_Permits` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=527 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='The functionality of this table is infact a log and its name shoudl have been H_PermitStatusLog but due to the way that Hexa backends works with *log tables, the log soffix has not been added to its name.\n\nNever update a record in this table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_PermitTypeIssuers`
--

DROP TABLE IF EXISTS `H_PermitTypeIssuers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_PermitTypeIssuers` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `PermitIssuerId` bigint unsigned NOT NULL,
  `PermitTypeId` int unsigned NOT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_a9ddb35e74875f768be5e5b4d363338d` (`PermitIssuerId`),
  KEY `idx_bb67f07ca672550ba011617ad3b7b812` (`PermitTypeId`),
  CONSTRAINT `fk_5e3d516c0853544cbea8dbb13a010183` FOREIGN KEY (`PermitIssuerId`) REFERENCES `H_PermitIssuers` (`Id`),
  CONSTRAINT `fk_9bc11d7e50855208b6a4ba4fbb27f28a` FOREIGN KEY (`PermitTypeId`) REFERENCES `H_PermitTypes` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_PermitTypes`
--

DROP TABLE IF EXISTS `H_PermitTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_PermitTypes` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `ActENUM` int unsigned NOT NULL,
  `ActivityClassENUM` int unsigned NOT NULL,
  `Title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AllowedServiceCategories` json DEFAULT NULL,
  `Extendable` tinyint(1) NOT NULL DEFAULT '0',
  `ProfileDependant` tinyint NOT NULL DEFAULT '0',
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_Permits`
--

DROP TABLE IF EXISTS `H_Permits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_Permits` (
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
  `ServiceCategory` tinyint DEFAULT NULL,
  `IssuedDate_UTC` datetime NOT NULL,
  `RecordKey` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RecordKey` (`RecordKey`),
  KEY `idx_5a44d60af93c500aaac1d352f0d4638c` (`ActENUM`),
  KEY `idx_3973db4292245e699f2a9102cf4da91f` (`HUBId`),
  KEY `idx_46bd19ef7e9857d588b5267b0faeb231` (`PermitIssuerId`),
  KEY `idx_0a571c0c06ca5e22bc2b2c414a641c47` (`VehicleId`),
  KEY `idx_a678951655cc5f798213950714328466` (`DriverId`),
  KEY `idx_46a36c37cdc75c258c7fd30f8dddb6a4` (`DistributorId`),
  KEY `idx_beebf81d99c1588e9acf3ff9f6f5070b` (`CVOId`),
  KEY `idx_2ed18b213a145a0f907d28459c790689` (`PermitTypeId`),
  CONSTRAINT `fk_16948444eca55043b71c0826405b6b39` FOREIGN KEY (`DriverId`) REFERENCES `H_Drivers` (`Id`),
  CONSTRAINT `fk_3d4ce185f0a35f5f9850498571b58014` FOREIGN KEY (`VehicleId`) REFERENCES `H_VehicleProfile` (`Id`),
  CONSTRAINT `fk_65927ecfc6225ae7a0c380f740a965cc` FOREIGN KEY (`HUBId`) REFERENCES `H_HUBs` (`Id`),
  CONSTRAINT `fk_84049128d81c5b8c90b4c33b92c498bb` FOREIGN KEY (`CVOId`) REFERENCES `H_CVOs` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_9e30dc97da285214a8eb0a37c768e2db` FOREIGN KEY (`ActENUM`) REFERENCES `H_AAA_EntityScenarios` (`PermittedActENUM`),
  CONSTRAINT `fk_a9040a218add5aceb0d5094b1bc3a1d1` FOREIGN KEY (`DistributorId`) REFERENCES `H_Distributors` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_adbf7d50e99052b691fc1016e61470b2` FOREIGN KEY (`PermitTypeId`) REFERENCES `H_PermitTypes` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ae736e21051c53098409ba22455e9dcd` FOREIGN KEY (`PermitIssuerId`) REFERENCES `H_PermitIssuers` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1911 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_RequestBases`
--

DROP TABLE IF EXISTS `H_RequestBases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_RequestBases` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `RequesterUserId` bigint unsigned NOT NULL,
  `RequesterEntityId` bigint unsigned DEFAULT NULL,
  `RequesterActENUM` tinyint unsigned NOT NULL,
  `RequestType` tinyint NOT NULL,
  `MetaData` text COLLATE utf8mb4_unicode_ci,
  `Expiry_UTC` datetime NOT NULL,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_dbcce6cb6e655e9fa81fde5260f1f5f6` (`RequesterEntityId`),
  KEY `idx_079c733e621e5384be078b2e2232a218` (`RequesterUserId`),
  CONSTRAINT `fk_82580eaaead452b28261d638cad4dff7` FOREIGN KEY (`RequesterUserId`) REFERENCES `H_AAA_Synced_UserInfo` (`Id`),
  CONSTRAINT `fk_8edcbf9ca0655f648cff5bbd1bc644ea` FOREIGN KEY (`RequesterEntityId`) REFERENCES `H_AAA_EntityProfile` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_RequestStatuses`
--

DROP TABLE IF EXISTS `H_RequestStatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_RequestStatuses` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `RequestId` bigint unsigned NOT NULL,
  `RequesteeUserId` bigint unsigned DEFAULT NULL,
  `RequesteeEntityId` bigint unsigned DEFAULT NULL,
  `RequesteeActENUM` tinyint unsigned DEFAULT NULL,
  `Status` tinyint NOT NULL,
  `StatusReason` tinytext COLLATE utf8mb4_unicode_ci,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_fca80845d645506582f041608a9e6261` (`RequestId`),
  KEY `idx_10439d98ad23597fb97dbb17138639e1` (`RequesteeUserId`),
  KEY `idx_dc263a047a6a5d4eb847c5d52188c08f` (`RequesteeEntityId`),
  CONSTRAINT `fk_424c057760c05cf4a6ec64f16abf373e` FOREIGN KEY (`RequesteeEntityId`) REFERENCES `H_AAA_EntityProfile` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ae0cdcdeb8765467a3195903ca2f8515` FOREIGN KEY (`RequesteeUserId`) REFERENCES `H_AAA_Synced_UserInfo` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cdd303b2a3b8593ea83a8ba7820022ff` FOREIGN KEY (`RequestId`) REFERENCES `H_RequestBases` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=431 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_RequestStatusesLog`
--

DROP TABLE IF EXISTS `H_RequestStatusesLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_RequestStatusesLog` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `RequestStatusId` bigint unsigned NOT NULL,
  `RequestId` bigint unsigned NOT NULL,
  `RequesteeUserId` bigint unsigned DEFAULT NULL,
  `RequesteeEntityId` bigint unsigned DEFAULT NULL,
  `RequesteeActENUM` tinyint unsigned DEFAULT NULL,
  `Status` tinyint NOT NULL,
  `StatusReason` tinytext COLLATE utf8mb4_unicode_ci,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint unsigned DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint unsigned DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_e7d258edb55c51f592c25aaaa18226b2` (`RequestStatusId`),
  CONSTRAINT `fk_09571931c77751ffad04b65f0b01cbff` FOREIGN KEY (`RequestStatusId`) REFERENCES `H_RequestStatuses` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=363 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `Source` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Destination` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CheckModificationSince_UTC` datetime DEFAULT NULL,
  `CheckModificationTill_UTC` datetime DEFAULT NULL,
  `SourceLastModifiedAt_UTC` datetime NOT NULL,
  `DestModifiedAt_UTC` datetime DEFAULT NULL,
  `DestUpdateStartedAt_UTC` datetime NOT NULL,
  `TotalSyncRequiredRecords` int unsigned DEFAULT NULL,
  `ProcessedRecords` int unsigned DEFAULT NULL,
  `SyncSucceeded` int unsigned DEFAULT NULL,
  `SyncFailed` int unsigned DEFAULT NULL,
  `LastError` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CreatedAt_UTC` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` bigint DEFAULT NULL,
  `ModifiedAt_UTC` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ModifiedBy` bigint DEFAULT NULL,
  `RecordDeleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_eb0f203c6b905ac18fcfffc9c1f1cbbf` (`SessionId`),
  CONSTRAINT `fk_6c37e5e86e455ba891fa82505b92e6f7` FOREIGN KEY (`SessionId`) REFERENCES `H_SYNC_DataSyncSessions` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_SYNC_DataSyncSessions`
--

DROP TABLE IF EXISTS `H_SYNC_DataSyncSessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_SYNC_DataSyncSessions` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Actor` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` tinyint unsigned NOT NULL,
  `Summary` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_ServiceBases`
--

DROP TABLE IF EXISTS `H_ServiceBases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_ServiceBases` (
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
-- Table structure for table `H_VehicleDrivers`
--

DROP TABLE IF EXISTS `H_VehicleDrivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_VehicleDrivers` (
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
  KEY `idx_0d13ea0599a75d96abeb09725bf78123` (`DriverId`),
  KEY `idx_47217282de6f5a19a91c5bb93958ee3d` (`VehicleId`),
  CONSTRAINT `fk_596b01d4671a5721988e9fc74743cf34` FOREIGN KEY (`DriverId`) REFERENCES `H_Drivers` (`Id`),
  CONSTRAINT `fk_6d9e99a99cee5677b8e1e5b755bd82ea` FOREIGN KEY (`VehicleId`) REFERENCES `H_VehicleProfile` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_VehicleDriversLog`
--

DROP TABLE IF EXISTS `H_VehicleDriversLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_VehicleDriversLog` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `VehicleDriverId` bigint unsigned NOT NULL,
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
  KEY `idx_vehicledriverslog_vehicledriverid` (`VehicleDriverId`),
  CONSTRAINT `fk_vehicledriverslog_vehicledriverid` FOREIGN KEY (`VehicleDriverId`) REFERENCES `H_VehicleDrivers` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_VehicleFeatures`
--

DROP TABLE IF EXISTS `H_VehicleFeatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_VehicleFeatures` (
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
  KEY `idx_5ba2fbd32a035b58b0e47e2e5c303d9c` (`FeatureId`),
  KEY `idx_ec2961507f4556e9b317199a0e4a9c04` (`VehicleId`),
  CONSTRAINT `fk_5662fc5bf5bd522a8c88a33072dfdcfb` FOREIGN KEY (`FeatureId`) REFERENCES `H_Features` (`Id`),
  CONSTRAINT `fk_9dc2744c72f550929090d43da6bab24e` FOREIGN KEY (`VehicleId`) REFERENCES `H_VehicleProfile` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_VehicleProfile`
--

DROP TABLE IF EXISTS `H_VehicleProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_VehicleProfile` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Plate` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VIN` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Make` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Model` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Province` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Color` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Year` int DEFAULT NULL,
  `TransportCategory` tinyint DEFAULT NULL,
  `Cargo_Height` int unsigned DEFAULT NULL,
  `Cargo_Weight` int unsigned DEFAULT NULL,
  `Cargo_Length` int unsigned DEFAULT NULL,
  `Cargo_Width` int unsigned DEFAULT NULL,
  `Capacity_Passengers` int unsigned DEFAULT NULL,
  `Capacity_Luggage` int unsigned DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=607 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `H_VehicleProfileLog`
--

DROP TABLE IF EXISTS `H_VehicleProfileLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `H_VehicleProfileLog` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `VehicleProfileId` bigint unsigned NOT NULL,
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
  KEY `idx_a11885b76c9c501a8bc074f97ee28c59` (`VehicleProfileId`),
  CONSTRAINT `fk_30f616570e5055e1a760619ea0fe9c43` FOREIGN KEY (`VehicleProfileId`) REFERENCES `H_VehicleProfile` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
-- Temporary view structure for view `Vi_BK_PermitStatusCheck`
--

DROP TABLE IF EXISTS `Vi_BK_PermitStatusCheck`;
/*!50001 DROP VIEW IF EXISTS `Vi_BK_PermitStatusCheck`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_BK_PermitStatusCheck` AS SELECT 
 1 AS `Id`,
 1 AS `PermitTypeId`,
 1 AS `PermitId`,
 1 AS `PermitHUBId`,
 1 AS `PermitDistributorId`,
 1 AS `PermitCVOId`,
 1 AS `PermitVehicleId`,
 1 AS `PermitDriverId`,
 1 AS `ActivityClassENUM`,
 1 AS `PermitPermitIssuerId`,
 1 AS `Code`,
 1 AS `ServiceCategory`,
 1 AS `AllowedServiceCategories`,
 1 AS `Extendable`,
 1 AS `ProfileDependant`,
 1 AS `ExpiryDate_UTC`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_BK_RequestStatusCheck`
--

DROP TABLE IF EXISTS `Vi_BK_RequestStatusCheck`;
/*!50001 DROP VIEW IF EXISTS `Vi_BK_RequestStatusCheck`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_BK_RequestStatusCheck` AS SELECT 
 1 AS `Id`,
 1 AS `RequestId`,
 1 AS `RequesterUserId`,
 1 AS `RequesterEntityId`,
 1 AS `RequesterActENUM`,
 1 AS `RequesteeUserId`,
 1 AS `RequesteeEntityId`,
 1 AS `RequesteeActENUM`,
 1 AS `RequestType`,
 1 AS `MetaData`,
 1 AS `CreatedAt_UTC`,
 1 AS `ExpiryDate_UTC`,
 1 AS `Status`,
 1 AS `StatusReason`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_BK_RequestSummary`
--

DROP TABLE IF EXISTS `Vi_BK_RequestSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_BK_RequestSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_BK_RequestSummary` AS SELECT 
 1 AS `RequestId`,
 1 AS `RequestType`,
 1 AS `RequesterUserId`,
 1 AS `RequesterEntityId`,
 1 AS `RequesterActENUM`,
 1 AS `RequestStatusId`,
 1 AS `RequesteeUserId`,
 1 AS `RequesteeEntityId`,
 1 AS `RequesteeActENUM`,
 1 AS `Status`,
 1 AS `StatusReason`,
 1 AS `ExpiryDate_UTC`,
 1 AS `RequestCreatedAt_UTC`,
 1 AS `StatusCreatedAt_UTC`,
 1 AS `StatusModifiedAt_UTC`,
 1 AS `InvitationCodeStem`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_BK_SYNC_PermitStatusVerifications-DoNotUse`
--

DROP TABLE IF EXISTS `Vi_BK_SYNC_PermitStatusVerifications-DoNotUse`;
/*!50001 DROP VIEW IF EXISTS `Vi_BK_SYNC_PermitStatusVerifications-DoNotUse`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_BK_SYNC_PermitStatusVerifications-DoNotUse` AS SELECT 
 1 AS `Id`,
 1 AS `PermitStatusId`,
 1 AS `RequestStatusId`,
 1 AS `RequesterUserId`,
 1 AS `RequesterEntityId`,
 1 AS `RequesterActENUM`,
 1 AS `RequesteeUserId`,
 1 AS `RequesteeEntityId`,
 1 AS `RequesteeActENUM`,
 1 AS `RequestType`,
 1 AS `ExpiryDate_UTC`,
 1 AS `Status`,
 1 AS `StatusReason`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`*/;
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
-- Temporary view structure for view `Vi_DPA_ActionConfigBaseEntityConfigsExtraDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_ActionConfigBaseEntityConfigsExtraDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_ActionConfigBaseEntityConfigsExtraDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_ActionConfigBaseEntityConfigsExtraDetail` AS SELECT 
 1 AS `ActionConfigBaseId`,
 1 AS `ActionConfigBaseCode`,
 1 AS `ActionConfigBaseDescription`,
 1 AS `PermitIssuerId`,
 1 AS `HUBId`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `VehicleId`,
 1 AS `DriverId`,
 1 AS `ActENUM`,
 1 AS `ScenarioId`,
 1 AS `Value`,
 1 AS `IsOverridable`*/;
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
 1 AS `EntityConfigsCount`,
 1 AS `GlobalConfigsCount`*/;
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
 1 AS `ServiceCategory`,
 1 AS `IssuedDate_UTC`,
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
 1 AS `PermitTypeActENUM`,
 1 AS `PermitTypeActivityClassENUM`,
 1 AS `PermitTypeTitle`,
 1 AS `PermitTypeAllowedServiceCategories`,
 1 AS `PermitTypeExtendable`,
 1 AS `PermitTypeProfileDependant`,
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
 1 AS `PermitIssuerDiscriminator`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_CVOServicesSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_CVOServicesSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_CVOServicesSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_CVOServicesSuperDetail` AS SELECT 
 1 AS `ServiceBaseId`,
 1 AS `ServiceBaseServiceType`,
 1 AS `ServiceBaseServiceClass`,
 1 AS `CVOId`,
 1 AS `ServiceCategory`,
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
-- Temporary view structure for view `Vi_DPA_CVOSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_CVOSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_CVOSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_CVOSummary` AS SELECT 
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
 1 AS `PermitsCount`,
 1 AS `DriversCount`,
 1 AS `ServicesCount`,
 1 AS `VehiclesCount`,
 1 AS `DistributorsCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_CVOVehiclesSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_CVOVehiclesSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_CVOVehiclesSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_CVOVehiclesSuperDetail` AS SELECT 
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
 1 AS `ServiceCategory`,
 1 AS `IssuedDate_UTC`,
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
 1 AS `PermitTypeActENUM`,
 1 AS `PermitTypeActivityClassENUM`,
 1 AS `PermitTypeTitle`,
 1 AS `PermitTypeAllowedServiceCategories`,
 1 AS `PermitTypeExtendable`,
 1 AS `PermitTypeProfileDependant`,
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
 1 AS `PermitIssuerDiscriminator`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_DistributorSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_DistributorSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DistributorSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_DistributorSummary` AS SELECT 
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
 1 AS `PermitsCount`,
 1 AS `CVOsCount`,
 1 AS `DriversCount`,
 1 AS `HUBsCount`*/;
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
 1 AS `PermitServiceCategory`,
 1 AS `PermitIssuedDate_UTC`,
 1 AS `VehicleType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_DriverPermitsExtraDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_DriverPermitsExtraDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DriverPermitsExtraDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_DriverPermitsExtraDetail` AS SELECT 
 1 AS `DriverId`,
 1 AS `DriverUserId`,
 1 AS `DriverPersonCVOId`,
 1 AS `DriverUserFirstname_fsx`,
 1 AS `DriverUserLastname_fsx`,
 1 AS `DriverUserUsername`,
 1 AS `DriverUserEmail_fsx`,
 1 AS `DriverUserEmail_hash`,
 1 AS `DriverUserEmailConfirmed`,
 1 AS `DriverUserCellPhone_fsx`,
 1 AS `DriverUserCellPhone_hash`,
 1 AS `DriverUserCellPhoneConfirmed`,
 1 AS `DriverUserIssuedBy`,
 1 AS `HUBId`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `VehicleId`,
 1 AS `ActENUM`,
 1 AS `PermitIssuerId`,
 1 AS `PermitTypeId`,
 1 AS `Code`,
 1 AS `ServiceCategory`,
 1 AS `IssuedDate_UTC`,
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
 1 AS `PermitTypeActENUM`,
 1 AS `PermitTypeActivityClassENUM`,
 1 AS `PermitTypeTitle`,
 1 AS `PermitTypeAllowedServiceCategories`,
 1 AS `PermitTypeExtendable`,
 1 AS `PermitTypeProfileDependant`,
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
 1 AS `PermitIssuerDiscriminator`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_DriverSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_DriverSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DriverSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_DriverSummary` AS SELECT 
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
 1 AS `UserIssuedBy`,
 1 AS `PermitsCount`,
 1 AS `CVOsCount`,
 1 AS `DistributorsCount`,
 1 AS `VehiclesCount`*/;
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
 1 AS `ServiceCategory`,
 1 AS `IssuedDate_UTC`,
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
 1 AS `PermitTypeActENUM`,
 1 AS `PermitTypeActivityClassENUM`,
 1 AS `PermitTypeTitle`,
 1 AS `PermitTypeAllowedServiceCategories`,
 1 AS `PermitTypeExtendable`,
 1 AS `PermitTypeProfileDependant`,
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
 1 AS `PermitIssuerDiscriminator`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_HUBSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_HUBSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_HUBSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_HUBSummary` AS SELECT 
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
 1 AS `PermitsCount`,
 1 AS `DistributorsCount`*/;
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
 1 AS `ServiceCategory`,
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
 1 AS `ServiceCategory`,
 1 AS `IssuedDate_UTC`,
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
 1 AS `PermitTypeActENUM`,
 1 AS `PermitTypeActivityClassENUM`,
 1 AS `PermitTypeTitle`,
 1 AS `PermitTypeAllowedServiceCategories`,
 1 AS `PermitTypeExtendable`,
 1 AS `PermitTypeProfileDependant`*/;
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
 1 AS `PermitsCount`,
 1 AS `PermitTypeIssuersCount`*/;
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
 1 AS `ServiceCategory`,
 1 AS `IssuedDate_UTC`,
 1 AS `DriverVehicleTypesCount`,
 1 AS `StatusesCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_PermitType`
--

DROP TABLE IF EXISTS `Vi_DPA_PermitType`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_PermitType`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_PermitType` AS SELECT 
 1 AS `Id`,
 1 AS `ActENUM`,
 1 AS `ActivityClassENUM`,
 1 AS `Title`,
 1 AS `AllowedServiceCategories`,
 1 AS `Extendable`,
 1 AS `ProfileDependant`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_PermitTypeIssuersSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_PermitTypeIssuersSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_PermitTypeIssuersSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_PermitTypeIssuersSuperDetail` AS SELECT 
 1 AS `PermitTypeId`,
 1 AS `PermitTypeActENUM`,
 1 AS `PermitTypeActivityClassENUM`,
 1 AS `PermitTypeTitle`,
 1 AS `PermitTypeAllowedServiceCategories`,
 1 AS `PermitTypeExtendable`,
 1 AS `PermitTypeProfileDependant`,
 1 AS `PermitIssuerId`,
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
 1 AS `PermitIssuerDiscriminator`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_PermitTypePermitsExtraDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_PermitTypePermitsExtraDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_PermitTypePermitsExtraDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_PermitTypePermitsExtraDetail` AS SELECT 
 1 AS `PermitTypeId`,
 1 AS `PermitTypeActENUM`,
 1 AS `PermitTypeActivityClassENUM`,
 1 AS `PermitTypeTitle`,
 1 AS `PermitTypeAllowedServiceCategories`,
 1 AS `PermitTypeExtendable`,
 1 AS `PermitTypeProfileDependant`,
 1 AS `HUBId`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `VehicleId`,
 1 AS `DriverId`,
 1 AS `ActENUM`,
 1 AS `PermitIssuerId`,
 1 AS `Code`,
 1 AS `ServiceCategory`,
 1 AS `IssuedDate_UTC`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_PermitTypeSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_PermitTypeSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_PermitTypeSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_PermitTypeSummary` AS SELECT 
 1 AS `Id`,
 1 AS `ActENUM`,
 1 AS `ActivityClassENUM`,
 1 AS `Title`,
 1 AS `AllowedServiceCategories`,
 1 AS `Extendable`,
 1 AS `ProfileDependant`,
 1 AS `IssuersCount`,
 1 AS `PermitsCount`*/;
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
-- Temporary view structure for view `Vi_DPA_VehiclePermitsExtraDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_VehiclePermitsExtraDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_VehiclePermitsExtraDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_VehiclePermitsExtraDetail` AS SELECT 
 1 AS `VehicleProfileId`,
 1 AS `VehicleProfilePlate`,
 1 AS `VehicleProfileVIN`,
 1 AS `VehicleProfileMake`,
 1 AS `VehicleProfileModel`,
 1 AS `VehicleProfileProvince`,
 1 AS `VehicleProfileColor`,
 1 AS `VehicleProfileYear`,
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
 1 AS `ServiceCategory`,
 1 AS `IssuedDate_UTC`,
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
 1 AS `PermitTypeActENUM`,
 1 AS `PermitTypeActivityClassENUM`,
 1 AS `PermitTypeTitle`,
 1 AS `PermitTypeAllowedServiceCategories`,
 1 AS `PermitTypeExtendable`,
 1 AS `PermitTypeProfileDependant`,
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
 1 AS `PermitIssuerDiscriminator`*/;
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
-- Temporary view structure for view `Vi_DPA_VehicleProfileEntityConfigsExtraDetail`
--

DROP TABLE IF EXISTS `Vi_DPA_VehicleProfileEntityConfigsExtraDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_VehicleProfileEntityConfigsExtraDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_VehicleProfileEntityConfigsExtraDetail` AS SELECT 
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
 1 AS `PermitIssuerId`,
 1 AS `HUBId`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `DriverId`,
 1 AS `ActENUM`,
 1 AS `ScenarioId`,
 1 AS `ConfigBaseId`,
 1 AS `Value`,
 1 AS `IsOverridable`*/;
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
 1 AS `ServiceCategory`,
 1 AS `IssuedDate_UTC`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_VehicleProfileSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_VehicleProfileSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_VehicleProfileSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_VehicleProfileSummary` AS SELECT 
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
 1 AS `VehicleType`,
 1 AS `EntityConfigsCount`,
 1 AS `CVOVehiclesCount`,
 1 AS `PermitsCount`,
 1 AS `VehicleDriversCount`,
 1 AS `VehicleFeaturesCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPA_VehicleSummary`
--

DROP TABLE IF EXISTS `Vi_DPA_VehicleSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPA_VehicleSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPA_VehicleSummary` AS SELECT 
 1 AS `Id`,
 1 AS `Plate`,
 1 AS `VIN`,
 1 AS `Make`,
 1 AS `Model`,
 1 AS `Province`,
 1 AS `Color`,
 1 AS `Year`,
 1 AS `Cargo_Height`,
 1 AS `Cargo_Weight`,
 1 AS `Cargo_Length`,
 1 AS `Cargo_Width`,
 1 AS `Capacity_Passengers`,
 1 AS `Capacity_Luggage`,
 1 AS `VehicleType`,
 1 AS `PermitsCount`,
 1 AS `CVOVehiclesCount`,
 1 AS `VehicleDriversCount`,
 1 AS `VehicleFeaturesCount`*/;
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
-- Temporary view structure for view `Vi_DPC_PermitIssuersEntity`
--

DROP TABLE IF EXISTS `Vi_DPC_PermitIssuersEntity`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_PermitIssuersEntity`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_PermitIssuersEntity` AS SELECT 
 1 AS `Id`,
 1 AS `PermitIssuerId`,
 1 AS `EntityId`,
 1 AS `Title`,
 1 AS `PartyCode`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_DPC_PermitRequestSuperDetail`
--

DROP TABLE IF EXISTS `Vi_DPC_PermitRequestSuperDetail`;
/*!50001 DROP VIEW IF EXISTS `Vi_DPC_PermitRequestSuperDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_DPC_PermitRequestSuperDetail` AS SELECT 
 1 AS `PermitId`,
 1 AS `PermitCode`,
 1 AS `IssuedDate_UTC`,
 1 AS `ExpiryDate_UTC`,
 1 AS `ConditionENUM`,
 1 AS `ConditionEndDate_UTC`,
 1 AS `MediaRecordKey`,
 1 AS `PermitStatusId`,
 1 AS `RequestStatusId`,
 1 AS `RequestId`,
 1 AS `RequesteeUserId`,
 1 AS `RequesteeEntityId`,
 1 AS `RequesteeActENUM`,
 1 AS `RequestStatus`,
 1 AS `RequestStatusReason`,
 1 AS `RequesterUserId`,
 1 AS `RequesterEntityId`,
 1 AS `RequestType`,
 1 AS `RequestExpiryTime`,
 1 AS `HUBId`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `VehicleId`,
 1 AS `DriverId`,
 1 AS `PermitHolderActENUM`,
 1 AS `PermitIssuerId`,
 1 AS `PermitIssuerTitle`,
 1 AS `PermitTypeId`,
 1 AS `PermitTypeActENUM`,
 1 AS `PermitTypeActivityClassENUM`,
 1 AS `PermitTypeTitle`,
 1 AS `PermiTypeAllowedServiceCategory`,
 1 AS `IsPermitExtendable`,
 1 AS `IsPermitProfileDependant`,
 1 AS `PermitServiceCategory`,
 1 AS `RecordDeleted`*/;
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
-- Temporary view structure for view `Vi_SPC_CVOPermits`
--

DROP TABLE IF EXISTS `Vi_SPC_CVOPermits`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_CVOPermits`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_CVOPermits` AS SELECT 
 1 AS `Id`,
 1 AS `CVOId`,
 1 AS `DistributorId`,
 1 AS `VehicleId`,
 1 AS `DriverId`,
 1 AS `PermitTypeId`,
 1 AS `PermitIssuerId`,
 1 AS `PermitCode`,
 1 AS `ServiceCategory`,
 1 AS `PermitIssuedDate`,
 1 AS `PermitStatusId`,
 1 AS `ExpiryDate_UTC`,
 1 AS `PermitConditionENUM`,
 1 AS `PermitConditionEndDate`,
 1 AS `StatusCategory`,
 1 AS `ConditionTitle`,
 1 AS `DaysUntilExpiry`,
 1 AS `IsExpiringSoon`,
 1 AS `PermitTypeTitle`,
 1 AS `ActivityClassENUM`,
 1 AS `AllowedServiceCategories`,
 1 AS `Extendable`,
 1 AS `ProfileDependant`,
 1 AS `IssuerEntityId`,
 1 AS `IssuerTitle`,
 1 AS `CVOTitle`,
 1 AS `DistributorTitle`,
 1 AS `VehiclePlate`,
 1 AS `DriverFullName`,
 1 AS `DriverLicense`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `ModifiedAt_UTC`,
 1 AS `RecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_DistributorListSummary`
--

DROP TABLE IF EXISTS `Vi_SPC_DistributorListSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DistributorListSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_DistributorListSummary` AS SELECT 
 1 AS `Id`,
 1 AS `EntityId`,
 1 AS `EntityTitle`,
 1 AS `City`,
 1 AS `Province`,
 1 AS `Phone_fsx`,
 1 AS `Email_fsx`,
 1 AS `CVOCount`,
 1 AS `DriverCount`,
 1 AS `HUBCount`,
 1 AS `TotalPermitCount`,
 1 AS `ExpiredPermitCount`,
 1 AS `ValidPermitCount`,
 1 AS `SuspendedPermitCount`,
 1 AS `RevokedPermitCount`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `ModifiedAt_UTC`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_DistributorPermits`
--

DROP TABLE IF EXISTS `Vi_SPC_DistributorPermits`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DistributorPermits`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_DistributorPermits` AS SELECT 
 1 AS `Id`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `VehicleId`,
 1 AS `DriverId`,
 1 AS `PermitTypeId`,
 1 AS `PermitIssuerId`,
 1 AS `PermitCode`,
 1 AS `ServiceCategory`,
 1 AS `PermitIssuedDate`,
 1 AS `PermitStatusId`,
 1 AS `ExpiryDate_UTC`,
 1 AS `PermitConditionENUM`,
 1 AS `PermitConditionEndDate`,
 1 AS `StatusCategory`,
 1 AS `ConditionTitle`,
 1 AS `DaysUntilExpiry`,
 1 AS `IsExpiringSoon`,
 1 AS `PermitTypeTitle`,
 1 AS `ActivityClassENUM`,
 1 AS `AllowedServiceCategories`,
 1 AS `Extendable`,
 1 AS `ProfileDependant`,
 1 AS `IssuerEntityId`,
 1 AS `IssuerTitle`,
 1 AS `DistributorTitle`,
 1 AS `CVOTitle`,
 1 AS `VehiclePlate`,
 1 AS `DriverFullName`,
 1 AS `DriverLicense`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `ModifiedAt_UTC`,
 1 AS `RecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_DriverCVOs`
--

DROP TABLE IF EXISTS `Vi_SPC_DriverCVOs`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DriverCVOs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_DriverCVOs` AS SELECT 
 1 AS `AssignmentId`,
 1 AS `DriverId`,
 1 AS `CVOId`,
 1 AS `AssignmentStartDate`,
 1 AS `AssignmentEndDate`,
 1 AS `HasRule`,
 1 AS `AssignmentRecordKey`,
 1 AS `AssignmentStatus`,
 1 AS `IsPrimaryCVO`,
 1 AS `CVOEntityId`,
 1 AS `CVOTitle`,
 1 AS `CVOCity`,
 1 AS `CVOProvince`,
 1 AS `CVOPhone`,
 1 AS `CVOEmail`,
 1 AS `DriverFullName`,
 1 AS `CreatedAt_UTC`,
 1 AS `ModifiedAt_UTC`,
 1 AS `RecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_DriverDLVC`
--

DROP TABLE IF EXISTS `Vi_SPC_DriverDLVC`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DriverDLVC`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_DriverDLVC` AS SELECT 
 1 AS `Id`,
 1 AS `DriverId`,
 1 AS `VehicleTypeENUM`,
 1 AS `VehicleTypeTitle`,
 1 AS `PermitId`,
 1 AS `PermitCode`,
 1 AS `PermitTypeTitle`,
 1 AS `PermitExpiryDate`,
 1 AS `PermitConditionENUM`,
 1 AS `PermitStatus`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `ModifiedAt_UTC`,
 1 AS `RecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_DriverDistributors`
--

DROP TABLE IF EXISTS `Vi_SPC_DriverDistributors`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DriverDistributors`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_DriverDistributors` AS SELECT 
 1 AS `AssignmentId`,
 1 AS `DriverId`,
 1 AS `DistributorId`,
 1 AS `AssignmentStartDate`,
 1 AS `AssignmentEndDate`,
 1 AS `AssignmentRecordKey`,
 1 AS `AssignmentStatus`,
 1 AS `DistributorEntityId`,
 1 AS `DistributorTitle`,
 1 AS `DistributorCity`,
 1 AS `DistributorProvince`,
 1 AS `DistributorPhone`,
 1 AS `DistributorEmail`,
 1 AS `PermitCount`,
 1 AS `CreatedAt_UTC`,
 1 AS `ModifiedAt_UTC`,
 1 AS `RecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_DriverListSummary`
--

DROP TABLE IF EXISTS `Vi_SPC_DriverListSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DriverListSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_DriverListSummary` AS SELECT 
 1 AS `Id`,
 1 AS `UserId`,
 1 AS `PersonCVOId`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `FullName`,
 1 AS `Firstname`,
 1 AS `Lastname`,
 1 AS `Username`,
 1 AS `Email`,
 1 AS `CellPhone`,
 1 AS `DriverLicense`,
 1 AS `DriverLicenseExpiry`,
 1 AS `DriverLicenseStatus`,
 1 AS `DriverLicenseConditionENUM`,
 1 AS `UserFullName`,
 1 AS `UserEmail`,
 1 AS `UserUsername`,
 1 AS `PrimaryCVOTitle`,
 1 AS `PrimaryCVOCity`,
 1 AS `TotalPermitCount`,
 1 AS `ValidPermitCount`,
 1 AS `ExpiredPermitCount`,
 1 AS `SuspendedPermitCount`,
 1 AS `RevokedPermitCount`,
 1 AS `NextValidPermitExpiry`,
 1 AS `VehicleCount`,
 1 AS `DistributorCount`,
 1 AS `CVOCount`,
 1 AS `LicensedVehicleTypeCount`,
 1 AS `LicensedVehicleTypeBadges`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_DriverPermits`
--

DROP TABLE IF EXISTS `Vi_SPC_DriverPermits`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DriverPermits`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_DriverPermits` AS SELECT 
 1 AS `Id`,
 1 AS `DriverId`,
 1 AS `PermitCode`,
 1 AS `ServiceCategory`,
 1 AS `PermitIssuedDate`,
 1 AS `PermitStatusId`,
 1 AS `ExpiryDate_UTC`,
 1 AS `PermitConditionENUM`,
 1 AS `PermitConditionEndDate`,
 1 AS `StatusCategory`,
 1 AS `ConditionTitle`,
 1 AS `DaysUntilExpiry`,
 1 AS `IsExpiringSoon`,
 1 AS `PermitTypeId`,
 1 AS `PermitTypeTitle`,
 1 AS `ActivityClassENUM`,
 1 AS `AllowedServiceCategories`,
 1 AS `Extendable`,
 1 AS `ProfileDependant`,
 1 AS `PermitIssuerId`,
 1 AS `IssuerEntityId`,
 1 AS `IssuerTitle`,
 1 AS `VehicleId`,
 1 AS `VehiclePlate`,
 1 AS `VehicleMake`,
 1 AS `VehicleModel`,
 1 AS `CVOId`,
 1 AS `CVOEntityId`,
 1 AS `CVOTitle`,
 1 AS `DistributorId`,
 1 AS `DistributorEntityId`,
 1 AS `DistributorTitle`,
 1 AS `HUBId`,
 1 AS `HUBEntityId`,
 1 AS `HUBTitle`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `ModifiedAt_UTC`,
 1 AS `RecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_DriverProfile`
--

DROP TABLE IF EXISTS `Vi_SPC_DriverProfile`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DriverProfile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_DriverProfile` AS SELECT 
 1 AS `Id`,
 1 AS `UserId`,
 1 AS `PersonCVOId`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `FullName`,
 1 AS `DriverLicense`,
 1 AS `DriverLicenseStatus`,
 1 AS `DriverLicenseExpiry`,
 1 AS `DriverLicenseConditionENUM`,
 1 AS `UserFirstname`,
 1 AS `UserLastname`,
 1 AS `UserUsername`,
 1 AS `UserEmail`,
 1 AS `UserCellPhone`,
 1 AS `UserEmailConfirmed`,
 1 AS `UserCellPhoneConfirmed`,
 1 AS `PrimaryCVOEntityId`,
 1 AS `PrimaryCVOTitle`,
 1 AS `PrimaryCVOCity`,
 1 AS `PrimaryCVOProvince`,
 1 AS `PrimaryCVOPhone`,
 1 AS `PrimaryCVOEmail`,
 1 AS `TotalPermitCount`,
 1 AS `ValidPermitCount`,
 1 AS `ExpiredPermitCount`,
 1 AS `SuspendedPermitCount`,
 1 AS `RevokedPermitCount`,
 1 AS `VehicleCount`,
 1 AS `DistributorCount`,
 1 AS `CVOCount`,
 1 AS `LicensedVehicleTypeCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_DriverVehicles`
--

DROP TABLE IF EXISTS `Vi_SPC_DriverVehicles`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DriverVehicles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_DriverVehicles` AS SELECT 
 1 AS `AssignmentId`,
 1 AS `DriverId`,
 1 AS `VehicleId`,
 1 AS `AssignmentStartDate`,
 1 AS `AssignmentEndDate`,
 1 AS `AssignmentRecordKey`,
 1 AS `AssignmentStatus`,
 1 AS `DaysUntilExpiry`,
 1 AS `VehiclePlate`,
 1 AS `VehicleVIN`,
 1 AS `VehicleMake`,
 1 AS `VehicleModel`,
 1 AS `VehicleYear`,
 1 AS `VehicleType`,
 1 AS `Color`,
 1 AS `VehicleCVOId`,
 1 AS `VehicleCVOTitle`,
 1 AS `VehiclePermitCount`,
 1 AS `CreatedAt_UTC`,
 1 AS `ModifiedAt_UTC`,
 1 AS `RecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_HUBDistributors`
--

DROP TABLE IF EXISTS `Vi_SPC_HUBDistributors`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_HUBDistributors`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_HUBDistributors` AS SELECT 
 1 AS `AssignmentId`,
 1 AS `HUBId`,
 1 AS `DistributorId`,
 1 AS `ParticipationCategory`,
 1 AS `HasRule`,
 1 AS `AssignmentStartDate`,
 1 AS `AssignmentEndDate`,
 1 AS `AssignmentStatus`,
 1 AS `DistributorEntityId`,
 1 AS `DistributorTitle`,
 1 AS `DistributorCity`,
 1 AS `DistributorProvince`,
 1 AS `DistributorPhone`,
 1 AS `DistributorEmail`,
 1 AS `DistributorCVOCount`,
 1 AS `DistributorPermitCount`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `ModifiedAt_UTC`,
 1 AS `RecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_HUBListSummary`
--

DROP TABLE IF EXISTS `Vi_SPC_HUBListSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_HUBListSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_HUBListSummary` AS SELECT 
 1 AS `Id`,
 1 AS `EntityId`,
 1 AS `PartyCode`,
 1 AS `EntityTitle`,
 1 AS `Address_fsx`,
 1 AS `City`,
 1 AS `Province`,
 1 AS `Country`,
 1 AS `PostalCode_fsx`,
 1 AS `Phone_fsx`,
 1 AS `FaxNumber_fsx`,
 1 AS `Email_fsx`,
 1 AS `DistributorCount`,
 1 AS `TotalPermitCount`,
 1 AS `ExpiredPermitCount`,
 1 AS `ValidPermitCount`,
 1 AS `SuspendedPermitCount`,
 1 AS `RevokedPermitCount`,
 1 AS `CVOLinkCount`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `ModifiedAt_UTC`,
 1 AS `RecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_HUBPermits`
--

DROP TABLE IF EXISTS `Vi_SPC_HUBPermits`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_HUBPermits`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_HUBPermits` AS SELECT 
 1 AS `Id`,
 1 AS `HUBId`,
 1 AS `DistributorId`,
 1 AS `CVOId`,
 1 AS `VehicleId`,
 1 AS `DriverId`,
 1 AS `PermitTypeId`,
 1 AS `PermitIssuerId`,
 1 AS `PermitCode`,
 1 AS `ServiceCategory`,
 1 AS `PermitIssuedDate`,
 1 AS `PermitStatusId`,
 1 AS `ExpiryDate_UTC`,
 1 AS `PermitConditionENUM`,
 1 AS `PermitConditionEndDate`,
 1 AS `StatusCategory`,
 1 AS `ConditionTitle`,
 1 AS `DaysUntilExpiry`,
 1 AS `IsExpiringSoon`,
 1 AS `PermitTypeTitle`,
 1 AS `ActivityClassENUM`,
 1 AS `AllowedServiceCategories`,
 1 AS `Extendable`,
 1 AS `ProfileDependant`,
 1 AS `IssuerEntityId`,
 1 AS `IssuerTitle`,
 1 AS `ActENUM`,
 1 AS `ScenarioId`,
 1 AS `ScenarioDescription`,
 1 AS `HUBName`,
 1 AS `VehiclePlate`,
 1 AS `DriverFullName`,
 1 AS `DriverLicense`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `ModifiedAt_UTC`,
 1 AS `RecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_HUBProfile`
--

DROP TABLE IF EXISTS `Vi_SPC_HUBProfile`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_HUBProfile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_HUBProfile` AS SELECT 
 1 AS `Id`,
 1 AS `EntityId`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `PartyCode`,
 1 AS `EntityTitle`,
 1 AS `Address_fsx`,
 1 AS `City`,
 1 AS `Province`,
 1 AS `Country`,
 1 AS `PostalCode_fsx`,
 1 AS `Phone_fsx`,
 1 AS `FaxNumber_fsx`,
 1 AS `Email_fsx`,
 1 AS `Discriminator`,
 1 AS `DistributorCount`,
 1 AS `PermitCount`,
 1 AS `ValidPermitCount`,
 1 AS `ExpiredPermitCount`,
 1 AS `SuspendedPermitCount`,
 1 AS `RevokedPermitCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_PermitLatestStatus`
--

DROP TABLE IF EXISTS `Vi_SPC_PermitLatestStatus`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_PermitLatestStatus`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_PermitLatestStatus` AS SELECT 
 1 AS `PermitStatusId`,
 1 AS `PermitId`,
 1 AS `ExpiryDate_UTC`,
 1 AS `ConditionENUM`,
 1 AS `ConditionEndDate_UTC`,
 1 AS `MediaRecordKey`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `StatusCategory`,
 1 AS `ConditionTitle`,
 1 AS `IsCurrentlyValid`,
 1 AS `DaysUntilExpiry`,
 1 AS `IsExpiringSoon`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_VehicleCVOs`
--

DROP TABLE IF EXISTS `Vi_SPC_VehicleCVOs`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_VehicleCVOs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_VehicleCVOs` AS SELECT 
 1 AS `AssignmentId`,
 1 AS `VehicleId`,
 1 AS `CVOId`,
 1 AS `AssignmentStartDate`,
 1 AS `AssignmentEndDate`,
 1 AS `AssignmentRecordKey`,
 1 AS `AssignmentStatus`,
 1 AS `EntityId`,
 1 AS `CVOTitle`,
 1 AS `CVOPartyCode`,
 1 AS `CVOCity`,
 1 AS `CVOProvince`,
 1 AS `CVOCountry`,
 1 AS `CVOPhone`,
 1 AS `CVOEmail`,
 1 AS `CreatedAt_UTC`,
 1 AS `ModifiedAt_UTC`,
 1 AS `RecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_VehicleDrivers`
--

DROP TABLE IF EXISTS `Vi_SPC_VehicleDrivers`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_VehicleDrivers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_VehicleDrivers` AS SELECT 
 1 AS `AssignmentId`,
 1 AS `VehicleId`,
 1 AS `DriverId`,
 1 AS `AssignmentStartDate`,
 1 AS `AssignmentEndDate`,
 1 AS `AssignmentRecordKey`,
 1 AS `AssignmentStatus`,
 1 AS `Firstname`,
 1 AS `Lastname`,
 1 AS `FullName`,
 1 AS `Username`,
 1 AS `Email`,
 1 AS `CellPhone`,
 1 AS `DriverLicense`,
 1 AS `UserId`,
 1 AS `UserFullName`,
 1 AS `UserEmail`,
 1 AS `DriverCVOId`,
 1 AS `DriverCVOTitle`,
 1 AS `DriverCVOCity`,
 1 AS `CreatedAt_UTC`,
 1 AS `ModifiedAt_UTC`,
 1 AS `RecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_VehicleFeatures`
--

DROP TABLE IF EXISTS `Vi_SPC_VehicleFeatures`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_VehicleFeatures`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_VehicleFeatures` AS SELECT 
 1 AS `AssignmentId`,
 1 AS `VehicleId`,
 1 AS `FeatureId`,
 1 AS `FeatureTitle`,
 1 AS `FeatureRecordKey`,
 1 AS `AssignmentStartDate`,
 1 AS `AssignmentEndDate`,
 1 AS `AssignmentStatus`,
 1 AS `AssignmentRecordKey`,
 1 AS `FeatureUsageCount`,
 1 AS `CreatedAt_UTC`,
 1 AS `ModifiedAt_UTC`,
 1 AS `RecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_VehicleListSummary`
--

DROP TABLE IF EXISTS `Vi_SPC_VehicleListSummary`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_VehicleListSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_VehicleListSummary` AS SELECT 
 1 AS `Id`,
 1 AS `Plate`,
 1 AS `VIN`,
 1 AS `Make`,
 1 AS `Model`,
 1 AS `Year`,
 1 AS `VehicleType`,
 1 AS `Color`,
 1 AS `Province`,
 1 AS `Cargo_Height`,
 1 AS `Cargo_Weight`,
 1 AS `Cargo_Length`,
 1 AS `Cargo_Width`,
 1 AS `Capacity_Passengers`,
 1 AS `Capacity_Luggage`,
 1 AS `CVOId`,
 1 AS `CVOTitle`,
 1 AS `CVOCity`,
 1 AS `CVOProvince`,
 1 AS `DriverCount`,
 1 AS `ExpiredPermitCount`,
 1 AS `ValidPermitCount`,
 1 AS `TotalPermitCount`,
 1 AS `FeatureBadgesTop3`,
 1 AS `FeatureCount`,
 1 AS `InspectionStatus`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `ModifiedAt_UTC`,
 1 AS `RecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_VehiclePermits`
--

DROP TABLE IF EXISTS `Vi_SPC_VehiclePermits`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_VehiclePermits`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_VehiclePermits` AS SELECT 
 1 AS `Id`,
 1 AS `VehicleId`,
 1 AS `PermitTypeId`,
 1 AS `PermitTypeTitle`,
 1 AS `ActivityClassENUM`,
 1 AS `AllowedServiceCategories`,
 1 AS `Extendable`,
 1 AS `ProfileDependant`,
 1 AS `PermitIssuerId`,
 1 AS `PermitIssuerEntityId`,
 1 AS `PermitIssuerTitle`,
 1 AS `PermitStatusId`,
 1 AS `ExpiryDate_UTC`,
 1 AS `PermitConditionENUM`,
 1 AS `PermitConditionEndDate`,
 1 AS `StatusCategory`,
 1 AS `ConditionTitle`,
 1 AS `DaysUntilExpiry`,
 1 AS `IsExpiringSoon`,
 1 AS `PermitCode`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `ModifiedAt_UTC`,
 1 AS `RecordDeleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SPC_VehicleProfile`
--

DROP TABLE IF EXISTS `Vi_SPC_VehicleProfile`;
/*!50001 DROP VIEW IF EXISTS `Vi_SPC_VehicleProfile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SPC_VehicleProfile` AS SELECT 
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
 1 AS `VehicleType`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `PrimaryCVOId`,
 1 AS `PrimaryCVOTitle`,
 1 AS `PrimaryCVORecordKey`,
 1 AS `CVOEntityId`,
 1 AS `CVOEntityTitle`,
 1 AS `ExpiredPermitCount`,
 1 AS `ValidPermitCount`,
 1 AS `TotalPermitCount`,
 1 AS `NextPermitExpiry`,
 1 AS `DriverCount`,
 1 AS `FeatureCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SYNC_AAA_FullUserInfo`
--

DROP TABLE IF EXISTS `Vi_SYNC_AAA_FullUserInfo`;
/*!50001 DROP VIEW IF EXISTS `Vi_SYNC_AAA_FullUserInfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SYNC_AAA_FullUserInfo` AS SELECT 
 1 AS `Id`,
 1 AS `Firstname_fsx`,
 1 AS `Lastname_fsx`,
 1 AS `Username`,
 1 AS `Email_fsx`,
 1 AS `Email_hash`,
 1 AS `EmailConfirmed`,
 1 AS `CellPhone_fsx`,
 1 AS `CellPhone_hash`,
 1 AS `CellPhoneConfirmed`,
 1 AS `IssuedBy`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`,
 1 AS `UserId`,
 1 AS `PasswordHash`,
 1 AS `PasswordTemp`,
 1 AS `PasswordTempExpires`,
 1 AS `PasswordTempFor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Vi_SYNC_PermitStatusVerifications`
--

DROP TABLE IF EXISTS `Vi_SYNC_PermitStatusVerifications`;
/*!50001 DROP VIEW IF EXISTS `Vi_SYNC_PermitStatusVerifications`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vi_SYNC_PermitStatusVerifications` AS SELECT 
 1 AS `Id`,
 1 AS `PermitStatusId`,
 1 AS `ApproverUserId`,
 1 AS `ApproverEntityId`,
 1 AS `ApproverActENUM`,
 1 AS `ApprovalStatus`,
 1 AS `ApprovalStatusReason`,
 1 AS `RecordKey`,
 1 AS `CreatedAt_UTC`,
 1 AS `CreatedBy`,
 1 AS `ModifiedAt_UTC`,
 1 AS `ModifiedBy`,
 1 AS `RecordDeleted`*/;
SET character_set_client = @saved_cs_client;

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
/*!50001 VIEW `Vi_BK_AAA_UserEntityProfileCheck` AS select distinct `EP`.`Id` AS `Id`,`EP`.`Id` AS `EntityId`,`EP`.`Title` AS `EntityTitle`,`UER`.`UserId` AS `UserId` from ((`H_AAA_UserEntityRoles` `UER` join `H_AAA_EntityRoles` `ER` on((`UER`.`EntityRoleId` = `ER`.`Id`))) join `H_AAA_EntityProfile` `EP` on((`ER`.`EntityId` = `EP`.`Id`))) where (((0 <> `UER`.`RecordDeleted`) is not true) and ((0 <> `ER`.`RecordDeleted`) is not true)) */;
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
-- Final view structure for view `Vi_BK_PermitStatusCheck`
--

/*!50001 DROP VIEW IF EXISTS `Vi_BK_PermitStatusCheck`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_BK_PermitStatusCheck` AS select `PS`.`Id` AS `Id`,`PT`.`Id` AS `PermitTypeId`,`P`.`Id` AS `PermitId`,`P`.`HUBId` AS `PermitHUBId`,`P`.`DistributorId` AS `PermitDistributorId`,`P`.`CVOId` AS `PermitCVOId`,`P`.`VehicleId` AS `PermitVehicleId`,`P`.`DriverId` AS `PermitDriverId`,`PT`.`ActivityClassENUM` AS `ActivityClassENUM`,`P`.`PermitIssuerId` AS `PermitPermitIssuerId`,`P`.`Code` AS `Code`,`P`.`ServiceCategory` AS `ServiceCategory`,`PT`.`AllowedServiceCategories` AS `AllowedServiceCategories`,`PT`.`Extendable` AS `Extendable`,`PT`.`ProfileDependant` AS `ProfileDependant`,`PSMED`.`ExpiryDate_UTC` AS `ExpiryDate_UTC` from (((((select max(`H_Permits`.`Id`) AS `PermitId` from `H_Permits` group by `H_Permits`.`HUBId`,`H_Permits`.`DistributorId`,`H_Permits`.`CVOId`,`H_Permits`.`VehicleId`,`H_Permits`.`DriverId`,`H_Permits`.`PermitTypeId`) `PMI` join `H_Permits` `P` on((`PMI`.`PermitId` = `P`.`Id`))) join `H_PermitTypes` `PT` on((`P`.`PermitTypeId` = `PT`.`Id`))) join (select `H_PermitStatuses`.`PermitId` AS `PermitId`,max(`H_PermitStatuses`.`ExpiryDate_UTC`) AS `ExpiryDate_UTC` from `H_PermitStatuses` group by `H_PermitStatuses`.`PermitId`) `PSMED` on((`PSMED`.`PermitId` = `P`.`Id`))) join `H_PermitStatuses` `PS` on(((`PSMED`.`PermitId` = `PS`.`PermitId`) and (`PSMED`.`ExpiryDate_UTC` = `PS`.`ExpiryDate_UTC`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_BK_RequestStatusCheck`
--

/*!50001 DROP VIEW IF EXISTS `Vi_BK_RequestStatusCheck`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_BK_RequestStatusCheck` AS select `RS`.`Id` AS `Id`,`RS`.`RequestId` AS `RequestId`,`RB`.`RequesterUserId` AS `RequesterUserId`,`RB`.`RequesterEntityId` AS `RequesterEntityId`,`RB`.`RequesterActENUM` AS `RequesterActENUM`,`RS`.`RequesteeUserId` AS `RequesteeUserId`,`RS`.`RequesteeEntityId` AS `RequesteeEntityId`,`RS`.`RequesteeActENUM` AS `RequesteeActENUM`,`RB`.`RequestType` AS `RequestType`,`RB`.`MetaData` AS `MetaData`,`RB`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`RB`.`Expiry_UTC` AS `ExpiryDate_UTC`,`RS`.`Status` AS `Status`,`RS`.`StatusReason` AS `StatusReason` from (`H_RequestBases` `RB` join `H_RequestStatuses` `RS` on((`RS`.`RequestId` = `RB`.`Id`))) where (((0 <> `RB`.`RecordDeleted`) is not true) and ((0 <> `RS`.`RecordDeleted`) is not true)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_BK_RequestSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_BK_RequestSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_BK_RequestSummary` AS select `RB`.`Id` AS `RequestId`,`RB`.`RequestType` AS `RequestType`,`RB`.`RequesterUserId` AS `RequesterUserId`,`RB`.`RequesterEntityId` AS `RequesterEntityId`,`RB`.`RequesterActENUM` AS `RequesterActENUM`,`RS`.`Id` AS `RequestStatusId`,`RS`.`RequesteeUserId` AS `RequesteeUserId`,`RS`.`RequesteeEntityId` AS `RequesteeEntityId`,`RS`.`RequesteeActENUM` AS `RequesteeActENUM`,`RS`.`Status` AS `Status`,`RS`.`StatusReason` AS `StatusReason`,`RB`.`Expiry_UTC` AS `ExpiryDate_UTC`,`RB`.`CreatedAt_UTC` AS `RequestCreatedAt_UTC`,`RS`.`CreatedAt_UTC` AS `StatusCreatedAt_UTC`,`RS`.`ModifiedAt_UTC` AS `StatusModifiedAt_UTC`,(case when ((`RB`.`RequestType` = 1) and (`RS`.`RequesteeActENUM` is null)) then concat('UI',convert(lpad(upper(conv(`RB`.`Id`,10,36)),6,'0') using utf8mb4)) when ((`RB`.`RequestType` = 1) and (`RS`.`RequesteeActENUM` is not null)) then concat('AI',convert(lpad(upper(conv(`RB`.`Id`,10,36)),6,'0') using utf8mb4)) else NULL end) AS `InvitationCodeStem` from ((`H_RequestBases` `RB` join (select `H_RequestStatuses`.`RequestId` AS `RequestId`,max(`H_RequestStatuses`.`Id`) AS `LatestStatusId` from `H_RequestStatuses` where ((0 <> `H_RequestStatuses`.`RecordDeleted`) is not true) group by `H_RequestStatuses`.`RequestId`) `LatestRS` on((`LatestRS`.`RequestId` = `RB`.`Id`))) join `H_RequestStatuses` `RS` on((`RS`.`Id` = `LatestRS`.`LatestStatusId`))) where ((0 <> `RB`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_BK_SYNC_PermitStatusVerifications-DoNotUse`
--

/*!50001 DROP VIEW IF EXISTS `Vi_BK_SYNC_PermitStatusVerifications-DoNotUse`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_BK_SYNC_PermitStatusVerifications-DoNotUse` AS select `PSV`.`Id` AS `Id`,`PSV`.`PermitStatusId` AS `PermitStatusId`,`PSV`.`RequestStatusId` AS `RequestStatusId`,`RB`.`RequesterUserId` AS `RequesterUserId`,`RB`.`RequesterEntityId` AS `RequesterEntityId`,`RB`.`RequesterActENUM` AS `RequesterActENUM`,`RS`.`RequesteeUserId` AS `RequesteeUserId`,`RS`.`RequesteeEntityId` AS `RequesteeEntityId`,`RS`.`RequesteeActENUM` AS `RequesteeActENUM`,`RB`.`RequestType` AS `RequestType`,`RB`.`Expiry_UTC` AS `ExpiryDate_UTC`,`RS`.`Status` AS `Status`,`RS`.`StatusReason` AS `StatusReason`,`PSV`.`RecordKey` AS `RecordKey`,`PSV`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`PSV`.`CreatedBy` AS `CreatedBy`,`PSV`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`PSV`.`ModifiedBy` AS `ModifiedBy`,`PSV`.`RecordDeleted` AS `RecordDeleted` from ((`H_PermitStatusVerifications` `PSV` join `H_RequestStatuses` `RS` on((`PSV`.`RequestStatusId` = `RS`.`Id`))) join `H_RequestBases` `RB` on((`RS`.`RequestId` = `RB`.`Id`))) where (((0 <> `PSV`.`RecordDeleted`) is not true) and ((0 <> `RS`.`RecordDeleted`) is not true) and ((0 <> `RB`.`RecordDeleted`) is not true)) */;
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
-- Final view structure for view `Vi_DPA_ActionConfigBaseEntityConfigsExtraDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_ActionConfigBaseEntityConfigsExtraDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_ActionConfigBaseEntityConfigsExtraDetail` AS select `BaseTable`.`Id` AS `ActionConfigBaseId`,`BaseTable`.`Code` AS `ActionConfigBaseCode`,`BaseTable`.`Description` AS `ActionConfigBaseDescription`,`RJT`.`PermitIssuerId` AS `PermitIssuerId`,`RJT`.`HUBId` AS `HUBId`,`RJT`.`DistributorId` AS `DistributorId`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`VehicleId` AS `VehicleId`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`ActENUM` AS `ActENUM`,`RJT`.`ScenarioId` AS `ScenarioId`,`RJT`.`Value` AS `Value`,`RJT`.`IsOverridable` AS `IsOverridable` from (`H_CFG_ActionConfigBases` `BaseTable` join `H_CFG_EntityConfigs` `RJT` on(((`RJT`.`ConfigBaseId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_ActionConfigBaseSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Code` AS `Code`,`BaseTable`.`Description` AS `Description`,`TempQuery0`.`RelatedEntityCount` AS `EntityConfigsCount`,`TempQuery1`.`RelatedEntityCount` AS `GlobalConfigsCount` from ((`H_CFG_ActionConfigBases` `BaseTable` left join (select `RT0`.`ConfigBaseId` AS `ConfigBaseId`,count(`RT0`.`ConfigBaseId`) AS `RelatedEntityCount` from `H_CFG_EntityConfigs` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`ConfigBaseId`) `TempQuery0` on((`TempQuery0`.`ConfigBaseId` = `BaseTable`.`Id`))) left join (select `RT1`.`ConfigBaseId` AS `ConfigBaseId`,count(`RT1`.`ConfigBaseId`) AS `RelatedEntityCount` from `H_CFG_GlobalConfigs` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`ConfigBaseId`) `TempQuery1` on((`TempQuery1`.`ConfigBaseId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_CVO` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`EntityId` AS `EntityId`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator` from (`H_CVOs` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_CVODriversSuperDetail` AS select `BaseTable`.`Id` AS `CVOId`,`BaseTable`.`EntityId` AS `CVOEntityId`,`AP`.`Title` AS `CVOEntityTitle`,`AP`.`Address_fsx` AS `CVOEntityAddress_fsx`,`AP`.`City` AS `CVOEntityCity`,`AP`.`Province` AS `CVOEntityProvince`,`AP`.`Country` AS `CVOEntityCountry`,`AP`.`PostalCode_fsx` AS `CVOEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `CVOEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `CVOEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `CVOEntityEmail_fsx`,`AP`.`Discriminator` AS `CVOEntityDiscriminator`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`HasRule` AS `HasRule`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`RJT`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`PJT0`.`UserId` AS `DriverUserId`,`PJT0`.`PersonCVOId` AS `DriverPersonCVOId`,`PUI_0_0`.`Firstname_fsx` AS `DriverFirstname_fsx`,`PUI_0_0`.`Lastname_fsx` AS `DriverLastname_fsx`,`PUI_0_0`.`Username` AS `DriverUsername`,`PUI_0_0`.`Email_fsx` AS `DriverEmail_fsx`,`PUI_0_0`.`Email_hash` AS `DriverEmail_hash`,`PUI_0_0`.`EmailConfirmed` AS `DriverEmailConfirmed`,`PUI_0_0`.`CellPhone_fsx` AS `DriverCellPhone_fsx`,`PUI_0_0`.`CellPhone_hash` AS `DriverCellPhone_hash`,`PUI_0_0`.`CellPhoneConfirmed` AS `DriverCellPhoneConfirmed`,`PUI_0_0`.`IssuedBy` AS `DriverIssuedBy`,`PUI_0_0`.`RecordKey` AS `DriverRecordKey`,`PUI_0_0`.`CreatedAt_UTC` AS `DriverCreatedAt_UTC`,`PUI_0_0`.`CreatedBy` AS `DriverCreatedBy`,`PUI_0_0`.`ModifiedAt_UTC` AS `DriverModifiedAt_UTC`,`PUI_0_0`.`ModifiedBy` AS `DriverModifiedBy`,`PUI_0_0`.`RecordDeleted` AS `DriverRecordDeleted` from ((((`H_CVOs` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_CVODrivers` `RJT` on(((`RJT`.`CVOId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_Drivers` `PJT0` on(((`RJT`.`DriverId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `PUI_0_0` on(((`PJT0`.`UserId` = `PUI_0_0`.`Id`) and ((0 <> `PUI_0_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_CVOPermitsExtraDetail` AS select `BaseTable`.`Id` AS `CVOId`,`BaseTable`.`EntityId` AS `CVOEntityId`,`AP`.`Title` AS `CVOEntityTitle`,`AP`.`Address_fsx` AS `CVOEntityAddress_fsx`,`AP`.`City` AS `CVOEntityCity`,`AP`.`Province` AS `CVOEntityProvince`,`AP`.`Country` AS `CVOEntityCountry`,`AP`.`PostalCode_fsx` AS `CVOEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `CVOEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `CVOEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `CVOEntityEmail_fsx`,`AP`.`Discriminator` AS `CVOEntityDiscriminator`,`RJT`.`HUBId` AS `HUBId`,`RJT`.`DistributorId` AS `DistributorId`,`RJT`.`VehicleId` AS `VehicleId`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`ActENUM` AS `ActENUM`,`RJT`.`PermitIssuerId` AS `PermitIssuerId`,`RJT`.`PermitTypeId` AS `PermitTypeId`,`RJT`.`Code` AS `Code`,`RJT`.`ServiceCategory` AS `ServiceCategory`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`PJT0`.`EntityId` AS `EntityScenarioEntityId`,`PJT0`.`ScenarioId` AS `EntityScenarioScenarioId`,`PEP_0_0`.`Title` AS `EntityScenarioTitle`,`PEP_0_0`.`Address_fsx` AS `EntityScenarioAddress_fsx`,`PEP_0_0`.`City` AS `EntityScenarioCity`,`PEP_0_0`.`Province` AS `EntityScenarioProvince`,`PEP_0_0`.`Country` AS `EntityScenarioCountry`,`PEP_0_0`.`PostalCode_fsx` AS `EntityScenarioPostalCode_fsx`,`PEP_0_0`.`Phone_fsx` AS `EntityScenarioPhone_fsx`,`PEP_0_0`.`FaxNumber_fsx` AS `EntityScenarioFaxNumber_fsx`,`PEP_0_0`.`Email_fsx` AS `EntityScenarioEmail_fsx`,`PEP_0_0`.`Discriminator` AS `EntityScenarioDiscriminator`,`PJT1`.`ActENUM` AS `PermitTypeActENUM`,`PJT1`.`ActivityClassENUM` AS `PermitTypeActivityClassENUM`,`PJT1`.`Title` AS `PermitTypeTitle`,`PJT1`.`AllowedServiceCategories` AS `PermitTypeAllowedServiceCategories`,`PJT1`.`Extendable` AS `PermitTypeExtendable`,`PJT1`.`ProfileDependant` AS `PermitTypeProfileDependant`,`PJT2`.`EntityId` AS `PermitIssuerEntityId`,`PEP_2_0`.`Title` AS `PermitIssuerTitle`,`PEP_2_0`.`Address_fsx` AS `PermitIssuerAddress_fsx`,`PEP_2_0`.`City` AS `PermitIssuerCity`,`PEP_2_0`.`Province` AS `PermitIssuerProvince`,`PEP_2_0`.`Country` AS `PermitIssuerCountry`,`PEP_2_0`.`PostalCode_fsx` AS `PermitIssuerPostalCode_fsx`,`PEP_2_0`.`Phone_fsx` AS `PermitIssuerPhone_fsx`,`PEP_2_0`.`FaxNumber_fsx` AS `PermitIssuerFaxNumber_fsx`,`PEP_2_0`.`Email_fsx` AS `PermitIssuerEmail_fsx`,`PEP_2_0`.`Discriminator` AS `PermitIssuerDiscriminator` from (((((((`H_CVOs` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_Permits` `RJT` on(((`RJT`.`CVOId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_AAA_EntityScenarios` `PJT0` on(((`RJT`.`ActENUM` = `PJT0`.`PermittedActENUM`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_EntityProfile` `PEP_0_0` on(((`PJT0`.`EntityId` = `PEP_0_0`.`Id`) and ((0 <> `PEP_0_0`.`RecordDeleted`) is not true)))) join `H_PermitTypes` `PJT1` on(((`RJT`.`PermitTypeId` = `PJT1`.`Id`) and ((0 <> `PJT1`.`RecordDeleted`) is not true)))) join `H_PermitIssuers` `PJT2` on(((`RJT`.`PermitIssuerId` = `PJT2`.`Id`) and ((0 <> `PJT2`.`RecordDeleted`) is not true)))) join `H_AAA_EntityProfile` `PEP_2_0` on(((`PJT2`.`EntityId` = `PEP_2_0`.`Id`) and ((0 <> `PEP_2_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_CVOServicesSuperDetail` AS select `BaseTable`.`Id` AS `ServiceBaseId`,`BaseTable`.`ServiceType` AS `ServiceBaseServiceType`,`BaseTable`.`ServiceClass` AS `ServiceBaseServiceClass`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`ServiceCategory` AS `ServiceCategory`,`PJT0`.`EntityId` AS `CVOEntityId`,`PEP_0_0`.`Title` AS `CVOTitle`,`PEP_0_0`.`Address_fsx` AS `CVOAddress_fsx`,`PEP_0_0`.`City` AS `CVOCity`,`PEP_0_0`.`Province` AS `CVOProvince`,`PEP_0_0`.`Country` AS `CVOCountry`,`PEP_0_0`.`PostalCode_fsx` AS `CVOPostalCode_fsx`,`PEP_0_0`.`Phone_fsx` AS `CVOPhone_fsx`,`PEP_0_0`.`FaxNumber_fsx` AS `CVOFaxNumber_fsx`,`PEP_0_0`.`Email_fsx` AS `CVOEmail_fsx`,`PEP_0_0`.`Discriminator` AS `CVODiscriminator` from (((`H_ServiceBases` `BaseTable` join `H_CVOServices` `RJT` on(((`RJT`.`ServiceId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_CVOs` `PJT0` on(((`RJT`.`CVOId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_EntityProfile` `PEP_0_0` on(((`PJT0`.`EntityId` = `PEP_0_0`.`Id`) and ((0 <> `PEP_0_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_CVOSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_CVOSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_CVOSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`EntityId` AS `EntityId`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator`,`TempQuery0`.`RelatedEntityCount` AS `PermitsCount`,`TempQuery1`.`RelatedEntityCount` AS `DriversCount`,`TempQuery2`.`RelatedEntityCount` AS `ServicesCount`,`TempQuery3`.`RelatedEntityCount` AS `VehiclesCount`,`TempQuery4`.`RelatedEntityCount` AS `DistributorsCount` from ((((((`H_CVOs` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) left join (select `RT0`.`CVOId` AS `CVOId`,count(`RT0`.`CVOId`) AS `RelatedEntityCount` from `H_Permits` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`CVOId`) `TempQuery0` on((`TempQuery0`.`CVOId` = `BaseTable`.`Id`))) left join (select `RT1`.`CVOId` AS `CVOId`,count(`RT1`.`CVOId`) AS `RelatedEntityCount` from `H_CVODrivers` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`CVOId`) `TempQuery1` on((`TempQuery1`.`CVOId` = `BaseTable`.`Id`))) left join (select `RT2`.`CVOId` AS `CVOId`,count(`RT2`.`CVOId`) AS `RelatedEntityCount` from `H_CVOServices` `RT2` where ((0 <> `RT2`.`RecordDeleted`) is not true) group by `RT2`.`CVOId`) `TempQuery2` on((`TempQuery2`.`CVOId` = `BaseTable`.`Id`))) left join (select `RT3`.`CVOId` AS `CVOId`,count(`RT3`.`CVOId`) AS `RelatedEntityCount` from `H_CVOVehicles` `RT3` where ((0 <> `RT3`.`RecordDeleted`) is not true) group by `RT3`.`CVOId`) `TempQuery3` on((`TempQuery3`.`CVOId` = `BaseTable`.`Id`))) left join (select `RT4`.`CVOId` AS `CVOId`,count(`RT4`.`CVOId`) AS `RelatedEntityCount` from `H_DistributorCVOs` `RT4` where ((0 <> `RT4`.`RecordDeleted`) is not true) group by `RT4`.`CVOId`) `TempQuery4` on((`TempQuery4`.`CVOId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_CVOVehiclesSuperDetail` AS select `BaseTable`.`Id` AS `VehicleProfileId`,`BaseTable`.`Plate` AS `VehicleProfilePlate`,`BaseTable`.`VIN` AS `VehicleProfileVIN`,`BaseTable`.`Make` AS `VehicleProfileMake`,`BaseTable`.`Model` AS `VehicleProfileModel`,`BaseTable`.`Province` AS `VehicleProfileProvince`,`BaseTable`.`Color` AS `VehicleProfileColor`,`BaseTable`.`Year` AS `VehicleProfileYear`,`BaseTable`.`TransportCategory` AS `VehicleProfileTransportCategory`,`BaseTable`.`Cargo_Height` AS `VehicleProfileCargo_Height`,`BaseTable`.`Cargo_Weight` AS `VehicleProfileCargo_Weight`,`BaseTable`.`Cargo_Length` AS `VehicleProfileCargo_Length`,`BaseTable`.`Cargo_Width` AS `VehicleProfileCargo_Width`,`BaseTable`.`Capacity_Passengers` AS `VehicleProfileCapacity_Passengers`,`BaseTable`.`Capacity_Luggage` AS `VehicleProfileCapacity_Luggage`,`BaseTable`.`VehicleType` AS `VehicleProfileVehicleType`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`HasRule` AS `HasRule`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`RJT`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`PJT0`.`EntityId` AS `CVOEntityId`,`PEP_0_0`.`Title` AS `CVOTitle`,`PEP_0_0`.`Address_fsx` AS `CVOAddress_fsx`,`PEP_0_0`.`City` AS `CVOCity`,`PEP_0_0`.`Province` AS `CVOProvince`,`PEP_0_0`.`Country` AS `CVOCountry`,`PEP_0_0`.`PostalCode_fsx` AS `CVOPostalCode_fsx`,`PEP_0_0`.`Phone_fsx` AS `CVOPhone_fsx`,`PEP_0_0`.`FaxNumber_fsx` AS `CVOFaxNumber_fsx`,`PEP_0_0`.`Email_fsx` AS `CVOEmail_fsx`,`PEP_0_0`.`Discriminator` AS `CVODiscriminator` from (((`H_VehicleProfile` `BaseTable` join `H_CVOVehicles` `RJT` on(((`RJT`.`VehicleId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_CVOs` `PJT0` on(((`RJT`.`CVOId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_EntityProfile` `PEP_0_0` on(((`PJT0`.`EntityId` = `PEP_0_0`.`Id`) and ((0 <> `PEP_0_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_Distributor` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`EntityId` AS `EntityId`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator` from (`H_Distributors` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_DistributorCVOsSuperDetail` AS select `BaseTable`.`Id` AS `DistributorId`,`BaseTable`.`EntityId` AS `DistributorEntityId`,`AP`.`Title` AS `DistributorEntityTitle`,`AP`.`Address_fsx` AS `DistributorEntityAddress_fsx`,`AP`.`City` AS `DistributorEntityCity`,`AP`.`Province` AS `DistributorEntityProvince`,`AP`.`Country` AS `DistributorEntityCountry`,`AP`.`PostalCode_fsx` AS `DistributorEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `DistributorEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `DistributorEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `DistributorEntityEmail_fsx`,`AP`.`Discriminator` AS `DistributorEntityDiscriminator`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`HasRule` AS `HasRule`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`RJT`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`PJT0`.`EntityId` AS `CVOEntityId`,`PEP_0_0`.`Title` AS `CVOTitle`,`PEP_0_0`.`Address_fsx` AS `CVOAddress_fsx`,`PEP_0_0`.`City` AS `CVOCity`,`PEP_0_0`.`Province` AS `CVOProvince`,`PEP_0_0`.`Country` AS `CVOCountry`,`PEP_0_0`.`PostalCode_fsx` AS `CVOPostalCode_fsx`,`PEP_0_0`.`Phone_fsx` AS `CVOPhone_fsx`,`PEP_0_0`.`FaxNumber_fsx` AS `CVOFaxNumber_fsx`,`PEP_0_0`.`Email_fsx` AS `CVOEmail_fsx`,`PEP_0_0`.`Discriminator` AS `CVODiscriminator` from ((((`H_Distributors` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_DistributorCVOs` `RJT` on(((`RJT`.`DistributorId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_CVOs` `PJT0` on(((`RJT`.`CVOId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_EntityProfile` `PEP_0_0` on(((`PJT0`.`EntityId` = `PEP_0_0`.`Id`) and ((0 <> `PEP_0_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_DistributorDriversSuperDetail` AS select `BaseTable`.`Id` AS `DistributorId`,`BaseTable`.`EntityId` AS `DistributorEntityId`,`AP`.`Title` AS `DistributorEntityTitle`,`AP`.`Address_fsx` AS `DistributorEntityAddress_fsx`,`AP`.`City` AS `DistributorEntityCity`,`AP`.`Province` AS `DistributorEntityProvince`,`AP`.`Country` AS `DistributorEntityCountry`,`AP`.`PostalCode_fsx` AS `DistributorEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `DistributorEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `DistributorEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `DistributorEntityEmail_fsx`,`AP`.`Discriminator` AS `DistributorEntityDiscriminator`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`HasRule` AS `HasRule`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`RJT`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`PJT0`.`UserId` AS `DriverUserId`,`PJT0`.`PersonCVOId` AS `DriverPersonCVOId`,`PUI_0_0`.`Firstname_fsx` AS `DriverFirstname_fsx`,`PUI_0_0`.`Lastname_fsx` AS `DriverLastname_fsx`,`PUI_0_0`.`Username` AS `DriverUsername`,`PUI_0_0`.`Email_fsx` AS `DriverEmail_fsx`,`PUI_0_0`.`Email_hash` AS `DriverEmail_hash`,`PUI_0_0`.`EmailConfirmed` AS `DriverEmailConfirmed`,`PUI_0_0`.`CellPhone_fsx` AS `DriverCellPhone_fsx`,`PUI_0_0`.`CellPhone_hash` AS `DriverCellPhone_hash`,`PUI_0_0`.`CellPhoneConfirmed` AS `DriverCellPhoneConfirmed`,`PUI_0_0`.`IssuedBy` AS `DriverIssuedBy`,`PUI_0_0`.`RecordKey` AS `DriverRecordKey`,`PUI_0_0`.`CreatedAt_UTC` AS `DriverCreatedAt_UTC`,`PUI_0_0`.`CreatedBy` AS `DriverCreatedBy`,`PUI_0_0`.`ModifiedAt_UTC` AS `DriverModifiedAt_UTC`,`PUI_0_0`.`ModifiedBy` AS `DriverModifiedBy`,`PUI_0_0`.`RecordDeleted` AS `DriverRecordDeleted` from ((((`H_Distributors` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_DistributorDrivers` `RJT` on(((`RJT`.`DistributorId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_Drivers` `PJT0` on(((`RJT`.`DriverId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `PUI_0_0` on(((`PJT0`.`UserId` = `PUI_0_0`.`Id`) and ((0 <> `PUI_0_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_DistributorPermitsExtraDetail` AS select `BaseTable`.`Id` AS `DistributorId`,`BaseTable`.`EntityId` AS `DistributorEntityId`,`AP`.`Title` AS `DistributorEntityTitle`,`AP`.`Address_fsx` AS `DistributorEntityAddress_fsx`,`AP`.`City` AS `DistributorEntityCity`,`AP`.`Province` AS `DistributorEntityProvince`,`AP`.`Country` AS `DistributorEntityCountry`,`AP`.`PostalCode_fsx` AS `DistributorEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `DistributorEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `DistributorEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `DistributorEntityEmail_fsx`,`AP`.`Discriminator` AS `DistributorEntityDiscriminator`,`RJT`.`HUBId` AS `HUBId`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`VehicleId` AS `VehicleId`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`ActENUM` AS `ActENUM`,`RJT`.`PermitIssuerId` AS `PermitIssuerId`,`RJT`.`PermitTypeId` AS `PermitTypeId`,`RJT`.`Code` AS `Code`,`RJT`.`ServiceCategory` AS `ServiceCategory`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`PJT0`.`EntityId` AS `EntityScenarioEntityId`,`PJT0`.`ScenarioId` AS `EntityScenarioScenarioId`,`PEP_0_0`.`Title` AS `EntityScenarioTitle`,`PEP_0_0`.`Address_fsx` AS `EntityScenarioAddress_fsx`,`PEP_0_0`.`City` AS `EntityScenarioCity`,`PEP_0_0`.`Province` AS `EntityScenarioProvince`,`PEP_0_0`.`Country` AS `EntityScenarioCountry`,`PEP_0_0`.`PostalCode_fsx` AS `EntityScenarioPostalCode_fsx`,`PEP_0_0`.`Phone_fsx` AS `EntityScenarioPhone_fsx`,`PEP_0_0`.`FaxNumber_fsx` AS `EntityScenarioFaxNumber_fsx`,`PEP_0_0`.`Email_fsx` AS `EntityScenarioEmail_fsx`,`PEP_0_0`.`Discriminator` AS `EntityScenarioDiscriminator`,`PJT1`.`ActENUM` AS `PermitTypeActENUM`,`PJT1`.`ActivityClassENUM` AS `PermitTypeActivityClassENUM`,`PJT1`.`Title` AS `PermitTypeTitle`,`PJT1`.`AllowedServiceCategories` AS `PermitTypeAllowedServiceCategories`,`PJT1`.`Extendable` AS `PermitTypeExtendable`,`PJT1`.`ProfileDependant` AS `PermitTypeProfileDependant`,`PJT2`.`EntityId` AS `PermitIssuerEntityId`,`PEP_2_0`.`Title` AS `PermitIssuerTitle`,`PEP_2_0`.`Address_fsx` AS `PermitIssuerAddress_fsx`,`PEP_2_0`.`City` AS `PermitIssuerCity`,`PEP_2_0`.`Province` AS `PermitIssuerProvince`,`PEP_2_0`.`Country` AS `PermitIssuerCountry`,`PEP_2_0`.`PostalCode_fsx` AS `PermitIssuerPostalCode_fsx`,`PEP_2_0`.`Phone_fsx` AS `PermitIssuerPhone_fsx`,`PEP_2_0`.`FaxNumber_fsx` AS `PermitIssuerFaxNumber_fsx`,`PEP_2_0`.`Email_fsx` AS `PermitIssuerEmail_fsx`,`PEP_2_0`.`Discriminator` AS `PermitIssuerDiscriminator` from (((((((`H_Distributors` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_Permits` `RJT` on(((`RJT`.`DistributorId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_AAA_EntityScenarios` `PJT0` on(((`RJT`.`ActENUM` = `PJT0`.`PermittedActENUM`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_EntityProfile` `PEP_0_0` on(((`PJT0`.`EntityId` = `PEP_0_0`.`Id`) and ((0 <> `PEP_0_0`.`RecordDeleted`) is not true)))) join `H_PermitTypes` `PJT1` on(((`RJT`.`PermitTypeId` = `PJT1`.`Id`) and ((0 <> `PJT1`.`RecordDeleted`) is not true)))) join `H_PermitIssuers` `PJT2` on(((`RJT`.`PermitIssuerId` = `PJT2`.`Id`) and ((0 <> `PJT2`.`RecordDeleted`) is not true)))) join `H_AAA_EntityProfile` `PEP_2_0` on(((`PJT2`.`EntityId` = `PEP_2_0`.`Id`) and ((0 <> `PEP_2_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_DistributorSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DistributorSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_DistributorSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`EntityId` AS `EntityId`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator`,`TempQuery0`.`RelatedEntityCount` AS `PermitsCount`,`TempQuery1`.`RelatedEntityCount` AS `CVOsCount`,`TempQuery2`.`RelatedEntityCount` AS `DriversCount`,`TempQuery3`.`RelatedEntityCount` AS `HUBsCount` from (((((`H_Distributors` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) left join (select `RT0`.`DistributorId` AS `DistributorId`,count(`RT0`.`DistributorId`) AS `RelatedEntityCount` from `H_Permits` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`DistributorId`) `TempQuery0` on((`TempQuery0`.`DistributorId` = `BaseTable`.`Id`))) left join (select `RT1`.`DistributorId` AS `DistributorId`,count(`RT1`.`DistributorId`) AS `RelatedEntityCount` from `H_DistributorCVOs` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`DistributorId`) `TempQuery1` on((`TempQuery1`.`DistributorId` = `BaseTable`.`Id`))) left join (select `RT2`.`DistributorId` AS `DistributorId`,count(`RT2`.`DistributorId`) AS `RelatedEntityCount` from `H_DistributorDrivers` `RT2` where ((0 <> `RT2`.`RecordDeleted`) is not true) group by `RT2`.`DistributorId`) `TempQuery2` on((`TempQuery2`.`DistributorId` = `BaseTable`.`Id`))) left join (select `RT3`.`DistributorId` AS `DistributorId`,count(`RT3`.`DistributorId`) AS `RelatedEntityCount` from `H_HUBDistributors` `RT3` where ((0 <> `RT3`.`RecordDeleted`) is not true) group by `RT3`.`DistributorId`) `TempQuery3` on((`TempQuery3`.`DistributorId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_Driver` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`UserId` AS `UserId`,`BaseTable`.`PersonCVOId` AS `PersonCVOId`,`UI`.`Firstname_fsx` AS `UserFirstname_fsx`,`UI`.`Lastname_fsx` AS `UserLastname_fsx`,`UI`.`Username` AS `UserUsername`,`UI`.`Email_fsx` AS `UserEmail_fsx`,`UI`.`Email_hash` AS `UserEmail_hash`,`UI`.`EmailConfirmed` AS `UserEmailConfirmed`,`UI`.`CellPhone_fsx` AS `UserCellPhone_fsx`,`UI`.`CellPhone_hash` AS `UserCellPhone_hash`,`UI`.`CellPhoneConfirmed` AS `UserCellPhoneConfirmed`,`UI`.`IssuedBy` AS `UserIssuedBy` from (`H_Drivers` `BaseTable` join `H_AAA_Synced_UserInfo` `UI` on(((`BaseTable`.`UserId` = `UI`.`Id`) and ((0 <> `UI`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_DriverPermitVehicleTypesDetail` AS select `BaseTable`.`Id` AS `PermitId`,`BaseTable`.`HUBId` AS `PermitHUBId`,`BaseTable`.`DistributorId` AS `PermitDistributorId`,`BaseTable`.`CVOId` AS `PermitCVOId`,`BaseTable`.`VehicleId` AS `PermitVehicleId`,`BaseTable`.`DriverId` AS `PermitDriverId`,`BaseTable`.`ActENUM` AS `PermitActENUM`,`BaseTable`.`PermitIssuerId` AS `PermitPermitIssuerId`,`BaseTable`.`PermitTypeId` AS `PermitPermitTypeId`,`BaseTable`.`Code` AS `PermitCode`,`BaseTable`.`ServiceCategory` AS `PermitServiceCategory`,`BaseTable`.`IssuedDate_UTC` AS `PermitIssuedDate_UTC`,`RJT`.`VehicleType` AS `VehicleType` from (`H_Permits` `BaseTable` join `H_DriverPermitVehicleTypes` `RJT` on(((`RJT`.`PermitId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_DriverPermitsExtraDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DriverPermitsExtraDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_DriverPermitsExtraDetail` AS select `BaseTable`.`Id` AS `DriverId`,`BaseTable`.`UserId` AS `DriverUserId`,`BaseTable`.`PersonCVOId` AS `DriverPersonCVOId`,`UI`.`Firstname_fsx` AS `DriverUserFirstname_fsx`,`UI`.`Lastname_fsx` AS `DriverUserLastname_fsx`,`UI`.`Username` AS `DriverUserUsername`,`UI`.`Email_fsx` AS `DriverUserEmail_fsx`,`UI`.`Email_hash` AS `DriverUserEmail_hash`,`UI`.`EmailConfirmed` AS `DriverUserEmailConfirmed`,`UI`.`CellPhone_fsx` AS `DriverUserCellPhone_fsx`,`UI`.`CellPhone_hash` AS `DriverUserCellPhone_hash`,`UI`.`CellPhoneConfirmed` AS `DriverUserCellPhoneConfirmed`,`UI`.`IssuedBy` AS `DriverUserIssuedBy`,`RJT`.`HUBId` AS `HUBId`,`RJT`.`DistributorId` AS `DistributorId`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`VehicleId` AS `VehicleId`,`RJT`.`ActENUM` AS `ActENUM`,`RJT`.`PermitIssuerId` AS `PermitIssuerId`,`RJT`.`PermitTypeId` AS `PermitTypeId`,`RJT`.`Code` AS `Code`,`RJT`.`ServiceCategory` AS `ServiceCategory`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`PJT0`.`EntityId` AS `EntityScenarioEntityId`,`PJT0`.`ScenarioId` AS `EntityScenarioScenarioId`,`PEP_0_0`.`Title` AS `EntityScenarioTitle`,`PEP_0_0`.`Address_fsx` AS `EntityScenarioAddress_fsx`,`PEP_0_0`.`City` AS `EntityScenarioCity`,`PEP_0_0`.`Province` AS `EntityScenarioProvince`,`PEP_0_0`.`Country` AS `EntityScenarioCountry`,`PEP_0_0`.`PostalCode_fsx` AS `EntityScenarioPostalCode_fsx`,`PEP_0_0`.`Phone_fsx` AS `EntityScenarioPhone_fsx`,`PEP_0_0`.`FaxNumber_fsx` AS `EntityScenarioFaxNumber_fsx`,`PEP_0_0`.`Email_fsx` AS `EntityScenarioEmail_fsx`,`PEP_0_0`.`Discriminator` AS `EntityScenarioDiscriminator`,`PJT1`.`ActENUM` AS `PermitTypeActENUM`,`PJT1`.`ActivityClassENUM` AS `PermitTypeActivityClassENUM`,`PJT1`.`Title` AS `PermitTypeTitle`,`PJT1`.`AllowedServiceCategories` AS `PermitTypeAllowedServiceCategories`,`PJT1`.`Extendable` AS `PermitTypeExtendable`,`PJT1`.`ProfileDependant` AS `PermitTypeProfileDependant`,`PJT2`.`EntityId` AS `PermitIssuerEntityId`,`PEP_2_0`.`Title` AS `PermitIssuerTitle`,`PEP_2_0`.`Address_fsx` AS `PermitIssuerAddress_fsx`,`PEP_2_0`.`City` AS `PermitIssuerCity`,`PEP_2_0`.`Province` AS `PermitIssuerProvince`,`PEP_2_0`.`Country` AS `PermitIssuerCountry`,`PEP_2_0`.`PostalCode_fsx` AS `PermitIssuerPostalCode_fsx`,`PEP_2_0`.`Phone_fsx` AS `PermitIssuerPhone_fsx`,`PEP_2_0`.`FaxNumber_fsx` AS `PermitIssuerFaxNumber_fsx`,`PEP_2_0`.`Email_fsx` AS `PermitIssuerEmail_fsx`,`PEP_2_0`.`Discriminator` AS `PermitIssuerDiscriminator` from (((((((`H_Drivers` `BaseTable` join `H_AAA_Synced_UserInfo` `UI` on(((`BaseTable`.`UserId` = `UI`.`Id`) and ((0 <> `UI`.`RecordDeleted`) is not true)))) join `H_Permits` `RJT` on(((`RJT`.`DriverId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_AAA_EntityScenarios` `PJT0` on(((`RJT`.`ActENUM` = `PJT0`.`PermittedActENUM`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_EntityProfile` `PEP_0_0` on(((`PJT0`.`EntityId` = `PEP_0_0`.`Id`) and ((0 <> `PEP_0_0`.`RecordDeleted`) is not true)))) join `H_PermitTypes` `PJT1` on(((`RJT`.`PermitTypeId` = `PJT1`.`Id`) and ((0 <> `PJT1`.`RecordDeleted`) is not true)))) join `H_PermitIssuers` `PJT2` on(((`RJT`.`PermitIssuerId` = `PJT2`.`Id`) and ((0 <> `PJT2`.`RecordDeleted`) is not true)))) join `H_AAA_EntityProfile` `PEP_2_0` on(((`PJT2`.`EntityId` = `PEP_2_0`.`Id`) and ((0 <> `PEP_2_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_DriverSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_DriverSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_DriverSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`UserId` AS `UserId`,`BaseTable`.`PersonCVOId` AS `PersonCVOId`,`UI`.`Firstname_fsx` AS `UserFirstname_fsx`,`UI`.`Lastname_fsx` AS `UserLastname_fsx`,`UI`.`Username` AS `UserUsername`,`UI`.`Email_fsx` AS `UserEmail_fsx`,`UI`.`Email_hash` AS `UserEmail_hash`,`UI`.`EmailConfirmed` AS `UserEmailConfirmed`,`UI`.`CellPhone_fsx` AS `UserCellPhone_fsx`,`UI`.`CellPhone_hash` AS `UserCellPhone_hash`,`UI`.`CellPhoneConfirmed` AS `UserCellPhoneConfirmed`,`UI`.`IssuedBy` AS `UserIssuedBy`,`TempQuery0`.`RelatedEntityCount` AS `PermitsCount`,`TempQuery1`.`RelatedEntityCount` AS `CVOsCount`,`TempQuery2`.`RelatedEntityCount` AS `DistributorsCount`,`TempQuery3`.`RelatedEntityCount` AS `VehiclesCount` from (((((`H_Drivers` `BaseTable` join `H_AAA_Synced_UserInfo` `UI` on(((`BaseTable`.`UserId` = `UI`.`Id`) and ((0 <> `UI`.`RecordDeleted`) is not true)))) left join (select `RT0`.`DriverId` AS `DriverId`,count(`RT0`.`DriverId`) AS `RelatedEntityCount` from `H_Permits` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`DriverId`) `TempQuery0` on((`TempQuery0`.`DriverId` = `BaseTable`.`Id`))) left join (select `RT1`.`DriverId` AS `DriverId`,count(`RT1`.`DriverId`) AS `RelatedEntityCount` from `H_CVODrivers` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`DriverId`) `TempQuery1` on((`TempQuery1`.`DriverId` = `BaseTable`.`Id`))) left join (select `RT2`.`DriverId` AS `DriverId`,count(`RT2`.`DriverId`) AS `RelatedEntityCount` from `H_DistributorDrivers` `RT2` where ((0 <> `RT2`.`RecordDeleted`) is not true) group by `RT2`.`DriverId`) `TempQuery2` on((`TempQuery2`.`DriverId` = `BaseTable`.`Id`))) left join (select `RT3`.`DriverId` AS `DriverId`,count(`RT3`.`DriverId`) AS `RelatedEntityCount` from `H_VehicleDrivers` `RT3` where ((0 <> `RT3`.`RecordDeleted`) is not true) group by `RT3`.`DriverId`) `TempQuery3` on((`TempQuery3`.`DriverId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_EntityRole` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`EntityId` AS `EntityId`,`BaseTable`.`ActENUM` AS `ActENUM`,`BaseTable`.`IsDefault` AS `IsDefault`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator` from (`H_AAA_EntityRoles` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) where (((0 <> `BaseTable`.`RecordDeleted`) is not true) and ((0 <> `BaseTable`.`IsDefault`) is not true)) */;
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
/*!50001 VIEW `Vi_DPA_EntityRolePermissionsSuperDetail` AS select `BaseTable`.`Id` AS `EntityRoleId`,`BaseTable`.`Title` AS `EntityRoleTitle`,`BaseTable`.`EntityId` AS `EntityRoleEntityId`,`BaseTable`.`ActENUM` AS `EntityRoleActENUM`,`BaseTable`.`IsDefault` AS `EntityRoleIsDefault`,`AP`.`Title` AS `EntityRoleEntityTitle`,`AP`.`Address_fsx` AS `EntityRoleEntityAddress_fsx`,`AP`.`City` AS `EntityRoleEntityCity`,`AP`.`Province` AS `EntityRoleEntityProvince`,`AP`.`Country` AS `EntityRoleEntityCountry`,`AP`.`PostalCode_fsx` AS `EntityRoleEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityRoleEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityRoleEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityRoleEntityEmail_fsx`,`AP`.`Discriminator` AS `EntityRoleEntityDiscriminator`,`RJT`.`PermissionId` AS `PermissionId`,`PJT0`.`Title` AS `PermissionTitle`,`PJT0`.`CodeUri` AS `PermissionCodeUri` from (((`H_AAA_EntityRoles` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_AAA_EntityRolePermissions` `RJT` on(((`RJT`.`RoleId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_AAA_Permissions` `PJT0` on(((`RJT`.`PermissionId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where (((0 <> `BaseTable`.`RecordDeleted`) is not true) and ((0 <> `BaseTable`.`IsDefault`) is not true)) */;
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
/*!50001 VIEW `Vi_DPA_EntityRoleSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`EntityId` AS `EntityId`,`BaseTable`.`ActENUM` AS `ActENUM`,`BaseTable`.`IsDefault` AS `IsDefault`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator`,`TempQuery0`.`RelatedEntityCount` AS `PermissionsCount`,`TempQuery2`.`RelatedEntityCount` AS `UsersCount` from (((`H_AAA_EntityRoles` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) left join (select `RT0`.`RoleId` AS `RoleId`,count(`RT0`.`RoleId`) AS `RelatedEntityCount` from `H_AAA_EntityRolePermissions` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`RoleId`) `TempQuery0` on((`TempQuery0`.`RoleId` = `BaseTable`.`Id`))) left join (select `RT2`.`EntityRoleId` AS `EntityRoleId`,count(`RT2`.`EntityRoleId`) AS `RelatedEntityCount` from `H_AAA_UserEntityRoles` `RT2` where ((0 <> `RT2`.`RecordDeleted`) is not true) group by `RT2`.`EntityRoleId`) `TempQuery2` on((`TempQuery2`.`EntityRoleId` = `BaseTable`.`Id`))) where (((0 <> `BaseTable`.`RecordDeleted`) is not true) and ((0 <> `BaseTable`.`IsDefault`) is not true)) */;
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
/*!50001 VIEW `Vi_DPA_Feature` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Title` AS `Title` from `H_Features` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_FeatureSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Title` AS `Title`,`TempQuery0`.`RelatedEntityCount` AS `VehiclesCount` from (`H_Features` `BaseTable` left join (select `RT0`.`FeatureId` AS `FeatureId`,count(`RT0`.`FeatureId`) AS `RelatedEntityCount` from `H_VehicleFeatures` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`FeatureId`) `TempQuery0` on((`TempQuery0`.`FeatureId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_HUB` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`EntityId` AS `EntityId`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator` from (`H_HUBs` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_HUBDistributorsSuperDetail` AS select `BaseTable`.`Id` AS `HUBId`,`BaseTable`.`EntityId` AS `HUBEntityId`,`AP`.`Title` AS `HUBEntityTitle`,`AP`.`Address_fsx` AS `HUBEntityAddress_fsx`,`AP`.`City` AS `HUBEntityCity`,`AP`.`Province` AS `HUBEntityProvince`,`AP`.`Country` AS `HUBEntityCountry`,`AP`.`PostalCode_fsx` AS `HUBEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `HUBEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `HUBEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `HUBEntityEmail_fsx`,`AP`.`Discriminator` AS `HUBEntityDiscriminator`,`RJT`.`DistributorId` AS `DistributorId`,`RJT`.`ParticipationCategory` AS `ParticipationCategory`,`RJT`.`HasRule` AS `HasRule`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`RJT`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`PJT0`.`EntityId` AS `DistributorEntityId`,`PEP_0_0`.`Title` AS `DistributorTitle`,`PEP_0_0`.`Address_fsx` AS `DistributorAddress_fsx`,`PEP_0_0`.`City` AS `DistributorCity`,`PEP_0_0`.`Province` AS `DistributorProvince`,`PEP_0_0`.`Country` AS `DistributorCountry`,`PEP_0_0`.`PostalCode_fsx` AS `DistributorPostalCode_fsx`,`PEP_0_0`.`Phone_fsx` AS `DistributorPhone_fsx`,`PEP_0_0`.`FaxNumber_fsx` AS `DistributorFaxNumber_fsx`,`PEP_0_0`.`Email_fsx` AS `DistributorEmail_fsx`,`PEP_0_0`.`Discriminator` AS `DistributorDiscriminator` from ((((`H_HUBs` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_HUBDistributors` `RJT` on(((`RJT`.`HUBId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_Distributors` `PJT0` on(((`RJT`.`DistributorId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_EntityProfile` `PEP_0_0` on(((`PJT0`.`EntityId` = `PEP_0_0`.`Id`) and ((0 <> `PEP_0_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_HUBPermitsExtraDetail` AS select `BaseTable`.`Id` AS `HUBId`,`BaseTable`.`EntityId` AS `HUBEntityId`,`AP`.`Title` AS `HUBEntityTitle`,`AP`.`Address_fsx` AS `HUBEntityAddress_fsx`,`AP`.`City` AS `HUBEntityCity`,`AP`.`Province` AS `HUBEntityProvince`,`AP`.`Country` AS `HUBEntityCountry`,`AP`.`PostalCode_fsx` AS `HUBEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `HUBEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `HUBEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `HUBEntityEmail_fsx`,`AP`.`Discriminator` AS `HUBEntityDiscriminator`,`RJT`.`DistributorId` AS `DistributorId`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`VehicleId` AS `VehicleId`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`ActENUM` AS `ActENUM`,`RJT`.`PermitIssuerId` AS `PermitIssuerId`,`RJT`.`PermitTypeId` AS `PermitTypeId`,`RJT`.`Code` AS `Code`,`RJT`.`ServiceCategory` AS `ServiceCategory`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`PJT0`.`EntityId` AS `EntityScenarioEntityId`,`PJT0`.`ScenarioId` AS `EntityScenarioScenarioId`,`PEP_0_0`.`Title` AS `EntityScenarioTitle`,`PEP_0_0`.`Address_fsx` AS `EntityScenarioAddress_fsx`,`PEP_0_0`.`City` AS `EntityScenarioCity`,`PEP_0_0`.`Province` AS `EntityScenarioProvince`,`PEP_0_0`.`Country` AS `EntityScenarioCountry`,`PEP_0_0`.`PostalCode_fsx` AS `EntityScenarioPostalCode_fsx`,`PEP_0_0`.`Phone_fsx` AS `EntityScenarioPhone_fsx`,`PEP_0_0`.`FaxNumber_fsx` AS `EntityScenarioFaxNumber_fsx`,`PEP_0_0`.`Email_fsx` AS `EntityScenarioEmail_fsx`,`PEP_0_0`.`Discriminator` AS `EntityScenarioDiscriminator`,`PJT1`.`ActENUM` AS `PermitTypeActENUM`,`PJT1`.`ActivityClassENUM` AS `PermitTypeActivityClassENUM`,`PJT1`.`Title` AS `PermitTypeTitle`,`PJT1`.`AllowedServiceCategories` AS `PermitTypeAllowedServiceCategories`,`PJT1`.`Extendable` AS `PermitTypeExtendable`,`PJT1`.`ProfileDependant` AS `PermitTypeProfileDependant`,`PJT2`.`EntityId` AS `PermitIssuerEntityId`,`PEP_2_0`.`Title` AS `PermitIssuerTitle`,`PEP_2_0`.`Address_fsx` AS `PermitIssuerAddress_fsx`,`PEP_2_0`.`City` AS `PermitIssuerCity`,`PEP_2_0`.`Province` AS `PermitIssuerProvince`,`PEP_2_0`.`Country` AS `PermitIssuerCountry`,`PEP_2_0`.`PostalCode_fsx` AS `PermitIssuerPostalCode_fsx`,`PEP_2_0`.`Phone_fsx` AS `PermitIssuerPhone_fsx`,`PEP_2_0`.`FaxNumber_fsx` AS `PermitIssuerFaxNumber_fsx`,`PEP_2_0`.`Email_fsx` AS `PermitIssuerEmail_fsx`,`PEP_2_0`.`Discriminator` AS `PermitIssuerDiscriminator` from (((((((`H_HUBs` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_Permits` `RJT` on(((`RJT`.`HUBId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_AAA_EntityScenarios` `PJT0` on(((`RJT`.`ActENUM` = `PJT0`.`PermittedActENUM`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_EntityProfile` `PEP_0_0` on(((`PJT0`.`EntityId` = `PEP_0_0`.`Id`) and ((0 <> `PEP_0_0`.`RecordDeleted`) is not true)))) join `H_PermitTypes` `PJT1` on(((`RJT`.`PermitTypeId` = `PJT1`.`Id`) and ((0 <> `PJT1`.`RecordDeleted`) is not true)))) join `H_PermitIssuers` `PJT2` on(((`RJT`.`PermitIssuerId` = `PJT2`.`Id`) and ((0 <> `PJT2`.`RecordDeleted`) is not true)))) join `H_AAA_EntityProfile` `PEP_2_0` on(((`PJT2`.`EntityId` = `PEP_2_0`.`Id`) and ((0 <> `PEP_2_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_HUBSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_HUBSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_HUBSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`EntityId` AS `EntityId`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator`,`TempQuery0`.`RelatedEntityCount` AS `PermitsCount`,`TempQuery1`.`RelatedEntityCount` AS `DistributorsCount` from (((`H_HUBs` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) left join (select `RT0`.`HUBId` AS `HUBId`,count(`RT0`.`HUBId`) AS `RelatedEntityCount` from `H_Permits` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`HUBId`) `TempQuery0` on((`TempQuery0`.`HUBId` = `BaseTable`.`Id`))) left join (select `RT1`.`HUBId` AS `HUBId`,count(`RT1`.`HUBId`) AS `RelatedEntityCount` from `H_HUBDistributors` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`HUBId`) `TempQuery1` on((`TempQuery1`.`HUBId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_Permit` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`HUBId` AS `HUBId`,`BaseTable`.`DistributorId` AS `DistributorId`,`BaseTable`.`CVOId` AS `CVOId`,`BaseTable`.`VehicleId` AS `VehicleId`,`BaseTable`.`DriverId` AS `DriverId`,`BaseTable`.`ActENUM` AS `ActENUM`,`BaseTable`.`PermitIssuerId` AS `PermitIssuerId`,`BaseTable`.`PermitTypeId` AS `PermitTypeId`,`BaseTable`.`Code` AS `Code`,`BaseTable`.`ServiceCategory` AS `ServiceCategory`,`BaseTable`.`IssuedDate_UTC` AS `IssuedDate_UTC` from `H_Permits` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_PermitIssuer` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`EntityId` AS `EntityId`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator` from (`H_PermitIssuers` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_PermitIssuerPermitsExtraDetail` AS select `BaseTable`.`Id` AS `PermitIssuerId`,`BaseTable`.`EntityId` AS `PermitIssuerEntityId`,`AP`.`Title` AS `PermitIssuerEntityTitle`,`AP`.`Address_fsx` AS `PermitIssuerEntityAddress_fsx`,`AP`.`City` AS `PermitIssuerEntityCity`,`AP`.`Province` AS `PermitIssuerEntityProvince`,`AP`.`Country` AS `PermitIssuerEntityCountry`,`AP`.`PostalCode_fsx` AS `PermitIssuerEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `PermitIssuerEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `PermitIssuerEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `PermitIssuerEntityEmail_fsx`,`AP`.`Discriminator` AS `PermitIssuerEntityDiscriminator`,`RJT`.`HUBId` AS `HUBId`,`RJT`.`DistributorId` AS `DistributorId`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`VehicleId` AS `VehicleId`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`ActENUM` AS `ActENUM`,`RJT`.`PermitTypeId` AS `PermitTypeId`,`RJT`.`Code` AS `Code`,`RJT`.`ServiceCategory` AS `ServiceCategory`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`PJT0`.`EntityId` AS `EntityScenarioEntityId`,`PJT0`.`ScenarioId` AS `EntityScenarioScenarioId`,`PEP_0_0`.`Title` AS `EntityScenarioTitle`,`PEP_0_0`.`Address_fsx` AS `EntityScenarioAddress_fsx`,`PEP_0_0`.`City` AS `EntityScenarioCity`,`PEP_0_0`.`Province` AS `EntityScenarioProvince`,`PEP_0_0`.`Country` AS `EntityScenarioCountry`,`PEP_0_0`.`PostalCode_fsx` AS `EntityScenarioPostalCode_fsx`,`PEP_0_0`.`Phone_fsx` AS `EntityScenarioPhone_fsx`,`PEP_0_0`.`FaxNumber_fsx` AS `EntityScenarioFaxNumber_fsx`,`PEP_0_0`.`Email_fsx` AS `EntityScenarioEmail_fsx`,`PEP_0_0`.`Discriminator` AS `EntityScenarioDiscriminator`,`PJT1`.`ActENUM` AS `PermitTypeActENUM`,`PJT1`.`ActivityClassENUM` AS `PermitTypeActivityClassENUM`,`PJT1`.`Title` AS `PermitTypeTitle`,`PJT1`.`AllowedServiceCategories` AS `PermitTypeAllowedServiceCategories`,`PJT1`.`Extendable` AS `PermitTypeExtendable`,`PJT1`.`ProfileDependant` AS `PermitTypeProfileDependant` from (((((`H_PermitIssuers` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_Permits` `RJT` on(((`RJT`.`PermitIssuerId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_AAA_EntityScenarios` `PJT0` on(((`RJT`.`ActENUM` = `PJT0`.`PermittedActENUM`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_EntityProfile` `PEP_0_0` on(((`PJT0`.`EntityId` = `PEP_0_0`.`Id`) and ((0 <> `PEP_0_0`.`RecordDeleted`) is not true)))) join `H_PermitTypes` `PJT1` on(((`RJT`.`PermitTypeId` = `PJT1`.`Id`) and ((0 <> `PJT1`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_PermitIssuerSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`EntityId` AS `EntityId`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator`,`TempQuery0`.`RelatedEntityCount` AS `PermitsCount`,`TempQuery1`.`RelatedEntityCount` AS `PermitTypeIssuersCount` from (((`H_PermitIssuers` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) left join (select `RT0`.`PermitIssuerId` AS `PermitIssuerId`,count(`RT0`.`PermitIssuerId`) AS `RelatedEntityCount` from `H_Permits` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`PermitIssuerId`) `TempQuery0` on((`TempQuery0`.`PermitIssuerId` = `BaseTable`.`Id`))) left join (select `RT1`.`PermitIssuerId` AS `PermitIssuerId`,count(`RT1`.`PermitIssuerId`) AS `RelatedEntityCount` from `H_PermitTypeIssuers` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`PermitIssuerId`) `TempQuery1` on((`TempQuery1`.`PermitIssuerId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_PermitSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`HUBId` AS `HUBId`,`BaseTable`.`DistributorId` AS `DistributorId`,`BaseTable`.`CVOId` AS `CVOId`,`BaseTable`.`VehicleId` AS `VehicleId`,`BaseTable`.`DriverId` AS `DriverId`,`BaseTable`.`ActENUM` AS `ActENUM`,`BaseTable`.`PermitIssuerId` AS `PermitIssuerId`,`BaseTable`.`PermitTypeId` AS `PermitTypeId`,`BaseTable`.`Code` AS `Code`,`BaseTable`.`ServiceCategory` AS `ServiceCategory`,`BaseTable`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`TempQuery0`.`RelatedEntityCount` AS `DriverVehicleTypesCount`,`TempQuery1`.`RelatedEntityCount` AS `StatusesCount` from ((`H_Permits` `BaseTable` left join (select `RT0`.`PermitId` AS `PermitId`,count(`RT0`.`PermitId`) AS `RelatedEntityCount` from `H_DriverPermitVehicleTypes` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`PermitId`) `TempQuery0` on((`TempQuery0`.`PermitId` = `BaseTable`.`Id`))) left join (select `RT1`.`PermitId` AS `PermitId`,count(`RT1`.`PermitId`) AS `RelatedEntityCount` from `H_PermitStatuses` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`PermitId`) `TempQuery1` on((`TempQuery1`.`PermitId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_PermitType`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_PermitType`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_PermitType` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`ActENUM` AS `ActENUM`,`BaseTable`.`ActivityClassENUM` AS `ActivityClassENUM`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`AllowedServiceCategories` AS `AllowedServiceCategories`,`BaseTable`.`Extendable` AS `Extendable`,`BaseTable`.`ProfileDependant` AS `ProfileDependant` from `H_PermitTypes` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_PermitTypeIssuersSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_PermitTypeIssuersSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_PermitTypeIssuersSuperDetail` AS select `BaseTable`.`Id` AS `PermitTypeId`,`BaseTable`.`ActENUM` AS `PermitTypeActENUM`,`BaseTable`.`ActivityClassENUM` AS `PermitTypeActivityClassENUM`,`BaseTable`.`Title` AS `PermitTypeTitle`,`BaseTable`.`AllowedServiceCategories` AS `PermitTypeAllowedServiceCategories`,`BaseTable`.`Extendable` AS `PermitTypeExtendable`,`BaseTable`.`ProfileDependant` AS `PermitTypeProfileDependant`,`RJT`.`PermitIssuerId` AS `PermitIssuerId`,`PJT0`.`EntityId` AS `PermitIssuerEntityId`,`PEP_0_0`.`Title` AS `PermitIssuerTitle`,`PEP_0_0`.`Address_fsx` AS `PermitIssuerAddress_fsx`,`PEP_0_0`.`City` AS `PermitIssuerCity`,`PEP_0_0`.`Province` AS `PermitIssuerProvince`,`PEP_0_0`.`Country` AS `PermitIssuerCountry`,`PEP_0_0`.`PostalCode_fsx` AS `PermitIssuerPostalCode_fsx`,`PEP_0_0`.`Phone_fsx` AS `PermitIssuerPhone_fsx`,`PEP_0_0`.`FaxNumber_fsx` AS `PermitIssuerFaxNumber_fsx`,`PEP_0_0`.`Email_fsx` AS `PermitIssuerEmail_fsx`,`PEP_0_0`.`Discriminator` AS `PermitIssuerDiscriminator` from (((`H_PermitTypes` `BaseTable` join `H_PermitTypeIssuers` `RJT` on(((`RJT`.`PermitTypeId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_PermitIssuers` `PJT0` on(((`RJT`.`PermitIssuerId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_EntityProfile` `PEP_0_0` on(((`PJT0`.`EntityId` = `PEP_0_0`.`Id`) and ((0 <> `PEP_0_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_PermitTypePermitsExtraDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_PermitTypePermitsExtraDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_PermitTypePermitsExtraDetail` AS select `BaseTable`.`Id` AS `PermitTypeId`,`BaseTable`.`ActENUM` AS `PermitTypeActENUM`,`BaseTable`.`ActivityClassENUM` AS `PermitTypeActivityClassENUM`,`BaseTable`.`Title` AS `PermitTypeTitle`,`BaseTable`.`AllowedServiceCategories` AS `PermitTypeAllowedServiceCategories`,`BaseTable`.`Extendable` AS `PermitTypeExtendable`,`BaseTable`.`ProfileDependant` AS `PermitTypeProfileDependant`,`RJT`.`HUBId` AS `HUBId`,`RJT`.`DistributorId` AS `DistributorId`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`VehicleId` AS `VehicleId`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`ActENUM` AS `ActENUM`,`RJT`.`PermitIssuerId` AS `PermitIssuerId`,`RJT`.`Code` AS `Code`,`RJT`.`ServiceCategory` AS `ServiceCategory`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC` from (`H_PermitTypes` `BaseTable` join `H_Permits` `RJT` on(((`RJT`.`PermitTypeId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_PermitTypeSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_PermitTypeSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_PermitTypeSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`ActENUM` AS `ActENUM`,`BaseTable`.`ActivityClassENUM` AS `ActivityClassENUM`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`AllowedServiceCategories` AS `AllowedServiceCategories`,`BaseTable`.`Extendable` AS `Extendable`,`BaseTable`.`ProfileDependant` AS `ProfileDependant`,`TempQuery0`.`RelatedEntityCount` AS `IssuersCount`,`TempQuery1`.`RelatedEntityCount` AS `PermitsCount` from ((`H_PermitTypes` `BaseTable` left join (select `RT0`.`PermitTypeId` AS `PermitTypeId`,count(`RT0`.`PermitTypeId`) AS `RelatedEntityCount` from `H_PermitTypeIssuers` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`PermitTypeId`) `TempQuery0` on((`TempQuery0`.`PermitTypeId` = `BaseTable`.`Id`))) left join (select `RT1`.`PermitTypeId` AS `PermitTypeId`,count(`RT1`.`PermitTypeId`) AS `RelatedEntityCount` from `H_Permits` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`PermitTypeId`) `TempQuery1` on((`TempQuery1`.`PermitTypeId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_ServiceBase` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`ServiceType` AS `ServiceType`,`BaseTable`.`ServiceClass` AS `ServiceClass` from `H_ServiceBases` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_ServiceBaseSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`ServiceType` AS `ServiceType`,`BaseTable`.`ServiceClass` AS `ServiceClass`,`TempQuery0`.`RelatedEntityCount` AS `CVOServicesCount` from (`H_ServiceBases` `BaseTable` left join (select `RT0`.`ServiceId` AS `ServiceId`,count(`RT0`.`ServiceId`) AS `RelatedEntityCount` from `H_CVOServices` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`ServiceId`) `TempQuery0` on((`TempQuery0`.`ServiceId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_UserEntityRolesSuperDetail` AS select `BaseTable`.`Id` AS `EntityRoleId`,`BaseTable`.`Title` AS `EntityRoleTitle`,`BaseTable`.`EntityId` AS `EntityRoleEntityId`,`BaseTable`.`ActENUM` AS `EntityRoleActENUM`,`BaseTable`.`IsDefault` AS `EntityRoleIsDefault`,`AP`.`Title` AS `EntityRoleEntityTitle`,`AP`.`Address_fsx` AS `EntityRoleEntityAddress_fsx`,`AP`.`City` AS `EntityRoleEntityCity`,`AP`.`Province` AS `EntityRoleEntityProvince`,`AP`.`Country` AS `EntityRoleEntityCountry`,`AP`.`PostalCode_fsx` AS `EntityRoleEntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityRoleEntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityRoleEntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityRoleEntityEmail_fsx`,`AP`.`Discriminator` AS `EntityRoleEntityDiscriminator`,`RJT`.`UserId` AS `UserId`,`PJT0`.`Firstname_fsx` AS `UserInfoFirstname_fsx`,`PJT0`.`Lastname_fsx` AS `UserInfoLastname_fsx`,`PJT0`.`Username` AS `UserInfoUsername`,`PJT0`.`Email_fsx` AS `UserInfoEmail_fsx`,`PJT0`.`Email_hash` AS `UserInfoEmail_hash`,`PJT0`.`EmailConfirmed` AS `UserInfoEmailConfirmed`,`PJT0`.`CellPhone_fsx` AS `UserInfoCellPhone_fsx`,`PJT0`.`CellPhone_hash` AS `UserInfoCellPhone_hash`,`PJT0`.`CellPhoneConfirmed` AS `UserInfoCellPhoneConfirmed`,`PJT0`.`IssuedBy` AS `UserInfoIssuedBy` from (((`H_AAA_EntityRoles` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_AAA_UserEntityRoles` `RJT` on(((`RJT`.`EntityRoleId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `PJT0` on(((`RJT`.`UserId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where (((0 <> `BaseTable`.`RecordDeleted`) is not true) and ((0 <> `BaseTable`.`IsDefault`) is not true)) */;
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
/*!50001 VIEW `Vi_DPA_Vehicle` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Plate` AS `Plate`,`BaseTable`.`VIN` AS `VIN`,`BaseTable`.`Make` AS `Make`,`BaseTable`.`Model` AS `Model`,`BaseTable`.`Province` AS `Province`,`BaseTable`.`Color` AS `Color`,`BaseTable`.`Year` AS `Year`,`BaseTable`.`Cargo_Height` AS `Cargo_Height`,`BaseTable`.`Cargo_Weight` AS `Cargo_Weight`,`BaseTable`.`Cargo_Length` AS `Cargo_Length`,`BaseTable`.`Cargo_Width` AS `Cargo_Width`,`BaseTable`.`Capacity_Passengers` AS `Capacity_Passengers`,`BaseTable`.`Capacity_Luggage` AS `Capacity_Luggage`,`BaseTable`.`VehicleType` AS `VehicleType` from `H_VehicleProfile` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_VehicleDriversSuperDetail` AS select `BaseTable`.`Id` AS `VehicleProfileId`,`BaseTable`.`Plate` AS `VehicleProfilePlate`,`BaseTable`.`VIN` AS `VehicleProfileVIN`,`BaseTable`.`Make` AS `VehicleProfileMake`,`BaseTable`.`Model` AS `VehicleProfileModel`,`BaseTable`.`Province` AS `VehicleProfileProvince`,`BaseTable`.`Color` AS `VehicleProfileColor`,`BaseTable`.`Year` AS `VehicleProfileYear`,`BaseTable`.`TransportCategory` AS `VehicleProfileTransportCategory`,`BaseTable`.`Cargo_Height` AS `VehicleProfileCargo_Height`,`BaseTable`.`Cargo_Weight` AS `VehicleProfileCargo_Weight`,`BaseTable`.`Cargo_Length` AS `VehicleProfileCargo_Length`,`BaseTable`.`Cargo_Width` AS `VehicleProfileCargo_Width`,`BaseTable`.`Capacity_Passengers` AS `VehicleProfileCapacity_Passengers`,`BaseTable`.`Capacity_Luggage` AS `VehicleProfileCapacity_Luggage`,`BaseTable`.`VehicleType` AS `VehicleProfileVehicleType`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`HasRule` AS `HasRule`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`RJT`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`PJT0`.`UserId` AS `DriverUserId`,`PJT0`.`PersonCVOId` AS `DriverPersonCVOId`,`PUI_0_0`.`Firstname_fsx` AS `DriverFirstname_fsx`,`PUI_0_0`.`Lastname_fsx` AS `DriverLastname_fsx`,`PUI_0_0`.`Username` AS `DriverUsername`,`PUI_0_0`.`Email_fsx` AS `DriverEmail_fsx`,`PUI_0_0`.`Email_hash` AS `DriverEmail_hash`,`PUI_0_0`.`EmailConfirmed` AS `DriverEmailConfirmed`,`PUI_0_0`.`CellPhone_fsx` AS `DriverCellPhone_fsx`,`PUI_0_0`.`CellPhone_hash` AS `DriverCellPhone_hash`,`PUI_0_0`.`CellPhoneConfirmed` AS `DriverCellPhoneConfirmed`,`PUI_0_0`.`IssuedBy` AS `DriverIssuedBy`,`PUI_0_0`.`RecordKey` AS `DriverRecordKey`,`PUI_0_0`.`CreatedAt_UTC` AS `DriverCreatedAt_UTC`,`PUI_0_0`.`CreatedBy` AS `DriverCreatedBy`,`PUI_0_0`.`ModifiedAt_UTC` AS `DriverModifiedAt_UTC`,`PUI_0_0`.`ModifiedBy` AS `DriverModifiedBy`,`PUI_0_0`.`RecordDeleted` AS `DriverRecordDeleted` from (((`H_VehicleProfile` `BaseTable` join `H_VehicleDrivers` `RJT` on(((`RJT`.`VehicleId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_Drivers` `PJT0` on(((`RJT`.`DriverId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_Synced_UserInfo` `PUI_0_0` on(((`PJT0`.`UserId` = `PUI_0_0`.`Id`) and ((0 <> `PUI_0_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_VehicleFeaturesSuperDetail` AS select `BaseTable`.`Id` AS `FeatureId`,`BaseTable`.`Title` AS `FeatureTitle`,`RJT`.`VehicleId` AS `VehicleId`,`RJT`.`HasRule` AS `HasRule`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`RJT`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`PJT0`.`Plate` AS `VehicleProfilePlate`,`PJT0`.`VIN` AS `VehicleProfileVIN`,`PJT0`.`Make` AS `VehicleProfileMake`,`PJT0`.`Model` AS `VehicleProfileModel`,`PJT0`.`Province` AS `VehicleProfileProvince`,`PJT0`.`Color` AS `VehicleProfileColor`,`PJT0`.`Year` AS `VehicleProfileYear`,`PJT0`.`TransportCategory` AS `VehicleProfileTransportCategory`,`PJT0`.`Cargo_Height` AS `VehicleProfileCargo_Height`,`PJT0`.`Cargo_Weight` AS `VehicleProfileCargo_Weight`,`PJT0`.`Cargo_Length` AS `VehicleProfileCargo_Length`,`PJT0`.`Cargo_Width` AS `VehicleProfileCargo_Width`,`PJT0`.`Capacity_Passengers` AS `VehicleProfileCapacity_Passengers`,`PJT0`.`Capacity_Luggage` AS `VehicleProfileCapacity_Luggage`,`PJT0`.`VehicleType` AS `VehicleProfileVehicleType` from ((`H_Features` `BaseTable` join `H_VehicleFeatures` `RJT` on(((`RJT`.`FeatureId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_VehicleProfile` `PJT0` on(((`RJT`.`VehicleId` = `PJT0`.`Id`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_VehiclePermitsExtraDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_VehiclePermitsExtraDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_VehiclePermitsExtraDetail` AS select `BaseTable`.`Id` AS `VehicleProfileId`,`BaseTable`.`Plate` AS `VehicleProfilePlate`,`BaseTable`.`VIN` AS `VehicleProfileVIN`,`BaseTable`.`Make` AS `VehicleProfileMake`,`BaseTable`.`Model` AS `VehicleProfileModel`,`BaseTable`.`Province` AS `VehicleProfileProvince`,`BaseTable`.`Color` AS `VehicleProfileColor`,`BaseTable`.`Year` AS `VehicleProfileYear`,`BaseTable`.`Cargo_Height` AS `VehicleProfileCargo_Height`,`BaseTable`.`Cargo_Weight` AS `VehicleProfileCargo_Weight`,`BaseTable`.`Cargo_Length` AS `VehicleProfileCargo_Length`,`BaseTable`.`Cargo_Width` AS `VehicleProfileCargo_Width`,`BaseTable`.`Capacity_Passengers` AS `VehicleProfileCapacity_Passengers`,`BaseTable`.`Capacity_Luggage` AS `VehicleProfileCapacity_Luggage`,`BaseTable`.`VehicleType` AS `VehicleProfileVehicleType`,`RJT`.`HUBId` AS `HUBId`,`RJT`.`DistributorId` AS `DistributorId`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`ActENUM` AS `ActENUM`,`RJT`.`PermitIssuerId` AS `PermitIssuerId`,`RJT`.`PermitTypeId` AS `PermitTypeId`,`RJT`.`Code` AS `Code`,`RJT`.`ServiceCategory` AS `ServiceCategory`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`PJT0`.`EntityId` AS `EntityScenarioEntityId`,`PJT0`.`ScenarioId` AS `EntityScenarioScenarioId`,`PEP_0_0`.`Title` AS `EntityScenarioTitle`,`PEP_0_0`.`Address_fsx` AS `EntityScenarioAddress_fsx`,`PEP_0_0`.`City` AS `EntityScenarioCity`,`PEP_0_0`.`Province` AS `EntityScenarioProvince`,`PEP_0_0`.`Country` AS `EntityScenarioCountry`,`PEP_0_0`.`PostalCode_fsx` AS `EntityScenarioPostalCode_fsx`,`PEP_0_0`.`Phone_fsx` AS `EntityScenarioPhone_fsx`,`PEP_0_0`.`FaxNumber_fsx` AS `EntityScenarioFaxNumber_fsx`,`PEP_0_0`.`Email_fsx` AS `EntityScenarioEmail_fsx`,`PEP_0_0`.`Discriminator` AS `EntityScenarioDiscriminator`,`PJT1`.`ActENUM` AS `PermitTypeActENUM`,`PJT1`.`ActivityClassENUM` AS `PermitTypeActivityClassENUM`,`PJT1`.`Title` AS `PermitTypeTitle`,`PJT1`.`AllowedServiceCategories` AS `PermitTypeAllowedServiceCategories`,`PJT1`.`Extendable` AS `PermitTypeExtendable`,`PJT1`.`ProfileDependant` AS `PermitTypeProfileDependant`,`PJT2`.`EntityId` AS `PermitIssuerEntityId`,`PEP_2_0`.`Title` AS `PermitIssuerTitle`,`PEP_2_0`.`Address_fsx` AS `PermitIssuerAddress_fsx`,`PEP_2_0`.`City` AS `PermitIssuerCity`,`PEP_2_0`.`Province` AS `PermitIssuerProvince`,`PEP_2_0`.`Country` AS `PermitIssuerCountry`,`PEP_2_0`.`PostalCode_fsx` AS `PermitIssuerPostalCode_fsx`,`PEP_2_0`.`Phone_fsx` AS `PermitIssuerPhone_fsx`,`PEP_2_0`.`FaxNumber_fsx` AS `PermitIssuerFaxNumber_fsx`,`PEP_2_0`.`Email_fsx` AS `PermitIssuerEmail_fsx`,`PEP_2_0`.`Discriminator` AS `PermitIssuerDiscriminator` from ((((((`H_VehicleProfile` `BaseTable` join `H_Permits` `RJT` on(((`RJT`.`VehicleId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) join `H_AAA_EntityScenarios` `PJT0` on(((`RJT`.`ActENUM` = `PJT0`.`PermittedActENUM`) and ((0 <> `PJT0`.`RecordDeleted`) is not true)))) join `H_AAA_EntityProfile` `PEP_0_0` on(((`PJT0`.`EntityId` = `PEP_0_0`.`Id`) and ((0 <> `PEP_0_0`.`RecordDeleted`) is not true)))) join `H_PermitTypes` `PJT1` on(((`RJT`.`PermitTypeId` = `PJT1`.`Id`) and ((0 <> `PJT1`.`RecordDeleted`) is not true)))) join `H_PermitIssuers` `PJT2` on(((`RJT`.`PermitIssuerId` = `PJT2`.`Id`) and ((0 <> `PJT2`.`RecordDeleted`) is not true)))) join `H_AAA_EntityProfile` `PEP_2_0` on(((`PJT2`.`EntityId` = `PEP_2_0`.`Id`) and ((0 <> `PEP_2_0`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_VehicleProfile` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Plate` AS `Plate`,`BaseTable`.`VIN` AS `VIN`,`BaseTable`.`Make` AS `Make`,`BaseTable`.`Model` AS `Model`,`BaseTable`.`Province` AS `Province`,`BaseTable`.`Color` AS `Color`,`BaseTable`.`Year` AS `Year`,`BaseTable`.`TransportCategory` AS `TransportCategory`,`BaseTable`.`Cargo_Height` AS `Cargo_Height`,`BaseTable`.`Cargo_Weight` AS `Cargo_Weight`,`BaseTable`.`Cargo_Length` AS `Cargo_Length`,`BaseTable`.`Cargo_Width` AS `Cargo_Width`,`BaseTable`.`Capacity_Passengers` AS `Capacity_Passengers`,`BaseTable`.`Capacity_Luggage` AS `Capacity_Luggage`,`BaseTable`.`VehicleType` AS `VehicleType` from `H_VehicleProfile` `BaseTable` where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_VehicleProfileEntityConfigsExtraDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_VehicleProfileEntityConfigsExtraDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_VehicleProfileEntityConfigsExtraDetail` AS select `BaseTable`.`Id` AS `VehicleProfileId`,`BaseTable`.`Plate` AS `VehicleProfilePlate`,`BaseTable`.`VIN` AS `VehicleProfileVIN`,`BaseTable`.`Make` AS `VehicleProfileMake`,`BaseTable`.`Model` AS `VehicleProfileModel`,`BaseTable`.`Province` AS `VehicleProfileProvince`,`BaseTable`.`Color` AS `VehicleProfileColor`,`BaseTable`.`Year` AS `VehicleProfileYear`,`BaseTable`.`TransportCategory` AS `VehicleProfileTransportCategory`,`BaseTable`.`Cargo_Height` AS `VehicleProfileCargo_Height`,`BaseTable`.`Cargo_Weight` AS `VehicleProfileCargo_Weight`,`BaseTable`.`Cargo_Length` AS `VehicleProfileCargo_Length`,`BaseTable`.`Cargo_Width` AS `VehicleProfileCargo_Width`,`BaseTable`.`Capacity_Passengers` AS `VehicleProfileCapacity_Passengers`,`BaseTable`.`Capacity_Luggage` AS `VehicleProfileCapacity_Luggage`,`BaseTable`.`VehicleType` AS `VehicleProfileVehicleType`,`RJT`.`PermitIssuerId` AS `PermitIssuerId`,`RJT`.`HUBId` AS `HUBId`,`RJT`.`DistributorId` AS `DistributorId`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`ActENUM` AS `ActENUM`,`RJT`.`ScenarioId` AS `ScenarioId`,`RJT`.`ConfigBaseId` AS `ConfigBaseId`,`RJT`.`Value` AS `Value`,`RJT`.`IsOverridable` AS `IsOverridable` from (`H_VehicleProfile` `BaseTable` join `H_CFG_EntityConfigs` `RJT` on(((`RJT`.`VehicleId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPA_VehicleProfilePermitsExtraDetail` AS select `BaseTable`.`Id` AS `VehicleProfileId`,`BaseTable`.`Plate` AS `VehicleProfilePlate`,`BaseTable`.`VIN` AS `VehicleProfileVIN`,`BaseTable`.`Make` AS `VehicleProfileMake`,`BaseTable`.`Model` AS `VehicleProfileModel`,`BaseTable`.`Province` AS `VehicleProfileProvince`,`BaseTable`.`Color` AS `VehicleProfileColor`,`BaseTable`.`Year` AS `VehicleProfileYear`,`BaseTable`.`TransportCategory` AS `VehicleProfileTransportCategory`,`BaseTable`.`Cargo_Height` AS `VehicleProfileCargo_Height`,`BaseTable`.`Cargo_Weight` AS `VehicleProfileCargo_Weight`,`BaseTable`.`Cargo_Length` AS `VehicleProfileCargo_Length`,`BaseTable`.`Cargo_Width` AS `VehicleProfileCargo_Width`,`BaseTable`.`Capacity_Passengers` AS `VehicleProfileCapacity_Passengers`,`BaseTable`.`Capacity_Luggage` AS `VehicleProfileCapacity_Luggage`,`BaseTable`.`VehicleType` AS `VehicleProfileVehicleType`,`RJT`.`HUBId` AS `HUBId`,`RJT`.`DistributorId` AS `DistributorId`,`RJT`.`CVOId` AS `CVOId`,`RJT`.`DriverId` AS `DriverId`,`RJT`.`ActENUM` AS `ActENUM`,`RJT`.`PermitIssuerId` AS `PermitIssuerId`,`RJT`.`PermitTypeId` AS `PermitTypeId`,`RJT`.`Code` AS `Code`,`RJT`.`ServiceCategory` AS `ServiceCategory`,`RJT`.`IssuedDate_UTC` AS `IssuedDate_UTC` from (`H_VehicleProfile` `BaseTable` join `H_Permits` `RJT` on(((`RJT`.`VehicleId` = `BaseTable`.`Id`) and ((0 <> `RJT`.`RecordDeleted`) is not true)))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_VehicleProfileSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_VehicleProfileSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_VehicleProfileSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Plate` AS `Plate`,`BaseTable`.`VIN` AS `VIN`,`BaseTable`.`Make` AS `Make`,`BaseTable`.`Model` AS `Model`,`BaseTable`.`Province` AS `Province`,`BaseTable`.`Color` AS `Color`,`BaseTable`.`Year` AS `Year`,`BaseTable`.`TransportCategory` AS `TransportCategory`,`BaseTable`.`Cargo_Height` AS `Cargo_Height`,`BaseTable`.`Cargo_Weight` AS `Cargo_Weight`,`BaseTable`.`Cargo_Length` AS `Cargo_Length`,`BaseTable`.`Cargo_Width` AS `Cargo_Width`,`BaseTable`.`Capacity_Passengers` AS `Capacity_Passengers`,`BaseTable`.`Capacity_Luggage` AS `Capacity_Luggage`,`BaseTable`.`VehicleType` AS `VehicleType`,`TempQuery0`.`RelatedEntityCount` AS `EntityConfigsCount`,`TempQuery1`.`RelatedEntityCount` AS `CVOVehiclesCount`,`TempQuery2`.`RelatedEntityCount` AS `PermitsCount`,`TempQuery3`.`RelatedEntityCount` AS `VehicleDriversCount`,`TempQuery4`.`RelatedEntityCount` AS `VehicleFeaturesCount` from (((((`H_VehicleProfile` `BaseTable` left join (select `RT0`.`VehicleId` AS `VehicleId`,count(`RT0`.`VehicleId`) AS `RelatedEntityCount` from `H_CFG_EntityConfigs` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`VehicleId`) `TempQuery0` on((`TempQuery0`.`VehicleId` = `BaseTable`.`Id`))) left join (select `RT1`.`VehicleId` AS `VehicleId`,count(`RT1`.`VehicleId`) AS `RelatedEntityCount` from `H_CVOVehicles` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`VehicleId`) `TempQuery1` on((`TempQuery1`.`VehicleId` = `BaseTable`.`Id`))) left join (select `RT2`.`VehicleId` AS `VehicleId`,count(`RT2`.`VehicleId`) AS `RelatedEntityCount` from `H_Permits` `RT2` where ((0 <> `RT2`.`RecordDeleted`) is not true) group by `RT2`.`VehicleId`) `TempQuery2` on((`TempQuery2`.`VehicleId` = `BaseTable`.`Id`))) left join (select `RT3`.`VehicleId` AS `VehicleId`,count(`RT3`.`VehicleId`) AS `RelatedEntityCount` from `H_VehicleDrivers` `RT3` where ((0 <> `RT3`.`RecordDeleted`) is not true) group by `RT3`.`VehicleId`) `TempQuery3` on((`TempQuery3`.`VehicleId` = `BaseTable`.`Id`))) left join (select `RT4`.`VehicleId` AS `VehicleId`,count(`RT4`.`VehicleId`) AS `RelatedEntityCount` from `H_VehicleFeatures` `RT4` where ((0 <> `RT4`.`RecordDeleted`) is not true) group by `RT4`.`VehicleId`) `TempQuery4` on((`TempQuery4`.`VehicleId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPA_VehicleSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPA_VehicleSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPA_VehicleSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Plate` AS `Plate`,`BaseTable`.`VIN` AS `VIN`,`BaseTable`.`Make` AS `Make`,`BaseTable`.`Model` AS `Model`,`BaseTable`.`Province` AS `Province`,`BaseTable`.`Color` AS `Color`,`BaseTable`.`Year` AS `Year`,`BaseTable`.`Cargo_Height` AS `Cargo_Height`,`BaseTable`.`Cargo_Weight` AS `Cargo_Weight`,`BaseTable`.`Cargo_Length` AS `Cargo_Length`,`BaseTable`.`Cargo_Width` AS `Cargo_Width`,`BaseTable`.`Capacity_Passengers` AS `Capacity_Passengers`,`BaseTable`.`Capacity_Luggage` AS `Capacity_Luggage`,`BaseTable`.`VehicleType` AS `VehicleType`,`TempQuery0`.`RelatedEntityCount` AS `PermitsCount`,`TempQuery1`.`RelatedEntityCount` AS `CVOVehiclesCount`,`TempQuery2`.`RelatedEntityCount` AS `VehicleDriversCount`,`TempQuery3`.`RelatedEntityCount` AS `VehicleFeaturesCount` from ((((`H_VehicleProfile` `BaseTable` left join (select `RT0`.`VehicleId` AS `VehicleId`,count(`RT0`.`VehicleId`) AS `RelatedEntityCount` from `H_Permits` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`VehicleId`) `TempQuery0` on((`TempQuery0`.`VehicleId` = `BaseTable`.`Id`))) left join (select `RT1`.`VehicleId` AS `VehicleId`,count(`RT1`.`VehicleId`) AS `RelatedEntityCount` from `H_CVOVehicles` `RT1` where ((0 <> `RT1`.`RecordDeleted`) is not true) group by `RT1`.`VehicleId`) `TempQuery1` on((`TempQuery1`.`VehicleId` = `BaseTable`.`Id`))) left join (select `RT2`.`VehicleId` AS `VehicleId`,count(`RT2`.`VehicleId`) AS `RelatedEntityCount` from `H_VehicleDrivers` `RT2` where ((0 <> `RT2`.`RecordDeleted`) is not true) group by `RT2`.`VehicleId`) `TempQuery2` on((`TempQuery2`.`VehicleId` = `BaseTable`.`Id`))) left join (select `RT3`.`VehicleId` AS `VehicleId`,count(`RT3`.`VehicleId`) AS `RelatedEntityCount` from `H_VehicleFeatures` `RT3` where ((0 <> `RT3`.`RecordDeleted`) is not true) group by `RT3`.`VehicleId`) `TempQuery3` on((`TempQuery3`.`VehicleId` = `BaseTable`.`Id`))) where ((0 <> `BaseTable`.`RecordDeleted`) is not true) */;
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
/*!50001 VIEW `Vi_DPC_ENUM_ComponentType` AS select lpad((`Upto100`.`Sequence` - 1),2,'0') AS `id`,replace(substring_index(substring_index(substring_index(trim(trailing ')' from `information_schema`.`columns`.`COLUMN_TYPE`),'(',-(1)),',',`Upto100`.`Sequence`),',',-(1)),'\'','') AS `title` from (`information_schema`.`COLUMNS` `columns` join (select (((`A`.`t` * 10) + `B`.`u`) + 1) AS `Sequence` from ((select 0 AS `t` union select 1 AS `1` union select 2 AS `2` union select 3 AS `3` union select 4 AS `4` union select 5 AS `5` union select 6 AS `6` union select 7 AS `7` union select 8 AS `8` union select 9 AS `9`) `A` join (select 0 AS `u` union select 1 AS `1` union select 2 AS `2` union select 3 AS `3` union select 4 AS `4` union select 5 AS `5` union select 6 AS `6` union select 7 AS `7` union select 8 AS `8` union select 9 AS `9`) `B`) order by `Sequence`) `Upto100` on(((char_length(`information_schema`.`columns`.`COLUMN_TYPE`) - char_length(replace(`information_schema`.`columns`.`COLUMN_TYPE`,',',''))) >= (`Upto100`.`Sequence` - 1)))) where ((`information_schema`.`columns`.`TABLE_NAME` = 'H_DP_ComponentsBases') and (`information_schema`.`columns`.`COLUMN_NAME` = 'Type') and (`information_schema`.`columns`.`TABLE_SCHEMA` = 'HBloxTMSGD_DEV01')) order by `Upto100`.`Sequence` */;
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
/*!50001 VIEW `Vi_DPC_EntityRoleSummary` AS select `BaseTable`.`Id` AS `Id`,`BaseTable`.`Title` AS `Title`,`BaseTable`.`EntityId` AS `EntityId`,`BaseTable`.`ActENUM` AS `ActENUM`,`EA`.`Title` AS `ActorTitle`,(case when (`BaseTable`.`ActENUM` = 0) then 1 else 0 end) AS `IsReadOnly`,`BaseTable`.`IsDefault` AS `IsDefault`,`AP`.`Title` AS `EntityTitle`,`AP`.`Address_fsx` AS `EntityAddress_fsx`,`AP`.`City` AS `EntityCity`,`AP`.`Province` AS `EntityProvince`,`AP`.`Country` AS `EntityCountry`,`AP`.`PostalCode_fsx` AS `EntityPostalCode_fsx`,`AP`.`Phone_fsx` AS `EntityPhone_fsx`,`AP`.`FaxNumber_fsx` AS `EntityFaxNumber_fsx`,`AP`.`Email_fsx` AS `EntityEmail_fsx`,`AP`.`Discriminator` AS `EntityDiscriminator`,`TempQuery0`.`RelatedEntityCount` AS `PermissionsCount`,`TempQuery2`.`RelatedEntityCount` AS `UsersCount` from ((((`H_AAA_EntityRoles` `BaseTable` join `H_AAA_EntityProfile` `AP` on(((`BaseTable`.`EntityId` = `AP`.`Id`) and ((0 <> `AP`.`RecordDeleted`) is not true)))) join `H_ENUM_Actors` `EA` on((`BaseTable`.`ActENUM` = `EA`.`ENUM`))) left join (select `RT0`.`RoleId` AS `RoleId`,count(`RT0`.`RoleId`) AS `RelatedEntityCount` from `H_AAA_EntityRolePermissions` `RT0` where ((0 <> `RT0`.`RecordDeleted`) is not true) group by `RT0`.`RoleId`) `TempQuery0` on((`TempQuery0`.`RoleId` = `BaseTable`.`Id`))) left join (select `RT2`.`EntityRoleId` AS `EntityRoleId`,count(`RT2`.`EntityRoleId`) AS `RelatedEntityCount` from `H_AAA_UserEntityRoles` `RT2` where ((0 <> `RT2`.`RecordDeleted`) is not true) group by `RT2`.`EntityRoleId`) `TempQuery2` on((`TempQuery2`.`EntityRoleId` = `BaseTable`.`Id`))) where (((0 <> `BaseTable`.`RecordDeleted`) is not true) and ((0 <> `BaseTable`.`IsDefault`) is not true)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_PermitIssuersEntity`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_PermitIssuersEntity`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_PermitIssuersEntity` AS select `PI`.`Id` AS `Id`,`PI`.`Id` AS `PermitIssuerId`,`PI`.`EntityId` AS `EntityId`,`EP`.`Title` AS `Title`,`EP`.`PartyCode` AS `PartyCode` from (`H_PermitIssuers` `PI` join `H_AAA_EntityProfile` `EP` on((`EP`.`Id` = `PI`.`EntityId`))) where (((0 <> `PI`.`RecordDeleted`) is not true) and ((0 <> `EP`.`RecordDeleted`) is not true)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_DPC_PermitRequestSuperDetail`
--

/*!50001 DROP VIEW IF EXISTS `Vi_DPC_PermitRequestSuperDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_DPC_PermitRequestSuperDetail` AS select `P`.`Id` AS `PermitId`,`P`.`Code` AS `PermitCode`,`P`.`IssuedDate_UTC` AS `IssuedDate_UTC`,`PS`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`PS`.`ConditionENUM` AS `ConditionENUM`,`PS`.`ConditionEndDate_UTC` AS `ConditionEndDate_UTC`,`PS`.`MediaRecordKey` AS `MediaRecordKey`,`PSV`.`PermitStatusId` AS `PermitStatusId`,`PSV`.`RequestStatusId` AS `RequestStatusId`,`RS`.`RequestId` AS `RequestId`,`RS`.`RequesteeUserId` AS `RequesteeUserId`,`RS`.`RequesteeEntityId` AS `RequesteeEntityId`,`RS`.`RequesteeActENUM` AS `RequesteeActENUM`,`RS`.`Status` AS `RequestStatus`,`RS`.`StatusReason` AS `RequestStatusReason`,`R`.`RequesterUserId` AS `RequesterUserId`,`R`.`RequesterEntityId` AS `RequesterEntityId`,`R`.`RequestType` AS `RequestType`,`R`.`Expiry_UTC` AS `RequestExpiryTime`,`P`.`HUBId` AS `HUBId`,`P`.`DistributorId` AS `DistributorId`,`P`.`CVOId` AS `CVOId`,`P`.`VehicleId` AS `VehicleId`,`P`.`DriverId` AS `DriverId`,`P`.`ActENUM` AS `PermitHolderActENUM`,`P`.`PermitIssuerId` AS `PermitIssuerId`,`EP`.`Title` AS `PermitIssuerTitle`,`P`.`PermitTypeId` AS `PermitTypeId`,`PT`.`ActENUM` AS `PermitTypeActENUM`,`PT`.`ActivityClassENUM` AS `PermitTypeActivityClassENUM`,`PT`.`Title` AS `PermitTypeTitle`,`PT`.`AllowedServiceCategories` AS `PermiTypeAllowedServiceCategory`,`PT`.`Extendable` AS `IsPermitExtendable`,`PT`.`ProfileDependant` AS `IsPermitProfileDependant`,`P`.`ServiceCategory` AS `PermitServiceCategory`,`P`.`RecordDeleted` AS `RecordDeleted` from (((((((`H_Permits` `P` join `H_PermitTypes` `PT` on((`PT`.`Id` = `P`.`PermitTypeId`))) join `H_PermitIssuers` `PI` on((`PI`.`Id` = `P`.`PermitIssuerId`))) join `H_AAA_EntityProfile` `EP` on((`EP`.`Id` = `PI`.`EntityId`))) left join `H_PermitStatuses` `PS` on((`P`.`Id` = `PS`.`PermitId`))) left join `H_PermitStatusVerifications` `PSV` on((`PS`.`Id` = `PSV`.`PermitStatusId`))) left join `H_RequestStatuses` `RS` on((`RS`.`Id` = `PSV`.`RequestStatusId`))) left join `H_RequestBases` `R` on((`R`.`Id` = `RS`.`RequestId`))) */;
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
/*!50001 VIEW `Vi_DPC_UserEntityRoleDetail` AS select `EP`.`Id` AS `EntityId`,`EP`.`Title` AS `EntityTitle`,`ER`.`Id` AS `RoleId`,`ER`.`Title` AS `RoleTitle`,`UER`.`UserId` AS `UserId`,`ER`.`ActENUM` AS `ActEnum`,`AE`.`Title` AS `ActTitle`,(case when (`ER`.`ActENUM` = 0) then 1 else 0 end) AS `IsReadOnly` from (((`H_AAA_UserEntityRoles` `UER` join `H_AAA_EntityRoles` `ER` on((`UER`.`EntityRoleId` = `ER`.`Id`))) join `H_AAA_EntityProfile` `EP` on((`ER`.`EntityId` = `EP`.`Id`))) join `H_ENUM_Actors` `AE` on((`AE`.`ENUM` = `ER`.`ActENUM`))) where (((0 <> `UER`.`RecordDeleted`) is not true) and ((0 <> `ER`.`RecordDeleted`) is not true) and ((0 <> `EP`.`RecordDeleted`) is not true)) */;
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
/*!50001 VIEW `Vi_DP_ENUM_ComponentType` AS select lpad((`Upto100`.`Sequence` - 1),2,'0') AS `id`,replace(substring_index(substring_index(substring_index(trim(trailing ')' from `information_schema`.`columns`.`COLUMN_TYPE`),'(',-(1)),',',`Upto100`.`Sequence`),',',-(1)),'\'','') AS `title` from (`information_schema`.`COLUMNS` `columns` join (select (((`A`.`t` * 10) + `B`.`u`) + 1) AS `Sequence` from ((select 0 AS `t` union select 1 AS `1` union select 2 AS `2` union select 3 AS `3` union select 4 AS `4` union select 5 AS `5` union select 6 AS `6` union select 7 AS `7` union select 8 AS `8` union select 9 AS `9`) `A` join (select 0 AS `u` union select 1 AS `1` union select 2 AS `2` union select 3 AS `3` union select 4 AS `4` union select 5 AS `5` union select 6 AS `6` union select 7 AS `7` union select 8 AS `8` union select 9 AS `9`) `B`) order by `Sequence`) `Upto100` on(((char_length(`information_schema`.`columns`.`COLUMN_TYPE`) - char_length(replace(`information_schema`.`columns`.`COLUMN_TYPE`,',',''))) >= (`Upto100`.`Sequence` - 1)))) where ((`information_schema`.`columns`.`TABLE_NAME` = 'H_DP_ComponentsBases') and (`information_schema`.`columns`.`COLUMN_NAME` = 'Type') and (`information_schema`.`columns`.`TABLE_SCHEMA` = 'HBloxTMSGD_DEV01')) order by `Upto100`.`Sequence` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_CVOPermits`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_CVOPermits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_CVOPermits` AS select `p`.`Id` AS `Id`,`p`.`CVOId` AS `CVOId`,`p`.`DistributorId` AS `DistributorId`,`p`.`VehicleId` AS `VehicleId`,`p`.`DriverId` AS `DriverId`,`p`.`PermitTypeId` AS `PermitTypeId`,`p`.`PermitIssuerId` AS `PermitIssuerId`,`p`.`Code` AS `PermitCode`,`p`.`ServiceCategory` AS `ServiceCategory`,`p`.`IssuedDate_UTC` AS `PermitIssuedDate`,`pls`.`PermitStatusId` AS `PermitStatusId`,`pls`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`pls`.`ConditionENUM` AS `PermitConditionENUM`,`pls`.`ConditionEndDate_UTC` AS `PermitConditionEndDate`,coalesce(`pls`.`StatusCategory`,'Unknown') AS `StatusCategory`,coalesce(`pls`.`ConditionTitle`,'Normal') AS `ConditionTitle`,`pls`.`DaysUntilExpiry` AS `DaysUntilExpiry`,`pls`.`IsExpiringSoon` AS `IsExpiringSoon`,`pt`.`Title` AS `PermitTypeTitle`,`pt`.`ActivityClassENUM` AS `ActivityClassENUM`,`pt`.`AllowedServiceCategories` AS `AllowedServiceCategories`,`pt`.`Extendable` AS `Extendable`,`pt`.`ProfileDependant` AS `ProfileDependant`,`pi`.`EntityId` AS `IssuerEntityId`,`issuer_ep`.`Title` AS `IssuerTitle`,`cvo_ep`.`Title` AS `CVOTitle`,`dist_ep`.`Title` AS `DistributorTitle`,coalesce(`v`.`Plate`,'N/A') AS `VehiclePlate`,concat_ws(' ',`ui`.`Firstname_fsx`,`ui`.`Lastname_fsx`) AS `DriverFullName`,(select `pdl`.`Code` from `H_Permits` `pdl` where ((`pdl`.`DriverId` = `p`.`DriverId`) and (`pdl`.`PermitTypeId` = 5001) and (`pdl`.`RecordDeleted` is null)) order by `pdl`.`IssuedDate_UTC` desc,`pdl`.`Id` desc limit 1) AS `DriverLicense`,`p`.`RecordKey` AS `RecordKey`,`p`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`p`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`p`.`RecordDeleted` AS `RecordDeleted` from (((((((((((`H_Permits` `p` left join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) left join `H_PermitTypes` `pt` on((`pt`.`Id` = `p`.`PermitTypeId`))) left join `H_PermitIssuers` `pi` on((`pi`.`Id` = `p`.`PermitIssuerId`))) left join `H_AAA_EntityProfile` `issuer_ep` on((`issuer_ep`.`Id` = `pi`.`EntityId`))) left join `H_CVOs` `cvo` on((`cvo`.`Id` = `p`.`CVOId`))) left join `H_AAA_EntityProfile` `cvo_ep` on((`cvo_ep`.`Id` = `cvo`.`EntityId`))) left join `H_Distributors` `dist` on((`dist`.`Id` = `p`.`DistributorId`))) left join `H_AAA_EntityProfile` `dist_ep` on((`dist_ep`.`Id` = `dist`.`EntityId`))) left join `H_VehicleProfile` `v` on((`v`.`Id` = `p`.`VehicleId`))) left join `H_Drivers` `d` on((`d`.`Id` = `p`.`DriverId`))) left join `H_AAA_Synced_UserInfo` `ui` on((`ui`.`Id` = `d`.`UserId`))) where ((`p`.`CVOId` is not null) and (`p`.`RecordDeleted` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_DistributorListSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DistributorListSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_DistributorListSummary` AS select `d`.`Id` AS `Id`,`d`.`EntityId` AS `EntityId`,`ep`.`Title` AS `EntityTitle`,`ep`.`City` AS `City`,`ep`.`Province` AS `Province`,`ep`.`Phone_fsx` AS `Phone_fsx`,`ep`.`Email_fsx` AS `Email_fsx`,(select count(0) from `H_DistributorCVOs` `dc` where ((`dc`.`DistributorId` = `d`.`Id`) and (`dc`.`RecordDeleted` is null))) AS `CVOCount`,(select count(0) from `H_DistributorDrivers` `dd` where ((`dd`.`DistributorId` = `d`.`Id`) and (`dd`.`RecordDeleted` is null))) AS `DriverCount`,(select count(0) from `H_HUBDistributors` `hd` where ((`hd`.`DistributorId` = `d`.`Id`) and (`hd`.`RecordDeleted` is null))) AS `HUBCount`,count(distinct `p`.`Id`) AS `TotalPermitCount`,count(distinct (case when (`pls`.`StatusCategory` = 'Expired') then `p`.`Id` end)) AS `ExpiredPermitCount`,count(distinct (case when (`pls`.`IsCurrentlyValid` = true) then `p`.`Id` end)) AS `ValidPermitCount`,count(distinct (case when (`pls`.`StatusCategory` = 'Suspended') then `p`.`Id` end)) AS `SuspendedPermitCount`,count(distinct (case when (`pls`.`StatusCategory` = 'Revoked') then `p`.`Id` end)) AS `RevokedPermitCount`,`d`.`RecordKey` AS `RecordKey`,`d`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`d`.`ModifiedAt_UTC` AS `ModifiedAt_UTC` from (((`H_Distributors` `d` join `H_AAA_EntityProfile` `ep` on((`ep`.`Id` = `d`.`EntityId`))) left join `H_Permits` `p` on(((`p`.`DistributorId` = `d`.`Id`) and (`p`.`RecordDeleted` is null)))) left join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where (`d`.`RecordDeleted` is null) group by `d`.`Id`,`d`.`EntityId`,`ep`.`Title`,`ep`.`City`,`ep`.`Province`,`ep`.`Phone_fsx`,`ep`.`Email_fsx`,`d`.`RecordKey`,`d`.`CreatedAt_UTC`,`d`.`ModifiedAt_UTC` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_DistributorPermits`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DistributorPermits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_DistributorPermits` AS select `p`.`Id` AS `Id`,`p`.`DistributorId` AS `DistributorId`,`p`.`CVOId` AS `CVOId`,`p`.`VehicleId` AS `VehicleId`,`p`.`DriverId` AS `DriverId`,`p`.`PermitTypeId` AS `PermitTypeId`,`p`.`PermitIssuerId` AS `PermitIssuerId`,`p`.`Code` AS `PermitCode`,`p`.`ServiceCategory` AS `ServiceCategory`,`p`.`IssuedDate_UTC` AS `PermitIssuedDate`,`pls`.`PermitStatusId` AS `PermitStatusId`,`pls`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`pls`.`ConditionENUM` AS `PermitConditionENUM`,`pls`.`ConditionEndDate_UTC` AS `PermitConditionEndDate`,coalesce(`pls`.`StatusCategory`,'Unknown') AS `StatusCategory`,coalesce(`pls`.`ConditionTitle`,'Normal') AS `ConditionTitle`,`pls`.`DaysUntilExpiry` AS `DaysUntilExpiry`,`pls`.`IsExpiringSoon` AS `IsExpiringSoon`,`pt`.`Title` AS `PermitTypeTitle`,`pt`.`ActivityClassENUM` AS `ActivityClassENUM`,`pt`.`AllowedServiceCategories` AS `AllowedServiceCategories`,`pt`.`Extendable` AS `Extendable`,`pt`.`ProfileDependant` AS `ProfileDependant`,`pi`.`EntityId` AS `IssuerEntityId`,`issuer_ep`.`Title` AS `IssuerTitle`,`dist_ep`.`Title` AS `DistributorTitle`,`cvo_ep`.`Title` AS `CVOTitle`,coalesce(`v`.`Plate`,'N/A') AS `VehiclePlate`,concat_ws(' ',`ui`.`Firstname_fsx`,`ui`.`Lastname_fsx`) AS `DriverFullName`,(select `pdl`.`Code` from `H_Permits` `pdl` where ((`pdl`.`DriverId` = `p`.`DriverId`) and (`pdl`.`PermitTypeId` = 5001) and (`pdl`.`RecordDeleted` is null)) order by `pdl`.`IssuedDate_UTC` desc,`pdl`.`Id` desc limit 1) AS `DriverLicense`,`p`.`RecordKey` AS `RecordKey`,`p`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`p`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`p`.`RecordDeleted` AS `RecordDeleted` from (((((((((((`H_Permits` `p` left join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) left join `H_PermitTypes` `pt` on((`pt`.`Id` = `p`.`PermitTypeId`))) left join `H_PermitIssuers` `pi` on((`pi`.`Id` = `p`.`PermitIssuerId`))) left join `H_AAA_EntityProfile` `issuer_ep` on((`issuer_ep`.`Id` = `pi`.`EntityId`))) left join `H_Distributors` `dist` on((`dist`.`Id` = `p`.`DistributorId`))) left join `H_AAA_EntityProfile` `dist_ep` on((`dist_ep`.`Id` = `dist`.`EntityId`))) left join `H_CVOs` `cvo` on((`cvo`.`Id` = `p`.`CVOId`))) left join `H_AAA_EntityProfile` `cvo_ep` on((`cvo_ep`.`Id` = `cvo`.`EntityId`))) left join `H_VehicleProfile` `v` on((`v`.`Id` = `p`.`VehicleId`))) left join `H_Drivers` `d` on((`d`.`Id` = `p`.`DriverId`))) left join `H_AAA_Synced_UserInfo` `ui` on((`ui`.`Id` = `d`.`UserId`))) where ((`p`.`DistributorId` is not null) and (`p`.`RecordDeleted` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_DriverCVOs`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DriverCVOs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_DriverCVOs` AS select `cd`.`Id` AS `AssignmentId`,`cd`.`DriverId` AS `DriverId`,`cd`.`CVOId` AS `CVOId`,`cd`.`IssuedDate_UTC` AS `AssignmentStartDate`,`cd`.`ExpiryDate_UTC` AS `AssignmentEndDate`,`cd`.`HasRule` AS `HasRule`,`cd`.`RecordKey` AS `AssignmentRecordKey`,(case when (`cd`.`ExpiryDate_UTC` is null) then 'Active' when (`cd`.`ExpiryDate_UTC` < utc_timestamp()) then 'Expired' else 'Active' end) AS `AssignmentStatus`,(case when (`d`.`PersonCVOId` = `cd`.`CVOId`) then true else false end) AS `IsPrimaryCVO`,`cvo`.`EntityId` AS `CVOEntityId`,`cvo_ep`.`Title` AS `CVOTitle`,`cvo_ep`.`City` AS `CVOCity`,`cvo_ep`.`Province` AS `CVOProvince`,`cvo_ep`.`Phone_fsx` AS `CVOPhone`,`cvo_ep`.`Email_fsx` AS `CVOEmail`,concat_ws(' ',`ui`.`Firstname_fsx`,`ui`.`Lastname_fsx`) AS `DriverFullName`,`cd`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`cd`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`cd`.`RecordDeleted` AS `RecordDeleted` from ((((`H_CVODrivers` `cd` join `H_CVOs` `cvo` on((`cvo`.`Id` = `cd`.`CVOId`))) join `H_AAA_EntityProfile` `cvo_ep` on((`cvo_ep`.`Id` = `cvo`.`EntityId`))) join `H_Drivers` `d` on((`d`.`Id` = `cd`.`DriverId`))) left join `H_AAA_Synced_UserInfo` `ui` on((`ui`.`Id` = `d`.`UserId`))) where (`cd`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_DriverDLVC`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DriverDLVC`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_DriverDLVC` AS select `dpvt`.`Id` AS `Id`,`p`.`DriverId` AS `DriverId`,`dpvt`.`VehicleType` AS `VehicleTypeENUM`,`evt`.`Title` AS `VehicleTypeTitle`,`p`.`Id` AS `PermitId`,`p`.`Code` AS `PermitCode`,`pt`.`Title` AS `PermitTypeTitle`,`pls`.`ExpiryDate_UTC` AS `PermitExpiryDate`,`pls`.`ConditionENUM` AS `PermitConditionENUM`,coalesce(`pls`.`StatusCategory`,'Unknown') AS `PermitStatus`,`dpvt`.`RecordKey` AS `RecordKey`,`dpvt`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`dpvt`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`dpvt`.`RecordDeleted` AS `RecordDeleted` from ((((`H_DriverPermitVehicleTypes` `dpvt` join `H_Permits` `p` on((`p`.`Id` = `dpvt`.`PermitId`))) left join `H_PermitTypes` `pt` on((`pt`.`Id` = `p`.`PermitTypeId`))) left join `H_ENUM_VehicleTypes` `evt` on((`evt`.`ENUM` = `dpvt`.`VehicleType`))) left join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`PermitTypeId` = 5001) and (`p`.`DriverId` is not null) and (`dpvt`.`RecordDeleted` is null) and (`p`.`RecordDeleted` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_DriverDistributors`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DriverDistributors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_DriverDistributors` AS select `dd`.`Id` AS `AssignmentId`,`dd`.`DriverId` AS `DriverId`,`dd`.`DistributorId` AS `DistributorId`,`dd`.`IssuedDate_UTC` AS `AssignmentStartDate`,`dd`.`ExpiryDate_UTC` AS `AssignmentEndDate`,`dd`.`RecordKey` AS `AssignmentRecordKey`,(case when (`dd`.`ExpiryDate_UTC` is null) then 'Active' when (`dd`.`ExpiryDate_UTC` < utc_timestamp()) then 'Expired' else 'Active' end) AS `AssignmentStatus`,`d`.`EntityId` AS `DistributorEntityId`,`dist_ep`.`Title` AS `DistributorTitle`,`dist_ep`.`City` AS `DistributorCity`,`dist_ep`.`Province` AS `DistributorProvince`,`dist_ep`.`Phone_fsx` AS `DistributorPhone`,`dist_ep`.`Email_fsx` AS `DistributorEmail`,(select count(0) from `H_Permits` `p` where ((`p`.`DriverId` = `dd`.`DriverId`) and (`p`.`DistributorId` = `dd`.`DistributorId`) and (`p`.`RecordDeleted` is null))) AS `PermitCount`,`dd`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`dd`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`dd`.`RecordDeleted` AS `RecordDeleted` from ((`H_DistributorDrivers` `dd` join `H_Distributors` `d` on((`d`.`Id` = `dd`.`DistributorId`))) join `H_AAA_EntityProfile` `dist_ep` on((`dist_ep`.`Id` = `d`.`EntityId`))) where (`dd`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_DriverListSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DriverListSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_DriverListSummary` AS select `d`.`Id` AS `Id`,`d`.`UserId` AS `UserId`,`d`.`PersonCVOId` AS `PersonCVOId`,`d`.`RecordKey` AS `RecordKey`,`d`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`d`.`CreatedBy` AS `CreatedBy`,`d`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`d`.`ModifiedBy` AS `ModifiedBy`,`d`.`RecordDeleted` AS `RecordDeleted`,concat_ws(' ',`ui`.`Firstname_fsx`,`ui`.`Lastname_fsx`) AS `FullName`,`ui`.`Firstname_fsx` AS `Firstname`,`ui`.`Lastname_fsx` AS `Lastname`,`ui`.`Username` AS `Username`,`ui`.`Email_fsx` AS `Email`,`ui`.`CellPhone_fsx` AS `CellPhone`,(select `p`.`Code` from `H_Permits` `p` where ((`p`.`DriverId` = `d`.`Id`) and (`p`.`PermitTypeId` = 5001) and (`p`.`RecordDeleted` is null)) order by `p`.`IssuedDate_UTC` desc,`p`.`Id` desc limit 1) AS `DriverLicense`,(select `pls`.`ExpiryDate_UTC` from (`H_Permits` `p` left join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`DriverId` = `d`.`Id`) and (`p`.`PermitTypeId` = 5001) and (`p`.`RecordDeleted` is null)) order by `p`.`IssuedDate_UTC` desc,`p`.`Id` desc limit 1) AS `DriverLicenseExpiry`,(select coalesce(`pls`.`StatusCategory`,'Unknown') from (`H_Permits` `p` left join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`DriverId` = `d`.`Id`) and (`p`.`PermitTypeId` = 5001) and (`p`.`RecordDeleted` is null)) order by `p`.`IssuedDate_UTC` desc,`p`.`Id` desc limit 1) AS `DriverLicenseStatus`,(select `pls`.`ConditionENUM` from (`H_Permits` `p` left join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`DriverId` = `d`.`Id`) and (`p`.`PermitTypeId` = 5001) and (`p`.`RecordDeleted` is null)) order by `p`.`IssuedDate_UTC` desc,`p`.`Id` desc limit 1) AS `DriverLicenseConditionENUM`,concat_ws(' ',`ui`.`Firstname_fsx`,`ui`.`Lastname_fsx`) AS `UserFullName`,`ui`.`Email_fsx` AS `UserEmail`,`ui`.`Username` AS `UserUsername`,`cvo_ep`.`Title` AS `PrimaryCVOTitle`,`cvo_ep`.`City` AS `PrimaryCVOCity`,(select count(0) from `H_Permits` `p` where ((`p`.`DriverId` = `d`.`Id`) and (`p`.`RecordDeleted` is null))) AS `TotalPermitCount`,(select count(0) from (`H_Permits` `p` join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`DriverId` = `d`.`Id`) and (`pls`.`IsCurrentlyValid` = true) and (`p`.`RecordDeleted` is null))) AS `ValidPermitCount`,(select count(0) from (`H_Permits` `p` join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`DriverId` = `d`.`Id`) and (`pls`.`StatusCategory` = 'Expired') and (`p`.`RecordDeleted` is null))) AS `ExpiredPermitCount`,(select count(0) from (`H_Permits` `p` join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`DriverId` = `d`.`Id`) and (`pls`.`StatusCategory` = 'Suspended') and (`p`.`RecordDeleted` is null))) AS `SuspendedPermitCount`,(select count(0) from (`H_Permits` `p` join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`DriverId` = `d`.`Id`) and (`pls`.`StatusCategory` = 'Revoked') and (`p`.`RecordDeleted` is null))) AS `RevokedPermitCount`,(select max(`pls`.`ExpiryDate_UTC`) from (`H_Permits` `p` join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`DriverId` = `d`.`Id`) and (`pls`.`IsCurrentlyValid` = true) and (`p`.`RecordDeleted` is null))) AS `NextValidPermitExpiry`,(select count(0) from `H_VehicleDrivers` `vd` where ((`vd`.`DriverId` = `d`.`Id`) and (`vd`.`RecordDeleted` is null))) AS `VehicleCount`,(select count(0) from `H_DistributorDrivers` `dd` where ((`dd`.`DriverId` = `d`.`Id`) and (`dd`.`RecordDeleted` is null))) AS `DistributorCount`,(select count(0) from `H_CVODrivers` `cd` where ((`cd`.`DriverId` = `d`.`Id`) and (`cd`.`RecordDeleted` is null))) AS `CVOCount`,(select count(distinct `dpvt`.`VehicleType`) from (`H_DriverPermitVehicleTypes` `dpvt` join `H_Permits` `p` on((`p`.`Id` = `dpvt`.`PermitId`))) where ((`p`.`DriverId` = `d`.`Id`) and (`p`.`PermitTypeId` = 5001) and (`dpvt`.`RecordDeleted` is null) and (`p`.`RecordDeleted` is null))) AS `LicensedVehicleTypeCount`,(select json_arrayagg(`dlvc_badges`.`VehicleTypeTitle`) from (select `vt`.`Title` AS `VehicleTypeTitle` from ((`H_DriverPermitVehicleTypes` `dpvt` join `H_Permits` `p` on((`p`.`Id` = `dpvt`.`PermitId`))) join `H_ENUM_VehicleTypes` `vt` on((`vt`.`ENUM` = `dpvt`.`VehicleType`))) where ((`p`.`DriverId` = `d`.`Id`) and (`p`.`PermitTypeId` = 5001) and (`dpvt`.`RecordDeleted` is null) and (`p`.`RecordDeleted` is null)) order by `vt`.`Title`,`dpvt`.`Id` limit 3) `dlvc_badges`) AS `LicensedVehicleTypeBadges` from (((`H_Drivers` `d` left join `H_AAA_Synced_UserInfo` `ui` on((`ui`.`Id` = `d`.`UserId`))) left join `H_CVOs` `cvo` on((`cvo`.`Id` = `d`.`PersonCVOId`))) left join `H_AAA_EntityProfile` `cvo_ep` on((`cvo_ep`.`Id` = `cvo`.`EntityId`))) where (`d`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_DriverPermits`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DriverPermits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_DriverPermits` AS select `p`.`Id` AS `Id`,`p`.`DriverId` AS `DriverId`,`p`.`Code` AS `PermitCode`,`p`.`ServiceCategory` AS `ServiceCategory`,`p`.`IssuedDate_UTC` AS `PermitIssuedDate`,`pls`.`PermitStatusId` AS `PermitStatusId`,`pls`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`pls`.`ConditionENUM` AS `PermitConditionENUM`,`pls`.`ConditionEndDate_UTC` AS `PermitConditionEndDate`,coalesce(`pls`.`StatusCategory`,'Unknown') AS `StatusCategory`,coalesce(`pls`.`ConditionTitle`,'Normal') AS `ConditionTitle`,`pls`.`DaysUntilExpiry` AS `DaysUntilExpiry`,`pls`.`IsExpiringSoon` AS `IsExpiringSoon`,`p`.`PermitTypeId` AS `PermitTypeId`,`pt`.`Title` AS `PermitTypeTitle`,`pt`.`ActivityClassENUM` AS `ActivityClassENUM`,`pt`.`AllowedServiceCategories` AS `AllowedServiceCategories`,`pt`.`Extendable` AS `Extendable`,`pt`.`ProfileDependant` AS `ProfileDependant`,`p`.`PermitIssuerId` AS `PermitIssuerId`,`pi`.`EntityId` AS `IssuerEntityId`,`issuer_ep`.`Title` AS `IssuerTitle`,`p`.`VehicleId` AS `VehicleId`,coalesce(`v`.`Plate`,'N/A') AS `VehiclePlate`,coalesce(`v`.`Make`,'') AS `VehicleMake`,coalesce(`v`.`Model`,'') AS `VehicleModel`,`p`.`CVOId` AS `CVOId`,`cvo`.`EntityId` AS `CVOEntityId`,`cvo_ep`.`Title` AS `CVOTitle`,`p`.`DistributorId` AS `DistributorId`,`dist`.`EntityId` AS `DistributorEntityId`,`dist_ep`.`Title` AS `DistributorTitle`,`p`.`HUBId` AS `HUBId`,`hub`.`EntityId` AS `HUBEntityId`,`hub_ep`.`Title` AS `HUBTitle`,`p`.`RecordKey` AS `RecordKey`,`p`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`p`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`p`.`RecordDeleted` AS `RecordDeleted` from (((((((((((`H_Permits` `p` left join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) left join `H_PermitTypes` `pt` on((`pt`.`Id` = `p`.`PermitTypeId`))) left join `H_PermitIssuers` `pi` on((`pi`.`Id` = `p`.`PermitIssuerId`))) left join `H_AAA_EntityProfile` `issuer_ep` on((`issuer_ep`.`Id` = `pi`.`EntityId`))) left join `H_VehicleProfile` `v` on((`v`.`Id` = `p`.`VehicleId`))) left join `H_CVOs` `cvo` on((`cvo`.`Id` = `p`.`CVOId`))) left join `H_AAA_EntityProfile` `cvo_ep` on((`cvo_ep`.`Id` = `cvo`.`EntityId`))) left join `H_Distributors` `dist` on((`dist`.`Id` = `p`.`DistributorId`))) left join `H_AAA_EntityProfile` `dist_ep` on((`dist_ep`.`Id` = `dist`.`EntityId`))) left join `H_HUBs` `hub` on((`hub`.`Id` = `p`.`HUBId`))) left join `H_AAA_EntityProfile` `hub_ep` on((`hub_ep`.`Id` = `hub`.`EntityId`))) where ((`p`.`DriverId` is not null) and (`p`.`RecordDeleted` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_DriverProfile`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DriverProfile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_DriverProfile` AS select `d`.`Id` AS `Id`,`d`.`UserId` AS `UserId`,`d`.`PersonCVOId` AS `PersonCVOId`,`d`.`RecordKey` AS `RecordKey`,`d`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`d`.`CreatedBy` AS `CreatedBy`,`d`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`d`.`ModifiedBy` AS `ModifiedBy`,`d`.`RecordDeleted` AS `RecordDeleted`,concat_ws(' ',`ui`.`Firstname_fsx`,`ui`.`Lastname_fsx`) AS `FullName`,(select `p`.`Code` from `H_Permits` `p` where ((`p`.`DriverId` = `d`.`Id`) and (`p`.`PermitTypeId` = 5001) and (`p`.`RecordDeleted` is null)) order by `p`.`IssuedDate_UTC` desc,`p`.`Id` desc limit 1) AS `DriverLicense`,(select coalesce(`pls`.`StatusCategory`,'Unknown') from (`H_Permits` `p` left join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`DriverId` = `d`.`Id`) and (`p`.`PermitTypeId` = 5001) and (`p`.`RecordDeleted` is null)) order by `p`.`IssuedDate_UTC` desc,`p`.`Id` desc limit 1) AS `DriverLicenseStatus`,(select `pls`.`ExpiryDate_UTC` from (`H_Permits` `p` left join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`DriverId` = `d`.`Id`) and (`p`.`PermitTypeId` = 5001) and (`p`.`RecordDeleted` is null)) order by `p`.`IssuedDate_UTC` desc,`p`.`Id` desc limit 1) AS `DriverLicenseExpiry`,(select `pls`.`ConditionENUM` from (`H_Permits` `p` left join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`DriverId` = `d`.`Id`) and (`p`.`PermitTypeId` = 5001) and (`p`.`RecordDeleted` is null)) order by `p`.`IssuedDate_UTC` desc,`p`.`Id` desc limit 1) AS `DriverLicenseConditionENUM`,`ui`.`Firstname_fsx` AS `UserFirstname`,`ui`.`Lastname_fsx` AS `UserLastname`,`ui`.`Username` AS `UserUsername`,`ui`.`Email_fsx` AS `UserEmail`,`ui`.`CellPhone_fsx` AS `UserCellPhone`,`ui`.`EmailConfirmed` AS `UserEmailConfirmed`,`ui`.`CellPhoneConfirmed` AS `UserCellPhoneConfirmed`,`cvo`.`EntityId` AS `PrimaryCVOEntityId`,`cvo_ep`.`Title` AS `PrimaryCVOTitle`,`cvo_ep`.`City` AS `PrimaryCVOCity`,`cvo_ep`.`Province` AS `PrimaryCVOProvince`,`cvo_ep`.`Phone_fsx` AS `PrimaryCVOPhone`,`cvo_ep`.`Email_fsx` AS `PrimaryCVOEmail`,(select count(0) from `H_Permits` `p` where ((`p`.`DriverId` = `d`.`Id`) and (`p`.`RecordDeleted` is null))) AS `TotalPermitCount`,(select count(0) from (`H_Permits` `p` join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`DriverId` = `d`.`Id`) and (`pls`.`IsCurrentlyValid` = true) and (`p`.`RecordDeleted` is null))) AS `ValidPermitCount`,(select count(0) from (`H_Permits` `p` join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`DriverId` = `d`.`Id`) and (`pls`.`StatusCategory` = 'Expired') and (`p`.`RecordDeleted` is null))) AS `ExpiredPermitCount`,(select count(0) from (`H_Permits` `p` join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`DriverId` = `d`.`Id`) and (`pls`.`StatusCategory` = 'Suspended') and (`p`.`RecordDeleted` is null))) AS `SuspendedPermitCount`,(select count(0) from (`H_Permits` `p` join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`DriverId` = `d`.`Id`) and (`pls`.`StatusCategory` = 'Revoked') and (`p`.`RecordDeleted` is null))) AS `RevokedPermitCount`,(select count(0) from `H_VehicleDrivers` `vd` where ((`vd`.`DriverId` = `d`.`Id`) and (`vd`.`RecordDeleted` is null))) AS `VehicleCount`,(select count(0) from `H_DistributorDrivers` `dd` where ((`dd`.`DriverId` = `d`.`Id`) and (`dd`.`RecordDeleted` is null))) AS `DistributorCount`,(select count(0) from `H_CVODrivers` `cd` where ((`cd`.`DriverId` = `d`.`Id`) and (`cd`.`RecordDeleted` is null))) AS `CVOCount`,(select count(distinct `dpvt`.`VehicleType`) from (`H_DriverPermitVehicleTypes` `dpvt` join `H_Permits` `p` on((`p`.`Id` = `dpvt`.`PermitId`))) where ((`p`.`DriverId` = `d`.`Id`) and (`p`.`PermitTypeId` = 5001) and (`dpvt`.`RecordDeleted` is null) and (`p`.`RecordDeleted` is null))) AS `LicensedVehicleTypeCount` from (((`H_Drivers` `d` left join `H_AAA_Synced_UserInfo` `ui` on((`ui`.`Id` = `d`.`UserId`))) left join `H_CVOs` `cvo` on((`cvo`.`Id` = `d`.`PersonCVOId`))) left join `H_AAA_EntityProfile` `cvo_ep` on((`cvo_ep`.`Id` = `cvo`.`EntityId`))) where (`d`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_DriverVehicles`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_DriverVehicles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_DriverVehicles` AS select `vd`.`Id` AS `AssignmentId`,`vd`.`DriverId` AS `DriverId`,`vd`.`VehicleId` AS `VehicleId`,`vd`.`IssuedDate_UTC` AS `AssignmentStartDate`,`vd`.`ExpiryDate_UTC` AS `AssignmentEndDate`,`vd`.`RecordKey` AS `AssignmentRecordKey`,(case when (`vd`.`ExpiryDate_UTC` is null) then 'Active' when (`vd`.`ExpiryDate_UTC` < utc_timestamp()) then 'Expired' else 'Active' end) AS `AssignmentStatus`,(to_days(`vd`.`ExpiryDate_UTC`) - to_days(utc_timestamp())) AS `DaysUntilExpiry`,`v`.`Plate` AS `VehiclePlate`,`v`.`VIN` AS `VehicleVIN`,`v`.`Make` AS `VehicleMake`,`v`.`Model` AS `VehicleModel`,`v`.`Year` AS `VehicleYear`,`v`.`VehicleType` AS `VehicleType`,`v`.`Color` AS `Color`,`cv`.`CVOId` AS `VehicleCVOId`,`cvo_ep`.`Title` AS `VehicleCVOTitle`,(select count(0) from `H_Permits` `p` where ((`p`.`VehicleId` = `v`.`Id`) and (`p`.`DriverId` = `vd`.`DriverId`) and (`p`.`RecordDeleted` is null))) AS `VehiclePermitCount`,`vd`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`vd`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`vd`.`RecordDeleted` AS `RecordDeleted` from ((((`H_VehicleDrivers` `vd` join `H_VehicleProfile` `v` on(((`v`.`Id` = `vd`.`VehicleId`) and (`v`.`RecordDeleted` is null)))) left join `H_CVOVehicles` `cv` on(((`cv`.`VehicleId` = `v`.`Id`) and (`cv`.`RecordDeleted` is null)))) left join `H_CVOs` `cvo` on((`cvo`.`Id` = `cv`.`CVOId`))) left join `H_AAA_EntityProfile` `cvo_ep` on((`cvo_ep`.`Id` = `cvo`.`EntityId`))) where (`vd`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_HUBDistributors`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_HUBDistributors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_HUBDistributors` AS select `hd`.`Id` AS `AssignmentId`,`hd`.`HUBId` AS `HUBId`,`hd`.`DistributorId` AS `DistributorId`,`hd`.`ParticipationCategory` AS `ParticipationCategory`,`hd`.`HasRule` AS `HasRule`,`hd`.`IssuedDate_UTC` AS `AssignmentStartDate`,`hd`.`ExpiryDate_UTC` AS `AssignmentEndDate`,(case when (`hd`.`ExpiryDate_UTC` is null) then 'Active' when (`hd`.`ExpiryDate_UTC` < utc_timestamp()) then 'Expired' else 'Active' end) AS `AssignmentStatus`,`d`.`EntityId` AS `DistributorEntityId`,`ep`.`Title` AS `DistributorTitle`,`ep`.`City` AS `DistributorCity`,`ep`.`Province` AS `DistributorProvince`,`ep`.`Phone_fsx` AS `DistributorPhone`,`ep`.`Email_fsx` AS `DistributorEmail`,(select count(0) from `H_DistributorCVOs` `dc` where ((`dc`.`DistributorId` = `d`.`Id`) and (`dc`.`RecordDeleted` is null))) AS `DistributorCVOCount`,(select count(0) from `H_Permits` `p` where ((`p`.`DistributorId` = `d`.`Id`) and (`p`.`RecordDeleted` is null))) AS `DistributorPermitCount`,`hd`.`RecordKey` AS `RecordKey`,`hd`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`hd`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`hd`.`RecordDeleted` AS `RecordDeleted` from ((`H_HUBDistributors` `hd` join `H_Distributors` `d` on((`d`.`Id` = `hd`.`DistributorId`))) join `H_AAA_EntityProfile` `ep` on((`ep`.`Id` = `d`.`EntityId`))) where (`hd`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_HUBListSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_HUBListSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_HUBListSummary` AS select `h`.`Id` AS `Id`,`h`.`EntityId` AS `EntityId`,`ep`.`PartyCode` AS `PartyCode`,`ep`.`Title` AS `EntityTitle`,`ep`.`Address_fsx` AS `Address_fsx`,`ep`.`City` AS `City`,`ep`.`Province` AS `Province`,`ep`.`Country` AS `Country`,`ep`.`PostalCode_fsx` AS `PostalCode_fsx`,`ep`.`Phone_fsx` AS `Phone_fsx`,`ep`.`FaxNumber_fsx` AS `FaxNumber_fsx`,`ep`.`Email_fsx` AS `Email_fsx`,count(distinct `hd`.`DistributorId`) AS `DistributorCount`,count(distinct `p`.`Id`) AS `TotalPermitCount`,count(distinct (case when (`pls`.`StatusCategory` = 'Expired') then `p`.`Id` end)) AS `ExpiredPermitCount`,count(distinct (case when (`pls`.`IsCurrentlyValid` = true) then `p`.`Id` end)) AS `ValidPermitCount`,count(distinct (case when (`pls`.`StatusCategory` = 'Suspended') then `p`.`Id` end)) AS `SuspendedPermitCount`,count(distinct (case when (`pls`.`StatusCategory` = 'Revoked') then `p`.`Id` end)) AS `RevokedPermitCount`,(select count(distinct `cv`.`CVOId`) from (`H_CVOVehicles` `cv` join `H_Permits` `p2` on((`p2`.`VehicleId` = `cv`.`VehicleId`))) where ((`p2`.`HUBId` = `h`.`Id`) and (`p2`.`RecordDeleted` is null))) AS `CVOLinkCount`,`h`.`RecordKey` AS `RecordKey`,`h`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`h`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`h`.`RecordDeleted` AS `RecordDeleted` from ((((`H_HUBs` `h` join `H_AAA_EntityProfile` `ep` on((`ep`.`Id` = `h`.`EntityId`))) left join `H_HUBDistributors` `hd` on(((`hd`.`HUBId` = `h`.`Id`) and (`hd`.`RecordDeleted` is null)))) left join `H_Permits` `p` on(((`p`.`HUBId` = `h`.`Id`) and (`p`.`RecordDeleted` is null)))) left join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where (`h`.`RecordDeleted` is null) group by `h`.`Id`,`h`.`EntityId`,`ep`.`PartyCode`,`ep`.`Title`,`ep`.`Address_fsx`,`ep`.`City`,`ep`.`Province`,`ep`.`Country`,`ep`.`PostalCode_fsx`,`ep`.`Phone_fsx`,`ep`.`FaxNumber_fsx`,`ep`.`Email_fsx`,`h`.`RecordKey`,`h`.`CreatedAt_UTC`,`h`.`ModifiedAt_UTC`,`h`.`RecordDeleted` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_HUBPermits`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_HUBPermits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_HUBPermits` AS select `p`.`Id` AS `Id`,`p`.`HUBId` AS `HUBId`,`p`.`DistributorId` AS `DistributorId`,`p`.`CVOId` AS `CVOId`,`p`.`VehicleId` AS `VehicleId`,`p`.`DriverId` AS `DriverId`,`p`.`PermitTypeId` AS `PermitTypeId`,`p`.`PermitIssuerId` AS `PermitIssuerId`,`p`.`Code` AS `PermitCode`,`p`.`ServiceCategory` AS `ServiceCategory`,`p`.`IssuedDate_UTC` AS `PermitIssuedDate`,`pls`.`PermitStatusId` AS `PermitStatusId`,`pls`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`pls`.`ConditionENUM` AS `PermitConditionENUM`,`pls`.`ConditionEndDate_UTC` AS `PermitConditionEndDate`,coalesce(`pls`.`StatusCategory`,'Unknown') AS `StatusCategory`,coalesce(`pls`.`ConditionTitle`,'Normal') AS `ConditionTitle`,`pls`.`DaysUntilExpiry` AS `DaysUntilExpiry`,`pls`.`IsExpiringSoon` AS `IsExpiringSoon`,`pt`.`Title` AS `PermitTypeTitle`,`pt`.`ActivityClassENUM` AS `ActivityClassENUM`,`pt`.`AllowedServiceCategories` AS `AllowedServiceCategories`,`pt`.`Extendable` AS `Extendable`,`pt`.`ProfileDependant` AS `ProfileDependant`,`pi`.`EntityId` AS `IssuerEntityId`,`issuer_ep`.`Title` AS `IssuerTitle`,`p`.`ActENUM` AS `ActENUM`,`es`.`ScenarioId` AS `ScenarioId`,`sc`.`Description` AS `ScenarioDescription`,`hub_ep`.`Title` AS `HUBName`,coalesce(`v`.`Plate`,'N/A') AS `VehiclePlate`,concat_ws(' ',`ui`.`Firstname_fsx`,`ui`.`Lastname_fsx`) AS `DriverFullName`,(select `pdl`.`Code` from `H_Permits` `pdl` where ((`pdl`.`DriverId` = `p`.`DriverId`) and (`pdl`.`PermitTypeId` = 5001) and (`pdl`.`RecordDeleted` is null)) order by `pdl`.`IssuedDate_UTC` desc,`pdl`.`Id` desc limit 1) AS `DriverLicense`,`p`.`RecordKey` AS `RecordKey`,`p`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`p`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`p`.`RecordDeleted` AS `RecordDeleted` from (((((((((((`H_Permits` `p` left join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) left join `H_PermitTypes` `pt` on((`pt`.`Id` = `p`.`PermitTypeId`))) left join `H_PermitIssuers` `pi` on((`pi`.`Id` = `p`.`PermitIssuerId`))) left join `H_AAA_EntityProfile` `issuer_ep` on((`issuer_ep`.`Id` = `pi`.`EntityId`))) left join `H_HUBs` `h` on((`h`.`Id` = `p`.`HUBId`))) left join `H_AAA_EntityScenarios` `es` on(((`es`.`EntityId` = `h`.`EntityId`) and (`es`.`PermittedActENUM` = `p`.`ActENUM`) and (`es`.`RecordDeleted` is null)))) left join `H_AAA_Scenarios` `sc` on(((`sc`.`Id` = `es`.`ScenarioId`) and (`sc`.`RecordDeleted` is null)))) left join `H_AAA_EntityProfile` `hub_ep` on((`hub_ep`.`Id` = `h`.`EntityId`))) left join `H_VehicleProfile` `v` on((`v`.`Id` = `p`.`VehicleId`))) left join `H_Drivers` `d` on((`d`.`Id` = `p`.`DriverId`))) left join `H_AAA_Synced_UserInfo` `ui` on((`ui`.`Id` = `d`.`UserId`))) where ((`p`.`HUBId` is not null) and (`p`.`RecordDeleted` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_HUBProfile`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_HUBProfile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_HUBProfile` AS select `h`.`Id` AS `Id`,`h`.`EntityId` AS `EntityId`,`h`.`RecordKey` AS `RecordKey`,`h`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`h`.`CreatedBy` AS `CreatedBy`,`h`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`h`.`ModifiedBy` AS `ModifiedBy`,`h`.`RecordDeleted` AS `RecordDeleted`,`ep`.`PartyCode` AS `PartyCode`,`ep`.`Title` AS `EntityTitle`,`ep`.`Address_fsx` AS `Address_fsx`,`ep`.`City` AS `City`,`ep`.`Province` AS `Province`,`ep`.`Country` AS `Country`,`ep`.`PostalCode_fsx` AS `PostalCode_fsx`,`ep`.`Phone_fsx` AS `Phone_fsx`,`ep`.`FaxNumber_fsx` AS `FaxNumber_fsx`,`ep`.`Email_fsx` AS `Email_fsx`,`ep`.`Discriminator` AS `Discriminator`,(select count(0) from `H_HUBDistributors` `hd` where ((`hd`.`HUBId` = `h`.`Id`) and (`hd`.`RecordDeleted` is null))) AS `DistributorCount`,(select count(0) from `H_Permits` `p` where ((`p`.`HUBId` = `h`.`Id`) and (`p`.`RecordDeleted` is null))) AS `PermitCount`,(select count(0) from (`H_Permits` `p` join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`HUBId` = `h`.`Id`) and (`pls`.`IsCurrentlyValid` = true) and (`p`.`RecordDeleted` is null))) AS `ValidPermitCount`,(select count(0) from (`H_Permits` `p` join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`HUBId` = `h`.`Id`) and (`pls`.`StatusCategory` = 'Expired') and (`p`.`RecordDeleted` is null))) AS `ExpiredPermitCount`,(select count(0) from (`H_Permits` `p` join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`HUBId` = `h`.`Id`) and (`pls`.`StatusCategory` = 'Suspended') and (`p`.`RecordDeleted` is null))) AS `SuspendedPermitCount`,(select count(0) from (`H_Permits` `p` join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`HUBId` = `h`.`Id`) and (`pls`.`StatusCategory` = 'Revoked') and (`p`.`RecordDeleted` is null))) AS `RevokedPermitCount` from (`H_HUBs` `h` join `H_AAA_EntityProfile` `ep` on((`ep`.`Id` = `h`.`EntityId`))) where (`h`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_PermitLatestStatus`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_PermitLatestStatus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_PermitLatestStatus` AS select `ranked`.`Id` AS `PermitStatusId`,`ranked`.`PermitId` AS `PermitId`,`ranked`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`ranked`.`ConditionENUM` AS `ConditionENUM`,`ranked`.`ConditionEndDate_UTC` AS `ConditionEndDate_UTC`,`ranked`.`MediaRecordKey` AS `MediaRecordKey`,`ranked`.`RecordKey` AS `RecordKey`,`ranked`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`ranked`.`CreatedBy` AS `CreatedBy`,`ranked`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`ranked`.`ModifiedBy` AS `ModifiedBy`,(case when (`ranked`.`ConditionENUM` = 4) then 'Revoked' when (`ranked`.`ExpiryDate_UTC` < utc_timestamp()) then 'Expired' when (`ranked`.`ConditionENUM` = 1) then 'Suspended' when ((`ranked`.`ConditionENUM` is null) or (`ranked`.`ConditionENUM` in (2,3))) then 'Valid' else 'Unknown' end) AS `StatusCategory`,(case `ranked`.`ConditionENUM` when 1 then 'TempSuspended' when 2 then 'TempValid' when 3 then 'TempExtended' when 4 then 'Revoked' else 'Normal' end) AS `ConditionTitle`,(case when (`ranked`.`ConditionENUM` = 4) then false when (`ranked`.`ExpiryDate_UTC` < utc_timestamp()) then false when (`ranked`.`ConditionENUM` = 1) then false when ((`ranked`.`ConditionENUM` is null) or (`ranked`.`ConditionENUM` in (2,3))) then true else NULL end) AS `IsCurrentlyValid`,(to_days(`ranked`.`ExpiryDate_UTC`) - to_days(utc_timestamp())) AS `DaysUntilExpiry`,(case when (`ranked`.`ExpiryDate_UTC` is null) then NULL when (`ranked`.`ExpiryDate_UTC` < utc_timestamp()) then false when ((to_days(`ranked`.`ExpiryDate_UTC`) - to_days(utc_timestamp())) <= 30) then true else false end) AS `IsExpiringSoon` from (select `ps`.`Id` AS `Id`,`ps`.`PermitId` AS `PermitId`,`ps`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`ps`.`ConditionENUM` AS `ConditionENUM`,`ps`.`ConditionEndDate_UTC` AS `ConditionEndDate_UTC`,`ps`.`MediaRecordKey` AS `MediaRecordKey`,`ps`.`RecordKey` AS `RecordKey`,`ps`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`ps`.`CreatedBy` AS `CreatedBy`,`ps`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`ps`.`ModifiedBy` AS `ModifiedBy`,`ps`.`RecordDeleted` AS `RecordDeleted`,row_number() OVER (PARTITION BY `ps`.`PermitId` ORDER BY `ps`.`CreatedAt_UTC` desc,`ps`.`Id` desc )  AS `RowNum` from `H_PermitStatuses` `ps` where (`ps`.`RecordDeleted` is null)) `ranked` where (`ranked`.`RowNum` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_VehicleCVOs`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_VehicleCVOs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_VehicleCVOs` AS select `cv`.`Id` AS `AssignmentId`,`cv`.`VehicleId` AS `VehicleId`,`cv`.`CVOId` AS `CVOId`,`cv`.`IssuedDate_UTC` AS `AssignmentStartDate`,`cv`.`ExpiryDate_UTC` AS `AssignmentEndDate`,`cv`.`RecordKey` AS `AssignmentRecordKey`,(case when (`cv`.`ExpiryDate_UTC` is null) then 'Active' when (`cv`.`ExpiryDate_UTC` < utc_timestamp()) then 'Expired' else 'Active' end) AS `AssignmentStatus`,`cvo`.`EntityId` AS `EntityId`,`ep`.`Title` AS `CVOTitle`,`ep`.`PartyCode` AS `CVOPartyCode`,`ep`.`City` AS `CVOCity`,`ep`.`Province` AS `CVOProvince`,`ep`.`Country` AS `CVOCountry`,`ep`.`Phone_fsx` AS `CVOPhone`,`ep`.`Email_fsx` AS `CVOEmail`,`cv`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`cv`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`cv`.`RecordDeleted` AS `RecordDeleted` from ((`H_CVOVehicles` `cv` join `H_CVOs` `cvo` on((`cvo`.`Id` = `cv`.`CVOId`))) join `H_AAA_EntityProfile` `ep` on((`ep`.`Id` = `cvo`.`EntityId`))) where (`cv`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_VehicleDrivers`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_VehicleDrivers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_VehicleDrivers` AS select `vd`.`Id` AS `AssignmentId`,`vd`.`VehicleId` AS `VehicleId`,`vd`.`DriverId` AS `DriverId`,`vd`.`IssuedDate_UTC` AS `AssignmentStartDate`,`vd`.`ExpiryDate_UTC` AS `AssignmentEndDate`,`vd`.`RecordKey` AS `AssignmentRecordKey`,(case when (`vd`.`ExpiryDate_UTC` is null) then 'Active' when (`vd`.`ExpiryDate_UTC` < utc_timestamp()) then 'Expired' else 'Active' end) AS `AssignmentStatus`,`ui`.`Firstname_fsx` AS `Firstname`,`ui`.`Lastname_fsx` AS `Lastname`,concat_ws(' ',`ui`.`Firstname_fsx`,`ui`.`Lastname_fsx`) AS `FullName`,`ui`.`Username` AS `Username`,`ui`.`Email_fsx` AS `Email`,`ui`.`CellPhone_fsx` AS `CellPhone`,(select `p`.`Code` from `H_Permits` `p` where ((`p`.`DriverId` = `d`.`Id`) and (`p`.`PermitTypeId` = 5001) and (`p`.`RecordDeleted` is null)) order by `p`.`IssuedDate_UTC` desc,`p`.`Id` desc limit 1) AS `DriverLicense`,`d`.`UserId` AS `UserId`,concat_ws(' ',`ui`.`Firstname_fsx`,`ui`.`Lastname_fsx`) AS `UserFullName`,`ui`.`Email_fsx` AS `UserEmail`,`driver_cvo`.`Id` AS `DriverCVOId`,`driver_ep`.`Title` AS `DriverCVOTitle`,`driver_ep`.`City` AS `DriverCVOCity`,`vd`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`vd`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`vd`.`RecordDeleted` AS `RecordDeleted` from ((((`H_VehicleDrivers` `vd` join `H_Drivers` `d` on(((`d`.`Id` = `vd`.`DriverId`) and (`d`.`RecordDeleted` is null)))) left join `H_AAA_Synced_UserInfo` `ui` on((`ui`.`Id` = `d`.`UserId`))) left join `H_CVOs` `driver_cvo` on((`driver_cvo`.`Id` = `d`.`PersonCVOId`))) left join `H_AAA_EntityProfile` `driver_ep` on((`driver_ep`.`Id` = `driver_cvo`.`EntityId`))) where (`vd`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_VehicleFeatures`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_VehicleFeatures`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_VehicleFeatures` AS select `vf`.`Id` AS `AssignmentId`,`vf`.`VehicleId` AS `VehicleId`,`vf`.`FeatureId` AS `FeatureId`,`f`.`Title` AS `FeatureTitle`,`f`.`RecordKey` AS `FeatureRecordKey`,`vf`.`IssuedDate_UTC` AS `AssignmentStartDate`,`vf`.`ExpiryDate_UTC` AS `AssignmentEndDate`,(case when (`vf`.`ExpiryDate_UTC` is null) then 'Active' when (`vf`.`ExpiryDate_UTC` < utc_timestamp()) then 'Expired' else 'Active' end) AS `AssignmentStatus`,`vf`.`RecordKey` AS `AssignmentRecordKey`,(select count(0) from `H_VehicleFeatures` `vf2` where ((`vf2`.`FeatureId` = `f`.`Id`) and (`vf2`.`RecordDeleted` is null))) AS `FeatureUsageCount`,`vf`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`vf`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`vf`.`RecordDeleted` AS `RecordDeleted` from (`H_VehicleFeatures` `vf` join `H_Features` `f` on((`f`.`Id` = `vf`.`FeatureId`))) where (`vf`.`RecordDeleted` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_VehicleListSummary`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_VehicleListSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_VehicleListSummary` AS select `vp`.`Id` AS `Id`,`vp`.`Plate` AS `Plate`,`vp`.`VIN` AS `VIN`,`vp`.`Make` AS `Make`,`vp`.`Model` AS `Model`,`vp`.`Year` AS `Year`,`vp`.`VehicleType` AS `VehicleType`,`vp`.`Color` AS `Color`,`vp`.`Province` AS `Province`,`vp`.`Cargo_Height` AS `Cargo_Height`,`vp`.`Cargo_Weight` AS `Cargo_Weight`,`vp`.`Cargo_Length` AS `Cargo_Length`,`vp`.`Cargo_Width` AS `Cargo_Width`,`vp`.`Capacity_Passengers` AS `Capacity_Passengers`,`vp`.`Capacity_Luggage` AS `Capacity_Luggage`,`cvo`.`Id` AS `CVOId`,`ep`.`Title` AS `CVOTitle`,`ep`.`City` AS `CVOCity`,`ep`.`Province` AS `CVOProvince`,count(distinct `vd`.`DriverId`) AS `DriverCount`,count(distinct (case when (`pls`.`StatusCategory` = 'Expired') then `p`.`Id` end)) AS `ExpiredPermitCount`,count(distinct (case when (`pls`.`IsCurrentlyValid` = true) then `p`.`Id` end)) AS `ValidPermitCount`,count(distinct `p`.`Id`) AS `TotalPermitCount`,(select json_arrayagg(`feature_badges`.`FeatureTitle`) from (select `f`.`Title` AS `FeatureTitle` from (`H_VehicleFeatures` `vf2` join `H_Features` `f` on((`f`.`Id` = `vf2`.`FeatureId`))) where ((`vf2`.`VehicleId` = `vp`.`Id`) and (`vf2`.`RecordDeleted` is null)) order by `f`.`Title`,`vf2`.`Id` limit 3) `feature_badges`) AS `FeatureBadgesTop3`,count(distinct `vf`.`FeatureId`) AS `FeatureCount`,NULL AS `InspectionStatus`,`vp`.`RecordKey` AS `RecordKey`,`vp`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`vp`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`vp`.`RecordDeleted` AS `RecordDeleted` from (((((((`H_VehicleProfile` `vp` left join `H_CVOVehicles` `cv` on(((`cv`.`VehicleId` = `vp`.`Id`) and (`cv`.`RecordDeleted` is null)))) left join `H_CVOs` `cvo` on((`cvo`.`Id` = `cv`.`CVOId`))) left join `H_AAA_EntityProfile` `ep` on((`ep`.`Id` = `cvo`.`EntityId`))) left join `H_VehicleDrivers` `vd` on(((`vd`.`VehicleId` = `vp`.`Id`) and (`vd`.`RecordDeleted` is null)))) left join `H_Permits` `p` on(((`p`.`VehicleId` = `vp`.`Id`) and (`p`.`RecordDeleted` is null)))) left join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) left join `H_VehicleFeatures` `vf` on(((`vf`.`VehicleId` = `vp`.`Id`) and (`vf`.`RecordDeleted` is null)))) where (`vp`.`RecordDeleted` is null) group by `vp`.`Id`,`vp`.`Plate`,`vp`.`VIN`,`vp`.`Make`,`vp`.`Model`,`vp`.`Year`,`vp`.`VehicleType`,`vp`.`Color`,`vp`.`Province`,`vp`.`Cargo_Height`,`vp`.`Cargo_Weight`,`vp`.`Cargo_Length`,`vp`.`Cargo_Width`,`vp`.`Capacity_Passengers`,`vp`.`Capacity_Luggage`,`cvo`.`Id`,`ep`.`Title`,`ep`.`City`,`ep`.`Province`,`vp`.`RecordKey`,`vp`.`CreatedAt_UTC`,`vp`.`ModifiedAt_UTC`,`vp`.`RecordDeleted` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_VehiclePermits`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_VehiclePermits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_VehiclePermits` AS select `p`.`Id` AS `Id`,`p`.`VehicleId` AS `VehicleId`,`p`.`PermitTypeId` AS `PermitTypeId`,`pt`.`Title` AS `PermitTypeTitle`,`pt`.`ActivityClassENUM` AS `ActivityClassENUM`,`pt`.`AllowedServiceCategories` AS `AllowedServiceCategories`,`pt`.`Extendable` AS `Extendable`,`pt`.`ProfileDependant` AS `ProfileDependant`,`p`.`PermitIssuerId` AS `PermitIssuerId`,`pi`.`EntityId` AS `PermitIssuerEntityId`,`issuer_ep`.`Title` AS `PermitIssuerTitle`,`pls`.`PermitStatusId` AS `PermitStatusId`,`pls`.`ExpiryDate_UTC` AS `ExpiryDate_UTC`,`pls`.`ConditionENUM` AS `PermitConditionENUM`,`pls`.`ConditionEndDate_UTC` AS `PermitConditionEndDate`,coalesce(`pls`.`StatusCategory`,'Unknown') AS `StatusCategory`,coalesce(`pls`.`ConditionTitle`,'Normal') AS `ConditionTitle`,`pls`.`DaysUntilExpiry` AS `DaysUntilExpiry`,`pls`.`IsExpiringSoon` AS `IsExpiringSoon`,`p`.`Code` AS `PermitCode`,`p`.`RecordKey` AS `RecordKey`,`p`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`p`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`p`.`RecordDeleted` AS `RecordDeleted` from ((((`H_Permits` `p` join `H_PermitTypes` `pt` on((`pt`.`Id` = `p`.`PermitTypeId`))) left join `H_PermitIssuers` `pi` on((`pi`.`Id` = `p`.`PermitIssuerId`))) left join `H_AAA_EntityProfile` `issuer_ep` on((`issuer_ep`.`Id` = `pi`.`EntityId`))) left join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where ((`p`.`VehicleId` is not null) and (`p`.`RecordDeleted` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SPC_VehicleProfile`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SPC_VehicleProfile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`YYZdbPPCAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SPC_VehicleProfile` AS select `vp`.`Id` AS `Id`,`vp`.`Plate` AS `Plate`,`vp`.`VIN` AS `VIN`,`vp`.`Make` AS `Make`,`vp`.`Model` AS `Model`,`vp`.`Province` AS `Province`,`vp`.`Color` AS `Color`,`vp`.`Year` AS `Year`,`vp`.`TransportCategory` AS `TransportCategory`,`vp`.`Cargo_Height` AS `Cargo_Height`,`vp`.`Cargo_Weight` AS `Cargo_Weight`,`vp`.`Cargo_Length` AS `Cargo_Length`,`vp`.`Cargo_Width` AS `Cargo_Width`,`vp`.`Capacity_Passengers` AS `Capacity_Passengers`,`vp`.`Capacity_Luggage` AS `Capacity_Luggage`,`vp`.`VehicleType` AS `VehicleType`,`vp`.`RecordKey` AS `RecordKey`,`vp`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`vp`.`CreatedBy` AS `CreatedBy`,`vp`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`vp`.`ModifiedBy` AS `ModifiedBy`,`vp`.`RecordDeleted` AS `RecordDeleted`,`cvo`.`Id` AS `PrimaryCVOId`,`ep`.`Title` AS `PrimaryCVOTitle`,`ep`.`RecordKey` AS `PrimaryCVORecordKey`,`cvo`.`EntityId` AS `CVOEntityId`,`ep_entity`.`Title` AS `CVOEntityTitle`,count(distinct (case when (`pls`.`StatusCategory` = 'Expired') then `p`.`Id` end)) AS `ExpiredPermitCount`,count(distinct (case when (`pls`.`IsCurrentlyValid` = true) then `p`.`Id` end)) AS `ValidPermitCount`,count(distinct `p`.`Id`) AS `TotalPermitCount`,max((case when (`pls`.`IsCurrentlyValid` = true) then `pls`.`ExpiryDate_UTC` end)) AS `NextPermitExpiry`,(select count(0) from `H_VehicleDrivers` `vd` where ((`vd`.`VehicleId` = `vp`.`Id`) and (`vd`.`RecordDeleted` is null))) AS `DriverCount`,(select count(0) from `H_VehicleFeatures` `vf` where ((`vf`.`VehicleId` = `vp`.`Id`) and (`vf`.`RecordDeleted` is null))) AS `FeatureCount` from ((((((`H_VehicleProfile` `vp` left join `H_CVOVehicles` `cv` on(((`cv`.`VehicleId` = `vp`.`Id`) and (`cv`.`RecordDeleted` is null)))) left join `H_CVOs` `cvo` on((`cvo`.`Id` = `cv`.`CVOId`))) left join `H_AAA_EntityProfile` `ep` on((`ep`.`Id` = `cvo`.`EntityId`))) left join `H_AAA_EntityProfile` `ep_entity` on((`ep_entity`.`Id` = `cvo`.`EntityId`))) left join `H_Permits` `p` on(((`p`.`VehicleId` = `vp`.`Id`) and (`p`.`RecordDeleted` is null)))) left join `Vi_SPC_PermitLatestStatus` `pls` on((`pls`.`PermitId` = `p`.`Id`))) where (`vp`.`RecordDeleted` is null) group by `vp`.`Id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SYNC_AAA_FullUserInfo`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SYNC_AAA_FullUserInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SYNC_AAA_FullUserInfo` AS select `UI`.`Id` AS `Id`,`UI`.`Firstname_fsx` AS `Firstname_fsx`,`UI`.`Lastname_fsx` AS `Lastname_fsx`,`UI`.`Username` AS `Username`,`UI`.`Email_fsx` AS `Email_fsx`,`UI`.`Email_hash` AS `Email_hash`,`UI`.`EmailConfirmed` AS `EmailConfirmed`,`UI`.`CellPhone_fsx` AS `CellPhone_fsx`,`UI`.`CellPhone_hash` AS `CellPhone_hash`,`UI`.`CellPhoneConfirmed` AS `CellPhoneConfirmed`,`UI`.`IssuedBy` AS `IssuedBy`,`UI`.`RecordKey` AS `RecordKey`,`UI`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`UI`.`CreatedBy` AS `CreatedBy`,`UI`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`UI`.`ModifiedBy` AS `ModifiedBy`,`UI`.`RecordDeleted` AS `RecordDeleted`,`RUI`.`UserId` AS `UserId`,`RUI`.`PasswordHash` AS `PasswordHash`,`RUI`.`PasswordTemp` AS `PasswordTemp`,`RUI`.`PasswordTempExpires` AS `PasswordTempExpires`,`RUI`.`PasswordTempFor` AS `PasswordTempFor` from (`H_AAA_Synced_UserInfo` `UI` join `H_AAA_Synced_RestrictedUserInfo` `RUI` on((`UI`.`Id` = `RUI`.`UserId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Vi_SYNC_PermitStatusVerifications`
--

/*!50001 DROP VIEW IF EXISTS `Vi_SYNC_PermitStatusVerifications`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`HexaBloxdbAdmin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vi_SYNC_PermitStatusVerifications` AS select `PSV`.`Id` AS `Id`,`PSV`.`PermitStatusId` AS `PermitStatusId`,`RS`.`RequesteeUserId` AS `ApproverUserId`,`RS`.`RequesteeEntityId` AS `ApproverEntityId`,`RS`.`RequesteeActENUM` AS `ApproverActENUM`,`RS`.`Status` AS `ApprovalStatus`,`RS`.`StatusReason` AS `ApprovalStatusReason`,`PSV`.`RecordKey` AS `RecordKey`,`PSV`.`CreatedAt_UTC` AS `CreatedAt_UTC`,`PSV`.`CreatedBy` AS `CreatedBy`,`PSV`.`ModifiedAt_UTC` AS `ModifiedAt_UTC`,`PSV`.`ModifiedBy` AS `ModifiedBy`,`PSV`.`RecordDeleted` AS `RecordDeleted` from (`H_PermitStatusVerifications` `PSV` join `H_RequestStatuses` `RS` on((`PSV`.`RequestStatusId` = `RS`.`Id`))) */;
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

-- Dump completed on 2026-06-13 13:55:57
