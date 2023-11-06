-- Tabla usuario cambia para que fotoPerfil sea null por default
ALTER TABLE `Usuarios` CHANGE `fotoPerfil` `fotoPerfil` BLOB NULL DEFAULT NULL;

Alter table Usuarios
Add `esActivo` BIT;

ALTER TABLE Personas
ADD `Telefono` VARCHAR(15);

ALTER TABLE Carrito_Producto
ADD `Cantidad` int;

Alter table Productos
drop column Cantidad;

-- select * from Usuarios;
-- select * from Personas;

-- SELECT Usuarios.*, Personas.*
-- FROM Usuarios
-- INNER JOIN Personas ON Usuarios.idPersona = Personas.idPersona;

-- Reiniciar el autoincremento de la tabla Personas
ALTER TABLE Personas AUTO_INCREMENT = 1;

-- Reiniciar el autoincremento de la tabla Usuarios
ALTER TABLE Usuarios AUTO_INCREMENT = 1;


-- UPDATE Usuarios SET idPersona = 1 WHERE idUsuario = 1

-- Se agrega el campo 'Telefono' a la tabla Personas
ALTER TABLE `Personas` ADD `Telefono` VARCHAR(10) NULL AFTER `idDomicilio`;

-- Se cambia el tipo de p_esActivo a boolean
DROP PROCEDURE `sp_InsertarUsuario`; CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertarUsuario`(IN `p_userName` VARCHAR(15), IN `p_contraseña` VARCHAR(15), IN `p_email` VARCHAR(20), IN `p_fotoPerfil` BLOB, IN `p_esPrivado` BOOLEAN, IN `p_esActivo` BOOLEAN, IN `p_idPersona` INT) NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER BEGIN INSERT INTO Usuarios (userName, contraseña, email, fotoPerfil, esPrivado, esActivo, idPersona) VALUES (p_userName, p_contraseña, p_email, p_fotoPerfil, p_esPrivado, p_esActivo, p_idPersona); END