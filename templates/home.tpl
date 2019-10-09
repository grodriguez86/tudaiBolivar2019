{include file="header.tpl"}
    <div class="row align-items-center justify-content-center text-center fondo">
        <div class="col-12 col-sm-12 col-md-6 col-xl-6">
            <p class="text-white h1">MANTENE LIMPIA</p>
            <p class="text-white h1 font-weight-bold">NUESTRA CIUDAD</p>
        </div>
        <div class="col-0 col-sm-0 col-md-1 col-xl-1">
        </div>
        <div class="col-12 col-sm-12 col-md-4 col-xl-5">
            <div class="col colorTransparente p-3">
                <form action="register" method="POST">
                    <h3 class="text-white">Queres ser parte?</h3>
                    <h2 class="text-white">REGISTRATE</h2>
                    {* <div class="form-group">
                        <input type="input" class="form-control" name="usuario" placeholder="Escriba su usuario" required>
                    </div> *}
                    <div class="form-group">
                        <input type="email" class="form-control" name="correo" placeholder="Escriba su e-mail" required>
                    </div>
                    {if $error != ""}
                        <div class="alert alert-danger" role="alert">
                        {$error}
                        </div>
                    {/if}
                    <button type="submit" class="btn btn-primary">ENVIAR</button>
                </form>
            </div>
        </div>
    </div>
{include file="footer.tpl"}