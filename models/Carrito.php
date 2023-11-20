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
        $sql = "CALL sp_InsertarCarritoCompra(?,?, @idCarritoCompra)";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("ii", $this->cantidad, $this->idComprador);
        $stmt->execute();
        $stmt->close();

        // Obtener el idCarritoCompra resultante del procedimiento almacenado
        $result = $mysqli->query("SELECT @idCarritoCompra as idCarritoCompra");
        $row = $result->fetch_assoc();
        $this->idCarritoCompra = $row['idCarritoCompra'];
    }

    public function saveCardProd($mysqli){
        // Asegúrate de que el carrito tenga un idCarritoCompra válido
        if (!$this->idCarritoCompra) {
            // Manejar el caso en el que no haya un idCarritoCompra válido
            return;
        }

        $sql = "CALL sp_InsertarCarritoProducto(?,?)";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("ii", $this->idCarritoCompra, $this->idProducto);
        $stmt->execute();
        $stmt->close();
    }


    public function getProductosEnCarrito($mysqli){
    // Asegúrate de tener un idComprador válido
    if (!$this->idComprador) {
        // Manejar el caso en el que no haya un idComprador válido
        return [];
    }

    $productosEnCarrito = [];

    // Consulta SQL para obtener los productos en el carrito de un usuario
    $sql = "SELECT p.idProducto, p.Nombre, p.Precio, cc.Cantidad
            FROM productos p
            JOIN carrito_producto cp ON p.idProducto = cp.idProducto
            JOIN carritocompras cc ON cp.idCarritoCompra = cc.idCarritoCompra
            WHERE cc.idComprador = ?";

    $stmt = $mysqli->prepare($sql);
    if (!$stmt) {
        die('Error en la consulta preparada: ' . $mysqli->error);
    }
    $stmt->bind_param("i", $this->idComprador);
    $stmt->execute();

    $result = $stmt->get_result();

    // Obtener los productos y cantidades en el carrito
    while ($row = $result->fetch_assoc()) {
        $productosEnCarrito[] = [
            'idProducto' => $row['idProducto'],
            'nombre' => $row['Nombre'],
            'precio' => $row['Precio'],
            'cantidad' => $row['Cantidad']
        ];
    }

    $stmt->close();

    return $productosEnCarrito;
    }

}




?>