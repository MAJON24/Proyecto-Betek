-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: aerolinea
-- ------------------------------------------------------
-- Server version	9.5.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'b7b27fba-cfc5-11f0-ad67-54bf643b4e0e:1-87';

--
-- Table structure for table `avion`
--

DROP TABLE IF EXISTS `avion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avion` (
  `id_avion` int NOT NULL AUTO_INCREMENT,
  `flota` varchar(50) DEFAULT NULL,
  `modelo_avion` varchar(50) DEFAULT NULL,
  `capacidad_total` int DEFAULT NULL,
  `clase_cabina` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_avion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avion`
--

LOCK TABLES `avion` WRITE;
/*!40000 ALTER TABLE `avion` DISABLE KEYS */;
/*!40000 ALTER TABLE `avion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasajero`
--

DROP TABLE IF EXISTS `pasajero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasajero` (
  `documento` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `preferencia_alimentación` varchar(50) DEFAULT NULL,
  `historial_viaje` text,
  PRIMARY KEY (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasajero`
--

LOCK TABLES `pasajero` WRITE;
/*!40000 ALTER TABLE `pasajero` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasajero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasajero_segmento`
--

DROP TABLE IF EXISTS `pasajero_segmento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasajero_segmento` (
  `documento` int NOT NULL,
  `id_segmento` int NOT NULL,
  `fecha_asignacion` date DEFAULT NULL,
  PRIMARY KEY (`documento`,`id_segmento`),
  KEY `id_segmento` (`id_segmento`),
  CONSTRAINT `pasajero_segmento_ibfk_1` FOREIGN KEY (`documento`) REFERENCES `pasajero` (`documento`),
  CONSTRAINT `pasajero_segmento_ibfk_2` FOREIGN KEY (`id_segmento`) REFERENCES `segmento_pasajero` (`id_segmento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasajero_segmento`
--

LOCK TABLES `pasajero_segmento` WRITE;
/*!40000 ALTER TABLE `pasajero_segmento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasajero_segmento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(20) DEFAULT 'activa',
  `fecha_reserva` date DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `id_vuelo` int DEFAULT NULL,
  `documento` int DEFAULT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `documento` (`documento`),
  KEY `id_vuelo` (`id_vuelo`),
  CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`documento`) REFERENCES `pasajero` (`documento`),
  CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`id_vuelo`) REFERENCES `vuelo_programado` (`id_vuelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segmento_pasajero`
--

DROP TABLE IF EXISTS `segmento_pasajero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `segmento_pasajero` (
  `id_segmento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_segmento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segmento_pasajero`
--

LOCK TABLES `segmento_pasajero` WRITE;
/*!40000 ALTER TABLE `segmento_pasajero` DISABLE KEYS */;
INSERT INTO `segmento_pasajero` VALUES (1,'ahorrador','Compra anticipada bajo costo'),(2,'flexible','Cambios frecuentes'),(3,'premiun','Frecuente alto gasto');
/*!40000 ALTER TABLE `segmento_pasajero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiquete`
--

DROP TABLE IF EXISTS `tiquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiquete` (
  `id_tiquete` int NOT NULL AUTO_INCREMENT,
  `precio` float DEFAULT NULL,
  `clase_cabina` varchar(20) DEFAULT NULL,
  `numero_asiento` varchar(10) DEFAULT NULL,
  `cambio` tinyint(1) DEFAULT '1',
  `reembolso` tinyint(1) DEFAULT '0',
  `id_avion` int DEFAULT NULL,
  `id_vuelo` int DEFAULT NULL,
  `documento` int DEFAULT NULL,
  PRIMARY KEY (`id_tiquete`),
  KEY `id_avion` (`id_avion`),
  KEY `id_vuelo` (`id_vuelo`),
  KEY `documento` (`documento`),
  CONSTRAINT `tiquete_ibfk_1` FOREIGN KEY (`id_avion`) REFERENCES `avion` (`id_avion`),
  CONSTRAINT `tiquete_ibfk_2` FOREIGN KEY (`id_vuelo`) REFERENCES `vuelo_programado` (`id_vuelo`),
  CONSTRAINT `tiquete_ibfk_3` FOREIGN KEY (`documento`) REFERENCES `pasajero` (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiquete`
--

LOCK TABLES `tiquete` WRITE;
/*!40000 ALTER TABLE `tiquete` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelo_programado`
--

DROP TABLE IF EXISTS `vuelo_programado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelo_programado` (
  `id_vuelo` int NOT NULL AUTO_INCREMENT,
  `fecha_salida` date DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `origen` varchar(50) DEFAULT NULL,
  `destino` varchar(50) DEFAULT NULL,
  `id_avion` int DEFAULT NULL,
  PRIMARY KEY (`id_vuelo`),
  KEY `id_avion` (`id_avion`),
  CONSTRAINT `vuelo_programado_ibfk_1` FOREIGN KEY (`id_avion`) REFERENCES `avion` (`id_avion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo_programado`
--

LOCK TABLES `vuelo_programado` WRITE;
/*!40000 ALTER TABLE `vuelo_programado` DISABLE KEYS */;
/*!40000 ALTER TABLE `vuelo_programado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelo_tiquete`
--

DROP TABLE IF EXISTS `vuelo_tiquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelo_tiquete` (
  `vuelo_tiquete` int NOT NULL AUTO_INCREMENT,
  `id_vuelo` int DEFAULT NULL,
  `id_tiquete` int DEFAULT NULL,
  PRIMARY KEY (`vuelo_tiquete`),
  KEY `id_vuelo` (`id_vuelo`),
  KEY `id_tiquete` (`id_tiquete`),
  CONSTRAINT `vuelo_tiquete_ibfk_1` FOREIGN KEY (`id_vuelo`) REFERENCES `vuelo_programado` (`id_vuelo`),
  CONSTRAINT `vuelo_tiquete_ibfk_2` FOREIGN KEY (`id_tiquete`) REFERENCES `tiquete` (`id_tiquete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo_tiquete`
--

LOCK TABLES `vuelo_tiquete` WRITE;
/*!40000 ALTER TABLE `vuelo_tiquete` DISABLE KEYS */;
/*!40000 ALTER TABLE `vuelo_tiquete` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-25 14:22:16
