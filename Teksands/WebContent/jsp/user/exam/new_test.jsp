<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" type="text/css" href="https://members.bcic.in/resources/assets/css/forms/multiple-step.css">
<script src="/resources/mcq/js/mcq.js" type="text/javascript"></script>

<style>
.widget-content-area {
    padding: 20px !important;
    position: relative !important;
    background-color: #fff !important;
    border-bottom-left-radius: 6px !important;
    border-bottom-right-radius: 6px !important;
}
.widget {
    padding: 0;
    margin-top: 0;
    margin-bottom: 0;
    border-radius: 6px;
    -webkit-box-shadow: 0 4px 6px 0 rgb(85 85 85 / 8%), 0 1px 20px 0 rgb(0 0 0 / 7%), 0px 1px 11px 0px rgb(0 0 0 / 7%);
    -moz-box-shadow: 0 4px 6px 0 rgba(85, 85, 85, 0.08), 0 1px 20px 0 rgba(0, 0, 0, 0.07), 0px 1px 11px 0px rgba(0, 0, 0, 0.07);
    box-shadow: 0 4px 6px 0 rgb(85 85 85 / 8%), 0 1px 20px 0 rgb(0 0 0 / 7%), 0px 1px 11px 0px rgb(0 0 0 / 7%);
}
</style>

<script>

var isGSTValid = false;
var isCINValid = false;
//var user_id = ${member.user_id};
<c:choose>
	<c:when test="${empty member}">
	  var user_id = "";																   
	</c:when>
	<c:otherwise>
	  var user_id = ${member.user_id};
	</c:otherwise>
</c:choose>

$( document ).ready(function() {

	$(".coo").hide();
	$(".cio").hide();
	$(".head-finance").hide();
	$(".head-hr").hide();
	$(".head-pro").hide();
	$(".confirmation-step").hide();
	$(".cin_upload").hide();
	$(".gst_upload").hide();
	$(".audit_upload").hide();
	
	var yearsLength = 30;
	var currentYear = new Date().getFullYear();
	for(var i = 0; i < 4; i++){
	  var next = currentYear+1;
	  var year = currentYear + '-' + next.toString();
	  $('#financialYearOne').append(new Option(year, year));
	  $('#financialYearTwo').append(new Option(year, year));
	  currentYear--;
	}
	
	/* $('.next').on("click",function(){
		$('html, body').animate({scrollTop:0}, 'slow');
	});
	$('.previous').on("click",function(){
		$('html, body').animate({scrollTop:0}, 'slow');
	}); */
		
	
		
});

function validateMembershipTabs(step)
{
	var flag = true;
	
	if(step == 1)
	{
		flag = step1Validate();
		
	}else if(step == 2)
	{
		flag = step2Validate();
	}else if(step == 3)
	{
		flag = step3Validate();
	}else
	{
		flag = step4Validate();
	}
	return flag;
}

function step1Validate()
{
	return false;
}


</script>
	
<!--  Navbar Starts / Breadcrumb Area  -->
<div class="sub-header-container">
    <header class="header navbar navbar-expand-sm">
        <a href="javascript:void(0);" class="sidebarCollapse" data-placement="bottom">
            <i class="las la-bars"></i>
        </a>
        <ul class="navbar-nav flex-row">
            <li>
                <div class="page-header">
                    <nav class="breadcrumb-one" aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">Member</a></li>
                            <li class="breadcrumb-item active" aria-current="page"><span>Register</span></li>
                        </ol>
                    </nav>
                </div>
            </li>
        </ul>
    </header>
</div>
<!--  Navbar Ends / Breadcrumb Area  -->



<c:choose>
	<c:when test="${empty payment_link}"></c:when>
	<c:otherwise>
	  	<div class="layout-px-spacing">  
			<div class="row layout-top-spacing">
				<div class="col-lg-12">
					<div class="alert alert-warning" role="alert">
					    <button type="button" class="close" data-dismiss="alert" aria-label="Close"> 
					        <i class="las la-times"></i>
					    </button> 
					    <strong>Alert!</strong> You have membership payment pending. <a href="${payment_link}" target="_blank" class="btn btn-sm btn-primary p-1">Pay Now</a>
					</div>
				</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>

<!-- Main Body Starts -->
<div class="layout-px-spacing">
    <div class="layout-top-spacing mb-2">
        <div class="col-md-12">
            <div class="row">
                <div class="container p-0">
                    <div class="row layout-top-spacing">
                        <div class="col-lg-12 layout-spacing">
                            <div class="statbox widget box box-shadow">
                                <div class="widget-content widget-content-area">
                                    <div class="form-group row">
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="card multiple-form-one px-0 pb-0 mb-3">
                                                <h5 class="text-center"><strong>Sign Up Your User Account</strong></h5>
                                                <p class="text-center">Fill all form field to go to next step</p>
                                                <div class="row">
                                                    <div class="col-md-12 mx-0">
                                                        <div id="msform">
                                                            <ul id="progressbar">
                                                                <li class="active" id="account"><strong>Company Info</strong></li>
                                                                <li id="personal"><strong>Contact Info</strong></li>
                                                                <li id="payment"><strong>Management Info</strong></li>
                                                                <li id="confirm"><strong>Introducer/Declaration Info</strong></li>
                                                            </ul> 
                                                            <fieldset>
                                                            	<div class="form-card">
                                                                    <div class="row">
                                                                    	<div class="col-md-12 pl-0">
							                                                <div class="row widget-header">
																				<h4 class="fs-title ml-1">CIN/Register Number/LLPIN & GST Number <span class="text-danger">*</span></h4>
							                                                </div>
							                                            </div>
                                                                    	
                                                                    	<div class="col-md-4">
                                                                    		<div class="form-group">
                                                                    			<label>Enter CIN/LLPIN Number</label>
							                                                    <input type="text" id="mem_cin_reg_no" class="form-control form-control-sm" placeholder="CIN No / Registration NO" onchange="getCompanyDetailsFromCIN()" value="${member.cin_reg_no}">
							                                                </div>
                                                                    	</div>
                                                     
	                                                                    
							                                        </div>
                                                                </div> 
                                                                <input type="button" name="next" class="next btn btn-primary btn-sm" data-custom="membership" data-steps="1" value="Next Step" />
                                                            </fieldset>
                                                            <fieldset>
                                                                <div class="form-card">
                                                                    <div class="row">
                                                                    	<div class="col-md-12 pl-0">
							                                                <div class="row widget-header">
																				<h4 class="fs-title ml-1">Address of Registered/Corporate Office <span class="text-danger">*</span></h4>
							                                                </div>
							                                            </div>
                                                                    	<div class="col-md-12 mt-0">
																			<div class="form-group">
							                                                    <input type="text" id="mem_registered_address" class="form-control form-control-sm" placeholder="Address" value="${member.registered_address}">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-3">
																			<div class="form-group">
							                                                    <label>Pincode</label>
							                                                    <input type="number" id="mem_registered_address_pincode" class="form-control form-control-sm" maxlength="6" placeholder="Pincode" onchange="getRegCityStateForPincode()" value="${member.registered_address_pincode}">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-3">
																			<div class="form-group">
							                                                    <label>City</label>
							                                                    <input type="text" id="mem_registered_address_city" class="form-control form-control-sm" placeholder="City" value="${member.registered_address_city}">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-3">
																			<div class="form-group">
							                                                    <label>State</label>
							                                                    <input type="text" id="mem_registered_address_state" class="form-control form-control-sm" placeholder="State" value="${member.registered_address_state}">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-3">
																			<div class="form-group">
							                                                    <label>Country</label>
							                                                    <input type="text" id="mem_registered_address_country" class="form-control form-control-sm" placeholder="Country" value="${member.registered_address_country}">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-12 pl-0">
							                                                <div class="row widget-header">
																				<h4 class="fs-title ml-1">Address of Local office for communication <span class="text-danger">*</span></h4>
							                                                </div>
							                                                <div class="row widget-header">
							                                                	<h4 class="fs-title ml-4 mb-3 p-0"><input type="checkbox" name="Checkboxes4" id="copyAddress" onclick="CopyRegisteredAddress()"><small>  Local office Address Same as Registered Address</small></h4>
							                                                </div>
							                                            </div>
	                                                                    <div class="col-md-12 mt-0">
																			<div class="form-group">
							                                                    <input type="text" id="mem_local_address" class="form-control form-control-sm" placeholder="Address" value="${member.local_address}">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-3">
																			<div class="form-group">
							                                                    <label>Pincode</label>
							                                                    <input type="number"id="mem_local_address_pincode"  class="form-control form-control-sm" maxlength="6" placeholder="Pincode" onchange="getComCityStateForPincode()" value="${member.local_address_pincode}">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-3">
																			<div class="form-group">
							                                                    <label>City</label>
							                                                    <input type="text" id="mem_local_address_city" class="form-control form-control-sm" placeholder="City" value="${member.local_address_city}">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-3">
																			<div class="form-group">
							                                                    <label>State</label>
							                                                    <input type="text" id="mem_local_address_state" class="form-control form-control-sm" placeholder="State" value="${member.local_address_state}">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-3">
																			<div class="form-group">
							                                                    <label>Country</label>
							                                                    <input type="text" id="mem_local_address_country" class="form-control form-control-sm" placeholder="Country" value="${member.local_address_country}">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-12 pl-0">
							                                                <div class="row widget-header">
							                          							<h4 class="fs-title ml-1">Contact Information <span class="text-danger">*</span></h4>
														                    </div>
							                                            </div>
							                                            
	                                                                    <div class="col-md-4">
																			<label class="fieldlabels">Name</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-user font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="text" name="phno" id="mem_contact_name" placeholder="Name"  value="${member.contact_name}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    
	                                                                    <div class="col-md-4">
																			<label class="fieldlabels">Email ID</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-envelope font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="text" name="phno" id="mem_email" placeholder="Email Id"  value="${member.email}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
							                                            
							                                             <div class="col-md-4">
																			<label class="fieldlabels">Mobile No</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-phone-volume font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="number" name="phno" maxlength="10" pattern="^((\+91[0-9]{10})|(0[0-9]{10}))$" id="mem_mobile" placeholder="Contact Number" value="${member.mobile}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
							                                            
	                                                                    <div class="col-md-4">
																			<label class="fieldlabels">Landline No</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-phone-volume font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="number" name="phno" maxlength="13" pattern="^((\+91[0-9]{10})|(0[0-9]{10}))$" id="mem_landline" placeholder="Contact Number" value="${member.landline}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="col-md-4">
																			<label class="fieldlabels">FAX</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-fax font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="number" name="phno" maxlength="13" pattern="^((\+91[0-9]{10})|(0[0-9]{10}))$" id="mem_fax" placeholder="FAX" value="${member.fax}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    
	                                                                    
	                                                                    <div class="col-md-4">
																			<label class="fieldlabels">Website Name <small></small></label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-link font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="text" name="phno" id="mem_website" value="${member.website}" placeholder="www.example.com"  class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    
	                                                                    <div class="col-md-12 pl-0">
							                                                <div class="row widget-header">
							                          							<h4 class="fs-title ml-1">Social Media Profile's</h4>
														                    </div>
							                                            </div>
	                                                                    <div class="col-md-6">
																			<div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="lab la-facebook-f font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="text" name="phno" id="mem_facebook" placeholder="http://www.facebook.com/username" value="${member.company_facebook}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="col-md-6">
																			<div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="lab la-twitter font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="text" name="phno" id="mem_twitter" placeholder="www.twitter.com/username" value="${member.company_twitter}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="col-md-6">
																			<div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="lab la-linkedin-in font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="text" name="phno" id="mem_linkedin" placeholder="https://www.linkedin.com/in/username" value="${member.company_linkedin}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="col-md-6">
																			<div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="lab la-youtube font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="text" name="phno" id="mem_youtube" placeholder="https://www.youtube.com/channel/UCkRfArvrzheW2E7b6SVT7vQ" value="${member.company_youtube}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
																	</div>
                                                                </div> 
                                                                <input type="button" name="previous" class="previous action-button-previous btn btn-outline-primary" value="Previous" /> 
                                                                <input type="button" name="next" class="next action-button btn btn-primary" data-custom="membership" data-steps="2" value="Next Step" />
                                                            </fieldset>
                                                            <fieldset>
                                                                <div class="form-card">
                                                                    <div class="row">
                                                                        <div class="col-md-12 pl-0">
							                                                <div class="row widget-header">
																				<h4 class="fs-title ml-1">Head of the company/ MD / CEO <span class="text-danger">*</span></h4>
							                                                </div>
							                                            </div>
							                                            <div class="col-md-6">
																			<div class="form-group">
							                                                    <label>Name</label>
							                                                    <input type="text" class="form-control form-control-sm" id="mem_company_head_name" placeholder="Name" value="${member.company_head_name}">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-6">
																			<div class="form-group">
							                                                    <label>Designation</label>
							                                                    <input type="text" class="form-control form-control-sm" id="mem_company_head_designation" placeholder="Designation" value="${member.company_head_designation}">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-4">
																			<label class="fieldlabels">Landline No</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-phone-volume font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="number" name="phno" maxlength="13" pattern="^((\+91[0-9]{10})|(0[0-9]{10}))$" placeholder="Contact No" id="mem_company_head_landline" value="${member.company_head_landline}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="col-md-4">
																			<label class="fieldlabels">Mobile</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-phone-volume font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="number" name="phno" maxlength="13" pattern="^((\+91[0-9]{10})|(0[0-9]{10}))$" placeholder="Mobile" id="mem_company_head_mobile" value="${member.company_head_mobile}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="col-md-4">
																			<label class="fieldlabels">Email</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-envelope font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="email" name="phno" placeholder="Email" id="mem_company_head_email" value="${member.company_head_email}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="col-md-12 pl-0">
							                                                <div class="row widget-header">
																				<h4 class="fs-title ml-1">Applicant Details <span class="text-danger">*</span></h4>
							                                                </div>
							                                            </div>
							                                            <div class="col-md-6">
																			<div class="form-group">
							                                                    <label>Name</label>
							                                                    <input type="text" class="form-control form-control-sm" id="mem_applicant_name" value="${member.applicant_name}" placeholder="Name">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-6">
																			<div class="form-group">
							                                                    <label>Designation</label>
							                                                    <input type="text" class="form-control form-control-sm" id="mem_applicant_designation" value="${member.applicant_designation}" placeholder="Designation">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-6">
																			<label class="fieldlabels">Mobile</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-phone-volume font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="number" name="phno" maxlength="13" pattern="^((\+91[0-9]{10})|(0[0-9]{10}))$" placeholder="Mobile" id="mem_applicant_mobile" value="${member.applicant_mobile}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="col-md-6">
																			<label class="fieldlabels">Email</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-envelope font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="email" name="phno" placeholder="Email" id="mem_applicant_email" value="${member.applicant_email}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="col-md-12 pl-0">
							                                                <div class="row widget-header">
																				<h4 class="fs-title ml-1"><a id="anchor-head-finance" href="javascript:void(0);" onclick="openFinance(this)"><i class="las la-plus-circle text-primary"></i></a> Head of Finance</h4>
							                                                </div>
							                                            </div>
							                                            <div class="col-md-6 head-finance">
																			<div class="form-group">
							                                                    <label>Name</label>
							                                                    <input type="text" class="form-control form-control-sm" id="mem_cfo_name" placeholder="Name" value="${member.cfo_name}">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-6 head-finance">
																			<div class="form-group">
							                                                    <label>Title</label>
							                                                    <input type="text" class="form-control form-control-sm" id="mem_cfo_title" placeholder="Title" value="${member.cfo_title}">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-6 head-finance">
																			<label class="fieldlabels">Mobile</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-phone-volume font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="number" name="phno" maxlength="13" pattern="^((\+91[0-9]{10})|(0[0-9]{10}))$" placeholder="Mobile" id="mem_cfo_mobile" value="${member.cfo_mobile}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="col-md-6 head-finance">
																			<label class="fieldlabels">Email</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-envelope font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="email" name="phno" placeholder="Email" id="mem_cfo_email" value="${member.cfo_email}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="col-md-12 pl-0">
							                                                <div class="row widget-header">
																				<h4 class="fs-title ml-1"><a href="javascript:void(0);" onclick="openOperation(this)"><i class="las la-plus-circle text-primary"></i></a> Head of Operations</h4>
							                                                </div>
							                                            </div>
							                                            <div class="col-md-6 coo">
																			<div class="form-group">
							                                                    <label>Name</label>
							                                                    <input type="text" class="form-control form-control-sm" id="mem_coo_name" placeholder="Name" value="${member.coo_name}">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-6 coo">
																			<div class="form-group">
							                                                    <label>Title</label>
							                                                    <input type="text" class="form-control form-control-sm" id="mem_coo_title" placeholder="Title" value="${member.coo_title}">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-6 coo">
																			<label class="fieldlabels">Mobile</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-phone-volume font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="number" name="phno" maxlength="13" pattern="^((\+91[0-9]{10})|(0[0-9]{10}))$" placeholder="Mobile" id="mem_coo_mobile" value="${member.coo_mobile}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="col-md-6 coo">
																			<label class="fieldlabels">Email</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-envelope font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="email" name="phno" placeholder="Email" id="mem_coo_email" value="${member.coo_email}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="col-md-12 pl-0">
							                                                <div class="row widget-header">
																				<h4 class="fs-title ml-1"><a href="javascript:void(0);" onclick="openCIO(this)"><i class="las la-plus-circle text-primary"></i></a> Head of Administration</h4>
							                                                </div>
							                                            </div>
							                                            <div class="col-md-6 cio">
																			<div class="form-group">
							                                                    <label>Name</label>
							                                                    <input type="text" class="form-control form-control-sm" id="mem_cio_name" placeholder="Name" value="${member.administration_name}">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-6 cio">
																			<div class="form-group">
							                                                    <label>Title</label>
							                                                    <input type="text" class="form-control form-control-sm" id="mem_cio_title" placeholder="Title" value="${member.administration_title}">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-6 cio">
																			<label class="fieldlabels">Mobile</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-phone-volume font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="number" name="phno" maxlength="13" pattern="^((\+91[0-9]{10})|(0[0-9]{10}))$" placeholder="Mobile" id="mem_cio_mobile" value="${member.administration_mobile}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="col-md-6 cio">
																			<label class="fieldlabels">Email</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-envelope font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="email" name="phno" placeholder="Email" id="mem_cio_email" value="${member.administration_email}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    
	                                                                    <div class="col-md-12 pl-0">
							                                                <div class="row widget-header">
																				<h4 class="fs-title ml-1"><a href="javascript:void(0);" onclick="openHeadHR(this)"><i class="las la-plus-circle text-primary"></i></a> Head of Human Resources</h4>
							                                                </div>
							                                            </div>
							                                            <div class="col-md-6 head-hr">
																			<div class="form-group">
							                                                    <label>Name</label>
							                                                    <input type="text" class="form-control form-control-sm" id="mem_hr_name" placeholder="Name" value="${member.hr_name}">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-6 head-hr">
																			<div class="form-group">
							                                                    <label>Title</label>
							                                                    <input type="text" class="form-control form-control-sm" id="mem_hr_title" placeholder="Title" value="${member.hr_title}">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-6 head-hr">
																			<label class="fieldlabels">Mobile</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-phone-volume font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="number" name="phno" maxlength="13" pattern="^((\+91[0-9]{10})|(0[0-9]{10}))$" placeholder="Mobile" id="mem_hr_mobile" value="${member.hr_mobile}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="col-md-6 head-hr">
																			<label class="fieldlabels">Email</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-envelope font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="email" name="phno" placeholder="Email" id="mem_hr_email" value="${member.hr_email}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    
	                                                                    <div class="col-md-12 pl-0">
							                                                <div class="row widget-header">
																				<h4 class="fs-title ml-1"><a href="javascript:void(0);" onclick="openHeadPRO(this)"><i class="las la-plus-circle text-primary"></i></a> Head of Procurement</h4>
							                                                </div>
							                                            </div>
							                                            <div class="col-md-6 head-pro">
																			<div class="form-group">
							                                                    <label>Name</label>
							                                                    <input type="text" class="form-control form-control-sm" id="mem_production_head_name" value="${member.procurement_head_name}" placeholder="Name">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-6 head-pro">
																			<div class="form-group">
							                                                    <label>Title</label>
							                                                    <input type="text" class="form-control form-control-sm" id="mem_production_head_title" value="${member.procurement_head_title}" placeholder="Title">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-6 head-pro">
																			<label class="fieldlabels">Mobile</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-phone-volume font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="number" name="phno" maxlength="13" pattern="^((\+91[0-9]{10})|(0[0-9]{10}))$" placeholder="Mobile" id="mem_production_head_mobile" value="${member.procurement_head_mobile}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="col-md-6 head-pro">
																			<label class="fieldlabels">Email</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-envelope font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="email" name="phno" placeholder="Email" id="mem_production_head_email" value="${member.procurement_head_email}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    
	                                                                    <div class="col-md-12 pl-0">
							                                                <div class="row widget-header">
																				<h4 class="fs-title ml-1">Principal Representative to liaison with BCIC <span class="text-danger">*</span></h4>
							                                                </div>
							                                            </div>
							                                            <div class="col-md-6">
																			<div class="form-group">
							                                                    <label>Name</label>
							                                                    <input type="text" class="form-control form-control-sm" id="mem_representative_name" value="${member.representative_name}" placeholder="Name">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-6">
																			<div class="form-group">
							                                                    <label>Designation</label>
							                                                    <input type="text" class="form-control form-control-sm" id="mem_representative_designation" value="${member.representative_designation}" placeholder="Designation">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-4">
																			<label class="fieldlabels">Landline No</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-phone-volume font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="number" name="phno" maxlength="13" pattern="^((\+91[0-9]{10})|(0[0-9]{10}))$" placeholder="Contact No" id="mem_representative_landline" value="${member.representative_landline}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="col-md-4">
																			<label class="fieldlabels">Mobile</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-phone-volume font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="number" name="phno" maxlength="13" pattern="^((\+91[0-9]{10})|(0[0-9]{10}))$" placeholder="Mobile" id="mem_representative_mobile" value="${member.representative_mobile}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="col-md-4">
																			<label class="fieldlabels">Email</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-envelope font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="email" name="phno" placeholder="Email" id="mem_representative_email" value="${member.representative_email}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
                                                                    </div>
                                                                </div> 
                                                                <input type="button" name="previous" class="previous action-button-previous btn btn-outline-primary" value="Previous" /> 
                                                                <input type="button" name="next" class="next action-button btn btn-primary" data-custom="membership" data-steps="3" value="Next Step" />
                                                            </fieldset>
                                                            <fieldset>
                                                                <div class="form-card final-step">
                                                                    <div class="row">
                                                                    	<div class="col-md-12 pl-0">
							                                                <div class="row widget-header">
																				<h4 class="fs-title ml-1">Introduced by <span class="text-danger">*</span></h4>
							                                                </div>
							                                            </div>
							                                            <div class="col-md-4">
																			<div class="form-group">
							                                                    <label>Name</label>
							                                                    <input type="text" class="form-control form-control-sm" id="mem_introducer_name" value="${member.introducer_name}" placeholder="Name">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-4">
																			<div class="form-group">
							                                                    <label>Designation</label>
							                                                    <input type="text" class="form-control form-control-sm" id="mem_introducer_designation" value="${member.introducer_designation}" placeholder="Designation">
							                                                </div>
	                                                                    </div>
	                                                                    <div class="col-md-4">
																			<label class="fieldlabels">Landline No</label> 
	                                                                        <div class="input-group mb-3">
	                                                                            <div class="input-group-prepend">
	                                                                                <span class="input-group-text"><i class="las la-phone-volume font-17"></i></span>
	                                                                            </div>
	                                                                            <input type="number" name="phno" maxlength="13" pattern="^((\+91[0-9]{10})|(0[0-9]{10}))$" placeholder="Contact No" id="mem_introducer_mobile" value="${member.introducer_mobile}" class="form-control form-control-sm" /> 
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="col-md-12">
							                                                <div class="login-one-inputs check">
													                            <input class="inp-cbx" id="mem_terms_conditions" type="checkbox" style="display: none"/>
													                            <label class="cbx" for="mem_terms_conditions"><span>
													                                <svg width="12px" height="10px" viewbox="0 0 12 10">
													                                  <polyline points="1.5 6 4.5 9 10.5 1"></polyline>
													                                </svg></span><span class="font-13">I agree to the <a class="text-primary" href="/" target="_blank">terms and policies</a></span></label>
													                        </div>
							                                            </div>
							                                            <div class="col-md-12 mt-3 mb-3">
							                                                <p><a href="#" class="btn btn-primary" onclick="registerMembership()">Submit</a></p>
							                                            </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row confirmation-step">
                                                                	<div class="col-md-12">
	                													<div class="login-one-start text-center">
													                        <div class="mt-5">
													                            <i class="las la-envelope-open-text text-success-teal font-65"></i>
													                        </div>
													                        <h3 class="mt-2 text-success-teal">Success !</h3>
													                        <p class="text-muted font-14 mt-4"> 
													                            Thanks for the Registration, We will review and get back to you.
													                        </p>
													                        
													                       <a href="/member/home" class="btn btn-primary btn-sm">Back to Home</a>
														                </div>
													                </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Main Body Ends -->

