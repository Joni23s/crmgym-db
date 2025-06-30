CREATE DATABASE  IF NOT EXISTS `crm_gym_egi` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `crm_gym_egi`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: crm_gym_egi
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `dni_cliente` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `habilitado` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`dni_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (30123456,'Ana','Gómez','1990-05-14',0),(30123457,'Mario','Gómez','1988-08-22',1),(30123458,'Lucía','Pérez','2001-01-05',0),(30123459,'Lucas','Pérez','1999-12-30',1),(30123460,'Martín','Rodríguez','1980-03-10',0),(30123461,'Martina','Rodríguez','2005-11-12',1),(30123462,'Sofía','López','1995-07-19',1),(30123463,'Facundo','López','1987-09-03',0),(30123464,'Mara','Giménez','2002-04-25',1),(30123465,'Marcelo','Giménez','1975-10-08',1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto_clientes`
--

DROP TABLE IF EXISTS `contacto_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacto_clientes` (
  `id_contacto_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `dni_cliente` int(11) NOT NULL,
  `tipo_contacto` enum('email','celular','teléfono') NOT NULL,
  `es_principal` tinyint(1) NOT NULL,
  `detalle` varchar(45) NOT NULL,
  PRIMARY KEY (`id_contacto_cliente`),
  UNIQUE KEY `detalle_UNIQUE` (`detalle`),
  KEY `dni_cliente` (`dni_cliente`),
  CONSTRAINT `contacto_clientes_ibfk_1` FOREIGN KEY (`dni_cliente`) REFERENCES `clientes` (`dni_cliente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto_clientes`
--

LOCK TABLES `contacto_clientes` WRITE;
/*!40000 ALTER TABLE `contacto_clientes` DISABLE KEYS */;
INSERT INTO `contacto_clientes` VALUES (1,30123456,'email',1,'maria.gomez@gmail.com'),(2,30123456,'celular',0,'2615123456'),(3,30123457,'email',1,'mario.gomez@outlook.com'),(4,30123457,'teléfono',0,'02634445566'),(5,30123458,'celular',1,'2614007890'),(6,30123459,'email',1,'lucas.perez@gmail.com'),(7,30123459,'celular',0,'2615000001'),(8,30123460,'email',1,'martin.rodriguez@hotmail.com'),(9,30123461,'email',1,'martina.rdz@gmail.com'),(10,30123461,'celular',0,'2616334455'),(11,30123462,'teléfono',1,'02634447788'),(12,30123462,'email',0,'sofia.lopez@gmail.com'),(13,30123463,'celular',1,'2617001111'),(14,30123464,'email',1,'mara.gimenez@gmail.com'),(15,30123464,'celular',0,'2619002233'),(16,30123465,'teléfono',1,'02634449900');
/*!40000 ALTER TABLE `contacto_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_planes`
--

DROP TABLE IF EXISTS `historial_planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_planes` (
  `id_historial` tinyint(3) NOT NULL AUTO_INCREMENT,
  `dni_cliente` int(11) NOT NULL,
  `id_plan` tinyint(2) unsigned NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `es_activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `dni_cliente` (`dni_cliente`),
  KEY `id_plan` (`id_plan`),
  CONSTRAINT `historial_planes_ibfk_1` FOREIGN KEY (`dni_cliente`) REFERENCES `clientes` (`dni_cliente`),
  CONSTRAINT `historial_planes_ibfk_2` FOREIGN KEY (`id_plan`) REFERENCES `planes` (`id_plan`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_planes`
--

LOCK TABLES `historial_planes` WRITE;
/*!40000 ALTER TABLE `historial_planes` DISABLE KEYS */;
INSERT INTO `historial_planes` VALUES (1,30123456,1,'2023-05-15','2024-05-14',0),(2,30123456,2,'2024-05-15','2026-05-14',1),(3,30123457,2,'2024-01-01','2025-12-31',1),(4,30123458,3,'2022-11-20','2023-11-19',0),(5,30123459,1,'2025-02-01','2026-01-31',1),(6,30123460,2,'2021-03-10','2022-03-09',0),(7,30123461,1,'2023-11-12','2024-11-11',0),(8,30123461,2,'2024-11-12','2025-11-11',1),(9,30123462,3,'2024-08-01','2026-07-31',1),(10,30123463,3,'2022-09-01','2023-08-31',0),(11,30123463,1,'2023-09-01','2024-08-31',0),(12,30123464,1,'2022-06-01','2023-05-31',0),(13,30123464,1,'2023-06-01','2024-05-31',0),(14,30123464,2,'2024-06-01','2026-05-31',1),(15,30123465,2,'2023-10-10','2025-10-09',1);
/*!40000 ALTER TABLE `historial_planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructores`
--

DROP TABLE IF EXISTS `instructores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructores` (
  `dni_instructor` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `email` varchar(45) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `habilitado` tinyint(1) NOT NULL,
  `especializacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dni_instructor`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructores`
--

LOCK TABLES `instructores` WRITE;
/*!40000 ALTER TABLE `instructores` DISABLE KEYS */;
INSERT INTO `instructores` VALUES (28555111,'Carlos','Sánchez','carlos.sanchez@gimnasio.com','1155551111',1,'Musculación y Powerlifting'),(30999444,'Valeria','Rizzo','valeria.rizzo@gimnasio.com','1188884444',0,'Zumba'),(32888222,'Laura','Fernández','laura.fernandez@gimnasio.com','1166662222',1,'Yoga y Pilates'),(35111333,'Javier','Torres','javier.torres@gimnasio.com','1177773333',1,'Entrenamiento Funcional'),(38222555,'Matías','Acosta','matias.acosta@gimnasio.com','1199995555',1,NULL);
/*!40000 ALTER TABLE `instructores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL AUTO_INCREMENT,
  `dni_cliente` int(11) NOT NULL,
  `fecha_pago` date NOT NULL,
  `monto_base` decimal(10,2) NOT NULL,
  `metodo_pago` enum('efectivo','tarjeta_credito','tarjeta_debito','transferencia') NOT NULL,
  `estado` enum('pendiente','pagado','vencido') NOT NULL,
  `descuento_aplicado` decimal(10,2) DEFAULT 0.00,
  `monto_final` decimal(10,2) GENERATED ALWAYS AS (`monto_base` - `descuento_aplicado`) STORED,
  PRIMARY KEY (`id_pago`),
  KEY `dni_cliente` (`dni_cliente`),
  CONSTRAINT `fk_pago_cliente` FOREIGN KEY (`dni_cliente`) REFERENCES `clientes` (`dni_cliente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` (`id_pago`, `dni_cliente`, `fecha_pago`, `monto_base`, `metodo_pago`, `estado`, `descuento_aplicado`) VALUES (1,30123456,'2025-05-28',5000.00,'efectivo','pagado',0.00),(2,30123457,'2025-05-29',4500.00,'efectivo','vencido',200.00),(3,30123459,'2025-06-01',5200.00,'tarjeta_credito','pagado',0.00),(4,30123461,'2025-06-02',4800.00,'tarjeta_credito','vencido',0.00),(5,30123462,'2025-06-03',5000.00,'tarjeta_debito','pagado',150.00),(6,30123464,'2025-06-05',4700.00,'transferencia','pendiente',0.00),(7,30123465,'2025-06-06',5500.00,'transferencia','pendiente',0.00),(8,30123456,'2025-06-07',5000.00,'efectivo','pagado',500.00),(9,30123457,'2025-06-08',4900.00,'transferencia','pendiente',0.00),(10,30123459,'2025-06-09',5300.00,'tarjeta_credito','pagado',100.00);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planes`
--

DROP TABLE IF EXISTS `planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes` (
  `id_plan` tinyint(2) unsigned NOT NULL,
  `nombre_plan` varchar(30) NOT NULL,
  `dias_habilitados_por_semana` tinyint(1) NOT NULL,
  `horas_totales_por_semana` tinyint(2) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `notas` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_plan`),
  UNIQUE KEY `nombre_plan` (`nombre_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` VALUES (1,'Plan Básico',3,2,8000.00,'Ideal para principiantes, acceso lunes, miércoles y viernes.'),(2,'Plan Full',6,4,12000.00,'Acceso casi total a la semana, recomendado para avanzados.'),(3,'Plan Fin de Semana',2,2,5000.00,'Sábados y domingos, ideal para quienes trabajan entre semana.');
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnos`
--

DROP TABLE IF EXISTS `turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turnos` (
  `id_turno` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `dni_instructor` int(11) NOT NULL,
  `dia` enum('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado','Domingo') NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `capacidad_maxima` int(11) NOT NULL,
  PRIMARY KEY (`id_turno`),
  KEY `dni_instructor` (`dni_instructor`),
  CONSTRAINT `turnos_ibfk_1` FOREIGN KEY (`dni_instructor`) REFERENCES `instructores` (`dni_instructor`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnos`
--

LOCK TABLES `turnos` WRITE;
/*!40000 ALTER TABLE `turnos` DISABLE KEYS */;
INSERT INTO `turnos` VALUES (1,28555111,'Lunes','18:00:00','20:00:00',30),(2,28555111,'Miércoles','18:00:00','20:00:00',30),(3,28555111,'Viernes','18:00:00','20:00:00',30),(4,32888222,'Martes','19:00:00','20:00:00',15),(5,32888222,'Jueves','19:00:00','20:00:00',15),(6,32888222,'Sábado','10:00:00','11:30:00',15),(7,35111333,'Lunes','20:00:00','21:00:00',20),(8,35111333,'Miércoles','20:00:00','21:00:00',20),(9,38222555,'Martes','09:00:00','11:00:00',25);
/*!40000 ALTER TABLE `turnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnos_clientes`
--

DROP TABLE IF EXISTS `turnos_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turnos_clientes` (
  `id_turno_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `dni_cliente` int(11) NOT NULL,
  `id_turno` tinyint(3) unsigned NOT NULL,
  `fecha_turno` date NOT NULL,
  `asistio` tinyint(1) DEFAULT NULL COMMENT '1=asistió, 0=no, NULL=no registrado',
  PRIMARY KEY (`id_turno_cliente`),
  KEY `dni_cliente` (`dni_cliente`),
  KEY `id_turno` (`id_turno`),
  CONSTRAINT `fk_turnos_clientes_cliente` FOREIGN KEY (`dni_cliente`) REFERENCES `clientes` (`dni_cliente`),
  CONSTRAINT `fk_turnos_clientes_turno` FOREIGN KEY (`id_turno`) REFERENCES `turnos` (`id_turno`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnos_clientes`
--

LOCK TABLES `turnos_clientes` WRITE;
/*!40000 ALTER TABLE `turnos_clientes` DISABLE KEYS */;
INSERT INTO `turnos_clientes` VALUES (1,30123456,1,'2025-06-16',1),(2,30123459,4,'2025-06-17',1),(3,30123461,2,'2025-06-18',1),(4,30123462,5,'2025-06-19',0),(5,30123464,3,'2025-06-20',1),(6,30123457,6,'2025-06-21',0),(7,30123465,7,'2025-06-16',0),(8,30123456,9,'2025-06-17',0),(9,30123461,8,'2025-06-18',1),(10,30123459,1,'2025-06-23',1);
/*!40000 ALTER TABLE `turnos_clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-30 14:58:32
