<?php
namespace Models;
use Exception;
class Vendedor {
    private $idVendedor;
    private $idUsuario;
    private $status;

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

    // metodos set y get para el atributo status
    public function getStatus() {
        return $this->status;
    }
    public function setStatus($status) {
        $this->status = $status;
    }
    public function toJSON() {
        return json_encode([
            'idVendedor' => $this->getIdVendedor(),
            'idUsuario' => $this->getIdUsuario(),
            'status' => $this->getStatus()
        ]);
    }
    public function __construct($idVendedor, $idUsuario, $status) {
        $this->idVendedor = $idVendedor;
        $this->idUsuario = $idUsuario;
        $this->status = $status;
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
        $idVendedor =-1;
        $status = -1;

        try{

        $sql = "CALL sp_ConsultarIdVendedor(?);";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("i",$idUsuario);
        $stmt->execute();
        $result = $stmt->get_result(); 

        if($result){
            $row = $result->fetch_assoc();
            if($row && isset($row['idVendedor'])){
                $idVendedor = $row['idVendedor'];
                $status = $row['Status'];
            }

        }

        } catch(Exception $e){


        }
        
        return $idVendedor ? new Vendedor($idVendedor, $idUsuario, $status) : null;
    }

    public static function getVendedoresEspera($mysqli){
        $vendedores = [];
        
        $sql = "SELECT * FROM vw_vendedoresEspera_admin";
        $result = $mysqli->query($sql);
    
        if ($result) {
            // Itera sobre los resultados y crea un array asociativo para cada fila
            while ($row = $result->fetch_assoc()) {
                $vendedores[] = $row;
            }
        } else {
            echo "Error al ejecutar la consulta SQL: " . $mysqli->error;
        }
    
        return $vendedores;
    }

    public static function getVendedoresAprobados($mysqli){
        $vendedoresAprob = [];
        
        $sql = "SELECT * FROM vw_vendedoresAprobados_admin";
        $result = $mysqli->query($sql);
    
        if ($result) {
            // Itera sobre los resultados y crea un array asociativo para cada fila
            while ($row = $result->fetch_assoc()) {
                $vendedoresAprob[] = $row;
            }
        } else {
            echo "Error al ejecutar la consulta SQL: " . $mysqli->error;
        }
    
        return $vendedoresAprob;
    }

    public static function getVendedoresRechazados($mysqli){
        $vendedoresRecha = [];
        
        $sql = "SELECT * FROM vw_vendedoresRechazados_admin";
        $result = $mysqli->query($sql);
    
        if ($result) {
            // Itera sobre los resultados y crea un array asociativo para cada fila
            while ($row = $result->fetch_assoc()) {
                $vendedoresRecha[] = $row;
            }
        } else {
            echo "Error al ejecutar la consulta SQL: " . $mysqli->error;
        }
    
        return $vendedoresRecha;

    }
}