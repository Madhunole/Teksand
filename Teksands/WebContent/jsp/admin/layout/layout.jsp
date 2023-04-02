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

    <!-- SITE META -->

	<c:choose>
	
		<c:when test="${page eq 'admin-home'}">
		   	<title>Admin Dashboard- Teksands</title>
		   	<meta name="description" content="" />
		   	<meta name="keywords" content="" />
		   	<link rel="canonical" href="" />
		</c:when>
		
		<c:when test="${page eq 'admin-leads'}">
		   	<title>Admin Leads - Teksands</title>
		   	<meta name="description" content="" />
		   	<meta name="keywords" content="" />
		   	<link rel="canonical" href="" />
		</c:when>
  		
  		<c:when test="${page eq 'admin-contacts'}">
	   		<title>Admin Contacts - Teksands</title>
	   		<meta name="description" content="" />
	   		<meta name="keywords" content="" />
	   		<link rel="canonical" href="" />
		</c:when>	
	
		<c:when test="${page eq 'admin-contributor'}">
			<title>Admin Contributors - Teksands</title>
	   		<meta name="description" content="" />
	   		<meta name="keywords" content="" />
	   		<link rel="canonical" href="" />
	 	</c:when>
	 
	 	<c:when test="${page eq 'admin-trainers'}">
	   		<title>Admin Trainers - Teksands</title>
	   		<meta name="description" content="" />
	   		<meta name="keywords" content="" />
	   		<link rel="canonical" href="" />
	 	</c:when>
	 
	 	<c:when test="${page eq 'admin-careers'}">
	   		<title>Admin Careers - Teksands</title>
	   		<meta name="description" content="" />
	   		<meta name="keywords" content="" />
	   		<link rel="canonical" href="" />
	 	</c:when>
	 
	 	<c:when test="${page eq 'admin-internships'}">
	   		<title>Admin Internships - Teksands</title>
	   		<meta name="description" content="" />
	   		<meta name="keywords" content="" />
	   		<link rel="canonical" href="" />
	 	</c:when>
	 
	  	<c:when test="${page eq 'admin-ebooks'}">
	   		<title>Admin Ebooks Download - Teksands</title>
	   		<meta name="description" content="" />
	   		<meta name="keywords" content="" />
	   		<link rel="canonical" href="" />
	 	</c:when>
		<c:when test="${page eq 'admin-webinars'}">
	   		<title>Admin Webinars - Teksands</title>
	   		<meta name="description" content="" />
	   		<meta name="keywords" content="" />
	   		<link rel="canonical" href="" />
		</c:when>
	 	
	 	<c:when test="${page eq 'admin-webinars-contatcs'}">
	   		<title>Admin Webinars Contacts- Teksands</title>
	   		<meta name="description" content="" />
	   		<meta name="keywords" content="" />
	   		<link rel="canonical" href="" />
		</c:when>
	 	
	 	<c:when test="${page eq 'admin-jobs'}">
	   		<title>Admin Jobs List- Teksands</title>
	   		<meta name="description" content="" />
	   		<meta name="keywords" content="" />
	   		<link rel="canonical" href="" />
		</c:when>
	 
	 	<c:when test="${page eq 'admin-jobs-applications'}">
	   		<title>Admin Jobs Contacts- Teksands</title>
	   		<meta name="description" content="" />
	   		<meta name="keywords" content="" />
	   		<link rel="canonical" href="" />
	 	</c:when>
	 
	 	<c:when test="${page eq 'admin-jobs-post'}">
	   		<title>Admin Jobs Post- Teksands</title>
	   		<meta name="description" content="" />
	   		<meta name="keywords" content="" />
	   		<link rel="canonical" href="" />
	 	</c:when>
	 	
	 	<c:when test="${page eq 'admin-corporate-enquiry'}">
	   		<title>Admin Corporate Enquiries List - Teksands</title>
	   		<meta name="description" content="" />
	   		<meta name="keywords" content="" />
	   		<link rel="canonical" href="" />
	 	</c:when>
	 	
	 	<c:when test="${page eq 'admin-mentors'}">
	   		<title>Admin Mentors List - Teksands</title>
	   		<meta name="description" content="" />
	   		<meta name="keywords" content="" />
	   		<link rel="canonical" href="" />
	 	</c:when>
	 	
	 	<c:when test="${page eq 'admin-ebp-candidates'}">
	   		<title>Admin EBP Candidate List- Teksands</title>
	   		<meta name="description" content="" />
	   		<meta name="keywords" content="" />
	   		<link rel="canonical" href="" />
	 	</c:when>
	</c:choose>

    <!-- FAVICONS -->
    <link rel="shortcut icon" href="/resources/images/cropped-ts-favicon.png" />

    <link rel="stylesheet" type="text/css" href="/resources/revolution/css/settings.css">
    <link rel="stylesheet" type="text/css" href="/resources/revolution/css/layers.css">
    <link rel="stylesheet" type="text/css" href="/resources/revolution/css/navigation.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/custom.css">
    <link rel="stylesheet" type="text/css" href="/resources/js/sweetalert/sweetalert.css"/>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    
    <script src="/resources/js/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet" href="/resources/plugins/datatable/dataTables.bootstrap.css"/>
    
    <script type="text/javascript" src="/resources/plugins/datatable/jquery.dataTables.js"></script>
    <script type="text/javascript" src="/resources/plugins/datatable/dataTables.bootstrap.js"></script>
    
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.0.0/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.0.0/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.0.0/js/buttons.print.min.js"></script>
    
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    
    <!-- include summernote css/js -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	
	<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
	<script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
	<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
	<script src="https://cdn.amcharts.com/lib/5/percent.js"></script>

</head>
<body class="leftside">

	
	<!-- PRELOADER -->
        <div id="loader">
			<div class="loader-container">
				<img src="/resources/images/load.gif" alt="" class="loader-site spinner">
			</div>
		</div>
	<!-- END PRELOADER -->

    <!-- START SITE -->
    <div id="wrapper">
        <div class="row-offcanvas row-offcanvas-left">
            <div id="sidebar-fix" class="sidebar-offcanvas">
	            <tiles:insertAttribute name="header"></tiles:insertAttribute>
				<tiles:insertAttribute name="content"></tiles:insertAttribute>
		        <tiles:insertAttribute name="footer"></tiles:insertAttribute>
            </div>
        </div><!-- end main -->
    </div><!-- end wrapper -->

    <div class="dmtop">Top</div>
    <!-- END SITE -->

    <script src="/resources/js/bootstrap.js"></script>
    <script src="/resources/js/plugins.js"></script>
	<script src="/resources/js/sweetalert/sweetalert.min.js"></script>
	<script src="<c:url value="/resources/js/overlay/loadingoverlay.js"/>"></script>
	<!-- <script type="text/javascript" src="/resources/js/feedback.js"></script> -->

    <!-- REVOLUTION JS FILES -->
    <script type="text/javascript" src="/resources/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/jquery.themepunch.revolution.min.js"></script>

    <!-- SLIDER REVOLUTION 5.0 EXTENSIONS -->  
    <script type="text/javascript" src="/resources/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/extensions/revolution.extension.migration.min.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
    <script type="text/javascript" src="/resources/revolution/js/extensions/revolution.extension.video.min.js"></script>
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
                    sliderLayout:"fullscreen",
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
    })(jQuery);
    </script>   
    
    <script type="text/javascript">
    (function($) {
    "use strict";
        $('[data-toggle=offcanvas]').click(function() {
        $('.row-offcanvas').toggleClass('active');
        });  
    })(jQuery);
    </script> 

</body>
</html>     