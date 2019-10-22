<?php
require_once "controller/Controller.php";

class SecuredController extends Controller {

    function __construct() {
        parent::__construct();
    }

    function haySesion() {
        if(empty($_SESSION['email'])) {
            header("Location: " . HOME);
            die();
        }
        else {
            return true;
        }
    }

}
?>

