<?php
namespace Models;

use Exception;

class Producto {
    private $idProducto;
    private $nombre;
    private $descripcion;
    private $esCotizable;
    private $precio;
    private $stock;
    private $rating;
    private $status;
    private $idVendedor;
    private $idAdmin;

    public function getIdProducto() {
        return $this->idProducto;
    }

    public function setIdProducto($idProducto) {
        $this->idProducto = $idProducto;
    }

    public function getNombre() {
        return $this->nombre;
    }

    public function setNombre($nombre) {
        $this->nombre = $nombre;
    }

    public function getDescripcion() {
        return $this->descripcion;
    }

    public function setDescripcion($descripcion) {
        $this->descripcion = $descripcion;
    }

    public function getEsCotizable() {
        return $this->esCotizable;
    }

    public function setEsCotizable($esCotizable) {
        $this->esCotizable = $esCotizable;
    }

    public function getPrecio() {
        return $this->precio;
    }

    public function setPrecio($precio) {
        $this->precio = $precio;
    }

    public function getStock() {
        return $this->stock;
    }

    public function setStock($stock) {
        $this->stock = $stock;
    }

    public function getRating() {
        return $this->rating;
    }

    public function setRating($rating) {
        $this->rating = $rating;
    }

    public function getStatus() {
        return $this->status;
    }

    public function setStatus($status) {
        $this->status = $status;
    }

    public function getIdVendedor() {
        return $this->idVendedor;
    }

    public function setIdVendedor($idVendedor) {
        $this->idVendedor = $idVendedor;
    }

    public function getIdAdmin() {
        return $this->idAdmin;
    }

    public function setIdAdmin($idAdmin) {
        $this->idAdmin = $idAdmin;
    }

    public function __construct($nombre, $descripcion,
        $esCotizable, $precio,
        $stock, $rating, $status,
        $idVendedor = null, $idAdmin = null) {
        $this->nombre = $nombre;
        $this->descripcion = $descripcion;
        $this->esCotizable = $esCotizable;
        $this->precio = $precio;
        $this->stock = $stock;
        $this->rating = $rating;
        $this->status = $status;
        $this->idVendedor = $idVendedor;
        $this->idAdmin = $idAdmin;
        
    }

    static public function parseJson($json) {
        $producto = new Producto(
            isset($json["Nombre"]) ? $json["Nombre"] : "",
            isset($json["Descripcion"]) ? $json["Descripcion"] : "",
            isset($json["esCotizable"]) ? $json["esCotizable"] : "",
            isset($json["Precio"]) ? $json["Precio"] : "",
            isset($json["Stock"]) ? $json["Stock"] : "",
            isset($json["Rating"]) ? $json["Rating"] : "",
            isset($json["Status"]) ? $json["Status"] : "",
            isset($json["idVendedor"]) ? $json["idVendedor"] : "",
            isset($json["idAdmin"]) ? $json["idAdmin"] : ""
            
        );
        //echo json_encode($json);
        if (isset($json["idProducto"])) {
            $producto->setIdProducto((int)$json["idProducto"]);
        }

        return $producto;
    }
    

    public function save($mysqli) {
        // Define la consulta SQL con el stored procedure
        $sql = 'CALL sp_InsertarProducto(?, ?, ?, ?, ?, ?, ?, ?, ?)';

        // Verifica si la conexión a la base de datos está establecida
        if ($mysqli->connect_error) {
            die("Connection failed: " . $mysqli->connect_error);
        }

        // Prepara la consulta SQL
        $stmt = $mysqli->prepare($sql);

        if ($stmt) {
            // Vincula los parámetros
            $stmt->bind_param("ssididiii",
            $this->nombre,
            $this->descripcion,
            $this->esCotizable,
            $this->precio,
            $this->stock,
            $this->rating,
            $this->status,
            $this->idVendedor,
            $this->idAdmin
        );

            // Ejecuta la consulta
            $isSuccess = $stmt->execute();

            // Cierra la declaración
            $stmt->close();
            if ($isSuccess) {
                return true;
            } else {
                return false;
            }

        } else {
            return false;
        }
    }
    
    public static function findProductById($mysqli, $id) {
        $sql = "CALL ConsultarProducto(?);";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();
        $product = $result->fetch_assoc();
        return $product ? Producto::parseJson($product) : null;
    }
    
    public function toJSON() {
        return get_object_vars($this);
    }

    public static function getProductosByVendedor($mysqli, $idVendedor) {
        $productos = [];

        // Llama al procedimiento almacenado para obtener los productos
        $sql = "CALL sp_getProductosByVendedor(?)";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("i", $idVendedor);
        
        if ($stmt->execute()) {
            $result = $stmt->get_result();
            
            // Itera sobre los resultados y crea objetos Producto
            while ($row = $result->fetch_assoc()) {
                //echo json_encode($row);
                //implode("','",$a1)
                //echo implode (" - ", $row)."";
                //foreach(array_keys($row) as $key){
                //    echo $key.'-';
                //}
                $productos[] = Producto::parseJson($row);
            }
            //foreach( $productos as $producto ) {
            //    echo json_encode($producto->toJSON());
            //}
            
        } else {
            echo "Error al ejecutar el procedimiento almacenado: " . $stmt->error;
        }
    
        return $productos;
    }

    public static function getProductosEspera($mysqli){
        $productos = [];
        
        $sql = "SELECT * FROM vw_productosespera_admin";
        $result = $mysqli->query($sql);
    
        if ($result) {
            // Itera sobre los resultados y crea un array asociativo para cada fila
            while ($row = $result->fetch_assoc()) {
                $productos[] = $row;
            }
        } else {
            echo "Error al ejecutar la consulta SQL: " . $mysqli->error;
        }
    
        return $productos;
    }

    public static function getProductosAprobados($mysqli){
        $productosAprob = [];
        
        $sql = "SELECT * FROM vw_productosAprobados_admin";
        $result = $mysqli->query($sql);
    
        if ($result) {
            // Itera sobre los resultados y crea un array asociativo para cada fila
            while ($row = $result->fetch_assoc()) {
                $productosAprob[] = $row;
            }
        } else {
            echo "Error al ejecutar la consulta SQL: " . $mysqli->error;
        }
    
        return $productosAprob;
    }

    public static function getProductosRechazados($mysqli){
        $productosRecha = [];
        
        $sql = "SELECT * FROM vw_productosRechazados_admin";
        $result = $mysqli->query($sql);
    
        if ($result) {
            // Itera sobre los resultados y crea un array asociativo para cada fila
            while ($row = $result->fetch_assoc()) {
                $productosRecha[] = $row;
            }
        } else {
            echo "Error al ejecutar la consulta SQL: " . $mysqli->error;
        }
    
        return $productosRecha;
    }
    

}



?>