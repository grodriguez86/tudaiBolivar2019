<?php
require_once 'controller/Controller.php';
require_once 'model/UsuarioModel.php';
require_once 'view/LoginView.php';


class LoginController extends Controller {
    private $loginView;
    private $usuarioModel;

    function __construct() {
        parent::__construct();
        $this->loginView = new LoginView();
        $this->usuarioModel = new UsuarioModel();
    }

    function verificarLogin() {
        $email = $_POST["email"];
        $contraseña = $_POST["contraseña"];
        $usuarioDB = $this->usuarioModel->getUsuario($email);

        if (!empty($usuarioDB)) {
            if(password_verify($contraseña, $usuarioDB->clave)) {
                session_start();
                $_SESSION['email'] = $email;
                header("Location: " . HOME);
                die();
            }
            else {
                $error = "Usuario y/o contraseña incorrectos";
                $this->loginView->mostrarLogin($error);
            }
        }
        else {
            $error = "Usuario y/o contraseña incorrectos";
            $this->loginView->mostrarLogin($error);
            header("sfsd");
        }
    }

    function cerrarSesion() {
        session_start();
        session_destroy();
        header("Location: " . HOME);
        die();
    }
}

?>