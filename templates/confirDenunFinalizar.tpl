{include file="header.tpl" }
<div class="row homeCiudadano justify-content-center align-items-center">
    <div class="col-md-12 divForm">
        <div class="card p-2 bg-dark text-white formDenunciaPunto">
            <div class="card-header bg-dark font-weight-bold text-center text-uppercase">Datos denuncia</div>
            <div class="card-body bg-secondary">
                <form action="finalizarDenunciaPunto" method="post" enctype="multipart/form-data">                                
                    <div class="row">
                        <div class="col-12 col-md-4 col-xl-4">
                            <div class="form-group">
                                <label for="exampleInputPassword1" class="font-weight-bold">Responsable: {$ciudadano}</label>                        
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1" class="font-weight-bold">Número: {$registro->iddenuncia}</label> 
                                <input type="hidden" class="form-control" id="denunciaid" name="denunciaid" value={$registro->iddenuncia}>                       
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1" class="font-weight-bold">Ubicacion: <span id="ubicacion">{$registro->ubicacion}</span></label>                        
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1" class="font-weight-bold">Latitud: <span id="latitud">{$registro->latitud}</span></label>                        
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1" class="font-weight-bold">Longitud: <span id="longitud">{$registro->longitud}</span></label>                        
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1" class="font-weight-bold">Fecha: {$registro->fecha_denuncia}</label>                        
                            </div>
                            <div class="form-group">
                                <label>Fecha Finalizacion: </label>
                                <input type="date" name="fechafin" class="font-weight-bold">                        
                            </div>
                        </div>                    
                        <div class="col-12 col-md-4 col-xl-3">
                            <div class="card">
                                <img src="images/denuncia/{$registro->iddenuncia}/foto.jpg" class="card-img-top" alt="...">
                                {* <div class="card-body">
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div> *}
                            </div>
                            {if $registro->fecha_finalizacion != null}
                                <div class="card">
                                    <img src="images/denuncia/{$registro->iddenuncia}/foto1.jpg" class="card-img-top" alt="...">
                                    {* <div class="card-body">
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    </div> *}
                                </div>
                            {/if}
                        </div>
                        <div class="col-12 col-md-4 col-xl-5">
                            <div id="map" class="fondoMapa"></div>
                        </div>
                    </div>
                    <div class="col-12 col-xl-12">
                        <div class="form-group">
                            <label for="exampleFormControlFile1" class="font-weight-bold">Adjuntar imagen de la basura</label>
                            <input type="file" class="form-control-file btn  btn-outline-secondary" name="fileToUpload" id="fileToUpload" required>
                        </div>
                    </div>
                    <div class="col-12 col-xl-12">
                        {* <a href="misReportes" type="submit" class="btn btn-primary">Volver</a> *}
                        {* <button id="btnConfDenuncia" type="submit" class="btn btn-primary">Finalizar Denuncia</button> *}
                        <button type="submit" class="btn btn-primary">Finalizar Denuncia</button>
                    </div>
                </form>
                <div class="col-12 col-xl-12 mt-2">
                    <a href="misReportes" type="submit" class="btn btn-primary btn-block">Volver a mis reportes</a>
                </div>

            </div>
        </div>
    </div>
</div>
<script src="js/jquery.js" ></script>
<script src="js/subirImagen.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
{* <script src="js/verDenuncia.js" ></script> *}
