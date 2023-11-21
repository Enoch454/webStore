CREATE DATABASE  IF NOT EXISTS `webstore_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `webstore_db`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: webstore_db
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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `idAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
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
  `idCarProd` int(11) NOT NULL AUTO_INCREMENT,
  `idCarritoCompra` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCarProd`),
  KEY `idCarritoCompra` (`idCarritoCompra`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `carrito_producto_ibfk_1` FOREIGN KEY (`idCarritoCompra`) REFERENCES `carritocompras` (`idCarritoCompra`),
  CONSTRAINT `carrito_producto_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_producto`
--

INSERT INTO `carrito_producto` VALUES (1,1,17),(2,2,15),(3,3,13),(4,4,18),(5,5,3),(6,6,13);

--
-- Table structure for table `carritocompras`
--

DROP TABLE IF EXISTS `carritocompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritocompras` (
  `idCarritoCompra` int(11) NOT NULL AUTO_INCREMENT,
  `Cantidad` int(11) NOT NULL,
  `idComprador` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCarritoCompra`),
  KEY `idComprador` (`idComprador`),
  CONSTRAINT `carritocompras_ibfk_1` FOREIGN KEY (`idComprador`) REFERENCES `compradores` (`idComprador`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritocompras`
--

INSERT INTO `carritocompras` VALUES (1,12,1),(2,1,3),(3,1,3),(4,32,1),(5,5,1),(6,4,1);

--
-- Table structure for table `categoria_producto`
--

DROP TABLE IF EXISTS `categoria_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_producto` (
  `idCatProd` int(11) NOT NULL AUTO_INCREMENT,
  `idCategoria` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
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
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `idVendedor` int(11) DEFAULT NULL,
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
  `idComprador` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idComprador`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `compradores_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compradores`
--

INSERT INTO `compradores` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);

--
-- Table structure for table `cotizaciones`
--

DROP TABLE IF EXISTS `cotizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotizaciones` (
  `idCotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `PrecioCotizado` decimal(10,0) NOT NULL,
  `idCarritoCompra` int(11) DEFAULT NULL,
  `idLista` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
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
  `idDetalleOC` int(11) NOT NULL AUTO_INCREMENT,
  `Cantidad` int(11) NOT NULL,
  `PrecioUnitario` decimal(10,0) NOT NULL,
  `Subtotal` decimal(10,0) NOT NULL,
  `idOrdenCompra` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
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
  `idDomicilio` int(11) NOT NULL AUTO_INCREMENT,
  `Direccion` varchar(50) NOT NULL,
  `Colonia` varchar(50) NOT NULL,
  `Ciudad` varchar(50) NOT NULL,
  `Estado` varchar(50) NOT NULL,
  `Pais` varchar(50) NOT NULL,
  `CP` varchar(15) NOT NULL,
  `Referencia` varchar(100) DEFAULT NULL,
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
  `idEspec` int(11) NOT NULL,
  `Titulo` varchar(50) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `idProducto` int(11) DEFAULT NULL,
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
  `idListProd` int(11) NOT NULL AUTO_INCREMENT,
  `idLista` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
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
  `idLista` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `esPrivado` tinyint(1) NOT NULL,
  `idComprador` int(11) DEFAULT NULL,
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
  `idMetodoPago` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(15) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
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
  `idOrdenCompra` int(11) NOT NULL AUTO_INCREMENT,
  `timeStamp` datetime NOT NULL DEFAULT current_timestamp(),
  `MontoTotal` decimal(10,0) NOT NULL,
  `Status` int(11) NOT NULL,
  `idComprador` int(11) DEFAULT NULL,
  `idMetodoPago` int(11) DEFAULT NULL,
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
  `idPago` int(11) NOT NULL AUTO_INCREMENT,
  `Monto` decimal(10,0) NOT NULL,
  `timeStamp` datetime NOT NULL DEFAULT current_timestamp(),
  `idOrdenCompra` int(11) DEFAULT NULL,
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
  `idPersona` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `ApellidoPat` varchar(50) NOT NULL,
  `ApellidoMat` varchar(50) DEFAULT NULL,
  `FechaNac` date NOT NULL,
  `Sexo` char(1) NOT NULL,
  `idDomicilio` int(11) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idPersona`),
  KEY `idDomicilio` (`idDomicilio`),
  CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`idDomicilio`) REFERENCES `domicilios` (`idDomicilio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

INSERT INTO `personas` VALUES (1,'Nelly','Rangel','Jimenez','1999-05-15','F',NULL,'2251054299'),(2,'Caraly','Armenta ','Jimenez','1990-04-25','F',NULL,'2251053579'),(3,'Alicia','Jimenez','Aburto','1971-06-15','M',NULL,'2251038946'),(4,'Usuario Veinte','Apepat','Apemat','1999-07-10','M',NULL,'0123456789'),(5,'UsuarioRe','apellidoPat','apellidoMat','1988-10-10','M',NULL,'0987654321');

--
-- Table structure for table `prodmultimedias`
--

DROP TABLE IF EXISTS `prodmultimedias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodmultimedias` (
  `idProdMultimedia` int(11) NOT NULL AUTO_INCREMENT,
  `Archivo` blob NOT NULL,
  `Extension` varchar(10) NOT NULL,
  `idProducto` int(11) DEFAULT NULL,
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
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `esCotizable` bit(1) NOT NULL,
  `Precio` float(10,0) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL,
  `Rating` float(10,0) DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `idVendedor` int(11) DEFAULT NULL,
  `idAdmin` int(11) DEFAULT NULL,
  `idCarritoCompra` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `idVendedor` (`idVendedor`),
  KEY `idAdmin` (`idAdmin`),
  KEY `idCarritoCompra` (`idCarritoCompra`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idVendedor`) REFERENCES `vendedores` (`idVendedor`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`idAdmin`) REFERENCES `admins` (`idAdmin`),
  CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`idCarritoCompra`) REFERENCES `carritocompras` (`idCarritoCompra`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` VALUES (1,'CupCake Fresa','Pastelillos rellenos de fresa',_binary '\0',11,50,3,1,1,NULL,NULL),(2,'CupCake Chocolate','Pastelillos rellenos de chocolate',_binary '\0',16,10,4,1,2,NULL,NULL),(3,'CupCake Vainilla','Pastelillos rellenos de vainilla',_binary '\0',20,32,5,1,1,NULL,NULL),(4,'PastelChoco','Relleno de nuez, cacao y coco',_binary '\0',12,16,0,1,3,NULL,NULL),(5,'PastelChoco','Relleno de nuez, cacao y coco',_binary '\0',12,16,0,1,3,NULL,NULL),(6,'PastelChoco','Relleno de nuez, cacao y coco',_binary '\0',12,16,0,1,3,NULL,NULL),(7,'a','a',_binary '\0',16,12,0,1,3,NULL,NULL),(8,'PastelChoco','Relleno de coco, cacao y nuez',_binary '\0',12,16,0,1,3,NULL,NULL),(9,'Pastel','Relleno de cacao, nuez y coco',_binary '\0',12,16,0,1,3,NULL,NULL),(10,'PastelChoco','Relleno de nuez, cacao y cco',_binary '\0',12,16,0,1,3,NULL,NULL),(11,'PastelChoco','Relleno de nuez, cacao y cco',_binary '\0',125,16,0,1,3,NULL,NULL),(12,'PastelChoco','Relleno de nuez, cacao y cco',_binary '\0',12,16,0,1,3,NULL,NULL),(13,'PastelChoco','Relleno de nuez, cacao y coco',_binary '\0',12,16,0,1,3,NULL,NULL),(14,'Galleta chispas','Chispas de chocolate y relleno de cacao',_binary '',0,0,0,1,3,NULL,NULL),(15,'Macarrones','Contiene 12 colores distintos',_binary '\0',29,49,0,1,1,NULL,NULL),(16,'Galletas de Nepe','Galleta de Nepe de Maiz',_binary '\0',10,5,0,1,1,NULL,NULL),(17,'Huevos de avestruz','Huevos de avestruz doble yema',_binary '\0',200,3,0,1,1,NULL,NULL),(18,'Magdalenas','Sumo de naranja y entregas en la misma ciudad',_binary '\0',13,56,0,1,3,NULL,NULL),(19,'Tiramisu','Hecho con café de grano y cacao',_binary '',0,0,0,3,2,NULL,NULL);

--
-- Table structure for table `respuestasespec`
--

DROP TABLE IF EXISTS `respuestasespec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuestasespec` (
  `idResp` int(11) NOT NULL AUTO_INCREMENT,
  `Respuesta` varchar(50) NOT NULL,
  `idCotizacion` int(11) DEFAULT NULL,
  `idEspec` int(11) DEFAULT NULL,
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
  `idRol` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(15) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
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
  `idSuperAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
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
  `idUserRol` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `idRol` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUserRol`),
  KEY `idRol` (`idRol`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `usuario_rol_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`),
  CONSTRAINT `usuario_rol_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_rol`
--

INSERT INTO `usuario_rol` VALUES (1,1,3),(2,2,3),(3,3,3),(4,4,3),(5,5,3);

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(15) NOT NULL,
  `contraseña` varchar(15) NOT NULL,
  `fechaIngreso` datetime NOT NULL DEFAULT current_timestamp(),
  `email` varchar(20) NOT NULL,
  `fotoPerfil` blob DEFAULT NULL,
  `esPrivado` tinyint(1) NOT NULL DEFAULT 0,
  `esActivo` bit(1) DEFAULT NULL,
  `idPersona` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `userName` (`userName`),
  KEY `idPersona` (`idPersona`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` VALUES (1,'gaki1505','Prueba_1','2023-11-07 14:33:11','nellyrj@outlook.com',NULL,1,_binary '',1),(2,'caraly25','Prueba_2','2023-11-07 15:27:23','caraly25@gmail.com',NULL,1,_binary '',2),(3,'alicia1971','Prueba_3','2023-11-07 23:24:09','alicia1971@gmail.com',NULL,1,_binary '',3),(4,'usuario20','Ariuro_100','2023-11-15 06:50:33','usuario20@mail.com',NULL,1,_binary '',4),(5,'usuarioRe3','Prueba_5','2023-11-16 22:00:23','userReject@gmail.com',NULL,1,_binary '',5);

--
-- Table structure for table `valoraciones`
--

DROP TABLE IF EXISTS `valoraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valoraciones` (
  `idValoracion` int(11) NOT NULL AUTO_INCREMENT,
  `Comentario` varchar(50) NOT NULL,
  `Calificacion` int(11) NOT NULL,
  `idDetalleOC` int(11) DEFAULT NULL,
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
  `idVendedor` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `Status` int(11) DEFAULT 2,
  PRIMARY KEY (`idVendedor`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `vendedores_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

INSERT INTO `vendedores` VALUES (1,1,1),(2,2,1),(3,3,1),(4,5,3);

--
-- Temporary view structure for view `vw_consultaventas_admin`
--

DROP TABLE IF EXISTS `vw_consultaventas_admin`;
/*!50001 DROP VIEW IF EXISTS `vw_consultaventas_admin`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_consultaventas_admin` AS SELECT 
 1 AS `idProducto`,
 1 AS `NombreProducto`,
 1 AS `CantidadTotal`,
 1 AS `SubtotalTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_productosaprobados_admin`
--

DROP TABLE IF EXISTS `vw_productosaprobados_admin`;
/*!50001 DROP VIEW IF EXISTS `vw_productosaprobados_admin`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_productosaprobados_admin` AS SELECT 
 1 AS `idProducto`,
 1 AS `Nombre`,
 1 AS `Descripcion`,
 1 AS `esCotizable`,
 1 AS `Precio`,
 1 AS `Stock`,
 1 AS `userName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_productosespera_admin`
--

DROP TABLE IF EXISTS `vw_productosespera_admin`;
/*!50001 DROP VIEW IF EXISTS `vw_productosespera_admin`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_productosespera_admin` AS SELECT 
 1 AS `idProducto`,
 1 AS `Nombre`,
 1 AS `Descripcion`,
 1 AS `esCotizable`,
 1 AS `Precio`,
 1 AS `Stock`,
 1 AS `Rating`,
 1 AS `Status`,
 1 AS `idVendedor`,
 1 AS `idUsuario`,
 1 AS `userName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_productosrechazados_admin`
--

DROP TABLE IF EXISTS `vw_productosrechazados_admin`;
/*!50001 DROP VIEW IF EXISTS `vw_productosrechazados_admin`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_productosrechazados_admin` AS SELECT 
 1 AS `idProducto`,
 1 AS `Nombre`,
 1 AS `Descripcion`,
 1 AS `esCotizable`,
 1 AS `Precio`,
 1 AS `Stock`,
 1 AS `userName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_top10productos_home`
--

DROP TABLE IF EXISTS `vw_top10productos_home`;
/*!50001 DROP VIEW IF EXISTS `vw_top10productos_home`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_top10productos_home` AS SELECT 
 1 AS `idProducto`,
 1 AS `NombreProducto`,
 1 AS `CantidadTotalVendida`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_vendedoresaprobados_admin`
--

DROP TABLE IF EXISTS `vw_vendedoresaprobados_admin`;
/*!50001 DROP VIEW IF EXISTS `vw_vendedoresaprobados_admin`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_vendedoresaprobados_admin` AS SELECT 
 1 AS `idVendedor`,
 1 AS `userName`,
 1 AS `Nombre`,
 1 AS `ApellidoPat`,
 1 AS `ApellidoMat`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_vendedoresespera_admin`
--

DROP TABLE IF EXISTS `vw_vendedoresespera_admin`;
/*!50001 DROP VIEW IF EXISTS `vw_vendedoresespera_admin`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_vendedoresespera_admin` AS SELECT 
 1 AS `idVendedor`,
 1 AS `userName`,
 1 AS `Nombre`,
 1 AS `ApellidoPat`,
 1 AS `ApellidoMat`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_vendedoresrechazados_admin`
--

DROP TABLE IF EXISTS `vw_vendedoresrechazados_admin`;
/*!50001 DROP VIEW IF EXISTS `vw_vendedoresrechazados_admin`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_vendedoresrechazados_admin` AS SELECT 
 1 AS `idVendedor`,
 1 AS `userName`,
 1 AS `Nombre`,
 1 AS `ApellidoPat`,
 1 AS `ApellidoMat`*/;
SET character_set_client = @saved_cs_client;

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultaPersona`(IN `p_idPersona` INT)
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarProducto`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultarUsuario`(IN `p_idUsuario` INT)
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `IniciarSesion`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarUsuario`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ConsultarIdAdministrador`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ConsultarIdComprador`(
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
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ConsultarIdVendedor`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getProductosByVendedor`(
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsertarCarritoCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertarCarritoCompra`(
    IN p_cantidad INT,
    IN p_idComprador INT,
    IN p_idProducto INT,
    OUT p_idCarritoCompra INT
)
BEGIN
    DECLARE existingRowCount INT;

    -- Verificar si ya existe una fila con el mismo idProducto e idComprador
    SELECT COUNT(*) INTO existingRowCount
    FROM carrito_producto cp
    JOIN carritocompras cc ON cp.idCarritoCompra = cc.idCarritoCompra
    WHERE cp.idProducto = p_idProducto AND cc.idComprador = p_idComprador;

    IF existingRowCount > 0 THEN
        -- Si ya existe, actualizar la cantidad en la tabla carritocompras
        UPDATE carritocompras c
        JOIN carrito_producto cp ON c.idCarritoCompra = cp.idCarritoCompra
        SET c.cantidad = c.cantidad + p_cantidad
        WHERE cp.idProducto = p_idProducto AND c.idComprador = p_idComprador;

        -- Obtener el idCarritoCompra existente
        SET p_idCarritoCompra = (
            SELECT idCarritoCompra
            FROM carrito_producto
            WHERE idProducto = p_idProducto AND idCarritoCompra = p_idComprador
        );

        -- Si no se encontró, usar el valor recién insertado
        IF p_idCarritoCompra IS NULL THEN
            SET p_idCarritoCompra = LAST_INSERT_ID();
        END IF;
    ELSE
        -- Si no existe, insertar en la tabla CarritoCompra
        INSERT INTO carritocompras (cantidad, idComprador)
        VALUES (p_cantidad, p_idComprador);

        -- Obtener el último ID insertado
        SET p_idCarritoCompra = LAST_INSERT_ID();

        -- Insertar en la tabla Carrito_Producto teniendo como parámetro el idCarritoCompra y su idProducto
        CALL sp_InsertarCarritoProducto(p_idCarritoCompra, p_idProducto);
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsertarCarritoProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertarCarritoProducto`(in p_idCarritoCompra int, in p_idProducto int)
begin 
-- Insertar en la tabla de Carrito_Producto teniendo como parámetro el idCarritoCompra y su idProducto
insert into carrito_producto (idCarritoCompra, idProducto)
values (p_idCarritoCompra, p_idProducto);
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertarComprador`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertarPersona`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertarProducto`(IN `p_Nombre` VARCHAR(50), IN `p_Descripcion` VARCHAR(50), IN `p_esCotizable` BOOLEAN, IN `p_Precio` FLOAT(10,2), IN `p_Stock` INT, IN `p_Rating` FLOAT(2,1), IN `p_Status` BOOLEAN, IN `p_idVendedor` INT, IN `p_idAdmin` INT)
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertarUsuario`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertarUsuarioRol`(
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertarVendedor`(
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_updateStatusProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateStatusProducto`(IN p_idProducto INT, IN p_nuevoEstado INT)
BEGIN
    -- Actualizar el Status del producto
    UPDATE productos SET Status = p_nuevoEstado WHERE idProducto = p_idProducto;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updateStatusVendedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateStatusVendedor`(IN v_idVendedor INT, IN v_nuevoEstado INT)
BEGIN
    -- Actualizar el Status del vendedor
    UPDATE vendedores SET Status = v_nuevoEstado WHERE idVendedor = v_idVendedor;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_consultaventas_admin`
--

/*!50001 DROP VIEW IF EXISTS `vw_consultaventas_admin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_consultaventas_admin` AS select `d`.`idProducto` AS `idProducto`,`p`.`Nombre` AS `NombreProducto`,sum(`d`.`Cantidad`) AS `CantidadTotal`,sum(`d`.`Subtotal`) AS `SubtotalTotal` from (`detallesordencompra` `d` join `productos` `p` on(`d`.`idProducto` = `p`.`idProducto`)) group by `d`.`idProducto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_productosaprobados_admin`
--

/*!50001 DROP VIEW IF EXISTS `vw_productosaprobados_admin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_productosaprobados_admin` AS select `p`.`idProducto` AS `idProducto`,`p`.`Nombre` AS `Nombre`,`p`.`Descripcion` AS `Descripcion`,`p`.`esCotizable` AS `esCotizable`,`p`.`Precio` AS `Precio`,`p`.`Stock` AS `Stock`,`u`.`userName` AS `userName` from ((`productos` `p` join `vendedores` `v` on(`p`.`idVendedor` = `v`.`idVendedor`)) join `usuarios` `u` on(`v`.`idUsuario` = `u`.`idUsuario`)) where `p`.`Status` = 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_productosespera_admin`
--

/*!50001 DROP VIEW IF EXISTS `vw_productosespera_admin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_productosespera_admin` AS select `p`.`idProducto` AS `idProducto`,`p`.`Nombre` AS `Nombre`,`p`.`Descripcion` AS `Descripcion`,`p`.`esCotizable` AS `esCotizable`,`p`.`Precio` AS `Precio`,`p`.`Stock` AS `Stock`,`p`.`Rating` AS `Rating`,`p`.`Status` AS `Status`,`p`.`idVendedor` AS `idVendedor`,`u`.`idUsuario` AS `idUsuario`,`u`.`userName` AS `userName` from ((`productos` `p` join `vendedores` `v` on(`p`.`idVendedor` = `v`.`idVendedor`)) join `usuarios` `u` on(`v`.`idUsuario` = `u`.`idUsuario`)) where `p`.`Status` = 2 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_productosrechazados_admin`
--

/*!50001 DROP VIEW IF EXISTS `vw_productosrechazados_admin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_productosrechazados_admin` AS select `p`.`idProducto` AS `idProducto`,`p`.`Nombre` AS `Nombre`,`p`.`Descripcion` AS `Descripcion`,`p`.`esCotizable` AS `esCotizable`,`p`.`Precio` AS `Precio`,`p`.`Stock` AS `Stock`,`u`.`userName` AS `userName` from ((`productos` `p` join `vendedores` `v` on(`p`.`idVendedor` = `v`.`idVendedor`)) join `usuarios` `u` on(`v`.`idUsuario` = `u`.`idUsuario`)) where `p`.`Status` = 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_top10productos_home`
--

/*!50001 DROP VIEW IF EXISTS `vw_top10productos_home`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_top10productos_home` AS select `d`.`idProducto` AS `idProducto`,`p`.`Nombre` AS `NombreProducto`,sum(`d`.`Cantidad`) AS `CantidadTotalVendida` from (`detallesordencompra` `d` join `productos` `p` on(`d`.`idProducto` = `p`.`idProducto`)) group by `d`.`idProducto` order by sum(`d`.`Cantidad`) desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_vendedoresaprobados_admin`
--

/*!50001 DROP VIEW IF EXISTS `vw_vendedoresaprobados_admin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_vendedoresaprobados_admin` AS select `v`.`idVendedor` AS `idVendedor`,`u`.`userName` AS `userName`,`p`.`Nombre` AS `Nombre`,`p`.`ApellidoPat` AS `ApellidoPat`,`p`.`ApellidoMat` AS `ApellidoMat` from ((`vendedores` `v` join `usuarios` `u` on(`v`.`idUsuario` = `u`.`idUsuario`)) join `personas` `p` on(`u`.`idPersona` = `p`.`idPersona`)) where `v`.`Status` = 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_vendedoresespera_admin`
--

/*!50001 DROP VIEW IF EXISTS `vw_vendedoresespera_admin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_vendedoresespera_admin` AS select `v`.`idVendedor` AS `idVendedor`,`u`.`userName` AS `userName`,`p`.`Nombre` AS `Nombre`,`p`.`ApellidoPat` AS `ApellidoPat`,`p`.`ApellidoMat` AS `ApellidoMat` from ((`vendedores` `v` join `usuarios` `u` on(`v`.`idUsuario` = `u`.`idUsuario`)) join `personas` `p` on(`u`.`idPersona` = `p`.`idPersona`)) where `v`.`Status` = 2 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_vendedoresrechazados_admin`
--

/*!50001 DROP VIEW IF EXISTS `vw_vendedoresrechazados_admin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_vendedoresrechazados_admin` AS select `v`.`idVendedor` AS `idVendedor`,`u`.`userName` AS `userName`,`p`.`Nombre` AS `Nombre`,`p`.`ApellidoPat` AS `ApellidoPat`,`p`.`ApellidoMat` AS `ApellidoMat` from ((`vendedores` `v` join `usuarios` `u` on(`v`.`idUsuario` = `u`.`idUsuario`)) join `personas` `p` on(`u`.`idPersona` = `p`.`idPersona`)) where `v`.`Status` = 3 */;
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

-- Dump completed on 2023-11-20 18:32:04
