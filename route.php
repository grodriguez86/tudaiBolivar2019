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
      $view = new LoginView();
      $view->mostrarLogin();
      break;
    case 'verificarLogin' :
      $controller = new LoginController();
      $controller->verificarLogin();
      break;
    case 'logout' :
      $controller = new LoginController();
      $controller->cerrarSesion();
    case 'inicio':
      $controller = new InicioView();
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
    default:
      $controller = new InicioView();
      $controller->ShowHome();
      break;
  } 
?>
