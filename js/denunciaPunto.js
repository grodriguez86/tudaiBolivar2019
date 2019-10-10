'use strict';

$(document).ready(function() {
    $('.btnDenunciaPunto').click(function(e) {
        e.preventDefault();
        let divForm = document.querySelector('.divForm');

        divForm.innerHTML = `
                            <div class="card p-2 bg-dark text-white formDenunciaPunto">
                                <div class="card-header bg-dark font-weight-bold text-center text-uppercase">Denunciar punto con basura</div>
                                <div class="card-body bg-secondary">
                                    <form action="grabarDenunciaPunto" methos="POST">
                                        <div class="form-group">
                                            <label for="exampleInputPassword1" class="font-weight-bold">Direccion de calle (con número)</label>
                                            <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Dirección">
                                        </div>
                                        <hr>
                                        <div class="form-group">
                                            <label for="exampleFormControlFile1" class="font-weight-bold">Adjuntar imagen de la basura</label>
                                            <input type="file" class="form-control-file" id="exampleFormControlFile1">
                                        </div>
                                        <hr>
                                        <div class="form-group form-check">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">Acepto los términos y condiciones</label>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Enviar</button>
                                    </form>   
                                </div>
                            </div>
                            `;
    });
});


