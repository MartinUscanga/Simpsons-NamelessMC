{include file='header.tpl'}

<div class="container mt-4">
    
    <!-- Header del foro -->
    <div class="card mb-4">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h2 class="mb-0"><i class="fas fa-comments"></i> {$FORUM_TITLE}</h2>
            {if isset($NEW_TOPIC_BUTTON)}
                <a href="{$NEW_TOPIC_URL}" class="btn btn-success">
                    <i class="fas fa-plus"></i> {$NEW_TOPIC}
                </a>
            {/if}
        </div>
    </div>
    
    <!-- Categorías del foro -->
    {foreach from=$FORUM_CATEGORIES item=category}
        <div class="forum-category mb-4">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h3 style="color: var(--simpson-dark); font-weight: 700;">
                    <i class="{$category.icon}"></i> {$category.name}
                </h3>
            </div>
            
            {if isset($category.description)}
                <p class="mb-3" style="color: var(--simpson-dark); font-weight: 600;">{$category.description}</p>
            {/if}
            
            <!-- Subforos -->
            {foreach from=$category.subforums item=forum}
                <div class="forum-topic">
                    <div class="row align-items-center">
                        <!-- Icono -->
                        <div class="col-auto">
                            <div class="text-center" style="width: 50px; height: 50px; background: var(--simpson-yellow); border: 3px solid var(--simpson-dark); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
                                <i class="{$forum.icon}" style="font-size: 1.5rem; color: var(--simpson-blue);"></i>
                            </div>
                        </div>
                        
                        <!-- Info del foro -->
                        <div class="col">
                            <h5 class="mb-1">
                                <a href="{$forum.link}" style="color: var(--simpson-blue); text-decoration: none; font-weight: 700;">
                                    {$forum.name}
                                </a>
                            </h5>
                            <p class="mb-0 text-muted">{$forum.description}</p>
                        </div>
                        
                        <!-- Estadísticas -->
                        <div class="col-auto text-center d-none d-md-block">
                            <div class="mb-1">
                                <span class="badge" style="background: var(--simpson-blue);">
                                    <i class="fas fa-file-alt"></i> {$forum.topics}
                                </span>
                            </div>
                            <div>
                                <span class="badge" style="background: var(--simpson-green);">
                                    <i class="fas fa-comments"></i> {$forum.posts}
                                </span>
                            </div>
                        </div>
                        
                        <!-- Último mensaje -->
                        {if isset($forum.last_post)}
                            <div class="col-md-3 d-none d-md-block">
                                <div style="background: var(--simpson-light); padding: 0.75rem; border-radius: 10px;">
                                    <small class="d-block">
                                        <strong><a href="{$forum.last_post.link}" style="color: var(--simpson-dark);">{$forum.last_post.title}</a></strong>
                                    </small>
                                    <small class="text-muted">
                                        Por <a href="{$forum.last_post.author_profile}">{$forum.last_post.author}</a><br>
                                        {$forum.last_post.time}
                                    </small>
                                </div>
                            </div>
                        {/if}
                    </div>
                </div>
            {/foreach}
        </div>
    {/foreach}
    
    <!-- Usuarios en línea -->
    {if isset($ONLINE_USERS)}
        <div class="card mt-4">
            <div class="card-header">
                <i class="fas fa-users"></i> ¿Quién está en línea? ({$ONLINE_USERS_COUNT} usuarios)
            </div>
            <div class="card-body">
                {foreach from=$ONLINE_USERS item=user}
                    <a href="{$user.profile}" class="d-inline-block me-2 mb-2">
                        <img src="{$user.avatar}" alt="{$user.username}" class="rounded-circle" style="width: 32px; height: 32px; border: 2px solid var(--simpson-dark);" title="{$user.username}">
                    </a>
                {/foreach}
            </div>
        </div>
    {/if}
    
    <!-- Estadísticas del foro -->
    {if isset($FORUM_STATISTICS)}
        <div class="card mt-4">
            <div class="card-header">
                <i class="fas fa-chart-bar"></i> Estadísticas del Foro
            </div>
            <div class="card-body">
                <div class="row text-center">
                    <div class="col-md-3">
                        <div class="p-3" style="background: var(--simpson-yellow); border: 3px solid var(--simpson-dark); border-radius: 15px;">
                            <h3 style="color: var(--simpson-blue); font-weight: 700;">{$FORUM_STATISTICS.topics}</h3>
                            <p class="mb-0"><strong>Temas</strong></p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="p-3" style="background: var(--simpson-blue); border: 3px solid var(--simpson-dark); border-radius: 15px; color: white;">
                            <h3 style="font-weight: 700;">{$FORUM_STATISTICS.posts}</h3>
                            <p class="mb-0"><strong>Mensajes</strong></p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="p-3" style="background: var(--simpson-green); border: 3px solid var(--simpson-dark); border-radius: 15px; color: white;">
                            <h3 style="font-weight: 700;">{$FORUM_STATISTICS.users}</h3>
                            <p class="mb-0"><strong>Usuarios</strong></p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="p-3" style="background: var(--simpson-orange); border: 3px solid var(--simpson-dark); border-radius: 15px; color: white;">
                            <h3 style="font-weight: 700;">{$FORUM_STATISTICS.online}</h3>
                            <p class="mb-0"><strong>En Línea</strong></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    {/if}
    
</div>

{include file='footer.tpl'}
