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
        $('a[href*="#"]').not('[href="#"]').not('[href="#0"]').not('[data-toggle]').click(function(event) {
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
                    }, 600);
                }
            }
        });

        // Intersection Observer animation for cards (fade in on scroll)
        // Only apply to elements that are NOT already in the viewport
        if (typeof IntersectionObserver !== 'undefined') {
            var cards = document.querySelectorAll('.ui.card, .ui.fluid.card');
            var cardObserver = new IntersectionObserver(function(entries) {
                entries.forEach(function(entry) {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('simpson-visible');
                        cardObserver.unobserve(entry.target);
                    }
                });
            }, {
                threshold: 0.05,
                rootMargin: '50px 0px 0px 0px'
            });

            cards.forEach(function(card) {
                // Check if element is already in viewport (above the fold)
                var rect = card.getBoundingClientRect();
                if (rect.top < window.innerHeight && rect.bottom > 0) {
                    // Already visible, don't animate
                    card.classList.add('simpson-visible');
                } else {
                    // Below the fold, add animation class
                    card.classList.add('simpson-animate-in');
                    cardObserver.observe(card);
                }
            });
        }

        // Easter egg: "D'oh!" sound on double-click on site name in masthead
        $('.ui.masthead h1').on('dblclick', function() {
            playDohSound();
        });

        function playDohSound() {
            // Build template path from siteURL (injected by NamelessMC core)
            var basePath = (typeof siteURL !== 'undefined' ? siteURL : '/');
            var templatePath = basePath + 'custom/templates/Simpsons-NamelessMC-main/';
            var audio = new Audio(templatePath + 'img/doh.mp3');
            audio.volume = 0.3;
            audio.play().catch(function() {
                // Audio playback requires user interaction first, silently ignore
            });

            // Quick bounce animation on the element
            var $el = $('.ui.masthead h1');
            $el.addClass('simpson-bounce');
            setTimeout(function() {
                $el.removeClass('simpson-bounce');
            }, 600);
        }

        // Copy server IP to clipboard (used in masthead connect-server)
        $(document).on('click', '[data-clipboard]', function(e) {
            e.preventDefault();
            var ip = $(this).data('clipboard') || $(this).text().trim();

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
                position: 'bottom right'
            });
        }

        // Prevent double-click on form submit buttons (excluding search forms)
        $('form:not(.search)').on('submit', function() {
            var $btn = $(this).find('button[type="submit"], input[type="submit"]');
            if ($btn.length && !$btn.hasClass('disabled')) {
                $btn.addClass('loading disabled');
                // Re-enable after 8s in case of AJAX forms that don't redirect
                setTimeout(function() {
                    $btn.removeClass('loading disabled');
                }, 8000);
            }
        });

        // Easter egg: Konami code (up up down down left right left right B A)
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

            // Brief yellow flash overlay
            var overlay = document.createElement('div');
            overlay.style.cssText = 'position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(255,217,15,0.4);z-index:99999;pointer-events:none;transition:opacity 1s ease;';
            document.body.appendChild(overlay);
            setTimeout(function() {
                overlay.style.opacity = '0';
                setTimeout(function() {
                    if (overlay.parentNode) overlay.parentNode.removeChild(overlay);
                }, 1000);
            }, 500);
        }

        // Console easter egg
        if (window.console && console.log) {
            console.log('%cBienvenido a Los Simpson Theme!', 'color: #FFD90F; font-size: 20px; font-weight: bold; text-shadow: 2px 2px #000;');
            console.log('%cD\'oh! - Homer Simpson', 'color: #6BADE4; font-size: 14px; font-weight: bold;');
        }
    });

})(jQuery);
