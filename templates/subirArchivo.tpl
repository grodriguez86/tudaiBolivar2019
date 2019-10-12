{include file="header.tpl" }

<div class="container-fluid">
    <div class="card bg-dark text-center text-white mb-1">
        <h1 class="font-weight-normal">Subir archivo - {$tabla}<span id="clase"></span></h1>
        <a href="{$pagina}"><button class="btn btn-outline-light my-2 my-sm-0 ml-2" type="button">VOLVER</button></a>
    </div>
    <div class="card text-center">        
            <h3>Ref: {$registro->iddenuncia} - {$registro->descripcion}</h3>
        <div class="card-body colorTablaClara">
            <div class="row mt-2">
                <div class="col-md-8">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            {foreach from=$losArchivos item=archivo key=key}
                                {if $archivo != "." and $archivo != ".."}
                                    <li data-target="#carouselExampleIndicators" data-slide-to="{$key}" class="active"></li>                            
                                {/if}
                            {/foreach}                    
                        </ol>
                        <div class="carousel-inner">                            
                            {foreach from=$losArchivos item=archivo key=key}
                                {if $archivo != "." and $archivo != ".."} 
                                    {if ($archivo=="foto.jpg")} 
                                        {assign var="predeterminado" value=" active"}                                                              
                                    {else}                                
                                        {assign var="predeterminado" value=""}                                       
                                    {/if}         
                                    <div class="carousel-item{$predeterminado}">                                                          
                                        {if ($archivo!="foto.jpg")}
                                            <div class="w3-display-topmiddle w3-black w3-padding">
                                                <div class="btn-group" role="group" aria-label="Basic example">                                    
                                                    <button class="btn btn-outline-light btnPredeterminar" data-arc="predeterminarArchivo/{$tabla}/{$id}/{$archivo}">Activar</button>                                            
                                                    <button class="btn btn-outline-light btnBorrar" data-arc="borrarArchivo/{$tabla}/{$id}/{$archivo}">Borrar</button>
                                                </div>
                                            </div>    
                                        {else} 
                                            {if count($losArchivos)==3}
                                                <div class="w3-display-topmiddle w3-black w3-padding">
                                                    <div class="btn-group" role="group" aria-label="Basic example">                                    
                                                        <button class="btn btn-outline-light btnBorrar" data-arc="borrarArchivo/{$tabla}/{$id}/{$archivo}">Borrar</button>                                                
                                                    </div>
                                                </div>
                                            {/if}
                                        {/if}                                                 
                                        <img class="d-block w-100" src="images/documentos/{$tabla}/{$id}/{$archivo}" alt="{$archivo}">
                                    </div>                                                
                                {/if}
                            {/foreach}                                        
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">   
                    <div class="input-group">                                    
                        <div class="action mt-1">
                            <form action="upload/{$tabla}/{$id}" method="post" enctype="multipart/form-data">                                
                                <input type="file" class="btn  btn-outline-secondary" name="fileToUpload" id="fileToUpload">
                                <input type="submit" class="btn btn-lg btn-outline-info mt-2" value="Subir Imagen" name="submit">
                            </form>
                            {if !empty($mensaje) }
                                <div class="alert alert-primary mt-2" role="alert"><i class="fa fa-check-circle" aria-hidden="true"></i>
                                {$mensaje} <a href=""></a></div>
                            {/if}
                        </div>
                    </div>            
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery.js"></script>
<script src="js/subirImagen.js"></script>
<script src="js/bootstrap.min.js"></script>

</body>
</html>