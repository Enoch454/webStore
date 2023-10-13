DROP DATABASE IF EXISTS webStore_db;
CREATE DATABASE webStore_db;
USE webStore_db;

CREATE TABLE `webStore_db`.`Usuarios`
(
  `idUsuario` INT NOT NULL AUTO_INCREMENT ,
  `userName` VARCHAR(15) NOT NULL ,
  `contraseña` VARCHAR(15) NOT NULL ,
  `fechaIngreso` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `email` VARCHAR(20) NOT NULL ,
  `fotoPerfil` BLOB NOT NULL ,
  `esPrivado` BOOLEAN NOT NULL DEFAULT FALSE ,
  PRIMARY KEY  (`idUsuario`),
  UNIQUE  (`userName`)
);

CREATE TABLE `webStore_db`.`Roles`
(
  `idRol` INT NOT NULL AUTO_INCREMENT ,
  `Nombre` VARCHAR(15) NOT NULL ,
  `Descripcion` VARCHAR(50) NULL ,
  PRIMARY KEY (`idRol`),
  UNIQUE (`Nombre`)
);

CREATE TABLE `webStore_db`.`Personas`
(
  `idPersona` INT NOT NULL AUTO_INCREMENT ,
  `Nombre` VARCHAR(50) NOT NULL ,
  `ApellidoPat` VARCHAR(50) NOT NULL ,
  `ApellidoMat` VARCHAR(50) NULL ,
  `FechaNac` DATE NOT NULL ,
  `Sexo` CHAR(1) NOT NULL ,
  PRIMARY KEY (`idPersona`)
);

CREATE TABLE `webStore_db`.`Domicilios`
(
  `idDomicilio` INT NOT NULL AUTO_INCREMENT ,
  `Direccion` VARCHAR(50) NOT NULL ,
  `Colonia` VARCHAR(50) NOT NULL ,
  `Ciudad` VARCHAR(50) NOT NULL ,
  `Estado` VARCHAR(50) NOT NULL ,
  `Pais` VARCHAR(50) NOT NULL ,
  `CP` VARCHAR(15) NOT NULL ,
  `Referencia` VARCHAR(100) NULL ,
  PRIMARY KEY (`idDomicilio`)
);

CREATE TABLE `webStore_db`.`SuperAdmins`
(
  `idSuperAdmin` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`idSuperAdmin`)
);

CREATE TABLE `webStore_db`.`Compradores`
(
  `idComprador` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`idComprador`)
);

CREATE TABLE `webStore_db`.`Admins`
(
  `idAdmin` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`idAdmin`)
);

CREATE TABLE `webStore_db`.`Vendedores`
(
  `idVendedor` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`idVendedor`)
);

CREATE TABLE `webStore_db`.`Listas`
(
  `idLista` INT NOT NULL AUTO_INCREMENT ,
  `Descripcion` VARCHAR(50) NOT NULL , 
  `Nombre` VARCHAR(50) NOT NULL ,
  `esPrivado` BOOLEAN NOT NULL ,
  PRIMARY KEY (`idLista`)
);

CREATE TABLE `webStore_db`.`Categorias`
(
  `idCategoria` INT NOT NULL AUTO_INCREMENT ,
  `Nombre` VARCHAR(50) NOT NULL ,
  `Descripcion` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`idCategoria`)
);

CREATE TABLE `webStore_db`.`Productos`
(
  `idProducto` INT NOT NULL AUTO_INCREMENT ,
  `Nombre` VARCHAR(50) NOT NULL ,
  `Descripcion` VARCHAR(50) NOT NULL ,
  `esCotizable` BOOLEAN NOT NULL ,
  `Precio` DECIMAL NULL ,
  `Stock` INT NULL ,
  `Rating` DECIMAL NOT NULL ,
  `Status` INT NOT NULL ,
  PRIMARY KEY (`idProducto`)
);

CREATE TABLE `webStore_db`.`ProdMultimedias`
(
  `idProdMultimedia` INT NOT NULL AUTO_INCREMENT ,
  `Archivo` BLOB NOT NULL ,
  `Extension` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`idProdMultimedia`)
);

CREATE TABLE `webStore_db`.`CarritoCompras`
(
  `idCarritoCompra` INT NOT NULL AUTO_INCREMENT ,
  `Cantidad` INT NOT NULL ,
  PRIMARY KEY (`idCarritoCompra`)
);

CREATE TABLE `webStore_db`.`OrdenesCompra`
(
  `idOrdenCompra` INT NOT NULL AUTO_INCREMENT ,
  `timeStamp` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `MontoTotal` DECIMAL NOT NULL ,
  `Status` INT NOT NULL ,
  PRIMARY KEY (`idOrdenCompra`)
);

CREATE TABLE `webStore_db`.`DetallesOrdenCompra`
(
  `idDetalleOC` INT NOT NULL AUTO_INCREMENT ,
  `Cantidad` INT NOT NULL ,
  `PrecioUnitario` DECIMAL NOT NULL ,
  `Subtotal` DECIMAL NOT NULL ,
  PRIMARY KEY (`idDetalleOC`)
);

CREATE TABLE `webStore_db`.`MetodosPago`
(
  `idMetodoPago` INT NOT NULL AUTO_INCREMENT ,
  `Nombre` VARCHAR(15) NOT NULL ,
  `Descripcion` VARCHAR(50) NOT NULL ,
  PRIMARY KEY  (`idMetodoPago`)
);

CREATE TABLE `webStore_db`.`Pagos`
(
  `idPago` INT NOT NULL AUTO_INCREMENT ,
  `Monto` DECIMAL NOT NULL ,
  `timeStamp` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`idPago`)
);

CREATE TABLE `webStore_db`.`Valoraciones`
(
  `idValoracion` INT NOT NULL AUTO_INCREMENT ,
  `Comentario` VARCHAR(50) NOT NULL ,
  `Calificacion` INT NOT NULL ,
  PRIMARY KEY (`idValoracion`)
);

CREATE TABLE `webStore_db`.`Especificaciones`
(
  `idEspec` INT NOT NULL ,
  `Titulo` VARCHAR(50) NOT NULL ,
  `Descripcion` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`idEspec`)
);

CREATE TABLE `webStore_db`.`RespuestasEspec`
(
  `idResp` INT NOT NULL AUTO_INCREMENT ,
  `Respuesta` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`idResp`)
);

CREATE TABLE `webStore_db`.`Cotizaciones`
(
  `idCotizacion` INT NOT NULL AUTO_INCREMENT ,
  `PrecioCotizado` DECIMAL NOT NULL ,
  PRIMARY KEY (`idCotizacion`)
);

CREATE TABLE `webStore_db`.`Usuario_Rol`
(
  `idUserRol` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`idUserRol`)
);

CREATE TABLE `webStore_db`.`Categoria_Producto`
(
  `idCatProd` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`idCatProd`)
);

CREATE TABLE `webStore_db`.`Lista_Producto`
(
  `idListProd` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`idListProd`)
);

CREATE TABLE `webStore_db`.`Carrito_Producto`
(
  `idCarProd` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`idCarProd`)
);


