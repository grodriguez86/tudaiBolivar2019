<?php
require_once('controller/Controller.php');
require_once('model/UsuarioModel.php');
require_once('view/LoginView.php');


class LoginController extends Controller {
    private $loginView;
    private $usuarioModel;

    function __construct() {
        parent::__construct();
        $this->loginView = new LoginView;
        $this->loginModel = new UsuarioModel;
    }

    function mostrarLogin() {
        $this->loginView->mostrarLogin();   
    }

    function verificarLogin() {
        $usuario = $_POST["usuario"];
        $contraseña = $_POST["contraseña"];
        
        if (!empty($usuario) && !empty($contraseña)) {
            $usuarioDB = $this->usuarioModel->getUsuario($usuario);
            if (isset($usuarioDB) && password_verify($contraseña, $usuarioDB->clave)) {
                    session_start();
                    $_SESSION['usuario'] = $usuario;
                    $_SESSION['ID'] = $usuarioDB->id_usuario;
                    header("Location: " . HOME);
                    die();
            } else {
                    $error = "Usuario y/o contraseña incorrecta";
                    $this->view->mostrarLogin($error);
            }
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