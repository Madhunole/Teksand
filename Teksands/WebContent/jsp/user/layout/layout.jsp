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
 	
<c:choose>             
  
  <c:when test="${page eq 'home'}">
   <title>Teksands – Your Talent Solutions Partner</title>
   <meta name="description" content="Searching for online coding bootcamp and development programs for employees? At Teksands, we provide courses related to Data Science, Machine Learning, DevOps." />
   <link rel="canonical" href="https://teksands.ai/" />
   	<meta property="og:title" content="Teksands – Your Talent Solutions Partner">
	<meta property="og:site_name" content="Teksands">
	<meta property="og:url" content="https://teksands.ai/">
	<meta property="og:description" content="Searching for online coding bootcamp and development programs for employees? At Teksands, we provide courses related to Data Science, Machine Learning, DevOps.">
	<meta property="og:type" content="website">
	<meta property="og:image" content=https://teksands.ai/resources/images/teksands_logo.jpg>
	
   	<!--  <meta property="og:title" content="Teksands – Your Deep Tech Learning Buddy">
	<meta property="og:site_name" content="Teksands">
	<meta property="og:url" content="https://teksands.ai/">
	<meta property="og:description" content="">
	<meta property="og:image" content="https://teksands.ai/resources/images/teksands_logo.jpg">-->
	
	<meta name="twitter:site" content="@teksands" />
	<meta name="twitter:title" content="Teksands – Your Deep Tech Learning Buddy" />
	<meta name="twitter:description" content="" />
	<meta name="twitter:image" content="https://teksands.ai/resources/images/teksands_logo.jpg" />
	
  </c:when>
  
  <c:when test="${page eq 'corporate'}">
   <title>Teksands - Corporate Training</title>
   <meta name="description" content="Ensure your personnel are constantly trained on methodologies and soft skills to attain holistic success in their career as well as for the Corporates." />
   <meta name="keywords" content="" />
   <link rel="canonical" href="https://teksands.ai/corporate-training" />
  </c:when>
  
  <c:when test="${page eq 'trainer'}">
   <title>Teksands - Trainer/Mentor Registration</title>
   <meta name="description" content="Teksands courses are intended to help working professionals achieve career augmentation and organizations to fulfill technology skills needs." />
   <meta name="keywords" content="" />
   <link rel="canonical" href="https://teksands.ai/become-a-trainer" />
  </c:when>
  
  <c:when test="${page eq 'ebp-program'}">
   <title>Hire Full Stack and Java Developer - Teksands</title>
   <meta name="description" content="Teksands’ Lift-off program is designed to bring skilled Full Stack developers into the IT industry and help recruiters hire skilled professionals in the industry." />
   <meta name="keywords" content="" />
   <link rel="canonical" href="https://teksands.ai/ebp" />
  </c:when>
  
  <c:when test="${page eq 'mentor-registration'}">
   <title>Teksands - Mentor Registration</title>
   <meta name="description" content="In the Bootcamp, you will go through a rigorous but fun-filled 2-3 months program under an experienced industry Mentor. For more information click here." />
   <meta name="keywords" content="" />
   <link rel="canonical" href="https://teksands.ai/mentor-registration" />
  </c:when>
  
  <c:when test="${page eq 'corporate-enquiry'}">
   <title>Teksands - Corporate Enquiry</title>
   <meta name="description" content="Teksands is a fast growing start-up in the EdTech Industry. We provide Courses on Deep Tech including Data Science, Machine Learning, Python, Deep Learning & etc." />
   <meta name="keywords" content="" />
   <link rel="canonical" href="https://teksands.ai/corporate-enquiry" />
  </c:when>
  
  <c:when test="${page eq 'ebp-candidate-application'}">
   <title>Teksands -  EBP Candidate Application</title>
   <meta name="description" content="In our Teksands Lift-off program, we aim to provide you with the right opportunity with our top clients in areas such as Cloud, Data Science, ML, React & etc." />
   <meta name="keywords" content="" />
   <link rel="canonical" href="https://teksands.ai/ebp-candidate-application" />
  </c:when>
  
  <c:when test="${page eq 'contributor'}">
   <title>Work with Us - Teksands</title>
   <meta name="description" content="Courses provided by Teksands are designed to assist working professionals in career advancement, as well as organizations in filling technology skills gaps." />
   <meta name="keywords" content="" />
   <link rel="canonical" href="https://teksands.ai/contributor" />
  </c:when>
  
  
  <c:when test="${page eq 'privacy-policy'}">
   <title>Privacy Policy of Teksands | Teksands.ai</title>
   <meta name="description" content="Information we collect, Children's Privacy, Billing, cookies, Cookies, Third-Party Cookies, Web Beacons, Web Pages, Log Files, Personal information." />
   <meta name="keywords" content="" />
   <link rel="canonical" href="https://teksands.ai/privacy-policy" />
  </c:when>
  
  <c:when test="${page eq 'terms-ofuse'}">
   <title>Terms and Conditions - Teksands</title>
   <meta name="description" content="Learn everything about Teksands’ website’s terms of use. Click here to read. Contact info@teksands.ai for inquiries and more information." />
   <meta name="keywords" content="" />
   <link rel="canonical" href="https://teksands.ai/terms-of-use" />
  </c:when>
  
  <c:when test="${page eq 'blog' }">
     <title>Informative blogs on Teksands | Teksands.ai<c:if test="${pageid > 1}"> | Page <c:out value="${pageid}" /></c:if></title>	
     <meta name="description" content="Read interesting articles on various topics relating to Machine Learning, Data Science and more right here. Contact info@teksands.ai for enquiries." />
     <link rel="canonical" href="https://teksands.ai/blog"/>     
   
  </c:when>
  
  <c:when test="${page eq 'blog-details' }">
	<title><c:out value="${blog.meta_title}test" /></title>	
	<meta name="description" content="<c:out value="${blog.meta_desc}" />" />
	<meta name="keywords" content="<c:out value="${blog.meta_keyword}" />">
	<link rel="canonical" href="https://teksands.ai/blog/${blog.blog_url}"/>
	
	<meta property="og:title" content="<c:out value="${blog.meta_title}" />">
	<meta property="og:site_name" content="Teksands">
	<meta property="og:url" content="https://teksands.ai/blog/<c:out value="${blog.blog_url}" />">
	<meta property="og:description" content="<c:out value="${blog.meta_desc}" />">
	<meta property="og:type" content="article">
	<meta property="og:image" content="https://teksands.ai/resources/images/blogs/<c:out value="${blog.title_folder}" />/<c:out value="${blog.photo}" />">
  
   
  
  </c:when>
  
  <c:when test="${page eq 'article' }">
     <title>Shortreads at Teksands | Teksands.ai<c:if test="${pageid > 1}"> | Page <c:out value="${pageid}" /></c:if></title>	
     <meta name="description" content="Read short write ups on AI. Learn how Machine Learning and Data Science is creating ripples in most of the industries. Learn more on DevOps, and our life-off program." />
     <link rel="canonical" href="https://teksands.ai/shortreads"/>
  </c:when>
  
  
  <c:when test="${page eq 'article-details' }">
	<title><c:out value="${article.meta_title}" /></title>	
	<meta name="description" content="<c:out value="${article.meta_desc}" />" />
	<meta name="keywords" content="<c:out value="${article.meta_keywords}" />" />
	<link rel="canonical" href="https://teksands.ai/shortreads/${article.blog_url}"/>
	
	<meta property="og:title" content="<c:out value="${article.meta_title}" />">
	<meta property="og:site_name" content="Teksands">
	<meta property="og:url" content="https://teksands.ai/shortreads/<c:out value="${article.blog_url}" />">
	<meta property="og:description" content="<c:out value="${article.meta_desc}" />">
	<meta property="og:type" content="article">
	<meta property="og:image" content="https://teksands.ai/resources/images/articles/<c:out value="${article.title_folder}" />/<c:out value="${article.photo}" />">
	
	

  </c:when>
  
  <c:when test="${page eq 'login'}">
   <title>Login - Teksands</title>
   <meta name="description" content="Our mission at Teksands is to help create a workforce that is Future-ready.  Log in to Teksands and start learn data science, React, Angular, Java, Python & etc." />
   <meta name="keywords" content="" />
   <link rel="canonical" href="https://teksands.ai/login" />
  </c:when>
  
  <c:when test="${page eq 'videos'}">
   <title>Informative Videos on AI, ML, and More | Teksands.ai </title>
   <meta name="description" content="Watch the most interesting videos on AI, ML, DevOps, and more right here. Learn with Teksands. Contact info@teksands.ai for enquiries and more information. " />
   <meta name="keywords" content="" />
   <link rel="canonical" href="https://teksands.ai/videos" />
  </c:when>
  
  <c:when test="${page eq 'live-courses'}">
   <title>Teksands - Upcoming Live Courses</title>
   <meta name="description" content="Schedule of upcoming classes can be found here. Sign up for a free class. There are many of them that come with certificates! Find out what's available and sign up!" />
   <meta name="keywords" content="" />
   <link rel="canonical" href="https://teksands.ai/upcoming-live-courses" />
  </c:when>
  
  <c:when test="${page eq 'careers'}">
   <title>Teksands Careers</title>
   <meta name="description" content="Want to make the web a better place for the billions of people who visit it every month? Apply now. For more information visit teksands.ai." />
   <meta name="keywords" content="" />
   <link rel="canonical" href="https://teksands.ai/work-with-us" />
  </c:when>
  
  <c:when test="${page eq 'internships'}">
   <title>Teksands - Internship Application</title>
   <meta name="description" content="Students in 4th year, fresh pass-out or working professionals looking to switch to Technology are eligible to apply through this program. Contact us today!!" />
   <meta name="keywords" content="" />
   <link rel="canonical" href="https://teksands.ai/internships" />
  </c:when>
  
  <c:when test="${page eq 'webinars-registration'}">
   <title>Teksands - Webinars Registration</title>
   <meta name="description" content="" />
   <meta name="keywords" content="" />
   <link rel="canonical" href=https://teksands.ai/webinars-registration />
  </c:when>
  
	<c:when test="${page eq 'webinars'}">
		<title>Teksands - Webinars</title>
		<meta name="description" content="Our IT webinars will teach you what you need to know about emerging technology trends, mastering your role, and improving your skills. Click here to register!" />
		<meta name="keywords" content="" />
		<link rel="canonical" href="https://teksands.ai/webinars" />
	</c:when>
  
  <c:when test="${page eq 'ebooks'}">
   <title>Python For Data Science | Random Forest | Teksands.ai</title>
   <meta name="description" content="Teksands offers you ML, AI, and several courses on several technologies that are aimed to build you a strong skill set. Contact info@teksands.ai for inquiries." />
   <meta name="keywords" content="" />
   <link rel="canonical" href="https://teksands.ai/e-books" />
  </c:when>
  
  <c:when test="${page eq 'contact'}">
   <title>Teksands - Contact Us</title>
   <meta name="description" content="Teksands courses are designed to help working professionals enhance their careers and organizations fulfill technology skills requirements. Contact us Today!!" />
   <meta name="keywords" content="https://teksands.ai/contact-us" />
   <link rel="canonical" href="https://teksands.ai/contact-us" />
  </c:when>
  
  <c:when test="${page eq 'error'}">
   <title>Teksands - Page Not Found</title>
   <meta name="description" content="" />
   <meta name="keywords" content="" />
   <link rel="canonical" href="https://teksands.ai/error" />
   <meta name="robots" content="noindex, nofollow" />
  </c:when>
  
  <c:when test="${page eq 'jobs'}">
   <title>Teksands Open Jobs | Off Campus Jobs <c:if test="${pageid > 1}"> | Page <c:out value="${pageid}" /></c:if></title>	
   <meta name="description" content="Open Jobs At Teksands | Off Campus Jobs <c:if test="${pageid > 1}"> Page <c:out value="${pageid}" /></c:if>" />
   <meta name="keywords" content="" />
   <link rel="canonical" href="https://teksands.ai/jobs" />
  </c:when>
  
  <c:when test="${page eq 'jobs-details'}">
   <title>${jobs.meta_title}</title>
   <meta name="description" content="${jobs.meta_desc}" />
   <meta name="keywords" content="${jobs.meta_keywords}" />
   <link rel="canonical" href="https://teksands.ai/jobs/${jobs.jobs_url}" />
   	
   	<meta property="og:title" content="Teksands - ${jobs.role_name}">
	<meta property="og:site_name" content="Teksands">
	<meta property="og:url" content="https://teksands.ai/jobs/${jobs.jobs_url}">
	<meta property="og:description" content="">
	<meta property="og:type" content="article">
	
  	<meta property="twitter:card" content="summary_large_image">
	<meta property="twitter:url" content="https://teksands.ai/jobs/${jobs.jobs_url}">
	<meta property="twitter:title" content="Teksands - ${jobs.role_name}">
	<meta property="twitter:description" content="">
	
  </c:when>
  
	<c:when test="${page eq 'propel-program'}">
		<title>Propel Program - Teksands</title>	
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="canonical" href="https://teksands.ai/propel" />
	</c:when>
	
	<c:when test="${page eq 'accel-program'}">
		<title>Accel Program - Teksands</title>	
		<meta name="description" content="Today, Recruitment is fraught with several challenges. And recruiting the right workforce is critical to the business. Check out the Accel Hire Program." />
		<meta name="keywords" content="" />
		<link rel="canonical" href="https://teksands.ai/accel-hire" />
	</c:when>
  
	 
</c:choose>
    
    <link rel="shortcut icon" href="/resources/images/cropped-ts-favicon.png" />
    <link rel="stylesheet" type="text/css" href="/resources/revolution/css/settings.css">
    <link rel="stylesheet" type="text/css" href="/resources/revolution/css/layers.css">
    <link rel="stylesheet" type="text/css" href="/resources/revolution/css/navigation.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/custom.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/feedback.css">
    <link rel="stylesheet" href="/resources/js/sweetalert/sweetalert.css"/>
    <link rel="stylesheet" href="/resources/css/sections.css"/>
      
    <script src="/resources/js/jquery.min.js"></script>
    <!-- <script src="/resources/ebp/assets/js/faq.js"></script> -->
    
    <link href="/resources/cdn/css/datepicker.css" rel="stylesheet" type="text/css" />
    <script src="/resources/cdn/js/bootstrap-datepicker.min.js"></script>
    
    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-6300b4015e0a635c"></script>
    
    <link rel="stylesheet" href="/resources/plugins/datatable/dataTables.bootstrap.css"/>
    
    <script type="text/javascript" src="/resources/plugins/datatable/jquery.dataTables.js"></script>
    <script type="text/javascript" src="/resources/plugins/datatable/dataTables.bootstrap.js"></script>
    
    <!-- <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.0.0/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.0.0/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script> 
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.0.0/js/buttons.print.min.js"></script> 
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>-->
    
    <script type="text/javascript" src="/resources/cdn/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="/resources/cdn/js/jszip.min.js"></script>
    <script type="text/javascript" src="/resources/cdn/js/pdfmake.min.js"></script>
    <script type="text/javascript" src="/resources/cdn/js/vfs_fonts.js"></script>
    <script type="text/javascript" src="/resources/cdn/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="/resources/cdn/js/buttons.print.min.js"></script>
    
    
    <script type="text/javascript" src="/resources/cdn/js/jquery.cookie.min.js"></script>
    
    <!-- include summernote css/js -->
	<link href="/resources/cdn/css/summernote.min.css" rel="stylesheet">
	<script src="/resources/cdn/js/summernote.min.js"></script>
    
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
	
	<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-612e094264776942"></script> 
	<script id="dsq-count-scr" src="//teksands.disqus.com/count.js" async></script>
	
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
	<c:choose>
	<c:when test="${page eq 'ebp-program'}">
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
    	"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "Ebp",
    	"item": "https://teksands.ai/ebp"  
  	}]
	}
	</script>
	
	
	<script type="application/ld+json">
	{
 		"@context": "https://schema.org",
  		"@type": "FAQPage",
  		"mainEntity": [{
    		"@type": "Question",
    		"name": "Who is the Lift-off Program for?",
    		"acceptedAnswer": {
      	"@type": "Answer",
      	"text": "Fresh pass-outs and working professionals at various experience ranges and looking to get a better break into the IT industry. The goal of Teksands Lift-off program is to bring more and more people into the IT industry and custom develop skills in the Industry."
    }
 	},{
    	"@type": "Question",
    	"name": "How does it work?",
    	"acceptedAnswer": {
      	"@type": "Answer",
      	"text": "An Lift-off program starts with a client confirming requirements. Various candidate pools are tapped. Candidates go through a selection process and provide with an offer letter with a post-bootcamp joining date, subject to successful completion of the bootcamp. Bootcamp ends with an assessment and offer is confirmed by the client for successful candidates."
    }
  	},{
    	"@type": "Question",
    	"name": "What is the cost of Lift-off?",
    	"acceptedAnswer": {
      	"@type": "Answer",
      	"text": "The Lift-off program is primarily Client driven and client paid. We do not charge the candidate. However, there are other model variants available. On a case by case basis, we publish them in our requirements for a particular cohort."
    }
  	},{
    	"@type": "Question",
    	"name": "What is the Bootcamp Duration?",
    	"acceptedAnswer": {
      	"@type": "Answer",
      	"text": "Depending on the client requirements, the duration may vary somewhat, but it's normally 2-3 months."
    }
  	},{
    	"@type": "Question",
    	"name": "Will I learn the Technologies required during the Bootcamp?",
    	"acceptedAnswer": {
      	"@type": "Answer",
      	"text": "The Bootcamp follows the principle of application of Technology through projects. Any skills that you may not possess but is required as part of the client needs will have to be learnt by you. Mentors will help you chose the right material from the net to learn them in the easiest and fastest possible way. In some cases, we will run Pre-Bootcamp workshops for this purpose."
    }
  	},{
    	"@type": "Question",
    	"name": "How will the Mentor help me?",
    	"acceptedAnswer": {
      	"@type": "Answer",
      	"text": "The Bootcamp is all about application of Technologies through project work just as you will do in real-life when you join your employer. The mentor will help you with all the guidance for you to choose the right approach and solution for that. Cohort Mentor will also help you understand various practical aspects related to project execution, such as, design principles, DevOps aspects in your project, architecture, technology selection, methodologies such as Agile, how to implement solutions into production and so on."
    }
  	},{
    	"@type": "Question",
    	"name": "What is the Selection Process?",
    	"acceptedAnswer": {
      	"@type": "Answer",
      	"text": "Selection processes depend on the requirements of the client. They will have a combination of aptitude tests, communication skills, programming skills test, etc."
    }
  	},{
    	"@type": "Question",
    	"name": "How is the Evaluation after Bootcamp conducted?",
    	"acceptedAnswer": {
      	"@type": "Answer",
      	"text": "Again, the Bootcamp assessment can be different from client to client. However, it will be a combination of your score on periodic tests, quality of project work (code/solution), project document quality (design, architecture), etc."
    }
  	},{
    	"@type": "Question",
    	"name": "Will I get to select the Technology for my Bootcamp?",
    	"acceptedAnswer": {
      	"@type": "Answer",
      	"text": "Depending on the client requirements, the duration may vary somewhat, but it's normally 2-3 months."
    }
  	}]
	}	
	</script>
	</c:when>
		
	<c:when test="${page eq 'ebp-candidate-application'}">
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
    	"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "Ebp Candidate Application",
    	"item": "https://teksands.ai/ebp-candidate-application"  
  	}]
	}
	</script>	
	</c:when>
	
	<c:when test="${page eq 'corporate-enquiry'}">
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
    	"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "Corporate Enquiry",
    	"item": "https://teksands.ai/corporate-enquiry"  
  	}]
	}
	</script>	
	</c:when>
	
	<c:when test="${page eq 'mentor-registration'}">
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
    	"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "Mentor Registration",
    	"item": "https://teksands.ai/mentor-registration"  
  	}]
	}
	</script>	
	</c:when>
	
	<c:when test="${page eq 'it-staffing'}">
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
    	"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "IT Staffing",
    	"item": "https://teksands.ai/it-staffing"  
  	}]
	}
	</script>		
	</c:when>
	
	<c:when test="${page eq 'corporate'}">
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
    	"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "Corporate Training",
    	"item": "https://teksands.ai/corporate-training"  
  	}]
	}
	</script>		
	</c:when>
	
	<c:when test="${page eq 'accel-program'}">
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
    	"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "Accel Hire",
    	"item": "https://teksands.ai/accel-hire"  
  	}]
	}
	</script>		
	</c:when>
	
	<c:when test="${page eq 'live-courses'}">
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
    	"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "Upcoming Live Courses",
    	"item": "https://teksands.ai/upcoming-live-courses"  
  	}]
	}
	</script>		
	</c:when>
	
	<c:when test="${page eq 'ebooks'}">
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
    	"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "Ebooks",
    	"item": "https://teksands.ai/e-books"  
  	}]
	}
	</script>		
	</c:when>
	
	<c:when test="${page eq 'videos'}">
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
    	"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "Tech Videos",
    	"item": "https://teksands.ai/videos"  
  	}]
	}
	</script>		
	</c:when>
		
	<c:when test="${page eq 'careers'}">
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
    	"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "Work With Us",
    	"item": "https://teksands.ai/work-with-us"  
  	}]
	}
	</script>		
	</c:when>
	
	<c:when test="${page eq 'internships'}">
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
    	"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "Internships",
    	"item": "https://teksands.ai/internships"  
  	}]
	}
	</script>		
	</c:when>
	
	<c:when test="${page eq 'trainer'}">
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
    	"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "Become a Trainer",
    	"item": "https://teksands.ai/become-a-trainer"  
  	}]
	}
	</script>		
	</c:when>
		
	<c:when test="${page eq 'jobs'}">
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
    	"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "Jobs",
    	"item": "https://teksands.ai/jobs"  
  	}]
	}
	</script>		
	</c:when>
	
	<c:when test="${page eq 'jobs-details'}">
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
    	"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "Jobs",
    	"item": "https://teksands.ai/jobs"  
  	},
	{
    	"@type": "ListItem", 
    	"position": 3, 
    	"name": "Job Details",
    	"item": "https://teksands.ai/jobs/${jobs.jobs_url}"  
  	}]
	}
	</script>		
	</c:when>
	
	<c:when test="${page eq 'contact'}">
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
    	"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "Jobs",
    	"item": "https://teksands.ai/contact-us"  
  	}]
	}
	</script>		
	</c:when>
	
	<c:when test="${page eq 'blog'}">
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    		"@type": "ListItem", 
    		"position": 1, 
    		"name": "Home",
    		"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "Blog",
    	"item": "https://teksands.ai/blog"  
  	}]
	}
	</script>
	</c:when>
	<c:when test="${page eq 'blog-details'}">
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
   		"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "Blog",
    	"item": "https://teksands.ai/blog"  
  	},{
    	"@type": "ListItem", 
    	"position": 3, 
    	"name": "Blog Details",
    	"item": "https://teksands.ai/blog/${blog.blog_url}"  
  	}]
	}
	</script>

	<script type="application/ld+json">
	{
  		"@context": "https://schema.org",
  		"@type": "BlogPosting",
  		"mainEntityOfPage": {
    	"@type": "WebPage",
    	"@id": "https://teksands.ai/blog/${blog.blog_url}"
  	},
  		"headline": "${blog.meta_title}",
  		"description": "${blog.meta_desc}",
  		"image": "https://teksands.ai/resources/images/blogs/${blog.title_folder}/${blog.photo}",  
  		"author": {
    		"@type": "Organization",
    		"name": "Teksands",
    		"url": "https://teksands.ai/"
  	},  
  	"publisher": {
    	"@type": "Organization",
    	"name": "Teksands",
    	"logo": {
      	"@type": "ImageObject",
      	"url": "https://teksands.ai/resources/images/teksands_logo.jpg"
    }
  },
  "datePublished": "${blog.create_date}",
  "dateModified": "${blog.create_date}"
	}
	</script>
	</c:when>
	<c:when test="${page eq 'article'}">
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
    	"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "Article",
    	"item": "https://teksands.ai/shortreads"  
  	}]
	}
	</script>
	</c:when>
	<c:when test="${page eq 'article-details'}">
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
    	"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "Article",
    	"item": "https://teksands.ai/shortreads"  
  	},{
    	"@type": "ListItem", 
    	"position": 3, 
    	"name": "Article Details",
    	"item": "https://teksands.ai/shortreads/${article.blog_url}"  
  	}]
	}
	</script>
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org",
  		"@type": "Article",
  		"mainEntityOfPage": {
   			"@type": "WebPage",
    		"@id": "https://teksands.ai/blog/${article.blog_url}"
  	},
  	"headline": "${article.meta_title}",
  	"description": "${article.meta_desc}",
  	"image": "https://teksands.ai/resources/images/articles/${article.title_folder}/${article.photo}",  
  	"author": {
    	"@type": "Organization",
    	"name": "Teksands",
    	"url": "https://teksands.ai/"
  	},  
  	"publisher": {
    	"@type": "Organization",
    	"name": "Teksands",
    	"logo": {
      		"@type": "ImageObject",
      		"url": "https://teksands.ai/resources/images/teksands_logo.jpg"
    }
  	},
  	"datePublished": "${article.create_date}",
 	"dateModified": "${article.create_date}"
	}
	</script>
	</c:when>
</c:choose>
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

    <script src="/resources/js/bootstrap.js"></script>
    <script src="/resources/js/plugins.js"></script>
    <script src="/resources/js/isotope.js"></script>
    <script src="/resources/js/imagesloaded.pkgd.js"></script>
    <script src="/resources/js/masonry-home-01.js"></script>  
    
	<script src="/resources/js/sweetalert/sweetalert.min.js"></script>
	<script src="/resources/js/overlay/loadingoverlay.js"></script>
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



