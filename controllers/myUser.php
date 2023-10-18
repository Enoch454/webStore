<?php
/*
if($_SERVER['REQUEST_METHOD'] == 'POST') {
    require_once "./conexion/conexion.php";
    require_once "../models/Usuario.php";

    // obtener id de usuario en la sesion
    // recuperar info de ese usuario
    // redireccionar a la vista con dicha info

    
    //solo por pruebas
    $_SESSION["AUTH"] = 0;
    echo 'userId:';
    echo ($_SESSION["AUTH"]);


    //$usuarioSesion = Usuario::findUserById($_SESSION["AUTH"]);
    //echo $usuarioSesion->toJSON();


    //include "../views/account.php";

} else if ($_SERVER['REQUEST_METHOD'] == 'GET'){
    
    include "../views/account.php";

}
*/

// Incluye la clase Usuario y la clase de conexión
//include 'Usuario.php'; // Asegúrate de que el archivo se llame Usuario.php y esté en el mismo directorio
//include 'Conexion.php'; // Asegúrate de que el archivo se llame Conexion.php y esté en el mismo directorio
include "./conexion/conexion.php";
include "../models/Usuario.php";


// Comprueba si se está utilizando el método POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
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
} elseif ($_SERVER['REQUEST_METHOD'] === 'GET') {
    // Manejar aquí las solicitudes GET, si es necesario
    include '../views/account.php';
} else {
    // Método no admitido
    http_response_code(405);
    echo json_encode(['error' => 'Método no admitido']);
}

?>

