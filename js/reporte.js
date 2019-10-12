'use strict';

$(document).ready(function() {
    
    document.querySelectorAll(".verDenuncia").forEach(e=>{
        e.addEventListener("click", c=>{            
            let cual = e.getAttribute("data-id")
            location.replace("confirmacionDenuncia/"+cual+"/misReportes");
        });
        
    });

    
});


