<?php
  require_once "View.php";

  class EjemploView extends View {

    public function __construct() {
      parent::__construct();
    }

    public function denuncia() { 
      $this->smarty->display('templates/denuncia.tpl');
    }

    public function mostrarTerminos() {
      $this->smarty->display('templates/terminos.tpl');
    }
  }