<?php

require_once 'Controller.php';
require_once 'model/EjemploModel.php';
require_once 'view/EjemploView.php';

class EjemploController extends Controller{

    private $ejemploView;
    private $ejemploModel;

    public function __construct(){
        parent::__construct();
        $ejemploView = new ejemploView();
        $ejemploModel = new ejemploModel();
    } 

    public function denuncia(){
        $this->ejemploView->denuncia();  

    }

} 