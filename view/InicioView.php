<?php
require_once 'view/View.php';

class InicioView extends View {

    public function ShowHome($mensaje) {
        if(!isset($mensaje)) {
            $mensaje = "";
        }
        $this->smarty->assign("error", $mensaje);
        $this->smarty->display("templates/home.tpl");
    }
}