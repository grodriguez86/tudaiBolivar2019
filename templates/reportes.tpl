{include file="header.tpl" }
<div class="row fondoAzul">
    <div class="col-12">
        <div class="container-fluid row mt-5 table-responsive">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Descripcion</th>
                        <th scope="col">Calle</th>
                        <th scope="col">Numero</th>
                        <th scope="col">Localidad</th>
                        <th scope="col">Fecha de Denuncia</th>
                        <th scope="col">Fecha de Finalizacion</th>
                    </tr>
                </thead>
                <tbody class="bg-white">
                    {foreach from=$reportes item=reporte}
                        <tr>
                            <td>{$reporte->iddenuncia}</td>
                            <td>{$reporte->descripcion}</td>
                            <td>{$reporte->calle}</td>
                            <td>{$reporte->numero}</td>
                            <td>{$reporte->idlocalidad}</td>
                            <td>{$reporte->fecha_denuncia}</td>
                            {if $reporte->fecha_finalizacion == null}
                                <td class="bg-danger">{$reporte->fecha_finalizacion}</td>
                            {else}
                                <td class="bg-success text-white">{$reporte->fecha_finalizacion}</td>                                                                
                            {/if}
                            
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </div>
</div>
{include file="footer.tpl" }