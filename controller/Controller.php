<?php

define('HOME', 'http://'.$_SERVER['SERVER_NAME'].dirname($_SERVER['PHP_SELF']).'/');



class Controller {

  
  public function __construct(){
    if(session_status() != PHP_SESSION_ACTIVE){
      session_start();
    };

    if(!isset($_SESSION['email'])){
      $_SESSION['email'] = '';
      $_SESSION['nombre'] = '';
    }

     
  } 
  
}