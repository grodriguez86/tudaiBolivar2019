'use strict';

$(document).ready(function() {
    
    $.getScript("https://maps.googleapis.com/maps/api/js?key=AIzaSyB_OgTgi1I4tyucC11SUnopRVK4hQxwjLc", function() {
    
    
        if(navigator.geolocation)
        {
            console.log("Se cuenta con el soporte para geolocalización, entonces");
            navigator.geolocation.getCurrentPosition(onSuccessGeolocating,
                onErrorGeolocating,
                {
                    enableHighAccuracy: true,
                    maximumAge:         5000,
                    timeout:            10000
                });
        }
        else
        {
            console.log("No se cuenta con soporte para geolocalización, manejar la situación");
        }

        function onErrorGeolocating(error)
        {
            switch(error.code)
            {
                case error.PERMISSION_DENIED:
                    alert('ERROR: User denied access to track physical position!');
                break;

                case error.POSITION_UNAVAILABLE:
                    alert("ERROR: There is a problem getting the position of the device!");
                break;

                case error.TIMEOUT:
                    alert("ERROR: The application timed out trying to get the position of the device!");
                break;

                default:
                    alert("ERROR: Unknown problem!");
                break;
            }
        }

        function onSuccessGeolocating(position)
        {
            iniciarMap(position);
            // console.log(position);
            // let pos1 = position["coords"]["latitude"];
            // let pos2 = position["coords"]["longitude"];
            // let dire = "Viamonte%20543%2C%20B6550CPM%20San%20Carlos%20de%20Bolivar%2C%20Buenos%20Aires";
            // //document.querySelector("#map").innerHTML = '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3218.2892105313854!2d'+pos2+'!3d'+pos1+'!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95bfe33ec73e6c01%3A0x61c4335fc43ec66f!2sViamonte%20543%2C%20B6550CPM%20San%20Carlos%20de%20Bolivar%2C%20Buenos%20Aires!5e0!3m2!1ses-419!2sar!4v1570679008005!5m2!1ses-419!2sar" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>';
            // // con puntero <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3218.2892105313854!2d'+pos2+'!3d'+pos1+'!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95bfe33ec73e6c01%3A0x61c4335fc43ec66f!2s'+dire+'!5e0!3m2!1ses-419!2sar!4v1570679008005!5m2!1ses-419!2sar" width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
            // // sin puntero <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d12871.80405094321!2d-61.128668999999995!3d-36.24068395!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses-419!2sar!4v1570728288950!5m2!1ses-419!2sar" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
            // document.querySelector("#map").innerHTML = '<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d12871.80405094321!2d'+pos2+'!3d'+pos1+'!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses-419!2sar!4v1570728288950!5m2!1ses-419!2sar" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>';
        }

        function iniciarMap(position)
        {
            let pos1 = position["coords"]["latitude"];
            let pos2 = position["coords"]["longitude"];
            let coord = {lat: pos1 ,lng: pos2};
            document.querySelector("#inputLat").value = pos1;
            document.querySelector("#inputLon").value = pos2;
            console.log(pos1,pos2);
            var map = new google.maps.Map(document.getElementById('map'),{
                zoom: 15,
                center: coord
            });
            var marker = new google.maps.Marker({
                position: coord,
                map: map,
                title: "Ubicacion actual"
            });
            
        }

        function localizar(direccion) {
            var elemento = 'map';
            var geocoder = new google.maps.Geocoder();
            console.log(direccion);
            var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 16,
            scrollwheel: true,
            mapTypeId: google.maps.MapTypeId.ROADMAP
            });
            
            geocoder.geocode({'address': direccion}, function(results, status) {
            console.log(status);

                if (status === 'OK') {
                    var resultados = results[0].geometry.location,
                    resultados_lat = resultados.lat(),
                    resultados_long = resultados.lng();
                    document.querySelector("#inputLat").value = resultados_lat;
                    document.querySelector("#inputLon").value = resultados_long;
                    map.setCenter(results[0].geometry.location);
                    var marker = new google.maps.Marker({
                        map: map,
                        position: results[0].geometry.location,
                        title: direccion
                    });
                    // var markers = [
                    //     ['Basura 1, Bolivar', -36.240677999999996, -61.1286799],
                    //     ['Basura 2, Bolivar', -36.25, -61.1286799],
                    //     ['Basura 3, Bolivar', -36.26, -61.1286799]
                    // ];
                    // var bounds = new google.maps.LatLngBounds();
                    // for(var i = 0; i < markers.length; i++ ) {
                    //     var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
                        
                    //     bounds.extend(position);
                    //     marker = new google.maps.Marker({
                    //         position: position,
                    //         map: map,
                    //         title: markers[i][0]
                    //     });
                    //     // Center the map to fit all markers on the screen
                    //     map.fitBounds(bounds);
                    // }
                    
                } else {
                    var mensajeError = "";
                    if (status === "ZERO_RESULTS") {
                        mensajeError = "No hubo resultados para la dirección ingresada.";
                    } else if (status === "OVER_QUERY_LIMIT" || status === "REQUEST_DENIED" || status === "UNKNOWN_ERROR") {
                        mensajeError = "Error general del mapa.";
                    } else if (status === "INVALID_REQUEST") {
                        mensajeError = "Error de la web. Contacte con Name Agency.";
                    }
                    alert(mensajeError);
                }
            });
        }
        
        //document.querySelector("#btnEnviarPunto").disabled = true;
        $("#buscar").click(function() {
            var direccion = $("#direccion").val();

            if (direccion !== "") {
                localizar(direccion);
            }
        });
        // denuncia Punto
        $('.btnDenunciaPunto').click(function(e) {
            document.querySelector("#id01").style.display = "block";
        });

        $('#btnBuscarUbicacion').click(function(e) {
            var ubi = document.querySelector("#inputUbicacion").value;
            if(ubi!=""){
                localizar(ubi);            
            }
            else{
                $("#btnBuscarUbicacion").notify("Debe ingresar una ubicación o punto de interes, válido","error");
            }
        });
    });
    
});


