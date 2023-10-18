<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    require_once "./conexion/conexion.php";
    require_once "../models/Usuario.php";
    require_once "../models/Persona.php";

    // Leer el JSON de la solicitud
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    // Configurar la cabecera para responder con JSON
    header('Content-Type: application/json');

    // Crear una instancia de la clase de conexión
    $conexion = new Conexion;
    $mysqli = $conexion->conexion;

    // Capturar los valores del formulario
    $nombre = $data['Nombre'];
    $apellidoPat = $data['ApPaterno'];
    $apellidoMat = $data['ApMaterno'];
    $email = $data['email'];
    $telefono = $data['Telefono'];
    $fechaNac = $data['FechaNac'];
    $sexo = $data['Genero'];

    $username = $data['Username'];
    $password = $data['Contraseña'];

    // Establecer los valores para las otras columnas que no son idPersona en la clase Usuario
    $fotoPerfil = null;  // Aquí debes establecer el valor adecuado
    $esPrivado = 1;  // O 1 si es privado
    $esActivo = 1;   // O 0 si no es activo

    // Crear una instancia de la clase Usuario
    $newUser = new Usuario($username, $password, $email, null, null, $fotoPerfil, $esPrivado, $esActivo);
    // Crear una instancia de la clase Persona
    $newPersona = new Persona($nombre, $apellidoPat, $apellidoMat, $fechaNac, $sexo, $telefono);

    $json_response = ["success" => true];


    try{
        $idNewPersona = $newPersona->save($mysqli);
        $newUser->setIdPersona($idNewPersona);
        //print_r($newUser->toJSON());
        $newUser->save($mysqli);

        $json_response = ["success" => true, "msg" => "Registro exitoso"];
        //$json_response["redirect"] = "../views/inicioses.php";
        //echo json_encode($json_response);
        //include["../views/inicioses.php"];

    }   catch (Exception $e) {
        $json_response["success"] = false;
        $json_response["msg"] = "Algo salió mal con el registro";
        
    } 

    /*
    if ($newUser->save($mysqli) && $newPersona->save($mysqli)) {
        $json_response["success"] = true;
        $json_response["msg"] = "Registro exitoso";
        $json_response["redirect"] = "../views/inicioses.php";
        echo json_encode($json_response);
    } else {
        $json_response["success"] = false;
        $json_response["msg"] = "Algo salió mal con el registro";
        echo json_encode($json_response);
    }
    */
    

    // Finalizar el script
    echo json_encode($json_response);
    exit;
}
?>
