  <?php

//  require_once 'Controller/EjemploController.php';
    require_once 'controller/LoginController.php';
    require_once 'view/LoginView.php';

  define('ACTION',0);
  define('VALOR1',1);
  define('VALOR2',2);
  define('VALOR3',3);

  if(!isset($_GET['action']))
  $_GET['action'] = '';

  $action = $_GET['action'];
  $partesUrl = explode('/', $action);

  switch ($partesUrl[ACTION]) {
    // case 'home':
    //   $controller = new EjemploController();
    //   $controller->getHome();
    // break;
    // default:
    //   $controller = new PaginaController();
    //   $controller->getHome();
    //   break;
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
      break;
  } 
?>
