/**
 * Los Simpson Theme JavaScript
 * NamelessMC v2.2.x
 * Uses Fomantic UI (not Bootstrap)
 */

(function($) {
    'use strict';

    $(document).ready(function() {

        // Initialize Fomantic UI tooltips/popups
        $('.ui.popup-trigger').popup({
            hoverable: true
        });

        // Initialize Fomantic UI dropdowns (additional ones not handled by core.js)
        $('.ui.dropdown:not(.initialized)').dropdown();

        // Smooth scroll for anchor links
        $('a[href*="#"]').not('[href="#"]').not('[href="#0"]').click(function(event) {
            if (
                location.pathname.replace(/^\//, '') === this.pathname.replace(/^\//, '')
                &&
                location.hostname === this.hostname
            ) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    event.preventDefault();
                    $('html, body').animate({
                        scrollTop: target.offset().top - 80
                    }, 800);
                }
            }
        });

        // Intersection Observer animation for cards (fade in on scroll)
        if (typeof IntersectionObserver !== 'undefined') {
            var cards = document.querySelectorAll('.ui.card, .ui.segment');
            var cardObserver = new IntersectionObserver(function(entries) {
                entries.forEach(function(entry) {
                    if (entry.isIntersecting) {
                        entry.target.style.opacity = '1';
                        entry.target.style.transform = 'translateY(0)';
                        cardObserver.unobserve(entry.target);
                    }
                });
            }, {
                threshold: 0.05,
                rootMargin: '0px 0px -30px 0px'
            });

            cards.forEach(function(card) {
                card.style.opacity = '0';
                card.style.transform = 'translateY(15px)';
                card.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
                cardObserver.observe(card);
            });
        }

        // Easter egg: "D'oh!" sound on double-click on site name / logo
        $('.ui.secondary.menu .header.item, .ui.masthead h1').on('dblclick', function() {
            playDohSound();
        });

        function playDohSound() {
            var templatePath = typeof TEMPLATE !== 'undefined' ? TEMPLATE.path : '/custom/templates/Simpsons-NamelessMC-main/';
            var audio = new Audio(templatePath + 'img/doh.mp3');
            audio.volume = 0.3;
            audio.play().catch(function() {
                // Audio playback requires user interaction first, silently ignore
            });

            // Quick bounce animation on the element
            var $el = $('.ui.masthead h1');
            $el.css('animation', 'simpson-bounce 0.6s ease');
            setTimeout(function() {
                $el.css('animation', '');
            }, 600);
        }

        // Copy server IP to clipboard (used in masthead)
        $(document).on('click', '.server-ip-copy', function(e) {
            e.preventDefault();
            var ip = $(this).data('ip') || $(this).text().trim();

            if (navigator.clipboard && window.isSecureContext) {
                navigator.clipboard.writeText(ip).then(function() {
                    showToast('IP copiada: ' + ip, 'success');
                });
            } else {
                var tempInput = document.createElement('input');
                tempInput.value = ip;
                document.body.appendChild(tempInput);
                tempInput.select();
                document.execCommand('copy');
                document.body.removeChild(tempInput);
                showToast('IP copiada: ' + ip, 'success');
            }
        });

        // Toast notification using Fomantic UI toast
        function showToast(message, type) {
            type = type || 'info';
            var iconMap = {
                'success': 'checkmark',
                'error': 'exclamation circle',
                'warning': 'exclamation triangle',
                'info': 'info circle'
            };
            var classMap = {
                'success': 'success',
                'error': 'error',
                'warning': 'warning',
                'info': 'info'
            };

            $('body').toast({
                showIcon: iconMap[type] || 'info circle',
                message: message,
                class: classMap[type] || 'info',
                displayTime: 3000,
                showProgress: 'bottom',
                position: 'bottom right',
            });
        }

        // Prevent double-click on form submit buttons
        $('form').on('submit', function() {
            var $btn = $(this).find('button[type="submit"], input[type="submit"]');
            $btn.addClass('loading disabled');
            // Re-enable after 5s in case of AJAX forms that don't redirect
            setTimeout(function() {
                $btn.removeClass('loading disabled');
            }, 5000);
        });

        // Easter egg: Konami code
        var konamiCode = [38, 38, 40, 40, 37, 39, 37, 39, 66, 65];
        var konamiIndex = 0;

        $(document).on('keydown', function(e) {
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
            showToast('Ay caramba! Konami code activated!', 'success');
            document.body.classList.add('konami-active');

            // Brief yellow flash
            var overlay = document.createElement('div');
            overlay.style.cssText = 'position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(255,217,15,0.4);z-index:99999;pointer-events:none;transition:opacity 1s ease;';
            document.body.appendChild(overlay);
            setTimeout(function() {
                overlay.style.opacity = '0';
                setTimeout(function() { overlay.remove(); }, 1000);
            }, 500);
        }

        // Console easter egg
        if (window.console) {
            console.log('%cBienvenido a Los Simpson Theme!', 'color: #FFD90F; font-size: 20px; font-weight: bold; text-shadow: 2px 2px #000;');
            console.log('%cD\'oh!', 'color: #6BADE4; font-size: 14px; font-weight: bold;');
        }
    });

})(jQuery);
