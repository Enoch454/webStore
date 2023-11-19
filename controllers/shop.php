<?php
namespace Controllers;

require_once __DIR__."/conexion/conexion.php";
require_once __DIR__."/../models/Usuario.php";
require_once __DIR__."/../models/Vendedor.php";
require_once __DIR__."/../models/Producto.php";


use \Conexion\Conexion as Conexion;
use \Models\Usuario as Usuario;
use \Models\Vendedor as Vendedor;
use \Models\Producto as Producto;

class Shop {


    public static function verShop(){
            include './views/shop.php';
    }


    public static function allProducts(){
            $conexion = new Conexion;
            $mysqli = $conexion->conexion;
            $productosAprob = Producto::getProductosAprobados($mysqli);

            header('Content-Type: application/json');
            $response = array();
            $response['success'] = true;
            $response['dataAllProd'] = ($productosAprob);
            //$response['data']['usuarios'] = ($userJson); 
            echo json_encode($response);
            //var_dump($productos);
     
    }


}





?>