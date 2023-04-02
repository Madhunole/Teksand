<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
$(document).ready(function(){
	
	$("#file").change(function() 
	{
		var intrn_mobile = $("#intrn_mobile").val();
	   	if(intrn_mobile == "")
		   {
			 $("#file").val(""); 
		 	 swal("OOPS!", "Please fill the form after you upload the resume", "info");
		 	 return false;
		   }
	   $("#txt_resume_mobile").val(intrn_mobile);
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
	var intrn_mobile = $("#intrn_mobile").val();
   if(intrn_mobile == "")
   {
	   $("#file").val(""); 
 	 swal("OOPS!", "Please fill the form after you upload the resume", "info");
 	 return false;
   }
   $("#txt_resume_mobile").val(intrn_mobile);
}
function saveInternship()
{
    var first_name = $("#intrn_first_name").val();
    var last_name = $("#intrn_last_name").val();
    var mobile = $("#intrn_mobile").val();
    var email = $("#intrn_email").val();
    var college = $("#intrn_college").val();
    var skills = $("#intrn_skill").val();
    var resume = $("#para_resume").html();
    var description = $("#intrn_description").val();
    
    if(first_name == ""){
    	swal("OOPS!", "Please Enter First Name", "error");
	 	return false;
    }
    
    if(last_name == "") {
    	swal("OOPS!", "Please Select Last Name", "error");
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
    if(college == "") {
    	swal("OOPS!", "Please Enter Your College Name", "error");
	 	return false;
    }
    if(skills == "") {
    	swal("OOPS!", "Please Enter Your Skill", "error");
	 	return false;
    }
    
    if(description == "") {
    	swal("OOPS!", "Please Write about what kind of internship you are looking for", "error");
	 	return false;
    }
    
    if(!isEmail(email)) {
    	swal("OOPS!", "Please Enter Valid Email", "error");
	 	return false;
    }
    
    console.log("first_name = " + first_name);
    console.log("last_name = " + last_name);
    console.log("mobile = " + mobile);
    console.log("email = " + email);
    console.log("college = " + college);
    console.log("skills = " + skills);
    console.log("description = " + description);
    
    
    $.ajaxSetup({async:false});
	$.post("/saveInternship", {first_name: "" + first_name + "", 
		last_name: "" + last_name + "",
		mobile: "" + mobile + "",
		email: "" + email + "",
		college: "" + college + "",
		skills: "" + skills + "",
		description: "" + description + "",
		resume: "" + resume + "",}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
  			
   			swal("Thank you for contacting us", "We have received your enquiry and will respond to you shortly", "success");
   		    
   		    $("#intrn_first_name").val("");
	   	    $("#intrn_last_name").val("");
	   	    $("#intrn_mobile").val("");
	   	    $("#intrn_email").val("");
	   	 	$("#intrn_college").val("");
	   	    $("#intrn_skill").val("");
	   	    $("#para_resume").html("");
	   	    $("#intrn_description").val("");

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
			        <h1 class="home-h1">Apply for Internship</h1>
			        <hr>
			    </div><!-- end section-title -->

                    <div class="row profile-badges contact-rm">
                        <div class="contact_form">
								  <div class="row">
								    <div class="col-md-6">
								      <input type="text" id="intrn_first_name" class="form-control" placeholder="First Name *" maxlength="100" onkeydown="return /[a-z ]/i.test(event.key)" required>
								    </div>
								    <div class="col-md-6">
								      <input type="text" id="intrn_last_name" class="form-control" placeholder="Last Name *" maxlength="100" onkeydown="return /[a-z ]/i.test(event.key)" required>
								    </div>
								  </div>
								  <div class="row">
								    <div class="col-md-6">
								      <input type="text" class="form-control" id="intrn_mobile" placeholder="Mobile *" onkeypress='return isNumberKey(event);' required onchange="mobileChange()">
								    </div>
								    <div class="col-md-6">
								      <input type="text" class="form-control" id="intrn_email" placeholder="Email *" maxlength="100" required>
								    </div>
								  </div>
								  <div class="row">
								    <div class="col-md-12">
								      <input type="text" class="form-control" id="intrn_college" placeholder="Your College Name *" required>
								    </div>
								  </div>

								  <div class="row">
								    <div class="col-md-12">
								      <input type="text" class="form-control" id="intrn_skill" placeholder="Technology Skills/ Strength that you have *" required>
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
								      <textarea class="form-control" name="comments" id="intrn_description" rows="6" placeholder="Write a brief about what kind of internship you are looking for *" required></textarea>
								      <!-- <input type="text" class="form-control" id="intrn_description" rows="6" placeholder="Write a brief about what kind of internship you are looking for *" > -->
								    </div>
								  </div>
                                  
                                   <div class="row">
	                                  <div class="col-md-12">
	                                    <div class="text-center"><button type="button" value="submit" id="submit" class="button button--wayra" onclick="saveInternship()"> Register</button></div>
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