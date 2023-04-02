<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="container-fluid">
	<div class="col-12 col-xl-auto mb-3 pl-0 ">
		<c:choose>
			<c:when test="${source eq 'view_client'}">
				<a class="btn btn-sm btn-light text-primary pl-0" href="/bootcamp/brand-view-client?client_id=${client.id}">
			        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
			        Back to Client View
			    </a>
			</c:when>
			<c:otherwise>
				<a class="btn btn-sm btn-light text-primary pl-0" href="/bootcamp/brand-clients">
			        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
			        Back to Clients
			    </a>
			</c:otherwise>
		</c:choose>
	</div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary"></h6>	
             <c:choose>
				<c:when test="${empty client}">
				 	<h6 class="m-0 font-weight-bold text-primary">Add Client</h6>											   
				</c:when>
				<c:otherwise>
				  	<h6 class="m-0 font-weight-bold text-primary">Update Client Details</h6>
				</c:otherwise>
			</c:choose>
        </div>
        <div class="card-body">
        	<form id="addClientForm" role="form" method="post" enctype="multipart/form-data">
	            <div class="row">
	            	<div class="col-lg-12">
	            		<div class="form-group form-validate">
	            			<label class="required">Client Name</label>
					    	<input type="text" class="form-control" id="client_name" name="client_name" placeholder="">
					  	</div>
	            	</div>
	            	<div class="col-lg-12">
	            		<div class="form-group form-validate">
	            			<label class="required">Client Description</label>
					    	<textarea rows="3" maxlength="500" class="form-control" id="client_description" name="client_description"></textarea>
					  	</div>
	            	</div>
	            	<div class="col-lg-4">
	            		<div class="form-group form-validate">
	            			<label>CIN/Registration No</label>
					    	<input type="text" class="form-control" id="client_cin" name="client_cin">
					  	</div>
	            	</div>
	            	<div class="col-lg-4">
	            		<div class="form-group form-validate">
	            			<label>GST No</label>
					    	<input type="text" class="form-control" id="client_gst" name="client_gst">
					  	</div>
	            	</div>
	            	<div class="col-lg-4">
	            		<div class="form-group form-validate">
	            			<label>PAN No</label>
					    	<input type="text" class="form-control" id="client_pan" name="client_pan">
					  	</div>
	            	</div>
	            	<div class="col-lg-6">
	            		<div class="form-group form-validate">
	            			<label class="required">Nature of Business</label>
					    	<input type="text" class="form-control" id="client_nature_business" name="client_nature_business">
					  	</div>
	            	</div>
	            	<div class="col-lg-6">
	            		<div class="form-group form-validate">
	            			<label class="required">Products and Services</label>
					    	<input type="text" class="form-control" id="client_product_service" name="client_product_service">
					  	</div>
	            	</div>
	            	<div class="col-lg-4">
	            		<div class="form-group form-validate">
	            			<label>Total Number of Employees</label>
					    	<input type="text" class="form-control" id="client_total_employees" name="client_total_employees">
					  	</div>
	            	</div>
	            	<div class="col-lg-4">
	            		<div class="form-group form-validate">
	            			<label>Annual Revenue</label>
					    	<input type="text" class="form-control" id="client_annual_revenue" name="client_annual_revenue">
					  	</div>
	            	</div>
	            	<div class="col-lg-4">
	            		<div class="form-group form-validate">
	            			<label>Website</label>
					    	<input type="text" class="form-control" id="client_website" name="client_website">
					  	</div>
	            	</div>
	            	<div class="col-lg-12">
	            		<div class="form-group form-validate">
	            			<label class="required">Address</label>
					    	<input type="text" class="form-control" id="client_address" name="client_address">
					  	</div>
	            	</div>
	            	<div class="col-lg-3">
	            		<div class="form-group form-validate">
	            			<label class="required">Pincode</label>
					    	<input type="text" class="form-control" id="client_pincode" name="client_pincode" onchange="getCityStatebyPincode()">
					  	</div>
	            	</div>
	            	<div class="col-lg-3">
	            		<div class="form-group form-validate">
	            			<label class="required">City</label>
					    	<input type="text" class="form-control" id="client_city" name="client_city">
					  	</div>
	            	</div>
	            	<div class="col-lg-3">
	            		<div class="form-group form-validate">
	            			<label class="required">State</label>
					    	<input type="text" class="form-control" id="client_state" name="client_state">
					  	</div>
	            	</div>
	            	<div class="col-lg-3">
	            		<div class="form-group form-validate">
	            			<label class="required">Country</label>
					    	<input type="text" class="form-control" id="client_country" name="client_country">
					  	</div>
	            	</div>
	            	<div class="col-lg-12 mb-4">
	            		<div class="card">
	            			<div class="card-header text-primary font-weight-bold">
	            				Client Contact Details
	            			</div>
	            			<div class="card-body">
	            				<div class="row" id="items">
	            				
	            					<c:choose>
	            						<c:when test="${not empty clientcontact}">
	            							<c:forEach items="${clientcontact}" var="clientcontact">
	            								<input type="hidden" class="form-control" id="client_contact_id"  name="client_contact_id[]" value="${clientcontact.id}">
	            								<div class="col-lg-6">
				            						<div class="form-group form-validate">
								            			<label class="required">Name</label>
												    	<input type="text" class="form-control"  id="client_contact_name" name="client_contact_name[]" value="${clientcontact.name}">
												  	</div>
				            					</div>
				            					<div class="col-lg-6">
				            						<div class="form-group form-validate">
								            			<label>Designation</label>
												    	<input type="text" class="form-control" id="client_contact_designation" name="client_contact_designation[]" value="${clientcontact.designation}">
												  	</div>
				            					</div>
				            					<div class="col-lg-6">
				            						<div class="form-group form-validate">
								            			<label>Mobile</label>
												    	<input type="text" class="form-control" id="client_contact_mobile" name="client_contact_mobile[]" value="${clientcontact.mobile}">
												  	</div>
				            					</div>
				            					<div class="col-lg-6">
				            						<div class="form-group form-validate">
								            			<label class="required">Email</label>
												    	<input type="text" class="form-control" id="client_contact_email" name="client_contact_email[]" value="${clientcontact.email}">
												  	</div>
				            					</div>
				            					<div class="col-lg-6">
				            						<div class="form-group form-validate">
								            			<label>Department</label>
												    	<input type="text" class="form-control" id="client_contact_department" name="client_contact_department[]" value="${clientcontact.department}">
												  	</div>
				            					</div>
				            					<div class="col-lg-12">
								            		<div class="form-group form-validate">
								            			<label>Notes</label>
												    	<textarea rows="3" maxlength="500" class="form-control" id="client_contact_notes" name="client_contact_notes[]">${clientcontact.notes}</textarea>
												  	</div>
								            	</div>
	            							</c:forEach>
	            						</c:when>
	            						<c:otherwise>
	            							<div class="col-lg-6">
			            						<div class="form-group form-validate">
							            			<label class="required">Name</label>
											    	<input type="text" class="form-control" required data-msg="Please Enter Client Contact Name" id="client_contact_name_1" name="client_contact_name[]">
											  	</div>
			            					</div>
			            					<div class="col-lg-6">
			            						<div class="form-group form-validate">
							            			<label>Designation</label>
											    	<input type="text" class="form-control" id="client_contact_designation_1" name="client_contact_designation[]">
											  	</div>
			            					</div>
			            					<div class="col-lg-6">
			            						<div class="form-group form-validate">
							            			<label>Department</label>
											    	<input type="text" class="form-control" id="client_contact_department_1" name="client_contact_department[]">
											  	</div>
			            					</div>
			            					<div class="col-lg-6">
			            						<div class="form-group form-validate">
							            			<label>Mobile</label>
											    	<input type="text" class="form-control" id="client_contact_mobile_1" name="client_contact_mobile[]">
											  	</div>
			            					</div>
			            					<div class="col-lg-12">
			            						<div class="form-group form-validate">
							            			<label class="required">Email</label>
											    	<input type="text" class="form-control" required data-msg="Please Enter Client Contact Email"  id="client_contact_email_1" name="client_contact_email[]">
											  	</div>
			            					</div>
			            					<div class="col-lg-12">
							            		<div class="form-group form-validate">
							            			<label>Notes</label>
											    	<textarea rows="3" maxlength="500" class="form-control" id="client_contact_notes_1" name="client_contact_notes[]"></textarea>
											  	</div>
							            	</div>
	            						</c:otherwise>
	            					</c:choose>
					            	<div class="col-lg-12">
					            		<button class="delete btn btn-outline-primary btn-sm cms-btn" type="button"><i class="fas fa-minus-circle"></i> Client Contact</button>
										<button id="add" class="btn btn-primary btn-sm float-right cms-btn" type="button"><i class="fas fa-plus-circle"></i> Client Contact</button>
					            	</div>
	            				</div>
	            			</div>
	            		</div>
	            	</div>	            	
	            	<div class="col-lg-12 text-center">
	            		<c:choose>
							<c:when test="${empty client}">
							 	<button type="submit" value="submit" id="submit" class="btn btn-primary cms-btn"> Add Client</button>											   
							</c:when>
							<c:otherwise>
							  	<button type="submit" value="submit" id="submit" class="btn btn-primary cms-btn"> Update Client Details</button>
							</c:otherwise>
						</c:choose>
	            	</div>
	            </div>
           </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>

<script>

var isGSTValid = false;
var isCINValid = false;
var numberIncr = 2;

<c:choose>
	<c:when test="${empty client}">
	  var client_id = "";																   
	</c:when>
	<c:otherwise>
	  var client_id = "${client.id}";
	</c:otherwise>
</c:choose>

$(document).ready(function() 
{
	
	<c:choose>
		<c:when test="${not empty client}">
			loadData();															   
		</c:when>
	</c:choose>
	
	$("#success-alert").hide();
	  
	$(".delete").hide();
	
  	$("#add").click(function(e) 
	{
    	$(".delete").fadeIn("1500");
    	
    	var director = "";
    	
    	director += '<div class="next-referral col-lg-6 mt-2"><div class="form-group form-validate"><label class="required">Name</label><input type="text" class="form-control" required data-msg="Please Enter Client Contact Name" id="client_contact_name_'+numberIncr+'" name="client_contact_name[]"></div></div>';
    	director += '<div class="next-referral col-lg-6 mt-2"><div class="form-group form-validate"><label>Designation</label><input type="text" class="form-control form-control-sm" id="client_contact_designation_'+numberIncr+'" name="client_contact_designation[]"></div></div>';
    	director += '<div class="next-referral col-lg-6 mt-2"><div class="form-group form-validate"><label>Department</label><input type="text" class="form-control form-control-sm" id="client_contact_department_'+numberIncr+'" name="client_contact_department[]"></div></div>';
    	director += '<div class="next-referral col-lg-6 mt-2"><div class="form-group form-validate"><label>Mobile</label><input type="text" class="form-control form-control-sm" id="client_contact_mobile_'+numberIncr+'" name="client_contact_mobile[]"></div></div>';
    	director += '<div class="next-referral col-lg-6 mt-2"><div class="form-group form-validate"><label class="required">Email</label><input required data-msg="Please Enter Client Contact Email" type="text" class="form-control" id="client_contact_email_'+numberIncr+'" name="client_contact_email[]"></div></div>';
    	director += '<div class="next-referral col-lg-12 mt-2"><div class="form-group form-validate"><label>Notes</label><textarea rows="3" maxlength="500" class="form-control form-control-sm" id="client_contact_notes_'+numberIncr+'" name="client_contact_notes[]"></textarea></div></div>';
    		
    	$("#items").append(director);
    	
    	numberIncr++;
    	
  	});
  	
  	$("body").on("click", ".delete", function(e) 
  	{
  		$(".next-referral").last().remove();
    });
  	
    $( "#addClientForm" ).validate( {
    	
    	rules: {
			client_name: {
				required: true,
				minlength: 2
			},
			client_description: {
				required: true,
				minlength: 2
			},
			client_nature_business: {
				required: true,
			},
			client_product_service: {
				required: true,
			},
			client_address: {
				required: true,
			},
			client_pincode: {
				required: true,
				minlength: 6
			},
			client_city: {
				required: true,
			},
			client_state: {
				required: true,
			},
			client_country: {
				required: true,
			},
			client_contact_name_1: {
				required: true,
			},			
			client_contact_email_1: {
				required: true,
			},			
		},
		messages: {
			client_name: "Please Enter Company Name",
			client_description: "Please Enter Company Description",
			client_nature_business: "Please Enter Nature of Business",
			client_product_service: "Please Enter Product and Service",
			client_address: "Please Enter Address 1",
			client_pincode: {
				required: "Please Enter Pincode",
				minlength: "Please Enter Your 6 Digit Pincode"
			},
			client_city: "Please Enter City",
			client_state: "Please Enter State",
			client_country: "Please Enter Country",
			client_contact_name_1: "Please Enter Client Contact Name",
			client_contact_email_1: "Please Enter Client Contact Email",
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
		}
	} );
});

$.validator.setDefaults( {
	submitHandler: function () {
		
		addClient();
		
		/*var numIncr = numberIncr -1;	
		if($('#client_contact_name_'+numIncr).val() == '')
		{
			$('#client_contact_name_'+numIncr).focus();
			return false;
		} 
		if($('#client_contact_email_'+numIncr).val() == '')
		{
			$('#client_contact_email_'+numIncr).focus();
			return false;
		} 
		else
		{
			addClient();
		}*/		 
	}
} );

function getCityStatebyPincode()
{
	var pincode = $("#client_pincode").val();
	
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
			    text: 'This pincode not available. Please enter the details.',
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
			
			$("#client_city").val(city);
			$("#client_state").val(state);
			$("#client_country").val("India");
		}
		
	}, "text");
}

function addClient()
{
	
	var client_cin = $("#client_cin").val();
	var client_gst = $("#client_gst").val();
	var client_pan = $("#client_pan").val();
	var client_name = $("#client_name").val();
	var client_description = $("#client_description").val();
	var client_nature_business = $("#client_nature_business").val();
	var client_product_service = $("#client_product_service").val();
	var client_total_employees = $("#client_total_employees").val();
	var client_annual_revenue = $("#client_annual_revenue").val();
	var client_website = $("#client_website").val();
	var client_address = $("#client_address").val();
	var client_pincode = $("#client_pincode").val();
	var client_city = $("#client_city").val();
	var client_state = $("#client_state").val();
	var client_country = $("#client_country").val();
	var client_contact_idArr = $("input[name='client_contact_id[]']").map(function(){return $(this).val();}).get();
	var client_contact_nameArr = $("input[name='client_contact_name[]']").map(function(){return $(this).val();}).get();
	var client_contact_designationArr = $("input[name='client_contact_designation[]']").map(function(){return $(this).val();}).get();
	var client_contact_departmentArr = $("input[name='client_contact_department[]']").map(function(){return $(this).val();}).get();
	var client_contact_mobileArr = $("input[name='client_contact_mobile[]']").map(function(){return $(this).val();}).get();
	var client_contact_emailArr = $("input[name='client_contact_email[]']").map(function(){return $(this).val();}).get();
	var client_contact_notesArr = $("textarea[name='client_contact_notes[]']").map(function(){return $(this).val();}).get();
		
	var client_contact_id = "";
	var client_contact_name = "";
	var client_contact_designation = "";
	var client_contact_department = "";
	var client_contact_mobile = "";
	var client_contact_email = "";
	var client_contact_notes = "";
	
	for(var i = 0; i < client_contact_idArr.length; i++) 
	{
		client_contact_idArr[i] = client_contact_idArr[i].replace(/^\s*/, "").replace(/\s*$/, "");
	   	if(client_contact_idArr[i] == ""){
	   		client_contact_id += 0 +",";
	   	}else{
	   		client_contact_id += client_contact_idArr[i]+",";
	   	}
	}
	
	for(var i = 0; i < client_contact_nameArr.length; i++) 
	{
		client_contact_nameArr[i] = client_contact_nameArr[i].replace(/^\s*/, "").replace(/\s*$/, "");
	   	if(client_contact_nameArr[i] == ""){
	   		client_contact_name += 0 +",";
	   	}else{
	   		client_contact_name += client_contact_nameArr[i]+",";
	   	}
	}
	
	for(var i = 0; i < client_contact_designationArr.length; i++) 
	{
		client_contact_designationArr[i] = client_contact_designationArr[i].replace(/^\s*/, "").replace(/\s*$/, "");
	   	if(client_contact_designationArr[i] == ""){
	   		client_contact_designation += 0 +",";
	   	}else{
	   		client_contact_designation += client_contact_designationArr[i]+",";
	   	}
	}
	
	for(var i = 0; i < client_contact_departmentArr.length; i++) 
	{
		client_contact_departmentArr[i] = client_contact_departmentArr[i].replace(/^\s*/, "").replace(/\s*$/, "");
	   	if(client_contact_departmentArr[i] == ""){
	   		client_contact_department += 0 +",";
	   	}else{
	   		client_contact_department += client_contact_departmentArr[i]+",";
	   	}
	}
	
	for(var i = 0; i < client_contact_mobileArr.length; i++) 
	{
		client_contact_mobileArr[i] = client_contact_mobileArr[i].replace(/^\s*/, "").replace(/\s*$/, "");
	   	if(client_contact_mobileArr[i] == ""){
	   		client_contact_mobile += 0 +",";
	   	}else{
	   		client_contact_mobile += client_contact_mobileArr[i]+",";
	   	}
	}
	
	for(var i = 0; i < client_contact_emailArr.length; i++) 
	{
		client_contact_emailArr[i] = client_contact_emailArr[i].replace(/^\s*/, "").replace(/\s*$/, "");
	   	if(client_contact_emailArr[i] == ""){
	   		client_contact_email += 0 +",";
	   	}else{
	   		client_contact_email += client_contact_emailArr[i]+",";
	   	}
	}
	
	for(var i = 0; i < client_contact_notesArr.length; i++) 
	{
		client_contact_notesArr[i] = client_contact_notesArr[i].replace(/^\s*/, "").replace(/\s*$/, "");
	   	if(client_contact_notesArr[i] == ""){
	   		client_contact_notes += 0 +"|";
	   	}else{
	   		client_contact_notes += client_contact_notesArr[i]+"|";
	   	}
	}
	
	$.LoadingOverlay("show");
	
    $.ajaxSetup({async:false});
	$.post("/bootcamp/brandaddOrUpdateClient", {
		client_id: "" + client_id + "",client_contact_id: "" + client_contact_id + "",client_cin: "" + client_cin + "",client_gst: "" + client_gst + "",client_pan: "" + client_pan + "",client_name: "" + client_name + "",
		client_description: "" + client_description + "",client_nature_business: "" + client_nature_business + "",client_product_service: "" + client_product_service + "",
		client_total_employees: "" + client_total_employees + "",client_annual_revenue: "" + client_annual_revenue + "",client_website: "" + client_website + "",
		client_address: "" + client_address + "",client_pincode: "" + client_pincode + "",client_city: "" + client_city + "",client_state: "" + client_state + "",
		client_country: "" + client_country + "",client_contact_name: "" + client_contact_name + "",client_contact_designation: "" + client_contact_designation + "",client_contact_department: "" + client_contact_department + "",
		client_contact_mobile: "" + client_contact_mobile + "",client_contact_email: "" + client_contact_email + "",client_contact_notes: "" + client_contact_notes + "",
		
	}, function(data)
	{	
		$.LoadingOverlay("hide");
		
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		if(obj.status_code == 200)
		{
			$( '#addClientForm' ).each(function(){
			    this.reset();
			});
			
			$.toast({
			    heading: '<b>Success</b>',
			    text: obj.msg,
			    icon: 'success',
			    position: 'top-right',
			    bgColor: '#d4edda',
			    textColor: '#155724',
			    hideAfter: 1000,
			    
			    afterShown: function () {
			    	setTimeout(function() {
			    		window.location.href = "/bootcamp/brand-clients"
			    	}, 1050);
			    },
			})
			
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
	
}

function loadData()
{
	var client = '${client}';
	
	var name = '${client.name}';
	var description = '${client.description}';
	var cin = '${client.cin}';
	var gst = '${client.gst}';
	var pan = '${client.pan}';
	var address = '${client.address}';
	var city = '${client.city}';
	var state = '${client.state}';
	var state = '${client.state}';
	var country = '${client.country}';
	var pinocde = '${client.pinocde}';
	var nature_of_business = '${client.nature_of_business}';
	var product_and_service = '${client.product_and_service}';
	var total_no_employee = '${client.total_no_employee}';
	var annual_revenue = '${client.annual_revenue}';
	var website = '${client.website}';
	
	$("#client_name").val(name);
	$("#client_description").val(description);
	$("#client_cin").val(cin);
	$("#client_gst").val(gst);
	$("#client_pan").val(pan);
	$("#client_nature_business").val(nature_of_business);
	$("#client_product_service").val(product_and_service);
	$("#client_total_employees").val(total_no_employee);
	$("#client_annual_revenue").val(annual_revenue);
	$("#client_website").val(website);
	$("#client_address").val(address);
	$("#client_pincode").val(pinocde);
	$("#client_city").val(city);
	$("#client_state").val(state);
	$("#client_country").val(country);
}
</script>