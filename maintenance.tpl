<!DOCTYPE html>
<html lang="{$LANGUAGE_HTML}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Mantenimiento - {$SITE_NAME}</title>
    
    <link rel="shortcut icon" href="{$FAVICON}">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@400;700&display=swap">
    
    <style>
        :root {
            --simpson-yellow: #FFD90F;
            --simpson-blue: #6BADE4;
            --simpson-sky: #8ED8F8;
            --simpson-orange: #FFA500;
            --simpson-dark: #2C3E50;
            --simpson-white: #FFFFFF;
        }
        
        body {
            font-family: 'Comic Neue', 'Comic Sans MS', cursive, sans-serif;
            background: linear-gradient(135deg, var(--simpson-sky) 0%, var(--simpson-blue) 100%);
            background-attachment: fixed;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .maintenance-card {
            background: var(--simpson-white);
            border: 5px solid var(--simpson-dark);
            border-radius: 25px;
            box-shadow: 10px 10px 0px rgba(0, 0, 0, 0.3);
            max-width: 600px;
            padding: 3rem;
        }
        
        .maintenance-icon {
            width: 100px;
            height: 100px;
            background: var(--simpson-yellow);
            border: 4px solid var(--simpson-dark);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 2rem;
            animation: spin 3s linear infinite;
        }
        
        @keyframes spin {
            0%, 100% { transform: rotate(0deg); }
            25% { transform: rotate(10deg); }
            75% { transform: rotate(-10deg); }
        }
        
        h1 {
            color: var(--simpson-blue);
            font-weight: 700;
            text-shadow: 3px 3px 0px rgba(0, 0, 0, 0.1);
        }
        
        .progress {
            height: 30px;
            border: 3px solid var(--simpson-dark);
            border-radius: 15px;
            background: var(--simpson-white);
        }
        
        .progress-bar {
            background: var(--simpson-orange);
            font-weight: 700;
            animation: progress 2s ease-in-out infinite;
        }
        
        @keyframes progress {
            0%, 100% { width: 30%; }
            50% { width: 80%; }
        }
    </style>
</head>
<body>
    
    <div class="maintenance-card text-center">
        <div class="maintenance-icon">
            <i class="fas fa-wrench" style="font-size: 3rem; color: var(--simpson-blue);"></i>
        </div>
        
        <h1 class="mb-4">¡Estamos en Mantenimiento!</h1>
        
        <p class="lead mb-4" style="color: var(--simpson-dark); font-weight: 600;">
            Homer está trabajando duro para mejorar el sitio... 
            <br>Bueno, probablemente está tomando una pausa para comer donas, 
            <br>pero volveremos pronto.
        </p>
        
        {if isset($MAINTENANCE_MESSAGE)}
            <div class="alert" style="background: var(--simpson-yellow); border: 3px solid var(--simpson-dark); border-radius: 15px; font-weight: 600;">
                <i class="fas fa-info-circle"></i> {$MAINTENANCE_MESSAGE}
            </div>
        {/if}
        
        <div class="progress mb-4">
            <div class="progress-bar" role="progressbar" style="width: 50%;">
                Trabajando...
            </div>
        </div>
        
        <p style="color: var(--simpson-dark); font-style: italic;">
            "No puedo prometerte que intentaré, pero intentaré intentarlo" - Bart Simpson
        </p>
        
        {if isset($SOCIAL_MEDIA)}
            <div class="mt-4">
                <p style="font-weight: 700; color: var(--simpson-dark);">Síguenos en:</p>
                {foreach from=$SOCIAL_MEDIA item=social}
                    <a href="{$social.link}" target="_blank" class="btn btn-sm me-2" style="background: var(--simpson-blue); color: white; border: 2px solid var(--simpson-dark); border-radius: 10px;">
                        <i class="{$social.icon}"></i> {$social.name}
                    </a>
                {/foreach}
            </div>
        {/if}
    </div>
    
</body>
</html>
