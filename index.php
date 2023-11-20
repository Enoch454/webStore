<?php

require_once __DIR__.'/router.php';
require_once __DIR__.'/controllers/home.php';
require_once __DIR__.'/controllers/signup.php';
require_once __DIR__.'/controllers/login.php';
require_once __DIR__.'/controllers/profile.php';
require_once __DIR__ .'/controllers/product.php';
require_once __DIR__ .'/controllers/shop.php';
require_once __DIR__ .'/controllers/cart.php';

use \Controllers\Home as Home;
use \Controllers\SignUp as SignUp;
use \Controllers\Login as Login;
use \Controllers\Profile as Profile;
use \Controllers\Product as Product;
use \Controllers\Shop as Shop;
use \Controllers\Cart as Cart;

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

// Logout
get('/logout', function (){
    Login::logout();
});

// Profile
get('/profile', function () {
    Profile::verProfile();
});


post('/profile/upgradeVendedor', function () {
    //echo 'post upgradeVendedor';
    Profile::upgradeVendedor();
});

//Product
get('/newProduct', function(){

    Product::verNewProduct();
});
post('/product', function (){
    Product::recibirNewProduct();
});

//Single product
get('/products/$id', function($productoId){
    Product::queryProduct($productoId);
});

get('/products/ver/$id', function ($productoId){
    //echo $productoId;
    Product::verProductoDetalle($productoId);
});

//Profile lista productos
get('/products', function(){

    Profile::verProductosPerfil();
});


//Profile admin
get('/productsWait', function(){
    Profile::productosEsperaAdmin();
});

get('/productsApprove', function(){
    Profile::productosAprobadosAdmin();
});

get('/productsReject', function(){

    Profile::productosRechazadosAdmin();
});

get('/sellersWait', function(){
    
    Profile::vendedoresEsperaAdmin();
});

get('/sellersApprove', function(){
    Profile::vendedoresAprobadosAdmin();
});

get('/sellersReject', function(){
    Profile::vendedoresRechazadosAdmin();
});

//Profile admin aprobar/rechazar Productos y/o Vendedores
post('/profile/statusChange', function (){
    Profile::updateStatusProducto();
});

post('/profile/statusChangeSeller', function(){

    Profile::updateStatusVendedor();

});

//Shop-Tienda general
get('/shop', function (){
    Shop::verShop();
});

get('/allShop', function(){

    Shop::allProducts();

});

//Carrito de Compras
get('/cart', function(){

    Cart::verCart();
    
});


// For GET or POST
// The 404.php which is inside the views folder will be called
// The 404.php has access to $_GET and $_POST
//any('/404','views/404.php');