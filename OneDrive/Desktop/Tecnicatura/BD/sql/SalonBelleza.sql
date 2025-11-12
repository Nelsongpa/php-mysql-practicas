 -- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: Salonbelleza
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
-- Table structure for table `Cita`
--

DROP TABLE IF EXISTS `Cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cita` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clientas_id` int DEFAULT NULL,
  `servicio_id` int DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `sucursal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientas_id` (`clientas_id`),
  KEY `servicio_id` (`servicio_id`),
  CONSTRAINT `Cita_ibfk_1` FOREIGN KEY (`clientas_id`) REFERENCES `Clientas` (`clienta_id`),
  CONSTRAINT `Cita_ibfk_2` FOREIGN KEY (`servicio_id`) REFERENCES `Servicio` (`servicio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cita`
--

LOCK TABLES `Cita` WRITE;
/*!40000 ALTER TABLE `Cita` DISABLE KEYS */;
INSERT INTO `Cita` VALUES (1,1111,1,'2025-10-04 15:15:00','Centro'),(2,1112,2,'2025-10-03 12:15:00','punta_carreta'),(3,1113,3,'2025-10-02 19:20:00','Mvd'),(4,1112,2,'2025-09-04 13:15:00','mvd'),(5,1113,2,'2025-09-06 12:15:00','mvd'),(6,1111,2,'2025-09-11 13:15:00','mvd');
/*!40000 ALTER TABLE `Cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clientas`
--

DROP TABLE IF EXISTS `Clientas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientas` (
  `clienta_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`clienta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientas`
--

LOCK TABLES `Clientas` WRITE;
/*!40000 ALTER TABLE `Clientas` DISABLE KEYS */;
INSERT INTO `Clientas` VALUES (1111,'Ana','Araque','nanaaqe@araque'),(1112,'May','Araque','may@araque'),(1113,'Lui','Puente','lui@araque');
/*!40000 ALTER TABLE `Clientas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Servicio`
--

DROP TABLE IF EXISTS `Servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Servicio` (
  `servicio_id` int NOT NULL AUTO_INCREMENT,
  `nombre_servicio` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`servicio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Servicio`
--

LOCK TABLES `Servicio` WRITE;
/*!40000 ALTER TABLE `Servicio` DISABLE KEYS */;
INSERT INTO `Servicio` VALUES (1,'soft_gel',250.00),(2,'Esculpidas',560.00),(3,'Esmaltado',1050.00);
/*!40000 ALTER TABLE `Servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_citas_completa`
--

DROP TABLE IF EXISTS `vista_citas_completa`;
/*!50001 DROP VIEW IF EXISTS `vista_citas_completa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_citas_completa` AS SELECT 
 1 AS `cita_id`,
 1 AS `clienta_nombre`,
 1 AS `clienta_apellido`,
 1 AS `clienta_correo`,
 1 AS `nombre_servicio`,
 1 AS `fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_citas_sucursal`
--

DROP TABLE IF EXISTS `vista_citas_sucursal`;
/*!50001 DROP VIEW IF EXISTS `vista_citas_sucursal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_citas_sucursal` AS SELECT 
 1 AS `cita_id`,
 1 AS `clienta_nombre`,
 1 AS `clienta_apellido`,
 1 AS `nombre_servicio`,
 1 AS `fecha`,
 1 AS `sucursal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ganancia_septiembre`
--

DROP TABLE IF EXISTS `vista_ganancia_septiembre`;
/*!50001 DROP VIEW IF EXISTS `vista_ganancia_septiembre`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ganancia_septiembre` AS SELECT 
 1 AS `sucursal`,
 1 AS `total_ganancia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_servicios_septiembre`
--

DROP TABLE IF EXISTS `vista_servicios_septiembre`;
/*!50001 DROP VIEW IF EXISTS `vista_servicios_septiembre`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_servicios_septiembre` AS SELECT 
 1 AS `sucursal`,
 1 AS `total_servicios`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_citas_completa`
--

/*!50001 DROP VIEW IF EXISTS `vista_citas_completa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_citas_completa` AS select `c`.`id` AS `cita_id`,`cl`.`nombre` AS `clienta_nombre`,`cl`.`apellido` AS `clienta_apellido`,`cl`.`correo` AS `clienta_correo`,`s`.`nombre_servicio` AS `nombre_servicio`,`c`.`fecha` AS `fecha` from ((`Cita` `c` join `Clientas` `cl` on((`c`.`clientas_id` = `cl`.`clienta_id`))) join `Servicio` `s` on((`c`.`servicio_id` = `s`.`servicio_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_citas_sucursal`
--

/*!50001 DROP VIEW IF EXISTS `vista_citas_sucursal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_citas_sucursal` AS select `c`.`id` AS `cita_id`,`cl`.`nombre` AS `clienta_nombre`,`cl`.`apellido` AS `clienta_apellido`,`s`.`nombre_servicio` AS `nombre_servicio`,`c`.`fecha` AS `fecha`,`c`.`sucursal` AS `sucursal` from ((`Cita` `c` join `Clientas` `cl` on((`c`.`clientas_id` = `cl`.`clienta_id`))) join `Servicio` `s` on((`c`.`servicio_id` = `s`.`servicio_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ganancia_septiembre`
--

/*!50001 DROP VIEW IF EXISTS `vista_ganancia_septiembre`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ganancia_septiembre` AS select `c`.`sucursal` AS `sucursal`,sum(`s`.`precio`) AS `total_ganancia` from (`Cita` `c` join `Servicio` `s` on((`c`.`servicio_id` = `s`.`servicio_id`))) where ((month(`c`.`fecha`) = 9) and (`c`.`sucursal` = 'Mvd')) group by `c`.`sucursal` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_servicios_septiembre`
--

/*!50001 DROP VIEW IF EXISTS `vista_servicios_septiembre`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_servicios_septiembre` AS select `c`.`sucursal` AS `sucursal`,count(`s`.`nombre_servicio`) AS `total_servicios` from (`Cita` `c` join `Servicio` `s` on((`c`.`servicio_id` = `s`.`servicio_id`))) where ((month(`c`.`fecha`) = 9) and (`c`.`sucursal` = 'Mvd')) group by `c`.`sucursal` */;
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

-- Dump completed on 2025-10-04 19:14:48
