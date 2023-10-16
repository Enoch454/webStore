-- Insertar usuario y persona, colocando como esActivo como 1 y esPrivado como true por default a la hora de hacer insert
DELIMITER //

CREATE PROCEDURE InsertarUsuario(
  IN p_userName VARCHAR(15),
  IN p_contraseña VARCHAR(15),
  IN p_email VARCHAR(20)
)
BEGIN
  -- Insertar en la tabla Usuarios
  INSERT INTO Usuarios (userName, contraseña, email)
  VALUES (p_userName, p_contraseña, p_email);
END //


DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_InsertarUsuario(
  IN p_userName VARCHAR(15),
  IN p_contraseña VARCHAR(15),
  IN p_email VARCHAR(20),
  IN p_fotoPerfil BLOB,
  IN p_esPrivado BOOLEAN,
  IN p_esActivo BIT
)
BEGIN
  INSERT INTO Usuarios (userName, contraseña, email, fotoPerfil, esPrivado, esActivo)
  VALUES (p_userName, p_contraseña, p_email, p_fotoPerfil, p_esPrivado, p_esActivo);

END //
DELIMITER ;


-- Insertar Persona atributos completos

DELIMITER //

CREATE PROCEDURE sp_InsertarPersona(
  IN p_Nombre VARCHAR(50),
  IN p_ApellidoPat VARCHAR(50),
  IN p_ApellidoMat VARCHAR(50),
  IN p_FechaNac DATE,
  IN p_Sexo CHAR(1),
  IN p_Telefono VARCHAR(15)
)
BEGIN
  -- Insertar en la tabla Personas
  INSERT INTO Personas (Nombre, ApellidoPat, ApellidoMat, FechaNac, Sexo, Telefono)
  VALUES (p_Nombre, p_ApellidoPat, p_ApellidoMat, p_FechaNac, p_Sexo, p_Telefono);
END //

DELIMITER ;


DELIMITER //
-- Editar el usuario en cuestion
CREATE PROCEDURE ModificarUsuarioYPersona(
  IN p_idUsuario INT,
  IN p_userName VARCHAR(15),
  IN p_contraseña VARCHAR(15),
  IN p_email VARCHAR(20),
  IN p_fotoPerfil BLOB,
  IN p_esPrivado BOOLEAN,
  IN p_nombre VARCHAR(50),
  IN p_apellidoPat VARCHAR(50),
  IN p_apellidoMat VARCHAR(50),
  IN p_fechaNac DATE,
  IN p_sexo CHAR(1)
)
BEGIN
  DECLARE persona_id INT;

  -- Actualizar la tabla Personas
  UPDATE Personas
  SET
    Nombre = p_nombre,
    ApellidoPat = p_apellidoPat,
    ApellidoMat = p_apellidoMat,
    FechaNac = p_fechaNac,
    Sexo = p_sexo
  WHERE idPersona = (SELECT idPersona FROM Usuarios WHERE idUsuario = p_idUsuario);

  -- Actualizar la tabla Usuarios
  UPDATE Usuarios
  SET
    userName = p_userName,
    contraseña = p_contraseña,
    email = p_email,
    fotoPerfil = p_fotoPerfil,
    esPrivado = p_esPrivado
  WHERE idUsuario = p_idUsuario;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE DesactivarUsuario(
  IN p_idUsuario INT
)
BEGIN
  -- Actualizar la columna esActivo en la tabla Usuarios, usando el id del usuario
  UPDATE Usuarios
  SET esActivo = 0
  WHERE idUsuario = p_idUsuario;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE IniciarSesion(
  IN p_userName VARCHAR(15),
  IN p_contraseña VARCHAR(15),
  OUT p_resultado INT
)
BEGIN
  DECLARE userCount INT;

  -- Verificar si el usuario y contraseña coinciden
  SELECT COUNT(*) INTO userCount
  FROM Usuarios
  WHERE userName = p_userName AND contraseña = p_contraseña AND esActivo = 1;

  IF userCount = 1 THEN
    -- SET p_resultado = 1; -- Usuario válido
    SELECT idUsuario INTO p_resultado FROM Usuarios WHERE userName = p_userName LIMIT 1;
  ELSE
    SET p_resultado = -1; -- Usuario inválido
  END IF; -- Agregar este END IF para corregir el error de sintaxis
END //

DELIMITER ;



-- Funcion para ingresar el inicio de sesion si es valido o no
-- DECLARE @resultado INT;
-- CALL IniciarSesion('nombre_usuario', 'contraseña', @resultado);
-- SELECT @resultado;

DELIMITER //

CREATE PROCEDURE ConsultarUsuario(
  IN p_idUsuario INT
)
BEGIN
  SELECT
    U.idUsuario,
    U.userName,
    U.contraseña,
    U.fechaIngreso
    U.email,
    U.fotoPerfil,
    U.esPrivado,
    U.esActivo
  FROM Usuarios U
  WHERE U.idUsuario = p_idUsuario;
END //

DELIMITER ;


