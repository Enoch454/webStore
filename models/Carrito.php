<?php 
namespace Models;

class Carrito {

    private $idCarritoCompra;
    private $cantidad;
    private $idComprador;

    //Carrito_Producto
    private $idCarProd;
    private $idProducto;

    
    public function getIdCarritoCompra() {
        return $this->idCarritoCompra;
    }

    
    public function setIdCarritoCompra($idCarritoCompra) {
        $this->idCarritoCompra = $idCarritoCompra;
    }

    
    public function getCantidad() {
        return $this->cantidad;
    }

    
    public function setCantidad($cantidad) {
        $this->cantidad = $cantidad;
    }

    
    public function getIdComprador() {
        return $this->idComprador;
    }

    
    public function setIdComprador($idComprador) {
        $this->idComprador = $idComprador;
    }

    public function getIdCarProd() {
        return $this->idCarProd;
    }

    public function setIdCarProd($idCarProd) {
        $this->idCarProd = $idCarProd;
    }

    public function getIdProducto() {
        return $this->idProducto;
    }

    public function setIdProducto($idProducto) {
        $this->idProducto = $idProducto;
    }

    public function __construct($cantidad, $idComprador, $idCarProd, $idProducto){
        $this->cantidad = $cantidad;
        $this->idComprador = $idComprador;
        $this->idCarProd = $idCarProd;
        $this->idProducto = $idProducto;
    }


    public function saveCart($mysqli){

        $sql = "CALL sp_InsertarCarritoCompra(?,?)";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("ii", $this->cantidad, $this->idComprador);
        $stmt->execute();
        $stmt->close();

    }

    public function saveCardProd($mysqli){
        $sql = "sp_InsertarCarritoProducto(?,?)";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("ii", $this->idCarritoCompra, $this->idProducto);
        $stmt->execute();
        $stmt->close();

    }

}




?>