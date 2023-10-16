<?php

class Persona {
    private $idPersona;
    private $Nombre;
    private $ApellidoPat;
    private $ApellidoMat;
    private $FechaNac;
    private $Sexo;
    private $Telefono;

    public function getIdPersona() {
        return $this->idPersona;
    }

    public function setIdPersona($id) {
        $this->idPersona = $id;
    }

    public function getNombre() {
        return $this->Nombre;
    }

    public function setNombre($Nombre) {
        $this->Nombre = $Nombre;
    }

    public function getApellidoPat() {
        return $this->ApellidoPat;
    }

    public function setApellidoPat($ApellidoPat) {
        $this->ApellidoPat = $ApellidoPat;
    }

    public function getApellidoMat() {
        return $this->ApellidoMat;
    }

    public function setApellidoMat($ApellidoMat) {
        $this->ApellidoMat = $ApellidoMat;
    }

    public function getFechaNac() {
        return $this->FechaNac;
    }

    public function setFechaNac($FechaNac) {
        $this->FechaNac = $FechaNac;
    }

    public function getSexo() {
        return $this->Sexo;
    }

    public function setSexo($Sexo) {
        $this->Sexo = $Sexo;
    }

    public function getTelefono() {
        return $this->Telefono;
    }

    public function setTelefono($Telefono) {
        $this->Telefono = $Telefono;
    }

    public function __construct($Nombre, $ApellidoPat, $ApellidoMat, $FechaNac, $Sexo, $Telefono = null, $idPersona = null) {
        $this->idPersona = $idPersona;
        $this->Nombre = $Nombre;
        $this->ApellidoPat = $ApellidoPat;
        $this->ApellidoMat = $ApellidoMat;
        $this->FechaNac = $FechaNac;
        $this->Sexo = $Sexo;
        $this->Telefono = $Telefono;
    }

    public function save($mysqli) {
        try {
            // Define la consulta SQL con el stored procedure
            $sql = 'CALL sp_InsertarPersona(?, ?, ?, ?, ?, ?)';

            // Verifica si la conexión a la base de datos está establecida
            if ($mysqli->connect_error) {
                die("Connection failed: " . $mysqli->connect_error);
            }

            // Prepara la consulta SQL
            $stmt = $mysqli->prepare($sql);

            if ($stmt) {
                // Vincula los parámetros
                $stmt->bind_param("ssssss", $this->Nombre, $this->ApellidoPat, $this->ApellidoMat, $this->FechaNac, $this->Sexo, $this->Telefono);

                // Ejecuta la consulta
                $isSuccess = $stmt->execute();

                if ($isSuccess) {
                    return true;
                } else {
                    return false;
                }

                // Cierra la declaración
                $stmt->close();
            } else {
                return false;
            }
        } catch (Exception $e) {
            // Maneja excepciones
            return false;
        }
    }

    public function toJSON() {
        return get_object_vars($this);
    }
}
