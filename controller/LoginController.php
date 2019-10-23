<?php
require_once 'controller/SecuredController.php';
require_once 'model/UsuarioModel.php';
require_once 'view/LoginView.php';
require_once 'view/InicioView.php';


class LoginController extends SecuredController{
    private $loginView;
    private $inicioView;
    private $usuarioModel;

    function __construct() {
        parent::__construct();
        $this->loginView = new LoginView();
        $this->inicioView = new InicioView();
        $this->usuarioModel = new UsuarioModel();
        
    }

    function ShowHome($error){
        if(!empty($_SESSION['email'])) {
            if($_SESSION['nivel'] == '0') {
                $this->inicioView->ShowHomeCiudadano($error); 
            }
            if ($_SESSION['nivel'] == '1') {
                $this->misReportes();
            }
        }
        else {
            $this->inicioView->ShowHome($error); 
        }
    }

    function mostrarLogin(){
        $this->loginView->mostrarLogin();
    }

    function verificarLogin() {
        $email = $_POST["email"];
        $contraseña = $_POST["contraseña"];
        $usuarioDB = $this->usuarioModel->getUsuario($email);

        if (!empty($usuarioDB)) {
            if(password_verify($contraseña, $usuarioDB->clave)) {
                // session_start();
                $nombreUsuario = $this->usuarioModel->getNombreUsuario($email);
                $_SESSION['nombre'] = $nombreUsuario->nombre;
                $_SESSION['email'] = $nombreUsuario->mail;
                $_SESSION['nivel'] = $nombreUsuario->nivel;
                $_SESSION['idciudadano'] = $nombreUsuario->idciudadano;
                $_SESSION['idlocalidad'] = $nombreUsuario->idlocalidad;
                echo 'OK';
            }
            else {
                echo "error";
            }
        }
        else {
            echo "error";
        }
    }

    function cerrarSesion() {
        session_start();
        session_destroy();
        header("Location: " . HOME);
        die();
    }

    function register(){
        $correo = $_POST['correo'];
        $usuario = $this->usuarioModel->getNombreUsuario($correo);
        if($usuario){
            $this->inicioView->ShowHome('Correo ya registrado');
        } 
        else{
            $this->loginView->mostrarRegister($correo);        
        }
    }

    function misReportes(){
        $this->haySesion();
        $reportes = $this->usuarioModel->getReportesCiudadano($_SESSION['idciudadano']);
        $this->loginView->showReportes($reportes); 
        die();
    }

    function verifyRegister(){
        $correo = $_POST['correo'];
        $nombre = $_POST['nombre'];
        $apellido = $_POST['apellido'];
        $dni = $_POST['dni'];
        $calle = $_POST['calle'];
        $numero = $_POST['numero'];
        $piso = $_POST['piso'];
        $numeroDep = $_POST['nroDep'];
        $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
        $localidad = $_POST['localidad'];

        $ciudadano = $this->usuarioModel->registerCiudadano($dni,$apellido,$nombre,$calle,$numero,$piso,$numeroDep,$localidad,$correo);
        $usuario = $this->usuarioModel->registerUser($correo,$password);

        if(($ciudadano)){
            echo 'OK';
        }
        else {
            echo 'ERROR';
        }
    }
}

?>