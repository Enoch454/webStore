<?php 

namespace Controllers;

require_once __DIR__."/../models/Producto.php";
require_once __DIR__."/../models/Comprador.php";
require_once __DIR__."/../models/Carrito.php";
require_once __DIR__."/conexion/conexion.php";


use \Conexion\Conexion as Conexion;
use \Models\Producto as Producto;
use \Models\Carrito as Carrito;
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

    public static function recibirArticulo(){
        session_start(); // Iniciar la sesión si no está iniciada
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Decodificar los datos JSON de la solicitud POST
            $json = file_get_contents('php://input');
            $data = json_decode($json, true);
            //var_dump($data);
            // Configurar la cabecera para responder con JSON
            header('Content-Type: application/json');
        
            $conexion = new Conexion;
            $mysqli = $conexion->conexion;

            $cantidad = $data['cantidad'];
            $idProducto =$data['idProducto'];
            $idComprador = $_SESSION['idComprador']; // Obtener el idComprador de la sesión
        
            try {
                
        
                if (isset($cantidad, $idComprador, $idProducto)) {
                    //var_dump($data);
                    //var_dump($idComprador);
                    // Crear una instancia de la clase Carrito
                    $carrito = new Carrito($cantidad, $idComprador, null, $idProducto);
        
                    // Guardar en CarritoCompra
                    $carrito->saveCart($mysqli);
        
                    // Guardar en CarritoProducto
                    $carrito->saveCardProd($mysqli);
        
                    // Responder con un mensaje de éxito
                    $json_response = ["success" => true, "msg" => "Registro producto exitoso"];
                } else {
                    // Responder con un mensaje de error si los datos no son válidos
                    http_response_code(400); // Código de estado para "Solicitud incorrecta"
                    $json_response = ["success" => false, "message" => "Datos incompletos o incorrectos"];
                }
            } catch (\Exception $e) {
                // Responder con un mensaje de error si hay una excepción
                http_response_code(500); // Código de estado para "Error interno del servidor"
                $json_response = ["success" => false, "message" => "Error interno del servidor", "details" => $e->getMessage()];
            }
        
            // Imprimir la respuesta JSON y finalizar el script
            echo json_encode($json_response);
            exit;
        } else {
            // Responder con un mensaje de error si la solicitud no es de tipo POST
            http_response_code(405); // Código de estado para "Método no permitido"
            echo json_encode(["success" => false, "message" => "Método no permitido"]);
            exit;
        }
    }
    

}


?>