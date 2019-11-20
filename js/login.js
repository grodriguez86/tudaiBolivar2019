'use strict';

$(document).ready(function() {

    document.querySelector("#email").focus();

    document.querySelector('#loginBtn').addEventListener('click', login);

    function login(){
        let divContainer = document.querySelector('#divContenedorRespuesta');

        let email = document.querySelector('#email').value;
        let contraseña = document.querySelector('#contraseña').value;

        if ((email != "") && (contraseña != "")) {
            $.ajax({
                type: 'POST',
                url: 'verificarLogin',
                data: {
                    'email' : email,
                    'contraseña' : contraseña
                },
                beforeSend: function () {
                    divContainer.innerHTML = '<img src="./images/load.gif" class="mx-auto mb-1">';
                },
                success: function (data) {
                    if(data.indexOf('OK') > 0){
                        location.replace("inicio");
                    }
                    else {
                        divContainer.innerHTML = '<div class="pl-3 pr-3 col-md-12"><div class="alert alert-danger" role="alert">Usuario y/o contraseña incorrectos</div></div>';
                    }
                },
                error: function (data) {
                    alert("Problemas al tratar de enviar el formulario");
                }
            });
        }
        else {
            divContainer.innerHTML = '<div class="pl-3 pr-3 col-md-12"><div class="alert alert-danger" role="alert">Debe completar todos los campos</div></div>';
        }
    }
});


