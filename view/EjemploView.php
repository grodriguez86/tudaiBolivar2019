<?php
  require_once "View.php";

  class EjemploView extends View {

    public function __construct() {
      parent::__construct();
    }

    public function denuncia() { 
      $this->smarty->display('templates/denuncia.tpl');
    }

    public function denunciaPunto() { 
      $this->smarty->display('templates/denunciaPunto.tpl');
    }

    public function confirmacionDenuncia($registro,$ciudadano,$pagina) {
      $this->smarty->assign('pagina',$pagina);
      $this->smarty->assign('registro',$registro);
      $this->smarty->assign('ciudadano',$ciudadano);
      $this->smarty->display('templates/confirmacionDenuncia.tpl');
    }

    public function mostrarTerminos() {
      $this->smarty->display('templates/terminos.tpl');

    }

    public function subirImagen($tabla, $id, $losArchivos, $registro){
      $this->smarty->assign('pagina',"controlTabla/".$tabla);
      $this->smarty->assign('tabla',$tabla);
      $this->smarty->assign('id',$id);
      $this->smarty->assign('losArchivos',$losArchivos);
      $this->smarty->assign('registro',$registro);
      $this->smarty->assign('mensaje',"");
      $this->smarty->display('templates/subirArchivo.tpl');
    }
  }
