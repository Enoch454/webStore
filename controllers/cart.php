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

        // Configurar la cabecera para responder con JSON
        header('Content-Type: application/json');

        $conexion = new Conexion;
        $mysqli = $conexion->conexion;

        $cantidad = $data['cantidad'];
        $idProducto = $data['idProducto'];
        $idComprador = $_SESSION['idComprador']; // Obtener el idComprador de la sesión

        try {
            if (isset($cantidad, $idComprador, $idProducto)) {
                // Crear una instancia de la clase Carrito
                $carrito = new Carrito($cantidad, $idComprador, null, $idProducto);

                // Llamar al método que agrega el producto al carrito
                $result = $carrito->agregarProductoAlCarrito($mysqli);

                // Responder con el resultado
                echo json_encode($result);
                exit;
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


    public static function contenidoCart() {
        session_start(); // Iniciar la sesión si no está iniciada
    
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {
            $conexion = new Conexion;
            $mysqli = $conexion->conexion;
    
            try {
                $idComprador = $_SESSION['idComprador']; // Obtener el idComprador de la sesión
    
                if (isset($idComprador)) {
                    $carrito = new Carrito(null, $idComprador, null, null);
                    $productosEnCarrito = $carrito->getProductosEnCarrito($mysqli);
    
                    // Verificar si hay productos en el carrito
                    if (empty($productosEnCarrito)) {
                        http_response_code(204); // Código de estado para "Sin contenido"
                        echo json_encode(array("message" => "No hay productos en el carrito"));
                        exit;
                    }
    
                    // Finalizar el script
                    $json_response = ["success" => true, "productosEnCarrito" => $productosEnCarrito];
                    echo json_encode($json_response);
                    exit;
                } else {
                    // Responder con un mensaje de error si el idComprador no está seteado
                    http_response_code(400); // Código de estado para "Solicitud incorrecta"
                    echo json_encode(array("message" => "ID de comprador no válido"));
                }
            } catch (\Exception $e) {
                http_response_code(500); // Código de estado para "Error interno del servidor"
                echo json_encode(array("message" => "Error interno del servidor"));
                echo $e->getMessage();  // También puedes imprimir detalles del error para depuración
                echo json_encode(array("success" => false, "details" => "Error inesperado en el servidor"));
            }
        } else {
            // Responder con un mensaje de error si la solicitud no es de tipo GET
            http_response_code(405); // Código de estado para "Método no permitido"
            echo json_encode(array("message" => "Método no permitido"));
        }
    }
    

}


?>