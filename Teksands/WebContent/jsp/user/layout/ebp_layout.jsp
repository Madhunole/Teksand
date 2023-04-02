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
	
	<link rel="stylesheet" href="/resources/ebp/assets/css/fontawesome.css">
	<link rel="stylesheet" href="/resources/ebp/assets/css/style.css">
	<link rel="stylesheet" href="/resources/ebp/assets/css/animated.css">
	<link rel="stylesheet" href="/resources/ebp/assets/css/owl.css">
	
	<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="/resources/images/cropped-ts-favicon.png" rel="icon">
    <title>Teksands</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <link href="/resources/ebp/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="/resources/ebp/assets/css/fontawesome.css">
    <link rel="stylesheet" href="/resources/ebp/assets/css/style.css">
    <link rel="stylesheet" href="/resources/ebp/assets/css/animated.css">
    <link rel="stylesheet" href="/resources/ebp/assets/css/owl.css">
    
    <link rel="stylesheet" type="text/css" href="/resources/revolution/css/settings.css">
    <link rel="stylesheet" type="text/css" href="/resources/revolution/css/layers.css">
    <link rel="stylesheet" type="text/css" href="/resources/revolution/css/navigation.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/custom.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/feedback.css">
    <link rel="stylesheet" href="/resources/js/sweetalert/sweetalert.css"/>
    
    <!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=G-Q47YHPZ538"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'G-Q47YHPZ538');
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
	
	
	<!-- End Facebook Pixel Code -->
	
	<meta name="facebook-domain-verification" content="5mm3zepih6a36m5g71n3yqmvqe0314" />
	<meta name="msvalidate.01" content="7B53EEEF122122079F253D2B21487ADC" />
	<meta name="google-site-verification" content="GjFMLJe4gz32HPXgDwo1ZVKIUaq_kRWhQaDdCLl-2C0" />

	
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

	<script src="/resources/ebp/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/ebp/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/ebp/assets/js/owl-carousel.js"></script>
	<script src="/resources/ebp/assets/js/animation.js"></script>
	<script src="/resources/ebp/assets/js/imagesloaded.js"></script>
	<script src="/resources/ebp/assets/js/custom.js"></script>
	<script src="/resources/ebp/assets/js/faq.js"></script>
	
	<script type="text/javascript" src="https://cdn.datatables.net/buttons/2.0.0/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.0.0/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.0.0/js/buttons.print.min.js"></script>
    
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    
     <script src="/resources/js/bootstrap.js"></script>
    <script src="/resources/js/plugins.js"></script>
    <script src="/resources/js/isotope.js"></script>
    <script src="/resources/js/imagesloaded.pkgd.js"></script>
    <script src="/resources/js/masonry-home-01.js"></script>  
    
	<script src="/resources/js/sweetalert/sweetalert.min.js"></script>
	<script src="<c:url value="/resources/js/overlay/loadingoverlay.js"/>"></script>
	<script type="text/javascript" src="/resources/js/feedback.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/jquery.themepunch.revolution.min.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/extensions/revolution.extension.migration.min.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/extensions/revolution.extension.video.min.js"></script>
	
</body>
</html>



