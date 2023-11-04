<?php
namespace Conexion;
class Conexion {
    private $server;
    private $user;
    private $password;
    private $database;
    private $port;
    public $conexion;

    function __construct(){
        $listaDatos = $this -> datosConxion()['conexion'];
        foreach($listaDatos as $key => $value){
            $this->$key = $value;
        }

        $this->conexion = new \mysqli($this->server,
            $this->user,
            $this->password,
            $this->database,
            $this->port);
        /*
        if($this->conexion->connect_errno){
            echo 'Falla en la conexion BD';
        }else{
            echo 'Conexion correcta a BD';
        }
        */
    }

    private function datosConxion(){
        $direccion = dirname(__FILE__);
        $jsondata = file_get_contents($direccion."/"."config");
        return json_decode($jsondata, true);
    }

    private function convertirUTF8($array){
        array_walk_recursive($array,
            function(&$item, $key){
                if(!mb_detect_encoding($item, 'utf-8', true)){
                    $item = utf8_encode($item);
                }
            }
        );
        return $array;
    }

    // para select
    public function obtenerDatos($sqlString){
        $results = $this->conexion->query($sqlString);
        $resultArray = array();
        foreach($results as $key) {
            $resultArray[] = $key;
        }
        return $this -> convertirUTF8($resultArray);

    }

    // para update, delete
    public function nonQuery($sqlString){
        $results = $this->conexion->query($sqlString);
        return $this->conexion->affected_rows;
    }

    // para inserts
    public function nonQueryId($sqlString){
        $results = $this->conexion->query($sqlString);
        $filas = $this->conexion->affected_rows;
        if($filas >= 1){
            return $this->conexion->insert_id;
        }else{
            return 0;
        }
    }

    protected function encriptar($string){
        return md5($string);
    }

}

?>