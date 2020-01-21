<?php
require_once 'view/View.php';

class InicioView extends View {

    public function __construct(){
        parent::__construct();
        

    }

    public function ShowHome($mensaje) {
        if(!isset($mensaje)) {
            $mensaje = "";
        }
        $this->smarty->assign("error", $mensaje);
        $this->smarty->display("templates/home.tpl");
    }

    public function ShowHomeCiudadano($mensaje, $denuncias) {
        if(!isset($mensaje)) {
            $mensaje = "";
        }
        $this->smarty->assign("error", $mensaje);
        $this->smarty->assign("denuncias", $denuncias);
        $this->smarty->display("templates/homeCiudadano.tpl");
    }
        
}