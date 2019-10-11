{include file="header.tpl" }
<div class="row homeCiudadano justify-content-center align-items-center">
    <div class="col-5">
        <div class="row elemento1Max justify-content-center align-items-center text-center text-white">
            <a class="btn" href="denunciaPunto">
                <div class="col-12">
                    <div class="row m-0 elemento2Max justify-content-center align-items-center text-center text-white">
                        <div class="col-4 divImagenBasura p-1">
                            <img src="images/basura.png" class="imagenBasura">
                        </div>
                        <div class="col-8">
                            <p class="h1">DENUNCIAR PUNTO <p class="h1 font-weight-bold">DE RESIDUO</p></p>
                        </div>
                    </div>
                </div>
            </a>
            <a class="btn" href="denunciaPersona">
                <div class="col-12">
                    <div class="row m-0 elemento2Max justify-content-center align-items-center text-center text-white">
                        <div class="col-3 divImagenBasura p-1">
                            <img src="images/persona.png" class="imagenBasura">
                        </div>
                        <div class="col-9">
                            <p class="h1">DENUNCIAR PERSONA <p class="h1 font-weight-bold">INFRAGANTI</p></p>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-7 divMapa">
        <div id="map" class="fondoMapa"></div>
    </div>
</div>
<script src="js/jquery.js" ></script>
<script type="text/javascript" src="https://maps.google.com/maps/api/js?key=AIzaSyB_OgTgi1I4tyucC11SUnopRVK4hQxwjLc"></script> 
<script src="js/denuncia.js" ></script>
{include file="footer.tpl" }