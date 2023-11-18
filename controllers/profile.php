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

    public static function productosEsperaAdmin(){
        session_start();
        if (isset($_SESSION["AUTH"]) && isset($_SESSION["idAdmin"])) {
            
            $conexion = new Conexion;
            $mysqli = $conexion->conexion;
            $productos = Producto::getProductosEspera($mysqli);

            header('Content-Type: application/json');
            $response = array();
            $response['succes'] = true;
            $response['data'] = ($productos);
            //$response['data']['usuarios'] = ($userJson); 
            echo json_encode($response);
            //var_dump($productos);
            
        } else {
            $response['succes'] = false;
            $response['error'] = 'Error ver productos';
            echo json_encode( $response );
        }

    }

    public static function productosAprobadosAdmin(){
        session_start();
        if (isset($_SESSION["AUTH"]) && isset($_SESSION["idAdmin"])) {
            
            $conexion = new Conexion;
            $mysqli = $conexion->conexion;
            $productosAprob = Producto::getProductosAprobados($mysqli);

            header('Content-Type: application/json');
            $response = array();
            $response['succes'] = true;
            $response['dataAprob'] = ($productosAprob);
            //$response['data']['usuarios'] = ($userJson); 
            echo json_encode($response);
            //var_dump($productos);
            
        } else {
            $response['succes'] = false;
            $response['error'] = 'Error ver productos';
            echo json_encode( $response );
        }

    }

    public static function productosRechazadosAdmin(){
        session_start();
        if (isset($_SESSION["AUTH"]) && isset($_SESSION["idAdmin"])) {
            
            $conexion = new Conexion;
            $mysqli = $conexion->conexion;
            $productosRecha = Producto::getProductosRechazados($mysqli);

            header('Content-Type: application/json');
            $response = array();
            $response['succes'] = true;
            $response['dataRecha'] = ($productosRecha);
            //$response['data']['usuarios'] = ($userJson); 
            echo json_encode($response);
            //var_dump($productos);
            
        } else {
            $response['succes'] = false;
            $response['error'] = 'Error ver productos';
            echo json_encode( $response );
        }
    }

    public static function vendedoresEsperaAdmin(){
        session_start();
        if (isset($_SESSION["AUTH"]) && isset($_SESSION["idAdmin"])) {
            
            $conexion = new Conexion;
            $mysqli = $conexion->conexion;
            $vendedores = Vendedor::getVendedoresEspera($mysqli);

            header('Content-Type: application/json');
            $response = array();
            $response['succes'] = true;
            $response['dataEspera_Ven'] = ($vendedores);
            //$response['data']['usuarios'] = ($userJson); 
            echo json_encode($response);
            //var_dump($productos);
            
        } else {
            $response['succes'] = false;
            $response['error'] = 'Error ver productos';
            echo json_encode( $response );
        }

    }

    public static function vendedoresAprobadosAdmin(){
        session_start();
        if (isset($_SESSION["AUTH"]) && isset($_SESSION["idAdmin"])) {
            
            $conexion = new Conexion;
            $mysqli = $conexion->conexion;
            $vendedoresAprob = Vendedor::getVendedoresAprobados($mysqli);

            header('Content-Type: application/json');
            $response = array();
            $response['succes'] = true;
            $response['dataAprob_Ven'] = ($vendedoresAprob);
            //$response['data']['usuarios'] = ($userJson); 
            echo json_encode($response);
            //var_dump($productos);
            
        } else {
            $response['succes'] = false;
            $response['error'] = 'Error ver productos';
            echo json_encode( $response );
        }

    }

    public static function vendedoresRechazadosAdmin(){
        session_start();
        if (isset($_SESSION["AUTH"]) && isset($_SESSION["idAdmin"])) {
            
            $conexion = new Conexion;
            $mysqli = $conexion->conexion;
            $vendedoresRecha = Vendedor::getVendedoresRechazados($mysqli);

            header('Content-Type: application/json');
            $response = array();
            $response['succes'] = true;
            $response['dataRecha_Ven'] = ($vendedoresRecha);
            //$response['data']['usuarios'] = ($userJson); 
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

    public static function updateStatusProducto() {
        $json_data = json_decode(file_get_contents('php://input'), true);

        if (isset($json_data["idProducto"]) && isset($json_data["status"])) {
            $conexion = new Conexion;
            $mysqli = $conexion->conexion;

            $idProducto = $json_data["idProducto"];
            $status = $json_data["status"];
    
            // Llama al método para actualizar el estado del producto
            $result = Producto::actualizarStatusProducto($mysqli, $idProducto, $status);
            
            // Maneja el resultado y prepara la respuesta en formato JSON
            $response = json_decode($result, true); // Decodifica la cadena JSON en un array asociativo
    
            if ($response["success"]) {
                // Producto actualizado correctamente
                echo json_encode($response);
            } else {
                // Error al actualizar el producto
                http_response_code(500); // O el código de estado apropiado
                echo json_encode($response);
            }
        } else {
            // No se proporcionaron los parámetros esperados
            http_response_code(400);
            $json_response = ["success" => false, "message" => "Parámetros incorrectos"];
            echo json_encode($json_response);
        }
    }


    public static function updateStatusVendedor() {
        $json_data = json_decode(file_get_contents('php://input'), true);

        if (isset($json_data["idVendedor"]) && isset($json_data["status"])) {
            $conexion = new Conexion;
            $mysqli = $conexion->conexion;

            $idVendedor = $json_data["idVendedor"];
            $status = $json_data["status"];
    
            // Llama al método para actualizar el estado del vendedor
            $result = Vendedor::actualizarStatusVendedor($mysqli, $idVendedor, $status);
            
            // Maneja el resultado y prepara la respuesta en formato JSON
            $response = json_decode($result, true); // Decodifica la cadena JSON en un array asociativo
    
            if ($response["success"]) {
                // Vendedor actualizado correctamente
                echo json_encode($response);
            } else {
                // Error al actualizar el vendedor
                http_response_code(500); // O el código de estado apropiado
                echo json_encode($response);
            }
        } else {
            // No se proporcionaron los parámetros esperados
            http_response_code(400);
            $json_response = ["success" => false, "message" => "Parámetros incorrectos"];
            echo json_encode($json_response);
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

