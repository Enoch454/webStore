-- Tabla usuario cambia para que fotoPerfil sea null por default
ALTER TABLE `Usuarios` CHANGE `fotoPerfil` `fotoPerfil` BLOB NULL DEFAULT NULL;

