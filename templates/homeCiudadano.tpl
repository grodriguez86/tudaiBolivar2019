{include file="header.tpl" }
<div class="row homeCiudadano justify-content-center align-items-center">
    <div class="col-5 divForm">
        <div class="row elemento1Max justify-content-center align-items-center text-center text-white">
            <a class="btn btnDenunciaPunto" href="denunciaPunto">
                <div class="col-12">
                    <div class="row m-0 elemento2Max justify-content-center align-items-center text-center text-white">
                        <div class="col-4 divImagenBasura p-3">
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
                        <div class="col-4 divImagenBasura p-1">
                            <img src="images/persona.png" class="imagenBasura">
                        </div>
                        <div class="col-8">
                            <p class="h1">DENUNCIAR PERSONA <p class="h1 font-weight-bold">INFRAGANTI</p></p>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-7 h-100">
        <iframe class="fondoMapa" src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d12871.80405094321!2d-61.1374237302246!3d-36.24068395!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses!2sar!4v1570725842168!5m2!1ses!2sar"></iframe>
    </div>
</div>

<script src="js/jquery.js" ></script>
<script src="js/denunciaPunto.js"></script>
{include file="footer.tpl" }