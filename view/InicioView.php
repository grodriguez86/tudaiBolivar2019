<?php
require_once 'view.php';

class InicioView extends View {

    public function ShowHome() {
        $this->smarty->display("templates/home.tpl");
    }
}