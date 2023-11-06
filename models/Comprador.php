<?php
namespace Models;

class Comprador {
    private $idComprador;
    private $idUsuario;
    public function getIdComprador(){
        return $this->idComprador;
    }
    public function setIdComprador($idComprador){
        $this->idComprador = $idComprador;
    }
    public function getIdUsuario() {
        return $this->idUsuario;
    }
    public function setIdUsuario($id) {
        $this->idUsuario = $id;
    }
    public function __construct($idUsuario){
        $this->idUsuario = $idUsuario;
    }
    public function save($mysqli){
        $sql = "CALL sp_InsertarComprador(?)";
        $stmt = $mysqli->prepare( $sql );
        $stmt->bind_param("i",
            $this->idUsuario);
        $stmt->execute();
        $stmt->close();
    }

}