<?php

require_once __DIR__.'/router.php';
require_once __DIR__.'/controllers/home.php';
require_once __DIR__.'/controllers/signup.php';
require_once __DIR__.'/controllers/login.php';
require_once __DIR__.'/controllers/profile.php';
require_once __DIR__ .'/controllers/product.php';

use \Controllers\Home as Home;
use \Controllers\SignUp as SignUp;
use \Controllers\Login as Login;
use \Controllers\Profile as Profile;
use \Controllers\Product as Product;

// ##################################################
// ##################################################
// ##################################################

// Home
get('/', function () {
    Home::verIndex();
});    

// Signup
get('/signup', function (){
    SignUp::verSignup();
});
post('/signup', function (){
    SignUp::recibirSignup();
});

// Login
get('/login', function (){
    Login::verLogin();
});
post('/login', function (){
    Login::recibirLogin();
});

// Profile
get('/profile', function () {
    Profile::verProfile();
});

post('/profile/verProductos', function(){

    Profile::verProductosPerfil();
});

post('/profile/upgradeVendedor', function () {
    //echo 'post upgradeVendedor';
    Profile::upgradeVendedor();
});

//Product
get('/newProduct', function(){

    Product::verNewProduct();
});


// For GET or POST
// The 404.php which is inside the views folder will be called
// The 404.php has access to $_GET and $_POST
//any('/404','views/404.php');