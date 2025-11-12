-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: Ventas
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
-- Table structure for table `Articulo`
--

DROP TABLE IF EXISTS `Articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Articulo` (
  `nroArticulo` int NOT NULL,
  `codFabricante` int NOT NULL,
  `preUnitario` varchar(50) NOT NULL,
  PRIMARY KEY (`nroArticulo`),
  KEY `codFabricante` (`codFabricante`),
  CONSTRAINT `Articulo_ibfk_1` FOREIGN KEY (`codFabricante`) REFERENCES `Fabricante` (`codFabricante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Articulo`
--

LOCK TABLES `Articulo` WRITE;
/*!40000 ALTER TABLE `Articulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cliente` (
  `nroCliente` int NOT NULL,
  `nomCliente` varchar(50) NOT NULL,
  `domCliente` varchar(100) NOT NULL,
  `ciucliente` varchar(50) NOT NULL,
  `codPostal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`nroCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fabricante`
--

DROP TABLE IF EXISTS `Fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fabricante` (
  `codFabricante` int NOT NULL,
  `nomFabricante` varchar(50) NOT NULL,
  PRIMARY KEY (`codFabricante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fabricante`
--

LOCK TABLES `Fabricante` WRITE;
/*!40000 ALTER TABLE `Fabricante` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PEDIDOS`
--

DROP TABLE IF EXISTS `PEDIDOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PEDIDOS` (
  `nroPedido` int NOT NULL,
  `fechPedido` date DEFAULT NULL,
  `tazPedido` decimal(10,2) DEFAULT NULL,
  `monPedido` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`nroPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PEDIDOS`
--

LOCK TABLES `PEDIDOS` WRITE;
/*!40000 ALTER TABLE `PEDIDOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PEDIDOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Realiza`
--

DROP TABLE IF EXISTS `Realiza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Realiza` (
  `nroCliente` int NOT NULL,
  `nroArticulo` int NOT NULL,
  PRIMARY KEY (`nroCliente`,`nroArticulo`),
  KEY `nroArticulo` (`nroArticulo`),
  CONSTRAINT `Realiza_ibfk_1` FOREIGN KEY (`nroCliente`) REFERENCES `Cliente` (`nroCliente`),
  CONSTRAINT `Realiza_ibfk_2` FOREIGN KEY (`nroArticulo`) REFERENCES `Articulo` (`nroArticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Realiza`
--

LOCK TABLES `Realiza` WRITE;
/*!40000 ALTER TABLE `Realiza` DISABLE KEYS */;
/*!40000 ALTER TABLE `Realiza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Telefono_Cliente`
--

DROP TABLE IF EXISTS `Telefono_Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Telefono_Cliente` (
  `nroCliente` int NOT NULL,
  `telCliente` varchar(20) NOT NULL,
  PRIMARY KEY (`nroCliente`,`telCliente`),
  CONSTRAINT `Telefono_Cliente_ibfk_1` FOREIGN KEY (`nroCliente`) REFERENCES `Cliente` (`nroCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Telefono_Cliente`
--

LOCK TABLES `Telefono_Cliente` WRITE;
/*!40000 ALTER TABLE `Telefono_Cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Telefono_Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tiene`
--

DROP TABLE IF EXISTS `Tiene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tiene` (
  `nroArticulo` int NOT NULL,
  `nroPedido` int NOT NULL,
  `cantUnitaria` int NOT NULL,
  PRIMARY KEY (`nroArticulo`),
  KEY `nroPedido` (`nroPedido`),
  CONSTRAINT `Tiene_ibfk_1` FOREIGN KEY (`nroArticulo`) REFERENCES `Articulo` (`nroArticulo`),
  CONSTRAINT `Tiene_ibfk_2` FOREIGN KEY (`nroPedido`) REFERENCES `PEDIDOS` (`nroPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tiene`
--

LOCK TABLES `Tiene` WRITE;
/*!40000 ALTER TABLE `Tiene` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tiene` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-06 19:15:55
