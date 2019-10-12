  <?php

    require_once 'controller/EjemploController.php';
    require_once 'controller/LoginController.php';
    require_once 'view/LoginView.php';
    require_once 'view/InicioView.php';

  define('ACTION',0);
  define('VALOR1',1);
  define('VALOR2',2);
  define('VALOR3',3);

  if(!isset($_GET['action']))
  $_GET['action'] = '';

  $action = $_GET['action'];
  $partesUrl = explode('/', $action);

  switch ($partesUrl[ACTION]) {
    case 'login' :
      $view = new LoginController();
      $view->mostrarLogin();
      break;
    case 'misReportes' :
      $view = new LoginController();
      $view->misReportes();
      break;
    case 'verificarLogin' :
      $controller = new LoginController();
      $controller->verificarLogin();
      break;
    case 'logout' :
      $controller = new LoginController();
      $controller->cerrarSesion();
    case 'inicio':
      $controller = new LoginController();
      $controller->ShowHome("");
    break;
    case 'register':
      $controller = new LoginController();
      $controller->register();
    break;
    case 'verifyRegister':
      $controller = new LoginController();
      $controller->verifyRegister();
    break;
    case 'denuncia':
      $controller = new EjemploController();
      $controller->denuncia();
    break;
    case 'denunciaPersona':
      $controller = new EjemploController();
      $controller->denunciaPersona();
    break;
    case 'denunciaPunto':
      $controller = new EjemploController();
      $controller->denunciaPunto();
    break;
    case 'coordDesdeCalle':
      $controller = new EjemploController();
      $controller->coordDesdeCalle($partesUrl[VALOR1],$partesUrl[VALOR2],$partesUrl[VALOR3]);
    break;
    case 'grabarDenunciaPunto':
      $controller = new EjemploController();
      $controller->grabarDenunciaPunto();
    break;
    case 'confirmacionDenuncia':
      $controller = new EjemploController();
      $controller->confirmacionDenuncia($partesUrl[VALOR1],$partesUrl[VALOR2]);
    break;
    case 'upload':
      $controller = new EjemploController();
      $controller->uploadFile($partesUrl[VALOR1],$partesUrl[VALOR2]);
    break;
    case 'subirArchivo':
      $controller = new EjemploController();
      $controller->subirImagen($partesUrl[VALOR1],$partesUrl[VALOR2]);
    break;
    case 'terminos': 
      $controller = new EjemploController();
      $controller->mostrarTerminos();
    break;
    default:
      $controller = new LoginController();
      $controller->ShowHome("");
      break;
  } 
?>
