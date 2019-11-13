{include file="header.tpl" }
<div class="row homeCiudadano justify-content-center align-items-center">
    <div class="col col-md-6 col-xl-5 divForm">
        <div class="row elemento1Max justify-content-center align-items-center text-center text-white">
            {if $denuncias >= 5}
                <div class="alert alert-warning" role="alert">
                    <h4 class="alert-heading">LIMITE DE DENUNCIAS!</h4>
                    <p>No se permiten hacer mas de {$denuncias} denuncias simultaneas.</p>
                    <hr>
                    <p class="mb-0">Hasta que en la cuadrilla no realice uno de sus tramites, no podra hacer mas denuncias.</p>
                </div>
            {else}
            <a class="btn btnDenunciaPunto" href="denunciaPunto">
                <div class="col-12">
                    <div class="row m-0 elemento2Max justify-content-center align-items-center text-center text-white">
                        <div class="col-3 col-xl-4 divImagenBasura p-3">
                            <img src="images/basura.png" class="imagenBasura">
                        </div>
                        <div class="col-9 col-xl-8">
                            <p class="titulo">DENUNCIAR PUNTO <p class="titulo font-weight-bold">DE RESIDUO</p>
                            </p>
                        </div>
                    </div>
                </div>
            </a>
            <a class="btn" href="denunciaPersona">
                <div class="col-12">
                    <div class="row m-0 elemento2Max justify-content-center align-items-center text-center text-white">
                        <div class="col-2 col-xl-2 divImagenBasura2 p-1">
                            <img src="images/persona.png" class="imagenBasura">
                        </div>
                        <div class="col-10 col-xl-10">
                            <p class="titulo">DENUNCIAR PERSONA <p class="titulo font-weight-bold">INFRAGANTI</p>
                            </p>
                        </div>
                    </div>
                </div>
            </a>
            {/if}
        </div>
    </div>
    
</div>
<script src="js/jquery.js"></script>
<script src="js/denuncia.js"></script>
