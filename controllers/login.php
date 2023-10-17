<?php
if($_SERVER['REQUEST_METHOD'] == 'POST') {
    require_once "./conexion/conexion.php";
    require_once "../models/Usuario.php";

    //Obtener Json
    $json = json_decode(file_get_contents('php://input'),true);
    //print_r(json_encode($json));
    $conexion = new Conexion;
    $mysqli = $conexion->conexion;

    $idUsr = Usuario::validateCredendtials($mysqli, $json['userName'], $json['contrasena']);
    //print_r($idUsr);
    
    //Sanitizar JSON
    // $filters = [
    //     'username' => FILTER_SANITIZE_STRING,
    //     'password' => FILTER_SANITIZE_STRING
    // ];
    // $options = [
    //     'username' =>  [ 'flags' => FILTER_NULL_ON_FAILURE ],
    //     'password' =>  [ 'flags' => FILTER_NULL_ON_FAILURE ],
    // ];
    // $json_safe = [];
    // foreach($json as $key=>$value) {
    //     $json_safe[$key] = filter_var($value, $filters[$key], $options[$key]);
    // }

    header('Content-Type: application/json');
    $json_response = ["success" => true];

    if($idUsr > 0) {
        $user = Usuario::findUserById($mysqli, $idUsr);
        //print_r(($user));
        $json_response["msg"]= "Bienvenido";
        $json_response ["user"] = $user->toJSON();
        
        //Inicamos la sesion
        session_start();
        
        //Guardamos el ID del usuario en la sesion
        $_SESSION["AUTH"] = (string)$user->getIdUsuario();
        echo json_encode($json_response);
        exit;

    } else {
        $json_response["success"]  = false;
        $json_response["msg"] = "Las credenciales no son validas";
        echo json_encode($json_response);
        exit;
    }
    
   
}
?>