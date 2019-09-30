<?php
/* Smarty version 3.1.32, created on 2019-09-30 20:44:29
  from 'C:\xampp\htdocs\tudaiBolivar2019\templates\header.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.32',
  'unifunc' => 'content_5d924d0d3f2b39_12179551',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ddde338ffe8e0a8d3ac71576cc8877b6e624dbec' => 
    array (
      0 => 'C:\\xampp\\htdocs\\tudaiBolivar2019\\templates\\header.tpl',
      1 => 1569869066,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5d924d0d3f2b39_12179551 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html>
    <head>
        <base href="<?php echo $_smarty_tpl->tpl_vars['basehref']->value;?>
">
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>TrashOut</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg fixed-top bg-light navbar-light">
            <div class="col-5 col-sm-3 col-md-2 col-lg-2">
                <a href="inicio"><img src="images/logo-institucional.png" class="card-img-top img-fluid" alt="..."></a>
            </div>
            <button class="navbar-toggler ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="btn btn-light inicio btn-lg btn-block" href="inicio">INICIO</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-light categoria btn-lg btn-block" href="saberMas">SABER MAS</a>
                    </li>
                    <li class="nav-item">
                        <?php if (!empty($_smarty_tpl->tpl_vars['nombreUsuario']->value)) {?>
                            <a class="btn btn-primary logearse btn-lg btn-block" href="logout">Cerrar sesion (<?php echo $_smarty_tpl->tpl_vars['nombreUsuario']->value;?>
)</a>    
                        <?php } else { ?> 
                            <a class="btn btn-primary logearse btn-lg btn-block" href="login">Logearse</a>
                        <?php }?>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container-fluid p-0">
            <div class="row m-0 mt-5 justify-content-center">
    <?php }
}
