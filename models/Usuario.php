<?php
namespace Models;

class Usuario {
    private $idUsuario;
    private $userName;
    private $contrasena;
    private $fechaIngreso;
    private $email;
    private $fotoPerfil;
    private $esPrivado;
    private $esActivo;
    private $idPersona;
    public function getIdUsuario() {
        return $this->idUsuario;
    }
    public function setIdUsuario($id) {
        $this->idUsuario = $id;
    }
    public function getUserName() {
        return $this->userName;
    }
    public function setUserName($userName) {
        $this->userName = $userName;
    }
    public function getContrasena() {
        return $this->contrasena;
    }
    public function setContrasena($contrasena) {
        $this->contrasena = $contrasena;
    }
    public function getFechaIngreso() {
        return $this->fechaIngreso;
    }
    public function setFechaIngreso($fechaIngreso) {
        $this->fechaIngreso = $fechaIngreso;
    }
    public function getFotoPerfil() {
        return $this->fotoPerfil;
    }
    public function setFotoPerfil($fotoPerfil) {
        $this->fotoPerfil = $fotoPerfil;
    }
    public function getEsPrivado() {
        return $this->esPrivado;
    }
    public function setEsPrivado ($esPrivado) {
        $this->esPrivado = $esPrivado;
    }

    public function getEsActivo() {
        return $this->esActivo;
    }
    public function setEsActivo ($esActivo) {
        $this->esActivo = $esActivo;
    }

    public function getIdPersona () {
        return $this->idPersona;
    }
    public function setIdPersona ($idPersona) {
        $this->idPersona = $idPersona;
    }
    /// fin sets and getters

    public function __construct($userName, $contrasena, $email,
                                $idUsuario = null,
                                $fechaIngreso = null,
                                $fotoPerfil = null,
                                $esPrivado,
                                $esActivo) {
        $this->idUsuario = $idUsuario;
        $this->userName = $userName;
        $this->contrasena = $contrasena;
        $this->fechaIngreso = $fechaIngreso;
        $this->email = $email;
        $this->fotoPerfil = $fotoPerfil;
        $this->esPrivado = $esPrivado;
        $this->esActivo = $esActivo;
        
    }
    static public function parseJson($json) {
        $usuario = new Usuario(
            isset($json["userName"]) ? $json["userName"] : "",
            isset($json["contraseña"]) ? $json["contraseña"] : "",
            isset($json["email"]) ? $json["email"] : "",
            null,
            isset($json["fechaIngreso"]) ? $json["fechaIngreso"] : "",
            isset($json["fotoPerfil"]) ? $json["fotoPerfil"] : "",
            isset($json["esPrivado"]) ? $json["esPrivado"] : "",
            isset($json["esActivo"]) ? $json["esActivo"] : ""
            //isset($json["idPersona"]) ? $json["idPersona"] : ""
        );

        if(isset($json["idUsuario"]))
            $usuario->setIdUsuario((int)$json["idUsuario"]);
        if(isset($json["idPersona"]))
            $usuario->setIdPersona((int)$json["idPersona"]);
        return $usuario;

    }
    public function save($mysqli) {
            // Define la consulta SQL con el stored procedure
            $sql = 'CALL sp_InsertarUsuario(?, ?, ?, ?, ?, ?, ?, @idNewUsr)';
    
            // Verifica si la conexión a la base de datos está establecida
            if ($mysqli->connect_error) {
                die("Connection failed: " . $mysqli->connect_error);
            }
    
            // Prepara la consulta SQL
            $stmt = $mysqli->prepare($sql);
    
            if ($stmt) {
                // Vincula los parámetros
                $stmt->bind_param("sssssss",
                    $this->userName,
                    $this->contrasena,
                    $this->email,
                    $this->fotoPerfil,
                    $this->esPrivado,
                    $this->esActivo,
                    $this->idPersona);
    
                // Ejecuta la consulta
                $stmt->execute();
                
                // Recuperar el valor de @res
                $selectResult = mysqli_query($mysqli, "SELECT @idNewUsr as idUsr;");
                $row = mysqli_fetch_assoc($selectResult);
                $idPer = $row['idUsr'];
                return $idPer;
    
                
            } else {
                return false;
            }
        
    }
    
    public static function validateCredendtials($mysqli, $userName, $password) {
        $sql = "CALL IniciarSesion('%s', '%s', @res);";
        $sql = sprintf($sql, $userName, $password);
        $result = mysqli_query($mysqli, $sql);

        // Recuperar el valor de @res
        $selectResult = mysqli_query($mysqli, "SELECT @res as idUsuario;");
        $row = mysqli_fetch_assoc($selectResult);
        $idUsr = $row['idUsuario'];

        mysqli_free_result($selectResult);

        return $idUsr;

    }

    
    public static function findUserById($mysqli, $id) {

        $sql = "CALL ConsultarUsuario(?);";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("i",$id);
        $stmt->execute();
        $result = $stmt->get_result(); 
        $user = $result->fetch_assoc();
        //print_r($user);
        return $user ? Usuario::parseJson($user) : NULL;

    }
    
    public function toJSON() {
        return get_object_vars($this);
    }

    // dado cuatro roles preestablecidos en la bd, se
    // declara a que rol pertenece esta instancia de 
    // usuario, esta insertando en la tabla 'Usuario_Rol'
    // el id del usuario presente y del rol correspondiente
    // 1 - SuperAdmin, 2 - Admin, 3 - Comprador, 4 - Vendedor
    public static function setRol($mysqli, $idUsuario, $idRol) {
        $sql = "CALL sp_InsertarUsuarioRol(?, ?)";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("ii",
            $idUsuario,
            $idRol);
        $stmt->execute();

    }

}