{include file="header.tpl" }
<div class="row homeCiudadano justify-content-center align-items-center">
    <div class="col-md-12 divForm">
        <div class="card p-2 bg-dark text-white formDenunciaPunto">
            <div class="card-header bg-dark font-weight-bold text-center text-uppercase">Datos denuncia</div>
            <div class="card-body bg-secondary">
                <form action="{$pagina}" method="post" enctype="multipart/form-data">                                
                    <div class="row">
                        <div class="col-12 col-md-4 col-xl-4">
                            {* <div class="col-md-6">                     *}
                                {if $nivel == 1}
                                    <div class="form-group">
                                        <label for="exampleInputPassword1" class="font-weight-bold">Responsable: {$ciudadano}</label>                        
                                    </div>
                                {else}
                                    <div class="form-group">
                                        <label for="exampleInputPassword1" class="font-weight-bold">Ciudadano: {$ciudadano}</label>                        
                                    </div>
                                {/if}
                                <div class="form-group">
                                    <label for="exampleInputPassword1" class="font-weight-bold">Número: {$registro->iddenuncia}</label>                        
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1" class="font-weight-bold">Tipo: {$registro->descripcion}</label>                        
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
                                        <label for="exampleInputPassword1" class="font-weight-bold">Fecha Finalizacion: {$registro->fecha_finalizacion}</label>                        
                                </div>
                            {* </div> *}
                        </div>
                        <div class="col-12 col-md-4 col-xl-3">
                            <div class="card mb-1">
                                {if $registro->descripcion eq 'punto'}
                                <img src="images/denuncia/{$registro->iddenuncia}/foto.jpg" class="card-img-top" alt="...">
                                {else}
                                    <video src="images/denuncia/{$registro->iddenuncia}/video.mp4" type="video/mp4" height="240" controls></video>                                    
                                {/if}
                            
                            {* <div class="card-body">
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div> *}
                            </div>
                            {* <div class="col-md-12">
                                <img src="images/denuncia/{$registro->iddenuncia}/foto.jpg" class="col-md-12 ">
                            </div> *}
                            {if $registro->fecha_finalizacion != null}
                                <div class="card">
                                    <img src="images/denuncia/{$registro->iddenuncia}/foto1.jpg" class="card-img-top" alt="...">
                                {* <div class="card-body">
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    </div> *}
                                </div>
                                {* <div class="col-md-12 mt-2">
                                    <img src="images/denuncia/{$registro->iddenuncia}/foto1.jpg" class="col-md-12 ">
                                </div> *}
                            {/if}
                        </div>
                        <div class="col-12 col-md-4 col-xl-5">
                            <div id="map" class="fondoMapa"></div>
                        </div>  
                    </div>
                    {* <button id="btnEnviarPunto" type="submit" class="btn btn-primary">Volver</button> *}
                </form>
                <div class="col col-xl-12 mt-2">
                    <a href="misReportes" type="submit" class="btn btn-primary btn-block">Volver a mis reportes</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="js/verDenuncia.js" ></script>
