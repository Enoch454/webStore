<?php
namespace Controllers;

require_once __DIR__."/conexion/conexion.php";
require_once __DIR__."/../models/Usuario.php";

use \Conexion\Conexion as Conexion;
use \Models\Usuario as Usuario;

class Profile {
    public static function verProfile() {
        // Manejar aquí las solicitudes GET, si es necesario
        include './views/account.php';
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

    public static function upgradeVendedor(){
        $response = array();
        $response["success"] = true;
        echo json_encode($response);
    }

}
/*
// Comprueba si se está utilizando el método POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
}
*/
?>

