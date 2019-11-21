<!DOCTYPE html>
<html>
    <head>
        <base href="{$basehref}">
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>TrashOut</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        {* <link rel="stylesheet" href="css/bootstrap-4.1.3/bootstrap.min.css"> *}
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="css/estilo.css">
    </head>
    

<body class="registerBackground">  
  <div class="container h-100">
    <div class="row h-100 justify-content-center  align-items-center">
      <div class="col-md-8 bg-white shadow">
        <div class="row">
          <div class="col-md-12">
              <div class="row">
                  <img src="images/logo-institucional.png" class="tamañoImagenLogoRegister mt-3 mb-3 mx-auto mr-4" alt="Italian Trulli" title="Worksi">        
              </div>
              <input type="hidden" id="correo" value="{$correo}" >
              <div class="mt-3 row">
                  <form class="col-12" action="" id="registerUser" method="post">
                    <div class="form-group">
                      <p><span class="negrita">{$correo}</span> ya estas a un paso de completar tu registro, solo te pediremos unos datos mas para poder verificar tu identidad <span> &#128512</span></p>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" id="nombre"  class="form-control" placeholder="Nombre *" required>
                        </div>
                        <div class="form-group">
                            <input type="text" id="apellido" class="form-control" placeholder="Apellido *" required>
                        </div>
                        <div class="form-group">
                            <input type="number" id="dni" class="form-control" placeholder="Dni *" required>
                        </div>
                        <div class="form-group">
                            <input type="text" id="calle"  class="form-control" placeholder="Calle *" required>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">
                            <input type="number" id="numero" class="form-control" placeholder="Numero *" required>
                        </div>
                        <div class="form-group">
                            <input type="text" id="nroDep" class="form-control" placeholder="Nro Departamento">
                        </div>
                        <div class="form-group">
                            <input type="number" id="piso" class="form-control" placeholder="Piso">
                        </div>
                        <div class="form-group">
                          <select class="form-control" id="localidad">
                            <option selected>Seleccionar Localidad *  </option>
                            <option value="1">Bolivar</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                        <input type="password" id="password" class="form-control" placeholder="Contraseña *" required>
                    </div>
                    <input name="codigo" id="codigo" type="hidden" value={$codigo}>
                  </form>   
              </div>
              <div class="" id="">
                <div class="row" id="divContenedorRegisterRespuesta"></div>
              </div>
              <div class="form-group form-check">
                <input type="checkbox" class="form-check-input terminosCheck" id="exampleCheck1" required>
                <label class="form-check-label" for="exampleCheck1">Acepto los <a href="terminos" class="text-blue font-weight-bold" target="_blank">términos y condiciones</a></label>
              </div>
              <div class="row">
                <div class="col-md-12 pl-2 pr-2">
                  <button class="col-md-12 btn fondoAzul text-white" id="registerBtn" type="button" name="button">Empezar a usar TrashOut </button>
                </div>
              </div>
              <div class="row mt-1">
                <div class="mx-auto pb-3">
                  <a href="inicio" class="text-center textoAzul">Volver a inicio </a>
                </div>
              </div>
          </div>
        </div>
      </div>
    </div>  
  </div>




    <script src="js/jquery.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="js/register.js"></script>
  </body>
</html>