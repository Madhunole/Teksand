<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
$(document).ready(function(){
	
	$("#file").change(function() 
	{
		var bat_mobile = $("#bat_mobile").val();
	   if(bat_mobile == "")
	   {
		   $("#file").val(""); 
	 	 swal("OOPS!", "Please fill the form after you upload the resume", "info");
	 	 return false;
	   }
	   $("#txt_resume_mobile").val(bat_mobile);
	   var filename = $("#file").val(); 
	   if(filename == "")
	   {
		   $("#file").val(""); 
	 	 swal("OOPS!", "Please select the CV document", "info");
	 	 return false;
	   }
	   var input = this;
	 	
	 	var formData = new FormData($("#imageform")[0]);	 	
		var flag = false;
		
		$.LoadingOverlay("show");
		
		$.ajaxSetup({async:false});
		$.ajax({
		    url: '/uploadCVDocument',
		    type: 'POST',
		    data: formData,
		    async: true,
		    cache: false,
		    contentType: false,
		    processData: false,
		    beforeSend: function( xhr ) {

		    },
		    success: function (response) {
		    	$.LoadingOverlay("hide");
		    	var obj = jQuery.parseJSON(response);
				if(obj.status == 400){
					swal("OOPS!", obj.msg, "info");
					flag = true;
					return false;
				}
				var img_path = $.trim(obj.msg);
		        $("#para_resume").html(img_path);
		    }
		  });
		
		if(flag)
		{
			return false;
		}
	});
	
});
function mobileChange()
{
	var bat_mobile = $("#bat_mobile").val();
   if(bat_mobile == "")
   {
	   $("#file").val(""); 
 	 swal("OOPS!", "Please fill the form after you upload the resume", "info");
 	 return false;
   }
   $("#txt_resume_mobile").val(bat_mobile);
}
function saveTrainers()
{
    var name = $("#bat_name").val();
    var gender = $("input:radio[name='gender']:checked").val();
    var address1 = $("#bat_addr1").val();
    var address2 = $("#bat_addr2").val();
    var city = $("#bat_city").val();
    var state= $("#bat_state").val();
    var country = $("#bat_country").val();
    var mobile = $("#bat_mobile").val();
    var email = $("#bat_email").val();
    var technologies = $("#bat_tech").val();
    var contribute = $("#bat_con").val();
    var con_description = $("#bat_con_des").val();
    var tech_description = $("#bat_tech_des").val();
    var resume = $("#para_resume").html();
    
    if(name == ""){
    	swal("OOPS!", "Please Enter Name", "error");
	 	return false;
    }
    
    if(gender == "") {
    	swal("OOPS!", "Please Select Gender", "error");
	 	return false;
    }
    if(address1 == "") {
    	swal("OOPS!", "Please Enter Address Line 1", "error");
	 	return false;
    }
    
    if(address2 == "") {
    	swal("OOPS!", "Please Enter Address Line 2", "error");
	 	return false;
    }
    
    if(city == "") {
    	swal("OOPS!", "Please Enter Your City", "error");
	 	return false;
    }
    
    if(state == "") {
    	swal("OOPS!", "Please Enter Your State", "error");
	 	return false;
    }
    
    if(country == "") {
    	swal("OOPS!", "Please Select Your Country", "error");
	 	return false;
    }
    
    if(country == "Select Country") {
    	swal("OOPS!", "Please Select Your Country", "error");
	 	return false;
    }
    
    if(mobile == "") {
    	swal("OOPS!", "Please Enter Your Mobile", "error");
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
    	swal("OOPS!", "Please Enter Your Email", "error");
	 	return false;
    }
    var emaillength = email.length;
    if(emaillength > 100) {
    	swal("OOPS!", "Maximum allowed is 100 characters", "error")
   	    return false;
    }
    if(technologies == "") {
    	swal("OOPS!", "Please Enter Your Interest", "error");
	 	return false;
    }
    if(contribute == "") {
    	swal("OOPS!", "Please Select Your Contribute", "error");
	 	return false;
    }
    if(con_description == "") {
    	swal("OOPS!", "Please Enter Your Contribution", "error");
	 	return false;
    }
    if(tech_description == "") {
    	swal("OOPS!", "Please Enter Your Technologies Experience", "error");
	 	return false;
    }
    
    
    if(!isEmail(email)) {
    	swal("OOPS!", "Please Enter Valid Email", "error");
	 	return false;
    }
    
    console.log("name = " + name);
    console.log("gender = " + gender);
    console.log("address1 = " + address1);
    console.log("address2 = " + address2);
    console.log("city = " + city);
    console.log("state = " + state);
    console.log("country = " + country);
    console.log("mobile = " + mobile);
    console.log("email = " + email);
    console.log("technologies = " + technologies);
    console.log("contribute = " + contribute);
    console.log("con_description = " + con_description);
    console.log("tech_description = " + tech_description);
    
    $.ajaxSetup({async:false});
	$.post("/saveTrainers", {name: "" + name + "", 
		gender: "" + gender + "",
		address1: "" + address1 + "",
		address2: "" + address2 + "",
		city: "" + city + "",
		state:"" + state + "",
		country: "" + country + "",
		mobile: "" + mobile + "",
		email: "" + email + "",
		technologies: "" + technologies + "",
		contribute: "" + contribute + "",
		con_description: "" + con_description + "",
		tech_description: "" + tech_description + "",
		resume: "" + resume + "",}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
  			
   			swal("Thank you for contacting us", "We have received your enquiry and will respond to you shortly", "success");
   		    
	   		$("#bat_name").val("");
	   	    $("input:radio[name='gender']:checked").val("");
	   	    $("#bat_addr1").val("");
	   	    $("#bat_addr2").val("");
	   	    $("#bat_city").val("");
	   	    $("#bat_state").val("");
	   	    $("#bat_country").val("");
	   	    $("#bat_mobile").val("");
	   	    $("#bat_email").val("");
	   	    $("#bat_tech").val("");
	   	    $("#bat_con").val("");
	   	    $("#bat_con_des").val("");
	   	    $("#bat_tech_des").val("");
   			
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


<div class="page-title bgg">
    <div class="container clearfix">
        <!-- <div class="title-area pull-left">
           <h2>Blog Single <small>Listed below our awesome blog posts</small></h2>
       </div> --><!-- /.pull-right -->
       <div class="pull-left">
           <div class="bread">
               <ol class="breadcrumb">
                   <li><a href="#">Home</a></li>
                   <li class="active">Become a Trainer/Mentor</li>
               </ol>
           </div><!-- end bread -->
       </div><!-- /.pull-right -->
    </div>
</div><!-- end page-title -->

<section class="section bgw course-section">
    <div class="container">
        <div class="section-title-2 text-center course-title">
            <h1 class="home-h1">Trainer/Mentor Benefits & features</h1>
            <hr>
        </div><!-- end section-title -->
		<div class="row text-center">
          <div class="col-md-4 col-sm-12 mob20">
              <div class="boxes text-center service-first withcircle withborder benefits-section">
              	  <h4 style="color:#fff;"><b>Digital Focussed Young </br>Start-up</b></h4>
              </div><!-- end box -->
          </div><!-- end col -->
          <div class="col-md-4 col-sm-12 mob20">
              <div class="boxes text-center service-first withcircle withborder benefits-section">
                  <h4 style="color:#fff;"><b>More than 3000 hours of Coporate Trainings delivered in last 6 months</b></h4>
              </div><!-- end box -->
          </div><!-- end col -->
          <div class="col-md-4 col-sm-12">
              <div class="boxes text-center service-first withcircle withborder benefits-section">
                  <h4 style="color:#fff;"><b>400+ Trainers Registered with us and growing</b></h4>
              </div><!-- end box -->
          </div><!-- end col -->
        </div><!-- end row -->
        <div class="row text-center" style="margin-top: 20px;">
          <div class="col-md-4 col-sm-12 mob20">
              <div class="boxes text-center service-first withcircle withborder benefits-section">
                  <h4 style="color:#fff;"><b>High pedigreed and highly competent trainers from Industry</b></h4>
              </div><!-- end box -->
          </div><!-- end col -->
          <div class="col-md-4 col-sm-12 mob20">
              <div class="boxes text-center service-first withcircle withborder benefits-section">
                  <h4 style="color:#fff;"><b>Dedicated LMS for </br>the Learners</b></h4>
              </div><!-- end box -->
          </div><!-- end col -->
          <div class="col-md-4 col-sm-12">
              <div class="boxes text-center service-first withcircle withborder benefits-section">
                  <h4 style="color:#fff;"><b>Student and Trainers </br>Dashboards</b></h4>
              </div><!-- end box -->
          </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end section -->

<!-- <section class="section custom-section">
    <div class="container">
    <div class="section-title-2 text-center course-title">
        <h2>Companies We Served</h2>
        <hr>
    </div>end section-title
        <div id="owl-client" class="clients">
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/coforge.png" alt="" class="img-responsive"></a>
            </div>end logo

            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/directi.png" alt="" class="img-responsive"></a>
            </div>end logo

            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/hdfc_logo.png" alt="" class="img-responsive"></a>
            </div>end logo

            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/hexaware.png" alt="" class="img-responsive"></a>
            </div>end logo
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/lti.png" alt="" class="img-responsive"></a>
            </div>end logo
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/magna.png" alt="" class="img-responsive"></a>
            </div>end logo

            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/nucleussoftware.png" alt="" class="img-responsive"></a>
            </div>end logo
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/tech-mahendra.png" alt="" class="img-responsive"></a>
            </div>end logo
        </div>end row
    </div>end container
</section> -->

<section class="section litpadtop bgw">
<div class="container">
    <div class="row">
        <div id="sidebar1" class="col-md-12 col-sm-12">
            <div class="widget clearfix">
                <div class="member-profile">
			    <div class="section-title-2 text-center trainer-section">
			        <h2>Become a Trainer/Mentor</h2>
			        <hr>
			    </div><!-- end section-title -->

                    <div class="row profile-badges contact-rm">
                        <div class="contact_form">
								  <div class="row">
								    <div class="col-md-12">
								      <input type="text" id="bat_name" class="form-control" placeholder="Name *" maxlength="100" onkeydown="return /[a-z ]/i.test(event.key)" required>
								    </div>
								  </div>
								  <div class="row">
								    <div class="col-md-12" style="margin: 0 0 20px 0;">
								    	<label>Gender : &nbsp;</label>
									    <label class="radio-inline">
										  <input type="radio" name="gender" value="male" checked> Male
										</label>
										<label class="radio-inline">
										  <input type="radio" name="gender" value="female"> Female
										</label>
										<label class="radio-inline">
										  <input type="radio" name="gender" value="other"> Other
										</label>
								    </div>
								  </div>
								  <div class="row">
								    <div class="col-md-12">
								      <input type="text" class="form-control" id="bat_addr1" placeholder="Address Line 1">
								    </div>
								  </div>
								  <div class="row">
								    <div class="col-md-6">
								      <input type="text" class="form-control" id="bat_addr2" placeholder="Address Line 2">
								    </div>
								    <div class="col-md-6">
								      <input type="text" class="form-control" id="bat_city" placeholder="City">
								    </div>
								  </div>
								  <div class="row">
								    <div class="col-md-6">
								      <input type="text" class="form-control" id="bat_state" placeholder="State">
								    </div>
								    <div class="col-md-6">
								      <select class="form-control" id="bat_country" name="bat_country">
									      <option selected>Select Country</option>
									      <c:forEach items="${countries}" var="country"> 
									      	<option>${country.country_name}</option>
									      </c:forEach>
									  </select>
								    </div>
								  </div>
								  <div class="row">
								    <div class="col-md-6">
								      <input type="text" class="form-control" id="bat_mobile" placeholder="Mobile *" onkeypress='return isNumberKey(event);' required onchange="mobileChange()">
								    </div>
								    <div class="col-md-6">
								      <input type="text" class="form-control" id="bat_email" placeholder="Email *" maxlength="100" required>
								    </div>
								  </div>
								  <div class="row">
								    <div class="col-md-6">
								      <input type="text" class="form-control" id="bat_tech" placeholder="Key Skill Area *" required>
								    </div>
								    <div class="col-md-6">
								      <select class="form-control" id="bat_con" name="bat_con">
									      <option selected>Write Article</option>
									      <option>Sell a Course</option>
									      <option>Teach a Live Class</option>
									  </select>
								    </div>
								  </div>
								  <div class="row">
									  <div class="col-md-12">
	                                    <textarea class="form-control" id="bat_con_des" placeholder="Briefly describe if you have any prior training experience *" required></textarea>
	                                  </div>
                                  </div>
                                  <div class="row">
									  <div class="col-md-12">
	                                    <textarea class="form-control" id="bat_tech_des" placeholder="Briefly describe relevant industry experience you have"></textarea>
	                                  </div>
                                  </div>
                                  <div class="row">
									  <div class="col-md-12">
									  	<label for="files">Upload Your Current CV</label>
                                   		<form id="imageform" role="form" method="post" enctype="multipart/form-data">
										<input type="hidden" name="txt_resume_mobile" id="txt_resume_mobile" value="" />
										<input type="file" id="file" name="file" class="btn btn-default btn-block" />
										<p id="para_resume"></p>
										</form>
                                   	</div>
                                  </div>
                                   <div class="row">
	                                  <div class="col-md-12">
	                                    <div class="text-center"><button type="button" value="submit" id="submit" class="btn btn-primary" onclick="saveTrainers()"> Register</button></div>
	                                 </div>
                               		</div>
                        </div>
                    </div><!-- end row -->
                </div><!-- end team-member -->
            </div>
        </div><!-- end right -->
    </div><!-- end row -->
</div><!-- end container -->
</section><!-- end section -->