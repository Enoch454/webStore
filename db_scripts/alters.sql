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
DROP PROCEDURE `sp_InsertarUsuario`; 
DELIMITER $$

CREATE DEFINER=`root`@`localhost` 
PROCEDURE `sp_InsertarUsuario`(
  IN `p_userName` VARCHAR(15), 
  IN `p_contraseña` VARCHAR(15), 
  IN `p_email` VARCHAR(20), 
  IN `p_fotoPerfil` BLOB, 
  IN `p_esPrivado` BOOLEAN, 
  IN `p_esActivo` BOOLEAN, 
  IN `p_idPersona` INT
) 
BEGIN 
  INSERT INTO Usuarios (userName, contraseña, email, fotoPerfil, esPrivado, esActivo, idPersona) 
  VALUES (p_userName, p_contraseña, p_email, p_fotoPerfil, p_esPrivado, p_esActivo, p_idPersona); 
END$$

DELIMITER ;
-- Insercion de roles en tabla Roles
INSERT INTO `Roles` (`idRol`, `Nombre`, `Descripcion`)
VALUES
(NULL, 'SuperAdmin', 'Super Administrador'),
(NULL, 'Admin', 'Administrador'),
(NULL, 'Comprador', 'Comprador'),
(NULL, 'Vendedor', 'Vendedor');
select *from Roles;
-- Se cambio sp_InsertarUsuario para que retorne el id recien ingresado
DROP PROCEDURE `sp_InsertarUsuario`; 
DELIMITER $$

CREATE DEFINER=`root`@`localhost` 
PROCEDURE `sp_InsertarUsuario`(
    IN `p_userName` VARCHAR(15), 
    IN `p_contrasena` VARCHAR(15), 
    IN `p_email` VARCHAR(20), 
    IN `p_fotoPerfil` BLOB, 
    IN `p_esPrivado` BOOLEAN, 
    IN `p_esActivo` BOOLEAN, 
    IN `p_idPersona` INT, 
    OUT `p_res` INT
) 
NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER 
BEGIN 
    INSERT INTO Usuarios (userName, contraseña, email, fotoPerfil, esPrivado, esActivo, idPersona) 
    VALUES (p_userName, p_contrasena, p_email, p_fotoPerfil, p_esPrivado, p_esActivo, p_idPersona); 
    SELECT LAST_INSERT_ID() INTO p_res; 
END$$

DELIMITER ;


-- Correccion en sp iniciar sesion para que devuelva idUsuario
DROP PROCEDURE `IniciarSesion`; 
DELIMITER $$

CREATE DEFINER=`root`@`localhost` 
PROCEDURE `IniciarSesion`(
    IN `p_userName` VARCHAR(15), 
    IN `p_contrasena` VARCHAR(15),
    OUT `p_resultado` INT
) 
NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER 
BEGIN 
    SELECT idUsuario INTO p_resultado 
    FROM Usuarios 
    WHERE userName = p_userName AND contraseña = p_contrasena AND esActivo = 1;
END$$

DELIMITER ;
