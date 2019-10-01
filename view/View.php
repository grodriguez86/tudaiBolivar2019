<?php
  require_once "libs/Smarty.class.php";

  class View {

    protected $basehref;
    protected $smarty;
    protected $nombreUsuario;    
    
    public function __construct() {
        session_start();
        if (isset($_SESSION['email'])) {$this->nombreUsuario = $_SESSION['email'];}

        $this->basehref = '//'.$_SERVER['SERVER_NAME'].dirname($_SERVER['PHP_SELF']).'/'; 
        $this->smarty = new Smarty();
        $this->smarty->assign('basehref',$this->basehref);
        $this->smarty->assign("nombreUsuario", $this->nombreUsuario);     
    }
  }
 ?>
