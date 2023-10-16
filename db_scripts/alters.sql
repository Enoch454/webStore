-- Tabla usuario cambia para que fotoPerfil sea null por default
ALTER TABLE `Usuarios` CHANGE `fotoPerfil` `fotoPerfil` BLOB NULL DEFAULT NULL;

Alter table Usuarios
Add `esActivo` BIT;




ALTER TABLE Personas
ADD `Telefono` VARCHAR(15);



select * from Usuarios;
select * from Personas;

SELECT Usuarios.*, Personas.*
FROM Usuarios
INNER JOIN Personas ON Usuarios.idPersona = Personas.idPersona;

-- Reiniciar el autoincremento de la tabla Personas
ALTER TABLE Personas AUTO_INCREMENT = 1;

-- Reiniciar el autoincremento de la tabla Usuarios
ALTER TABLE Usuarios AUTO_INCREMENT = 1;


UPDATE Usuarios SET idPersona = 1 WHERE idUsuario = 1