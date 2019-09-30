<?php
  require_once "libs/Smarty.class.php";

  class View {

    protected $basehref;
    protected $smarty;    
    
    public function __construct() {
        $this->basehref = '//'.$_SERVER['SERVER_NAME'].dirname($_SERVER['PHP_SELF']).'/'; 
        $this->smarty = new Smarty();
        $this->smarty->assign('basehref',$this->basehref);        
    }
  }
 ?>
