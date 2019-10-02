'use strict';

$(document).ready(function() {

    document.querySelector("#nombre").focus();

    document.querySelector('#registerBtn').addEventListener('click', register)

    function register(){
        let divContainer = document.querySelector('#divContenedorRegisterRespuesta');
        let datos = {};

        let e = document.querySelector("#localidad");
        let localidad = e.options[e.selectedIndex].value;

        datos.correo = document.querySelector('#correo').value;
        datos.nombre = document.querySelector('#nombre').value;
        datos.apellido = document.querySelector('#apellido').value;
        datos.dni = document.querySelector('#dni').value;
        datos.calle = document.querySelector('#calle').value;
        datos.numero = document.querySelector('#numero').value;
        datos.nroDep = document.querySelector('#nroDep').value;
        datos.piso = document.querySelector('#piso').value;
        datos.password = document.querySelector('#password').value;
        datos.localidad = localidad;
        $.ajax({
            type: 'POST',
            url: 'verifyRegister',
            data: datos,
            beforeSend: function () {
                divContainer.innerHTML = '<img src="./images/load.gif" class="mx-auto mb-1">';
            },
            complete: function (data) {
            },
            success: function (data) {
                if(data.indexOf('OK') > 0){
                    divContainer.innerHTML = '<div class="pl-3 pr-3 col-md-12"><div class="alert alert-success" role="alert">Se ha registrado con exito</div></div>';
                }
                else {
                    divContainer.innerHTML = '<div class="pl-3 pr-3 col-md-12"><div class="alert alert-danger" role="alert">Error al registrar usuario</div></div>';
                }
            },
            error: function (data) {
                alert("Problemas al tratar de enviar el formulario");
            }
        });
    }
});


