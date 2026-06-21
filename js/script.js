/**
 * Los Simpson Theme JavaScript
 * NamelessMC v2.2.x
 * Uses Fomantic UI (not Bootstrap)
 *
 * NOTE: Dropdowns, popups, and other Fomantic UI
 * components are initialized by core.js - do NOT
 * re-initialize them here.
 */

(function($) {
    'use strict';

    $(document).ready(function() {

        // Console easter egg
        if (window.console && console.log) {
            console.log(
                '%cBienvenido a Los Simpson Theme!',
                'color: #FFD90F; font-size: 20px; font-weight: bold; text-shadow: 2px 2px #000;'
            );
            console.log(
                '%cD\'oh! - Homer Simpson',
                'color: #6BADE4; font-size: 14px; font-weight: bold;'
            );
        }

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

            // Brief yellow flash overlay
            var overlay = document.createElement('div');
            overlay.style.cssText = 'position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(255,217,15,0.4);z-index:99999;pointer-events:none;transition:opacity 1s ease;';
            document.body.appendChild(overlay);
            setTimeout(function() {
                overlay.style.opacity = '0';
                setTimeout(function() {
                    if (overlay.parentNode) {
                        overlay.parentNode.removeChild(overlay);
                    }
                }, 1000);
            }, 500);
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

        // Easter egg: "D'oh!" sound on double-click on site name in masthead
        $('.ui.masthead h1').on('dblclick', function() {
            var basePath = (typeof siteURL !== 'undefined' ? siteURL : '/');
            var templatePath = basePath + 'custom/templates/Simpsons-NamelessMC-main/';
            var audio = new Audio(templatePath + 'img/doh.mp3');
            audio.volume = 0.3;
            audio.play().catch(function() {
                // Audio playback requires user interaction first
            });

            // Quick bounce animation on the h1 element only
            var $el = $(this);
            $el.addClass('simpson-bounce');
            setTimeout(function() {
                $el.removeClass('simpson-bounce');
            }, 600);
        });

    });

})(jQuery);
