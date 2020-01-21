'use strict';

$(document).ready(function() {
    document.querySelectorAll(".verDenuncia").forEach(e=>{
        e.addEventListener("click", c=>{            
            let cual = e.getAttribute("data-id")
            location.replace("confirmacionDenuncia/"+e+"/misReportes");
        });
    });
    
    let tabla = document.querySelector('.tabla');

    document.querySelectorAll('.filtroReportes').forEach(radio => {
        radio.addEventListener('click', radio => {
            if(radio.srcElement.value == 'finalizadas') {
                for (let i = 0, row; row = tabla.rows[i]; i++) {
                    if (row.cells[5].firstChild.innerHTML == 'Confirmar Recolección') {
                        row.setAttribute("hidden", true);
                    }
                    else {
                        row.removeAttribute('hidden');
                    }
                }
            }
            else if (radio.srcElement.value == 'todas') {
                for (let i = 0, row; row = tabla.rows[i]; i++) {
                    if (row.getAttribute("hidden")) {
                        row.removeAttribute("hidden");
                    }  
                }
            }
            else {
                for (let i = 0, row; row = tabla.rows[i]; i++) {
                    if (row.cells[5].firstChild.innerHTML != 'Confirmar Recolección') {
                        row.setAttribute("hidden", true);
                    }
                    else {
                        row.removeAttribute('hidden');
                    }
                }
            }
        });
    });


});