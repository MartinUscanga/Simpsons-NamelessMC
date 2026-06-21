# 📦 Guía de Instalación - Los Simpson Theme

## Requisitos Previos

Antes de instalar la plantilla, asegúrate de tener:

- ✅ NamelessMC v2.0.0 o superior instalado
- ✅ Acceso FTP o administrador de archivos en tu hosting
- ✅ Acceso al panel de administración de NamelessMC
- ✅ PHP 7.4 o superior
- ✅ Conexión a internet (para CDN de Bootstrap y Font Awesome)

## 🚀 Instalación Paso a Paso

### 1. Descargar la Plantilla

- Descarga la carpeta completa `Simpsons` con todos sus archivos

### 2. Subir Archivos al Servidor

**Opción A: Por FTP**
1. Conecta a tu servidor por FTP usando FileZilla u otro cliente FTP
2. Navega hasta la ruta: `/custom/templates/`
3. Sube la carpeta completa `Simpsons` a esa ubicación
4. Verifica que la estructura sea: `/custom/templates/Simpsons/`

**Opción B: Panel de Control (cPanel, Plesk, etc.)**
1. Accede al administrador de archivos
2. Navega a `/custom/templates/`
3. Sube el archivo ZIP de la plantilla
4. Extrae el contenido
5. Asegúrate de que la carpeta se llame `Simpsons`

### 3. Verificar Estructura de Archivos

Después de subir, verifica que la estructura sea correcta:

```
/custom/templates/Simpsons/
├── template.php
├── header.tpl
├── footer.tpl
├── navbar.tpl
├── index.tpl
├── 404.tpl
├── maintenance.tpl
├── css/
│   ├── style.css
│   └── custom.css
├── js/
│   └── script.js
├── img/
│   └── (imágenes)
├── forum/
│   └── forum_index.tpl
└── user/
    └── profile.tpl
```

### 4. Activar la Plantilla en NamelessMC

1. Inicia sesión en el **Panel de Administración** de NamelessMC
2. Ve a **Diseño** → **Plantillas** (o **Layout** → **Templates**)
3. Busca "**Simpsons**" en la lista de plantillas
4. Haz clic en el botón **Activar** o **Activate**
5. La plantilla ahora debería estar activa

### 5. Configuración Inicial

#### Configurar Logo
1. Ve a **Diseño** → **Imágenes**
2. Sube tu logo personalizado (recomendado: 200x50px PNG)
3. Sube un favicon (32x32px ICO o PNG)

#### Configurar Colores (Opcional)
Si quieres personalizar los colores:
1. Edita el archivo `/custom/templates/Simpsons/css/custom.css`
2. Añade tus propias variables CSS:

```css
:root {
    --simpson-yellow: #TU_COLOR;
    --simpson-blue: #TU_COLOR;
}
```

#### Limpiar Caché
1. Ve a **Mantenimiento** → **Actualizar** (o **Update**)
2. Haz clic en **Limpiar Caché** / **Clear Cache**
3. Recarga tu sitio web

### 6. Verificar Instalación

Visita tu sitio web y verifica:

- ✅ El diseño se ve con los colores de Los Simpson
- ✅ La navegación funciona correctamente
- ✅ Los botones tienen el estilo correcto
- ✅ El sitio es responsive en móvil
- ✅ No hay errores en la consola del navegador (F12)

## 🎨 Personalización Post-Instalación

### Añadir Imágenes Personalizadas

1. Sube imágenes a `/custom/templates/Simpsons/img/`
2. Las imágenes recomendadas son:
   - `homer-donut.gif` - Para página 404
   - `doh.mp3` - Sonido para easter egg (opcional)

### Modificar Textos del Footer

Edita el archivo `footer.tpl` y busca las secciones que quieras personalizar.

### Configurar Redes Sociales

1. Ve al panel de administración
2. Configura tus enlaces de redes sociales
3. Aparecerán automáticamente en el footer

## 🔧 Solución de Problemas

### La plantilla no aparece en la lista

**Solución:**
- Verifica que el archivo `template.php` esté presente
- Asegúrate de que la carpeta se llame exactamente `Simpsons`
- Revisa los permisos de archivos (755 para carpetas, 644 para archivos)

### El diseño se ve roto o sin estilos

**Solución:**
1. Limpia la caché de NamelessMC
2. Limpia la caché de tu navegador (Ctrl+F5)
3. Verifica que el archivo `css/style.css` esté presente
4. Revisa la consola del navegador (F12) para errores

### Los colores no se aplican

**Solución:**
1. Verifica que Bootstrap y Font Awesome estén cargando desde CDN
2. Asegúrate de tener conexión a internet
3. Limpia la caché del navegador

### Página 404 o errores PHP

**Solución:**
1. Verifica la versión de PHP (debe ser 7.4 o superior)
2. Revisa los logs de errores de PHP
3. Asegúrate de que NamelessMC sea v2.0.0 o superior

### Las imágenes no cargan

**Solución:**
1. Verifica la ruta de las imágenes en los archivos TPL
2. Asegúrate de que las imágenes estén en `/custom/templates/Simpsons/img/`
3. Revisa los permisos de la carpeta `img/`

## 📞 Soporte Adicional

Si después de seguir esta guía sigues teniendo problemas:

1. **Documentación oficial de NamelessMC**: https://docs.namelessmc.com
2. **Discord de NamelessMC**: https://discord.gg/nameless
3. **Foro de soporte**: https://namelessmc.com/forum

## ✅ Checklist de Instalación

Antes de pedir ayuda, verifica:

- [ ] NamelessMC v2.0.0+ instalado
- [ ] Carpeta `Simpsons` en `/custom/templates/`
- [ ] Archivo `template.php` presente
- [ ] Plantilla activada en el panel
- [ ] Caché limpiada
- [ ] Navegador actualizado (Chrome, Firefox, Edge, Safari)
- [ ] Sin errores en consola del navegador (F12)
- [ ] Permisos de archivos correctos (755/644)

## 🎉 ¡Instalación Completa!

Si todo funciona correctamente, deberías ver tu sitio con el estilo de Los Simpson. 

**¡Disfruta de tu nuevo diseño estilo Springfield!** 🍩

---

*"La instalación no funciona... ¡Maldita sea! Espera, ahora sí... ¡Woo-hoo!"* - Homer Simpson
