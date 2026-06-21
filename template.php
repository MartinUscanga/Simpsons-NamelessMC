<?php
/*
 *  Made by Kiro AI
 *  https://namelessmc.com/
 *  NamelessMC version 2.x
 *
 *  License: MIT
 *
 *  Los Simpson Theme for NamelessMC
 */

class Simpsons_Template extends TemplateBase {
    
    private $_template;
    
    /** @var string */
    public $name = 'Simpsons';
    
    /** @var string */
    public $version = '2.0.0';
    
    /** @var string */
    public $nl_version = '2.0.0';
    
    /** @var string */
    public $author = '<a href="#" target="_blank">Tu Nombre</a>';
    
    public function __construct($smarty, $language, $user, $pages) {
        $this->_template = $smarty;
        
        parent::__construct($smarty, $language, $user, $pages);
        
        $this->addCSSFiles(array(
            (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/core/assets/css/bootstrap.min.css' => array(),
            (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/core/assets/css/animate.min.css' => array(),
            'https://fonts.googleapis.com/css2?family=Comic+Neue:wght@400;700&display=swap' => array(),
            'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css' => array(),
            (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/custom/templates/Simpsons/css/style.css' => array()
        ));
        
        $this->addJSFiles(array(
            (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/core/assets/js/jquery.min.js' => array(),
            (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/core/assets/js/bootstrap.bundle.min.js' => array(),
            (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/custom/templates/Simpsons/js/script.js' => array()
        ));
        
        // Assets
        $this->addCSSStyle('
            :root {
                --simpson-yellow: #FFD90F;
                --simpson-blue: #6BADE4;
                --simpson-sky: #8ED8F8;
                --simpson-pink: #FED7D8;
                --simpson-brown: #8B4513;
                --simpson-green: #90C054;
                --simpson-orange: #FFA500;
            }
        ');
    }
    
    public function onPageLoad() {
        $this->addCSSFiles(array(
            $this->_template->getTemplateFileFromCache('css/custom.css') => array()
        ));
        
        $this->_smarty->assign('TEMPLATE', array(
            'name' => $this->name,
            'version' => $this->version,
            'author' => $this->author,
            'path' => (defined('CONFIG_PATH') ? CONFIG_PATH : '') . '/custom/templates/' . $this->name . '/'
        ));
    }
}

$template = new Simpsons_Template($smarty, $language, $user, $pages);
$template_pagination = array(
    'previous' => '<i class="fas fa-chevron-left"></i>',
    'next' => '<i class="fas fa-chevron-right"></i>',
    'first' => '<i class="fas fa-angle-double-left"></i>',
    'last' => '<i class="fas fa-angle-double-right"></i>'
);
