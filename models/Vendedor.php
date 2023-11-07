<?php
namespace Models;

class Vendedor {
    private $idVendedor;
    private $idUsuario;

    public function getIdVendedor() {
        return $this->idVendedor;
    }
    public function setIdVendedor($id) {
        $this->idVendedor = $id;
    }
    public function getIdUsuario() {
        return $this->idUsuario;
    }
    public function setIdUsuario($id) {
        $this->idUsuario = $id;
    }
    public function toJSON() {
        return json_encode([
            'idVendedor' => $this->getIdVendedor(),
            'idUsuario' => $this->getIdUsuario()
        ]);
    }
    public function __construct($idVendedor, $idUsuario) {
        $this->idVendedor = $idVendedor;
        $this->idUsuario = $idUsuario;
    }

    // haciendo uso del procedimiento almacenado 'sp_InsertarVendedor'
    // se inserta un nuevo vendedor en la base de datos.
    public static function createVendedor($mysqli, $idUsuario) {
        $sql = "CALL sp_InsertarVendedor(?)";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param('i', $idUsuario);
        $stmt->execute();
    }
    
    // haciendo uso del procedimiento almacenado 'sp_ConsultarIdVendedor'
    // se obtienen el id de vendedor correspondiente a un  id de usuario
    // dado, dicho resultado se retorna como una instancia de esta clase
    public static function findVendedorByIdUsuario($mysqli, $idUsuario) {
        $sql = "CALL sp_ConsultarIdVendedor(?);";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("i",$idUsuario);
        $stmt->execute();
        $result = $stmt->get_result(); 
        $row = $result->fetch_assoc();
        $idVendedor = $row['idVendedor'];
        //echo $idVendedor;
        return $idVendedor ? new Vendedor($idVendedor, $idUsuario) : null;
    }
}