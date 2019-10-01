{include file="header.tpl"}


    <div class="col-6 col-lg-5 mt-5">
        <div class="mt-5"></div>
        <div class="card px-2 py-2">
            <form action="verificarLogin" method="POST">
                <div class="form-group">
                <label for="Email">Email</label>
                <input type="email" class="form-control" name="email" placeholder="Introduzca su dirección de correo electrónico" required>
                </div>
                <div class="form-group">
                <label for="exampleInputPassword1">Contraseña</label>
                <input type="password" class="form-control" name="contraseña" placeholder="Introduza su contraseña" required>
                </div>
                <button type="submit" class="btn btn-primary">Logearse</button>
            </form>
            {if !empty($error) }
                <div class="alert alert-danger mt-2" role="alert">{$error}</div>
            {/if}  
        </div>            
    </div>

{include file="footer.tpl"}
