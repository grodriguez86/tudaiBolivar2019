<?php

require_once 'model.php';


class EjemploModel extends Model{

    public function __construct(){
        parent::__construct();
    } 

    public function saveData(){
      $sentencia = $this->conectarBaseDeDatos->prepare("SELECT * FROM tabla WHERE Columna = ?");
      $sentencia->execute(array('DATO'));
      return $sentencia->fetch(PDO::FETCH_OBJ);
    }
  
} 