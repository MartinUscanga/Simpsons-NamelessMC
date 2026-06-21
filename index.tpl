{include file='header.tpl'}

<!-- Contenedor principal -->
<div class="container mt-4">
    
    <!-- Banner de bienvenida estilo Springfield -->
    <div class="card mb-4" style="background: linear-gradient(135deg, var(--simpson-yellow) 0%, var(--simpson-orange) 50%, var(--simpson-blue) 100%); border: 5px solid var(--simpson-dark);">
        <div class="card-body text-center py-5">
            <h1 class="display-3" style="color: var(--simpson-white); text-shadow: 4px 4px 0px rgba(0, 0, 0, 0.5); font-weight: 700;">
                ¡Bienvenido a {$SITE_NAME}!
            </h1>
            <p class="lead" style="color: var(--simpson-white); text-shadow: 2px 2px 0px rgba(0, 0, 0, 0.3); font-weight: 600; font-size: 1.5rem;">
                {if isset($SITE_DESCRIPTION)}
                    {$SITE_DESCRIPTION}
                {else}
                    Un servidor de Minecraft estilo Springfield donde la diversión nunca termina
                {/if}
            </p>
            {if isset($MINECRAFT_SERVER_IP)}
                <div class="mt-4">
                    <span class="badge badge-lg" style="background: var(--simpson-green); font-size: 1.5rem; padding: 1rem 2rem;">
                        <i class="fas fa-server"></i> IP: {$MINECRAFT_SERVER_IP}
                    </span>
                </div>
            {/if}
        </div>
    </div>
    
    <div class="row">
        <!-- Columna principal -->
        <div class="col-lg-8">
            
            <!-- Últimas noticias/anuncios -->
            {if isset($NEWS)}
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-newspaper"></i> Últimas Noticias
                    </div>
                    <div class="card-body">
                        {foreach from=$NEWS item=article}
                            <div class="mb-4 pb-3" style="border-bottom: 2px dashed var(--simpson-blue);">
                                <h3 class="mb-2">
                                    <a href="{$article.link}" style="color: var(--simpson-blue); text-decoration: none; font-weight: 700;">
                                        {$article.title}
                                    </a>
                                </h3>
                                <div class="text-muted mb-2" style="font-weight: 600;">
                                    <i class="fas fa-user"></i> {$article.author} 
                                    <span class="mx-2">|</span>
                                    <i class="fas fa-clock"></i> {$article.date}
                                </div>
                                <p>{$article.content}</p>
                                <a href="{$article.link}" class="btn btn-primary btn-sm">
                                    Leer más <i class="fas fa-arrow-right"></i>
                                </a>
                            </div>
                        {/foreach}
                    </div>
                </div>
            {/if}
            
            <!-- Últimos temas del foro -->
            {if isset($LATEST_TOPICS)}
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-comments"></i> Últimos Temas del Foro
                    </div>
                    <div class="card-body">
                        {foreach from=$LATEST_TOPICS item=topic}
                            <div class="forum-topic">
                                <div class="d-flex justify-content-between align-items-start">
                                    <div class="flex-grow-1">
                                        <h5 class="mb-1">
                                            <a href="{$topic.link}" style="color: var(--simpson-dark); text-decoration: none; font-weight: 700;">
                                                {$topic.title}
                                            </a>
                                        </h5>
                                        <small class="text-muted">
                                            <i class="fas fa-user"></i> {$topic.author}
                                            <span class="mx-2">|</span>
                                            <i class="fas fa-clock"></i> {$topic.date}
                                        </small>
                                    </div>
                                    <div>
                                        <span class="badge badge-primary">
                                            <i class="fas fa-comments"></i> {$topic.replies}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                    <div class="card-footer text-center">
                        <a href="{$FORUM_URL}" class="btn btn-primary">
                            Ver todos los temas <i class="fas fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
            {/if}
            
        </div>
        
        <!-- Sidebar -->
        <div class="col-lg-4">
            
            <!-- Estado del servidor -->
            {if isset($SERVER_STATUS)}
                <div class="widget mb-4">
                    <div class="widget-header">
                        <i class="fas fa-server"></i> Estado del Servidor
                    </div>
                    <div class="text-center py-3">
                        {if $SERVER_STATUS.online}
                            <div class="mb-3">
                                <span class="badge" style="background: var(--simpson-green); font-size: 1.5rem; padding: 1rem;">
                                    <i class="fas fa-circle"></i> EN LÍNEA
                                </span>
                            </div>
                            <h4 style="color: var(--simpson-blue); font-weight: 700;">
                                <i class="fas fa-users"></i> {$SERVER_STATUS.players}/{$SERVER_STATUS.max_players}
                            </h4>
                            <p class="mb-0" style="font-weight: 600;">Jugadores conectados</p>
                        {else}
                            <div class="mb-3">
                                <span class="badge" style="background: var(--simpson-red); font-size: 1.5rem; padding: 1rem;">
                                    <i class="fas fa-circle"></i> FUERA DE LÍNEA
                                </span>
                            </div>
                        {/if}
                    </div>
                </div>
            {/if}
            
            <!-- Usuarios en línea -->
            {if isset($ONLINE_USERS)}
                <div class="widget mb-4">
                    <div class="widget-header">
                        <i class="fas fa-users"></i> Usuarios en línea ({$ONLINE_USERS_COUNT})
                    </div>
                    <div class="py-2">
                        {foreach from=$ONLINE_USERS item=user}
                            <div class="d-flex align-items-center mb-2 p-2" style="background: var(--simpson-light); border-radius: 10px;">
                                <img src="{$user.avatar}" alt="{$user.username}" class="rounded-circle me-2" style="width: 32px; height: 32px; border: 2px solid var(--simpson-dark);">
                                <a href="{$user.profile}" style="color: var(--simpson-dark); text-decoration: none; font-weight: 600;">
                                    {$user.username}
                                </a>
                            </div>
                        {/foreach}
                    </div>
                </div>
            {/if}
            
            <!-- Discord Widget (si está disponible) -->
            {if isset($DISCORD_WIDGET)}
                <div class="widget mb-4">
                    <div class="widget-header">
                        <i class="fab fa-discord"></i> Únete a Discord
                    </div>
                    <div class="text-center py-3">
                        {$DISCORD_WIDGET}
                        <a href="{$DISCORD_LINK}" target="_blank" class="btn btn-primary mt-3" style="background: #7289da;">
                            <i class="fab fa-discord"></i> Unirse ahora
                        </a>
                    </div>
                </div>
            {/if}
            
            <!-- Estadísticas generales -->
            <div class="widget mb-4">
                <div class="widget-header">
                    <i class="fas fa-chart-bar"></i> Estadísticas
                </div>
                <div class="py-2">
                    {if isset($STATISTICS)}
                        <div class="d-flex justify-content-between mb-3 p-2" style="background: var(--simpson-yellow); border-radius: 10px;">
                            <span><i class="fas fa-users"></i> Usuarios totales:</span>
                            <strong style="color: var(--simpson-blue);">{$STATISTICS.users}</strong>
                        </div>
                        <div class="d-flex justify-content-between mb-3 p-2" style="background: var(--simpson-blue); color: white; border-radius: 10px;">
                            <span><i class="fas fa-comments"></i> Mensajes:</span>
                            <strong>{$STATISTICS.posts}</strong>
                        </div>
                        <div class="d-flex justify-content-between p-2" style="background: var(--simpson-green); color: white; border-radius: 10px;">
                            <span><i class="fas fa-user-plus"></i> Último usuario:</span>
                            <strong>{$STATISTICS.latest_user}</strong>
                        </div>
                    {/if}
                </div>
            </div>
            
            <!-- Widget personalizado -->
            {if isset($WIDGETS_RIGHT)}
                {foreach from=$WIDGETS_RIGHT item=widget}
                    {$widget}
                {/foreach}
            {/if}
            
        </div>
    </div>
    
</div>

{include file='footer.tpl'}
