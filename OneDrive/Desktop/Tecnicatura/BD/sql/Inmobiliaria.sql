-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: INMOBILIARIA
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Abren`
--

DROP TABLE IF EXISTS `Abren`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Abren` (
  `RUT` int NOT NULL,
  `idCirculo` int NOT NULL,
  `minPago` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`RUT`,`idCirculo`),
  KEY `idCirculo` (`idCirculo`),
  CONSTRAINT `Abren_ibfk_1` FOREIGN KEY (`RUT`) REFERENCES `INMOBILARIA` (`RUT`),
  CONSTRAINT `Abren_ibfk_2` FOREIGN KEY (`idCirculo`) REFERENCES `CirculosAhorros` (`idCirculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Abren`
--

LOCK TABLES `Abren` WRITE;
/*!40000 ALTER TABLE `Abren` DISABLE KEYS */;
/*!40000 ALTER TABLE `Abren` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Administran`
--

DROP TABLE IF EXISTS `Administran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Administran` (
  `RUT` int NOT NULL,
  `codPropiedad` int NOT NULL,
  `tasaFija` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`RUT`,`codPropiedad`),
  KEY `codPropiedad` (`codPropiedad`),
  CONSTRAINT `Administran_ibfk_1` FOREIGN KEY (`RUT`) REFERENCES `INMOBILARIA` (`RUT`),
  CONSTRAINT `Administran_ibfk_2` FOREIGN KEY (`codPropiedad`) REFERENCES `Propiedades` (`codPropiedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administran`
--

LOCK TABLES `Administran` WRITE;
/*!40000 ALTER TABLE `Administran` DISABLE KEYS */;
/*!40000 ALTER TABLE `Administran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Adquirir`
--

DROP TABLE IF EXISTS `Adquirir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Adquirir` (
  `RUT` int NOT NULL,
  `codPropiedad` int NOT NULL,
  `ciPersona` int NOT NULL,
  PRIMARY KEY (`RUT`,`codPropiedad`),
  KEY `codPropiedad` (`codPropiedad`),
  KEY `ciPersona` (`ciPersona`),
  CONSTRAINT `Adquirir_ibfk_1` FOREIGN KEY (`RUT`) REFERENCES `Administran` (`RUT`),
  CONSTRAINT `Adquirir_ibfk_2` FOREIGN KEY (`codPropiedad`) REFERENCES `Administran` (`codPropiedad`),
  CONSTRAINT `Adquirir_ibfk_3` FOREIGN KEY (`ciPersona`) REFERENCES `Inquilinos` (`ciPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adquirir`
--

LOCK TABLES `Adquirir` WRITE;
/*!40000 ALTER TABLE `Adquirir` DISABLE KEYS */;
/*!40000 ALTER TABLE `Adquirir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Alquilar`
--

DROP TABLE IF EXISTS `Alquilar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alquilar` (
  `ciPersona` int NOT NULL,
  `RUT` int NOT NULL,
  `codPropiedad` int NOT NULL,
  PRIMARY KEY (`ciPersona`),
  KEY `RUT` (`RUT`),
  KEY `codPropiedad` (`codPropiedad`),
  CONSTRAINT `Alquilar_ibfk_1` FOREIGN KEY (`ciPersona`) REFERENCES `Personas` (`ciPersona`),
  CONSTRAINT `Alquilar_ibfk_2` FOREIGN KEY (`RUT`) REFERENCES `Administran` (`RUT`),
  CONSTRAINT `Alquilar_ibfk_3` FOREIGN KEY (`codPropiedad`) REFERENCES `Administran` (`codPropiedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alquilar`
--

LOCK TABLES `Alquilar` WRITE;
/*!40000 ALTER TABLE `Alquilar` DISABLE KEYS */;
/*!40000 ALTER TABLE `Alquilar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Casas`
--

DROP TABLE IF EXISTS `Casas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Casas` (
  `codPropiedad` int NOT NULL,
  `dirPropiedad` varchar(10) NOT NULL,
  `zonaPropiedad` varchar(10) NOT NULL,
  PRIMARY KEY (`codPropiedad`),
  CONSTRAINT `Casas_ibfk_1` FOREIGN KEY (`codPropiedad`) REFERENCES `Propiedades` (`codPropiedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Casas`
--

LOCK TABLES `Casas` WRITE;
/*!40000 ALTER TABLE `Casas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Casas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CirculosAhorros`
--

DROP TABLE IF EXISTS `CirculosAhorros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CirculosAhorros` (
  `idCirculo` int NOT NULL,
  `maxCapitalCirculo` varchar(10) NOT NULL,
  `fechCierreCirculos` date NOT NULL,
  PRIMARY KEY (`idCirculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CirculosAhorros`
--

LOCK TABLES `CirculosAhorros` WRITE;
/*!40000 ALTER TABLE `CirculosAhorros` DISABLE KEYS */;
/*!40000 ALTER TABLE `CirculosAhorros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Compradores`
--

DROP TABLE IF EXISTS `Compradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Compradores` (
  `ciPersona` int NOT NULL,
  PRIMARY KEY (`ciPersona`),
  CONSTRAINT `Compradores_ibfk_1` FOREIGN KEY (`ciPersona`) REFERENCES `Personas` (`ciPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Compradores`
--

LOCK TABLES `Compradores` WRITE;
/*!40000 ALTER TABLE `Compradores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Compradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INMOBILARIA`
--

DROP TABLE IF EXISTS `INMOBILARIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INMOBILARIA` (
  `RUT` int NOT NULL,
  `dirlnmobiliaria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INMOBILARIA`
--

LOCK TABLES `INMOBILARIA` WRITE;
/*!40000 ALTER TABLE `INMOBILARIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `INMOBILARIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inquilinos`
--

DROP TABLE IF EXISTS `Inquilinos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Inquilinos` (
  `ciPersona` int NOT NULL,
  `sueldoInquilino` decimal(10,2) NOT NULL,
  `fechFinContrato` date DEFAULT NULL,
  PRIMARY KEY (`ciPersona`),
  CONSTRAINT `Inquilinos_ibfk_1` FOREIGN KEY (`ciPersona`) REFERENCES `Personas` (`ciPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inquilinos`
--

LOCK TABLES `Inquilinos` WRITE;
/*!40000 ALTER TABLE `Inquilinos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inquilinos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inscripta`
--

DROP TABLE IF EXISTS `Inscripta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Inscripta` (
  `ciPersona` int NOT NULL,
  `RUT` int NOT NULL,
  `idCirculo` int NOT NULL,
  `pagaCuota` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ciPersona`),
  KEY `RUT` (`RUT`),
  KEY `idCirculo` (`idCirculo`),
  CONSTRAINT `Inscripta_ibfk_1` FOREIGN KEY (`ciPersona`) REFERENCES `Personas` (`ciPersona`),
  CONSTRAINT `Inscripta_ibfk_2` FOREIGN KEY (`RUT`) REFERENCES `Abren` (`RUT`),
  CONSTRAINT `Inscripta_ibfk_3` FOREIGN KEY (`idCirculo`) REFERENCES `Abren` (`idCirculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inscripta`
--

LOCK TABLES `Inscripta` WRITE;
/*!40000 ALTER TABLE `Inscripta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inscripta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Locales`
--

DROP TABLE IF EXISTS `Locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Locales` (
  `codPropiedad` int NOT NULL,
  `metroCuadradoLocal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`codPropiedad`),
  CONSTRAINT `Locales_ibfk_1` FOREIGN KEY (`codPropiedad`) REFERENCES `Propiedades` (`codPropiedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Locales`
--

LOCK TABLES `Locales` WRITE;
/*!40000 ALTER TABLE `Locales` DISABLE KEYS */;
/*!40000 ALTER TABLE `Locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ofrece`
--

DROP TABLE IF EXISTS `Ofrece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ofrece` (
  `codPropiedad` int NOT NULL,
  `ciPersona` int NOT NULL,
  `opcionOfrecer` varchar(50) NOT NULL,
  PRIMARY KEY (`codPropiedad`,`ciPersona`),
  KEY `ciPersona` (`ciPersona`),
  CONSTRAINT `Ofrece_ibfk_1` FOREIGN KEY (`codPropiedad`) REFERENCES `Propiedades` (`codPropiedad`),
  CONSTRAINT `Ofrece_ibfk_2` FOREIGN KEY (`ciPersona`) REFERENCES `Personas` (`ciPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ofrece`
--

LOCK TABLES `Ofrece` WRITE;
/*!40000 ALTER TABLE `Ofrece` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ofrece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Personas`
--

DROP TABLE IF EXISTS `Personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Personas` (
  `ciPersona` int NOT NULL,
  `nomPERSONA` varchar(50) DEFAULT NULL,
  `apePersona` varchar(50) DEFAULT NULL,
  `dirPersona` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ciPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Personas`
--

LOCK TABLES `Personas` WRITE;
/*!40000 ALTER TABLE `Personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Propiedades`
--

DROP TABLE IF EXISTS `Propiedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Propiedades` (
  `codPropiedad` int NOT NULL,
  `dirPropiedad` varchar(10) NOT NULL,
  `zonaPropiedad` varchar(10) NOT NULL,
  PRIMARY KEY (`codPropiedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Propiedades`
--

LOCK TABLES `Propiedades` WRITE;
/*!40000 ALTER TABLE `Propiedades` DISABLE KEYS */;
/*!40000 ALTER TABLE `Propiedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Telefono_Inmobiliarias`
--

DROP TABLE IF EXISTS `Telefono_Inmobiliarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Telefono_Inmobiliarias` (
  `RUT` int NOT NULL,
  `telnmobiliaria` int NOT NULL,
  PRIMARY KEY (`RUT`,`telnmobiliaria`),
  CONSTRAINT `Telefono_Inmobiliarias_ibfk_1` FOREIGN KEY (`RUT`) REFERENCES `INMOBILARIA` (`RUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Telefono_Inmobiliarias`
--

LOCK TABLES `Telefono_Inmobiliarias` WRITE;
/*!40000 ALTER TABLE `Telefono_Inmobiliarias` DISABLE KEYS */;
/*!40000 ALTER TABLE `Telefono_Inmobiliarias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-06 22:51:39
