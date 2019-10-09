<?php

require_once 'model/model.php';

class UsuarioModel extends Model {

    public function __construct() {
        parent::__construct();
    }

    public function getUsuario($email) {
        $sentencia = $this->conectarBaseDeDatos->prepare("SELECT * FROM usuario WHERE mail = ?");
        $sentencia->execute(array($email));
        return $sentencia->fetch(PDO::FETCH_OBJ);
    }

    public function registerCiudadano($dni,$apellido,$nombre,$calle,$numero,$piso,$numeroDep,$localidad,$correo){
        $sentencia = $this->conectarBaseDeDatos->prepare("INSERT INTO ciudadano (dni,apellido,nombre,calle,numero,piso,dtp,idlocalidad,mail) VALUES (?,?,?,?,?,?,?,?,?)");
        $sentencia->execute(array($dni,$apellido,$nombre,$calle,$numero,$piso,$numeroDep,$localidad,$correo));
        return $this->conectarBaseDeDatos->lastInsertId();
    }

    public function registerUser($correo,$password){
        $sentencia = $this->conectarBaseDeDatos->prepare("INSERT INTO usuario (mail,clave) VALUES (?,?)");
        $sentencia->execute(array($correo,$password));
    }
}
?>