{include file="header.tpl" }
<div class="row homeCiudadano justify-content-center align-items-center">
    <div class="col-md-12 divForm">
        <div class="card p-2 bg-dark text-white formDenunciaPunto">
            <div class="card-header bg-dark font-weight-bold text-center text-uppercase">
            {if $tipoDenuncia eq 'punto'}
                Denunciar punto con basura
            {elseif $tipoDenuncia eq 'persona'}
                Denunciar persona tirando basura
            {/if}
            </div>
            <div class="col-12">
                <div id="map" class="fondoMapa">
                </div>
            </div>
            <div class="card-body bg-secondary">
                <form action="grabarDenunciaPunto" method="post" enctype="multipart/form-data">                                
                    <div class="form-group">
                        <input type="hidden" class="form-control" id="inputLat" name="inputLat">
                        <input type="hidden" class="form-control" id="inputLon" name="inputLon">
                        <label for="exampleInputPassword1" class="font-weight-bold">Ubicación o punto de interes</label>
                        <input type="text" class="form-control" id="inputUbicacion" name="inputUbicacion" placeholder="Dirección">
                        <button type="button" class="btn btn-primary btn-block mt-2" id="btnBuscarUbicacion">Buscar Ubicacion<i class="fa fa-search"></i></button>
                    </div>
                    <hr>
                    <div class="form-group">
                        <label for="exampleFormControlFile1" class="font-weight-bold">
                        {if $tipoDenuncia eq 'punto'}
                            Adjuntar imagen de la basura
                        {elseif $tipoDenuncia eq 'persona'}
                            Adjuntar video
                        {/if}
                        </label>
                        {if $tipoDenuncia eq 'punto'}
                            <input type="file" class="form-control-file btn  btn-outline-secondary" name="fileToUpload" id="fileToUpload" required>
                        {elseif $tipoDenuncia eq 'persona'}
                            <input type="file" accept="video/*" class="form-control-file btn btn-outline-secondary" name="fileToUpload" id="fileToUpload" required>
                        {/if}
                    </div>
                    <hr>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1" required>
                        <label class="form-check-label" for="exampleCheck1">Acepto los <a href="terminos" class="text-white font-weight-bold">términos y condiciones</a></label>
                    </div>
                    <button id="btnEnviarPunto" type="submit" class="btn btn-primary">Enviar</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="js/notify.js"></script>
<script src="js/subirImagen.js"></script>
<script src="js/bootstrap.min.js"></script><script src="js/denunciaPunto.js"></script>