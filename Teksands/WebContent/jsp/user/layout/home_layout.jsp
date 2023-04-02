<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="robots" content="max-image-preview:standard">

    <title>Teksands – Your Talent Solutions Partner</title>
    <meta name="description" content="Searching for online coding bootcamp and development programs for employees? At Teksands, we provide courses related to Data Science, Machine Learning, DevOps." />
    <link rel="canonical" href="https://teksands.ai/" />
   
  <!-- <meta property="og:title" content="Teksands – Your Deep Tech Learning Buddy">
	<meta property="og:site_name" content="Teksands">
	<meta property="og:url" content="https://teksands.ai/">
	<meta property="og:description" content="">
	<meta property="og:image" content="https://teksands.ai/resources/images/teksands_logo.jpg">-->
	
	<meta property="og:title" content="Teksands – Your Talent Solutions Partner">
	<meta property="og:site_name" content="Teksands">
	<meta property="og:url" content="https://teksands.ai/">
	<meta property="og:description" content="Searching for online coding bootcamp and development programs for employees? At Teksands, we provide courses related to Data Science, Machine Learning, DevOps.">
	<meta property="og:type" content="website">
	<meta property="og:image" content="https://teksands.ai/resources/images/teksands_logo.jpg">
	
	<meta name="twitter:site" content="@teksands" />
	<meta name="twitter:title" content="Teksands – Your Deep Tech Learning Buddy" />
	<meta name="twitter:description" content="" />
	<meta name="twitter:image" content="https://teksands.ai/resources/images/teksands_logo.jpg" />
	
    <link rel="shortcut icon" href="/resources/images/cropped-ts-favicon.png" />
      
    <script type="text/javascript" src="/resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/cdn/js/jquery.cookie.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css">
    
    <!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=G-W50BZH6XG6"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'G-W50BZH6XG6');
	</script>
	
	<!-- Facebook Pixel Code -->
	<script>
	!function(f,b,e,v,n,t,s)
	{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
	n.callMethod.apply(n,arguments):n.queue.push(arguments)};
	if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
	n.queue=[];t=b.createElement(e);t.async=!0;
	t.src=v;s=b.getElementsByTagName(e)[0];
	s.parentNode.insertBefore(t,s)}(window, document,'script',
	'https://connect.facebook.net/en_US/fbevents.js');
	fbq('init', '558659045361234');
	fbq('track', 'PageView');
	</script>
	
	<noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=558659045361234&ev=PageView&noscript=1"/></noscript>
	
	<!-- End Facebook Pixel Code -->
	
	<meta name="facebook-domain-verification" content="5mm3zepih6a36m5g71n3yqmvqe0314" />
	<meta name="msvalidate.01" content="7B53EEEF122122079F253D2B21487ADC" />
	<meta name="google-site-verification" content="GjFMLJe4gz32HPXgDwo1ZVKIUaq_kRWhQaDdCLl-2C0" />
	
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org",
  		"@type": "CollegeOrUniversity",
  		"name": "Teksands",
  		"url": "https://teksands.ai/",
  		"logo": "https://teksands.ai/resources/images/teksands_logo.jpg",
  		"sameAs": [
    		"https://www.facebook.com/Teksands/",
    		"https://www.instagram.com/teksands.ai/",
    		"https://www.youtube.com/channel/UCrfexSD469V7WXVAAVd3Uag/featured",
    		"https://twitter.com/teksands",
    		"https://www.linkedin.com/company/teksands/"
  		]
	}
	</script>
	
		<script type="application/ld+json">
{
  "@context": "https://schema.org/",
  "@type": "WebSite",
  "name": "Teksands",
  "url": "https://teksands.ai/",
  "potentialAction": {
    "@type": "SearchAction",
    "target": "https://teksands.ai/{search_term_string}",
    "query-input": "required name=search_term_string"
  }
}
	</script>
	
	<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "EmploymentAgency",
  "name": "WRTR INK LLP",
  "image": "https://lh5.googleusercontent.com/p/AF1QipMp3k4Opfr9Bv-rPQngVLxs_ASDXnmKp68s_ubp=w689-h240-k-no",
  "@id": "",
  "url": "https://www.google.com/maps/place/WRTR+INK+LLP/@20.9880134,73.7876857,5z/data=!4m14!1m8!3m7!1s0x3bae6bcec1a821d5:0xfd82d205157fa43c!2sWRTR+INK+LLP!8m2!3d20.9880134!4d82.7525294!14m1!1BCgIgARICEAE!3m4!1s0x3bae6bcec1a821d5:0xfd82d205157fa43c!8m2!3d20.9880134!4d82.7525294",
  "telephone": "+91 9343518946",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "Karnataka,",
    "addressLocality": "Bangalore",
    "postalCode": "560068",
    "addressCountry": "IN"
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": 12.8892684,
    "longitude": 77.63991
  },
  "openingHoursSpecification": {
    "@type": "OpeningHoursSpecification",
    "dayOfWeek": [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ],
    "opens": "09:00",
    "closes": "06:00"
  },
  "sameAs": [
    "https://www.facebook.com/Teksands/",
    "https://twitter.com/teksands",
    "https://www.instagram.com/teksands.ai/",
    "https://www.youtube.com/channel/UCrfexSD469V7WXVAAVd3Uag/featured",
    "https://www.linkedin.com/company/teksands/",
    "https://teksands.ai/"
  ] 
}
</script>
	
<script type="application/ld+json">
	{
 		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
    	"item": "https://teksands.ai/"  
 	 }]
	}
	</script>
</head>
<body>

	<!-- PRELOADER -->
        <div id="loader">
			<div class="loader-container">
				<img src="/resources/images/load.gif" alt="" class="loader-site spinner">
			</div>
		</div>
	<!-- END PRELOADER -->

    <!-- START SITE -->
    <div id="wrapper">

        <tiles:insertAttribute name="header"></tiles:insertAttribute>
		
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
		
        <tiles:insertAttribute name="footer"></tiles:insertAttribute>
        
      </div><!-- end wrapper -->
    <div class="dmtop">Top</div>
    <!-- END SITE -->
    
    
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/custom.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/feedback.css">
    <link rel="stylesheet" type="text/css" href="/resources/js/sweetalert/sweetalert.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/sections.css"/>

    <script type="text/javascript" src="/resources/js/bootstrap.js"></script>
    <script type="text/javascript" src="/resources/js/plugins.js"></script>

    <link rel="stylesheet" type="text/css" href="/resources/revolution/css/settings.css">
    <link rel="stylesheet" type="text/css" href="/resources/revolution/css/layers.css">
    <link rel="stylesheet" type="text/css" href="/resources/revolution/css/navigation.css">
	
    <script type="text/javascript" src="/resources/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/jquery.themepunch.revolution.min.js"></script>

    
    <script type="text/javascript" src="/resources/js/isotope.js"></script>
    <script type="text/javascript" src="/resources/js/imagesloaded.pkgd.js"></script>
    <script type="text/javascript" src="/resources/js/masonry-home-01.js"></script>  
    
	<script type="text/javascript" src="/resources/js/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="/resources/js/overlay/loadingoverlay.js"></script>
	<script type="text/javascript" src="/resources/js/feedback.js"></script>
	
	
   
    <script type="text/javascript">
    (function($) {
    "use strict";
        var tpj=jQuery;             
        var revapi98;
            tpj(document).ready(function() {
                if(tpj("#rev_slider_98_1").revolution == undefined){
                    revslider_showDoubleJqueryError("#rev_slider_98_1");
                    }else{
                    revapi98 = tpj("#rev_slider_98_1").show().revolution({
                    sliderType:"hero",
                    jsFileLocation:"revolution/js/",
                    sliderLayout:"fullwidth",
                    dottedOverlay:"none",
                    delay:9000,
                    navigation: {
                    },
                    responsiveLevels:[1240,1024,778,480],
                    gridwidth:[1240,1024,778,480],
                    gridheight:[600,550,500,500],
                    lazyType:"none",
                    parallax: {
                    type:"mouse",
                    origo:"slidercenter",
                    speed:2000,
                    levels:[2,3,4,5,6,7,12,16,10,50],
                    },
                    shadow:0,
                    spinner:"off",
                    autoHeight:"off",
                    disableProgressBar:"on",
                    hideThumbsOnMobile:"off",
                    hideSliderAtLimit:0,
                    hideCaptionAtLimit:0,
                    hideAllCaptionAtLilmit:0,
                    debugMode:false,
                    fallbacks: {
                    simplifyAll:"off",
                    disableFocusListener:false,
                    }
                });
            }
        }); /*ready*/

        var tpj = jQuery;
        var revapi213;
        tpj(document).ready(function() {
            if (tpj("#rev_slider_213_1").revolution == undefined) {
                revslider_showDoubleJqueryError("#rev_slider_213_1");
            } else {
                revapi213 = tpj("#rev_slider_213_1").show().revolution({
                sliderType: "standard",
                jsFileLocation: "/resources/revolution/js/",
                sliderLayout: "auto",
                dottedOverlay: "none",
                delay: 9000,
                navigation: {
                keyboardNavigation: "off",
                keyboard_direction: "horizontal",
                mouseScrollNavigation: "off",
                onHoverStop: "on",
                touch: {
                touchenabled: "on",
                swipe_threshold: 75,
                swipe_min_touches: 50,
                swipe_direction: "horizontal",
                drag_block_vertical: false
                },
                arrows: {
                style: "gyges",
                enable: true,
                hide_onmobile: false,
                hide_onleave: false,
                tmp: '',
                left: {
                h_align: "right",
                v_align: "bottom",
                h_offset: 40,
                v_offset: 0
                },
                right: {
                h_align: "right",
                v_align: "bottom",
                h_offset: 0,
                v_offset: 0
                }
                }
                },
                responsiveLevels: [1240, 1024, 778, 480],
                visibilityLevels: [1240, 1024, 778, 480],
                gridwidth: [1200, 1024, 778, 480],
                gridheight: [600, 600, 600, 600],
                lazyType: "single",
                parallax: {
                type: "scroll",
                origo: "slidercenter",
                speed: 400,
                levels: [5, 10, 15, 20, 25, 30, 35, 40, 45, 46, 47, 48, 49, 50, 51, 55],
                type: "scroll",
                },
                shadow: 0,
                spinner: "off",
                stopLoop: "off",
                stopAfterLoops: -1,
                stopAtSlide: -1,
                shuffle: "off",
                autoHeight: "off",
                disableProgressBar: "on",
                hideThumbsOnMobile: "off",
                hideSliderAtLimit: 0,
                hideCaptionAtLimit: 0,
                hideAllCaptionAtLilmit: 0,
                debugMode: false,
                fallbacks: {
                simplifyAll: "off",
                nextSlideOnWindowFocus: "off",
                disableFocusListener: false,
                }
            });
        }
    }); /*ready*/   
    })(jQuery);
    
    
    (function($) {
    "use strict";
        var tpj=jQuery;             
        var revapi98;
            tpj(document).ready(function() {
                if(tpj("#rev_slider_98_1").revolution == undefined){
                    revslider_showDoubleJqueryError("#rev_slider_98_1");
                    }else{
                    revapi98 = tpj("#rev_slider_98_1").show().revolution({
                    sliderType:"hero",
                    jsFileLocation:"revolution/js/",
                    sliderLayout:"fullwidth",
                    dottedOverlay:"none",
                    delay:9000,
                    navigation: {
                    },
                    responsiveLevels:[1240,1024,778,480],
                    gridwidth:[1240,1024,778,480],
                    gridheight:[600,550,400,300],
                    lazyType:"none",
                    parallax: {
                    type:"mouse",
                    origo:"slidercenter",
                    speed:2000,
                    levels:[2,3,4,5,6,7,12,16,10,50],
                    },
                    shadow:0,
                    spinner:"off",
                    autoHeight:"off",
                    disableProgressBar:"on",
                    hideThumbsOnMobile:"off",
                    hideSliderAtLimit:0,
                    hideCaptionAtLimit:0,
                    hideAllCaptionAtLilmit:0,
                    debugMode:false,
                    fallbacks: {
                    simplifyAll:"off",
                    disableFocusListener:false,
                    }
                });
            }
        }); /*ready*/

        var tpj=jQuery;             
        var revapi98;
            tpj(document).ready(function() {
                if(tpj("#rev_slider_98_2").revolution == undefined){
                    revslider_showDoubleJqueryError("#rev_slider_98_2");
                    }else{
                    revapi98 = tpj("#rev_slider_98_2").show().revolution({
                    sliderType:"hero",
                    jsFileLocation:"revolution/js/",
                    sliderLayout:"fullwidth",
                    dottedOverlay:"none",
                    delay:9000,
                    navigation: {
                    },
                    responsiveLevels:[1240,1024,778,480],
                    gridwidth:[1240,1024,778,480],
                    gridheight:[400,350,300,300],
                    lazyType:"none",
                    parallax: {
                    type:"mouse",
                    origo:"slidercenter",
                    speed:2000,
                    levels:[2,3,4,5,6,7,12,16,10,50],
                    },
                    shadow:0,
                    spinner:"off",
                    autoHeight:"off",
                    disableProgressBar:"on",
                    hideThumbsOnMobile:"off",
                    hideSliderAtLimit:0,
                    hideCaptionAtLimit:0,
                    hideAllCaptionAtLilmit:0,
                    debugMode:false,
                    fallbacks: {
                    simplifyAll:"off",
                    disableFocusListener:false,
                    }
                });
            }
        }); /*ready*/
    })(jQuery);
    
    
//https://codepen.io/bootstrapthemes/pen/YpLYJx 

/*Bootstrap Carousel Touch Slider.
 http://bootstrapthemes.co
 
 Credits: Bootstrap, jQuery, TouchSwipe, Animate.css, FontAwesome
 
 */

( function ( $ ) {
    "use strict";

    $.fn.bsTouchSlider = function ( options ) {
        var carousel = $( ".carousel" );
        return this.each( function ( ) {

            function doAnimations( elems ) {
                //Cache the animationend event in a variable
                var animEndEv = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
                elems.each( function ( ) {
                    var $this = $( this ),
                        $animationType = $this.data( 'animation' );
                    $this.addClass( $animationType ).one( animEndEv, function ( ) {
                        $this.removeClass( $animationType );
                    } );
                } );
            }

            //Variables on page load
            var $firstAnimatingElems = carousel.find( '.item:first' ).find( "[data-animation ^= 'animated']" );
            //Initialize carousel
            carousel.carousel( );
            //Animate captions in first slide on page load
            doAnimations( $firstAnimatingElems );
            //Other slides to be animated on carousel slide event
            carousel.on( 'slide.bs.carousel', function ( e ) {
                var $animatingElems = $( e.relatedTarget ).find( "[data-animation ^= 'animated']" );
                doAnimations( $animatingElems );
            } );
            //swipe initial 
            $( ".carousel .carousel-inner" ).swipe( {
                swipeLeft: function ( event, direction, distance, duration, fingerCount ) {
                    this.parent( ).carousel( 'next' );
                },
                swipeRight: function ( ) {
                    this.parent( ).carousel( 'prev' );
                },
                threshold: 0
            } );

        } );
    };


} )( jQuery );



$('#bootstrap-touch-slider').bsTouchSlider();
    
    </script>   
	
</body>
</html>



