{include file='header.tpl'}

<div class="container mt-4">
    
    <!-- Header del perfil -->
    <div class="profile-header">
        <div class="row align-items-center">
            <!-- Avatar -->
            <div class="col-md-3 text-center">
                <img src="{$PROFILE.avatar}" alt="{$PROFILE.username}" class="avatar" style="width: 150px; height: 150px;">
                {if isset($PROFILE.online)}
                    <div class="mt-2">
                        <span class="badge" style="background: var(--simpson-green); font-size: 1rem;">
                            <i class="fas fa-circle"></i> En Línea
                        </span>
                    </div>
                {/if}
            </div>
            
            <!-- Información del usuario -->
            <div class="col-md-9">
                <h1 style="color: var(--simpson-dark); text-shadow: 2px 2px 0px rgba(255,255,255,0.5); font-weight: 700;">
                    {$PROFILE.username}
                </h1>
                
                {if isset($PROFILE.user_title)}
                    <p class="lead mb-2" style="color: var(--simpson-dark); font-weight: 600;">
                        {$PROFILE.user_title}
                    </p>
                {/if}
                
                <!-- Grupos/Roles -->
                {if isset($PROFILE.groups)}
                    <div class="mb-3">
                        {foreach from=$PROFILE.groups item=group}
                            <span class="badge me-1" style="background: {$group.color}; border: 2px solid var(--simpson-dark);">
                                {$group.name}
                            </span>
                        {/foreach}
                    </div>
                {/if}
                
                <!-- Botones de acción -->
                <div class="mt-3">
                    {if isset($PROFILE.can_message)}
                        <a href="{$PROFILE.message_url}" class="btn btn-primary me-2">
                            <i class="fas fa-envelope"></i> Enviar Mensaje
                        </a>
                    {/if}
                    {if isset($PROFILE.can_follow)}
                        <a href="{$PROFILE.follow_url}" class="btn btn-success">
                            <i class="fas fa-user-plus"></i> Seguir
                        </a>
                    {/if}
                    {if isset($PROFILE.is_own_profile)}
                        <a href="{$PROFILE.edit_url}" class="btn btn-warning">
                            <i class="fas fa-edit"></i> Editar Perfil
                        </a>
                    {/if}
                </div>
            </div>
        </div>
    </div>
    
    <div class="row mt-4">
        <!-- Columna principal -->
        <div class="col-lg-8">
            
            <!-- Pestañas de navegación -->
            {if isset($PROFILE_TABS)}
                <ul class="nav nav-tabs mb-4" style="border-bottom: 3px solid var(--simpson-orange);">
                    {foreach from=$PROFILE_TABS item=tab}
                        <li class="nav-item">
                            <a class="nav-link {if $tab.active}active{/if}" href="{$tab.link}" style="font-weight: 700; border: 3px solid var(--simpson-dark); border-bottom: none; margin-right: 0.25rem; {if $tab.active}background: var(--simpson-yellow);{/if}">
                                <i class="{$tab.icon}"></i> {$tab.title}
                            </a>
                        </li>
                    {/foreach}
                </ul>
            {/if}
            
            <!-- Contenido de la pestaña activa -->
            <div class="card">
                <div class="card-header">
                    <i class="fas fa-info-circle"></i> Sobre {$PROFILE.username}
                </div>
                <div class="card-body">
                    {if isset($PROFILE.about)}
                        <p>{$PROFILE.about}</p>
                    {else}
                        <p class="text-muted"><em>Este usuario aún no ha escrito nada sobre sí mismo.</em></p>
                    {/if}
                </div>
            </div>
            
            <!-- Actividad reciente -->
            {if isset($RECENT_ACTIVITY)}
                <div class="card mt-4">
                    <div class="card-header">
                        <i class="fas fa-clock"></i> Actividad Reciente
                    </div>
                    <div class="card-body">
                        {foreach from=$RECENT_ACTIVITY item=activity}
                            <div class="mb-3 pb-3" style="border-bottom: 2px dashed var(--simpson-blue);">
                                <div class="d-flex">
                                    <div class="me-3">
                                        <div style="width: 40px; height: 40px; background: var(--simpson-yellow); border: 3px solid var(--simpson-dark); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
                                            <i class="{$activity.icon}" style="color: var(--simpson-blue);"></i>
                                        </div>
                                    </div>
                                    <div class="flex-grow-1">
                                        <p class="mb-1"><strong>{$activity.title}</strong></p>
                                        <small class="text-muted">{$activity.date}</small>
                                        <p class="mb-0 mt-2">{$activity.content}</p>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                </div>
            {/if}
            
        </div>
        
        <!-- Sidebar -->
        <div class="col-lg-4">
            
            <!-- Estadísticas del usuario -->
            <div class="widget mb-4">
                <div class="widget-header">
                    <i class="fas fa-chart-bar"></i> Estadísticas
                </div>
                <div class="py-2">
                    <div class="d-flex justify-content-between mb-3 p-2" style="background: var(--simpson-yellow); border-radius: 10px;">
                        <span><i class="fas fa-comments"></i> Mensajes:</span>
                        <strong style="color: var(--simpson-blue);">{$PROFILE.posts}</strong>
                    </div>
                    <div class="d-flex justify-content-between mb-3 p-2" style="background: var(--simpson-blue); color: white; border-radius: 10px;">
                        <span><i class="fas fa-trophy"></i> Reputación:</span>
                        <strong>{$PROFILE.reputation}</strong>
                    </div>
                    <div class="d-flex justify-content-between p-2" style="background: var(--simpson-green); color: white; border-radius: 10px;">
                        <span><i class="fas fa-calendar"></i> Registrado:</span>
                        <strong>{$PROFILE.registered}</strong>
                    </div>
                </div>
            </div>
            
            <!-- Información adicional -->
            {if isset($PROFILE.info)}
                <div class="widget mb-4">
                    <div class="widget-header">
                        <i class="fas fa-info-circle"></i> Información
                    </div>
                    <div class="py-2">
                        {foreach from=$PROFILE.info key=label item=value}
                            <div class="mb-2">
                                <strong style="color: var(--simpson-dark);">{$label}:</strong><br>
                                <span>{$value}</span>
                            </div>
                        {/foreach}
                    </div>
                </div>
            {/if}
            
            <!-- Logros/Badges -->
            {if isset($PROFILE.badges)}
                <div class="widget mb-4">
                    <div class="widget-header">
                        <i class="fas fa-medal"></i> Logros
                    </div>
                    <div class="py-2 text-center">
                        {foreach from=$PROFILE.badges item=badge}
                            <div class="d-inline-block m-2" title="{$badge.name}">
                                <img src="{$badge.icon}" alt="{$badge.name}" style="width: 48px; height: 48px; border: 3px solid var(--simpson-dark); border-radius: 10px;">
                            </div>
                        {/foreach}
                    </div>
                </div>
            {/if}
            
        </div>
    </div>
    
</div>

{include file='footer.tpl'}
