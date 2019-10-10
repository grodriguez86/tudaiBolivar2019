<?php

require_once 'controller/SecuredController.php';
require_once 'model/EjemploModel.php';
require_once 'view/EjemploView.php';

class EjemploController extends SecuredController{

    private $ejemploView;
    private $ejemploModel;

    public function __construct(){
        parent::__construct();
        $this->ejemploView = new EjemploView();
        $this->ejemploModel = new ejemploModel();
    } 

    public function denuncia(){
        $this->ejemploView->denuncia();  

    }

    function getCoordinates($address){
        $address = urlencode($address);
        
        //$url = "https://maps.googleapis.com/maps/api/geocode/json?address={$address}&key=AIzaSyB_OgTgi1I4tyucC11SUnopRVK4hQxwjLc";
        $url = "http://maps.googleapis.com/maps/api/geocode/json?address='.urlencode($address).'&sensor=false";
        
        $response = file_get_contents($url);
        $json = json_decode($response,true);
        print_r($response);
        $lat = $json['results'][0]['geometry']['location']['lat'];
        $lng = $json['results'][0]['geometry']['location']['lng'];
     
        return array($lat, $lng);
    }

    function coordDesdeCalle($calle, $localidad, $provincia){
        $coords = $this->getCoordinates("Passeig de Gracia, Barcelona, Barcelona");
        print_r($coords);
    }

} 