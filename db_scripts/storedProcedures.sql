-- Insertar usuario de prueba solo con Username, contra y email
DELIMITER //

CREATE PROCEDURE InsertarUsuario(
  IN p_userName VARCHAR(15),
  IN p_contraseña VARCHAR(15),
  IN p_email VARCHAR(20)
)
BEGIN

  INSERT INTO Usuarios (userName, contraseña, email)
  VALUES (p_userName, p_contraseña, p_email);
END //

DELIMITER ;

select * from Usuarios;
select * from Personas;
select * from Domicilios;





DELIMITER //
-- Insertar Usuario con todos sus atributos de su tabla

CREATE PROCEDURE sp_InsertarUsuario(
  IN p_userName VARCHAR(15),
  IN p_contraseña VARCHAR(15),
  IN p_email VARCHAR(20),
  IN p_fotoPerfil BLOB,
  IN p_esPrivado BOOLEAN,
  IN p_esActivo BIT,
  IN p_idPersona INT
)
BEGIN
  INSERT INTO Usuarios (userName, contraseña, email, fotoPerfil, esPrivado, esActivo, idPersona)
  VALUES (p_userName, p_contraseña, p_email, p_fotoPerfil, p_esPrivado, p_esActivo, p_idPersona);
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
  IN p_Telefono VARCHAR(15),
  OUT p_res INT
)
BEGIN
  -- Insertar en la tabla Personas
  INSERT INTO Personas (Nombre, ApellidoPat, ApellidoMat, FechaNac, Sexo, Telefono)
  VALUES (p_Nombre, p_ApellidoPat, p_ApellidoMat, p_FechaNac, p_Sexo, p_Telefono);
  SELECT LAST_INSERT_ID() INTO p_res;

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
    SET p_resultado = 1; -- Usuario válido
  ELSE
    SET p_resultado = 0; -- Usuario inválido
  END IF;
END //

DELIMITER ;


-- Funcion para ingresar el inicio de sesion si es valido o no
-- DECLARE @resultado INT;
-- CALL IniciarSesion('nombre_usuario', 'contraseña', @resultado);
-- SELECT @resultado;

DELIMITER //

CREATE PROCEDURE ConsultarPerfilUsuarioPersona(
  IN p_idUsuario INT
)
BEGIN
  SELECT
    U.idUsuario,
    U.userName,
    U.email,
    U.fotoPerfil,
    U.esPrivado,
    P.Nombre,
    P.ApellidoPat,
    P.ApellidoMat,
    P.FechaNac,
    P.Sexo
  FROM Usuarios U
  JOIN Personas P ON U.idPersona = P.idPersona
  WHERE U.idUsuario = p_idUsuario;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE ConsultarUsuario(
  IN p_idUsuario INT
)
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
END //

DELIMITER ;


------
DELIMITER //

CREATE PROCEDURE sp_InsertarUsuarioRol(
    IN p_idUsuario INT,
    IN p_idRol INT
)
BEGIN
    INSERT INTO Usuario_Rol (idUsuario, idRol)
    VALUES (p_idUsuario, p_idRol);
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE ConsultaPersona(
  IN p_idPersona INT
)
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
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_InsertarComprador(
    IN p_idUsuario INT
)
BEGIN
	INSERT INTO Compradores (idUsuario)
	VALUES (p_idUsuario);
END;

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_InsertarProducto(
  IN p_Nombre VARCHAR(50),
  IN p_Descripcion VARCHAR(50),
  IN p_esCotizable BOOLEAN,
  IN p_Precio DECIMAL(10,2),
  IN p_Stock INT,
  IN p_Rating DECIMAL(2,1),
  IN p_Status BOOLEAN,
  IN p_idVendedor INT,
  IN p_idAdmin INT
)
BEGIN
  INSERT INTO Productos (Nombre, Descripcion, esCotizable, Precio, Stock, Rating, Status, idVendedor, idAdmin)
  VALUES (p_Nombre, p_Descripcion, p_esCotizable, p_Precio, p_Stock, p_Rating, p_Status, p_idVendedor, p_idAdmin);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ConsultarProducto(
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
END //

DELIMITER ;

--- Procedimiento almacenado para que, dado un id de usuario, se devuelva el id de su comprador
DELIMITER //
CREATE PROCEDURE sp_ConsultarIdComprador(
  IN p_idUsuario INT
)
BEGIN
  SELECT idComprador
  FROM Compradores
  WHERE idUsuario = p_idUsuario;
END //
DELIMITER ;

/*--Procedimiento almacenado para que, dado un id de usuario, se devuelva el id de su vendedor */
DELIMITER //
CREATE PROCEDURE sp_ConsultarIdVendedor(
  IN p_idUsuario INT
)
BEGIN
  SELECT idVendedor
  FROM Vendedores
  WHERE idUsuario = p_idUsuario;
END //
DELIMITER ;

/*---Procedimiento almacenado para que, dado un id de usuario, se devuelva el id de su administrador*/
DELIMITER // 
CREATE PROCEDURE sp_ConsultarIdAdministrador(
  IN p_idUsuario INT
)
BEGIN
  SELECT idAdministrador
  FROM Administradores
  WHERE idUsuario = p_idUsuario;
END //
DELIMITER ;

--- Procedimiento almacenado para que, dado un id de usuario, se inserta un nuevo registro en la tabla Vendedores
DELIMITER //
CREATE PROCEDURE sp_InsertarVendedor(
  IN p_idUsuario INT
)
BEGIN
  INSERT INTO Vendedores (idUsuario)
  VALUES (p_idUsuario);
END //




