<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
$(document).ready(function(){
	
	$("#file").change(function() 
	{
		var ebp_mobile = $("#ebp_mobile").val();
	   	if(ebp_mobile == "")
		   {
			 $("#file").val(""); 
		 	 swal("OOPS!", "Please fill the form after you upload the resume", "info");
		 	 return false;
		   }
	   $("#txt_resume_mobile").val(ebp_mobile);
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
	var ebp_mobile = $("#ebp_mobile").val();
   if(ebp_mobile == "")
   {
	   $("#file").val(""); 
 	 swal("OOPS!", "Please fill the form after you upload the resume", "info");
 	 return false;
   }
   $("#txt_resume_mobile").val(ebp_mobile);
}
function saveEbpCandidate()
{
    var name = $("#ebp_name").val();
    var gender = $("input:radio[name='ebp_gender']:checked").val();
    var mobile = $("#ebp_mobile").val();
    var email = $("#ebp_email").val();
    var address1 = $("#ebp_addr1").val();
    var address2 = $("#ebp_addr2").val();
    var city = $("#ebp_city").val();
    var state= $("#ebp_state").val();
    var country = $("#ebp_country").val();
    var pincode = $("#ebp_pincode").val();
    var year_passing = $("#ebp_year_passing").val();
    var qualification = $("#ebp_education").val();
    var college = $("#ebp_college").val();
    var position = $("#ebp_position").val();
    var skills = $("#ebp_skill").val();
    var experience = $("#ebp_exp").val();
    var description = $("#ebp_description").val();
    var resume = $("#para_resume").html();
    var linkedin_url = $("#ebp_linkedin").val();
    
    
    if(name == ""){
    	swal("OOPS!", "Please Enter Name", "error");
	 	return false;
    }
    
    if(gender == "") {
    	swal("OOPS!", "Please Select Gender", "error");
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
    
    if(pincode == "Select Country") {
    	swal("OOPS!", "Please Enter Your Country", "error");
	 	return false;
    }
    
    if(year_passing == "") {
    	swal("OOPS!", "Please Enter Your Year of Passing", "error");
	 	return false;
    }
    
    if(college == "") {
    	swal("OOPS!", "Please Enter Your College Name", "error");
	 	return false;
    }
    
    if(qualification == "") {
    	swal("OOPS!", "Please Enter Your Education Details", "error");
	 	return false;
    }
    
    if(position == "") {
    	swal("OOPS!", "Please Enter Your Positions", "error");
	 	return false;
    }
    
    if(skills == "") {
    	swal("OOPS!", "Please Select Your Core Skill", "error");
	 	return false;
    }
    
    if(experience == "") {
    	swal("OOPS!", "Please Select Your Current Experience", "error");
	 	return false;
    }
    
    if(description == "") {
    	swal("OOPS!", "Please Enter Your Profile Information", "error");
	 	return false;
    }
    
    if(!isEmail(email)) {
    	swal("OOPS!", "Please Enter Valid Email", "error");
	 	return false;
    }
    
    console.log("name = " + name);
    console.log("gender = " + gender);
    console.log("mobile = " + mobile);
    console.log("email = " + email);
    console.log("address1 = " + address1);
    console.log("address2 = " + address2);
    console.log("city = " + city);
    console.log("state = " + state);
    console.log("country = " + country);
    console.log("pincode = " + pincode);
    console.log("year_passing = " + year_passing);
    console.log("college = " + college);
    console.log("qualification = " + qualification);
    console.log("experience = " + experience);
    console.log("position = " + position);
    console.log("skills = " + skills);
    console.log("description = " + description);
    console.log("linkedin_url = " + linkedin_url);
    
    $.ajaxSetup({async:false});
	$.post("/saveEbpCandidate", {name: "" + name + "", 
		gender: "" + gender + "",
		mobile: "" + mobile + "",
		email: "" + email + "",
		address1: "" + address1 + "",
		address2: "" + address2 + "",
		city: "" + city + "",
		state:"" + state + "",
		country: "" + country + "",
		pincode: "" + pincode + "",
		year_passing: "" + year_passing + "",
		position: "" + position + "",
		experience: "" + experience + "",
		qualification: "" + qualification + "",
		college: "" + college + "",
		skills: "" + skills + "",
		description: "" + description + "",
		linkedin_url: "" + linkedin_url + "",
		resume: "" + resume + "",}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
  			
   			swal("Thank you for contacting us", "We have received your enquiry and will respond to you shortly", "success");
   		    
	   		$("#ebp_name").val("");
	   	    $("input:radio[name='ebp_gender']:checked").val("");
	   	    $("#ebp_mobile").val("");
	   	    $("#ebp_email").val("");
	   	    $("#ebp_addr1").val("");
	   	    $("#ebp_addr2").val("");
	   	    $("#ebp_city").val("");
	   	    $("#ebp_state").val("");
	   	    $("#ebp_country").val("");
	   	    $("#ebp_pincode").val("");
	   	 	$("#ebp_year_passing").val("");
	   	 	$("#ebp_college").val("");
	   	    $("#ebp_education").val("");
	   	 	$("#ebp_position").val("");
	   	 	$("#ebp_skill").val("");
	   		$("#ebp_exp").val("");
	   		$("#ebp_description").val("");
   			
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
$(function () {
    $( "#ebp_year_passing" ).change(function() {
       var max = parseInt($(this).attr('max'));
       var min = parseInt($(this).attr('min'));
       if ($(this).val() > max)
       {
    	   swal("OOPS!", "Please enter a valid year", "info");
       }
       else if ($(this).val() < min)
       {
    	   swal("OOPS!", "Please enter a valid year", "info");
       }       
     }); 
 });
function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    console.log(charCode);
    if (charCode != 43 &&  charCode > 31
    		&& (charCode < 48 || charCode > 57) && (charCode != 32 && charCode != 0) )
        return false;

    return true;
}
function isPincodeKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    console.log(charCode);
    if ((charCode < 48 || charCode > 57) )
        return false;

    return true;
}
</script>

<div class="page-title bgg">
    <div class="container clearfix">
       <div class="pull-left">
           <div class="bread">
               <ol class="breadcrumb">
                   <li><a href="#">Home</a></li>
                   <li class="active">Contributor</li>
               </ol>
           </div><!-- end bread -->
       </div><!-- /.pull-right -->
    </div>
</div><!-- end page-title -->

<section class="section litpadtop bgw course-section">
<div class="container">
    <div class="row">
        <div id="sidebar1" class="col-md-12 col-sm-12">
            <div class="clearfix">
                <div class="member-profile">
				    <div class="section-title-2 text-center course-section">
				        <h1 class="home-h1">Candidate Application Form</h1>
				        <p class="lead">Please Apply by filling up the following details and attach your CV</p>
				        <hr>
				    </div><!-- end section-title -->
		                   <div class="row profile-badges contact-rm">
		                       <div class="contact_form">
						  <div class="row">
						    <div class="col-md-12">
						      <input type="text" id="ebp_name" class="form-control" maxlength="100" onkeydown="return /[a-z ]/i.test(event.key)" placeholder="Name *" required>
						    </div>
						  </div>
						  <div class="row">
						    <div class="col-md-12" style="margin: 0 0 20px 0;">
						    	<label>Gender : &nbsp;</label>
							    <label class="radio-inline">
								  <input type="radio" name="ebp_gender" value="male" checked> Male
								</label>
								<label class="radio-inline">
								  <input type="radio" name="ebp_gender" value="female"> Female
								</label>
								<label class="radio-inline">
								  <input type="radio" name="ebp_gender" value="other"> Other
								</label>
						    </div>
						  </div>
						  <div class="row">
						    <div class="col-md-6">
						      <input type="text" class="form-control" id="ebp_mobile" onkeypress='return isNumberKey(event);' placeholder="Mobile *" required onchange="mobileChange()">
						    </div>
						    <div class="col-md-6">
						      <input type="text" class="form-control" id="ebp_email" placeholder="Email *" required>
						    </div>
						  </div>
						  <div class="row">
						    <div class="col-md-12">
						      <input type="text" class="form-control" id="ebp_addr1" placeholder="Address Line 1">
						    </div>
						  </div>
						  <div class="row">
						    <div class="col-md-12">
						      <input type="text" class="form-control" id="ebp_addr2" placeholder="Address Line 2">
						    </div>
						  </div>
						  	<div class="row">
						    <div class="col-md-4">
						      <input type="text" class="form-control" id="ebp_city" placeholder="City *">
						    </div>
						    <div class="col-md-4">
						      <input type="text" class="form-control" id="ebp_state" placeholder="State *">
						    </div>
						    <div class="col-md-4">
						      <select class="form-control" id="ebp_country" name="ebp_country">
						      	  <option selected>Select Country</option>
							      <c:forEach items="${countries}" var="country"> 
							      	<option>${country.country_name}</option>
							      </c:forEach>
							  </select>
						    </div>
						  </div>
						  <div class="row">
						    <div class="col-md-6">
						      <input type="text" class="form-control" id="ebp_pincode" placeholder="Pincode" onkeypress='return isPincodeKey(event);'>
						    </div>
						    <div class="col-md-6">
						      <input type="text" class="form-control" id="ebp_year_passing" min="2000" max="2050" placeholder="Year of Passing">
						    </div>
						  </div>
						  <div class="row">
						    <div class="col-md-12">
						      <input type="text" class="form-control" id="ebp_college" placeholder="Enter Your College Name *" required>
						    </div>
						  </div>
						  <div class="row">
						    <div class="col-md-6">
						      <input type="text" class="form-control" id="ebp_education" placeholder="Highest Educational Qualification *" required>
						    </div>
						    <div class="col-md-6">
						      <input type="text" class="form-control" id="ebp_position" placeholder="Name of Position/Cohort Applying for *" required>
						    </div>
						  </div>
						  <div class="row">
						    <div class="col-md-6">
						      <input type="text" class="form-control" id="ebp_skill" placeholder="What are your core skills areas? *" required>
						    </div>
						    <div class="col-md-6">
						      <input type="number" class="form-control" id="ebp_exp" placeholder="How many years of experience total? " required>
						    </div>
						  </div>
						  <div class="row">
						    <div class="col-md-12">
						      <textarea class="form-control" name="comments" id="ebp_description" rows="6" placeholder="Please write a brief about your experience *" required></textarea>
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
						      <input type="text" class="form-control" id="ebp_linkedin" placeholder="Enter Your LinkedIn Profile URL" required>
						    </div>
						  </div>
                            <div class="row">
                            <div class="col-md-12">
                              <div class="text-center"><button type="button" value="submit" id="submit" class="button button--wayra" onclick="saveEbpCandidate()"> Register</button></div>
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