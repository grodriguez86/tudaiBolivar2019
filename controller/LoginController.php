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
        //var_dump($_SESSION);
        if(!empty($_SESSION['email'])) {
            if($_SESSION['nivel'] == '0') {
                $idu = (int) $_SESSION['idciudadano'];
                $reportes = $this->usuarioModel->getReportesCiudadano($idu);
                $denuncias = 0;
                foreach ($reportes as $key) {
                    if ($key->fecha_finalizacion == null) {
                        $denuncias ++;
                        // var_dump($denuncias);
                    }

                }
                $this->inicioView->ShowHomeCiudadano($error,$denuncias); 
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
                // print_r($nombreUsuario);
                $_SESSION['nombre'] = $nombreUsuario->nombre;
                $_SESSION['email'] = $nombreUsuario->mail;
                $_SESSION['nivel'] = $usuarioDB->nivel;
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
            $codigo = rand(10000,50000);
            $this->loginView->mostrarRegister($correo,$codigo);        
        }
    }

    function misReportes(){
        
        $this->haySesion();
        $idu = (int) $_SESSION['idciudadano'];
        $reportes = $this->usuarioModel->getReportesCiudadano($idu);
        $denuncias = 0;
        foreach ($reportes as $key) {
            if ($key->fecha_finalizacion == null) {
                $denuncias ++;
                // var_dump($denuncias);
            }

        }
        $this->loginView->showReportes($reportes, $denuncias); 
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
        $codigo = $_POST['codigo'];
        
        

        $ciudadano = $this->usuarioModel->registerCiudadano($dni,$apellido,$nombre,$calle,$numero,$piso,$numeroDep,$localidad,$correo);
        $usuario = $this->usuarioModel->registerUser($correo,$password,$codigo);

        if(($ciudadano)){
            $this->sendMail($correo,"Confirmacion Mail","Vaya a este enlace para confirmar mail www.trashout.ml/confirmarMail/".$correo."/".$codigo);
            echo 'OK';
        }
        else {
            echo 'ERROR';
        }
    }

    public function confirmarMail() {
        $correo = $_GET['correo'];
        $codigo = $_GET['codigo'];
        $usuario = $this->usuarioModel->getUsuario($correo);
        if ($codigo == $usuario->codigo){
            if ($usuario->estado == "SI"){
                header("Location: " . HOME);
            }else{
                $this->usuarioModel->updateUser($correo);
            }
        }else{
            echo 'verificacion incorrecta';
        }
        
      }




    function sendMail($dest,$asu,$men){
        $destinatario = $dest;
        $asunto = $asu;
        $mensaje = $men;
        $headers = "From: info@trashout.com" . "\r\n";

        mail($destinatario,$asunto,$mensaje,$headers);
    }
}

?>