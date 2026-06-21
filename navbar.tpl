<nav class="navbar navbar-expand-lg navbar-light sticky-top">
    <div class="container-fluid">
        <!-- Logo/Brand con estilo Simpson -->
        <a class="navbar-brand" href="{$SITE_HOME}">
            {if isset($SITE_LOGO)}
                <img src="{$SITE_LOGO}" alt="{$SITE_NAME}" style="height: 50px; margin-right: 10px;">
            {/if}
            {$SITE_NAME}
        </a>
        
        <!-- Toggle button para móvil -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMain" aria-controls="navbarMain" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarMain">
            <!-- Links principales -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                {foreach from=$NAV_LINKS key=name item=item}
                    {if isset($item.items)}
                        <!-- Dropdown menu -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle {if isset($item.active)}active{/if}" href="#" id="navbarDropdown{$name}" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                {if isset($item.icon)}<i class="{$item.icon}"></i>{/if}
                                {$item.title}
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown{$name}" style="background: var(--simpson-yellow); border: 3px solid var(--simpson-dark); border-radius: 15px;">
                                {foreach from=$item.items item=dropdown}
                                    {if isset($dropdown.separator)}
                                        <li><hr class="dropdown-divider" style="border-color: var(--simpson-dark);"></li>
                                    {else}
                                        <li>
                                            <a class="dropdown-item" href="{$dropdown.link}" target="{$dropdown.target}" style="font-weight: 600; color: var(--simpson-dark); border-radius: 10px; margin: 0.25rem;">
                                                {if isset($dropdown.icon)}<i class="{$dropdown.icon}"></i>{/if}
                                                {$dropdown.title}
                                            </a>
                                        </li>
                                    {/if}
                                {/foreach}
                            </ul>
                        </li>
                    {else}
                        <!-- Link simple -->
                        <li class="nav-item">
                            <a class="nav-link {if isset($item.active)}active{/if}" href="{$item.link}" target="{$item.target}">
                                {if isset($item.icon)}<i class="{$item.icon}"></i>{/if}
                                {$item.title}
                            </a>
                        </li>
                    {/if}
                {/foreach}
            </ul>
            
            <!-- User menu -->
            <ul class="navbar-nav">
                {if isset($LOGGED_IN_USER)}
                    <!-- Usuario logueado -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarUserDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="{$LOGGED_IN_USER.avatar}" alt="{$LOGGED_IN_USER.username}" class="rounded-circle" style="width: 32px; height: 32px; border: 2px solid var(--simpson-dark); margin-right: 0.5rem;">
                            {$LOGGED_IN_USER.username}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarUserDropdown" style="background: var(--simpson-yellow); border: 3px solid var(--simpson-dark); border-radius: 15px;">
                            <li>
                                <a class="dropdown-item" href="{$LOGGED_IN_USER.profile}" style="font-weight: 600; color: var(--simpson-dark); border-radius: 10px; margin: 0.25rem;">
                                    <i class="fas fa-user"></i> {$PROFILE}
                                </a>
                            </li>
                            {if isset($LOGGED_IN_USER.panel_url)}
                                <li>
                                    <a class="dropdown-item" href="{$LOGGED_IN_USER.panel_url}" style="font-weight: 600; color: var(--simpson-dark); border-radius: 10px; margin: 0.25rem;">
                                        <i class="fas fa-cog"></i> {$PANEL}
                                    </a>
                                </li>
                            {/if}
                            <li><hr class="dropdown-divider" style="border-color: var(--simpson-dark);"></li>
                            <li>
                                <a class="dropdown-item" href="{$LOGOUT_URL}" style="font-weight: 600; color: var(--simpson-red); border-radius: 10px; margin: 0.25rem;">
                                    <i class="fas fa-sign-out-alt"></i> {$LOG_OUT}
                                </a>
                            </li>
                        </ul>
                    </li>
                {else}
                    <!-- Usuario no logueado -->
                    <li class="nav-item">
                        <a class="nav-link" href="{$LOGIN_URL}">
                            <i class="fas fa-sign-in-alt"></i> {$LOG_IN}
                        </a>
                    </li>
                    {if isset($REGISTER_URL)}
                        <li class="nav-item">
                            <a class="nav-link btn btn-primary text-white ms-2" href="{$REGISTER_URL}" style="border-radius: 15px;">
                                <i class="fas fa-user-plus"></i> {$REGISTER}
                            </a>
                        </li>
                    {/if}
                {/if}
                
                <!-- Language selector (si está disponible) -->
                {if isset($LANGUAGES)}
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarLanguageDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-globe"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarLanguageDropdown" style="background: var(--simpson-yellow); border: 3px solid var(--simpson-dark); border-radius: 15px;">
                            {foreach from=$LANGUAGES item=language}
                                <li>
                                    <a class="dropdown-item" href="{$language.link}" style="font-weight: 600; color: var(--simpson-dark); border-radius: 10px; margin: 0.25rem;">
                                        <img src="{$language.flag}" alt="{$language.name}" style="width: 20px; margin-right: 0.5rem;">
                                        {$language.name}
                                    </a>
                                </li>
                            {/foreach}
                        </ul>
                    </li>
                {/if}
            </ul>
        </div>
    </div>
</nav>

<!-- Mensaje de bienvenida estilo Springfield -->
{if isset($SHOW_WELCOME_MESSAGE)}
    <div class="container mt-3">
        <div class="alert alert-warning alert-dismissible fade show" role="alert" style="border: 3px solid var(--simpson-dark); border-radius: 15px; background: var(--simpson-orange); color: white; font-weight: 700;">
            <i class="fas fa-beer"></i> ¡Bienvenido a Springfield! {$WELCOME_MESSAGE}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </div>
{/if}
