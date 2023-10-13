<?php
if($_SERVER['REQUEST_METHOD'] == 'POST') {
    require_once "./conexion/conexion.php";
    require_once "../models/Usuario.php";

    //Obtener Json
    $json = json_decode(file_get_contents('php://input'),true);
    print_r($json);
    
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
    $conexion = new Conexion;
    $mysqli = $conexion->conexion;
    $user = Usuario::findUserByUsername($mysqli,$json["username"],$json["password"]);
    $json_response = ["success" => true];
    if($user) {
        $json_response["msg" ]= "Bienvenido";
        $json_response ["user"] = $user->toJSON();
        //Iniicamos la sesion
        session_start();
        //Guardamos el ID del usuario en la sesion
        $_SESSION["AUTH"] = (string)$user->getId();
        echo json_encode($json_response);
        exit;
    } else {
        $json_response["success"]  = false;
        $json_response["msg"] = "El usuario o la contraseña no son correctos";
        echo json_encode($json_response);
        exit;
    } 
   
}