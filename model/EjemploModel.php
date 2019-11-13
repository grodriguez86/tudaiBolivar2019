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

    public function getDenunciaID($id){
      $sentencia = $this->conectarBaseDeDatos->prepare("SELECT * FROM denuncia WHERE iddenuncia = ?");
      $sentencia->execute(array($id));
      return $sentencia->fetch(PDO::FETCH_OBJ);
    }

    public function saveDenuncia($ubicacion, $latitud, $longitud, $idciudadano,$idlocalidad,$tipoDenuncia){
      $sentencia = $this->conectarBaseDeDatos->prepare("INSERT INTO denuncia (idciudadano,descripcion,ubicacion,idlocalidad,latitud,longitud,idcuadrilla) VALUES (?,?,?,?,?,?,?)");
      $sentencia->execute(array($idciudadano,$tipoDenuncia,$ubicacion,$idlocalidad,$latitud,$longitud,"1"));
      return $this->conectarBaseDeDatos->lastInsertId();
    }

    function denunciaPersona(){
      $this->loginView->showReportes($reportes); 
      die();
  }

  //modificar la denuncia para finalizar agregando la fecha de finalizacion
  
  public function finalizarDenunciaPunto($id,$fechafin){
    $sentencia = $this->conectarBaseDeDatos->prepare("UPDATE denuncia SET fecha_finalizacion = ? WHERE iddenuncia = ?");
    $sentencia->execute(array($fechafin,$id));
    
  }
  
} 