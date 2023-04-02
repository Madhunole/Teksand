<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>

<style>
.withborder {
    padding: 15px 15px 15px 15px !important;
    margin-bottom: 20px !important;
}
.job-button {
	text-align: center;
}
@media (max-width:1023px) {
	.job-button {
		padding-top: 20px !important;
	}	
}
.job-decs {
    margin: 15px 0 10px 0;
}
.ul-li {
    margin: 0 0 0 40px;
    text-align: justify;
}
.mr-1 {
    margin-left: 30px;
}
.related-jobs-title {
	line-height: 20px !important;
	word-break: break-word !important;
	font-size: 13px !important;
	color: #000 !important;
	display: inline !important;
	margin-right: 10px !important;
}
.owl-theme .owl-controls {
    margin-top: -5px !important;
}
.related-jobs-company {
	line-height: 40px !important;
	word-break: break-word !important;
	font-size: 13px !important;
	color: #000 !important;
	display: inline !important;
	margin-right: 10px !important;
	color: #3ca1db !important;
}
.related-jobs-description {
	padding: 1px;
	font-size: .929em;
	color: #505050;
	line-height: 18px;
	height: auto;
	margin-top: 5px;
	padding-right: 10px;
}
.related-jobs-list {
    list-style: none;
}
.fas {
    padding: 5px !important;
    font-size: 11px !important;
}
.related-jobs-location {
	padding: 1px;
	font-size: .929em;
	color: #505050;
	line-height: 18px;
	max-height: 0;
	margin-top: 0;
	padding-right: 10px;
}
.fas-bc {
    padding: 0 3px 0 0 !important;
    font-size: 12px !important;
}
i.fa.fa-map-marker {
    font-size: 15px;
}
.authorbox .avatar-author {
    float: left !important;
    width: 200px !important;
    margin-top: 50px !important;
}
.authorbox .desc {
    font-size: 12px !important;
    margin-left: 220px !important;
}
.mt-5 {
    margin-top: 10px !important;
}
@media (min-width: 640px){
	.img-jobs {
	    margin: 40px 0 0 0 !important;
	}
}
.mt-10 {
    margin-top: 40px !important;
}
.text-white {
    color: #fff;
}
.m-0 {
	margin: 0 !important;
}
.help-block {
    color: #FF0000 !important;
}
.form-control-feedback {
	width: 56px !important;
    line-height: 106px !important;
}
.contact_form .form-control {
    margin-bottom: 0 !important;
}
.has-feedback label ~ .form-control-feedback {
    top: 0 !important;
}
.btn-quick-apply {
	background-color: #fff !important;
    color: #3ca1db !important;
	border: 1px solid #3ca1db !important;
}
blockquote p {
    font-style: normal !important;
}
.pdesign
{
	font-size:11pt;
	font-family:Arial;
	color:#000000;
	background-color:transparent;
	font-weight:400;font-style:normal;
	font-variant:normal;
	text-decoration:none;
	vertical-align:baseline;
	white-space:pre;
	white-space:pre-wrap;
}
</style>

<script>
var auth_code = "";

function showPopup(auth_code)
{
	auth_code = auth_code;
	$('#job-apply').modal('show');
}

/*function showQuickApplyForm(auth_code)
{
	auth_code = auth_code;
	$('#job_quick_apply').modal('show');
}*/
function showQuickApplyForm(auth_code)
{
	var job_auth_code = auth_code;
	
	if (window.sessionStorage) 
	{
        sessionStorage.setItem("job_auth_code", job_auth_code);
    }
	
	window.location.replace("http://ats.teksands.ai/candidate/register");
}
function showApply(auth_code)
{
	var job_auth_code = auth_code;
	
	if (window.sessionStorage) 
	{
        sessionStorage.setItem("job_auth_code", job_auth_code);
    }
	
	window.location.replace("http://ats.teksands.ai/candidate/register");
}
$(document).ready(function(){
	
	$("#job_file").change(function() 
	{
		var job_mobile = $("#job_details_mobile").val();
		if(job_mobile == "")
		   {
			 $("#file").val(""); 
		 	 swal("OOPS!", "Please fill the form after you upload the resume", "info");
		 	 return false;
		   }
	   $("#txt_resume_mobile").val(job_mobile);
	   var filename = $("#job_file").val(); 
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
				if(obj.status == 400){
					swal("OOPS!", obj.msg, "info");
					flag = true;
					return false;
				}
				var img_path = $.trim(obj.msg);
		        $("#job_resume").html(img_path);
		        var url = '${resume_path}' + img_path;
		        $("#job_resume").attr("href",url);
		    }
		  });
		
		if(flag)
		{
			return false;
		}
	});
	
	
	$("#job_sign_file").change(function() 
		{
			var job_mobile = $("#job_mobile").val();
			if(job_mobile == "")
		   {
			 $("#file").val(""); 
		 	 swal("OOPS!", "Please fill the form after you upload the resume", "info");
		 	 return false;
		   }
		   $("#txt_sign_resume_mobile").val(job_mobile);
		   //$('[name="txt_sign_resume_mobile"]').val(job_mobile);
		   
		   var filename = $("#job_sign_file").val(); 
		   if(filename == "")
		   {
			 $("#file").val(""); 
		 	 swal("OOPS!", "Please select the CV document", "info");
		 	 return false;
		   }
		   var input = this;
		 	
		 	var formData = new FormData($("#imageform_1")[0]);	 
		 	
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
					if(obj.status == 400){
						swal("OOPS!", obj.msg, "info");
						flag = true;
						return false;
					}
					var img_path = $.trim(obj.msg);
			        $("#job_resume_sign").html(img_path);
			        var url = '${resume_path}' + img_path;
			        $("#job_resume_sign").attr("href",url);
			    }
			  });
			
			if(flag)
			{
				return false;
			}
		});
	
	$("#job_quick_sign_file").change(function() 
	{
		var job_mobile = $("#job_quick_mobile").val();
		if(job_mobile == "")
		   {
			 $("#job_quick_sign_file").val(""); 
		 	 swal("OOPS!", "Please fill the form after you upload the resume", "info");
		 	 return false;
		   }
	   $("#txt_quick_resume_mobile").val(job_mobile);
	   var filename = $("#job_quick_sign_file").val(); 
	   if(filename == "")
	   {
		 $("#job_quick_sign_file").val(""); 
	 	 swal("OOPS!", "Please select the CV document", "info");
	 	 return false;
	   }
	   var input = this;
	 	
	 	var formData = new FormData($("#imageform_2")[0]);	 	
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
				if(obj.status == 400){
					swal("OOPS!", obj.msg, "info");
					flag = true;
					return false;
				}
				var img_path = $.trim(obj.msg);
		        $("#job_quick_resume_sign").html(img_path);
		        var url = '${resume_path}' + img_path;
		        $("#job_quick_resume_sign").attr("href",url);
		    }
		  });
		
		if(flag)
		{
			return false;
		}
	});

	$('#imageform_1').validate({
		rules: {
			job_name: {
				required: true,
			},
			job_mobile: {
				required: true,
			},
			job_email: {
				required: true,
			},
			job_key_skills: {
				required: true,
			},
			job_sign_file: {
				required: true,
			},
	    },
	    messages: {
	    		job_name: "Please Enter Your Name",
				job_mobile: "Please Enter Your Mobile",
				job_email: "Please Enter Your Email",
				job_key_skills: "Please Enter List your key Skills",
				job_sign_file: "Please Upload Your Current CV",
		},
		
		errorElement: "div",
		
		errorPlacement: function ( error, element ) {
			
			error.addClass( "help-block" );
			
			element.parents( ".form-validate" ).addClass( "has-feedback" );
			
			if(element.prop( "type" ) === "checkbox"){
				var ele = element.parent("div");
				error.insertAfter( ele.parent("div") );
			}else if(element.prop( "type" ) === "radio"){
				error.insertAfter( element.parent( ".form-radio" ) );
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
		},		
	    
		submitHandler: function () {
			saveJobs();
	    }
	});
	
	$('#imageform').validate({
		rules: {
			job_details_name: {
				required: true,
				maxlength: 100,
			},
			job_details_mobile: {
				required: true,
				minlength: 10,
				maxlength: 16,
			},
			job_details_email: {
				required: true,
				email: true,
				maxlength: 100,
			},
			job_details_key_skills: {
				required: true,
			},
			job_file: {
				required: true,
			},
	    },
	    messages: { 
	    	job_details_name: {
		    	required: "Please Enter Your Name",
		    	maxlength: "Maximum allowed is 100 characters"
	    	},
	    	job_details_mobile: {
				required: "Please Enter Your Mobile",
				minlength: "Minimum digits allowed for a Mobile number is 10",
				maxlength: "Maximum digits allowed for a Mobile number is 16"
			},		
			job_details_email: {
		    	required: "Please Enter Your Email",
		    	email: "Please Enter Valid Email",
		    	maxlength: "Maximum allowed is 100 characters"
			},
	    	job_details_key_skills: "Please Enter Your Key Skills",
	    	job_file: "Please Upload Your Current CV",
		},
		
		errorElement: "div",
		
		errorPlacement: function ( error, element ) {
			
			error.addClass( "help-block" );
			
			element.parents( ".form-validate" ).addClass( "has-feedback" );
			
			if(element.prop( "type" ) === "checkbox"){
				var ele = element.parent("div");
				error.insertAfter( ele.parent("div") );
			}else if(element.prop( "type" ) === "radio"){
				error.insertAfter( element.parent( ".form-radio" ) );
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
		},		
	    
		submitHandler: function () {
			saveJobsDetails();
	    }
	});
	
	$('#imageform_2').validate({
		rules: {
			job_quick_name: {
				required: true,
			},
			job_quick_mobile: {
				required: true,
			},
			job_quick_email: {
				required: true,
			},
			job_quick_key_skills: {
				required: true,
			},
			job_quick_sign_file: {
				required: true,
			},
	    },
	    messages: {
	    	job_quick_name: "Please Enter Your Name",
	    	job_quick_mobile: "Please Enter Your Mobile",
	    	job_quick_email: "Please Enter Your Email",
	    	job_quick_key_skills: "Please Enter Your Key Skills",
	    	job_quick_sign_file: "Please Upload Your Current CV",
		},
		
		errorElement: "div",
		
		errorPlacement: function ( error, element ) {
			
			error.addClass( "help-block" );
			
			element.parents( ".form-validate" ).addClass( "has-feedback" );
			
			if(element.prop( "type" ) === "checkbox"){
				var ele = element.parent("div");
				error.insertAfter( ele.parent("div") );
			}else if(element.prop( "type" ) === "radio"){
				error.insertAfter( element.parent( ".form-radio" ) );
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
		},		
	    
		submitHandler: function () {
			applyQuickJob();
	    }
	});
});


function saveJobs()
{
    var name = $("#job_name").val();
    var mobile = $("#job_mobile").val();
    var email = $("#job_email").val();
    var key_skills = $("#job_key_skills").val();
    var resume =$("#job_resume_sign").attr('href');
    var auth_code = "${jobs.auth_code}";

    $.ajaxSetup({async:false});
	$.post("/saveCandidateFromJob", {can_name: "" + name + "", 
		can_mobile: "" + mobile + "",
		can_email: "" + email + "",
		can_key_skills: "" + key_skills + "",
		para_resume: "" + resume + "",
		auth_code: "" + auth_code + "", }, function(data)
		{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
  			
   			swal("Thank you for contacting us", "We have received your enquiry and will respond to you shortly", "success");
   			
   			$('#job-apply').modal('toggle');
   		    
   		    $("#job_name").val("");
   		    $("#job_mobile").val("");
   		    $("#job_email").val("");
   		    $("#job_summary").val("");
   			
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

function saveJobsDetails()
{
    var name = $("#job_details_name").val();
    var mobile = $("#job_details_mobile").val();
    var email = $("#job_details_email").val();
    var key_skills = $("#job_details_key_skills").val();
    var resume =$("#job_resume").attr('href');
    var auth_code = "${jobs.auth_code}";
    
    $.post("/saveCandidateFromJob", {can_name: "" + name + "", 
    	can_mobile: "" + mobile + "",
		can_email: "" + email + "",
		can_key_skills: "" + key_skills + "",
		para_resume: "" + resume + "",
		auth_code: "" + auth_code + "", }, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
  			
   			swal("Thank you for your Application.", " We will revert soon", "success");
   			
   		    $("#job_details_name").val("");
   		    $("#job_details_mobile").val("");
   		    $("#job_details_email").val("");
   		 	$("#job_details_summary").val("");
   		 	$("#resume").val("");
   		 	
   		 	var input = $("#imageform").find("input[name=job_file]");
			$("#job_resume").html("");
			input.replaceWith(input.val(''));
   		 	
   		 	return false;
          	
   		} else {
   			swal("OOPS!", "Please Enter Correct Details", "error");
   		 	return false;
   		}
		
	},'text');
}


function checkIfEmailAlreadyExistOrNot()
{
	var can_email = $("#job_details_email").val();
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:true});
	$.post("/checkIfEmailAlreadyExistOrNot", {email : "" + can_email + ""}, function(data)       	   
	{
		$.LoadingOverlay("hide");
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		
		if(obj.status_code == 400)
		{
			swal("Email Already Exist", "", "error");
		
			$("#job_details_email").val("");
	 	    return false;
		}
		
	}, "text");
}
function searchJobs()
{
    var keyword = $("#txt_search").val();
    if(keyword == "")
    {
    	swal("OOPS!", "Please Enter Keywords", "error");
    	return false;
    }
    document.location.href = "/jobs/search?keyword="+keyword;
} 

function applyQuickJob()
{
	var name = $("#job_quick_name").val();
    var mobile = $("#job_quick_mobile").val();
    var email = $("#job_quick_email").val();
    var key_skills = $("#job_quick_key_skills").val();
    var resume = $("#job_quick_resume_sign").html();
    var auth_code = "${jobs.auth_code}";
    
    $.post("/saveApplicationAndCreateCandidate", {quick_name: "" + name + "", 
    	quick_mobile: "" + mobile + "",
    	quick_email: "" + email + "",
    	quick_key_skills: "" + key_skills + "",
    	quick_resume: "" + resume + "",
		auth_code: "" + auth_code + "", }, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
  			
   			$('#job_quick_apply').modal('toggle');
   			
   			swal("Thank you for contacting us", "We have received your enquiry and will respond to you shortly", "success");
   			
   		    $("#job_quick_name").val("");
   		    $("#job_quick_mobile").val("");
   		    $("#job_quick_email").val("");
   		 	$("#job_quick_key_skills").val("");
   		 	
   		 	var input = $("#imageform_2").find("input[name=job_quick_sign_file]");
			$("#job_quick_resume_sign").html("");
			input.replaceWith(input.val(''));
   		 	
   		 	return false;
          	
   		} else {
   			swal("OOPS!", "Failure!, Please Try Again", "error");
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

<div class="page-title bgg">
    <div class="container clearfix">
       <div class="pull-left">
           <div class="bread">
               <ol class="breadcrumb">
                   <li><a href="/">Home</a></li>
                    <li class="active">Job Listing</li>
                   <li class="active">Jobs Details</li>
               </ol>
           </div><!-- end bread -->
       </div><!-- /.pull-right -->
    </div>
</div><!-- end page-title -->

<section class="section bgw">
    <div class="container">
        <div class="row">
            <div id="post-content" class="col-md-8 col-sm-12">
                <div class="single-content">
                    <div class="row big-post clearfix">
                        <div class="col-md-12">
                        	<!-- <div class="addthis_inline_share_toolbox_h9lr text-right"></div>  -->
                        	<div class="addthis_inline_share_toolbox_zhdk text-right"></div> 
                            <div class="col-md-12 col-sm-12 mob20 boxes text-left withcircle-custom withborder">
			                   <div class="col-md-8 col-sm-12">
				                      <h1 class="job-heading"><c:out value="${jobs.role_name}" /></h1>
				                      <p style="margin: 10px 0 10px 0;font-size: 12px;"><b>Company:</b> <a href="${jobs.company_website}" target="_blank"><c:out value="${jobs.company_name}" /></a> | <b>Date Posted:</b> <fmt:formatDate value="${jobs.date}" pattern="dd-MMM-yyyy"/> | <b>Qualification:</b> <c:out value="${jobs.qualification}" /></p> 
								</div>
								<div class="col-md-4 col-sm-12" style="">
									<div class="text-right">
										<%-- <a href="javascript:void(0)" onclick="showQuickApplyForm('${jobs.auth_code}')" class="btn btn-quick-apply">Quick Apply</a> --%>
										<%-- <a href="javascript:void(0)" onclick="showApply('${jobs.auth_code}')" class="btn btn-primary">Apply</a> --%>
										<a href="http://ats.teksands.ai/candidate/register?job_code=${jobs.auth_code}" class="btn btn-quick-apply">Quick Apply</a>
										<a href="http://ats.teksands.ai/candidate/register?job_code=${jobs.auth_code}" class="btn btn-primary">Apply</a>
									</div>
								</div>
								<div class="col-md-12">
                            	<div class="table-responsive">
									<table class="table table-bordered" style="vertical-align: middle;">
										  <thead>
										    <tr>
		
										    </tr>
										  </thead>
										<tbody>
												<tr>
											      <td style="vertical-align: middle;"><b>Position:</b></td>
											      <td style="vertical-align: middle;width: 165px;background-color: #f5f5f5;"><c:out value="${jobs.position}" /></td>
											      <td style="vertical-align: middle;"><b>Skills Required:</b></td>
											      <td style="vertical-align: middle;background-color: #f5f5f5;"><c:out value="${jobs.skills_required}" /></td>
											      <td style="vertical-align: middle;"><b>Employment Type:</b></td>
											      <td style="vertical-align: middle;background-color: #f5f5f5;"><c:out value="${jobs.emp_type}" /></td>
											    </tr>
											    <tr>
											      <td style="vertical-align: middle;"><b>Location:</b></td>
											      <td style="vertical-align: middle;background-color: #f5f5f5;"><c:out value="${jobs.location}" /></td>
											      <td style="vertical-align: middle;"><b>Job Mode:</b></td>
											      <td style="vertical-align: middle;background-color: #f5f5f5;"><c:out value="${jobs.job_mode}" /></td>
											      <td style="vertical-align: middle;"><b>Experience:</b></td>
											      <td style="vertical-align: middle;width: 109px;background-color: #f5f5f5;"><c:out value="${jobs.min_exp}" /> - <c:out value="${jobs.max_exp}" /> (years)</td>
											    </tr>
										  </tbody>
									</table>
								</div>
							</div>
							</div><!-- end col -->
                            
                            <div class="post-padding clearfix mob20 boxes text-left withborder">
                            	<p><b>Introduction:</b></p>
                                <p class="pdesign"><c:out value="${jobs.short_description}" escapeXml="false"/></p>
                                <p><b>Skills Competencies:</b></p>
                                <p><c:out value="${jobs.skills_competencies}" escapeXml="false"/></p>
                                <p><b>Responsibilities:</b></p>
                                <p><c:out value="${jobs.job_responsibilities}" escapeXml="false"/></p>
                                <div class="row">
                                	<div class="col-md-6 col-sm-3 col-xs-6">
	                                	<c:if test="${not empty jobs.tags}">
		                                	<div class="tags clearfix mob20">
												<c:forEach var="item" items="${fn:split(jobs.tags,', ')}">
													<a href="/jobs?tags=${item}">${item}</a>
												</c:forEach>
		                                	</div>
										</c:if>
                                	</div>
                                	<div class="col-md-6 col-sm-3 col-xs-6 tags text-right">
                                		<a href="/register-candidate?jmt1oray=${jobs.auth_code}" style="padding: 5px 30px;font-size: 15px;" class="btn btn-primary btn-square">Apply</a>
                                	</div>
                                </div>
                            </div><!-- end post-padding -->
                            <div class="post-padding clearfix mob20 boxes text-left withborder">
                                <div class="single-content">
				                    <div class="authorbox">
				                        <div class="row">
		                                    <div class="col-md-12 col-sm-6">
			                                    <div class="">
			                                        <h4><c:out value="${jobs.company_name}" /></h4>
			                                        <a class="authorlink" href="${jobs.company_website}" target="_blank"><c:out value="${jobs.company_website}" /></a>
			                                        <p><c:out value="${jobs.company_about}" /></p>
			                                    </div>
		                                    </div>
				                        </div><!-- end row -->
				                    </div><!-- end authorbox -->
				                </div><!-- end content -->
				                <blockquote>
                                    <p>Submit Your Latest CV <a href="javascript:void(0);" class="btn btn-primary btn-square pull-right mob20" onclick="showQuickApplyForm('${jobs.auth_code}')">Quick Apply</a></p>
                                </blockquote>
                            </div><!-- end post-padding -->
                        </div><!-- end col -->
                    </div><!-- end post-padding -->
                </div><!-- end content -->
            </div><!-- end col -->

            <div id="sidebar" class="col-md-4 col-sm-12 custom-sidebar">
            	<div class="widget clearfix" style="margin-bottom: 0;">
            		<div class="big-title">
                        <h2 class="related-title">
                            <span>Search Jobs</span>
                        </h2>
                    </div>
					<div class="input-group">
					  <input aria-describedby="basic-addon2" placeholder="Enter keyword to search" class="form-control" id="txt_search" type="text" value="<c:out value="${keyword}"></c:out>">
					  <span id="basic-addon1" class="input-group-addon btn-primary text-white" style="cursor:pointer;" onclick="searchJobs()">Search</span>
					</div>
				</div>
            	<div class="widget clearfix">
                    <div class="big-title">
                        <h2 class="related-title">
                            <span>Submit Your Latest CV</span>
                        </h2>
                    </div>
                    <div class="contact_form row">
                    	<form id="imageform" role="form" method="post" enctype="multipart/form-data">
	                        <div class="col-lg-12">
	                        	<div class="form-validate form-group">
	                        		<input type="text" id="job_details_name" name="job_details_name" onkeydown="return /[a-z ]/i.test(event.key)" class="form-control" placeholder="Name">
	                        	</div>
	                        	<div class="form-validate form-group">
	                        		<input type="text" id="job_details_mobile" name="job_details_mobile" onkeypress='return isNumberKey(event);' class="form-control" placeholder="Phone" required">
	                        	</div>
	                        	<div class="form-validate form-group">
	                        		<input type="text" id="job_details_email" name="job_details_email" class="form-control" onchange="checkIfEmailAlreadyExistOrNot()" placeholder="Email">
	                        	</div>
	                        	<div class="form-validate form-group">
	                        		<textarea class="form-control" id="job_details_key_skills" name="job_details_key_skills" rows="3" placeholder="List your key Skills (separated by comma) *" required></textarea>
	                        	</div>
	                        	<div class="row">
	                        		<div class="col-md-12 form-group form-validate">
										<label for="files">Upload Your Current CV</label>
										<input type="hidden" name="txt_candidate_mobile" id="txt_resume_mobile" value="" />
										<input type="file" id="job_file" name="job_file" class="btn btn-default btn-block" />
										<a id="job_resume" href="" class="text-primary" target="_blank"></a>
									</div>
	                        	</div>
	                        	<button type="submit" value="submit" id="submit" class="button button--wayra btn-block btn-square"> Submit</button>
	                        </div>
                        </form>
                    </div>
                </div>
            	<div class="widget clearfix">
                    <div class="big-title">
                        <h2 class="related-title">
                            <span>Recent Jobs</span>
                        </h2>
                    </div><!-- end big-title -->
                    <div class="postpager liststylepost">
                        <ul class="pager">
	                        <c:forEach items="${latestJobs}" var="latestJobs">
	                            <li>
	                                <div class="post">
                                        <h4><c:out value="${latestJobs.role_name}" /> - <a href="/jobs/${latestJobs.jobs_url}" class="btn btn-primary btn-xs">View Details</a></h4>
	                                </div>  
	                            </li>
							</c:forEach>                            
                        </ul>   
                    </div><!-- end postpager -->
                </div><!-- end widget -->
            </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end section -->

<c:if test="${not empty jobsRelatedList}">
	<section class="section custom-section">
	   <div class="container">
	       <div class="big-title">
	           <h2 class="related-title">
	               <span>Related Jobs</span>
	           </h2>
	       </div><!-- end big-title -->
	       <div id="owl-services" class="carousel-widget">
	       		<c:forEach items="${jobsRelatedList}" var="jobsRelatedList">
		           <div class="carousel-item">
		               <div class="shop-item">
		                   <div class="shop-desc">
		                       <h3 class="related-jobs-title"><a href="#" title=""><c:out value="${jobsRelatedList.role_name}" /></a></h3>
		                       <h3 class="related-jobs-company"><c:out value="${jobsRelatedList.company_name}" /></h3>
		                       <p class="related-jobs-description"><c:out value="${fn:substring(jobsRelatedList.short_description,0,260)}" /><c:out value="" /></p>
		                       <ul class="related-jobs-list">
		                       		<li style="font-size: .929em;"><span class="fas"><i class="fa fa-map-marker"></i></span> <c:out value="${jobsRelatedList.company_address}" /></li>
		                       		<li style="font-size: .929em;"><span class="fas"><i class="fa fa-briefcase"></i></span> <c:out value="${jobsRelatedList.max_salary_range}" /></li>	                       		
		                       		<li style="font-size: .929em;"><span class="fas"><i class="fa fa-history"></i></span> <c:out value="${jobsRelatedList.experience}" /></li>
		                       </ul>
		                   </div>
		                   <div class="large-post-meta text-right">
		                       <a href="" target="_blank" class="btn btn-primary btn-square">Apply</a>
		                   </div><!-- end meta -->
		               </div><!-- end shop-item -->
		           </div><!-- end carousel-item -->
				</c:forEach>
	       </div><!-- end carousel-widget -->
	       <div class="col-md-12 text-center mt-10">
				<a href="/jobs?category=${jobs.category}" target="_blank" class="btn btn-primary btn-square btn-sm">View More Related Jobs</a>
			</div>
	   </div><!-- end container -->
	</section><!-- end section -->
</c:if>

<div class="modal fade" id="job-apply" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
	        	<h5 class="modal-title" id="exampleModalLongTitle">Job Apply</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
        		</button>
      		</div>
      		<form id="imageform_1" role="form" method="post" enctype="multipart/form-data">
		      	<div class="modal-body">
			        <div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="member-profile">
								<div class="row profile-badges contact-rm">
									<div class="contact_form">
										<div class="row">
											<div class="col-md-12 form-validate">
												<input type="text" id="job_name" name="job_name" class="form-control" placeholder="Name *">
											</div>
										</div>
										<div class="row">
											<div class="col-md-6 form-validate">
												<input type="text" class="form-control" id="job_mobile" name="job_mobile" placeholder="Mobile *">
											</div>
											<div class="col-md-6 form-validate">
												<input type="text" class="form-control" id="job_email" name="job_email" placeholder="Email *">
											</div>
										</div>
									</div>
									<div class="row form-group">
										<div class="col-md-12 form-validate">
											<textarea class="form-control" id="job_key_skills" name="job_key_skills" rows="4" placeholder="List your key Skills (separated by comma) *"></textarea>
										</div>
									</div>
									<div class="row">
		                        		<div class="col-md-12 form-validate">
											<label for="files">Upload Your Current CV</label>
											<input type="hidden" name="txt_candidate_mobile" id="txt_sign_resume_mobile" value="" />
											<input type="file" id="job_sign_file" name="job_sign_file" class="btn btn-default btn-block"/>
											<a id="job_resume_sign" href="" class="text-primary" target="_blank"></a>
										</div>
		                        	</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			    <div class="modal-footer">
			    	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button type="submit" value="submit" id="submit" class="btn btn-primary btn-square"> Apply</button>
				</div>
			</form>
		</div>
  	</div>
</div>

<div class="modal fade" id="job_quick_apply" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
	        	<h5 class="modal-title" id="exampleModalLongTitle">Job Apply</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
        		</button>
      		</div>
      		<form id="imageform_2" role="form" method="post" enctype="multipart/form-data">
		      	<div class="modal-body">
			        <div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="member-profile">
								<div class="row profile-badges contact-rm">
									<div class="contact_form">
										<div class="row">
											<div class="col-md-12 form-validate form-group">
												<input type="text" id="job_quick_name" name="job_quick_name" class="form-control" placeholder="Name *">
											</div>
										</div>
										<div class="row form-group">
											<div class="col-md-6 form-validate">
												<input type="tel" class="form-control" id="job_quick_mobile" name="job_quick_mobile" placeholder="Mobile *">
											</div>
											<div class="col-md-6 form-validate">
												<input type="text" class="form-control" id="job_quick_email" name="job_quick_email" placeholder="Email *">
											</div>
										</div>
									</div>
									<div class="row form-group">
										<div class="col-md-12 form-validate form-group">
											<textarea class="form-control" id="job_quick_key_skills" name="job_quick_key_skills" rows="4" placeholder="List your key Skills (separated by comma) *"></textarea>
										</div>
									</div>
									<div class="row">
		                        		<div class="col-md-12 form-validate form-group">
											<label for="files">Upload Your Current CV</label>
											<input type="hidden" name="txt_candidate_mobile" id="txt_quick_resume_mobile" value="" />
											<input type="file" id="job_quick_sign_file" name="job_quick_sign_file" class="btn btn-default btn-block"/>
											<a id="job_quick_resume_sign" href="" class="text-primary" target="_blank"></a>
										</div>
		                        	</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			    <div class="modal-footer">
			    	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button type="submit" value="submit" id="submit" class="btn btn-primary btn-square"> Apply</button>
				</div>
			</form>
		</div>
  	</div>
</div>