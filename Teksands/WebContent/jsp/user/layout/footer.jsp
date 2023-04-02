<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.welcomebox-p {
    padding: 20px 0 !important;
}
.modal-text-color
{
	color: white !important;
}
</style>

<script>

$( document ).ready(function() 
{
	document.getElementById("year").innerHTML = new Date().getFullYear();
});
	function saveDownloadContacts() {
		var name = $("#dwn_name").val();
		var email = $("#dwn_email").val();
		var mobile = $("#dwn_mobile").val();
		var company = $("#dwn_company").val();
		var requirements = $("#dwn_requirements").val();

		if (name == "") {
			swal("OOPS!", "Please Enter Name", "error")
			return false;
		}

		if (email == "") {
			swal("OOPS!", "Please Enter Email", "error")
			return false;
		}

		if (mobile == "") {
			swal("OOPS!", "Please Enter Mobile", "error")
			return false;
		}

		if (company == "") {
			swal("OOPS!", "Please Enter Company Name", "error")
			return false;
		}

		if (requirements == "") {
			swal("OOPS!", "Please Enter Requirements", "error")
			return false;
		}

		if (!isEmail(email)) {
			swal("OOPS!", "Please Enter Valid Email", "error")
			return false;
		}

		console.log("name = " + name);
		console.log("email = " + email);
		console.log("mobile = " + mobile);
		console.log("company = " + company);
		console.log("requirements = " + requirements);

		$.ajaxSetup({
			async : false
		});
		$
				.post(
						"/saveContacts",
						{
							name : "" + name + "",
							email : "" + email + "",
							mobile : "" + mobile + "",
							company : "" + company + "",
							requirements : "" + requirements + "",
						},
						function(data) {
							var result = $.trim(data);
							var obj = jQuery.parseJSON(result);
							if (obj.status_code == 200) {
								swal(
										"Thank you for contacting us",
										"We have received your enquiry and will respond to you shortly",
										"success");

								$("#dwn_name").val("");
								$("#dwn_company").val("");
								$("#dwn_mobile").val("");
								$("#dwn_email").val("");
								$("#dwn_requirements").val("");

								return false;
							} else {
								swal("OOPS!", "Please Enter Correct Details",
										"error");
								return false;
							}

						}, 'text');
	}

	function saveContactsfromSide() {
		var name = $("#side_name").val();
		var email = $("#side_email").val();
		var mobile = $("#side_mobile").val();
		var company = "";
		var requirements = "Side Contact Form";

		if (name == "") {
			swal("OOPS!", "Please Enter Name", "error")
			return false;
		}

		if (email == "") {
			swal("OOPS!", "Please Enter Email", "error")
			return false;
		}

		if (mobile == "") {
			swal("OOPS!", "Please Enter Mobile", "error")
			return false;
		}

		if (!isEmail(email)) {
			swal("OOPS!", "Please Enter Valid Email", "error")
			return false;
		}

		console.log("name = " + name);
		console.log("email = " + email);
		console.log("mobile = " + mobile);
		console.log("company = " + company);
		console.log("requirements = " + requirements);

		$.ajaxSetup({
			async : false
		});
		$
				.post(
						"/saveContacts",
						{
							name : "" + name + "",
							email : "" + email + "",
							mobile : "" + mobile + "",
							company : "" + company + "",
							requirements : "" + requirements + "",
						},
						function(data) {
							var result = $.trim(data);
							var obj = jQuery.parseJSON(result);
							if (obj.status_code == 200) {
								swal(
										"Thank you for contacting us",
										"We have received your enquiry and will respond to you shortly",
										"success");

								$("#side_name").val("");
								$("#side_email").val("");
								$("#side_mobile").val("");

								return false;
							} else {
								swal("OOPS!", "Please Enter Correct Details",
										"error");
								return false;
							}

						}, 'text');
	}

	function saveContactsfromPopup() {
		var name = $("#pop_name").val();
		var mobile = $("#pop_mobile").val();
		var email = $("#pop_email").val();
		var company = "";
		var requirements = "Side Popup Form";

		if (name == "") {
			swal("OOPS!", "Please Enter Name", "error")
			return false;
		}

		if (email == "") {
			swal("OOPS!", "Please Enter Email", "error")
			return false;
		}

		if (mobile == "") {
			swal("OOPS!", "Please Enter Mobile", "error")
			return false;
		}

		if (!isEmail(email)) {
			swal("OOPS!", "Please Enter Valid Email", "error")
			return false;
		}

		console.log("name = " + name);
		console.log("email = " + email);
		console.log("mobile = " + mobile);
		console.log("company = " + company);
		console.log("requirements = " + requirements);

		$.ajaxSetup({
			async : false
		});
		$
				.post(
						"/saveContacts",
						{
							name : "" + name + "",
							email : "" + email + "",
							mobile : "" + mobile + "",
							company : "" + company + "",
							requirements : "" + requirements + "",
						},
						function(data) {
							var result = $.trim(data);
							var obj = jQuery.parseJSON(result);
							if (obj.status_code == 200) {
								swal(
										"Thank you for contacting us",
										"We have received your enquiry and will respond to you shortly",
										"success");
								$('#signUpModal').modal('toggle');

								$("#pop_name").val("");
								$("#pop_email").val("");
								$("#pop_mobile").val("");

								return false;
							} else {
								swal("OOPS!", "Please Enter Correct Details",
										"error");
								return false;
							}

						}, 'text');
	}

	function saveContactsFromOverlay() {
		var name = $("#over_name").val();
		var company = $("#over_company").val();
		var email = $("#over_email").val();
		var mobile = $("#over_mobile").val();
		var requirements = "Overlay Form";

		if (name == "") {
			swal("OOPS!", "Please Enter Name", "error")
			return false;
		}
		
		if (company == "") {
			swal("OOPS!", "Please Enter Organisation Name", "error")
			return false;
		}

		if (email == "") {
			swal("OOPS!", "Please Enter Email", "error")
			return false;
		}

		if (mobile == "") {
			swal("OOPS!", "Please Enter Mobile", "error")
			return false;
		}

		if (!isEmail(email)) {
			swal("OOPS!", "Please Enter Valid Email", "error")
			return false;
		}

		console.log("name = " + name);
		console.log("email = " + email);
		console.log("mobile = " + mobile);
		console.log("company = " + company);
		console.log("requirements = " + requirements);
		console.log("company = " + company);

		$.ajaxSetup({
			async : false
		});
		$
				.post(
						"/saveContacts",
						{
							name : "" + name + "",
							company : "" + company + "",
							email : "" + email + "",
							mobile : "" + mobile + "",
							company : "" + company + "",
							requirements : "" + requirements + "",
						},
						function(data) {
							var result = $.trim(data);
							var obj = jQuery.parseJSON(result);
							if (obj.status_code == 200) {
								swal(
										"Thank you for contacting us",
										"We have received your enquiry and will respond to you shortly",
										"success");
								$('#home_popup').modal('toggle');

								$("#over_name").val("");
								$("#over_mobile").val("");
								$("#over_email").val("");
								$("#over_company").val("");

								return false;
							} else {
								swal("OOPS!", "Please Enter Correct Details",
										"error");
								return false;
							}

						}, 'text');
	}
	
function savePropel() 
{
	var name = $("#pop_name").val();
	var company = $("#pop_company").val();
	var email = $("#pop_email").val();
    var mobile = $("#pop_mobile").val();
    var requirement = $("#pop_requirements").val();
    var enquiry_type = "Propel";
    
    if(name == ""){
    	swal("OOPS!", "Please Enter Name", "error")
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
    
    
    if(email == "") {
    	swal("OOPS!", "Please Enter Email", "error")
   	    return false;
    }
        
    if(!isEmail(email)) {
    	swal("OOPS!", "Please Enter Valid Email", "error")
   	    return false;
    }
    
	var emaillength = email.length;
    
    if(emaillength > 100) 
    {
    	swal("OOPS!", "Maximum allowed is 100 characters", "error")
   	    return false;
    }
    
    if(company == ""){
    	swal("OOPS!", "Please Enter Your Organization Name", "error")
   	    return false;
    }
    
    if(requirement == "") {
    	swal("OOPS!", "Please Enter your requirement", "error")
   	    return false;
    }
  
    $.ajaxSetup({async:false});
	$.post("/saveLiftOffContact", {name: "" + name + "", 
		email: "" + email + "",
		mobile: "" + mobile + "", 
		company: "" + company + "",
		enquiry_type: "" + enquiry_type + "",
		requirement: "" + requirement + "",}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
   			swal("Thank you for contacting us", "We have received your enquiry and will respond to you shortly", "success");
   			
   			$("#pop_name").val("");
   	    	$("#pop_company").val("");
   	    	$("#pop_email").val("");
   	    	$("#pop_mobile").val("");
   	    	$("#signUpModal").modal('toggle');   	    	
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
	function isEmail(email) {
		var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		return regex.test(email);
	}
</script>
<c:choose>
	<c:when test="${page eq 'contact'}">
	</c:when>
	<c:otherwise>
			<section class="welcomebox-wrapper">
	<div class="container">
		<div class="welcomebox m900 welcomebox-p">
		<c:choose>			
		  <c:when test="${page eq 'article' || page eq 'article-details'}">		
			<div class="row">
				<div class="col-md-8 col-sm-8 col-xs-12">
					<h3 class="mar-top" style="text-align: center;font-size: 18px;font-weight: bold;color: #fff;margin-top: 10px;line-height: 27px;">Get in touch with us for an exploratory discussion on your Talent Acquisition, Talent Development or Talent Assessment Needs</h3>
				</div>
				<!-- end col -->
				<div class="col-md-4 col-sm-4 col-xs-12 text-right">
					<a href="javascript:void(0);" class="btn btn-default"
						data-toggle="modal" data-target="#signUpModal">Contact Us</a>
				</div>
				<!-- end col -->
			</div>
			</c:when>
			<c:otherwise>			
			<div class="row">
				<div class="col-md-8 col-sm-8 col-xs-12">
					<h3 class="mar-top" style="text-align: center;font-size: 18px;font-weight: bold;color: #fff;margin-top: 10px;line-height: 27px;">Enquire about Upskilling your IT Freshers and Cross-Skilling your IT Workforce through our Propel Program</h3>
				</div>
				<!-- end col -->
				<div class="col-md-4 col-sm-4 col-xs-12 text-right">
					<a href="javascript:void(0);" class="btn btn-default"
						data-toggle="modal" data-target="#signUpModal">Sign Up</a>
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
			</c:otherwise>
			</c:choose>
		</div>
		<!-- end callout -->
	</div>
</section>
<!-- end section -->
			</c:otherwise>
			</c:choose>

<footer class="footer" <c:if test="${page eq 'contact'}">style="margin-top: 30px !important;"</c:if>>
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-md-6 col-xs-12">
				<div class="widget">
					<h2 class="related-title">
						<span>About Teksands</span>
					</h2>

					<div class="text-widget">
						<!-- <p style="text-align: justify;">We are Teksands, a Talent Solutions company with a whole range of services encompassing Talent Sourcing and Skilling. Our flagship Lift-off bootcamp program delivers FTE hiring for our clients in HTD and THD models. Our corporate bootcamps deliver upskilling and cross-skilling of your IT Workforce through the Propel program. Our Accel Lateral Hiring services ensure fast-paced and effective Lateral Hiring for all levels of IT workforce for your organization.</p> -->
						<p style="text-align: justify;">We are a Talent Solutions company with a whole range of services encompassing Talent Sourcing, Bootcamps and Training. We provide Lateral Hiring, Campus Hiring, Assessments as a  Service, Source-Train-HIre (STH), Recruitment Outsourcing and Corporate Training.</p>
					</div>
				</div>
				<!-- end widget -->
			</div>
			<!-- end col -->

			<div class="col-md-3 col-md-6 col-xs-6">
				<div class="widget">
					<h2 class="related-title">
						<span>ASSOCIATE WITH US</span>
					</h2>
					<ul class="contact-details">
						<li><a href="/work-with-us">Work With Us</a></li>
						<li><a href="/internships">Internship</a></li>
						<li><a href="/become-a-trainer">Become A Trainer</a></li>
						<li><a href="/contributor">Contributor</a></li>
					</ul>
				</div>
				<!-- end widget -->
			</div>
			<!-- end col -->

			<div class="col-md-3 col-md-6 col-xs-6">
				<div class="widget">
					<h2 class="related-title">
						<span>Services</span>
					</h2>
					<ul class="contact-details">
						<li><a href="/ebp">Lift Off - Source-Train-Hire</a></li>
						<li><a href="/corporate-training">Propel - Corporate Training</a></li>
						<li><a href="/accel-hire">Accel Hire - Lateral Services </a></li>
						<li><a href="#">Diversity Hiring</a></li>
					</ul>
				</div>
				<!-- end widget -->
			</div>
			<!-- end col -->

			<div class="col-md-3 col-md-6 col-xs-12">
				<div class="widget">
					<h2 class="related-title">
						<span>Contact Details</span>
					</h2>

					<ul class="contact-details hidden-xs">
						<li><i class="fa fa-link"></i> <a href="/">www.teksands.ai</a></li>
						<li><i class="fa fa-envelope-o"></i> <a
							href="mailto:info@teksands.ai">info@teksands.ai</a></li>
						<li><i class="fa fa-phone"></i> +91 63 6273 2428</li>
						<li><i class="fa fa-home"></i> Bangalore</li>
					</ul>

					<div class="col-xs-12 hidden-sm hidden-md hidden-lg">
						<div class="col-xs-6" style="padding: 0 0 0 0">
							<ul class="contact-details">
								<li><i class="fa fa-link"></i> <a href="/">www.teksands.ai</a></li>
								<li><i class="fa fa-envelope-o"></i> <a
									href="mailto:info@teksands.ai">info@teksands.ai</a></li>
							</ul>
						</div>
						<div class="col-xs-6" style="padding: 0 0 0 0">
							<ul class="contact-details">
								<li><i class="fa fa-phone"></i> +91 63 6273 2428</li>
								<li><i class="fa fa-home"></i> Bangalore</li>
							</ul>
						</div>
					</div>

				</div>
				<!-- end widget -->
			</div>
			<!-- end col -->
		</div>
		<!-- end row -->
	</div>
	<!-- end container -->
</footer>
<!-- end footer -->

<div class="logo-wrapper background-color">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-12 text-center">
				<div class="site-logo">
					<a href="/"><img alt="teksands"
						src="/resources/images/teksands_logo.jpg" class="img-responsive"
						style="width: 260px; height: 50px;"></a>
				</div>
			</div>
			<!-- end col -->

			<div class="col-md-8 text-right hidden-xs">
				<div class="postpager">
					<ul class="pager row-fluid">
						<li class="col-md-4 col-sm-4 col-xs-12">
							<div class="post">
								<a
									href="/ebp"
									target="_blank"> <img alt=""
									src="/resources/images/header/liftoff.png"
									class="img-responsive alignleft" alt="Deep Learning">
									<h4>Liftoff Bootcamp Program - Hire Skilled Developers in HTD and THD Models</h4> <small>Learn More</small>
								</a>
							</div>
						</li>
						<li class="col-md-4 col-sm-4 col-xs-12">
							<div class="post">
								<a
									href="/corporate-training"
									target="_blank"> <img alt=""
									src="/resources/images/header/propel.png"
									class="img-responsive alignleft" alt="Post Graduate Program">
									<h4>Propel - Upskill your Freshers or Cross-skill your workforce</h4> <small>Learn More</small>
								</a>
							</div>
						</li>
						<li class="col-md-4 col-sm-4 col-xs-12">
							<div class="post">
								<a href="/accel-hire" target="_blank"> <img
									alt="" src="/resources/images/header/accel.png"
									class="img-responsive alignleft" alt="DevOps Mastery Program">
									<h4>Accel Hire - Lateral Hiring at pace</h4> <small>Learn More</small>
								</a>
							</div>
						</li>
					</ul>
				</div>
				<!-- end postpager -->
			</div>
			<!-- end col -->
		</div>
		<!-- end row -->
	</div>
	<!-- end container -->
</div>
<!-- end logo-wrapper -->

<div class="topbar copyrights">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-12 text-left hidden-xs">
				<div class="topmenu">
					<span><a href="/contact-us">Contact</a></span> <span><a
						href="/terms-of-use">Terms of Use</a></span> <span><a
						href="/privacy-policy">Privacy & Cookie Policy</a></span>
				</div>
				<!-- end callus -->
			</div>

			<div class="col-md-4 col-sm-12 text-left hidden-xs">
				<div class="topmenu">
					<p class="text-center footer-text">© <span id="year"></span> Teksands - Wrtr Ink
						LLP - All Rights Reserved</p>
				</div>
				<!-- end callus -->
			</div>
			<div class="col-md-4 col-sm-12 text-right">
				<div class="social-icons">
					<ul class="list-inline">
						<li class="facebook"><a data-toggle="tooltip"
							data-placement="bottom" title="Facebook"
							href="https://www.facebook.com/Teksands/" target="_blank"><i
								class="fa fa-facebook"></i></a></li>
						<li class="instagram"><a data-toggle="tooltip"
							data-placement="bottom" title="Instagram"
							href="https://www.instagram.com/teksands.ai/" target="_blank"><i
								class="fa fa-instagram"></i></a></li>
						<li class="twitter"><a data-toggle="tooltip"
							data-placement="bottom" title="Twitter"
							href="https://twitter.com/teksands" target="_blank"><i
								class="fa fa-twitter"></i></a></li>
						<li class="linkedin"><a data-toggle="tooltip"
							data-placement="bottom" title="Linkedin"
							href="https://www.linkedin.com/company/teksands/" target="_blank"><i
								class="fa fa-linkedin"></i></a></li>
						<li class="vimeo"><a data-toggle="tooltip"
							data-placement="bottom" title="Vimeo"
							href="https://vimeo.com/user145878395" target="_blank"><i
								class="fa fa-vimeo"></i></a></li>
						<li class="youtube"><a data-toggle="tooltip"
							data-placement="bottom" title="Youtube"
							href="https://www.youtube.com/channel/UCrfexSD469V7WXVAAVd3Uag/featured"
							target="_blank"><i class="fa fa-youtube"></i></a></li>
					</ul>
				</div>
				<!-- end social icons -->
			</div>
			<!-- end col -->
		</div>
		<!-- end row -->

	</div>
	<!-- end topbar -->
</div>
<!-- end topbar -->

<div class="modal fade" id="signUpModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md" role="document">
		<div class="modal-content">
			<div class="modal-header btn-primary">
				<h5 class="modal-title modal-text-color" id="exampleModalLabel">Contact Us</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>		
				<div class="row">
					<div class="form-group col-lg-6">
						<label for="recipient-name" class="col-form-label">Name:</label> <input
							type="text" class="form-control" maxlength="100" id="pop_name" onkeydown="return /[a-z ]/i.test(event.key)">
					</div>
					<div class="form-group col-lg-6">
						<label for="recipient-phone" class="col-form-label">Phone:</label>
						<input type="text" class="form-control" id="pop_mobile" onkeypress='return isNumberKey(event);'>
					</div>
					<div class="form-group col-lg-12">
						<label for="recipient-mail" class="col-form-label">Email:</label>
						<input type="text" class="form-control" id="pop_email" maxlength="100">
					</div>
					<div class="form-group col-lg-12">
						<label for="recipient-company" class="col-form-label">Organization:</label>
						<input type="text" class="form-control" id="pop_company">
					</div>
					<div class="form-group col-lg-12">
						<label for="recipient-company" class="col-form-label">Please tell us your requirement:</label>
						<textarea class="form-control" rows="3" id="pop_requirements" name="pop_requirements" placeholder="Requirements"></textarea>						
					</div>		
					</div>			
				</form>
			</div>
			<div class="modal-footer">				
				<button type="button" class="btn btn-primary" onclick="savePropel()">Send</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="DownloadformModal" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Download Course
					List</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<input type="text" id="dwn_name" class="form-control"
							placeholder="Name">
					</div>
					<div class="form-group">
						<input type="text" id="dwn_company" class="form-control"
							placeholder="Company">
					</div>
					<div class="form-group">
						<input type="text" id="dwn_email" class="form-control"
							placeholder="Email">
					</div>
					<div class="form-group">
						<input type="text" id="dwn_mobile" class="form-control"
							placeholder="Mobile">
					</div>
					<div class="form-group">
						<textarea id="dwn_requirements" class="form-control"
							placeholder="Requirements"></textarea>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary"
					onclick="saveDownloadContacts()">Send</button>
			</div>
		</div>
	</div>
</div>

<div id="feedback">
	<div id="feedback-form" style='display: none;'
		class="col-xs-4 col-md-4 panel panel-default">
		<h5 class="text-center" style="margin: 10px 0 0 0; line-height: 18px;">
			<b>Get Regular updates <br> and offers on Courses
			</b>
		</h5>
		<div method="POST" action="/feedback" class="form panel-body"
			role="form">
			<div class="form-group">
				<input class="form-control" id="side_name" name="name" autofocus
					placeholder="Your Name" type="text" />
			</div>
			<div class="form-group">
				<input class="form-control" id="side_mobile" name="mobile" autofocus
					placeholder="Your Mobile" type="number" />
			</div>
			<div class="form-group">
				<input class="form-control" id="side_email" name="email" autofocus
					placeholder="Your Email" type="email" />
			</div>
			<button class="btn btn-primary btn-square btn-sm pull-right"
				type="submit" onclick="saveContactsfromSide()"
				style="margin: 0 53px 0 0;">Submit</button>
		</div>
		<button class="btn btn-primary btn-square btn-sm pull-right"
			type="submit" id="closeButton" style="margin: -45px 0 0 0;">Close</button>
	</div>
	<div id="feedback-tab">Send Message</div>
</div>


<div id="home_popup" class="modal fade hidden-xs" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	>
	<div class="modal-dialog modal-dialog-centered custom-modal-margin"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="popup-modal" data-dismiss="modal">&times;</button>
				<p class="text-center">
					<img alt="" style="width: 200px;"
						src="/resources/images/teksands_logo.jpg">
				</p>
			</div>
			<div class="modal-body">
				<div class="row">
					<p class="popup-title">CONTACT US TODAY FOR HIRING
						READY-SKILLED DEVELOPERS AND BOOTCAMP BASED LIFT-OFF PROGRAM.</p>
				</div>
				<div class="row">
					<div class="col-md-6 ml-auto">
						<img alt="" src="/resources/images/Asset-1.png"
							class="img-responsive alignleft popup-image">
					</div>
					<div class="col-md-6 ml-auto">
						<div class="form-group">
							<input class="form-control" id="over_name" name="name" autofocus
								placeholder="Your Name" type="text" />
						</div>
						<div class="form-group">
							<input class="form-control" id="over_company" name="name" autofocus
								placeholder="Your Organisation" type="text" />
						</div>
						<div class="form-group">
							<input class="form-control" id="over_mobile" name="mobile"
								autofocus placeholder="Your Mobile" type="number" />
						</div>
						<div class="form-group">
							<input class="form-control" id="over_email" name="email"
								autofocus placeholder="Your Email" type="email" />
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary btn-square btn-sm"
					data-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-primary btn-square btn-sm"
					onclick="saveContactsFromOverlay()">Submit</button>
			</div>
		</div>
	</div>
</div>
