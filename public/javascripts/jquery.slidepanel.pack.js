/**
 * Sliding Panles 1.0.2 - jQuery plugin for accessible, unobtrusive Sliding Panels
 * @requires jQuery 1.2.1
 *
 * http://www.andreacfm.com/jquery-plugins
 *
 * Copyright (c) 2007 Andrea Campolonghi (andreacfm.com)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 * Version: 1.0
 * 10/10/2007: added function for relational mode
 *
 */

var $panArray;var $targArray;var $panAcc;jQuery.fn.slidePanel=function(parameters){settings={status:'closed',speed:'normal',target:'next',remote:'false',role:'normal'};jQuery.extend(settings,parameters);return this.each(function(){var $panel=$(this);if(settings.target=='next'){var $target=$panel.next()}else{var $target=$(settings.target)}if(settings.status=='closed'){$target.addClass('panel-target panel-closed');$panel.addClass('panel panel-up')}else{$target.addClass('panel-target');$panel.addClass('panel panel-down')}if(settings.role=='accordion'){panelAcc($target);if($panAcc.length=='1'){$panAcc[0].removeClass('panel-closed')}$panel.click(function(){for(var j=0;j<$panAcc.length;j++){if($panAcc[j]!=$target){$panAcc[j].slideUp();$panAcc[j].prev().removeClass('panel-down').addClass('panel-up')}}$target.slideDown();$target.prev().addClass('panel-down').removeClass('panel-up')})}else if(settings.role=='master'){$panel.click(function(){$target.slideToggle(settings.speed);for(var i=0;i<$targArray.length;i++){$targArray[i].slideToggle()}for(var i=0;i<$panArray.length;i++){if($panArray[i].hasClass('panel-down')){$panArray[i].addClass('panel-up').removeClass('panel-down')}else{$panArray[i].addClass('panel-down').removeClass('panel-up')}}})}else{if(settings.remote=='true'&&settings.status!='closed'){var page=$panel.children().filter('a').eq(0).attr('href');$target.load(page)}if(settings.role=='dep'){panelAssets($panel,$target)}$panel.click(function(){if(settings.remote=='true'){var txt=$target.text();if(txt.length=='0'){var $a=$panel.children().filter('a').eq(0);var exText=$a.text();$a.text('Loading....');var page=$panel.children().filter('a').attr('href');$target.load(page,function(){$a.text(exText)})}}$target.slideToggle(settings.speed);$panel.toggleClass('panel-down');$panel.toggleClass('panel-up');return false})}});function panelAssets(elem,elem1){if($panArray==undefined&&$targArray==undefined){$panArray=[];$panArray[0]=elem;$targArray=[];$targArray[0]=elem1}else{$panArray[$panArray.length]=elem;$targArray[$targArray.length]=elem1}}function panelAcc(elem){if($panAcc==undefined){$panAcc=[];$panAcc[0]=elem}else{$panAcc[$panAcc.length]=elem}}}