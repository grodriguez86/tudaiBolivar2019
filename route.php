  <?php

//  require_once 'Controller/EjemploController.php';
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
    case 'inicio':
      $controller = new InicioView();
      $controller->ShowHome();
    break;
    default:
      $controller = new InicioView();
      $controller->ShowHome();
      break;
  } 
?>
