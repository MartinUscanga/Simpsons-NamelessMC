{include file='header.tpl'}

<div class="container mt-5">
    <div class="text-center py-5">
        
        <!-- Imagen de error estilo Simpson -->
        <div class="mb-4">
            <h1 style="font-size: 10rem; color: var(--simpson-yellow); text-shadow: 5px 5px 0px var(--simpson-orange), 10px 10px 0px rgba(0,0,0,0.3); font-weight: 700; line-height: 1;">
                404
            </h1>
        </div>
        
        <!-- Mensaje de error -->
        <div class="card d-inline-block" style="max-width: 600px;">
            <div class="card-body p-5">
                <h2 class="mb-4" style="color: var(--simpson-blue); font-weight: 700;">
                    ¡D'oh! Página no encontrada
                </h2>
                
                <p class="lead mb-4" style="font-weight: 600;">
                    La página que buscas no existe o ha sido movida. 
                    ¡Homer probablemente se la comió pensando que era una dona!
                </p>
                
                <div class="mb-4">
                    <img src="{$TEMPLATE.path}img/homer-donut.gif" alt="Homer comiendo dona" style="max-width: 200px; border: 4px solid var(--simpson-dark); border-radius: 15px;">
                </div>
                
                <div class="d-flex justify-content-center gap-3 flex-wrap">
                    <a href="{$SITE_HOME}" class="btn btn-primary btn-lg">
                        <i class="fas fa-home"></i> Volver al Inicio
                    </a>
                    <a href="{$FORUM_URL}" class="btn btn-success btn-lg">
                        <i class="fas fa-comments"></i> Ir al Foro
                    </a>
                    <a href="javascript:history.back()" class="btn btn-warning btn-lg">
                        <i class="fas fa-arrow-left"></i> Página Anterior
                    </a>
                </div>
            </div>
        </div>
        
        <!-- Mensaje adicional -->
        <div class="mt-4">
            <p class="text-muted" style="font-style: italic; font-weight: 600;">
                "La vida es como una dona gigante... a veces te pierdes en el agujero" - Homer Simpson
            </p>
        </div>
        
    </div>
</div>

{include file='footer.tpl'}
