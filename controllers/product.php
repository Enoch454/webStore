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
        $status = 2; //1 -> aprovado, 2 -> espera, 3 -> rechazado
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

    public static function verProductoDetalle($productoId): void{
        include './views/single-product.php';

    }

    public static function getDataProducto($id): void{
        
        if(isset($_GET['id'])){
            $idProd = $_GET['id'];

            //Crea una instancia de clase Conexion y obtiene la conexion
            $conexion = new Conexion;
            $mysqli = $conexion->conexion;

            //Llama a la funcion findProductById para obtener el producto
            $singleProduct = Producto::findProductById($mysqli, $idProd);

            //Verifica si se encontró el producto
            if($singleProduct){
                header('Content-Type: application/json');
                echo json_encode($singleProduct->toJSON());

            } else {
                http_response_code(404);
                echo json_encode(['error' => 'Producto no encontrado']);

            }
        } else {
            http_response_code(400);
            echo json_encode(['error' => 'ID de Producto no proporcionado']);

        }

    }

    public static function queryProduct($idProducto){
        $conexion = new Conexion;
        $mysqli = $conexion->conexion;
        echo json_encode(Producto::findProductById($mysqli, $idProducto)->toJSON());
    }
}
?>