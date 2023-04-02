<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
@media (max-width: 768px){
	.home-heading {
	    font-size: 20px;
	}
	.mobile-button {
		padding: 0px 10px !important;
    	font-size: 10px !important;
	}
	.mobile-heading {
		font-size: 15px !important;
		margin: 0 0 0 0 !important;
		height: 40px !important;
	}
	.mobile-card {
		padding: 15px 0 15px 0 !important;
	}
	.mobile-icon {
	    font-size: 2em !important;
	}
	.mobile-para {
		line-height: 20px !important;
    	margin: 0 10px 0 10px !important;
	}
	.xs-h1 {
    	font-size: 18px !important;
	}
	.xs-p {
		margin: 41px 0 0 0;
    	text-align: justify;
	}
	.xs-testimonial-h4 {
		margin: 15px 120px 0 0;
	}
}
@media (min-width: 1024px){
	.ts-banner {
		height: 400px !important;		
	}
}

@media (max-width: 768px) {
	.owl-controls {
	    display: block !important;
	}
}
.sub_heading{
    display: block;
    color: #000;
    font-weight: 600;
    text-transform: uppercase;
    font-size: 24px;
    margin-bottom: 10px;
}

</style>

<script>
function saveContactsfromCTA()
{
    var name = $("#cta_name").val();
    var email = $("#cta_email").val();
    var mobile = $("#cta_mobile").val();
    var company = "";
    var requirements = "Home Page CTA";
    
    if(name == ""){
    	swal("OOPS!", "Please Enter Name", "error")
   	    return false;
    }
    
    if(email == "") {
    	swal("OOPS!", "Please Enter Email", "error")
   	    return false;
    }
     
    if(mobile == "") {
    	swal("OOPS!", "Please Enter Mobile", "error")
   	    return false;
    }
    
    if(!isEmail(email)) {
    	swal("OOPS!", "Please Enter Valid Email", "error")
   	    return false;
    }
    
    console.log("name = " + name);
    console.log("email = " + email);
    console.log("mobile = " + mobile);
    
    $.ajaxSetup({async:false});
	$.post("/saveContacts", {name: "" + name + "", 
		email: "" + email + "",
		mobile: "" + mobile + "", 
		company: "" + company + "",
		requirements: "" + requirements + "",}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
   			swal("Thank you for contacting us", "We have received your enquiry and will respond to you shortly", "success");
   			
   			$("#cta_name").val("");
   	    	$("#cta_email").val("");
   	    	$("#cta_mobile").val("");
   	    	
          	return false;
   		} else {
   			swal("OOPS!", "Please Enter Correct Details", "error");
   		 	return false;
   		}
		
	},'text');
}

function isEmail(email) {
	  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  return regex.test(email);
}

function saveLiftOff() 
{
	var name = $("#cta_name").val();
	var company = $("#cta_company").val();
	var email = $("#cta_email").val();
    var mobile = $("#cta_mobile").val();
    var enquiry_type = "Liftoff";
    
    if(name == ""){
    	swal("OOPS!", "Please Enter Name", "error")
   	    return false;
    }
    
    if(company == ""){
    	swal("OOPS!", "Please Enter Your Organization Name", "error")
   	    return false;
    }
    
    if(email == "") {
    	swal("OOPS!", "Please Enter Email", "error")
   	    return false;
    }
      
    if(mobile == "") {
    	swal("OOPS!", "Please Enter Mobile", "error")
   	    return false;
    }
    var mobilelength = mobile.length;
    
    if(mobilelength < 10)
    {
    	swal("OOPS!", "Minimum digits allowed for a Mobile number is 10", "error")
   	    return false;	
    }
    if(mobilelength > 16)
    {
    	swal("OOPS!", "Maximum digits allowed for a Mobile number is 16", "error")
   	    return false;	
    }
    if(!isEmail(email)) {
    	swal("OOPS!", "Please Enter Valid Email", "error")
   	    return false;
    }
    var emaillength = email.length;
    if(emaillength > 100) {
    	swal("OOPS!", "Maximum allowed is 100 characters", "error")
   	    return false;
    }
    
    $.LoadingOverlay("show");
    
    $.ajaxSetup({async:false});
	$.post("/saveLiftOffContact", {name: "" + name + "", 
		email: "" + email + "",
		mobile: "" + mobile + "", 
		company: "" + company + "",
		enquiry_type: "" + enquiry_type + "",}, function(data)
	{		
		
		$.LoadingOverlay("hide");
			
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
   			swal("Thank you for contacting us", "We have received your enquiry and will respond to you shortly", "success");
   			
   			$("#cta_name").val("");
   	    	$("#cta_email").val("");
   	    	$("#cta_mobile").val("");
   	    	$("#cta_company").val("");
   	    	
          	return false;
   		} else {
   			swal("OOPS!", "Please Enter Correct Details", "error");
   		 	return false;
   		}
		
	},'text');
}
function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    console.log(charCode);
    if (charCode != 43 &&  charCode > 31
    		&& (charCode < 48 || charCode > 57) && (charCode != 32 && charCode != 0) )
        return false;

    return true;
}
</script>

<script>
$('body').on('keyup', '.js-input-mobile', function () {
  var $input = $(this),
      value = $input.val(),
      length = value.length,
      inputCharacter = parseInt(value.slice(-1));

  if (!((length > 0 && inputCharacter >= 0 && inputCharacter <= 10) || (length === 1 && inputCharacter >= 7 && inputCharacter <= 10))) {
      $input.val(value.substring(0, length - 1));
   }
});
</script>


<script>
$(document).ready(function() {
    var dialogShown = $.cookie('dialogShown');
    if (!dialogShown) {
        $(window).load(function(){
        	$('#home_popup').modal('show');
            $.cookie('dialogShown', 1);
        });
    }
    else {
        $("#home_popup").hide();
    }
});
</script>

<!-- <div id="bootstrap-touch-slider" class="carousel bs-slider fade control-round indicators-line hidden-xs" data-ride="carousel" data-pause="hover" data-interval="3000" style="border-bottom: 1px solid #3c3d41;" >
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="/resources/images/banners/new-banners/accel.webp" alt="Bootstrap Touch Slider"  class="slide-image ts-banner"/>
        </div>
        <div class="item">
            <img src="/resources/images/banners/new-banners/lift-off.png" alt="Bootstrap Touch Slider"  class="slide-image ts-banner"/>
        </div>
        <div class="item">
            <img src="/resources/images/banners/new-banners/propel.png" alt="Bootstrap Touch Slider"  class="slide-image ts-banner"/>
        </div>
    </div>
    <a class="left carousel-control" href="#bootstrap-touch-slider" role="button" data-slide="prev">
        <span class="fa fa-angle-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#bootstrap-touch-slider" role="button" data-slide="next">
        <span class="fa fa-angle-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<div id="bootstrap-touch-slider" class="carousel bs-slider fade control-round indicators-line hidden-sm hidden-md hidden-lg" data-ride="carousel" data-pause="hover" data-interval="3000" style="border-bottom: 1px solid #3c3d41;" >
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="/resources/images/banners/new-banners/mobile-banners/accel.webp" alt="Bootstrap Touch Slider"  class="slide-image"/>
        </div>
        <div class="item">
            <img src="/resources/images/banners/new-banners/mobile-banners/lift-off.webp" alt="Bootstrap Touch Slider"  class="slide-image"/>
        </div>
        <div class="item">
            Slide Background
            <img src="/resources/images/banners/new-banners/mobile-banners/propel.webp" alt="Bootstrap Touch Slider"  class="slide-image"/>
        </div>
    </div>
    <a class="left carousel-control" href="#bootstrap-touch-slider" role="button" data-slide="prev">
        <span class="fa fa-angle-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#bootstrap-touch-slider" role="button" data-slide="next">
        <span class="fa fa-angle-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div> -->

<!-- <div class="">
	<div class="hidden-xs">
		<img src="/resources/images/banners/hiring-solution/hiring-solution-desktop.png">
	</div>
	<div class="hidden-sm hidden-md hidden-lg">
		<img src="/resources/images/banners/hiring-solution/hiring-solution-mobile.png">
	</div>
</div> -->

<div id="carouselExampleSlidesOnly" class="carousel slide hidden-xs" data-interval="false">
	<div class="carousel-inner">
	    <div class="carousel-item active">
	        <img src="/resources/images/banners/hiring-solution/hiring-solution-desktop.webp" style="width: 100%;">
	    </div>
 	</div>
</div>

<div id="carouselExampleSlidesOnly" class="carousel slide hidden-sm hidden-md hidden-lg" data-interval="false">
	<div class="carousel-inner">
	    <div class="carousel-item active">
	        <img src="/resources/images/banners/hiring-solution/hiring-solution-mobile.png" style="width: 100%;">
	    </div>
 	</div>
</div>

<section class="section bgg course-section">
    <div class="container">
        <div class="section-title-2 text-center course-title wow fadeInDown">
            <h1 class="home-h1 xs-h1">WELCOME TO TEKSANDS</h1>
            <hr>
        </div><!-- end section-title -->
        <div class="row text-center">
        	<div class="col-md-3 col-sm-3 col-xs-6 wow fadeInRight">
                <div class="boxes text-center service-first noafter nobgwithicon mobile-card shadow">
                    <i class="fa fa-university fa-3x mobile-icon"></i>
                    <h4 class="mobile-heading"><b>Accel Hire</b></h4>
                    <p class="hidden-xs">Lateral Recruitment <br>Services</p>
                    <a href="/accel-hire" class="btn btn-primary btn-trans btn-radius mobile-button">Read More</a>
                </div><!-- end box -->
            </div><!-- end col -->
        	<div class="col-md-3 col-sm-3 col-xs-6 mob20 wow fadeInRight">
                <div class="boxes text-center service-first noafter nobgwithicon mobile-card shadow">
                    <i class="fa fa-columns fa-3x mobile-icon"></i>
                    <h4 class="mobile-heading"><b>Lift Off Bootcamp Program</b></h4>
                    <p class="hidden-xs">Recruit Engineers in bulk in STH - Source-Train-Hire Model</p>
                    <a href="/ebp" class="btn btn-primary btn-trans btn-radius mobile-button">Read More</a>
                </div><!-- end box -->
            </div><!-- end col -->
            <div class="col-md-3 col-sm-3 col-xs-6 mob20 wow fadeInLeft">
                <div class="boxes text-center service-first noafter nobgwithicon mobile-card shadow">
                    <i class="fa fa-graduation-cap fa-3x mobile-icon"></i>
                    <h4 class="mobile-heading"><b>Propel</b></h4>
                    <p class="hidden-xs">Upskill your Freshers or Cross-skill your workforce</p>
                    <a href="/corporate-training" class="btn btn-primary btn-trans btn-radius mobile-button">Read More</a>
                </div><!-- end box -->
            </div><!-- end col -->
            <div class="col-md-3 col-sm-3 col-xs-6 mob20 wow fadeInLeft">
                <div class="boxes text-center service-first noafter nobgwithicon mobile-card shadow">
                    <i class="fa fa-book fa-3x mobile-icon"></i>
                    <h4 class="mobile-heading"><b>Tech Articles</b></h4>
                    <p class="hidden-xs">Browse our Deep <br>Tech Articles</p>
                    <a href="/blog" class="btn btn-primary btn-trans btn-radius mobile-button">Read More</a>
                </div><!-- end box -->
            </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end section -->

<section class="section bgw">
    <div class="container">
    <div class="section-title-2 text-center course-title wow fadeInDown" id="courses">
            <h2 class="home-heading xs-h1">LIFT-OFF PROGRAM</h2>
            <hr>
        </div><!-- end section-title -->
        <div class="row">
	  <div class="col-lg-6">
	  		<h2 class="sub_heading">The Lift-Off program is our guarantee on providing our clients with ready-skilled developers.</h2>
	  		<p>Conversion rates from interviews as high as 50-60%.</p>
	  		<p>The Lift-Off program taps several traditional and non-traditional channels for superior candidate sourcing and conducting Bootcamp based skilling programs will give your faster and guaranteed sourcing of talent in trending skill areas like Data Science, ML Engineers, Data Engineers, Cloud/DevOps Engineers, IT Security Analysts and Full Stack Developers on React/Angular/.Net/Java.</p>
	  </div>
	  <div class="col-lg-6">
			<video class="videoplayer" controls autoplay muted loop>
				<source src="https://teksands.ai/resources/landing-pages/videos/ebp-teksands.mp4" type="video/mp4" />
			</video>
	  </div>
	  <div class="col-md-12 col-sm-12">
         	<p style="text-align:center;margin-top: 50px;"><a href="/ebp" target="_blank" class="btn btn-primary btn-lg btn-square">Know More</a></p>
         </div>
        </div>
    </div>
</section>

<%-- <section class="section">
    <div class="container">
		<div class="section-title-2 text-center course-title wow fadeInDown" id="courses">
            <h2 class="home-heading xs-h1">TEKSANDS COURSES</h2>
            <hr>
        </div><!-- end section-title -->
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="tab-first menu-center">
                
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#trending" aria-controls="trending" role="tab" data-toggle="tab">Trending</a></li>
                        <li role="presentation"><a href="#home1" aria-controls="home1" role="tab" data-toggle="tab">Data Science</a></li>
                        <li role="presentation"><a href="#profile1" aria-controls="profile1" role="tab" data-toggle="tab">Machine Learning</a></li>
                        <li role="presentation"><a href="#messages1" aria-controls="messages1" role="tab" data-toggle="tab">DevOps</a></li>
                    </ul>

                    <div class="tab-content" style="height: auto;overflow: hidden;">
                    	<div role="tabpanel" class="tab-pane active" id="trending">
                            <div class="tab-padding clearfix">
		                        <c:forEach items="${coursesList4}" var="courses">
		                            <div class="col-md-3 col-sm-12 col-xs-12 mob20">
				                        <div class="shop-item course-v2 text-center">
				                            <div class="post-media entry">
				                                <img src="/resources/images/courses/${courses.image}" alt="" class="img-responsive">
				                            </div><!-- end post-media -->
				                            <div class="shop-desc">
				                                <div class="clearfix">
				                                    <div>
				                                        <p class="small-text"><c:out value="${courses.sub_heading}"/></p>
				                                    </div><!-- end right -->
				                                </div>
				                                <hr>
				                                <h3><a target="_blank" href="<c:out value="${courses.link}" escapeXml="false"/>" title=""><c:out value="${courses.title}" escapeXml="false"/></a></h3>
				                                <p class="text-center title-text"><c:out value="${courses.information}" escapeXml="false"/></p>
				                                <a target="_blank" href="<c:out value="${courses.link}" escapeXml="false"/>" class="btn btn-course"><c:out value="${courses.price}" escapeXml="false"/></a>
				                            </div>
				                        </div><!-- end shop-item -->
				                    </div><!-- end carousel-item -->
				                </c:forEach>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="home1">
                            <div class="tab-padding clearfix">
		                        <c:forEach items="${coursesList1}" var="courses">
		                            <div class="col-md-3 col-sm-12 col-xs-12 mob20">
				                        <div class="shop-item course-v2 text-center">
				                            <div class="post-media entry">
				                                <img src="/resources/images/courses/${courses.image}" alt="" class="img-responsive">
				                            </div><!-- end post-media -->
				                            <div class="shop-desc">
				                                <div class="clearfix">
				                                    <div>
				                                        <p class="small-text"><c:out value="${courses.sub_heading}"/></p>
				                                    </div><!-- end right -->
				                                </div>
				                                <hr>
				                                <h3><a target="_blank" href="<c:out value="${courses.link}" escapeXml="false"/>" title=""><c:out value="${courses.title}" escapeXml="false"/></a></h3>
				                                <p class="text-center title-text"><c:out value="${courses.information}" escapeXml="false"/></p>
				                                <a target="_blank" href="<c:out value="${courses.link}" escapeXml="false"/>" class="btn btn-course"><c:out value="${courses.price}" escapeXml="false"/></a>
				                            </div>
				                        </div><!-- end shop-item -->
				                    </div><!-- end carousel-item -->
				                </c:forEach>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="profile1">
                            <div class="tab-padding clearfix">
		                        <c:forEach items="${coursesList2}" var="courses">
		                            <div class="col-md-3 col-sm-12 col-xs-12 mob20">
				                        <div class="shop-item course-v2 text-center">
				                            <div class="post-media entry">
				                                <img src="/resources/images/courses/${courses.image}" alt="" class="img-responsive">
				                            </div><!-- end post-media -->
				                            <div class="shop-desc">
				                                <div class="clearfix">
				                                    <div>
				                                        <p class="small-text"><c:out value="${courses.sub_heading}" /></p>
				                                    </div><!-- end right -->
				                                </div>
				                                <hr>
				                                <h3><a target="_blank" href="<c:out value="${courses.link}" escapeXml="false"/>" title=""><c:out value="${courses.title}" escapeXml="false"/></a></h3>
				                                <p class="text-center title-text"><c:out value="${courses.information}" escapeXml="false"/></p>
				                                <a target="_blank" href="<c:out value="${courses.link}" escapeXml="false"/>" class="btn btn-course"><c:out value="${courses.price}" escapeXml="false"/></a>
				                            </div>
				                        </div><!-- end shop-item -->
				                    </div><!-- end carousel-item -->
				                 </c:forEach>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="messages1">
                            <div class="tab-padding clearfix">
		                        <c:forEach items="${coursesList3}" var="courses">
		                            <div class="col-md-3 col-sm-12 col-xs-12 mob20">
				                        <div class="shop-item course-v2 text-center">
				                            <div class="post-media entry">
				                                <img src="/resources/images/courses/${courses.image}" alt="" class="img-responsive">
				                            </div><!-- end post-media -->
				                            <div class="shop-desc">
				                                <div class="clearfix">
				                                    <div>
				                                        <p class="small-text"><c:out value="${courses.sub_heading}" /></p>
				                                    </div><!-- end right -->
				                                </div>
				                                <hr>
				                                <h3><a target="_blank" href="<c:out value="${courses.link}" escapeXml="false"/>" title=""><c:out value="${courses.title}" escapeXml="false"/></a></h3>
				                                <p class="text-center title-text"><c:out value="${courses.information}" escapeXml="false"/></p>
				                                <a target="_blank" href="<c:out value="${courses.link}" escapeXml="false"/>" class="btn btn-course"><c:out value="${courses.price}" escapeXml="false"/></a>
				                            </div>
				                        </div><!-- end shop-item -->
				                    </div><!-- end carousel-item -->
								</c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
	               	<div class="all-buttons text-center" style="margin-top: 25px;">
	                   <a href="/upcoming-live-courses" class="btn btn-primary btn-lg btn-square">VIEW ALL COURSES</a>
	               </div><!-- end allbuttons -->
         		</div>
            </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end section -->
 --%>


<section class="section cta-box-wrapper course-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<h3 style="text-align: center;font-size: 20px;font-weight: bold;color: #fff;margin:0 0 30px 0;">Enquire about Recruiting from our Lift-off Bootcamp based HTD/THD Model</h3>
			</div><!-- end col -->
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="contact_form">
					<div class="col-md-3 col-sm-12">
						<input type="text" class="form-control" id="cta_name" maxlength="100" placeholder="Name" onkeydown="return /[a-z ]/i.test(event.key)">
					</div>
					<div class="col-md-3 col-sm-12">
						<input type="text" class="form-control" id="cta_company" placeholder="Organization">
					</div>
					<div class="col-md-3 col-sm-12">
						<input type="email"  class="form-control" id="cta_email" placeholder="Email">
					</div>
					<div class="col-md-3 col-sm-12">
						<input type="text" class="form-control" id="cta_mobile" placeholder="Mobile" onkeypress='return isNumberKey(event);'>
					</div>
					<div class="text-center">
						<button type="button" class="btn btn-primary btn-submit" onclick="saveLiftOff()">Submit</button>
					</div>
				</div>
			</div><!-- end commentform -->
		</div><!-- end col -->
	</div><!-- end row -->
</section><!-- end section -->

<!-- <section class="section">
    <div class="container">
    	<div class="section-title-2 text-center video-section wow fadeInDown">
            <h2 class="home-heading xs-h1">TEKSANDS VIDEOS</h2>
            <hr>
        </div>end section-title
        <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="tab-first menu-center">
                <ul class="nav nav-pills nav-justified" role="tablist">
                    <li role="presentation" class="active"><a href="#democlass" aria-controls="home1" role="tab" data-toggle="tab" class="custom-tabs">Demo Classes</a></li>
                    <li role="presentation"><a href="#datascience" aria-controls="profile1" role="tab" data-toggle="tab" class="custom-tabs">Data Science</a></li>
                    <li role="presentation"><a href="#machine" aria-controls="messages1" role="tab" data-toggle="tab" class="custom-tabs" >Machine Learning</a></li>
                    <li role="presentation"><a href="#devOps" aria-controls="messages1" role="tab" data-toggle="tab" class="custom-tabs">DevOps</a></li>
                </ul>
                <div class="tab-content tabs-video" style="height: 220px;">
                    <div role="tabpanel" class="tab-pane active" id="democlass">
                        <div class="tab-padding clearfix">
		                    <div class="col-md-3 col-sm-12">
		                        <div class="post-media">
									<iframe src="https://player.vimeo.com/video/603660234?h=d7e5cef154" width="255" height="150" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
									<p class="text-center m10"><a href="https://vimeo.com/603660234"><b>Python-Intro-for_DS-ML-Aspirants</b></a></p>
		                        </div>
		                    </div>end col
		                    <div class="col-md-3 col-sm-12">
		                        <div class="post-media">
		                        	<iframe src="https://player.vimeo.com/video/602382965?h=2f161cf281" width="255" height="150" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
				   					<p class="text-center m10"><a href="https://vimeo.com/602382965"><b>Handwritten-Character-Recognition-ML</b></a></p>
		                        </div>
		                    </div>end col
		                    <div class="col-md-3 col-sm-12">
		                        <div class="post-media">
		                        	<iframe src="https://player.vimeo.com/video/598912272?h=588ad6a14f" width="255" height="150" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
									<p class="text-center m10"><a href="https://vimeo.com/598912272"><b>DS-ML-AI-Terms-Confusion</b></a></p>
		                        </div>
		                    </div>end col
		                    <div class="col-md-3 col-sm-12">
		                        <div class="post-media">
		                        	<iframe src="https://player.vimeo.com/video/598241425?h=9d744ee6a5" width="255" height="150" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
				  					<p class="text-center m10"><a href="https://vimeo.com/598241425"><b>Data Science Course Preview</b></a></p>
		                        </div>
		                    </div>end col
		                 </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="datascience">
                        <div class="tab-padding clearfix">
		                    <div class="col-md-3 col-sm-12">
		                        <div class="post-media">
		                        	<iframe src="https://player.vimeo.com/video/596610398?h=ff54644ae2" width="255" height="150" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
									<p class="text-center m10"><a href="https://vimeo.com/596610398"><b>Data Science for beginners in 10 Minutes</b></a></p>
		                        </div>
		                    </div>end col
		                    <div class="col-md-3 col-sm-12">
		                        <div class="post-media">
		                        	<iframe src="https://player.vimeo.com/video/590917194?h=237baa8018" width="255" height="150" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
									<p class="text-center m10"><a href="https://vimeo.com/590917194"><b>Data Science and Predictive Analytics</b></a></p>
		                        </div>
		                    </div>end col
		                    <div class="col-md-3 col-sm-12">
		                        <div class="post-media">
		                        	<iframe src="https://player.vimeo.com/video/590917080?h=85f6da8f35" width="255" height="150" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
									<p class="text-center m10"><a href="https://vimeo.com/590917080"><b>Machine Learning Mastery</b></a></p>
		                        </div>
		                    </div>end col
		                    <div class="col-md-3 col-sm-12">
		                        <div class="post-media">
		                        	<iframe src="https://player.vimeo.com/video/587353209?h=7c394e4240" width="255" height="150" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
									<p class="text-center m10"><a href="https://vimeo.com/587353209"><b>DataScience Predictive Analytics+ML-DemoClass</b></a></p>
		                        </div>
		                    </div>end col
		                 </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="machine">
                        <div class="tab-padding clearfix">
		                    <div class="col-md-3 col-sm-12">
		                        <div class="post-media">
									<iframe src="https://player.vimeo.com/video/603660234?h=d7e5cef154" width="255" height="150" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
				   					<p class="text-center m10"><a href="https://vimeo.com/603660234"><b>Python-Intro-for_DS-ML-Aspirants</b></a></p>
		                        </div>
		                    </div>end col
		                    <div class="col-md-3 col-sm-12">
		                        <div class="post-media">
		                        	<iframe src="https://player.vimeo.com/video/602382965?h=2f161cf281" width="255" height="150" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
				   					<p class="text-center m10"><a href="https://vimeo.com/602382965"><b>Handwritten-Character-Recognition-ML</b></a></p>
		                        </div>
		                    </div>end col
		                    <div class="col-md-3 col-sm-12">
		                        <div class="post-media">
		                        	<iframe src="https://player.vimeo.com/video/598912272?h=588ad6a14f" width="255" height="150" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
									<p class="text-center m10"><a href="https://vimeo.com/598912272"><b>DS-ML-AI-Terms-Confusion</b></a></p>
		                        </div>
		                    </div>end col
		                    <div class="col-md-3 col-sm-12">
		                        <div class="post-media">
		                        	<iframe src="https://player.vimeo.com/video/598241425?h=9d744ee6a5" width="255" height="150" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
				  					<p class="text-center m10"><a href="https://vimeo.com/598241425"><b>Data Science Course Preview</b></a></p>
		                        </div>
		                    </div>end col
		                 </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="devOps">
                        <div class="tab-padding clearfix">
		                    <div class="col-md-3 col-sm-12">
		                        <div class="post-media">
		                        	<iframe src="https://player.vimeo.com/video/596610398?h=ff54644ae2" width="255" height="150" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
									<p class="text-center m10"><a href="https://vimeo.com/596610398"><b>Data Science for beginners in 10 Minutes</b></a></p>
		                        </div>
		                    </div>end col
		                    <div class="col-md-3 col-sm-12">
		                        <div class="post-media">
		                        	<iframe src="https://player.vimeo.com/video/590917194?h=237baa8018" width="255" height="150" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
									<p class="text-center m10"><a href="https://vimeo.com/590917194"><b>Data Science and Predictive Analytics</b></a></p>
		                        </div>
		                    </div>end col
		                    <div class="col-md-3 col-sm-12">
		                        <div class="post-media">
		                        	<iframe src="https://player.vimeo.com/video/590917080?h=85f6da8f35" width="255" height="150" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
									<p class="text-center m10"><a href="https://vimeo.com/590917080"><b>Machine Learning Mastery</b></a></p>
		                        </div>
		                    </div>end col
		                    <div class="col-md-3 col-sm-12">
		                        <div class="post-media">
		                        	<iframe src="https://player.vimeo.com/video/587353209?h=7c394e4240" width="255" height="150" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
									<p class="text-center m10"><a href="https://vimeo.com/587353209"><b>DataScience Predictive Analytics+ML-DemoClass</b></a></p>
		                        </div>
		                    </div>end col
		                 </div>
                   		 </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-sm-12">
                	<p style="text-align:center;margin-top: 20px;"><a href="/videos" target="_blank" class="btn btn-primary btn-square">View All Videos</a></p>
                </div>
            </div>
        </div>end col
</section>end section
 -->
 
<%-- <section class="section">
    <div class="container">
    	<div class="section-title-2 text-center video-section wow fadeInDown" >
            <h2 class="home-heading xs-h1">Recent Tech Articles</h2>
            <hr>
        </div><!-- end section-title -->
        <div class="row">
        	<div class="col-md-12 col-sm-12">
            	<div class="tab-first menu-center">
	                <ul class="nav nav-pills nav-justified" role="tablist">
	                    <li role="presentation" class="active"><a href="#machinelearning" aria-controls="home1" role="tab" data-toggle="tab" class="custom-tabs">Machine Learning</a></li>
	                    <li role="presentation"><a href="#science" aria-controls="profile1" role="tab" data-toggle="tab" class="custom-tabs">Data Science</a></li>
	                    <li role="presentation"><a href="#deep" aria-controls="messages1" role="tab" data-toggle="tab" class="custom-tabs" >Deep Learning</a></li>
	                    <li role="presentation"><a href="#python" aria-controls="messages1" role="tab" data-toggle="tab" class="custom-tabs">Python</a></li>
	                    <li role="presentation"><a href="#artidevOps" aria-controls="messages1" role="tab" data-toggle="tab" class="custom-tabs">DevOps</a></li>
	                </ul>
                		<div class="tab-content tabs-video" style="height: auto;">
		                    <div role="tabpanel" class="tab-pane active" id="machinelearning">
		                        <div class="tab-padding clearfix">
		                        	<c:forEach items="${article_tags_1}" var="blogs">
										<div class="col-md-3 col-sm-12 mob20">
					                        <div class="shop-item ">
					                            <div class="post-media entry">
					                                <img src="/resources/images/blogs/${blogs.title_folder}/${blogs.photo}" alt="<c:out value="${blogs.title}" />" class="img-responsive">
					                            </div><!-- end post-media -->
					                            <div class="shop-desc">
					                                <h3><a href="/blog/${blogs.blog_url}" title=""><c:out value="${blogs.title}" /></a></h3>
					                                <p class="mt-10"><c:out value="${fn:substring(blogs.short_content,0,120)}" />...</p>
					                            </div>
					                        </div><!-- end shop-item -->
					                    </div><!-- end carousel-item -->
				                    </c:forEach>
				                 </div>
		                    </div>
		                    <div role="tabpanel" class="tab-pane" id="science">
		                        <div class="tab-padding clearfix">
				                   <c:forEach items="${article_tags_2}" var="blogs">
										<div class="col-md-3 col-sm-12 mob20">
					                        <div class="shop-item ">
					                            <div class="post-media entry">
					                                <img src="/resources/images/blogs/${blogs.title_folder}/${blogs.photo}" alt="<c:out value="${blogs.title}" />" class="img-responsive">
					                                <div class="magnifier">
					                                    <div class="shop-bottom clearfix">
					                                        <a href="#" title="Full Preview"><i class="fa fa-link"></i></a>
					                                    </div><!-- end shop-bottom -->
					                                </div><!-- end magnifier -->
					                            </div><!-- end post-media -->
					                            <div class="shop-desc">
					                                <h3><a href="/blog/${blogs.blog_url}" title=""><c:out value="${blogs.title}" /></a></h3>
					                                <p class="mt-10"><c:out value="${fn:substring(blogs.short_content,0,120)}" />...</p>
					                            </div>
					                        </div><!-- end shop-item -->
					                    </div><!-- end carousel-item -->
				                    </c:forEach>
				                 </div>
		                    </div>
		                    <div role="tabpanel" class="tab-pane" id="deep">
		                        <div class="tab-padding clearfix">
									<c:forEach items="${article_tags_3}" var="blogs">
										<div class="col-md-3 col-sm-12 mob20">
					                        <div class="shop-item ">
					                            <div class="post-media entry">
					                                <img src="/resources/images/blogs/${blogs.title_folder}/${blogs.photo}" alt="<c:out value="${blogs.title}" />" class="img-responsive">
					                                <div class="magnifier">
					                                    <div class="shop-bottom clearfix">
					                                        <a href="#" title="Full Preview"><i class="fa fa-link"></i></a>
					                                    </div><!-- end shop-bottom -->
					                                </div><!-- end magnifier -->
					                            </div><!-- end post-media -->
					                            <div class="shop-desc">
					                                <h3><a href="/blog/${blogs.blog_url}" title=""><c:out value="${blogs.title}" /></a></h3>
					                                <p class="mt-10"><c:out value="${fn:substring(blogs.short_content,0,120)}" />...</p>
					                            </div>
					                        </div><!-- end shop-item -->
					                    </div><!-- end carousel-item -->
				                    </c:forEach>
				                 </div>
		                    </div>
		                    <div role="tabpanel" class="tab-pane" id="python">
		                        <div class="tab-padding clearfix">
									<c:forEach items="${article_tags_4}" var="blogs">
										<div class="col-md-3 col-sm-12 mob20">
					                        <div class="shop-item ">
					                            <div class="post-media entry">
					                                <img src="/resources/images/blogs/${blogs.title_folder}/${blogs.photo}" alt="<c:out value="${blogs.title}" />" class="img-responsive">
					                                <div class="magnifier">
					                                    <div class="shop-bottom clearfix">
					                                        <a href="#" title="Full Preview"><i class="fa fa-link"></i></a>
					                                    </div><!-- end shop-bottom -->
					                                </div><!-- end magnifier -->
					                            </div><!-- end post-media -->
					                            <div class="shop-desc">
					                                <h3><a href="/blog/${blogs.blog_url}" title=""><c:out value="${blogs.title}" /></a></h3>
					                                <p class="mt-10"><c:out value="${fn:substring(blogs.short_content,0,120)}" />...</p>
					                            </div>
					                        </div><!-- end shop-item -->
					                    </div><!-- end carousel-item -->
				                    </c:forEach>
				                 </div>
		                    </div>
		                    <div role="tabpanel" class="tab-pane" id="artidevOps">
		                        <div class="tab-padding clearfix">
									<c:forEach items="${article_tags_5}" var="blogs">
										<div class="col-md-3 col-sm-12 mob20">
					                        <div class="shop-item ">
					                            <div class="post-media entry">
					                                <img src="/resources/images/blogs/${blogs.title_folder}/${blogs.photo}" alt="<c:out value="${blogs.title}" />" class="img-responsive">
					                                <div class="magnifier">
					                                    <div class="shop-bottom clearfix">
					                                        <a href="#" title="Full Preview"><i class="fa fa-link"></i></a>
					                                    </div><!-- end shop-bottom -->
					                                </div><!-- end magnifier -->
					                            </div><!-- end post-media -->
					                            <div class="shop-desc">
					                                <h3><a href="/blog/${blogs.blog_url}" title=""><c:out value="${blogs.title}" /></a></h3>
					                                <p class="mt-10"><c:out value="${fn:substring(blogs.short_content,0,120)}" />...</p>
					                            </div>
					                        </div><!-- end shop-item -->
					                    </div><!-- end carousel-item -->
				                    </c:forEach>
				                 </div>
		                    </div>
                        </div>
                    </div>
                    
                </div>
                <div class="col-md-12 col-sm-12">
                	<p style="text-align:center;margin-top: 20px;"><a href="/blog" target="_blank" class="btn btn-primary btn-square">View All Articles</a></p>
                </div>
            </div>
        </div><!-- end col -->
</section><!-- end section --> --%>

<!-- <section class="section bgg content-section">
    <div class="container">
        <div class="row wow fadeIn">
            <div class="col-md-6 col-sm-12">
                <div class="popular-courses">
                    <div class="post-media entry">
                        <div class="ribbon-wrapper-green"><div class="ribbon-green">Featured</div></div>
                        <img src="/resources/images/corporate.png" alt="" class="img-responsive">
                    </div>end post-media
                </div>end courses
            </div>end col

            <div class="col-md-6 col-sm-12">
                <div class="about-module">
                    <h3>Corporate Training From Teksands</h3>
                    <p>Our Corporate training spans a gamut of contemporary Tech, Soft Skills and Management areas. Our strength is co-creation of custom learning solutions along with and for our clients that fulfill their Business Goals...</p>
                    <a href="/corporate-training" target="_blank" class="btn btn-primary btn-square">START HERE</a>
                </div>end about-module
            </div>end col
        </div>end row
    </div>end container
</section>

<section class="section bgg content-section">
    <div class="container">
        <div class="row wow fadeIn">
	        	<div class="col-md-6 col-sm-12">
	                <div class="about-module">
	                    <h3 class="home-heading">Become a Trainer From Teksands</h3>
	                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took...</p>
	                    <a href="/become-a-trainer" target="_blank" class="btn btn-primary btn-square">START HERE</a>
	                </div>end about-module
	            </div>end col
	            <div class="col-md-6 col-sm-12">
	                <div class="popular-courses">
	                    <div class="post-media entry">
	                        <div class="ribbon-wrapper-green"><div class="ribbon-green">Featured</div></div>
	                        <img src="/resources/images/trainer.jpg" alt="" class="img-responsive image-mobile">
	                    </div>end post-media
	                </div>end courses
	            </div>end col
        </div>end row
    </div>end container
</section> -->

<section class="section tek_section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-8 col-xl-7 my-3">
                <div class="wow fadeInUp" data-wow-duration="0.3s" style="visibility: visible; animation-duration: 0.3s; animation-name: fadeInUp;">
                    <h2 class="h1 mb-4" style="color: #03a4ed;">Accel Hire - Lateral Recruitment Services</h2>
                    <p>Our unique Accel Hire Program helping Technology organizations with:</p>
                </div>
                <div class="row pt-3">
                    <div class="col-md-12 my-3">
                        <div class="media  wow fadeInUp" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInUp;">
                            <div class="icon-lg border border-primary rounded bg-gray-100 dots-icon">
                                <i class="bi-laptop"></i>
                                <i class="fa fa-university fa-3x mobile-icon" style="font-size: 12px;color: #3ca1db;"></i>
                            </div>
                            <div class="media-body ps-3">
                                <p class="m-0">Fast Paced hiring</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 my-3">
                        <div class="media  wow fadeInUp" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInUp;">
                            <div class="icon-lg border border-primary rounded bg-gray-100 dots-icon">
                                <i class="bi-command"></i>
                                <i class="fa fa-university fa-3x mobile-icon" style="font-size: 12px;color: #3ca1db;"></i>
                            </div>
                            <div class="media-body ps-3">
                                <p class="m-0">Seeking out right candidates with lower joining time.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 my-3">
                        <div class="media  wow fadeInUp" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInUp;">
                            <div class="icon-lg border border-primary rounded bg-gray-100 dots-icon">
                                <i class="bi-tools"></i>
                                <i class="fa fa-university fa-3x mobile-icon" style="font-size: 12px;color: #3ca1db;"></i>
                            </div>
                            <div class="media-body ps-3">
                                <p class="m-0">Seeking out candidates precisely matching your Talent, Skill and Culture fitment</p>
                            </div>
                        </div>
                    </div>
                    <p class="mt-4" style="margin: 155px 0 0 16px;">Through the Accel program, we help our clients onboard the right talent faster.</p>
                </div>
            </div>
            <div class="col-lg-4 my-3 ms-auto wow fadeInRight" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInRight;">
                <img src="/resources/images/home/accel.webp""WebContent/resources/images/home/accel.png"" title="" alt="">
            </div>
        </div>
    </div>
</section>

<section class="section tek_section course-section">
    <div class="container">
        <div class="row align-items-center">
        	<div class="col-lg-4 my-3 ms-auto wow fadeInRight" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInRight;">
                <img src="/resources/images/home/propel.webp"" title="" alt="">
            </div>
            <div class="col-lg-8 col-xl-7 my-3">
                <div class="wow fadeInUp" data-wow-duration="0.3s" style="visibility: visible; animation-duration: 0.3s; animation-name: fadeInUp;">
                    <h2 class="h1 mb-4" style="color: #03a4ed;">Propel - Upskill your Freshers or Cross-skill your workforce</h2>
                    <p>Our unique Propel Program helping Technology organizations with:</p>
                </div>
                <div class="row pt-3">
                    <div class="col-md-12 my-3">
                        <div class="media  wow fadeInUp" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInUp;">
                            <div class="icon-lg border border-primary rounded bg-gray-100 dots-icon">
                                <i class="bi-laptop"></i>
                                <i class="fa fa-university fa-3x mobile-icon" style="font-size: 12px;color: #3ca1db;"></i>
                            </div>
                            <div class="media-body ps-3">
                                <p class="m-0">Technology Induction for Campus Hires and other Early Talent making them project ready in 4-6 weeks-time through an intensive curriculum and individualized mentoring.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 my-3">
                        <div class="media  wow fadeInUp" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInUp;">
                            <div class="icon-lg border border-primary rounded bg-gray-100 dots-icon">
                                <i class="bi-command"></i>
                                <i class="fa fa-university fa-3x mobile-icon" style="font-size: 12px;color: #3ca1db;"></i>
                            </div>
                            <div class="media-body ps-3">
                                <p class="m-0">Cross Skilling of experienced Engineers for your next projects through co-developed curriculum and individualized mentoring.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- <section class="section bgg course-section">
    <div class="container">
           <div class="section-title-2 text-center course-title wow fadeInDown">
            <h2 class="home-heading">TESTIMONIALS</h2>
            <hr>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-12 mob20">
                <div class="testimonial">
                    <img class="alignright img-circle" src="/resources/images/testimonial/john_small.png" alt="">
                    <div class="testimonial-meta">
                    <h4>Prabir K</h4>
                    </div>
                    <p>"Tremendous learning opportunity at the Data Science batch I was part of. The faculty was very knowledgeable and in-depth. Although the course was compact, it really taught a huge lot of details on Data Science space"</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 mob20">
                <div class="testimonial">
                    <img class="alignright img-circle" src="/resources/images/testimonial/mark_small.png" alt="">
                    <div class="testimonial-meta">
                    <h4>Sujoy R</h4>
                    </div>
                    <p>"I want to switch my technology to Machine Learning. There are opportunities in my company but I needed to learn the Machine Learning techniques quickly so that I can start in a project. Teksands Machine Learning mastery gave me that opportunity to learn the maximum at the shortest time. The quality of the training was awesome."</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12">
                <div class="testimonial">
                    <img class="alignright img-circle" src="/resources/images/testimonial/john_small.png" alt="">
                    <div class="testimonial-meta">
                    <h4>Justin P</h4>
                    </div>
                    <p>"I am managing projects for some time and our customers are asking more and more automations using smart technologies like Predictive Models or Machine Learning. I wanted to learn the Technology myself but can't go through an 8 months course for that. Thankful to Teksands for the High Impact Series course on Machine Learning. The faculty was great and experience was fully hands-on"</p>
                </div>
            </div>
        </div>
    </div>
</section>-->
<section class="section">
    <div class="container">
    <div class="section-title-2 text-center course-title">
        <h2>Our Clients</h2>
        <hr>
    </div>
        <div id="owl-client" class="clients">
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/contentbloom.png" alt="" class="img-responsive"></a>
            </div>

            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/dxc.png" alt="" class="img-responsive"></a>
            </div>

            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/flutura.png" alt="" class="img-responsive"></a>
            </div>

            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/newpage.png" alt="" class="img-responsive"></a>
            </div>
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/tata.png" alt="" class="img-responsive"></a>
            </div>
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/visionet.png" alt="" class="img-responsive"></a>
            </div>
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/skillmine.png" alt="" class="img-responsive"></a>
            </div>
           <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/coforge.png" alt="" class="img-responsive"></a>
            </div>
             <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/diageo.png" alt="" class="img-responsive"></a>
            </div>
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/fitterfly.png" alt="" class="img-responsive"></a>
            </div>
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/fulcrumdigital.png" alt="" class="img-responsive"></a>
            </div>
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/gspann.png" alt="" class="img-responsive"></a>
            </div>
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/Mahat.png" alt="" class="img-responsive"></a>
            </div>
             <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/neoware.png" alt="" class="img-responsive"></a>
            </div>
        </div>
    </div>
</section>