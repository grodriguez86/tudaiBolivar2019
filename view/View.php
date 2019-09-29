<?php
  require_once "libs/Smarty.class.php";

  class View {

    protected $basehref;
    protected $smarty;    
    
    public function __construct() {
        $this->basehref = '//'.$_SERVER['SERVER_NAME'].dirname($_SERVER['PHP_SELF']).'/'; 
        //$this->basehref = 'http://45.7.86.183:804/'; 
        $this->smarty = new Smarty();
        $this->mail = $_SESSION['MAIL'];
        $this->nombre = $_SESSION['NAME'];
        $this->nivel = $_SESSION['NIVEL'];
        $this->user = $_SESSION['USER'];
        $this->membresia = $_SESSION['MEMBRESIA'];
        $this->idZona = $_SESSION['IDZONA'];
        $this->smarty->assign('mail',$this->mail);
        $this->smarty->assign('nombre',$this->nombre);
        $this->smarty->assign('user',$this->user);
        $this->smarty->assign('nivel',$this->nivel);
        $this->smarty->assign('membresia',$this->membresia);
        $this->smarty->assign('basehref',$this->basehref);        
    }
  }
 ?>
