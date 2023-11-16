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

class Profile {

    
    public static function verProfile() {
        session_start();
        //echo 'session auth: '.$_SESSION["AUTH"];
        //echo "<br>";
        //echo 'session idAdmin: '.$_SESSION["idAdmin"];
        if ($_SESSION["idAdmin"] == -1){
            include './views/account.php';
        } else {
            include './views/postadmin.php';
        }
    }

    public static function verProductosPerfil(){
        session_start();
        if (isset($_SESSION["AUTH"]) && isset($_SESSION["idVendedor"])) {
            $idVendedor = $_SESSION["idVendedor"];
            $conexion = new Conexion;
            $mysqli = $conexion->conexion;
            $productos = Producto::getProductosByVendedor($mysqli, $idVendedor);
            $productosJson = [];
            foreach ($productos as $producto) {
                //echo json_encode($producto->toJSON());
                if($producto->getStatus() == 1){
                    $productosJson[] = ($producto->toJSON());
                }
            }
            header('Content-Type: application/json');
            $response = array();
            $response['succes'] = true;
            $response['data'] = ($productosJson); 
            echo json_encode($response);
            //var_dump($productos);
            
        } else {
            $response['succes'] = false;
            $response['error'] = 'Error ver productos';
            echo json_encode( $response );
        }
        
    }

    public static function getDataProfile($id) {
        // Verifica si se ha recibido el ID de usuario
        if (isset($_SESSION['AUTH'])) {
            $idUsr = $_SESSION['AUTH'];

            // Crea una instancia de la clase Conexion y obtén la conexión
            $conexion = new Conexion;
            $mysqli = $conexion->conexion;

            // Llama a la función estática findUserById para obtener el usuario
            $user = Usuario::findUserById($mysqli, $idUsr);

            // Verifica si se encontró un usuario
            if ($user) {
                // Prepara la respuesta en formato JSON
                header('Content-Type: application/json');
                echo json_encode($user->toJSON());
            } else {
            // Usuario no encontrado
                http_response_code(404);
                echo json_encode(['error' => 'Usuario no encontrado']);
        }
        } else {
            // No se proporcionó el ID del usuario en la sesión
            http_response_code(400);
            echo json_encode(['error' => 'ID de usuario no proporcionado']);
        }
    }

    // funcion para actualizar el rol de usuario a vendedor.
    // Haciendo uso de las funciones de la clase Vendedor,
    // se crea un nuevo vendedor en la base de datos y se
    // actualiza el valor de $__SESSION['idVendedor] con el
    // id del vendedor creado 
    public static function upgradeVendedor() {
        session_start();
        // Verifica si se ha recibido el ID de usuario
        if (isset($_SESSION['AUTH'])) {
            $idUsr = $_SESSION['AUTH'];

            // Crea una instancia de la clase Conexion y obtén la conexión
            $conexion = new Conexion;
            $mysqli = $conexion->conexion;

            // Llama a la función estática createVendedor para crear un nuevo vendedor
            // en la base de datos
            Vendedor::createVendedor($mysqli, $idUsr);

            // Llama a la función estática findVendedorByIdUsuario para obtener el id del
            // vendedor creado
            $vendedor = Vendedor::findVendedorByIdUsuario($mysqli, $idUsr);

            // Verifica si se encontró un vendedor
            if ($vendedor) {
                // Prepara la respuesta en formato JSON
                header('Content-Type: application/json');
                $_SESSION['idVendedor'] = $vendedor->getIdVendedor();
                $_SESSION['vendedorStatus'] = "2";
                $json_response = ["success" => true];
                $json_response["msg"]= "Vendedor creado";
                $json_response ["idVendedor"] = $vendedor->getIdVendedor();
                echo json_encode($json_response);
            } else {
            // Vendedor no encontrado
                http_response_code(404);
                $json_response = ["success" => false];
                $json_response["msg"]= "Vendedor no encontrado";
                echo json_encode($json_response);
        }
        } else {
            // No se proporcionó el ID del usuario en la sesión
            http_response_code(400);
            $json_response = ["success" => false];
            $json_response["msg"]= "ID de usuario no proporcionado";
            echo json_encode($json_response);
        }
        
    }        

}
/*
// Comprueba si se está utilizando el método POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
}
*/
?>

