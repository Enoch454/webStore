<?php

class Usuario {
    private $idUsuario;
    private $userName;
    private $contrasena;
    private $fechaIngreso;
    private $email;
    private $fotoPerfil;
    private $esPrivado;
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
    public function getIdPersona () {
        return $this->idPersona;
    }
    public function setIdPersona ($idPersona) {
        $this->idPersona = $idPersona;
    }
    /// fin sets and getters

    public function __construct($idUsuario, $userName, $contrasena, $fechaIngreso, $email, $fotoPerfil, $esPrivado) {
        $this->idUsuario = $idUsuario;
        $this->userName = $userName;
        $this->contrasena = $contrasena;
        $this->fechaIngreso = $fechaIngreso;
        $this->email = $email;
        $this->fotoPerfil = $fotoPerfil;
        $this->esPrivado = $esPrivado;
        
    }
    static public function parseJson($json) {
        $usuario = new Usuario(
            isset($json["idUsuario"]) ? $json["idUsuario"] : "",
            isset($json["userName"]) ? $json["userName"] : "",
            isset($json["contrasena"]) ? $json["contrasena"] : "",
            isset($json["fechaIngreso"]) ? $json["fechaIngreso"] : "",
            isset($json["email"]) ? $json["email"] : "",
            isset($json["fotoPerfil"]) ? $json["fotoPerfil"] : "",
            isset($json["esPrivado"]) ? $json["esPrivado"] : ""
        );

        if(isset($json["idUsuario"]))
            $usuario->setIdUsuario((int)$json["idUsuario"]);
        return $usuario;

    }
    public function save($mysqli) {
        //$sql = "EXEC InsertarUsuario @p_userName = ?, @p_contraseña = ?, @p_fechaIngreso = ?,  @p_email = ?, @p_fotoPerfil = ?, @p_esPrivado = ?";
        $sql = 'CALL InsertarUsuario(?, ?, ?)';
        /*
        $stmt= $mysqli->prepare($sql);
        $stmt->bind_param("sssss", $this->names, $this->lastnames, $this->username, $this->email,$this->password);
        $stmt->execute();
        $this->id = (int)$stmt->insert_id;
        */
        $stmt= $mysqli->prepare($sql);
        $stmt->bind_param("sss", $this->userName, $this->contrasena, $this->email);
        $isSucces = $stmt->execute();
        print_r((int)$stmt->insert_id);
        return $isSucces;
        
    }

    /*
    public static function findUserByUsername($mysqli, $username, $password) {
        $sql = "SELECT id, names, lastnames, username, email FROM users WHERE  username = ? AND password = ? LIMIT 1";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("ss",$username, $password);
        $stmt->execute();
        $result = $stmt->get_result(); 
        $user = $result->fetch_assoc();
        return $user ? User::parseJson($user) : NULL;
    }
    public static function findUserById($mysqli, $id) {
        $sql = "SELECT id, names, lastnames, username, email FROM users WHERE  id = ? LIMIT 1";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("i",$id);
        $stmt->execute();
        $result = $stmt->get_result(); 
        $user = $result->fetch_assoc();
        return $user ? User::parseJson($user) : NULL;
    }
    */
    public function toJSON() {
        return get_object_vars($this);
    }
}