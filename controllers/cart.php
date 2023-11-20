<?php 

namespace Controllers;

require_once __DIR__."/../models/Producto.php";
require_once __DIR__."/../models/Comprador.php";
require_once __DIR__."/../models/Carrito.php";
require_once __DIR__."/conexion/conexion.php";



use \Models\Producto as Producto;
use \Models\Carrito as Carrito;
use \Models\Conexion as Conexion;
use \Models\Comprador as Comprador;


class Cart{


    public static function verCart(){
        /*
        session_start();
        if($_SESSION["idComprador"] ==-1){
            include '.views/inicioses.php';
        } else {

            include '.views/cart.php';
        }
        */
        include 'views/cart.php';
    }

}


?>