<?php
require_once 'view/View.php';

class LoginView extends View {

    public function __construct() {
        parent::__construct();
    }

    public function mostrarLogin($error = "") {
        $this->smarty->assign("error", $error);
        $this->smarty->display('templates/login.tpl');
    }
}

?>