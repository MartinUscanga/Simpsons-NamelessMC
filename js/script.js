/**
 * Los Simpson Theme JavaScript
 * NamelessMC v2.x
 */

(function($) {
    'use strict';
    
    // Esperar a que el documento esté listo
    $(document).ready(function() {
        
        // Inicializar tooltips de Bootstrap
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });
        
        // Inicializar popovers de Bootstrap
        var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
        var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
            return new bootstrap.Popover(popoverTriggerEl);
        });
        
        // Smooth scroll para enlaces ancla
        $('a[href*="#"]').not('[href="#"]').not('[href="#0"]').click(function(event) {
            if (
                location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') 
                && 
                location.hostname == this.hostname
            ) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    event.preventDefault();
                    $('html, body').animate({
                        scrollTop: target.offset().top - 80
                    }, 800, function() {
                        var $target = $(target);
                        $target.focus();
                        if ($target.is(":focus")) {
                            return false;
                        } else {
                            $target.attr('tabindex','-1');
                            $target.focus();
                        }
                    });
                }
            }
        });
        
        // Animación para cards al hacer scroll
        if (typeof IntersectionObserver !== 'undefined') {
            const cards = document.querySelectorAll('.card');
            const cardObserver = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('animate__animated', 'animate__fadeInUp');
                        cardObserver.unobserve(entry.target);
                    }
                });
            }, {
                threshold: 0.1
            });
            
            cards.forEach(card => {
                cardObserver.observe(card);
            });
        }
        
        // Easter egg: sonido "D'oh!" al hacer clic en el logo (opcional)
        $('.navbar-brand').on('dblclick', function() {
            playDohSound();
        });
        
        // Función para reproducir sonido D'oh (requiere archivo de audio)
        function playDohSound() {
            // Crear elemento de audio dinámicamente
            var audio = new Audio('/custom/templates/Simpsons/img/doh.mp3');
            audio.volume = 0.3;
            audio.play().catch(function(error) {
                console.log('Audio playback failed:', error);
            });
            
            // Animación del logo
            $('.navbar-brand').addClass('bounce-animation');
            setTimeout(function() {
                $('.navbar-brand').removeClass('bounce-animation');
            }, 2000);
        }
        
        // Copiar IP del servidor al hacer clic
        $('.server-ip-copy').on('click', function(e) {
            e.preventDefault();
            var ip = $(this).data('ip');
            
            // Copiar al portapapeles
            if (navigator.clipboard && window.isSecureContext) {
                navigator.clipboard.writeText(ip).then(function() {
                    showNotification('IP copiada al portapapeles: ' + ip, 'success');
                }).catch(function(err) {
                    console.error('Error al copiar:', err);
                });
            } else {
                // Fallback para navegadores antiguos
                var tempInput = document.createElement('input');
                tempInput.value = ip;
                document.body.appendChild(tempInput);
                tempInput.select();
                document.execCommand('copy');
                document.body.removeChild(tempInput);
                showNotification('IP copiada: ' + ip, 'success');
            }
        });
        
        // Sistema de notificaciones
        function showNotification(message, type) {
            type = type || 'info';
            var bgColor;
            
            switch(type) {
                case 'success':
                    bgColor = 'var(--simpson-green)';
                    break;
                case 'error':
                    bgColor = 'var(--simpson-red)';
                    break;
                case 'warning':
                    bgColor = 'var(--simpson-orange)';
                    break;
                default:
                    bgColor = 'var(--simpson-blue)';
            }
            
            var notification = $('<div>', {
                class: 'simpson-notification',
                css: {
                    position: 'fixed',
                    top: '100px',
                    right: '20px',
                    background: bgColor,
                    color: 'white',
                    padding: '1rem 1.5rem',
                    borderRadius: '15px',
                    border: '3px solid var(--simpson-dark)',
                    boxShadow: '5px 5px 0px rgba(0,0,0,0.3)',
                    zIndex: 9999,
                    fontWeight: '700',
                    display: 'none'
                },
                html: '<i class="fas fa-check-circle"></i> ' + message
            });
            
            $('body').append(notification);
            notification.fadeIn(300);
            
            setTimeout(function() {
                notification.fadeOut(300, function() {
                    $(this).remove();
                });
            }, 3000);
        }
        
        // Animación de hover para los botones
        $('.btn').hover(
            function() {
                $(this).addClass('animate__animated animate__pulse');
            },
            function() {
                $(this).removeClass('animate__animated animate__pulse');
            }
        );
        
        // Lazy loading para imágenes
        if ('loading' in HTMLImageElement.prototype) {
            const images = document.querySelectorAll('img[loading="lazy"]');
            images.forEach(img => {
                img.src = img.dataset.src;
            });
        } else {
            // Fallback para navegadores que no soportan lazy loading nativo
            const script = document.createElement('script');
            script.src = 'https://cdnjs.cloudflare.com/ajax/libs/lazysizes/5.3.2/lazysizes.min.js';
            document.body.appendChild(script);
        }
        
        // Prevenir doble clic en botones de submit
        $('form').on('submit', function() {
            $(this).find('button[type="submit"]').prop('disabled', true);
        });
        
        // Contador de caracteres para textareas
        $('textarea[data-max-length]').each(function() {
            var maxLength = $(this).data('max-length');
            var $counter = $('<small>', {
                class: 'text-muted d-block mt-1',
                text: '0 / ' + maxLength + ' caracteres'
            });
            
            $(this).after($counter);
            
            $(this).on('input', function() {
                var currentLength = $(this).val().length;
                $counter.text(currentLength + ' / ' + maxLength + ' caracteres');
                
                if (currentLength > maxLength * 0.9) {
                    $counter.css('color', 'var(--simpson-orange)');
                }
                if (currentLength >= maxLength) {
                    $counter.css('color', 'var(--simpson-red)');
                }
            });
        });
        
        // Confirmación antes de eliminar
        $('.btn-delete, .btn-danger[data-confirm]').on('click', function(e) {
            var message = $(this).data('confirm') || '¿Estás seguro de que quieres hacer esto?';
            if (!confirm(message)) {
                e.preventDefault();
                return false;
            }
        });
        
        // Auto-ocultar alertas después de 5 segundos
        $('.alert:not(.alert-permanent)').each(function() {
            var $alert = $(this);
            setTimeout(function() {
                $alert.fadeOut(300, function() {
                    $(this).remove();
                });
            }, 5000);
        });
        
        // Easter egg: Konami code (↑ ↑ ↓ ↓ ← → ← → B A)
        var konamiCode = [38, 38, 40, 40, 37, 39, 37, 39, 66, 65];
        var konamiIndex = 0;
        
        $(document).keydown(function(e) {
            if (e.keyCode === konamiCode[konamiIndex]) {
                konamiIndex++;
                if (konamiIndex === konamiCode.length) {
                    activateKonamiCode();
                    konamiIndex = 0;
                }
            } else {
                konamiIndex = 0;
            }
        });
        
        function activateKonamiCode() {
            showNotification('¡Código Konami activado! ¡Eres un verdadero fan de Los Simpson!', 'success');
            $('body').addClass('konami-active');
            
            // Efecto especial: hacer que todo se vuelva amarillo por un momento
            $('body').animate({
                backgroundColor: 'var(--simpson-yellow)'
            }, 500).animate({
                backgroundColor: ''
            }, 500);
        }
        
        console.log('%c¡Bienvenido a la plantilla de Los Simpson! 🍩', 'color: #FFD90F; font-size: 20px; font-weight: bold;');
        console.log('%cD\'oh!', 'color: #6BADE4; font-size: 16px;');
    });
    
})(jQuery);
