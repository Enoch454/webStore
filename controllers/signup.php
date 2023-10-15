<?php
if($_SERVER['REQUEST_METHOD'] == 'POST') {
    require_once "./conexion/conexion.php";
    require_once "../models/Usuario.php";

    $json = file_get_contents('php://input');
    $json = json_decode($json,true);
    print_r($json);

    header('Content-Type: application/json');
    $conexion = new Conexion;
    $mysqli = $conexion->conexion;
    $newUser = new Usuario($json['userName'], $json['contrasena'], $json['email']);
    $json_response = ["success" => true];
    if($newUser->save($mysqli)){
        $json_response["msg" ]= "Registro exitoso";
        echo json_encode($json_response);
        exit;
    } else {
        $json_response["success"]  = false;
        $json_response["msg"] = "Algo salio mal con el registro";
        echo json_encode($json_response);
        exit;
    } 

    
} 
?>