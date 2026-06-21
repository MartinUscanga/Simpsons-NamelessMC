# 📁 Carpeta de Imágenes

Esta carpeta debe contener los assets gráficos de la plantilla.

## Imágenes Recomendadas

### Obligatorias (configuradas en NamelessMC)
- **favicon.ico** - Icono del navegador (32x32px)
- **logo.png** - Logo del servidor (recomendado: 200x50px o proporción similar)

### Opcionales (mejoran la experiencia)
- **homer-donut.gif** - GIF animado de Homer comiendo una dona (para página 404)
- **background-clouds.png** - Imagen de nubes de Springfield para el fondo
- **maintenance-homer.gif** - Homer trabajando (para página de mantenimiento)
- **donut-loading.gif** - Dona girando para indicadores de carga

### Easter Eggs
- **doh.mp3** - Sonido "D'oh!" de Homer (formato MP3, max 100KB recomendado)
- **simpson-characters.png** - Sprites de personajes para decoración

## 🎨 Dónde Encontrar Imágenes

Puedes encontrar recursos gratuitos en:
- Google Images (busca "simpsons transparent png")
- [Flaticon](https://www.flaticon.com) - Iconos estilo Simpson
- [GIPHY](https://giphy.com) - GIFs animados de Los Simpson
- [Freepik](https://www.freepik.com) - Recursos vectoriales

## 📐 Especificaciones Técnicas

### Logo
- Formato: PNG con transparencia
- Tamaño recomendado: 200x50px
- Peso máximo: 50KB

### Favicon
- Formato: ICO o PNG
- Tamaño: 32x32px o 16x16px
- Peso máximo: 10KB

### GIFs
- Formato: GIF animado
- Tamaño máximo: 400x400px
- Peso máximo: 500KB (para carga rápida)

### Fondos
- Formato: PNG con transparencia o JPG
- Tamaño recomendado: 1920x1080px
- Peso máximo: 200KB (optimizar con compresión)

## 🖼️ Ejemplo de Uso en el Código

Las imágenes se referencian así en las plantillas:

```html
<!-- Logo en el navbar -->
<img src="{$SITE_LOGO}" alt="{$SITE_NAME}">

<!-- Imagen desde la carpeta del template -->
<img src="{$TEMPLATE.path}img/homer-donut.gif" alt="Homer">

<!-- Favicon (configurado en NamelessMC) -->
<link rel="shortcut icon" href="{$FAVICON}">
```

## ⚠️ Importante

- **No uses imágenes con copyright** sin permiso
- **Optimiza las imágenes** antes de subirlas (usa TinyPNG, ImageOptim, etc.)
- **Usa transparencias** siempre que sea posible para mejor integración
- **Nombres de archivo**: usa minúsculas y guiones (ej: homer-donut.gif)

## 🎯 Tips de Optimización

1. Usa formatos modernos como WebP cuando sea posible
2. Implementa lazy loading para imágenes grandes
3. Considera usar SVG para logos e iconos (mejor calidad, menor peso)
4. Comprime todos los assets antes de subirlos al servidor

---

**Nota**: Esta carpeta puede estar vacía inicialmente. Añade tus propias imágenes según necesites.
