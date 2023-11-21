<?php
namespace Controllers;


require_once __DIR__."/conexion/conexion.php";
require_once __DIR__."/../models/Usuario.php";
require_once __DIR__."/../models/Persona.php";
require_once __DIR__."/../models/Carrito.php";

use \Conexion\Conexion as Conexion;
use \Models\Usuario as Usuario;
use \Models\Persona as Persona;
use \Models\Carrito as Carrito;


class Payment{


    public static function verPayment():void{
        session_start();
        $conexion = new Conexion;
        $mysqli = $conexion->conexion;
        // deberia de consultar el total desde 
        // la consulta de carrito en la bd
        $idComprador = $_SESSION['idComprador']; // Obtener el idComprador de la sesión
        $carrito = new Carrito(null, $idComprador, null, null);
        $productosEnCarrito = $carrito->getProductosEnCarrito($mysqli);

        $montoTotal = 0;

        foreach ($productosEnCarrito as $producto) {
            $montoTotal += $producto['cantidad'] * $producto['precio'];
        }

        $_SESSION['TotalCheckOut'] = $montoTotal;
        include './views/checkout.php';
        
            

    }

}

?>