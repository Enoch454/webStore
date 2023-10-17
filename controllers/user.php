<?php
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
?>