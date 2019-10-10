'use strict';

$(document).ready(function() {
    
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
        console.log(position);
        let pos1 = position["coords"]["latitude"];
        let pos2 = position["coords"]["longitude"];
        let dire = "Viamonte%20543%2C%20B6550CPM%20San%20Carlos%20de%20Bolivar%2C%20Buenos%20Aires";
        //document.querySelector("#map").innerHTML = '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3218.2892105313854!2d'+pos2+'!3d'+pos1+'!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95bfe33ec73e6c01%3A0x61c4335fc43ec66f!2sViamonte%20543%2C%20B6550CPM%20San%20Carlos%20de%20Bolivar%2C%20Buenos%20Aires!5e0!3m2!1ses-419!2sar!4v1570679008005!5m2!1ses-419!2sar" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>';

        document.querySelector("#map").innerHTML = '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3218.2892105313854!2d'+pos2+'!3d'+pos1+'!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95bfe33ec73e6c01%3A0x61c4335fc43ec66f!2s'+dire+'!5e0!3m2!1ses-419!2sar!4v1570679008005!5m2!1ses-419!2sar" width="300" height="250" frameborder="0" style="border:0;" allowfullscreen=""></iframe>';
    }


});


