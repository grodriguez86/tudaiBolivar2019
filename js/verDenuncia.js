'use strict';

$(document).ready(function() {
    
    $.getScript("https://maps.googleapis.com/maps/api/js?key=AIzaSyB_OgTgi1I4tyucC11SUnopRVK4hQxwjLc", function() {
    
    
        function iniciarMap()
        {
            let pos1 = parseFloat(document.querySelector("#latitud").innerHTML);
            let pos2 = parseFloat(document.querySelector("#longitud").innerHTML);
            let ubi = document.querySelector("#ubicacion").innerHTML;
            let coord = {lat: pos1 ,lng: pos2};
            console.log(pos1);
            console.log(pos2);
            var map = new google.maps.Map(document.getElementById('map'),{
                zoom: 15,
                center: coord
            });
            var marker = new google.maps.Marker({
                position: coord,
                map: map,
                title: ubi
            });           
            
        }

        iniciarMap();

    });
    
});


