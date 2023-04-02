<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="col-12 col-xl-auto mb-3">
    <a class="btn btn-sm btn-light text-primary" href="/bootcamp/bootcamp-list">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
        Back to Bootcamp List
    </a>
</div>

<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <c:choose>
				<c:when test="${empty bootcamp}">
				 	<h6 class="m-0 font-weight-bold text-primary">Add New Bootcamp</h6>											   
				</c:when>
				<c:otherwise>
				  	<h6 class="m-0 font-weight-bold text-primary">Update Bootcamp Details</h6>
				</c:otherwise>
			</c:choose>
        </div>
        <div class="card-body">
            <div class="row">
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>Program Manager</label>
				    	<input type="text" class="form-control form-control-sm" id="boot_program_manager" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<label>Client Company</label>
					<select class="form-control form-control-sm" id="boot_client_company" name="boot_client_company">
						<c:forEach items="${clientMasterList}" var="clientMasterList">
							<option <c:if test="${clientMasterList.name eq '${clientMasterList.name}'}" >Selected</c:if> value="${clientMasterList.name}"><c:out value="${clientMasterList.name}" /></option>
						</c:forEach>
					</select>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>Client Manager</label>
				    	<input type="text" class="form-control form-control-sm" id="boot_client_manager" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-12">
            		<div class="form-group">
            			<label>Bootcamp Name</label>
				    	<input type="text" class="form-control form-control-sm" id="boot_name" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-12">
            		<div class="form-group">
						<label for="exampleFormControlTextarea1">Requirement Summary</label>
						<textarea class="form-control" id="boot_summary" rows="4"></textarea>
					</div>
            	</div>
            	<div class="col-lg-3">
            		<div class="form-group">
            			<label>Experience Start Range</label>
				    	<select class="form-control form-control-sm" id="boot_exp_start_range" aria-label="Default select example"></select>
				  	</div>
            	</div>
            	<div class="col-lg-3">
            		<div class="form-group">
            			<label>Experience End Range</label>
				    	<select class="form-control form-control-sm" id="boot_exp_end_range" aria-label="Default select example"></select>
				  	</div>
            	</div>
				<div class="col-lg-3">
            		<div class="form-group">
            			<label>Start Date</label>
				    	<input type="text" class="form-control form-control-sm" id="boot_start_date" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-3">
            		<div class="form-group">
            			<label>End Date</label>
				    	<input type="text" class="form-control form-control-sm" id="boot_end_date" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>Technologies</label>
				    	<input type="text" class="form-control form-control-sm" id="boot_technologies" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>Role</label>
				    	<input type="text" class="form-control form-control-sm" id="boot_role" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4 mb-3">
	            	<div class="form-group">
            			<div class="row">
            				<div class="col-lg-6">
            					<label>Select Mentor</label>
            				</div>
            				<div class="col-lg-6 text-align-end">
            					<a href="javascript:void(0)" onclick="addNewMentor(this)"><i class="fa fa-plus-circle text-primary"> Add Mentor</i></a>
            				</div>
            			</div>
            			<select class="form-control form-control-sm" id="boot_mentor_id" name="boot_mentor_name">
						    <option selected>Select Mentor</option>
						    <c:forEach items="${mentorMasterList}" var="mentorMasterList"> 
						    	<option value="${mentorMasterList.id}">${mentorMasterList.first_name} ${mentorMasterList.last_name}</option>
						    </c:forEach>
						</select>
				  	</div>
            	</div>
            	<div class="col-lg-12 show-mentor">
            		<div class="card">
            			<div class="card-header">
            				<b>Add New Mentor</b>
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
            				</div>
            			</div>
            		</div>
            	</div>
				<div class="col-lg-12 text-center mt-3">
					<c:choose>
						<c:when test="${empty bootcamp}">
						 	<a href="javascript:void(0)" class="btn btn-primary cms-btn" onclick="addOrUpdateBootcamp()">Add Bootcamp</a>												   
						</c:when>
						<c:otherwise>
						  	<a href="javascript:void(0)" class="btn btn-primary cms-btn" onclick="addOrUpdateBootcamp()">Update Bootcamp Details</a>
						</c:otherwise>
					</c:choose>
            	</div>
            </div>
        </div>
    </div>
</div>

<script>

<c:choose>
	<c:when test="${empty bootcamp}">
		var id = "";																   
	</c:when>
	<c:otherwise>
		var id = ${bootcamp.id};
		var mentor_id = ${bootcamp.mentor_id};
	</c:otherwise>
</c:choose>

$( document ).ready(function() {
	
	$(".show-mentor").hide();
	
	var select = '';
    for (i=0;i<=15;i++){
        select += '<option val=' + i + '>' + i + '</option>';
    }
    $('#boot_exp_start_range').html(select);
    $('#boot_exp_end_range').html(select);
    
    var experience = '';
    for (i=0;i<=15;i++){
    	experience += '<option val=' + i + '>' + i + '</option>';
    }
    $('#men_experience').html(experience);
    
	loadData();
});

$(function() {
	$("#boot_start_date").datepicker({
	    changeMonth: true,
	    changeYear: true,
	    yearRange: '1950:2034',
	    dateFormat: 'yy-mm-dd'
	});
}); 

$(function() {
  $("#boot_end_date").datepicker({
	    changeMonth: true,
	    changeYear: true,
	    yearRange: '1950:2034',
	    dateFormat: 'yy-mm-dd'
	});
});

function addOrUpdateBootcamp()
{
	var name = $("#boot_name").val();
	var summary = $("#boot_summary").val();
	var technologies = $("#boot_technologies").val();
	var role = $("#boot_role").val();
	var program_manager = $("#boot_program_manager").val();
	var client_company = $("#boot_client_company").val();
	var client_manager = $("#boot_client_manager").val();
	var exp_start_range = $("#boot_exp_start_range").val();
	var exp_end_range = $("#boot_exp_end_range").val();
	var start_date = $("#boot_start_date").val();
	var end_date = $("#boot_end_date").val();
	
	if(name == ""){
    	swal("OOPS!", "Please Enter Bootcamp Name", "error").then(() => {
    		$('html').animate({ scrollTop: $("#boot_name").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(summary == ""){
    	swal("OOPS!", "Please Enter Bootcamp Summary", "error").then(() => {
    		$('html').animate({ scrollTop: $("#boot_summary").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(technologies == ""){
    	swal("OOPS!", "Please Enter Bootcamp Technologies", "error").then(() => {
    		$('html').animate({ scrollTop: $("#boot_technologies").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(role == ""){
    	swal("OOPS!", "Please Enter Bootcamp Role", "error").then(() => {
    		$('html').animate({ scrollTop: $("#boot_role").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(program_manager == ""){
    	swal("OOPS!", "Please Enter Bootcamp Program Manager", "error").then(() => {
    		$('html').animate({ scrollTop: $("#boot_program_manager").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(exp_start_range == ""){
    	swal("OOPS!", "Please Enter Bootcamp Experience Start Range", "error").then(() => {
    		$('html').animate({ scrollTop: $("#boot_exp_start_range").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(exp_end_range == ""){
    	swal("OOPS!", "Please Enter Bootcamp Experience End Range", "error").then(() => {
    		$('html').animate({ scrollTop: $("#boot_exp_end_range").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(start_date == ""){
    	swal("OOPS!", "Please Select Bootcamp Start Date", "error").then(() => {
    		$('html').animate({ scrollTop: $("#boot_start_date").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(end_date == ""){
    	swal("OOPS!", "Please Select Bootcamp End Date", "error").then(() => {
    		$('html').animate({ scrollTop: $("#boot_end_date").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	
	var first_name = $("#men_first_name").val();
	var last_name = $("#men_last_name").val();
	var mobile = $("#men_mobile").val();
	var email = $("#men_email").val();
	var skills = $("#men_skills").val();
	var experience = $("#men_experience").val();
	var grade = $("#men_grade").val();
	var feedbacks = $("#men_feedbacks").val();
	var linkedin_profile = $("#men_linkedin_url").val();
	
	if ($('.show-mentor').is(":visible")) {
		var mentor_id = "";
	}else{
		var mentor_id = $("#boot_mentor_id").val();
	}
	
	if ($('.show-mentor').is(":visible")) {
		
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
	}
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/addOrUpdateBootcamp", {id: "" + id + "",name: "" + name + "",summary: "" + summary + "",technologies: "" + technologies + "",
											role: "" + role + "",program_manager: "" + program_manager + "",client_company: "" + client_company + "",
											client_manager: "" + client_manager + "",exp_start_range: "" + exp_start_range + "",exp_end_range: "" + exp_end_range + "",
											start_date: "" + start_date + "",end_date: "" + end_date + "",first_name: "" + first_name + "",last_name: "" + last_name + "",
											mobile: "" + mobile + "",email: "" + email + "",skills: "" + skills + "",experience: "" + experience + "",
											grade: "" + grade + "",feedbacks: "" + feedbacks + "",linkedin_profile: "" + linkedin_profile + "",mentor_id: "" + mentor_id + "",
	}, function(data)
	{		
			$.LoadingOverlay("hide");
			
			var result = $.trim(data);
			var obj = jQuery.parseJSON(result);
			if(obj.status_code == 200)
			{
				swal("Success!", obj.msg , "success");
		      	
				$("#boot_name").val("");
				$("#boot_summary").val("");
				$("#boot_technologies").val("");
				$("#boot_role").val("");
				$("#boot_program_manager").val("");
				$("#boot_client_company").val("");
				$("#boot_client_manager").val("");
				$("#boot_exp_start_range").val("");
				$("#boot_exp_end_range").val("");
				$("#boot_start_date").val("");
				$("#boot_end_date").val("");
				$("#boot_mentor_id").val("");
				
				$("#men_first_name").val("");
				$("#men_last_name").val("");
				$("#men_mobile").val("");
				$("#men_email").val("");
				$("#men_skills").val("");
				$("#men_experience").val("");
				$("#men_grade").val("");
				$("#men_feedbacks").val("");
				$("#men_linkedin_url").val("");
				
				$(".show-mentor").hide();
				
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
	var bootcamp = '${bootcamp}';
	
	var mentor_id = '${bootcamp.mentor_id}';
	var name = '${bootcamp.name}';
	var summary = '${bootcamp.requirements_summary}';
	var technologies = '${bootcamp.technologies}';
	var role = '${bootcamp.role}';
	var program_manager = '${bootcamp.program_manager}';
	var client_company = '${bootcamp.client_company}';
	var client_manager = '${bootcamp.client_manager}';
	var exp_start_range = '${bootcamp.exp_start_range}';
	var exp_end_range = '${bootcamp.exp_end_range}';
	var start_date = '${bootcamp.start_date}';
	var end_date = '${bootcamp.end_date}';
	
	$("#boot_name").val(name);
	$("#boot_mentor_id").val(mentor_id);
	$("#boot_summary").val(summary);
	$("#boot_technologies").val(technologies);
	$("#boot_role").val(role);
	$("#boot_program_manager").val(program_manager);
	$("#boot_client_company").val(client_company);
	$("#boot_client_manager").val(client_manager);
	$("#boot_exp_start_range").val(exp_start_range);
	$("#boot_exp_end_range").val(exp_end_range);
	
	$(function() {
	$("#boot_start_date").datepicker({
	        dateFormat: "yy-mm-dd"
	    }).datepicker("setDate", start_date);
	})
	
	$(function() {
	$("#boot_end_date").datepicker({
	        dateFormat: "yy-mm-dd"
	    }).datepicker("setDate", end_date);
	})
}

function addNewMentor(element)
{
	if($('.show-mentor').is(':visible'))
	{
		$(element).html('<i class="fa fa-plus-circle text-primary"> Add Mentor</i>');
		$(".show-mentor").hide();
	}else
	{
		$(element).html('<i class="fa fa-minus-circle text-primary"> Close Mentor</i>');
		$(".show-mentor").show();
	}
}

function isEmail(email) {
	  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  return regex.test(email);
}
</script>