<!DOCTYPE html>
<html lang="{$LANGUAGE_HTML}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="{$DESCRIPTION}">
    <meta name="author" content="{$SITE_NAME}">
    <meta name="generator" content="NamelessMC">
    
    {if isset($PAGE_KEYWORDS)}
    <meta name="keywords" content="{$PAGE_KEYWORDS}">
    {/if}
    
    {foreach from=$PAGE_METADATA item=meta}
        {$meta}
    {/foreach}
    
    <title>{$TITLE} &bull; {$SITE_NAME}</title>
    
    <link rel="shortcut icon" href="{$FAVICON}">
    
    {foreach from=$TEMPLATE_CSS item=css}
        {$css}
    {/foreach}
    
    {if isset($ANALYTICS_ID)}
        {$ANALYTICS_ID}
    {/if}
    
    {foreach from=$TEMPLATE_JS item=script}
        {$script}
    {/foreach}
    
    <style>
        /* Inline critical CSS */
        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        main {
            flex: 1;
        }
    </style>
</head>

<body>
    {if isset($NEW_UPDATE)}
        <div class="alert alert-info alert-dismissible fade show m-0 rounded-0 text-center" role="alert" style="border: 3px solid var(--simpson-dark); border-radius: 0 !important;">
            <strong><i class="fas fa-exclamation-triangle"></i> ¡D'oh!</strong> {$NEW_UPDATE_URGENT}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    {/if}

    {include file='navbar.tpl'}
    
    <main role="main">
