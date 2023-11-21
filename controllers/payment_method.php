<?php
namespace Controllers;


require_once __DIR__."/conexion/conexion.php";
require_once __DIR__."/../models/Usuario.php";
require_once __DIR__."/../models/Persona.php";

use \Conexion\Conexion as Conexion;
use \Models\Usuario as Usuario;
use \Models\Persona as Persona;


class Payment{


    public static function verPayment(){
        include './views/checkout.php';
    }

}

?>