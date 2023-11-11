<?php 
namespace Controllers;
require_once __DIR__."/conexion/conexion.php";
require_once __DIR__."/../models/Producto.php";

use Models\Producto as Producto;
use Conexion\Conexion as Conexion;

class Product{

    public static function verNewProduct(): void{
        include './views/registrarProducto.php';
    }

    public static function recibirNewProduct(): void{
        session_start();
        if(isset($_SESSION['AUTH'])){
            // Leer el JSON de la solicitud
        $json = file_get_contents('php://input');
        $data = json_decode($json, true);
        // Configurar la cabecera para responder con JSON
        header('Content-Type: application/json');

        // Crear una instancia de la clase de conexión
        $conexion = new Conexion;
        $mysqli = $conexion->conexion;

        //Capturar los valores del forms de Producto
        $nombre = $data['Nombre'];
        $descripcion = $data['Descripcion'];
        $cotizable = $data['esCotizable'];
        $precio = $data['Precio'];
        $stock = $data['Stock'];
        $rating = 0; //Rating en nuevo producto será 0, será del 1 al 5
        $status = 1; //0 está Inactivo, 1 Activo
        $idVendedor = $_SESSION['idVendedor'];
        $idAdmin = null;
        

        $newProd = new Producto($nombre, $descripcion, $cotizable, $precio, $stock, $rating, $status, $idVendedor, $idAdmin);
        
        $json_response = ["success" => true];
        
        

        try {
            $newProd->save($mysqli);
            $json_response = ["success" => true, "msg" => "Registro producto exitoso"];

        } catch (\Exception $e) {
            $json_response["success"] = false;
            $json_response["msg"] = "Algo salió mal con el registro";
            $json_response["details"] = "".$e;
        }

        // Finalizar el script
        echo json_encode($json_response);
        exit;


        } else {
            http_response_code(400);
            $json_response = ["success" => false];
            $json_response["msg"]= "Error en la sesion";
            echo json_encode($json_response);

        }
        


        
        
    }
}
?>