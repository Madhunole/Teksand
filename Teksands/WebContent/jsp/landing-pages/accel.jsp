<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="/resources/ebp/assets/css/style.css">

<style>
#loader {
	display:none;
}
.about-us .section-heading h2 {
    padding: 50px 50px 30px 50px;
    text-align: center;
    position: relative;
    z-index: 1;
}
.our-portfolio .section-heading h2 {
    margin-bottom: 55px;
}
.our-portfolio .item .showed-content h3{
    color: #03a4ed !important ;
    font-weight: bold;
    font-size: 18px;
	height: 35px;
}
.faq-section {
    width: 80% !important;
}
html, body {
    font-family: 'Poppins', sans-serif !important;
}
p.text-center.footer-text {
    font-size: 14px !important;
}
.faq_area .section-heading h2 {
    text-align: center;
    margin: 0px 90px 0px 90px;
    margin-bottom: 40px;
    position: relative;
    z-index: 1;
}
.panel-title {
    font-family: 'Poppins', sans-serif !important;
}
.panel-default > .panel-heading + .panel-collapse > .panel-body p {
	font-family: 'Poppins', sans-serif !important;
}
h3.mar-top {
    font-size: 18px !important;
    margin: 15px 0 0 0;
}


blockquote {
   margin: 0;
}
blockquote p {
   font-weight: bold;
   font-style: italic;
   font-size: 130%;
   margin-bottom: 1rem;
}

blockquote p,
blockquote cite {
   color: #03a4ed;
   text-align: center;
   display: block;
   font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif !important;
}

blockquote p:before {
   content: open-quote;
}

blockquote p:after {
   content: close-quote;
   margin-left: -0.2rem;
}

blockquote p:before,
blockquote p:after {
   display: inline-block;
   vertical-align: bottom;
   top: 0;
   position: relative;
   padding: 0.1rem;
}
blockquote::before {
	display: none !important;
}
.our-portfolio {
    padding-top: 15px !important;
}
.mt-4 {
    margin-top: 2rem;
}
.our-portfolio .showed-content {
    padding: 25px;
}
.custom_li{
	list-style: disc;
    margin: 0 0 0 50px;
    font-style: italic;
}

.ebp-plans.p-0 {
    padding: 0;
}
.clearfix {
    display: contents !important;
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
    var emaillength = email.length;
    if(emaillength > 100) {
    	swal("OOPS!", "Maximum allowed is 100 characters", "error")
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
    if(company == "") {
    	swal("OOPS!", "Please Enter Company Name", "error")
   	    return false;
    }    
    if(!isEmail(email)) {
    	swal("OOPS!", "Please Enter Valid Email", "error")
   	    return false;
    }
    if(requirements == "") {
    	swal("OOPS!", "Please Enter Requirements", "error")
   	    return false;
    }
    
    console.log("name = " + name);
    console.log("email = " + email);
    console.log("mobile = " + mobile);
    console.log("company = " + company);
    console.log("requirements = " + requirements);
    
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
function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    console.log(charCode);
    if (charCode != 43 &&  charCode > 31
    		&& (charCode < 48 || charCode > 57) && (charCode != 32 && charCode != 0) )
        return false;

    return true;
}
</script>
<div class="main-banner wow fadeIn" id="top" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="row">
            <div class="col-lg-6 align-self-center">
              <div class="left-content header-text">
                <h2>AN UNIQUE FRAMEWORK TO ACHIEVE PACE AND PRECISION IN LATERAL HIRING</h2>
                <p>Recruiting the right workforce is critical to the business and in today's day, Recruitment is fraught with several challenges:</p>
                <ul>
                	<li class="custom_li">Difficulty in Sourcing the right candidates from the Market due to difficult skill patterns and long Notice Periods</li>
                	<li class="custom_li">Very Low sourcing to interview success ratio due to candidate quality</li>
                	<li class="custom_li">Very Low offer to joining Ratio</li>
                	<li class="custom_li">High Cost of Candidate</li>
                	<li class="custom_li">Overall high cost, elapsed time and effort consumed on Recruitment</li>
                </ul>
              </div>
            </div>
            <div class="col-lg-6 align-self-center text-center">
              	<img src="/resources/images/accel/accel.png" style="width: 85%;" title="" alt="">
            </div>
          </div>
        </div>
      </div>
    </div>
</div>


<div id="ebp" class="ebp-table">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6">
           	  <div class="section-heading text-center">
	            <h2 style="font-size: 23px;padding: 0px 50px 25px 50px;">Salient Features of the Accel Program</h2>
	          </div> 
		        <div class="ebpTable">
                    <div class="ebp-plans p-0">
                        <div class="subtitle">
							<ul>
								<li class="custom_li" style="text-align: left;margin: 0 0 0 25px;">Our key strength is in understanding our client's requirements precisely and deliver to that</li>
								<li class="custom_li" style="text-align: left;margin: 0 0 0 25px;">Minimum number of profiles to you and maximum conversion ratio through our precision and pace model</li>
								<li class="custom_li" style="text-align: left;margin: 0 0 0 25px;">Ability to scale-up and scale-down fast based on your changing needs</li>
							</ul>
						</div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-sm-6">
           	  <div class="section-heading text-center">
	            <h2 style="font-size: 23px;padding: 0px 50px 25px 50px;">Accel Outcomes</h2>
	          </div> 
		        <div class="ebpTable">
                    <div class="ebp-plans p-0">
                        <div class="subtitle">
                        	<ul>
								<li class="custom_li" style="text-align: left;margin: 0 0 0 25px;">Candidates with Faster Joining times</li>
								<li class="custom_li" style="text-align: left;margin: 0 0 0 25px;">Our scrutinization methods will give you minimum number of high-quality profiles with the aim of high conversion ratio</li>
								<li class="custom_li" style="text-align: left;margin: 0 0 0 25px;">We improve continuously with your inputs to maximise our sourcing efficiency </li>
							</ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="tek_section">
    <div class="container">
        <div class="row align-items-center">
        	<div class="col-lg-4 my-3 ms-auto wow fadeInRight" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInRight;">
                <img src="/resources/images/accel/technologies.png" title="" alt="">
            </div>
            <div class="col-lg-8 col-xl-7 my-3">
                <div class="wow fadeInUp" data-wow-duration="0.3s" style="visibility: visible; animation-duration: 0.3s; animation-name: fadeInUp;">
                    <h2 class="section-heading" style="font-size: 23px;font-weight: 700;line-height: 42px;">Our unique Accel Hire Program helping Technology </br>organizations with:</h2>
                </div>
                <div class="row pt-3">
                    <div class="col-md-12 my-3">
                        <div class="media  wow fadeInUp" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInUp;">
                            <div class="icon-lg border border-primary rounded bg-gray-100 dots-icon" style=" margin: 8px 0 0 0; ">
                                <i class="bi-laptop"></i>
                                <i class="fa fa-university fa-3x mobile-icon" style="font-size: 12px;color: #3ca1db;"></i>
                            </div>
                            <div class="media-body ps-3">
                                <p class="m-0">Fast Paced hiring.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 my-3">
                        <div class="media  wow fadeInUp" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInUp;">
                            <div class="icon-lg border border-primary rounded bg-gray-100 dots-icon" style=" margin: 8px 0 0 0; ">
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
                            <div class="icon-lg border border-primary rounded bg-gray-100 dots-icon" style=" margin: 8px 0 0 0; ">
                                <i class="bi-command"></i>
                                <i class="fa fa-university fa-3x mobile-icon" style="font-size: 12px;color: #3ca1db;"></i>
                            </div>
                            <div class="media-body ps-3">
                                <p class="m-0">Seeking out candidates precisely matching your Talent, Skill and Culture fitment  </p>
                            </div>
                        </div>
                    </div>
                    <p class="mt-4" style="margin: 155px 0 0 16px;">Through the Accel program, we help our clients onboard the right talent faster. </p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section litpadtop bgw custom-section">
<div class="container">
    <div class="row">
        <div id="sidebar1" class="col-md-12 col-sm-12">
            <div class="widget clearfix">
                <div class="member-profile">
			    <div class="section-title-2 text-center manager-section">
			        <h2>Talk to our Corporate Relationship Manager</h2>
			        <hr>
			    </div><!-- end section-title -->

                    <div class="row profile-badges contact-rm">
                        <div class="contact_form">
                                <div class="col-md-12">
                                <input type="text" id="txt_name" class="form-control" placeholder="Name" maxlength="100" onkeydown="return /[a-z ]/i.test(event.key)"> 
                                <input type="text" id="txt_company" class="form-control" placeholder="Company"> 
                                <input type="text" id="txt_email" class="form-control" maxlength="100" placeholder="Email"> 
                                <input type="text" id="txt_mobile" class="form-control" placeholder="Mobile" onkeypress='return isNumberKey(event);'> 
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