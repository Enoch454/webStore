CREATE DATABASE  IF NOT EXISTS `webstore_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `webstore_db`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: enoch-db.mysql.database.azure.com    Database: webstore_db
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `idAdmin` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int DEFAULT NULL,
  PRIMARY KEY (`idAdmin`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` VALUES (1,4);

--
-- Table structure for table `carrito_producto`
--

DROP TABLE IF EXISTS `carrito_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito_producto` (
  `idCarProd` int NOT NULL AUTO_INCREMENT,
  `idCarritoCompra` int DEFAULT NULL,
  `idProducto` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  PRIMARY KEY (`idCarProd`),
  KEY `idCarritoCompra` (`idCarritoCompra`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `carrito_producto_ibfk_1` FOREIGN KEY (`idCarritoCompra`) REFERENCES `carritocompras` (`idCarritoCompra`),
  CONSTRAINT `carrito_producto_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_producto`
--


--
-- Table structure for table `carritocompras`
--

DROP TABLE IF EXISTS `carritocompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritocompras` (
  `idCarritoCompra` int NOT NULL AUTO_INCREMENT,
  `Cantidad` int NOT NULL,
  `idComprador` int DEFAULT NULL,
  PRIMARY KEY (`idCarritoCompra`),
  KEY `idComprador` (`idComprador`),
  CONSTRAINT `carritocompras_ibfk_1` FOREIGN KEY (`idComprador`) REFERENCES `compradores` (`idComprador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritocompras`
--


--
-- Table structure for table `categoria_producto`
--

DROP TABLE IF EXISTS `categoria_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_producto` (
  `idCatProd` int NOT NULL AUTO_INCREMENT,
  `idCategoria` int DEFAULT NULL,
  `idProducto` int DEFAULT NULL,
  PRIMARY KEY (`idCatProd`),
  KEY `idCategoria` (`idCategoria`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `categoria_producto_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`),
  CONSTRAINT `categoria_producto_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_producto`
--


--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Descripcion` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `idVendedor` int DEFAULT NULL,
  PRIMARY KEY (`idCategoria`),
  KEY `idVendedor` (`idVendedor`),
  CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`idVendedor`) REFERENCES `vendedores` (`idVendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--


--
-- Table structure for table `compradores`
--

DROP TABLE IF EXISTS `compradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compradores` (
  `idComprador` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int DEFAULT NULL,
  PRIMARY KEY (`idComprador`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `compradores_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compradores`
--

INSERT INTO `compradores` VALUES (1,1),(2,2),(3,3),(4,4);

--
-- Table structure for table `cotizaciones`
--

DROP TABLE IF EXISTS `cotizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotizaciones` (
  `idCotizacion` int NOT NULL AUTO_INCREMENT,
  `PrecioCotizado` decimal(10,0) NOT NULL,
  `idCarritoCompra` int DEFAULT NULL,
  `idLista` int DEFAULT NULL,
  `idProducto` int DEFAULT NULL,
  PRIMARY KEY (`idCotizacion`),
  KEY `idCarritoCompra` (`idCarritoCompra`),
  KEY `idLista` (`idLista`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `cotizaciones_ibfk_1` FOREIGN KEY (`idCarritoCompra`) REFERENCES `carritocompras` (`idCarritoCompra`),
  CONSTRAINT `cotizaciones_ibfk_2` FOREIGN KEY (`idLista`) REFERENCES `listas` (`idLista`),
  CONSTRAINT `cotizaciones_ibfk_3` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizaciones`
--


--
-- Table structure for table `detallesordencompra`
--

DROP TABLE IF EXISTS `detallesordencompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallesordencompra` (
  `idDetalleOC` int NOT NULL AUTO_INCREMENT,
  `Cantidad` int NOT NULL,
  `PrecioUnitario` decimal(10,0) NOT NULL,
  `Subtotal` decimal(10,0) NOT NULL,
  `idOrdenCompra` int DEFAULT NULL,
  `idProducto` int DEFAULT NULL,
  PRIMARY KEY (`idDetalleOC`),
  KEY `idOrdenCompra` (`idOrdenCompra`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `detallesordencompra_ibfk_1` FOREIGN KEY (`idOrdenCompra`) REFERENCES `ordenescompra` (`idOrdenCompra`),
  CONSTRAINT `detallesordencompra_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallesordencompra`
--


--
-- Table structure for table `domicilios`
--

DROP TABLE IF EXISTS `domicilios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domicilios` (
  `idDomicilio` int NOT NULL AUTO_INCREMENT,
  `Direccion` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Colonia` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Ciudad` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Estado` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Pais` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `CP` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `Referencia` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idDomicilio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilios`
--


--
-- Table structure for table `especificaciones`
--

DROP TABLE IF EXISTS `especificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especificaciones` (
  `idEspec` int NOT NULL,
  `Titulo` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Descripcion` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `idProducto` int DEFAULT NULL,
  PRIMARY KEY (`idEspec`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `especificaciones_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especificaciones`
--


--
-- Table structure for table `lista_producto`
--

DROP TABLE IF EXISTS `lista_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_producto` (
  `idListProd` int NOT NULL AUTO_INCREMENT,
  `idLista` int DEFAULT NULL,
  `idProducto` int DEFAULT NULL,
  PRIMARY KEY (`idListProd`),
  KEY `idLista` (`idLista`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `lista_producto_ibfk_1` FOREIGN KEY (`idLista`) REFERENCES `listas` (`idLista`),
  CONSTRAINT `lista_producto_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_producto`
--


--
-- Table structure for table `listas`
--

DROP TABLE IF EXISTS `listas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listas` (
  `idLista` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `esPrivado` tinyint(1) NOT NULL,
  `idComprador` int DEFAULT NULL,
  PRIMARY KEY (`idLista`),
  KEY `idComprador` (`idComprador`),
  CONSTRAINT `listas_ibfk_1` FOREIGN KEY (`idComprador`) REFERENCES `compradores` (`idComprador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listas`
--


--
-- Table structure for table `metodospago`
--

DROP TABLE IF EXISTS `metodospago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodospago` (
  `idMetodoPago` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `Descripcion` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idMetodoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodospago`
--


--
-- Table structure for table `ordenescompra`
--

DROP TABLE IF EXISTS `ordenescompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenescompra` (
  `idOrdenCompra` int NOT NULL AUTO_INCREMENT,
  `timeStamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MontoTotal` decimal(10,0) NOT NULL,
  `Status` int NOT NULL,
  `idComprador` int DEFAULT NULL,
  `idMetodoPago` int DEFAULT NULL,
  PRIMARY KEY (`idOrdenCompra`),
  KEY `idComprador` (`idComprador`),
  KEY `idMetodoPago` (`idMetodoPago`),
  CONSTRAINT `ordenescompra_ibfk_1` FOREIGN KEY (`idComprador`) REFERENCES `compradores` (`idComprador`),
  CONSTRAINT `ordenescompra_ibfk_2` FOREIGN KEY (`idMetodoPago`) REFERENCES `metodospago` (`idMetodoPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenescompra`
--


--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `idPago` int NOT NULL AUTO_INCREMENT,
  `Monto` decimal(10,0) NOT NULL,
  `timeStamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idOrdenCompra` int DEFAULT NULL,
  PRIMARY KEY (`idPago`),
  KEY `idOrdenCompra` (`idOrdenCompra`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`idOrdenCompra`) REFERENCES `ordenescompra` (`idOrdenCompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--


--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `idPersona` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `ApellidoPat` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `ApellidoMat` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FechaNac` date NOT NULL,
  `Sexo` char(1) COLLATE utf8mb4_general_ci NOT NULL,
  `idDomicilio` int DEFAULT NULL,
  `Telefono` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idPersona`),
  KEY `idDomicilio` (`idDomicilio`),
  CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`idDomicilio`) REFERENCES `domicilios` (`idDomicilio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

INSERT INTO `personas` VALUES (1,'Nelly','Rangel','Jimenez','1999-05-15','F',NULL,'2251054299'),(2,'Caraly','Armenta ','Jimenez','1990-04-25','F',NULL,'2251053579'),(3,'Alicia','Jimenez','Aburto','1971-06-15','M',NULL,'2251038946'),(4,'Usuario Veinte','Apepat','Apemat','1999-07-10','M',NULL,'0123456789');

--
-- Table structure for table `prodmultimedias`
--

DROP TABLE IF EXISTS `prodmultimedias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodmultimedias` (
  `idProdMultimedia` int NOT NULL AUTO_INCREMENT,
  `Archivo` blob NOT NULL,
  `Extension` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `idProducto` int DEFAULT NULL,
  PRIMARY KEY (`idProdMultimedia`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `prodmultimedias_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodmultimedias`
--


--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Descripcion` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `esCotizable` bit(1) NOT NULL,
  `Precio` float(10,0) DEFAULT NULL,
  `Stock` int DEFAULT NULL,
  `Rating` float(10,0) DEFAULT NULL,
  `Status` int NOT NULL,
  `idVendedor` int DEFAULT NULL,
  `idAdmin` int DEFAULT NULL,
  `idCarritoCompra` int DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `idVendedor` (`idVendedor`),
  KEY `idAdmin` (`idAdmin`),
  KEY `idCarritoCompra` (`idCarritoCompra`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idVendedor`) REFERENCES `vendedores` (`idVendedor`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`idAdmin`) REFERENCES `admins` (`idAdmin`),
  CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`idCarritoCompra`) REFERENCES `carritocompras` (`idCarritoCompra`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` VALUES (1,'CupCake Fresa','Pastelillos rellenos de fresa',_binary '\0',11,50,3,1,1,NULL,NULL),(2,'CupCake Chocolate','Pastelillos rellenos de chocolate',_binary '\0',16,10,4,1,2,NULL,NULL),(3,'CupCake Vainilla','Pastelillos rellenos de vainilla',_binary '\0',20,32,5,1,1,NULL,NULL),(4,'PastelChoco','Relleno de nuez, cacao y coco',_binary '\0',12,16,0,1,3,NULL,NULL),(5,'PastelChoco','Relleno de nuez, cacao y coco',_binary '\0',12,16,0,1,3,NULL,NULL),(6,'PastelChoco','Relleno de nuez, cacao y coco',_binary '\0',12,16,0,1,3,NULL,NULL),(7,'a','a',_binary '\0',16,12,0,1,3,NULL,NULL),(8,'PastelChoco','Relleno de coco, cacao y nuez',_binary '\0',12,16,0,1,3,NULL,NULL),(9,'Pastel','Relleno de cacao, nuez y coco',_binary '\0',12,16,0,1,3,NULL,NULL),(10,'PastelChoco','Relleno de nuez, cacao y cco',_binary '\0',12,16,0,1,3,NULL,NULL),(11,'PastelChoco','Relleno de nuez, cacao y cco',_binary '\0',125,16,0,1,3,NULL,NULL),(12,'PastelChoco','Relleno de nuez, cacao y cco',_binary '\0',12,16,0,1,3,NULL,NULL),(13,'PastelChoco','Relleno de nuez, cacao y coco',_binary '\0',12,16,0,1,3,NULL,NULL),(14,'Galleta chispas','Chispas de chocolate y relleno de cacao',_binary '',0,0,0,1,3,NULL,NULL),(15,'Macarrones','Contiene 12 colores distintos',_binary '\0',29,49,0,1,1,NULL,NULL),(16,'Galletas de Nepe','Galleta de Nepe de Maiz',_binary '\0',10,5,0,1,1,NULL,NULL),(17,'Huevos de avestruz','Huevos de avestruz doble yema',_binary '\0',200,3,0,2,1,NULL,NULL);

--
-- Table structure for table `respuestasespec`
--

DROP TABLE IF EXISTS `respuestasespec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuestasespec` (
  `idResp` int NOT NULL AUTO_INCREMENT,
  `Respuesta` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `idCotizacion` int DEFAULT NULL,
  `idEspec` int DEFAULT NULL,
  PRIMARY KEY (`idResp`),
  KEY `idCotizacion` (`idCotizacion`),
  KEY `idEspec` (`idEspec`),
  CONSTRAINT `respuestasespec_ibfk_1` FOREIGN KEY (`idCotizacion`) REFERENCES `cotizaciones` (`idCotizacion`),
  CONSTRAINT `respuestasespec_ibfk_2` FOREIGN KEY (`idEspec`) REFERENCES `especificaciones` (`idEspec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestasespec`
--


--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `Descripcion` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idRol`),
  UNIQUE KEY `Nombre` (`Nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` VALUES (1,'SuperAdmin','Super Administrador'),(2,'Admin','Administrador'),(3,'Comprador','Comprador'),(4,'Vendedor','Vendedor');

--
-- Table structure for table `superadmins`
--

DROP TABLE IF EXISTS `superadmins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `superadmins` (
  `idSuperAdmin` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int DEFAULT NULL,
  PRIMARY KEY (`idSuperAdmin`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `superadmins_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superadmins`
--


--
-- Table structure for table `usuario_rol`
--

DROP TABLE IF EXISTS `usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_rol` (
  `idUserRol` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int DEFAULT NULL,
  `idRol` int DEFAULT NULL,
  PRIMARY KEY (`idUserRol`),
  KEY `idRol` (`idRol`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `usuario_rol_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`),
  CONSTRAINT `usuario_rol_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_rol`
--

INSERT INTO `usuario_rol` VALUES (1,1,3),(2,2,3),(3,3,3),(4,4,3);

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `contraseña` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `fechaIngreso` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `fotoPerfil` blob,
  `esPrivado` tinyint(1) NOT NULL DEFAULT '0',
  `esActivo` bit(1) DEFAULT NULL,
  `idPersona` int DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `userName` (`userName`),
  KEY `idPersona` (`idPersona`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` VALUES (1,'gaki1505','Prueba_1','2023-11-07 14:33:11','nellyrj@outlook.com',NULL,1,_binary '',1),(2,'caraly25','Prueba_2','2023-11-07 15:27:23','caraly25@gmail.com',NULL,1,_binary '',2),(3,'alicia1971','Prueba_3','2023-11-07 23:24:09','alicia1971@gmail.com',NULL,1,_binary '',3),(4,'usuario20','Ariuro_100','2023-11-15 06:50:33','usuario20@mail.com',NULL,1,_binary '',4);

--
-- Table structure for table `valoraciones`
--

DROP TABLE IF EXISTS `valoraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valoraciones` (
  `idValoracion` int NOT NULL AUTO_INCREMENT,
  `Comentario` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Calificacion` int NOT NULL,
  `idDetalleOC` int DEFAULT NULL,
  PRIMARY KEY (`idValoracion`),
  KEY `idDetalleOC` (`idDetalleOC`),
  CONSTRAINT `valoraciones_ibfk_1` FOREIGN KEY (`idDetalleOC`) REFERENCES `detallesordencompra` (`idDetalleOC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valoraciones`
--


--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `idVendedor` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int DEFAULT NULL,
  `Status` int DEFAULT '2',
  PRIMARY KEY (`idVendedor`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `vendedores_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

INSERT INTO `vendedores` VALUES (1,1,1),(2,2,1),(3,3,1);

--
-- Dumping events for database 'webstore_db'
--

--
-- Dumping routines for database 'webstore_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `ConsultaPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `ConsultaPersona`(IN `p_idPersona` INT)
BEGIN

  SELECT

    P.idPersona,

    P.Nombre,

    P.ApellidoPat,

    P.ApellidoMat,

    P.FechaNac,

    P.Sexo,

    P.idDomicilio,

    P.Telefono

  FROM Personas P

  WHERE P.idPersona = p_idPersona;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `ConsultarProducto`(
  IN p_idProducto INT
)
BEGIN
  SELECT
    P.idProducto,
    P.Nombre,
    P.Descripcion,
    P.esCotizable,
    P.Precio,
    P.Stock,
    P.Rating,
    P.Status,
    P.idVendedor,
    P.idAdmin
  FROM Productos P
  WHERE P.idProducto = p_idProducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `ConsultarUsuario`(IN `p_idUsuario` INT)
BEGIN

  SELECT

    U.idUsuario,

    U.userName,

    U.contraseña,

    U.fechaIngreso,

    U.email,

    U.fotoPerfil,

    U.esPrivado,

    U.esActivo,

    U.idPersona



  FROM Usuarios U

  WHERE U.idUsuario = p_idUsuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IniciarSesion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `IniciarSesion`(
    IN `p_userName` VARCHAR(15), 
    IN `p_contrasena` VARCHAR(15),
    OUT `p_resultado` INT
)
BEGIN 
    SELECT idUsuario INTO p_resultado 
    FROM Usuarios 
    WHERE userName = p_userName AND contraseña = p_contrasena AND esActivo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `InsertarUsuario`(
  IN p_userName VARCHAR(15),
  IN p_contraseña VARCHAR(15),
  IN p_email VARCHAR(20)
)
BEGIN
  -- Insertar en la tabla Usuarios
  INSERT INTO Usuarios (userName, contraseña, email)
  VALUES (p_userName, p_contraseña, p_email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ConsultarIdAdministrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ConsultarIdAdministrador`(
  IN p_idUsuario INT
)
BEGIN
  SELECT idAdmin
  FROM admins
  WHERE idUsuario = p_idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ConsultarIdComprador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ConsultarIdComprador`(
  IN p_idUsuario INT
)
BEGIN
  SELECT idComprador
  FROM Compradores
  WHERE idUsuario = p_idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ConsultarIdVendedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
-- /*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_ConsultarIdVendedor`(
  IN p_idUsuario INT
)
BEGIN
  SELECT idVendedor, Status
  FROM Vendedores
  WHERE idUsuario = p_idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getProductosByVendedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_getProductosByVendedor`(
IN vendedor_id INT
)
BEGIN
    SELECT * FROM Productos WHERE idVendedor = vendedor_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsertarComprador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `sp_InsertarComprador`(
    IN p_idUsuario INT
)
BEGIN
	INSERT INTO Compradores (idUsuario)
	VALUES (p_idUsuario);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsertarPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_InsertarPersona`(
  IN p_Nombre VARCHAR(50),
  IN p_ApellidoPat VARCHAR(50),
  IN p_ApellidoMat VARCHAR(50),
  IN p_FechaNac DATE,
  IN p_Sexo CHAR(1),
  IN p_Telefono VARCHAR(15),
  OUT p_res INT
)
BEGIN
  -- Insertar en la tabla Personas
  INSERT INTO Personas (Nombre, ApellidoPat, ApellidoMat, FechaNac, Sexo, Telefono)
  VALUES (p_Nombre, p_ApellidoPat, p_ApellidoMat, p_FechaNac, p_Sexo, p_Telefono);
  SELECT LAST_INSERT_ID() INTO p_res;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsertarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_InsertarProducto`(IN `p_Nombre` VARCHAR(50), IN `p_Descripcion` VARCHAR(50), IN `p_esCotizable` BOOLEAN, IN `p_Precio` FLOAT(10,2), IN `p_Stock` INT, IN `p_Rating` FLOAT(2,1), IN `p_Status` BOOLEAN, IN `p_idVendedor` INT, IN `p_idAdmin` INT)
BEGIN

  INSERT INTO Productos (Nombre, Descripcion, esCotizable, Precio, Stock, Rating, Status, idVendedor, idAdmin)

  VALUES (p_Nombre, p_Descripcion, p_esCotizable, p_Precio, p_Stock, p_Rating, p_Status, p_idVendedor, p_idAdmin);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsertarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_InsertarUsuario`(
    IN `p_userName` VARCHAR(15), 
    IN `p_contrasena` VARCHAR(15), 
    IN `p_email` VARCHAR(20), 
    IN `p_fotoPerfil` BLOB, 
    IN `p_esPrivado` BOOLEAN, 
    IN `p_esActivo` BOOLEAN, 
    IN `p_idPersona` INT, 
    OUT `p_res` INT
)
BEGIN 
    INSERT INTO Usuarios (userName, contraseña, email, fotoPerfil, esPrivado, esActivo, idPersona) 
    VALUES (p_userName, p_contrasena, p_email, p_fotoPerfil, p_esPrivado, p_esActivo, p_idPersona); 
    SELECT LAST_INSERT_ID() INTO p_res; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsertarUsuarioRol` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_InsertarUsuarioRol`(
    IN p_idUsuario INT,
    IN p_idRol INT
)
BEGIN
    INSERT INTO Usuario_Rol (idUsuario, idRol)
    VALUES (p_idUsuario, p_idRol);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsertarVendedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_InsertarVendedor`(
  IN p_idUsuario INT
)
BEGIN
  INSERT INTO Vendedores (idUsuario)
  VALUES (p_idUsuario);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*SET collation_connection  = utf8mb4_0900_ai_ci */;

-- Dump completed on 2023-11-15 14:22:10
