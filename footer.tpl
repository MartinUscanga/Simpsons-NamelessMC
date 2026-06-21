    </main>
    
    <!-- Footer estilo Los Simpson -->
    <footer class="mt-5">
        <div class="container">
            <div class="row py-4">
                <!-- Columna 1: Info del sitio -->
                <div class="col-md-4 mb-3">
                    <h5>
                        <i class="fas fa-home"></i> {$SITE_NAME}
                    </h5>
                    <p style="color: var(--simpson-dark); font-weight: 600;">
                        {if isset($SITE_DESCRIPTION)}
                            {$SITE_DESCRIPTION}
                        {else}
                            ¡Bienvenido a nuestro servidor estilo Springfield! Un lugar donde la diversión nunca termina.
                        {/if}
                    </p>
                    <div class="mt-3">
                        {if isset($SOCIAL_MEDIA_LINKS)}
                            {foreach from=$SOCIAL_MEDIA_LINKS item=social}
                                <a href="{$social.link}" target="_blank" class="btn btn-sm me-2 mb-2" style="background: var(--simpson-blue); color: white; border: 2px solid var(--simpson-dark); border-radius: 10px;">
                                    <i class="{$social.icon}"></i>
                                </a>
                            {/foreach}
                        {/if}
                    </div>
                </div>
                
                <!-- Columna 2: Enlaces útiles -->
                <div class="col-md-4 mb-3">
                    <h5>
                        <i class="fas fa-link"></i> Enlaces Rápidos
                    </h5>
                    <ul class="list-unstyled">
                        {foreach from=$FOOTER_NAVIGATION key=name item=item}
                            <li class="mb-2">
                                <a href="{$item.link}" target="{$item.target}">
                                    {if isset($item.icon)}<i class="{$item.icon}"></i>{/if}
                                    {$item.title}
                                </a>
                            </li>
                        {/foreach}
                    </ul>
                </div>
                
                <!-- Columna 3: Stats del servidor -->
                <div class="col-md-4 mb-3">
                    <h5>
                        <i class="fas fa-chart-bar"></i> Estadísticas
                    </h5>
                    {if isset($SERVER_STATS)}
                        <div class="widget" style="padding: 1rem;">
                            <div class="d-flex justify-content-between mb-2">
                                <span><i class="fas fa-users"></i> Usuarios:</span>
                                <strong style="color: var(--simpson-blue);">{$SERVER_STATS.users}</strong>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span><i class="fas fa-comments"></i> Mensajes:</span>
                                <strong style="color: var(--simpson-green);">{$SERVER_STATS.posts}</strong>
                            </div>
                            {if isset($SERVER_STATS.online)}
                                <div class="d-flex justify-content-between">
                                    <span><i class="fas fa-circle text-success"></i> En línea:</span>
                                    <strong style="color: var(--simpson-orange);">{$SERVER_STATS.online}</strong>
                                </div>
                            {/if}
                        </div>
                    {/if}
                    
                    {if isset($MINECRAFT_SERVER)}
                        <div class="mt-3 p-2" style="background: var(--simpson-green); border: 3px solid var(--simpson-dark); border-radius: 12px; color: white; text-align: center;">
                            <strong><i class="fas fa-server"></i> IP del Servidor:</strong><br>
                            <code style="background: rgba(0,0,0,0.2); padding: 0.5rem; border-radius: 8px; color: white; font-weight: 700;">
                                {$MINECRAFT_SERVER}
                            </code>
                        </div>
                    {/if}
                </div>
            </div>
            
            <!-- Barra inferior -->
            <div class="row border-top pt-3" style="border-color: var(--simpson-orange) !important; border-width: 3px !important;">
                <div class="col-md-6 text-center text-md-start mb-2">
                    <span style="color: var(--simpson-dark); font-weight: 600;">
                        &copy; {$CURRENT_YEAR} {$SITE_NAME}. 
                    </span>
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <span style="color: var(--simpson-dark); font-weight: 600;">
                        Powered by <a href="https://namelessmc.com" target="_blank" style="color: var(--simpson-blue); font-weight: 700;">NamelessMC</a>
                    </span>
                    <span class="mx-2">|</span>
                    <span style="color: var(--simpson-purple); font-weight: 700;">
                        <i class="fas fa-paint-brush"></i> Simpsons Theme
                    </span>
                </div>
            </div>
            
            <!-- Easter egg: Frase de Homer -->
            <div class="text-center mt-3">
                <small style="color: var(--simpson-brown); font-style: italic; font-weight: 600;">
                    "¡D'oh! No olvides divertirte en nuestro servidor"
                </small>
            </div>
        </div>
    </footer>
    
    {foreach from=$TEMPLATE_JS_FOOTER item=script}
        {$script}
    {/foreach}
    
    {if isset($WIDGETS_RIGHT) || isset($WIDGETS_LEFT)}
        {foreach from=$WIDGETS_RIGHT item=widget}
            {$widget}
        {/foreach}
        {foreach from=$WIDGETS_LEFT item=widget}
            {$widget}
        {/foreach}
    {/if}
    
    {if isset($GLOBAL_MESSAGE)}
        <script>
            $(document).ready(function() {
                toastr.options = {
                    "closeButton": true,
                    "progressBar": true,
                    "positionClass": "toast-top-right",
                    "timeOut": "5000"
                };
                toastr.{$GLOBAL_MESSAGE.type}('{$GLOBAL_MESSAGE.message}');
            });
        </script>
    {/if}
</body>
</html>
