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
                <button id="my_location">Find Me</button>
                <div id="map"></div>
            </div>
          </div>
        </div>
      </div>  
    </div>
    <script src="js/jquery.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://maps.google.com/maps/api/js?key=AIzaSyB_OgTgi1I4tyucC11SUnopRVK4hQxwjLc"></script> 
    <script src="js/denuncia.js" ></script>
    
  </body>
</html>