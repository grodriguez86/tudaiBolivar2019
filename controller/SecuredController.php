<?php
require_once "controller/Controller.php";

class SecuredController extends Controller {

    function __construct() {
        parent::__construct();
    }

    function haySesion() {
        if(!isset($_SESSION)) {
            header("Location: " . HOME);
        }
        else {
            return true;
        }
    }

}
?>

