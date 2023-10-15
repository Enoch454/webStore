-- Tabla usuario cambia para que fotoPerfil sea null por default
ALTER TABLE `Usuarios` CHANGE `fotoPerfil` `fotoPerfil` BLOB NULL DEFAULT NULL;

-- Se agrega la columna esActivo a Usuarios
ALTER TABLE `Usuarios` ADD `esActivo` TINYINT(1) NOT NULL DEFAULT '1' AFTER `idPersona`;