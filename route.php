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
    case 'coordDesdeCalle':
      $controller = new EjemploController();
      $controller->coordDesdeCalle($partesUrl[VALOR1],$partesUrl[VALOR2],$partesUrl[VALOR3]);
    break;
    default:
      $controller = new LoginController();
      $controller->ShowHome("");
      break;
  } 
?>
