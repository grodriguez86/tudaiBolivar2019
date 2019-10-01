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

    public function mostrarRegister($usuario,$correo) {
        $this->smarty->assign("usuario", $usuario);
        $this->smarty->assign("correo", $correo);
        $this->smarty->display('templates/register.tpl');
    }
}

?>