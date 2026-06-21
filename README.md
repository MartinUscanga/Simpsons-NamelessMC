# 🍩 Los Simpson Theme para NamelessMC v2.x

![Version](https://img.shields.io/badge/version-2.0.0-yellow)
![NamelessMC](https://img.shields.io/badge/NamelessMC-v2.x-blue)
![License](https://img.shields.io/badge/license-MIT-green)

Una plantilla temática de **Los Simpson** para NamelessMC, diseñada para darle a tu servidor de Minecraft un estilo único y divertido inspirado en Springfield.

## 🎨 Características

- ✅ **Diseño Temático Completo**: Colores, fuentes y estilos inspirados en Los Simpson
- ✅ **Totalmente Responsive**: Se adapta perfectamente a móviles, tablets y escritorio
- ✅ **Bootstrap 5**: Utiliza el framework Bootstrap más reciente
- ✅ **Font Awesome 6**: Iconos modernos y atractivos
- ✅ **Animaciones Suaves**: Efectos visuales que mejoran la experiencia del usuario
- ✅ **Páginas Completas**: Index, foro, perfil, error 404, mantenimiento, etc.
- ✅ **Fácil Personalización**: CSS bien organizado y comentado
- ✅ **Easter Eggs**: Sorpresas ocultas para fans de la serie

## 🎯 Colores del Tema

| Color | Hexadecimal | Uso |
|-------|-------------|-----|
| Amarillo Simpson | `#FFD90F` | Color principal, headers |
| Azul Springfield | `#6BADE4` | Enlaces, botones primarios |
| Cielo | `#8ED8F8` | Fondos, degradados |
| Naranja | `#FFA500` | Acentos, alertas |
| Verde | `#90C054` | Botones de éxito |
| Rojo | `#E74C3C` | Alertas de error |

## 📦 Instalación

### Método Manual

1. **Descarga** la carpeta completa `Simpsons`
2. **Sube** la carpeta a tu servidor en: `/custom/templates/`
3. **Accede** al Panel de Administración de NamelessMC
4. Ve a **Diseño → Plantillas**
5. **Activa** la plantilla "Simpsons"

### Estructura de Archivos

```
Simpsons/
├── css/
│   ├── style.css          # Estilos principales
│   └── custom.css         # Estilos personalizados (edita aquí)
├── js/
│   └── script.js          # JavaScript personalizado
├── img/
│   └── (tus imágenes aquí)
├── forum/
│   └── forum_index.tpl    # Página del foro
├── user/
│   └── profile.tpl        # Página de perfil
├── template.php           # Configuración de la plantilla
├── header.tpl            # Cabecera HTML
├── footer.tpl            # Pie de página
├── navbar.tpl            # Barra de navegación
├── index.tpl             # Página principal
├── 404.tpl               # Página de error
├── maintenance.tpl       # Página de mantenimiento
└── README.md             # Este archivo
```

## 🎨 Personalización

### Cambiar Colores

Edita el archivo `css/custom.css` y sobrescribe las variables CSS:

```css
:root {
    --simpson-yellow: #TU_COLOR_AMARILLO;
    --simpson-blue: #TU_COLOR_AZUL;
    /* etc... */
}
```

### Añadir Logo Personalizado

1. Sube tu logo a `img/logo.png`
2. El logo se mostrará automáticamente en el navbar si está configurado en NamelessMC

### Modificar Fuentes

La plantilla usa **Comic Neue** por defecto. Para cambiar:

```css
body {
    font-family: 'Tu Fuente', sans-serif;
}
```

## 🖼️ Assets Recomendados

Para una experiencia completa, se recomienda añadir las siguientes imágenes en la carpeta `img/`:

- **logo.png** - Logo de tu servidor (200x50px recomendado)
- **favicon.ico** - Icono del navegador (32x32px)
- **homer-donut.gif** - GIF de Homer para la página 404
- **background-clouds.png** - Nubes de Springfield (opcional)
- **doh.mp3** - Sonido "D'oh!" para easter egg (opcional)

## 🎮 Easter Eggs

Esta plantilla incluye varios easter eggs para los fans:

1. **Doble clic en el logo**: Reproduce el sonido "D'oh!" (requiere archivo de audio)
2. **Código Konami**: Presiona ↑ ↑ ↓ ↓ ← → ← → B A
3. **Frases de Homer**: Aparecen aleatoriamente en el footer

## 📱 Compatibilidad

- ✅ Chrome/Edge (últimas versiones)
- ✅ Firefox (últimas versiones)
- ✅ Safari (últimas versiones)
- ✅ Opera (últimas versiones)
- ✅ Dispositivos móviles iOS/Android

## 🔧 Requisitos

- NamelessMC v2.0.0 o superior
- PHP 7.4 o superior
- Conexión a internet (para cargar fuentes y CDN de Bootstrap)

## 📝 Notas de Desarrollo

### v2.0.0 (2024)
- Versión inicial
- Diseño completo inspirado en Los Simpson
- Sistema de colores temático
- Páginas principales implementadas
- JavaScript con funcionalidades avanzadas
- Responsive design completo

## 🤝 Contribuciones

¿Tienes ideas para mejorar la plantilla? ¡Las contribuciones son bienvenidas!

1. Fork el proyecto
2. Crea una rama para tu característica
3. Commit tus cambios
4. Push a la rama
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Puedes usarlo, modificarlo y distribuirlo libremente.

## 💝 Créditos

- **Diseño**: Inspirado en Los Simpson (FOX/Matt Groening)
- **NamelessMC**: https://namelessmc.com
- **Bootstrap**: https://getbootstrap.com
- **Font Awesome**: https://fontawesome.com
- **Comic Neue Font**: https://fonts.google.com/specimen/Comic+Neue

## 📞 Soporte

Si tienes problemas o preguntas:

1. Revisa la documentación de NamelessMC
2. Verifica que todos los archivos estén subidos correctamente
3. Limpia la caché de NamelessMC (Panel → Mantenimiento → Limpiar caché)

## ⚠️ Descargo de Responsabilidad

Esta plantilla es un proyecto de fan y no está afiliada, respaldada o patrocinada por FOX, Matt Groening o Los Simpson. Todos los derechos de Los Simpson pertenecen a sus respectivos propietarios.

---

**¡Disfruta tu servidor con estilo Springfield!** 🍩

*"¡D'oh! No olvides divertirte"* - Homer Simpson
