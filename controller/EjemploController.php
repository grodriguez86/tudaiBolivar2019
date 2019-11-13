<?php

require_once 'controller/SecuredController.php';
require_once 'model/EjemploModel.php';
require_once 'view/EjemploView.php';
require_once 'model/UsuarioModel.php';

class EjemploController extends SecuredController{

    private $ejemploView;
    private $ejemploModel;
    private $usuarioModel;

    public function __construct(){
        parent::__construct();
        $this->ejemploView = new EjemploView();
        $this->ejemploModel = new ejemploModel();
        $this->usuarioModel = new UsuarioModel();
    } 

    public function denuncia(){
        $this->ejemploView->denuncia();  

    }

    public function confirmacionDenuncia($id,$pagina){
        $this->haySesion();
        $registro = $this->ejemploModel->getDenunciaID($id);
        $ciudadano = $_SESSION['nombre'];
        $nivel = $_SESSION['nivel'];
        $this->ejemploView->confirmacionDenuncia($registro, $ciudadano, $pagina,$nivel);  
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

    function mostrarTerminos() {
        $this->ejemploView->mostrarTerminos();
    }

    function finalizarDenuncia($id) {
        $ciudadano = $_SESSION['nombre'];
        $denuncia = $this->ejemploModel->getDenunciaID($id);
        $this->ejemploView->finalizarDenuncia($denuncia,$ciudadano);
    }


    function mostrarDenuncia($tipoDenuncia) {
        $nivel = $_SESSION['nivel'];
        $persona = $_SESSION['nombre'];
        // es para controllar la URL denunciarPunto sin no cumple con la condicion de ser menor a 5 denuncias por persona
        $idu = (int) $_SESSION['idciudadano'];
        $reportes = $this->usuarioModel->getReportesCiudadano($idu);
        $denuncias = 0;
        foreach ($reportes as $key) {
            if ($key->fecha_finalizacion == null) {
                $denuncias ++;
            }

        }

        if ($nivel == 0 && !$persona == 0 && $denuncias < 5) { //permite que solo ingrese un ciudadano nivel 0
            $this->ejemploView->mostrarDenuncia($tipoDenuncia);
        } else {
            header("Location: inicio");
        }
    }

    public function grabarDenunciaPunto(){
        $this->haySesion();
        $ubicacion = $_POST["inputUbicacion"];
        $tipoDenuncia = $_POST["tipoDenuncia"];
        if($ubicacion==""){
            $ubicacion="Ubicacion actual por geolocalizacion";
        }
        $latitud = $_POST["inputLat"];
        $longitud = $_POST["inputLon"];
        $imagen = $_FILES["fileToUpload"]["name"];
        $idciudadano = $_SESSION['idciudadano'];
        $idlocalidad = $_SESSION['idlocalidad'];
        $idDenuncia = $this->ejemploModel->saveDenuncia($ubicacion, $latitud, $longitud, $idciudadano,$idlocalidad,$tipoDenuncia);
        // subir imagen
        $this->uploadFile("denuncia",$idDenuncia,$tipoDenuncia);
    }

    //finalizar la denuncia
    public function finalizarDenunciaPunto(){
        $this->haySesion();
        $denunciaid = $_POST["denunciaid"];
        $fechafin = $_POST["fechafin"];
        $imagen = $_FILES["fileToUpload"]["name"];        
        $this->ejemploModel->finalizarDenunciaPunto($denunciaid, $fechafin);
        // subir imagen
        $this->uploadFile("denuncia",$denunciaid,"finalizar");
        header("Location: finalizarDenuncia/".$denunciaid);
        die(); 
    }

    // subir imagen

    public function uploadFile($tabla,$id,$tipo){
        $this->haySesion();
        //verifico directorios
        $elDir = "images/".$tabla;
        if (!file_exists($elDir)) {
            if(!mkdir($elDir, 0777, true)) {
            die('Fallo al crear las carpetas...');
            }
        }  
        $elDir = "images/".$tabla."/".$id;
        if (!file_exists($elDir)) {
            if(!mkdir($elDir, 0777, true)) {
            die('Fallo al crear las carpetas...');
            }
        }              
        $target_dir = "images/$tabla/$id/";
        $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
        $uploadOk = 1;
        $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
        // verificar tipo denuncia
        $fileNewName = "foto";
        if ($tipo =="finalizar"){
            $tipo=="punto";
            $fileNewName = "foto1";
        }
        if($tipo=="punto"){
            // Check if image file is a actual image or fake image
            if(isset($_POST["submit"])) {
                $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
                if($check !== false) {
                    echo "El archivo es una imagen - " . $check["mime"] . ".";
                    $uploadOk = 1;
                } else {
                    echo "El archivo no es una imagen.";
                    $uploadOk = 0;
                }
            }
            // Check if file already exists
            if (file_exists($target_file)) {
                echo "Atencion. El archivo ya existe.";
                $uploadOk = 0;
            }
            // Check file size
            if ($_FILES["fileToUpload"]["size"] > 5000000) {
                echo "Atencion. El archivo es muy grande.";
                $uploadOk = 0;
            }
            // Allow certain file formats
            if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
            && $imageFileType != "gif" ) {
                echo "Atencion. El archivo debe ser tipo JPG, JPEG, PNG & GIF.";
                $uploadOk = 0;
            }
            // Check if $uploadOk is set to 0 by an error
            if ($uploadOk == 0) {
                echo "Atencion. El archivo no se ha subido.";
            // if everything is ok, try to upload file
            } else {      
                $file = $_FILES['fileToUpload']['tmp_name']; 
                $sourceProperties = getimagesize($file);
                $ext = pathinfo($_FILES['fileToUpload']['name'], PATHINFO_EXTENSION);                      
                $folderPath = $target_dir;
                $imageType = $sourceProperties[2];        
                //Modificar Imagen        
                switch ($imageType) {
                    case IMAGETYPE_PNG:
                        $imageResourceId = imagecreatefrompng($file); 
                        $targetLayer = $this->imageResize($imageResourceId,$sourceProperties[0],$sourceProperties[1]);
                        imagejpeg($targetLayer,$folderPath. $fileNewName.".jpg");
                        echo "OK-Se subio archivo jpg correctamente.";
                        break;
                    case IMAGETYPE_GIF:
                        $imageResourceId = imagecreatefromgif($file); 
                        $targetLayer =  $this->imageResize($imageResourceId,$sourceProperties[0],$sourceProperties[1]);
                        imagejpeg($targetLayer,$folderPath. $fileNewName.".jpg");
                        echo "OK-Se subio archivo jpg correctamente.";
                        break;
                    case IMAGETYPE_JPEG:
                        $imageResourceId = imagecreatefromjpeg($file); 
                        $targetLayer =  $this->imageResize($imageResourceId,$sourceProperties[0],$sourceProperties[1]);
                        imagejpeg($targetLayer,$folderPath. $fileNewName.".jpg");
                        echo "OK-Se subio archivo jpg correctamente.";
                        break;
                    default:
                        echo "ERROR-Tipo de imagen invalida.";
                        exit;
                        break;
                }                
            }
        }
        else{
            // Check if video file 
            
            //$getID3 = new getID3;
            //$file = $getID3->analyze($target_file);
            $size = $_FILES['fileToUpload']['size'];
            $uploadOk = 1;
            // Check if file already exists
            if (file_exists($target_file)) {
                echo "Atencion. El archivo ya existe.";
                $uploadOk = 0;
            }
            // Check file size
            echo "Atencion. $size";
            if ($size > 5000000) {
                echo "Atencion. El archivo es muy grande.";
                $uploadOk = 0;
            }
            // Allow certain file formats
            echo "Atencion. $imageFileType";
            if($imageFileType != "mp4") {
                echo "Atencion. El archivo debe ser tipo MP4.";
                $uploadOk = 0;
            }
            // Check if $uploadOk is set to 0 by an error
            if ($uploadOk == 0) {
                echo "Atencion. El archivo no se ha subido.";
            // if everything is ok, try to upload file
            } else {      
                $file = $_FILES['fileToUpload']['tmp_name']; 
                $ext = pathinfo($_FILES['fileToUpload']['name'], PATHINFO_EXTENSION);
                $fileNewName = "video";
                $folderPath = $target_dir;
                if(move_uploaded_file($file, $target_dir.$fileNewName.".mp4"))
                {
                    echo "OK-Se subio archivo mp4 correctamente.";
                }
                else
                {
                    echo "Error-No se subio archivo mp4 correctamente.";
                }
                
                
            }
        }
        header("Location: ".HOME."confirmacionDenuncia/".$id."/inicio");
        die();    
      }
    
      public function borrarArchivo($tabla, $id, $archivo){
        $this->haySesion();
        $target_dir = "images/documentos/$tabla/$id/$archivo";
        if (file_exists("images/documentos/$tabla/$id/$archivo")) {
        unlink("images/documentos/$tabla/$id/$archivo");    
        }
        header("Location: ".HOME."subirArchivo/".$tabla."/".$id);
        die();    
      }
    
      function imageResize($imageResourceId,$width,$height) {
        $targetWidth =800;
        $targetHeight =500;
        $targetLayer=imagecreatetruecolor($targetWidth,$targetHeight);
        imagecopyresampled($targetLayer,$imageResourceId,0,0,0,0,$targetWidth,$targetHeight, $width,$height);
        return $targetLayer;
      } 

      public function subirImagen($tabla,$id){
        $this->haySesion();
        $registro = $this->ejemploModel->getDenunciaID($id);
        $losArchivos = $this->traerArchivos($tabla, $id);
        $this->ejemploView->subirImagen($tabla, $id, $losArchivos,$registro);
      }
    
      public function traerArchivos($tabla, $id){
        $this->haySesion();
        $elDir = "images/".$tabla."/".$id;
        if (!file_exists($elDir)) {
            if(!mkdir($elDir, 0777, true)) {
            die('Fallo al crear las carpetas...');
            }
        }  
        $files = scandir($elDir);
        return $files;
      }

      
    

} 