CREATE DATABASE  IF NOT EXISTS `incideitor` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `incideitor`;
-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: incideitor
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMINISTRADOR'),(2,'USUARIO'),(3,'ANONIMO'),(4,'AYUNTAMIENTO_ADMIN'),(5,'AYUNTAMIENTO_GESTOR');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `ayuntamientos`
--

DROP TABLE IF EXISTS `ayuntamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ayuntamientos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `foto3` varchar(255) DEFAULT NULL,
  `foto4` varchar(255) DEFAULT NULL,
  `fotocabecera` varchar(255) DEFAULT NULL,
  `fotologin` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ayuntamientos`
--

LOCK TABLES `ayuntamientos` WRITE;
/*!40000 ALTER TABLE `ayuntamientos` DISABLE KEYS */;
INSERT INTO `ayuntamientos` VALUES (1,'mijas3.png','mijas2.png','mijas.png','mijas4.png','Mijas'),(2,'chiclana3.png','chiclana3.png','chiclana.png','chiclana2.png','Chiclana'),(3,'jerez3.png','jerez4.png','jerez.png','jerez2.png','Jerez'),(4,'murcia3.png','murcia4.png','murcia.png','murcia2.png','Murcia'),(5,'albacete3.png','albacete4.png','albacete.png','albacete2.png','Albacete'),(6,'toledo3.png','toledo4.png','toledo.png','toledo2.png','Toledo'),(7,'sevilla3.png','sevilla4.png','sevilla.png','sevilla2.png','Sevilla');
/*!40000 ALTER TABLE `ayuntamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `borrado_logico` int DEFAULT '0',
  `contrasena` varchar(255) DEFAULT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `dni` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `extension` int DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `permitir_notificaciones` int DEFAULT '0',
  `sexo` varchar(255) DEFAULT NULL,
  `token` varchar(250) DEFAULT NULL,
  `ayuntamiento_id` int DEFAULT NULL,
  `incidencia_id` bigint DEFAULT NULL,
  `mensaje_emisor_id` int DEFAULT NULL,
  `mensaje_receptor_id` int DEFAULT NULL,
  `rol_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKllk73d1gl6yqtygdirn07bhli` (`ayuntamiento_id`),
  KEY `FK9kukkmkusrnmulnx61cra442v` (`incidencia_id`),
  KEY `FKoqy343ceosfqs0u51qd92di7w` (`mensaje_emisor_id`),
  KEY `FKb0q9561ns02f27ytc0g77hx43` (`mensaje_receptor_id`),
  KEY `FKqf5elo4jcq7qrt83oi0qmenjo` (`rol_id`),
  CONSTRAINT `FK9kukkmkusrnmulnx61cra442v` FOREIGN KEY (`incidencia_id`) REFERENCES `incidencias` (`id`),
  CONSTRAINT `FKb0q9561ns02f27ytc0g77hx43` FOREIGN KEY (`mensaje_receptor_id`) REFERENCES `mensajes` (`id`),
  CONSTRAINT `FKllk73d1gl6yqtygdirn07bhli` FOREIGN KEY (`ayuntamiento_id`) REFERENCES `ayuntamientos` (`id`),
  CONSTRAINT `FKoqy343ceosfqs0u51qd92di7w` FOREIGN KEY (`mensaje_emisor_id`) REFERENCES `mensajes` (`id`),
  CONSTRAINT `FKqf5elo4jcq7qrt83oi0qmenjo` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Y medio','juan.png',0,'$2a$10$lqrr0Uu.I/qLKWu8pPCLL.1Ll7ORZSr3BC4OCaRmGK1FQQ4Qu4R8a',NULL,'12345678A','juan@gmail.com',NULL,'Juan',0,'Hombre',NULL,2,NULL,NULL,NULL,1),(2,'Valles','manuel.png',0,'$2a$10$lqrr0Uu.I/qLKWu8pPCLL.1Ll7ORZSr3BC4OCaRmGK1FQQ4Qu4R8a',NULL,'12345678B','manuel@gmail.com',NULL,'Manuel',0,'Hombre',NULL,1,NULL,NULL,NULL,2),(3,'Suarez','manolo.png',0,'$2a$10$lqrr0Uu.I/qLKWu8pPCLL.1Ll7ORZSr3BC4OCaRmGK1FQQ4Qu4R8a',NULL,'12345678C','anonimo@anonimo.com',NULL,'Manolo',0,'Otro',NULL,NULL,NULL,NULL,NULL,3),(4,'Cobo','carmelo.png',0,'$2a$10$lqrr0Uu.I/qLKWu8pPCLL.1Ll7ORZSr3BC4OCaRmGK1FQQ4Qu4R8a',NULL,'12345678D','carmelo@gmail.com',NULL,'Carmelo',0,'Mujer',NULL,NULL,NULL,NULL,NULL,4),(5,'Lima','domingo.png',0,'$2a$10$lqrr0Uu.I/qLKWu8pPCLL.1Ll7ORZSr3BC4OCaRmGK1FQQ4Qu4R8a','Urbanismo','12345678E','domingo@gmail.com',304,'Domingo',0,'Hombre',NULL,NULL,NULL,NULL,NULL,5),(6,'Aguado','lola.png',0,'$2a$10$lqrr0Uu.I/qLKWu8pPCLL.1Ll7ORZSr3BC4OCaRmGK1FQQ4Qu4R8a',NULL,'12345678F','lola@gmail.com',NULL,'Lola',0,'Hombre',NULL,NULL,NULL,NULL,NULL,2),(7,'Barros','kirby.png',0,'$2a$10$lqrr0Uu.I/qLKWu8pPCLL.1Ll7ORZSr3BC4OCaRmGK1FQQ4Qu4R8a',NULL,'12345678G','andrea@gmail.com',NULL,'Andrea',0,'Otro',NULL,NULL,NULL,NULL,NULL,2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoincidencia`
--

DROP TABLE IF EXISTS `tipoincidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoincidencia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `orden` int DEFAULT NULL,
  `incidencia_padre_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdqow18r2n7vidbixx20yhrtgb` (`incidencia_padre_id`),
  CONSTRAINT `FKdqow18r2n7vidbixx20yhrtgb` FOREIGN KEY (`incidencia_padre_id`) REFERENCES `tipoincidencia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoincidencia`
--

LOCK TABLES `tipoincidencia` WRITE;
/*!40000 ALTER TABLE `tipoincidencia` DISABLE KEYS */;
INSERT INTO `tipoincidencia` VALUES (999999,_binary '','Padre',0,NULL),(1,_binary '','Acerado',10,999999),(2,_binary '','Aguas',20,999999),(3,_binary '','Alumbrado',30,999999),(4,_binary '','Arquetas',40,999999),(5,_binary '','Cableado',50,999999),(6,_binary '','Calzada',60,999999),(7,_binary '','Carril bici',70,999999),(8,_binary '','Fuentes',80,999999),(9,_binary '','Jardines y zonas verdes',90,999999),(10,_binary '','Limpieza',100,999999),(11,_binary '','Medio ambiente',110,999999),(12,_binary '','Mobiliario urbano',120,999999),(13,_binary '','Monumentos',130,999999),(14,_binary '','Parada bus/taxi',140,999999),(15,_binary '','Parques infantiles',150,999999),(16,_binary '','Plagas',160,999999),(17,_binary '','Playas',170,999999),(18,_binary '','Saneamiento',180,999999),(19,_binary '','Semaforos',190,999999),(20,_binary '','Agrietado',10,1),(21,_binary '','Baldosas',20,1),(22,_binary '','Socavón',30,1),(23,_binary '','Corte del Servicio',10,2),(24,_binary '','Mala calidad',20,2),(25,_binary '','Cables al Descubierto',10,3),(26,_binary '','Cristal Roto',20,3),(27,_binary '','Luminaria Apagada',30,3),(28,_binary '','Farol Roto',40,3),(29,_binary '','Arqueta Abierta',10,4),(30,_binary '','Arqueta en Mal Estado',20,4),(31,_binary '','Arqueta con Tapa Desaparecida',30,4);
/*!40000 ALTER TABLE `tipoincidencia` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Registrado'),(2,'En Curso'),(3,'Finalizado');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidencias`
--

DROP TABLE IF EXISTS `incidencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidencias` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `borrado_logico` int DEFAULT '0',
  `descripcion` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `fecharesolucion` date DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `ayuntamiento_id` int DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  `parametro_incidencia_id` int DEFAULT NULL,
  `tipo_incidencia_id` int DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnjie94jgcexpvhju05tcj1x6k` (`ayuntamiento_id`),
  KEY `FKmq44gertg1asj713dyv0cmuw5` (`estado_id`),
  KEY `FKh2fex8sd5ihuwoq9l2065093g` (`parametro_incidencia_id`),
  KEY `FKiq8k0hs8l6cvb4pmlogubbghq` (`tipo_incidencia_id`),
  KEY `FK2yelidlr1aixx1ttoql00koc0` (`usuario_id`),
  CONSTRAINT `FK2yelidlr1aixx1ttoql00koc0` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FKh2fex8sd5ihuwoq9l2065093g` FOREIGN KEY (`parametro_incidencia_id`) REFERENCES `parametros_incidencia` (`id`),
  CONSTRAINT `FKiq8k0hs8l6cvb4pmlogubbghq` FOREIGN KEY (`tipo_incidencia_id`) REFERENCES `tipoincidencia` (`id`),
  CONSTRAINT `FKmq44gertg1asj713dyv0cmuw5` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`),
  CONSTRAINT `FKnjie94jgcexpvhju05tcj1x6k` FOREIGN KEY (`ayuntamiento_id`) REFERENCES `ayuntamientos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidencias`
--

LOCK TABLES `incidencias` WRITE;
/*!40000 ALTER TABLE `incidencias` DISABLE KEYS */;
INSERT INTO `incidencias` VALUES (1,0,'La baldosa de la calle está levantada y se puede caer alguien','Calle Ópalo, Mijas, España','2023-06-10',NULL,'Baldosa rota',1,1,NULL,21,1),(2,0,'La tapa de la arqueta de la calle no está','Calle Diamante, Mijas, España','2023-06-11',NULL,'Tapa de arqueta desaparecida',3,1,NULL,31,2),(3,0,'El cristal de la farola está roto','Calle Ónice, Mijas, España','2023-06-11','2023-06-18','Cristal de farola roto',4,3,NULL,26,3),(4,0,'La bombilla no funciona','Calle Zafiro, Mijas, España','2023-06-21',NULL,'Bombilla fundida',5,2,NULL,27,4);
/*!40000 ALTER TABLE `incidencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historicos`
--

DROP TABLE IF EXISTS `historicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historicos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fechacambioestado` date DEFAULT NULL,
  `mensajeadicional` varchar(255) DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  `incidencia_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKb97vnprx5iqjsd3fi29gw7dlm` (`estado_id`),
  KEY `FK2wvhsjdihdta7thr1ndcdiu9s` (`incidencia_id`),
  CONSTRAINT `FK2wvhsjdihdta7thr1ndcdiu9s` FOREIGN KEY (`incidencia_id`) REFERENCES `incidencias` (`id`),
  CONSTRAINT `FKb97vnprx5iqjsd3fi29gw7dlm` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historicos`
--

LOCK TABLES `historicos` WRITE;
/*!40000 ALTER TABLE `historicos` DISABLE KEYS */;
INSERT INTO `historicos` VALUES (1,'2023-06-01',NULL,1,1),(2,'2023-06-01','Hermanos Rodriguez va a arreglarlo',2,2),(3,'2023-06-01','Se ha sustituido la bombilla',3,3);
/*!40000 ALTER TABLE `historicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes`
--

DROP TABLE IF EXISTS `reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `incidencia_id` bigint DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKg5caqcmb3anh8ctctnyj1q7ik` (`incidencia_id`),
  KEY `FKjb16uevkap6vb4wd2kimdomuc` (`usuario_id`),
  CONSTRAINT `FKg5caqcmb3anh8ctctnyj1q7ik` FOREIGN KEY (`incidencia_id`) REFERENCES `incidencias` (`id`),
  CONSTRAINT `FKjb16uevkap6vb4wd2kimdomuc` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes`
--

LOCK TABLES `reportes` WRITE;
/*!40000 ALTER TABLE `reportes` DISABLE KEYS */;
INSERT INTO `reportes` VALUES (1,'Bug','No se ve la pantalla','Pantalla',NULL,NULL),(2,'Error','Incidencia con fotos borrosas','Fotos en la incidencia',NULL,NULL),(3,'Error','La dirección está mal','Dirección',NULL,NULL);
/*!40000 ALTER TABLE `reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotos`
--

DROP TABLE IF EXISTS `fotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orden` int NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `incidencia_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsxyhq3wcc72vdfvuogrdjwhw7` (`incidencia_id`),
  CONSTRAINT `FKsxyhq3wcc72vdfvuogrdjwhw7` FOREIGN KEY (`incidencia_id`) REFERENCES `incidencias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos`
--

LOCK TABLES `fotos` WRITE;
/*!40000 ALTER TABLE `fotos` DISABLE KEYS */;
/*!40000 ALTER TABLE `fotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votos`
--

DROP TABLE IF EXISTS `votos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votos` (
  `id` varchar(255) NOT NULL,
  `fecha` datetime(6) DEFAULT NULL,
  `voto` bit(1) DEFAULT NULL,
  `incidencia_id` bigint DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe6ymp4hj6yw2knjemkj3u6xbd` (`incidencia_id`),
  KEY `FKs5o2luq73xtdp6xc41fj4ml9c` (`usuario_id`),
  CONSTRAINT `FKe6ymp4hj6yw2knjemkj3u6xbd` FOREIGN KEY (`incidencia_id`) REFERENCES `incidencias` (`id`),
  CONSTRAINT `FKs5o2luq73xtdp6xc41fj4ml9c` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votos`
--

LOCK TABLES `votos` WRITE;
/*!40000 ALTER TABLE `votos` DISABLE KEYS */;
/*!40000 ALTER TABLE `votos` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `lugares`
--

DROP TABLE IF EXISTS `lugares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugares` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `latitud` double NOT NULL,
  `longitud` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugares`
--

LOCK TABLES `lugares` WRITE;
/*!40000 ALTER TABLE `lugares` DISABLE KEYS */;
/*!40000 ALTER TABLE `lugares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contenido` varchar(255) DEFAULT NULL,
  `fecha` datetime(6) DEFAULT NULL,
  `leido` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes`
--

LOCK TABLES `mensajes` WRITE;
/*!40000 ALTER TABLE `mensajes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `borrado_logico` int NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_notificacion` datetime(6) DEFAULT NULL,
  `incidencia_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7vcn3ws6m0tlii2e0e5cb8d19` (`incidencia_id`),
  CONSTRAINT `FK7vcn3ws6m0tlii2e0e5cb8d19` FOREIGN KEY (`incidencia_id`) REFERENCES `incidencias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametros_incidencia`
--

DROP TABLE IF EXISTS `parametros_incidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametros_incidencia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros_incidencia`
--

LOCK TABLES `parametros_incidencia` WRITE;
/*!40000 ALTER TABLE `parametros_incidencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `parametros_incidencia` ENABLE KEYS */;
UNLOCK TABLES;






/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-26 23:53:24
