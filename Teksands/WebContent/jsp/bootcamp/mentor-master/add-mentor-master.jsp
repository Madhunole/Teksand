<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div class="col-12 col-xl-auto mb-3">
    <a class="btn btn-sm btn-light text-primary" href="/bootcamp/mentor-master">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
        Back to Mentor List
    </a>
</div>

<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <c:choose>
				<c:when test="${empty mentorMaster}">
				 	<h6 class="m-0 font-weight-bold text-primary">Add New Mentor</h6>											   
				</c:when>
				<c:otherwise>
				  	<h6 class="m-0 font-weight-bold text-primary">Update Mentor Details</h6>
				</c:otherwise>
			</c:choose>
        </div>
        <div class="card-body">
            <div class="row">
            	<div class="col-lg-6">
            		<div class="form-group">
            			<label>First Name</label>
				    	<input type="text" class="form-control form-control-sm" id="men_first_name" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-6">
            		<div class="form-group">
            			<label>Last Name</label>
				    	<input type="text" class="form-control form-control-sm" id="men_last_name" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-6">
            		<div class="form-group">
            			<label>Mobile</label>
				    	<input type="text" class="form-control form-control-sm" id="men_mobile" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-6">
            		<div class="form-group">
            			<label>Email</label>
				    	<input type="text" class="form-control form-control-sm" id="men_email" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>Skills</label>
				    	<input type="text" class="form-control form-control-sm" id="men_skills" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>Experience</label>
				    	<select class="form-control form-control-sm" id="men_experience" aria-label="Default select example"></select>
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>Grade</label>
				    	<input type="text" class="form-control form-control-sm" id="men_grade" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-12">
            		<div class="form-group">
						<label for="exampleFormControlTextarea1">Feedbacks</label>
						<textarea class="form-control" id="men_feedbacks" rows="4"></textarea>
					</div>
            	</div>
            	<div class="col-lg-12">
            		<div class="form-group">
            			<label>LinkedIn Profile</label>
				    	<input type="text" class="form-control form-control-sm" id="men_linkedin_url" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-12 text-center">
            		<c:choose>
						<c:when test="${empty mentorMaster}">
						 	<a href="javascript:void(0)" class="btn btn-primary cms-btn" onclick="addOrUpdateMentor()">Add Mentor</a>												   
						</c:when>
						<c:otherwise>
						  	<a href="javascript:void(0)" class="btn btn-primary cms-btn" onclick="addOrUpdateMentor()">Update Mentor Details</a>
						</c:otherwise>
					</c:choose>
            	</div>
            </div>
        </div>
    </div>
</div>

<script>
<c:choose>
	<c:when test="${empty mentorMaster}">
		var id = "";																   
	</c:when>
	<c:otherwise>
		var id = ${mentorMaster.id};
	</c:otherwise>
</c:choose>

$( document ).ready(function() {
	
	var select = '';
    for (i=0;i<=15;i++){
        select += '<option val=' + i + '>' + i + '</option>';
    }
    $('#men_experience').html(select);
    
	loadData();
});

function addOrUpdateMentor()
{
	var first_name = $("#men_first_name").val();
	var last_name = $("#men_last_name").val();
	var mobile = $("#men_mobile").val();
	var email = $("#men_email").val();
	var skills = $("#men_skills").val();
	var experience = $("#men_experience").val();
	var grade = $("#men_grade").val();
	var feedbacks = $("#men_feedbacks").val();
	var linkedin_profile = $("#men_linkedin_url").val();
	
	if(first_name == ""){
    	swal("OOPS!", "Please Enter Mentor First Name", "error").then(() => {
    		$('html').animate({ scrollTop: $("#men_first_name").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(last_name == ""){
    	swal("OOPS!", "Please Enter Mentor Last Name", "error").then(() => {
    		$('html').animate({ scrollTop: $("#men_last_name").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(mobile == ""){
    	swal("OOPS!", "Please Enter Mentor Mobile Number", "error").then(() => {
    		$('html').animate({ scrollTop: $("#men_mobile").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(email == ""){
    	swal("OOPS!", "Please Enter Mentor Email Id", "error").then(() => {
    		$('html').animate({ scrollTop: $("#men_email").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(!isEmail(email)) {
    	swal("OOPS!", "Please Enter Valid Email", "error").then(() => {
        		$('html').animate({ scrollTop: $("#men_email").offset().top-100 }, "slow");
    		})
   	    return false;
    }
	
	if(skills == ""){
    	swal("OOPS!", "Please Enter Mentor Skill", "error").then(() => {
    		$('html').animate({ scrollTop: $("#men_skills").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(experience == ""){
    	swal("OOPS!", "Please Enter Mentor Experience", "error").then(() => {
    		$('html').animate({ scrollTop: $("#men_experience").offset().top-100 }, "slow");
		})
    	return false;
    }

	if(grade == ""){
    	swal("OOPS!", "Please Enter Mentor Grade", "error").then(() => {
    		$('html').animate({ scrollTop: $("#men_grade").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(feedbacks == ""){
    	swal("OOPS!", "Please Enter Mentor Feedbacks", "error").then(() => {
    		$('html').animate({ scrollTop: $("#men_feedbacks").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(linkedin_profile == ""){
    	swal("OOPS!", "Please Enter Mentor LinkedIn Profile", "error").then(() => {
    		$('html').animate({ scrollTop: $("#men_linkedin_url").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/addOrUpdateMentorMaster", {id: "" + id + "",first_name: "" + first_name + "",last_name: "" + last_name + "",mobile: "" + mobile + "",
		email: "" + email + "",skills: "" + skills + "",experience: "" + experience + "",grade: "" + grade + "",feedbacks: "" + feedbacks + "",linkedin_profile: "" + linkedin_profile + "",
	}, function(data)
	{		
			$.LoadingOverlay("hide");
			
			var result = $.trim(data);
			var obj = jQuery.parseJSON(result);
			if(obj.status_code == 200)
			{

				swal("Success!", obj.msg , "success");
				
				$("#men_first_name").val("");
				$("#men_last_name").val("");
				$("#men_mobile").val("");
				$("#men_email").val("");
				$("#men_skills").val("");
				$("#men_experience").val("");
				$("#men_grade").val("");
				$("#men_feedbacks").val("");
				$("#men_linkedin_url").val("");
				
	      	return false;
			} else {
				swal("OOPS!", "Please Enter Correct Details", "error");
			 	return false;
			}
		
	},'text');
	return false;
}

function loadData()
{
	var mentorMaster = '${mentorMaster}';
	
	var first_name = '${mentorMaster.first_name}';
	var last_name = '${mentorMaster.last_name}';
	var mobile = '${mentorMaster.mobile}';
	var email = '${mentorMaster.email}';
	var skills = '${mentorMaster.skills}';
	var experience = '${mentorMaster.experience}';
	var grade = '${mentorMaster.grade}';
	var feedbacks = '${mentorMaster.feedbacks}';
	var linkedin_profile = '${mentorMaster.linkedin_profile}';
	
	$("#men_first_name").val(first_name);
	$("#men_last_name").val(last_name);
	$("#men_mobile").val(mobile);
	$("#men_email").val(email);
	$("#men_skills").val(skills);
	$("#men_experience").val(experience);
	$("#men_grade").val(grade);
	$("#men_feedbacks").val(feedbacks);
	$("#men_linkedin_url").val(linkedin_profile);

}

function isEmail(email) {
	  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  return regex.test(email);
}
</script>
