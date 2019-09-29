  <?php
  require_once 'Controller/PaginaController.php';
  require_once 'Controller/borra.php';
  require_once 'Controller/LogInController.php';
  require_once 'Controller/AdminController.php';
  require_once 'Controller/FEcontroller.php';
  require_once 'Controller/imprimirController.php';


  define('ACTION',0);
  define('VALOR1',1);
  define('VALOR2',2);
  define('VALOR3',3);


  if(!isset($_GET['action']))
  $_GET['action'] = '';

  $action = $_GET['action'];
  $partesUrl = explode('/', $action);

  switch ($partesUrl[ACTION]) {
    case 'Inico':
      $controller = new PaginaController();
      $controller->getInicio();
    break;
    case 'IniciarSesion':
      $controller = new PaginaController();
      $controller->getLogin();
      break;
    case 'usuario':
      $controller = new adminController();
      $controller->getHomeUser();
      break;
    case 'perfil':
      $controller = new adminController();
      $controller->getPerfil();
      break;
    case 'modificarPerfil':
      $controller = new adminController();
      $controller->modificarPerfil();
      break;
    case 'cerrarSesion':
      $controller = new LogInController();
      $controller->logOut();
      break;
    case 'verificarAdmin':
      $controller = new LogInController();
      $controller->verify();
      break;
    case 'admin':
      $controller = new adminController();
      $controller->getAdmin();
      break;
    case 'operaciones':
      $controller = new adminController();
      $controller->getOperaciones($partesUrl[VALOR1],$partesUrl[VALOR2]);
      break; 
    case 'ingreso':
      $controller = new adminController();
      $controller->getIngreso($partesUrl[VALOR1]);
      break;  
    case 'categoria':
      $controller = new PaginaController();
      $controller->mostrarCategoria($partesUrl[VALOR1],$partesUrl[VALOR2],$partesUrl[VALOR3]);
      break;
    case 'controlTabla':
      $controller = new adminController();
      $controller->controlTabla($partesUrl[VALOR1]);
      break;  
    case 'articulo':
      $controller = new PaginaController();
      $controller->mostrarArticulo($partesUrl[VALOR1],$partesUrl[VALOR2]);
      break;
    case 'carrito':
      $controller = new adminController();
      $controller->carrito();
      break;    
    case 'borrarRegistro':
      $controller = new borraController();
      $controller->borrar($partesUrl[VALOR1]);
      break;
    case 'grabarFactura':
      $controller = new borraController();
      $controller->grabarFactura();
      break;
    case 'generarFE':
      $controller = new borraController();
      $controller->generarFE();
      break;
    case 'abonoFE':
      $controller = new adminController();
      $controller->abonoFE();
      break;
    case 'generarAbono':
      $controller = new borraController();
      $controller->generarAbono();
      break;
    case 'libroVenta':
      $controller = new adminController();
      $controller->libroVenta();
      break;           
    case 'agregarRegistro':
      $controller = new adminController();
      if(!isset($partesUrl[VALOR2])){
        $partesUrl[VALOR2]="";
      }
      $controller->agregarRegistro($partesUrl[VALOR1],$partesUrl[VALOR2], false, $partesUrl[VALOR3]);
      break;   
    case 'agregarRegistroAux':
      $controller = new adminController();
      $controller->agregarRegistro($partesUrl[VALOR1], $partesUrl[VALOR2],true, $partesUrl[VALOR3]);
      break;   
    case 'guardarCambiosRegistro':
      $controller = new adminController();
      $controller->guardarRegistro($partesUrl[VALOR1],$partesUrl[VALOR2],$partesUrl[VALOR3]);
      break;
    case 'subirArchivo':
      $controller = new adminController();
      $controller->subirImagen($partesUrl[VALOR1],$partesUrl[VALOR2]);
      break;
    case 'upload':
      $controller = new adminController();
      $controller->uploadFile($partesUrl[VALOR1],$partesUrl[VALOR2]);
      break; 
    case 'predeterminarArchivo':
      $controller = new adminController();
      $controller->predeterminarArchivo($partesUrl[VALOR1],$partesUrl[VALOR2],$partesUrl[VALOR3]);
      break; 
    case 'borrarArchivo':
      $controller = new adminController();
      $controller->borrarArchivo($partesUrl[VALOR1],$partesUrl[VALOR2],$partesUrl[VALOR3]);
      break;       
    case 'traerComprobante':
      $controller = new adminController();
      $controller->traerComprobante($partesUrl[VALOR1]);
      break;                                                          
    case 'traerComprobanteFactura':
      $controller = new adminController();
      $controller->traerComprobanteFactura($partesUrl[VALOR1]);
      break;                                                          
    case 'traerRecibo':
      $controller = new adminController();
      $controller->traerRecibo($partesUrl[VALOR1]);
      break; 
    case 'traerLibroVenta':
      $controller = new adminController();
      $controller->traerLibroVenta($partesUrl[VALOR1],$partesUrl[VALOR2]);
      break; 
    case 'enviarMensaje':
      $controller = new PaginaController();
      $controller->enviarMensaje();                                               
      break; 
    case 'mensajes':
      $controller = new adminController();
      $controller->controlTabla('mensaje');
      break;
    case 'mensajesResp':
      $controller = new adminController();
      $controller->mensajeResp($partesUrl[VALOR1]);
      break;
    case 'responderMensaje':
      $controller = new adminController();
      $controller->enviarRespuesta();
      break;
    case 'detalleStock':
      $controller = new adminController();
      $controller->detalleStock($partesUrl[VALOR1]);
      break;  
    case 'caja':
      $controller = new adminController();
      $controller->caja();
      break;  
    case 'detalleCaja':
      $controller = new adminController();
      $controller->detalleCaja($partesUrl[VALOR1],$partesUrl[VALOR2]);
      break;
    case 'detalleForma':
      $controller = new adminController();
      $controller->detalleForma($partesUrl[VALOR1],$partesUrl[VALOR2],$partesUrl[VALOR3]);
      break;  
    case 'cierreCaja':
      $controller = new adminController();
      $controller->cierreCaja();
      break;  
    case 'movimientoCaja':
      $controller = new adminController();
      $controller->movimientoCaja();
      break;
    case 'grabaMovimientoCaja':
      $controller = new adminController();
      $controller->grabaMovimientoCaja();
      break;         
    case 'cuitAfip':
      $controller = new FEcontroller();
      $controller->cuitAfip($partesUrl[VALOR1]);
      break;
    case 'facturador':
      $controller = new adminController();
      $controller->facturador();
      break;    
    case 'grabarPago':
      $controller = new borraController();
      $controller->grabarPago();
      break;      
    case 'membresia':
      $controller = new adminController();
      $controller->membresia();
      break;
    case 'suPago':
      $controller = new adminController();
      $controller->suPago($partesUrl[VALOR1],$partesUrl[VALOR2]);
      break; 
    case 'confirmarPago':
      $controller = new adminController();
      $controller->confirmarPago();
      break;   
    case 'mercadoPago':
      $controller = new adminController();
      $controller->mercadoPago();
      break;   
    case 'notificacionMP':
      $controller = new adminController();
      $controller->notificacionMP();
      break;
    case 'ayuda':
        $controller = new adminController();
        $controller->ayuda();
        break;
    case 'mensajeCorreo':
        $controller = new adminController();
        $controller->correoFE();
        break;
    case 'facturaElectronica':
        $controller = new PaginaController();
        $controller->facturaElectronicaInfo();
        break;
    default:
      $controller = new PaginaController();
      $controller->getInicio();
      break;
  } 
?>
