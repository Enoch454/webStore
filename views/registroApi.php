<?php
require 'C:\xampp\htdocs\controllers\conexion\conexion.php';
require 'C:\xampp\htdocs\models\Usuario.php';

// Establecer la conexión a la base de datos
$db = new Conexion();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['Username'];
    $password = $_POST['Contraseña'];
    $email = $_POST['email'];

    // Crear una instancia de la clase Usuario
    $usuario = new Usuario($username, $password, $email);

    // Insertar el usuario en la base de datos
    if ($usuario->save($db->conexion)) {
        // Registro exitoso, redirigir a account.php
        header("Location: inicioses.php");
        exit; // Asegúrate de salir del script después de la redirección
    } else {
        // Error en el registro
        echo json_encode(["message" => "Error en el registro"]);
    }
} else {
    // Si la solicitud no es POST, devolver un mensaje de error
    echo json_encode(["message" => "Método no permitido"]);
}
?>


