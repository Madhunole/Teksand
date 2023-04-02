<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
function saveContacts()
{
    var name = $("#txt_name").val();
    var email = $("#txt_email").val();
    var mobile = $("#txt_mobile").val();
    var company = $("#txt_company").val();
    var requirements = $("#txt_requirements").val();
    
    if(name == ""){
    	swal("OOPS!", "Please Enter Name", "error")
   	    return false;
    }
    
    if(email == "") {
    	swal("OOPS!", "Please Enter Emaill", "error")
   	    return false;
    }
    
    if(mobile == "") {
    	swal("OOPS!", "Please Enter Mobile", "error")
   	    return false;
    }
    
    if(company == "") {
    	swal("OOPS!", "Please Enter Company Name", "error")
   	    return false;
    }
    
    if(requirements == "") {
    	swal("OOPS!", "Please Enter Requirements", "error")
   	    return false;
    }
    
    
    if(!isEmail(email)) {
    	swal("OOPS!", "Please Enter Valid Email", "error")
   	    return false;
    }
    
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
   			
   		    $("#txt_name").val("");
   		    $("#txt_email").val("");
   		    $("#txt_mobile").val("");
   		    $("#txt_company").val("");
   		    $("#txt_requirements").val("");
   			
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

</script>

<div class="page-title bgg">
    <div class="container clearfix">
       <div class="pull-left">
           <div class="bread">
               <ol class="breadcrumb">
                   <li><a href="#">Home</a></li>
                   <li class="active">Services</li>
               </ol>
           </div><!-- end bread -->
       </div><!-- /.pull-right -->
    </div>
</div><!-- end page-title -->


<section class="section course-section">
    <div class="container">
        <div class="section-title-2 text-center course-title wow fadeInDown">
            <h1 class="home-h1 xs-h1">OUR SERVICES</h1>
            <hr>
        </div><!-- end section-title -->
        <div class="row text-center">
        	<div class="col-md-3 col-sm-3 col-xs-6 wow fadeInRight">
                <div class="boxes text-center service-first noafter nobgwithicon mobile-card shadow">
                    <i class="fa fa-university fa-3x mobile-icon"></i>
                    <h4 class="mobile-heading"><b>Accel Hire</b></h4>
                    <p class="hidden-xs">Lateral Recruitment <br>Services</p>
                    <a href="https://teksands.ai/accel-hire" class="btn btn-primary btn-trans btn-radius mobile-button">Read More</a>
                </div><!-- end box -->
            </div><!-- end col -->
        	<div class="col-md-3 col-sm-3 col-xs-6 mob20 wow fadeInRight">
                <div class="boxes text-center service-first noafter nobgwithicon mobile-card shadow">
                    <i class="fa fa-columns fa-3x mobile-icon"></i>
                    <h4 class="mobile-heading"><b>Lift Off Bootcamp Program</b></h4>
                    <p class="hidden-xs">Recruit FTE in HTD/THD <br> Model</p>
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
                    <h4 class="mobile-heading"><b>IT Staffing</b></h4>
                    <p class="hidden-xs">Contract Staffing <br>Solutions</p>
                    <a href="/it-staffing" class="btn btn-primary btn-trans btn-radius mobile-button">Read More</a>
                </div><!-- end box -->
            </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end section -->


<section class="section litpadtop bgw custom-section">
<div class="container">
    <div class="row">
        <div id="sidebar1" class="col-md-12 col-sm-12">
            <div class="widget clearfix">
                <div class="member-profile">
			    <div class="section-title-2 text-center manager-section">
			        <h2>Please Leave Your Details for a Call-Back</h2>
			        <hr>
			    </div><!-- end section-title -->

                    <div class="row profile-badges contact-rm">
                        <div class="contact_form">
	                       <div class="col-md-12">
	                             <input type="text" id="txt_name" class="form-control" placeholder="Name"> 
	                             <input type="text" id="txt_company" class="form-control" placeholder="Company"> 
	                             <input type="text" id="txt_email" class="form-control" placeholder="Email"> 
	                             <input type="text" id="txt_mobile" class="form-control" placeholder="Mobile"> 
	                             <textarea class="form-control" id="txt_requirements" rows="6" placeholder="Requirements"></textarea>
	                             <div class="text-center"><button type="button" value="submit" id="submit" class="button button--wayra" onclick="saveContacts()"> Contact Us Today</button></div>
							</div>
                        </div>
                    </div><!-- end row -->
                </div><!-- end team-member -->
            </div>
        </div><!-- end right -->
    </div><!-- end row -->
</div><!-- end container -->
</section><!-- end section -->

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