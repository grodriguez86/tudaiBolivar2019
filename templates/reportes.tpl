{include file="header.tpl" }
<div class="row fondoAzul">
    {if $nivel != 1 }
        <div class = "col-12 text-center">
            {* <span class="d-block p-2 bg-dark text-white">
                <h1>Denuncias {$denuncias}/5</h1>
            </span> *}
            <div class="shadow-lg p-3 mt-3 bg-white rounded"><h1>Denuncias {$denuncias}/5</h1></div>
        </div>
    {/if}
    <div class="col-12">
        <div class="container-fluid row mt-3 table-responsive">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Descripcion</th>
                        <th scope="col">Localidad</th>
                        <th scope="col">Ubicacion</th>
                        <th scope="col">Fecha de Denuncia</th>
                        <th scope="col">Fecha de Finalizacion</th>
                        <th scope="col">Ver</th>
                    </tr>
                </thead>
                <tbody class="bg-white">
                {if $nivel == 1 }
                    {foreach from=$reportes item=reporte}
                        <tr>
                            <td>{$reporte->iddenuncia}</td>
                            <td>{$reporte->descripcion}</td>
                            <td>{$reporte->idlocalidad}</td>
                            <td>{$reporte->ubicacion}</td>
                            <td>{$reporte->fecha_denuncia}</td>
                            {if $reporte->fecha_finalizacion == null}
                                <td class=""><a href="finalizarDenuncia/{$reporte->iddenuncia}">Confirmar Recolección</a></td>
                            {* agregado por seba *}
                            {else}
                                <td class="bg-success text-white">{$reporte->fecha_finalizacion}</td>                                                              
                            {/if}
                            <td><button type="button" data-id="{$reporte->iddenuncia}" class="btn btn-outline-info verDenuncia"><i class="fa fa-search"></i></button></td>                            
                        </tr>
                    {/foreach}
                {else}
                    {foreach from=$reportes item=reporte}
                        <tr>
                            <td>{$reporte->iddenuncia}</td>
                            <td>{$reporte->descripcion}</td>
                            <td>{$reporte->nombre}</td>
                            <td>{$reporte->ubicacion}</td>
                            <td>{$reporte->fecha_denuncia}</td>
                            {if $reporte->fecha_finalizacion == null}
                                <td class="bg-danger">{$reporte->fecha_finalizacion}</td>
                            {else}
                                <td class="bg-success text-white">{$reporte->fecha_finalizacion}</td>                                                                
                            {/if}
                            <td><button type="button" data-id="{$reporte->iddenuncia}" class="btn btn-outline-info verDenuncia"><i class="fa fa-search"></i></button></td>                            
                        </tr>
                    {/foreach}
                {/if}
                    
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="js/jquery.js" ></script>
<script src="js/reporte.js"></script>
{include file="footer.tpl" }