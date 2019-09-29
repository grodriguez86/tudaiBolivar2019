<?php

require_once 'model/modelGeneral.php';
//require_once 'Model/userModel.php';

define('HOME', 'http://'.$_SERVER['SERVER_NAME'].dirname($_SERVER['PHP_SELF']).'/');


class Controller {

  protected $view;
  protected $model;

  

  public function __construct(){
    //$this->modelUser = new userModel();
    //$this->empresa = $this->modelGeneral->getRegistroID("empresa", 1,"A");
  } 
}