<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="container-fluid">
	<div class="col-12 col-xl-auto mb-3 pl-0 ">
		<c:choose>
			<c:when test="${source eq 'view_brand'}">
				<a class="btn btn-sm btn-light text-primary pl-0" href="/bootcamp/view-brand?brand_id=${brand.id}">
			        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
			        Back to Brand View
			    </a>
			</c:when>
			<c:otherwise>
				<a class="btn btn-sm btn-light text-primary pl-0" href="/bootcamp/brands">
			        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
			        Go to Brands
			    </a>
			</c:otherwise>
		</c:choose>
	</div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary"></h6>	
             <c:choose>
				<c:when test="${empty brand}">
				 	<h6 class="m-0 font-weight-bold text-primary">Add Brand</h6>											   
				</c:when>
				<c:otherwise>
				  	<h6 class="m-0 font-weight-bold text-primary">Update Brand Details</h6>
				</c:otherwise>
			</c:choose>
        </div>
        <div class="card-body">
        	<form id="addBrandForm" role="form" method="post" enctype="multipart/form-data">
	            <div class="row">
	            	<div class="col-lg-12">
	            		<div class="form-group form-validate">
	            			<label class="required">Brand Name</label>
					    	<input type="text" class="form-control" id="brand_name" name="brand_name" placeholder="">
					  	</div>
	            	</div>
	            	<div class="col-lg-12">
	            		<div class="form-group form-validate">
	            			<label class="required">Brand Description</label>
					    	<textarea rows="3" maxlength="500" class="form-control" id="brand_description" name="brand_description"></textarea>
					  	</div>
	            	</div>
	            	<div class="col-lg-4">
	            		<div class="form-group form-validate">
	            			<label>CIN/Registration No</label>
					    	<input type="text" class="form-control" id="brand_cin" name="brand_cin">
					  	</div>
	            	</div>
	            	<div class="col-lg-4">
	            		<div class="form-group form-validate">
	            			<label>GST No</label>
					    	<input type="text" class="form-control" id="brand_gst" name="brand_gst">
					  	</div>
	            	</div>
	            	<div class="col-lg-4">
	            		<div class="form-group form-validate">
	            			<label>PAN No</label>
					    	<input type="text" class="form-control" id="brand_pan" name="brand_pan">
					  	</div>
	            	</div>
	            	<div class="col-lg-6">
	            		<div class="form-group form-validate">
	            			<label class="required">Nature of Business</label>
					    	<input type="text" class="form-control" id="brand_nature_business" name="brand_nature_business">
					  	</div>
	            	</div>
	            	<div class="col-lg-6">
	            		<div class="form-group form-validate">
	            			<label class="required">Products and Services</label>
					    	<input type="text" class="form-control" id="brand_product_service" name="brand_product_service">
					  	</div>
	            	</div>
	            	<div class="col-lg-4">
	            		<div class="form-group form-validate">
	            			<label>Total Number of Employees</label>
					    	<input type="text" class="form-control" id="brand_total_employees" name="brand_total_employees">
					  	</div>
	            	</div>
	            	<div class="col-lg-4">
	            		<div class="form-group form-validate">
	            			<label>Annual Revenue</label>
					    	<input type="text" class="form-control" id="brand_annual_revenue" name="brand_annual_revenue">
					  	</div>
	            	</div>
	            	<div class="col-lg-4">
	            		<div class="form-group form-validate">
	            			<label>Website</label>
					    	<input type="text" class="form-control" id="brand_website" name="brand_website">
					  	</div>
	            	</div>
	            	<div class="col-lg-12">
	            		<div class="form-group form-validate">
	            			<label class="required">Address</label>
					    	<input type="text" class="form-control" id="brand_address" name="brand_address">
					  	</div>
	            	</div>
	            	<div class="col-lg-3">
	            		<div class="form-group form-validate">
	            			<label class="required">Pincode</label>
					    	<input type="text" class="form-control" id="brand_pincode" name="brand_pincode" onchange="getCityStatebyPincode()">
					  	</div>
	            	</div>
	            	<div class="col-lg-3">
	            		<div class="form-group form-validate">
	            			<label class="required">City</label>
					    	<input type="text" class="form-control" id="brand_city" name="brand_city">
					  	</div>
	            	</div>
	            	<div class="col-lg-3">
	            		<div class="form-group form-validate">
	            			<label class="required">State</label>
					    	<input type="text" class="form-control" id="brand_state" name="brand_state">
					  	</div>
	            	</div>
	            	<div class="col-lg-3">
	            		<div class="form-group form-validate">
	            			<label class="required">Country</label>
					    	<input type="text" class="form-control" id="brand_country" name="brand_country">
					  	</div>
	            	</div>
	            	<div class="col-lg-12 mb-4">
	            		<div class="card">
	            			<div class="card-header text-primary font-weight-bold">
	            				Directors Details
	            			</div>
	            			<div class="card-body">
	            				<div class="row" id="items">
	            				
	            					<c:choose>
	            						<c:when test="${not empty brandDirectors}">
	            							<c:forEach items="${brandDirectors}" var="brandDirectors">
	            								<input type="hidden" class="form-control" id="brand_director_id" name="brand_director_id[]" value="${brandDirectors.id}">
	            								<div class="col-lg-6">
				            						<div class="form-group form-validate">
								            			<label class="required">Name</label>
												    	<input type="text" class="form-control" id="brand_director_name" name="brand_director_name[]" value="${brandDirectors.name}">
												  	</div>
				            					</div>
				            					<div class="col-lg-6">
				            						<div class="form-group form-validate">
								            			<label>Designation</label>
												    	<input type="text" class="form-control" id="brand_director_designation" name="brand_director_designation[]" value="${brandDirectors.designation}">
												  	</div>
				            					</div>
				            					<div class="col-lg-6">
				            						<div class="form-group form-validate">
								            			<label>Mobile</label>
												    	<input type="text" class="form-control" id="brand_director_mobile" name="brand_director_mobile[]" value="${brandDirectors.mobile}">
												  	</div>
				            					</div>
				            					<div class="col-lg-6">
				            						<div class="form-group form-validate">
								            			<label class="required">Email</label>
												    	<input type="text" class="form-control" id="brand_director_email" name="brand_director_email[]" value="${brandDirectors.email}">
												  	</div>
				            					</div>
				            					<div class="col-lg-12">
								            		<div class="form-group form-validate">
								            			<label>Notes</label>
												    	<textarea rows="3" maxlength="500" class="form-control" id="brand_director_notes" name="brand_director_notes[]">${brandDirectors.notes}</textarea>
												  	</div>
								            	</div>
	            							</c:forEach>
	            						</c:when>
	            						<c:otherwise>
	            							<div class="col-lg-6">
			            						<div class="form-group form-validate">
							            			<label class="required">Name</label>
											    	<input type="text" class="form-control" required data-msg="Please Enter Director Name"  id="brand_director_name_1" name="brand_director_name[]">
											  	</div>
			            					</div>
			            					<div class="col-lg-6">
			            						<div class="form-group form-validate">
							            			<label>Designation</label>
											    	<input type="text" class="form-control" id="brand_director_designation_1" name="brand_director_designation[]">
											  	</div>
			            					</div>
			            					<div class="col-lg-6">
			            						<div class="form-group form-validate">
							            			<label>Mobile</label>
											    	<input type="text" class="form-control" id="brand_director_mobile_1" name="brand_director_mobile[]">
											  	</div>
			            					</div>
			            					<div class="col-lg-6">
			            						<div class="form-group form-validate">
							            			<label class="required">Email</label>
											    	<input type="text" class="form-control" required data-msg="Please Enter Director Email" id="brand_director_email_1" name="brand_director_email[]">
											  	</div>
			            					</div>
			            					<div class="col-lg-12">
							            		<div class="form-group form-validate">
							            			<label>Notes</label>
											    	<textarea rows="3" maxlength="500" class="form-control" id="brand_director_notes_1" name="brand_director_notes[]"></textarea>
											  	</div>
							            	</div>
	            						</c:otherwise>
	            					</c:choose>
					            	<div class="col-lg-12">
					            		<button class="delete btn btn-outline-primary btn-sm cms-btn" type="button"><i class="fas fa-minus-circle"></i> Director</button>
										<button id="add" class="btn btn-primary btn-sm float-right cms-btn" type="button"><i class="fas fa-plus-circle"></i> Director</button>
					            	</div>
	            				</div>
	            			</div>
	            		</div>
	            	</div>
	            	<div class="col-lg-12 mb-4">
	            		<div class="card">
	            			<div class="card-header text-primary font-weight-bold">
	            				Brand Admin Details
	            			</div>
	            			<div class="card-body">
	            				<div class="row">
	            					<div class="col-lg-4">
	            						<div class="form-group form-validate">
					            			<label class="required">Name</label>
									    	<input type="text" class="form-control" id="brand_admin_name" name="brand_admin_name">
									  	</div>
	            					</div>
									<div class="col-lg-4">
										<div class="form-group form-validate">
					            			<label class="required">Email</label>
									    	<input type="text" class="form-control" id="brand_admin_email" name="brand_admin_email">
									  	</div>
	            					</div>
	            					<div class="col-lg-4">
	            						<div class="form-group form-validate">
					            			<label class="required">Mobile</label>
									    	<input type="text" class="form-control" id="brand_admin_mobile" name="brand_admin_mobile">
									  	</div>
	            					</div>
	            				</div>
	            			</div>
	            		</div>
	            	</div>
	            	<div class="col-lg-12 text-center">
	            		<c:choose>
							<c:when test="${empty brand}">
							 	<button type="submit" value="submit" id="submit" class="btn btn-primary cms-btn"> Add Brand</button>											   
							</c:when>
							<c:otherwise>
							  	<button type="submit" value="submit" id="submit" class="btn btn-primary cms-btn"> Update Brand Details</button>
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
	<c:when test="${empty brand}">
	  var brand_id = "";																   
	</c:when>
	<c:otherwise>
	  var brand_id = "${brand.id}";
	</c:otherwise>
</c:choose>

$(document).ready(function() 
{
	
	<c:choose>
		<c:when test="${not empty brand}">
			loadData();															   
		</c:when>
	</c:choose>
	
	$("#success-alert").hide();
	  
	$(".delete").hide();
	
  	$("#add").click(function(e) 
	{
    	$(".delete").fadeIn("1500");
    	
    	var director = "";
    	
    	director += '<div class="next-referral col-lg-6 mt-2"><div class="form-group form-validate"><label class="required">Name</label><input required data-msg="Please Enter Director Name" type="text" class="form-control form-control-sm" id="brand_director_name_'+numberIncr+'" name="brand_director_name[]"></div></div>';
    	director += '<div class="next-referral col-lg-6 mt-2"><div class="form-group form-validate"><label>Designation</label><input type="text" class="form-control form-control-sm" id="brand_director_designation_'+numberIncr+'" name="brand_director_designation[]"></div></div>';
    	director += '<div class="next-referral col-lg-6 mt-2"><div class="form-group form-validate"><label>Mobile</label><input type="text" class="form-control form-control-sm" id="brand_director_mobile_'+numberIncr+'" name="brand_director_mobile[]"></div></div>';
    	director += '<div class="next-referral col-lg-6 mt-2"><div class="form-group form-validate"><label class="required">Email</label><input required data-msg="Please Enter Director Email" type="text" class="form-control form-control-sm" id="brand_director_email_'+numberIncr+'" name="brand_director_email[]"></div></div>';
    	director += '<div class="next-referral col-lg-12 mt-2"><div class="form-group form-validate"><label>Notes</label><textarea rows="3" maxlength="500" class="form-control form-control-sm" id="brand_director_notes_'+numberIncr+'" name="brand_director_notes[]"></textarea></div></div>';
    		
    	$("#items").append(director);
    	
    	numberIncr++;
    	
  	});
  	
  	$("body").on("click", ".delete", function(e) 
  	{
  		$(".next-referral").last().remove();
    });
  	
    $( "#addBrandForm" ).validate( {
    	
    	rules: {
			brand_name: {
				required: true,
				minlength: 2
			},
			brand_description: {
				required: true,
				minlength: 2
			},
			brand_nature_business: {
				required: true,
			},
			brand_product_service: {
				required: true,
			},
			brand_address: {
				required: true,
			},
			brand_pincode: {
				required: true,
				minlength: 6
			},
			brand_city: {
				required: true,
			},
			brand_state: {
				required: true,
			},
			brand_country: {
				required: true,
			},
			brand_director_name_1: {
				required: true,
			},
			brand_director_email_1: {
				required: true,
				email: true,
			},
			brand_admin_name: {
				required: true,
			},
			brand_admin_email: {
				required: true,
			},
			brand_admin_mobile: {
				required: true,
			},
		},
		messages: {
			brand_name: "Please Enter Company Name",
			brand_description: "Please Enter Company Description",
			brand_nature_business: "Please Enter Nature of Business",
			brand_product_service: "Please Enter Product and Service",
			brand_address: "Please Enter Address 1",
			brand_pincode: {
				required: "Please Enter Pincode",
				minlength: "Please Enter Your 6 Digit Pincode"
			},
			brand_city: "Please Enter City",
			brand_state: "Please Enter State",
			brand_country: "Please Enter Country",
			brand_director_name_1: "Please Enter Director Name",
			brand_director_email_1: "Please Enter Director Email",
			brand_admin_name: "Please Enter Brand Admin Name",
			brand_admin_email: "Please Enter Brand Admin Email",
			brand_admin_mobile: "Please Enter Brand Admin Mobile",
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
		addBrand();
	}
} );

function getCityStatebyPincode()
{
	var pincode = $("#brand_pincode").val();
	
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
			
			$("#brand_city").val(city);
			$("#brand_state").val(state);
			$("#brand_country").val("India");
		}
		
	}, "text");
}

function addBrand()
{
	var brand_cin = $("#brand_cin").val();
	var brand_gst = $("#brand_gst").val();
	var brand_pan = $("#brand_pan").val();
	var brand_name = $("#brand_name").val();
	var brand_description = $("#brand_description").val();
	var brand_nature_business = $("#brand_nature_business").val();
	var brand_product_service = $("#brand_product_service").val();
	var brand_total_employees = $("#brand_total_employees").val();
	var brand_annual_revenue = $("#brand_annual_revenue").val();
	var brand_website = $("#brand_website").val();
	var brand_address = $("#brand_address").val();
	var brand_pincode = $("#brand_pincode").val();
	var brand_city = $("#brand_city").val();
	var brand_state = $("#brand_state").val();
	var brand_country = $("#brand_country").val();
	var brand_director_idArr = $("input[name='brand_director_id[]']").map(function(){return $(this).val();}).get();
	var brand_director_nameArr = $("input[name='brand_director_name[]']").map(function(){return $(this).val();}).get();
	var brand_director_designationArr = $("input[name='brand_director_designation[]']").map(function(){return $(this).val();}).get();
	var brand_director_mobileArr = $("input[name='brand_director_mobile[]']").map(function(){return $(this).val();}).get();
	var brand_director_emailArr = $("input[name='brand_director_email[]']").map(function(){return $(this).val();}).get();
	var brand_director_notesArr = $("textarea[name='brand_director_notes[]']").map(function(){return $(this).val();}).get();
	var brand_admin_name = $("#brand_admin_name").val();
	var brand_admin_email = $("#brand_admin_email").val();
	var brand_admin_mobile = $("#brand_admin_mobile").val();
	
	var brand_director_id = "";
	var brand_director_name = "";
	var brand_director_designation = "";
	var brand_director_mobile = "";
	var brand_director_email = "";
	var brand_director_notes = "";
	
	for(var i = 0; i < brand_director_idArr.length; i++) 
	{
		brand_director_idArr[i] = brand_director_idArr[i].replace(/^\s*/, "").replace(/\s*$/, "");
	   	if(brand_director_idArr[i] == ""){
	   		brand_director_id += 0 +",";
	   	}else{
	   		brand_director_id += brand_director_idArr[i]+",";
	   	}
	}
	
	for(var i = 0; i < brand_director_nameArr.length; i++) 
	{
		brand_director_nameArr[i] = brand_director_nameArr[i].replace(/^\s*/, "").replace(/\s*$/, "");
	   	if(brand_director_nameArr[i] == ""){
	   		brand_director_name += 0 +",";
	   	}else{
	   		brand_director_name += brand_director_nameArr[i]+",";
	   	}
	}
	
	for(var i = 0; i < brand_director_designationArr.length; i++) 
	{
		brand_director_designationArr[i] = brand_director_designationArr[i].replace(/^\s*/, "").replace(/\s*$/, "");
	   	if(brand_director_designationArr[i] == ""){
	   		brand_director_designation += 0 +",";
	   	}else{
	   		brand_director_designation += brand_director_designationArr[i]+",";
	   	}
	}
	
	for(var i = 0; i < brand_director_mobileArr.length; i++) 
	{
		brand_director_mobileArr[i] = brand_director_mobileArr[i].replace(/^\s*/, "").replace(/\s*$/, "");
	   	if(brand_director_mobileArr[i] == ""){
	   		brand_director_mobile += 0 +",";
	   	}else{
	   		brand_director_mobile += brand_director_mobileArr[i]+",";
	   	}
	}
	
	for(var i = 0; i < brand_director_emailArr.length; i++) 
	{
		brand_director_emailArr[i] = brand_director_emailArr[i].replace(/^\s*/, "").replace(/\s*$/, "");
	   	if(brand_director_emailArr[i] == ""){
	   		brand_director_email += 0 +",";
	   	}else{
	   		brand_director_email += brand_director_emailArr[i]+",";
	   	}
	}
	
	for(var i = 0; i < brand_director_notesArr.length; i++) 
	{
		brand_director_notesArr[i] = brand_director_notesArr[i].replace(/^\s*/, "").replace(/\s*$/, "");
	   	if(brand_director_notesArr[i] == ""){
	   		brand_director_notes += 0 +"|";
	   	}else{
	   		brand_director_notes += brand_director_notesArr[i]+"|";
	   	}
	}
	
	$.LoadingOverlay("show");
	
    $.ajaxSetup({async:false});
	$.post("/bootcamp/addUpdateBrand", {
		brand_id: "" + brand_id + "",brand_director_id: "" + brand_director_id + "",brand_cin: "" + brand_cin + "",brand_gst: "" + brand_gst + "",brand_pan: "" + brand_pan + "",brand_name: "" + brand_name + "",
		brand_description: "" + brand_description + "",brand_nature_business: "" + brand_nature_business + "",brand_product_service: "" + brand_product_service + "",
		brand_total_employees: "" + brand_total_employees + "",brand_annual_revenue: "" + brand_annual_revenue + "",brand_website: "" + brand_website + "",
		brand_address: "" + brand_address + "",brand_pincode: "" + brand_pincode + "",brand_city: "" + brand_city + "",brand_state: "" + brand_state + "",
		brand_country: "" + brand_country + "",brand_director_name: "" + brand_director_name + "",brand_director_designation: "" + brand_director_designation + "",
		brand_director_mobile: "" + brand_director_mobile + "",brand_director_email: "" + brand_director_email + "",brand_director_notes: "" + brand_director_notes + "",
		brand_admin_name: "" + brand_admin_name + "",brand_admin_email: "" + brand_admin_email + "",brand_admin_mobile: "" + brand_admin_mobile + "",
	}, function(data)
	{		
		$.LoadingOverlay("hide");
		
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		if(obj.status_code == 200)
		{
			$( '#addBrandForm' ).each(function(){
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
			    		window.location.href = "/bootcamp/brands"
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
	var brand = '${brand}';
	
	var name = '${brand.name}';
	var description = '${brand.description}';
	var cin = '${brand.cin}';
	var gst = '${brand.gst}';
	var pan = '${brand.pan}';
	var address = '${brand.address}';
	var city = '${brand.city}';
	var state = '${brand.state}';
	var state = '${brand.state}';
	var country = '${brand.country}';
	var pinocde = '${brand.pinocde}';
	var nature_of_business = '${brand.nature_of_business}';
	var product_and_service = '${brand.product_and_service}';
	var total_no_employee = '${brand.total_no_employee}';
	var annual_revenue = '${brand.annual_revenue}';
	var website = '${brand.website}';
	var admin_name = '${brand.admin_name}';
	var admin_email = '${brand.admin_email}';
	var admin_mobile = '${brand.admin_mobile}';
	
	$("#brand_name").val(name);
	$("#brand_description").val(description);
	$("#brand_cin").val(cin);
	$("#brand_gst").val(gst);
	$("#brand_pan").val(pan);
	$("#brand_nature_business").val(nature_of_business);
	$("#brand_product_service").val(product_and_service);
	$("#brand_total_employees").val(total_no_employee);
	$("#brand_annual_revenue").val(annual_revenue);
	$("#brand_website").val(website);
	$("#brand_address").val(address);
	$("#brand_pincode").val(pinocde);
	$("#brand_city").val(city);
	$("#brand_state").val(state);
	$("#brand_country").val(country);
	$("#brand_admin_name").val(admin_name);
	$("#brand_admin_email").val(admin_email);
	$("#brand_admin_mobile").val(admin_mobile);
}
</script>