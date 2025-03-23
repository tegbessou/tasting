/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: eda_tasting
-- ------------------------------------------------------
-- Server version	10.11.11-MariaDB-ubu2204

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
-- Current Database: `eda_tasting`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `eda_tasting` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `eda_tasting`;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES
('DoctrineMigrations\\Version20241217142038','2025-03-23 18:43:47',9),
('DoctrineMigrations\\Version20241220165416','2025-03-23 18:43:47',3),
('DoctrineMigrations\\Version20241221170800','2025-03-23 18:43:47',5),
('DoctrineMigrations\\Version20241224111359','2025-03-23 18:43:47',15),
('DoctrineMigrations\\Version20241224145300','2025-03-23 18:43:47',4),
('DoctrineMigrations\\Version20241224213050','2025-03-23 18:43:47',2),
('DoctrineMigrations\\Version20241231153606','2025-03-23 18:43:47',7),
('DoctrineMigrations\\Version20250102173445','2025-03-23 18:43:47',5),
('DoctrineMigrations\\Version20250102173652','2025-03-23 18:43:47',12),
('DoctrineMigrations\\Version20250105103521','2025-03-23 18:43:47',2);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eye`
--

DROP TABLE IF EXISTS `eye`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `eye` (
  `id` binary(16) NOT NULL,
  `limpidite` varchar(255) NOT NULL,
  `brillance` varchar(255) NOT NULL,
  `intensite_couleur` varchar(255) NOT NULL,
  `teinte` varchar(255) NOT NULL,
  `larme` varchar(255) NOT NULL,
  `observation` longtext NOT NULL,
  `sheet_id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_727887B18B1206A5` (`sheet_id`),
  CONSTRAINT `FK_727887B18B1206A5` FOREIGN KEY (`sheet_id`) REFERENCES `sheet` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eye`
--

LOCK TABLES `eye` WRITE;
/*!40000 ALTER TABLE `eye` DISABLE KEYS */;
INSERT INTO `eye` VALUES
('�\�%\�\�A蚈oPF\�','opalescente','lumineuse','pâle','ambre','fluide','Observation','S����yM(�\�T\�z|4');
/*!40000 ALTER TABLE `eye` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitation`
--

DROP TABLE IF EXISTS `invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitation` (
  `id` binary(16) NOT NULL,
  `target` varchar(255) NOT NULL,
  `link` longtext NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tasting_id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F11D61A25BC0FE1E` (`tasting_id`),
  CONSTRAINT `FK_F11D61A25BC0FE1E` FOREIGN KEY (`tasting_id`) REFERENCES `tasting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitation`
--

LOCK TABLES `invitation` WRITE;
/*!40000 ALTER TABLE `invitation` DISABLE KEYS */;
INSERT INTO `invitation` VALUES
('�\�/i��M��\��|�Vt','root@gmail.com','https://apps.apple.com/app/6468406309','pending','2025-03-23 18:43:47',NULL,NULL,'.�l5��Ln�I�y\�\�7');
/*!40000 ALTER TABLE `invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mouth`
--

DROP TABLE IF EXISTS `mouth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mouth` (
  `id` binary(16) NOT NULL,
  `alcool` varchar(255) NOT NULL,
  `acide` varchar(255) NOT NULL,
  `matiere` varchar(255) NOT NULL,
  `finale` varchar(255) NOT NULL,
  `observation` longtext NOT NULL,
  `tanin` varchar(255) DEFAULT NULL,
  `sucre` varchar(255) DEFAULT NULL,
  `sheet_id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9EC55C978B1206A5` (`sheet_id`),
  CONSTRAINT `FK_9EC55C978B1206A5` FOREIGN KEY (`sheet_id`) REFERENCES `sheet` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mouth`
--

LOCK TABLES `mouth` WRITE;
/*!40000 ALTER TABLE `mouth` DISABLE KEYS */;
INSERT INTO `mouth` VALUES
('\��\���G���҅Y\�T\�','alcooleux','molle','étoffée','rémanente','Observation','chargé',NULL,'S����yM(�\�T\�z|4');
/*!40000 ALTER TABLE `mouth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nose`
--

DROP TABLE IF EXISTS `nose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nose` (
  `id` binary(16) NOT NULL,
  `impression` varchar(255) NOT NULL,
  `intensite` varchar(255) NOT NULL,
  `arome` varchar(255) NOT NULL,
  `observation` longtext NOT NULL,
  `sheet_id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_80FC6CD38B1206A5` (`sheet_id`),
  CONSTRAINT `FK_80FC6CD38B1206A5` FOREIGN KEY (`sheet_id`) REFERENCES `sheet` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nose`
--

LOCK TABLES `nose` WRITE;
/*!40000 ALTER TABLE `nose` DISABLE KEYS */;
INSERT INTO `nose` VALUES
('\���jB�J*���\�n','simple','ouvert','boisée','Observation','S����yM(�\�T\�z|4');
/*!40000 ALTER TABLE `nose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sheet`
--

DROP TABLE IF EXISTS `sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sheet` (
  `id` binary(16) NOT NULL,
  `tasting_id` binary(16) NOT NULL,
  `participant` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sheet`
--

LOCK TABLES `sheet` WRITE;
/*!40000 ALTER TABLE `sheet` DISABLE KEYS */;
INSERT INTO `sheet` VALUES
('\Z��޻A�j�W\�\�S�','.�l5��Ln�I�y\�\�7','hugues.gobet@gmail.com'),
('S����yM(�\�T\�z|4','�J<�_�Fx�\�\�q���\"','hugues.gobet@gmail.com'),
('}J\�Tz�C��\�\�\�+f��','�W�a\�L��\�\�Mv��','hugues.gobet@gmail.com');
/*!40000 ALTER TABLE `sheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasting`
--

DROP TABLE IF EXISTS `tasting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasting` (
  `id` binary(16) NOT NULL,
  `bottle_name` varchar(255) NOT NULL,
  `participants` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`participants`)),
  `owner_id` varchar(255) NOT NULL,
  `bottle_wine_type` enum('red','white','rosé','orange','champagne','sparkling') NOT NULL,
  `bottle_id` binary(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasting`
--

LOCK TABLES `tasting` WRITE;
/*!40000 ALTER TABLE `tasting` DISABLE KEYS */;
INSERT INTO `tasting` VALUES
('.�l5��Ln�I�y\�\�7','Domaine Leflaive Montrachet Grand Cru 2016','[\"hugues.gobet@gmail.com\"]','hugues.gobet@gmail.com','red','^��{�F\�\�\�v�\�\�_'),
('�J<�_�Fx�\�\�q���\"','Château Latour 2010','[\"hugues.gobet@gmail.com\"]','hugues.gobet@gmail.com','red',')R1��\�N��7\�P\�'),
('�W�a\�L��\�\�Mv��','Domaine Leflaive Montrachet Grand Cru','[\"hugues.gobet@gmail.com\"]','hugues.gobet@gmail.com','white','^��{�F\�\�\�v�\�\�_');
/*!40000 ALTER TABLE `tasting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-23 18:43:48
