<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.valid-res {
    width: 100% !important;
	margin-top: 10px !important;
    font-size: 12px !important;
    color: #e74a3b !important;
}
.invalid-res {    
    width: 100% !important;
  	margin-top: 10px !important;
    font-size: 12px !important;
    color: #e74a3b !important;
}
.error
{
    width: 100% !important;
    margin-top: 10px !important;
    font-size: 12px !important;
    color: #e74a3b !important;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
<script>
<c:choose>
	<c:when test="${empty candidate}">
		var id = "";																   
	</c:when>
	<c:otherwise>
		var id = ${candidate.id};
	</c:otherwise>
</c:choose>
$( document ).ready(function() {
$( "#imageform" ).validate( {		
		rules: {
			can_name: {
				required: true,
				minlength: 2
			},
			can_mobile: {
				required: true,				
		        minlength:10,
		        maxlength:10
			},
			can_email: {
				required: true,
				email: true
			},			
			can_key_skills: {
				required: true,
			}		
			
		},
		messages: {
			can_name: "Please Enter Name",
			can_mobile: "Please Enter Mobile",			
			can_email: "Please Enter Email",			
			can_key_skills: "Please Enter Key Skills Required",					
			
		},
		errorElement: "div",
		
		ignore: ':hidden:not(.summernote),.note-editable.card-block',
		
		errorPlacement: function ( error, element ) {
			
			error.addClass( "help-block" );
			
			element.parents( ".form-validate" ).addClass( "has-feedback" );			
		
			
			if(element.prop( "type" ) === "checkbox"){
				var ele = element.parent("div");
				error.insertAfter( ele.parent("div") );
			}else if(element.prop( "type" ) === "radio"){
				error.insertAfter( element.parent( ".form-radio" ) );
			}else if(element.hasClass("summernote")){
				error.insertAfter(element.siblings(".hdn_summernote"));
			}else{
				error.insertAfter( element );
			}
		},
		success: function ( label, element ) {
			if ( !$( element ).next( "span" )[ 0 ] ) {	
				
			}
		},
		highlight: function ( element, errorClass, validClass ) {
			$( element ).parents( ".form-validate" ).addClass( "has-error" ).removeClass( "has-success" );			
		},
		unhighlight: function ( element, errorClass, validClass ) {
			$( element ).parents( ".form-validate" ).addClass( "has-success" ).removeClass( "has-error" );
			$( element ).next( "span" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
		}
	});	
	
	if(id != null){
		$('.active-status').show();
		$('.rejection').hide();
		
	}else{
		$('.active-status').hide();
		$('.rejection').hide();
	}
	
	var select = '';
    for (i=0;i<=15;i++){
        select += '<option val=' + i + '>' + i + '</option>';
    }
    $('#can_experience').html(select);
    
    for (i = new Date().getFullYear(); i > 2017; i--)
    {
        $('#can_ug_graduation_year').append($('<option />').val(i).html(i));
    }
    
    for (i = new Date().getFullYear(); i > 2017; i--)
    {
        $('#can_pg_graduation_year').append($('<option />').val(i).html(i));
    }
    
    for (i = new Date().getFullYear(); i > 2017; i--)
    {
        $('#can_doctorate_graduation_year').append($('<option />').val(i).html(i));
    }
    
    $("#file").change(function() 
	{
	   var can_mobile = $("#can_mobile").val();
	   if(can_mobile == "")
	   {
		   $("#file").val(""); 	 	
	 	   $.toast({
			    heading: '<b>Error</b>',
			    text: 'Please fill in the Mobile Number before you upload the CV',
			    icon: 'error',
			    position: 'top-right',
			    bgColor: '#f8d7da',
			    textColor: '#721c24',
			})	
	 	   return false;
	   }
	   $("#txt_candidate_mobile").val(can_mobile);
	   var filename = $("#file").val(); 
	   if(filename == "")
	   {
		   $("#file").val(""); 	 	
	 	   $.toast({
			    heading: '<b>Error</b>',
			    text: 'Please select the CV document',
			    icon: 'error',
			    position: 'top-right',
			    bgColor: '#f8d7da',
			    textColor: '#721c24',
			})	 	
	 	   return false;
	   }
	   var input = this;
	 	
	 	var formData = new FormData($("#imageform")[0]);	 	
		var flag = false;
		
		$.LoadingOverlay("show");
		
		$.ajaxSetup({async:false});
		$.ajax({
		    url: '/bootcamp/uploadCandidateCVDocument',
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
				if(obj.status == "Success"){
					$.toast({
					    heading: 'Success',
					    text: 'We have succesfully Uploaded CV',
					    icon: 'success',
					    position: 'top-right',
					    bgColor: '#d4edda',
					    textColor: '#155724',					   
					}) 					
					
					flag = true;	
					var img_path = $.trim(obj.msg);
					var url = '${resume_path}' + img_path;
					$("#error_msg").html(img_path);	
					$("#para_resume").hide();
			        $("#para_resume").html(url);			
			        $("#para_resume").attr("href",url);			       
					return false;
				}
				else
		    	{
					
					var errorMsg = $.trim(obj.msg);
					$.toast({
					    heading: '<b>Error</b>',
					    text: errorMsg,
					    icon: 'error',
					    position: 'top-right',
					    bgColor: '#f8d7da',
					    textColor: '#721c24',
					})	 	
					 $("#file").val(""); 	
					 $("#para_resume").html("");
					 $("#para_resume").attr("href","");	
					 $("#error_msg").html(errorMsg);					 
		    	}
				return false;					
		    }
		    
		  
		  });
		
		if(flag)
		{
			return false;
		}
	});
	loadData();
});

function mobileChange()
{
	var can_mobile = $("#can_mobile").val();
	if(can_mobile == "")
	{
		$("#file").val(""); 
		swal("OOPS!", "Please fill the form after you uplaod the resume", "info");
		return false;
	}
	$("#txt_candidate_mobile").val(can_mobile);
}

$(function() {
	$("#datepicker_1").datepicker({
	    changeMonth: true,
	    changeYear: true,
	    yearRange: '1950:2034',
	    dateFormat: 'yy-mm-dd'
	});
}); 

$(function() {
  //$("#datepicker_2").datepicker({ dateFormat: 'yy-mm-dd' });
	$("#datepicker_2").datepicker({
	    changeMonth: true,
	    changeYear: true,
	    yearRange: '1950:2034',
	    dateFormat: 'yy-mm-dd'
	});
});

function getCityStatebyPincode()
{
	var pincode = $("#can_pincode").val();
	
	if(pincode == "" || pincode.length != 6)
    {
		$.toast({
		    heading: '<b>Error</b>',
		    text: 'Please enter the valid pincode',
		    icon: 'error',
		    position: 'top-right',
		    bgColor: '#f8d7da',
		    textColor: '#721c24',
		})			
 	    return false;
    }
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:true});
	$.post("/bootcamp/getCityStateForPincode", {pincode : "" + pincode + ""}, function(data)       	   
	{
		$.LoadingOverlay("hide");
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		
		if(obj == null || obj == "null")
		{
			$.toast({
			    heading: '<b>Error</b>',
			    text: 'This pincode not available. Please enter the details',
			    icon: 'error',
			    position: 'top-right',
			    bgColor: '#f8d7da',
			    textColor: '#721c24',
			})				
	 	    return false;
		}else
		{
			var city = obj.city;
			var state = obj.state;
			var state_code = obj.state_code;
			
			$("#can_city").val(city);
			$("#can_state").val(state);
			$("#can_country").val("India");
		}
		
	}, "text");
}

function showRejectionReasion()
{
	var can_active = $('#can_active').find(":selected").text();
	if (can_active == "Activate")
	{
		$('.rejection').hide();

	}else
	{
		$('.rejection').show();
	}
}
$.validator.setDefaults( {
	submitHandler: function () {
		addOrUpdateCandidate();
	}
} );

function addOrUpdateCandidate()
{
	var name = $("#can_name").val();
	var mobile = $("#can_mobile").val();
	var email = $("#can_email").val();
	var gender = $('#can_gender').find(":selected").text();
	var birth_of_date = $("#datepicker_1").val();
	var marital_status = $('#marital_status').find(":selected").text();
	var curr_location = $("#can_current_location").val();
	var pre_location = $("#can_preferred_location").val();
	var permanent_address = $("#can_permanent_address").val();
	var permanent_picode = $("#can_pincode").val();
	var permanent_city = $("#can_city").val();
	var permanent_state = $("#can_state").val();
	var permanent_country = $("#can_country").val();
	
	var resume_heading = $("#can_resume_heading").val();
	var summary = $("#can_summary").val();
	var current_company_name = $("#can_current_company_name").val();
	var current_designation = $("#can_current_designation").val();
	var functional_area = $("#can_funtional_area").val();
	var industry = $("#can_industry").val();
	var total_experience = $("#can_experience").val();
	var role = $("#can_role").val();
	var key_skills = $("#can_key_skills").val();
	var annual_salary = $("#can_annual_salary").val();
	var notice_period = $("#can_notice_period").val();
	var work_permit_status = $("#can_work_permit_status").val();
	
	var ug_college_name = $("#can_ug_college_name").val();
	var ug_degree = $("#can_ug_degree").val();
	var ug_specialization = $("#can_ug_specialization").val();
	var ug_graduation_year = $("#can_ug_graduation_year").val();
	var pg_college_name = $("#can_pg_college_name").val();
	var pg_degree = $("#can_pg_degree").val();
	var pg_specialization = $("#can_pg_specialization").val();
	var pg_graduation_year = $("#can_pg_graduation_year").val();
	var doctorate_university = $("#can_doctorate_university").val();
	var doctorate_degree = $("#can_doctorate_degree").val();
	var doctorate_specialization = $("#can_doctorate_specialization").val();
	var doctorate_graduation_year = $("#can_doctorate_graduation_year").val();
	
	var ts_screening_1 = $("#can_ts_screening_1").val();
	var ts_screening_2 = $("#can_ts_screening_2").val();
	var ts_screening_3 = $("#can_ts_screening_3").val();
	var placed_company = $("#can_placed_company").val();
	var ts_screening_grade = $("#can_ts_screening_grade").val();
	var placed = $('#can_placed').find(":selected").text();
	var placed_date = $("#datepicker_2").val();
	
	var resume = $("#para_resume").html();	
	
	if($('.rejection').is(':visible')){
		var active = $('#can_active').find(":selected").text();
		var rejection_reason = $('#can_rejection_reason').find(":selected").text();
	}else{
		var active = $("#can_active").val();
		var rejection_reason = "";
	}
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/brandaddOrUpdateCandidate", {id: "" + id + "",name: "" + name + "",mobile: "" + mobile + "",email: "" + email + "",gender: "" + gender + "",
											birth_of_date: "" + birth_of_date + "",marital_status: "" + marital_status + "",curr_location: "" + curr_location + "",pre_location: "" + pre_location + "",
											permanent_address: "" + permanent_address + "",permanent_picode: "" + permanent_picode + "",permanent_city: "" + permanent_city + "",permanent_state: "" + permanent_state + "",
											permanent_country: "" + permanent_country + "",resume_heading: "" + resume_heading + "",summary: "" + summary + "",current_company_name: "" + current_company_name + "",
											current_designation: "" + current_designation + "",functional_area: "" + functional_area + "",industry: "" + industry + "",total_experience: "" + total_experience + "",
											role: "" + role + "",key_skills: "" + key_skills + "",annual_salary: "" + annual_salary + "",notice_period: "" + notice_period + "",
											work_permit_status: "" + work_permit_status + "",ug_college_name: "" + ug_college_name + "",ug_degree: "" + ug_degree + "",ug_specialization: "" + ug_specialization + "",
											ug_graduation_year: "" + ug_graduation_year + "",pg_college_name: "" + pg_college_name + "",pg_degree: "" + pg_degree + "",pg_specialization: "" + pg_specialization + "",
											pg_graduation_year: "" + pg_graduation_year + "",doctorate_university: "" + doctorate_university + "",doctorate_degree: "" + doctorate_degree + "",doctorate_specialization: "" + doctorate_specialization + "",
											doctorate_graduation_year: "" + doctorate_graduation_year + "",ts_screening_1: "" + ts_screening_1 + "",ts_screening_2: "" + ts_screening_2 + "",ts_screening_3: "" + ts_screening_3 + "",
											placed_company: "" + placed_company + "",ts_screening_grade: "" + ts_screening_grade + "",placed: "" + placed + "",placed_date: "" + placed_date + "",
											active: "" + active + "",rejection_reason: "" + rejection_reason + "",resume: "" + resume + "",
	}, function(data)
	{		
			$.LoadingOverlay("hide");
			
			var result = $.trim(data);
			var obj = jQuery.parseJSON(result);
			if(obj.status_code == 200)
			{
				if(id == "")
	   			{
		   			$.toast({
					    heading: 'Success',
					    text: 'The New Candidate Added Successfully',
					    icon: 'success',
					    position: 'top-right',
					    bgColor: '#d4edda',
					    textColor: '#155724',
					    afterShown: function () {
					    	setTimeout(function() {
					    		window.location.href = "/bootcamp/brand-candidate-list"
					    	}, 5000);
					    },
					}) 
	   			}
	   			else
	   			{
	   				$.toast({
					    heading: 'Success',
					    text: 'The Candidate Details are Updated Successfully',
					    icon: 'success',
					    position: 'top-right',
					    bgColor: '#d4edda',
					    textColor: '#155724',
					    afterShown: function () {
					    	setTimeout(function() {
					    		window.location.href = "/bootcamp/brand-candidate-list"
					    	}, 5000);
					    },
					}) 
	   				
	   			}
				
				$("#can_name").val("");
				$("#can_mobile").val("");
				$("#can_email").val("");
				$('#can_gender').val("");
				$("#datepicker_1").val("");
				$('#marital_status').val("");
				$("#can_current_location").val("");
				$("#can_preferred_location").val("");
				$("#can_permanent_address").val("");
				$("#can_pincode").val("");
				$("#can_city").val("");
				$("#can_state").val("");
				$("#can_country").val("");
				
				$("#can_resume_heading").val("");
				$("#can_summary").val("");
				$("#can_current_company_name").val("");
				$("#can_current_designation").val("");
				$("#can_funtional_area").val("");
				$("#can_industry").val("");
				$("#can_experience").val("");
				$("#can_role").val("");
				$("#can_key_skills").val("");
				$("#can_annual_salary").val("");
				$("#can_notice_period").val("");
				$("#can_work_permit_status").val("");
				
				$("#can_ug_college_name").val("");
				$("#can_ug_degree").val("");
				$("#can_ug_specialization").val("");
				$("#can_ug_graduation_year").val("");
				$("#can_pg_college_name").val("");
				$("#can_pg_degree").val("");
				$("#can_pg_specialization").val("");
				$("#can_pg_graduation_year").val("");
				$("#can_doctorate_university").val("");
				$("#can_doctorate_degree").val("");
				$("#can_doctorate_specialization").val("");
				$("#can_doctorate_graduation_year").val("");
				
				$("#can_ts_screening_1").val("");
				$("#can_ts_screening_2").val("");
				$("#can_ts_screening_3").val("");
				$("#can_placed_company").val("");
				$("#can_ts_screening_grade").val("");
				$('#can_placed').find(":selected").text("");
				$("#datepicker_2").val("");
				
	      	return false;
			} else {
				$.toast({
				    heading: '<b>Error</b>',
				    text: 'Failure, Please Try Again',
				    icon: 'error',
				    position: 'top-right',
				    bgColor: '#f8d7da',
				    textColor: '#721c24',
				})
	   		 	return false;
			}
		
	},'text');
	return false;
}

function isEmail(email) {
	  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  return regex.test(email);
}

function loadData()
{
	var candidate = '${candidate}';
	
	var name = '${candidate.name}';
	var mobile = '${candidate.mobile}';
	var email = '${candidate.email}';
	var gender = '${candidate.gender}';
	var birth_of_date = '${candidate.date_of_birth}';
	var marital_status = '${candidate.marital_status}';
	var curr_location = '${candidate.current_location}';
	var pre_location = '${candidate.preferred_location}';
	var permanent_address = '${candidate.permanent_address}';
	var permanent_picode = '${candidate.permanent_pincode}';
	var permanent_city = '${candidate.permanent_city}';
	var permanent_state = '${candidate.permanent_state}';
	var permanent_country = '${candidate.permanent_country}';
	
	var resume_heading = '${candidate.resume_headling}';
	var summary = '${candidate.summary}';
	var current_company_name = '${candidate.curr_company_name}';
	var current_designation = '${candidate.curr_company_desigination}';
	var functional_area = '${candidate.functional_area}';
	var industry = '${candidate.industry}';
	var total_experience = '${candidate.total_experience}';
	var role = '${candidate.role}';
	var key_skills = '${candidate.key_skills}';
	var annual_salary = '${candidate.annual_salary}';
	var notice_period = '${candidate.notice_period}';
	var work_permit_status = '${candidate.work_permit_status}';
	
	var ug_college_name = '${candidate.ug_college_name}';
	var ug_degree = '${candidate.ug_degree}';
	var ug_specialization = '${candidate.ug_specialization}';
	var ug_graduation_year = '${candidate.ug_graduation_year}';
	var pg_college_name = '${candidate.pg_college_name}';
	var pg_degree = '${candidate.pg_degree}';
	var pg_specialization = '${candidate.pg_specialization}';
	var pg_graduation_year = '${candidate.pg_graduation_year}';
	var doctorate_university = '${candidate.doctorate_university}';
	var doctorate_degree = '${candidate.doctorate_degree}';
	var doctorate_specialization = '${candidate.doctorate_specialization}';
	var doctorate_graduation_year = '${candidate.doctorate_graduation_year}';
	
	var ts_screening_1 = '${candidate.ts_screening_comment_1}';
	var ts_screening_2 = '${candidate.ts_screening_comment_2}';
	var ts_screening_3 = '${candidate.ts_screening_comment_3}';
	var ts_screening_grade = '${candidate.ts_screening_grade}';
	var placed = '${candidate.placed}';
	var placed_date = '${candidate.placed_date}';
	
	$(function() {
	$("#datepicker_1").datepicker({
	        dateFormat: "yy-mm-dd"
	    }).datepicker("setDate", birth_of_date);
	})
	
	$(function() {
	$("#datepicker_2").datepicker({
	        dateFormat: "yy-mm-dd"
	    }).datepicker("setDate", placed_date);
	})
	
	$("#can_name").val(name);
	$("#can_mobile").val(mobile);
	$("#can_email").val(email);
	$('#can_gender').val(gender);
	//$("#datepicker_1").val(birth_of_date);
	$('#marital_status').val(marital_status);
	$("#can_current_location").val(curr_location);
	$("#can_preferred_location").val(pre_location);
	$("#can_permanent_address").val(permanent_address);
	$("#can_pincode").val(permanent_picode);
	$("#can_city").val(permanent_city);
	$("#can_state").val(permanent_state);
	$("#can_country").val(permanent_country);
	
	$("#can_resume_heading").val(resume_heading);
	$("#can_summary").val(summary);
	$("#can_current_company_name").val(current_company_name);
	$("#can_current_designation").val(current_designation);
	$("#can_funtional_area").val(functional_area);
	$("#can_industry").val(industry);
	$("#can_experience").val(total_experience);
	$("#can_role").val(role);
	$("#can_key_skills").val(key_skills);
	$("#can_annual_salary").val(annual_salary);
	$("#can_notice_period").val(notice_period);
	$("#can_work_permit_status").val(work_permit_status);
	
	$("#can_ug_college_name").val(ug_college_name);
	$("#can_ug_degree").val(ug_degree);
	$("#can_ug_specialization").val(ug_specialization);
	$("#can_ug_graduation_year").val(ug_graduation_year);
	$("#can_pg_college_name").val(pg_college_name);
	$("#can_pg_degree").val(pg_degree);
	$("#can_pg_specialization").val(pg_specialization);
	$("#can_pg_graduation_year").val(pg_graduation_year);
	$("#can_doctorate_university").val(doctorate_university);
	$("#can_doctorate_degree").val(doctorate_degree);
	$("#can_doctorate_specialization").val(doctorate_specialization);
	$("#can_doctorate_graduation_year").val(doctorate_graduation_year);
	
	$("#can_ts_screening_1").val(ts_screening_1);
	$("#can_ts_screening_2").val(ts_screening_2);
	$("#can_ts_screening_3").val(ts_screening_3);
	$("#can_ts_screening_grade").val(ts_screening_grade);
	if(placed == true){
		$('#can_placed').val(1);
	}else{
		$('#can_placed').val(0);
	}
	//$("#datepicker_2").val(placed_date);
}
</script>
<div class="col-12 col-xl-auto mb-3">
<c:choose>
		<c:when test="${source eq 'view_candidate'}">
			 <a class="btn btn-sm btn-light text-primary" href="/bootcamp/brand-view-candidate?id=${candidate.id}">
		        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
		        Back to Candidate View
		    </a>		
		</c:when>
		<c:otherwise>
			 <a class="btn btn-sm btn-light text-primary" href="/bootcamp/brand-candidate-list">
		        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
		        Back to Candidate List
		    </a>
		</c:otherwise>
</c:choose>
</div>

<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <c:choose>
				<c:when test="${empty candidate}">
				 	<h6 class="m-0 font-weight-bold text-primary">Add New Candidate</h6>											   
				</c:when>
				<c:otherwise>
				  	<h6 class="m-0 font-weight-bold text-primary">Update Candidate Details</h6>
				</c:otherwise>
			</c:choose>
        </div>
        <div class="card-body">
        <div class="row">
            	
          <div class="col-lg-12">
          <div class="edit-profile loginform contact_form">
          <form id="imageform" role="form" method="post" enctype="multipart/form-data">
            <div class="row">
            	<div class="col-lg-12"><h6 class="font-weight-bold text-secondary mb-3">Personal Information:</h6></div>
            	<div class="col-lg-4">
            		<div class="form-group form-validate">
            			<label class="required">Name</label>
				    	<input type="text" class="form-control form-control-sm" id="can_name" name="can_name" placeholder="" required>
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group form-validate">
            			<label class="required">Mobile Number</label>
				    	<input type="text" pattern="\d{3}[\-]\d{3}[\-]\d{4}" maxlength="10" class="form-control form-control-sm" id="can_mobile" name="can_mobile" placeholder="" onchange="mobileChange()" required>
				  	</div>
            	</div> 
            	<div class="col-lg-4">
            		<div class="form-group form-validate">
            			<label class="required">Email</label>
				    	<input type="text" class="form-control form-control-sm" id="can_email" name="can_email" placeholder="" value="${candidate.email}" required>
				  	</div>
            	</div>   
            	<div class="col-lg-4">
 				  	<div class="form-group">
	            		<label>Gender</label>
	            		<select id="can_gender" class="form-control form-control-sm" aria-label="Default select example" >
							<option <c:if test="${candidate.gender eq 'Male'}" >Selected</c:if> value="Male">Male</option>
							<option <c:if test="${candidate.gender eq 'Female'}" >Selected</c:if> value="Female">Female</option>
							<option <c:if test="${candidate.gender eq 'Other'}" >Selected</c:if> value="Other">Other</option>
						</select>
					</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>Date of Birth</label>
				    	<input type="text" class="form-control form-control-sm" id="datepicker_1" placeholder="">
				  	</div>
            	</div> 
            	<div class="col-lg-4">
            		<div class="form-group">
	            		<label>Marital Status</label>
	            		<select id="marital_status" class="form-control form-control-sm" aria-label="Default select example">
							<option value="Single">Single</option>
							<option value="Married">Married</option>
						</select>
					</div>
            	</div>
            	<div class="col-lg-6">
            		<div class="form-group">
            			<label>Current Location</label>
				    	<input type="text" class="form-control form-control-sm" id="can_current_location" placeholder="">
				  	</div>
            	</div> 
            	<div class="col-lg-6">
            		<div class="form-group">
            			<label>Preferred Location</label>
				    	<input type="text" class="form-control form-control-sm" id="can_preferred_location" placeholder="">
				  	</div>
            	</div> 
            	<div class="col-lg-12">
            		<div class="form-group">
            			<label>Permanent Address</label>
				    	<input type="text" class="form-control form-control-sm" id="can_permanent_address" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-3">
            		<div class="form-group">
            			<label>Pincode</label>
				    	<input type="text" class="form-control form-control-sm" id="can_pincode" placeholder="" onchange="getCityStatebyPincode()">
				  	</div>
            	</div>
            	<div class="col-lg-3">
            		<div class="form-group">
            			<label>City</label>
				    	<input type="text" class="form-control form-control-sm" id="can_city" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-3">
            		<div class="form-group">
            			<label>State</label>
				    	<input type="text" class="form-control form-control-sm" id="can_state" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-3">
            		<div class="form-group">
            			<label>Country</label>
				    	<input type="text" class="form-control form-control-sm" id="can_country" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-12"><h6 class="font-weight-bold text-secondary mb-3">Job Information:</h6></div>
            	<div class="col-lg-6">
            		<div class="form-group">
            			<label>Resume Heading</label>
				    	<input type="text" class="form-control form-control-sm" id="can_resume_heading" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-6">
            		<label for="files">Upload Your Current CV</label>
		            
						<input type="hidden" name="txt_candidate_mobile" id="txt_candidate_mobile" value="" />
						<input type="file" id="file" name="file" class="btn btn-default btn-block mt-n2" />
						<!-- <p id="para_resume"></p> -->
						<c:choose>
							<c:when test="${not empty candidate.resume}">
								<a id="para_resume" href="${resume_path}${candidate.resume}" class="text-primary" target="_blank">${candidate.resume}</a>		
								<a id="error_msg" href="" class="text-primary" target="_blank"></a>																	   
							</c:when>
							<c:otherwise>
								<a id="para_resume" href="" class="text-primary" target="_blank"></a>
								<a id="error_msg" href="" class="text-primary" target="_blank"></a>								
							</c:otherwise>
						</c:choose>					
            	</div>  
            	
            	<div class="col-lg-12">
            		<div class="form-group">
						<label for="exampleFormControlTextarea1">Summary</label>
						<textarea class="form-control" id="can_summary" rows="4"></textarea>
					</div>
            	</div>    
                 	
            	<div class="col-lg-12">
            		<div class="form-group">
            			<label>Current Company Name</label>
				    	<input type="text" class="form-control form-control-sm" id="can_current_company_name" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>Designation</label>
				    	<input type="text" class="form-control form-control-sm" id="can_current_designation" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>Functional Area</label>
				    	<input type="text" class="form-control form-control-sm" id="can_funtional_area" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>Industry</label>
				    	<input type="text" class="form-control form-control-sm" id="can_industry" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>Total Experience</label>
				    	<select class="form-control form-control-sm" id="can_experience" aria-label="Default select example"></select>
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>Role</label>
				    	<input type="text" class="form-control form-control-sm" id="can_role" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group form-validate">
            			<label class="required">Key Skills</label>
				    	<input type="text" class="form-control form-control-sm" id="can_key_skills" name="can_key_skills" placeholder="" required>
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>Annual Salary</label>
				    	<input type="text" class="form-control form-control-sm" id="can_annual_salary" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>Notice Period</label>
				    	<input type="text" class="form-control form-control-sm" id="can_notice_period" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>Work Permit Status</label>
				    	<input type="text" class="form-control form-control-sm" id="can_work_permit_status" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-12"><h6 class="font-weight-bold text-secondary mb-3">Educational Information:</h6></div>
            	<div class="col-lg-12">
            		<div class="form-group">
            			<label>UG College Name</label>
				    	<input type="text" class="form-control form-control-sm" id="can_ug_college_name" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>UG Degree</label>
				    	<input type="text" class="form-control form-control-sm" id="can_ug_degree" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>UG Specialization</label>
				    	<input type="text" class="form-control form-control-sm" id="can_ug_specialization" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>UG Graduation Year</label>
				    	<!-- <input type="text" class="form-control form-control-sm" id="can_ug_graduation_year" placeholder=""> -->
				    	<select name="can_ug_graduation_year" id="can_ug_graduation_year" class="form-control form-control-sm"></select>
				  	</div>
            	</div>
            	<div class="col-lg-12">
            		<div class="form-group">
            			<label>PG College Name</label>
				    	<input type="text" class="form-control form-control-sm" id="can_pg_college_name" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>PG Degree</label>
				    	<input type="text" class="form-control form-control-sm" id="can_pg_degree" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>PG Specialization</label>
				    	<input type="text" class="form-control form-control-sm" id="can_pg_specialization" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>PG Graduation Year</label>
				    	<!-- <input type="text" class="form-control form-control-sm" id="can_pg_graduation_year" placeholder=""> -->
				    	<select name="can_pg_graduation_year" id="can_pg_graduation_year" class="form-control form-control-sm"></select>
				  	</div>
            	</div>
            	<div class="col-lg-12">
            		<div class="form-group">
            			<label>Doctorate University Name</label>
				    	<input type="text" class="form-control form-control-sm" id="can_doctorate_university" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>Doctorate Degree</label>
				    	<input type="text" class="form-control form-control-sm" id="can_doctorate_degree" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>Doctorate Specialization</label>
				    	<input type="text" class="form-control form-control-sm" id="can_doctorate_specialization" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>Doctorate Graduation Year</label>
				    	<!-- <input type="text" class="form-control form-control-sm" id="can_doctorate_graduation_year" placeholder=""> -->
				    	<select name="can_doctorate_graduation_year" id="can_doctorate_graduation_year" class="form-control form-control-sm"></select>
				  	</div>
            	</div>
            	<div class="col-lg-12"><h6 class="font-weight-bold text-secondary mb-3">Teksands Information:</h6></div>
            	
            	<div class="col-lg-12">
            		<ul class="nav nav-tabs nav-justified" role="tablist">
						<li class="nav-item">
							<a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">TS Screening Comment 1</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">TS Screening Comment 2</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">TS Screening Comment 3</a>
						</li>
					</ul><!-- Tab panes -->
					<div class="tab-content">
						<div class="tab-pane active" id="tabs-1" role="tabpanel">
							<div class="row mt-3">
								<div class="col-lg-12">
				            		<div class="form-group">
										<textarea class="form-control" id="can_ts_screening_1" rows="4"></textarea>
									</div>
				            	</div>
							</div>
						</div>
						<div class="tab-pane" id="tabs-2" role="tabpanel">
							<div class="row mt-3">
								<div class="col-lg-12">
				            		<div class="form-group">
										<textarea class="form-control" id="can_ts_screening_2" rows="4"></textarea>
									</div>
				            	</div>
			            	</div>
						</div>
						<div class="tab-pane" id="tabs-3" role="tabpanel">
							<div class="row mt-3">
								<div class="col-lg-12">
				            		<div class="form-group">
										<textarea class="form-control" id="can_ts_screening_3" rows="4"></textarea>
									</div>
				            	</div>
			            	</div>
						</div>
					</div>
            	</div>
            	<div class="col-lg-6">
            		<div class="form-group">
            			<label>TS Screening Grade</label>
				    	<input type="number" class="form-control form-control-sm" maxlength="5" id="can_ts_screening_grade" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-6">
            		<label>Placed</label>
            		<select id="can_placed" class="form-control form-control-sm">
						<option value="1">Yes</option>
						<option value="0">No</option>
					</select>
            	</div>
            	<div class="col-lg-8">
            		<div class="form-group">
            			<label>Placed Company Name</label>
						<select class="form-control form-control-sm" id="can_placed_company" name="can_placed_company">
							<c:forEach items="${clientMasterList}" var="clientMasterList">
								<option <c:if test="${clientMasterList.name eq '${clientMasterList.name}'}" >Selected</c:if> value="${clientMasterList.name}"><c:out value="${clientMasterList.name}" /></option>
							</c:forEach>
						</select>
				  	</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>Placed Date</label>
				    	<input type="text" class="form-control form-control-sm" id="datepicker_2" placeholder="">
				  	</div>
            	</div> 
            	
            	<c:choose>
					<c:when test="${empty candidate}">
					 													   
					</c:when>
					<c:otherwise>
						<div class="col-lg-6 active-status">
						  	<div class="form-group">
		            			<label>Active Status</label>
						    	<select id="can_active" class="form-control form-control-sm" onchange="showRejectionReasion()">
									<option value="1">Activate</option>
									<option value="0">Deactivate</option>
								</select>
						  	</div>
					  	</div>
					  	<div class="col-lg-6 rejection">
						  	<div class="form-group">
		            			<label>Rejection Reason</label>
						    	<select id="can_rejection_reason" class="form-control form-control-sm">
									<option <c:if test="${bootcamp.inactive_reason eq 'Interview Reject'}" >Selected</c:if> value="Interview Reject">Interview Reject</option>
									<option <c:if test="${bootcamp.inactive_reason eq 'Self Dropout'}" >Selected</c:if> value="Self Dropout">Self Dropout</option>
									<option <c:if test="${bootcamp.inactive_reason eq 'Got placed'}" >Selected</c:if> value="Got placed">Got placed</option>
								</select>
						  	</div>
					  	</div>
					</c:otherwise>
				</c:choose>
					
            	<div class="col-lg-12 text-center">
            		<c:choose>
						<c:when test="${empty candidate}">
							<button type="submit" value="submit" id="submit" class="btn btn-primary cms-btn">Add Candidate</button>						 												   
						</c:when>
						<c:otherwise>
							<button type="submit" value="submit" id="submit" class="btn btn-primary cms-btn">Update Candidate Details</button>						  	
						</c:otherwise>
					</c:choose>
            	</div>
            </div>
            </form>
            </div>
            </div>
            </div>
        </div>
    </div>
</div>
