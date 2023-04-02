<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="col-12 col-xl-auto mb-3">
    <a class="btn btn-sm btn-light text-primary" href="/bootcamp/client-master">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
        Back to Client Master
    </a>
</div>

<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <c:choose>
				<c:when test="${empty clientMaster}">
				 	<h6 class="m-0 font-weight-bold text-primary">Add New Client Master</h6>											   
				</c:when>
				<c:otherwise>
				  	<h6 class="m-0 font-weight-bold text-primary">Update Client Master Details</h6>
				</c:otherwise>
			</c:choose>
        </div>
        <div class="card-body">
            <div class="row">
            	<div class="col-lg-12">
            		<div class="form-group">
            			<label>Company Name</label>
				    	<input type="text" class="form-control form-control-sm" id="cm_name" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-12">
            		<div class="form-group">
						<label for="exampleFormControlTextarea1">Client Description</label>
						<textarea class="form-control" id="cm_description" rows="4"></textarea>
					</div>
            	</div>
            	<div class="col-lg-4">
 				  	<div class="form-group">
	            		<label>Company Type</label>
	            		<select id="cm_companyType" class="form-control form-control-sm" aria-label="Default select example" >
							<option <c:if test="${clientMaster.company_type eq 'IT Services'}" >Selected</c:if> value="IT Services">IT Services</option>
							<option <c:if test="${clientMaster.company_type eq 'IT Products'}" >Selected</c:if> value="IT Products">IT Products</option>
							<option <c:if test="${clientMaster.company_type eq 'Captive Multinational'}" >Selected</c:if> value="Captive Multinational">Captive Multinational</option>
							<option <c:if test="${clientMaster.company_type eq 'Retail'}" >Selected</c:if> value="Retail">Retail</option>
							<option <c:if test="${clientMaster.company_type eq 'eCommerce'}" >Selected</c:if> value="eCommerce">eCommerce</option>
							<option <c:if test="${clientMaster.company_type eq 'Startup'}" >Selected</c:if> value="Startup">Startup</option>
						</select>
					</div>
            	</div>
            	<div class="col-lg-4">
            		<div class="form-group">
            			<label>SetUp Date</label>
				    	<input type="text" class="form-control form-control-sm" id="cm_setUp_date" placeholder="">
				  	</div>
            	</div> 
				<div class="col-lg-4">
            		<div class="form-group">
            			<label>Total Placed</label>
				    	<input type="text" class="form-control form-control-sm" id="cm_total_placed" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-12 hide-text">
            		<a href="javascript:void(0)" class="text-primary" onclick="addcontact()">Add Contact Details</a>
            	</div>
            	<div class="col-lg-12 contact">
            		<div class="form-group">
	            		<div id='TextBoxesGroup'>
							<div id="TextBoxDiv1">
								<div class="row">
									<div class="col-lg-6">
										<label>Contact Name : </label>
										<input type="text" class="form-control form-control-sm"  id='cm_contact_name_1' >
									</div>
									<div class="col-lg-6">
										<label>Role Name : </label>
										<input type="text" class="form-control form-control-sm"  id='cm_role_name_1' >
									</div>
									<div class="col-lg-12 mt-2">
										<label>Responsibilities : </label>
										<textarea class="form-control" id="cm_resp_1" rows="4"></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<a href="javascript:void(0)" class="float-left" id="addButton">Add More Contacts</a>
					<a href="javascript:void(0)" class="float-right" id="removeButton">Remove Contacts</a>
            	</div>
            	<div class="col-lg-12 text-center">
            		<c:choose>
						<c:when test="${empty clientMaster}">
						 	<a href="javascript:void(0)" class="btn btn-primary cms-btn" onclick="addOrUpdateClientMaster()">Add Client Master</a>												   
						</c:when>
						<c:otherwise>
						  	<a href="javascript:void(0)" class="btn btn-primary cms-btn" onclick="addOrUpdateClientMaster()">Update Client Master Details</a>
						</c:otherwise>
					</c:choose>
            	</div>
            </div>
        </div>
    </div>
</div>

<script>
<c:choose>
	<c:when test="${empty clientMaster}">
		var id = "";																   
	</c:when>
	<c:otherwise>
		var id = ${clientMaster.id};
	</c:otherwise>
</c:choose>

var counter = 2;

$(document).ready(function(){
	
	$(".contact").hide();
	
	$("#addButton").click(function ()
	{
		var newTextBoxDiv = $(document.createElement('div')).attr("id", 'TextBoxDiv' + counter);
        
		//newTextBoxDiv.after().html('<div class="row"> <div class="col-lg-6 mt-2"><label> Contact Name : </label>' + '<input type="text" name="textbox" class="form-control form-control-sm" id="cm_contact_name_' + counter + '" value="" ></div> <div class="col-lg-6 mt-2"><label> Contact Name : </label>' + '<input type="text" name="textbox" class="form-control form-control-sm" id="cm_role_name_' + counter + '" value="" ></div></div>');
        newTextBoxDiv.after().html('<div class="row"><div class="col-lg-6 mt-2"><label> Contact Name : </label>' + '<input type="text" name="textbox" class="form-control form-control-sm" id="cm_contact_name_' + counter + '" value="" ></div> <div class="col-lg-6 mt-2"><label> Contact Name : </label>' + '<input type="text" name="textbox" class="form-control form-control-sm" id="cm_role_name_' + counter + '" value="" ></div><div class="col-lg-12 mt-2"><label> Resposibilities : </label>' + '<textarea class="form-control" rows="4" id="cm_resp_' + counter + '" ></textarea></div> </div>');
		newTextBoxDiv.appendTo("#TextBoxesGroup");
		counter++;
    });

    $("#removeButton").click(function () 
    {
    	if(counter==1){
            return false;
         }   
        counter--;
		$("#TextBoxDiv" + counter).remove();
		
	});
	
    /*$("#getButtonValue").click(function () 
    {
		var contact_name = '';
		var role_name = '';
		var resp = '';
		for(i=1; i<counter; i++)
		{ 
			contact_name += $('#cm_contact_name_' + i).val();
			role_name += $('#cm_role_name_' + i).val();
			resp += $('#cm_resp_' + i).val();
		}
    });*/
    loadData();
    loadClientContacts(id);
});


function addcontact(){
	$(".contact").show();
	$(".hide-text").hide();
}

$(function() {
	$("#cm_setUp_date").datepicker({
	    changeMonth: true,
	    changeYear: true,
	    yearRange: '1950:2034',
	    dateFormat: 'yy-mm-dd'
	});
}); 

function addOrUpdateClientMaster()
{
	var company_name = $("#cm_name").val();
	var company_description = $("#cm_description").val();
	var companyType = $('#cm_companyType').find(":selected").text();
	var setUp_date = $("#cm_setUp_date").val();
	var total_placed = $("#cm_total_placed").val();
	
	if(company_name == ""){
    	swal("OOPS!", "Please Enter Client Company Name", "error").then(() => {
    		$('html').animate({ scrollTop: $("#company_name").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(company_description == ""){
    	swal("OOPS!", "Please Enter Client Description", "error").then(() => {
    		$('html').animate({ scrollTop: $("#cm_description").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(companyType == ""){
    	swal("OOPS!", "Please Select Company Type", "error").then(() => {
    		$('html').animate({ scrollTop: $("#cm_companyType").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(setUp_date == ""){
    	swal("OOPS!", "Please Enter Setup Date", "error").then(() => {
    		$('html').animate({ scrollTop: $("#cm_setUp_date").offset().top-100 }, "slow");
		})
    	return false;
    }

	if(total_placed == ""){
    	swal("OOPS!", "Please Enter Total Placed", "error").then(() => {
    		$('html').animate({ scrollTop: $("#cm_total_placed").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	var contact_name_array = new Array();
	var role_name_array = new Array();
	var resp_array = new Array();
	
	if($(".contact").is(':visible'))
	{
		for(i=1; i<counter; i++)
		{ 
			var contact_name = $('#cm_contact_name_' + i).val();
			var role_name = $('#cm_role_name_' + i).val();
			var resp = $('#cm_resp_' + i).val();
			
			contact_name_array.push(contact_name);
			role_name_array.push(role_name);
			resp_array.push(resp);
		}
	}
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/addOrUpdateClientMaster", {id: "" + id + "",company_name: "" + company_name + "",company_description: "" + company_description + "",
		companyType: "" + companyType + "",setUp_date: "" + setUp_date + "",total_placed: "" + total_placed + "",contact_name_array: "" + contact_name_array + "",
		role_name_array: "" + role_name_array + "",resp_array: "" + resp_array + "",}, function(data)
	{		
		$.LoadingOverlay("hide");
		
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		if(obj.status_code == 200)
		{

			swal("Success!", obj.msg , "success");
			
			$("#cm_name").val("");
			$("#cm_description").val("");
			$('#cm_companyType').find(":selected").text("");
			$("#cm_setUp_date").val("");
			$('#cm_total_placed').val("");
			
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
	var clientMaster = '${clientMaster}';
	
	var company_name = '${clientMaster.company_name}';
	var company_type = '${clientMaster.company_type}';
	var client_description = '${clientMaster.client_description}';
	var setup_date = '${clientMaster.setup_date}';
	var total_placed = '${clientMaster.total_placed}';
	
	$(function() {
	$("#cm_setUp_date").datepicker({
	        dateFormat: "yy-mm-dd"
	    }).datepicker("setDate", setup_date);
	})
	
	$("#cm_name").val(company_name);
	$("#cm_description").val(client_description);
	$("#cm_companyType").val(company_type);
	$("#cm_total_placed").val(total_placed);
}

function loadClientContacts(id)
{
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/getClientContactList", {id: "" + id + "",}, function(data)
	{		
		$.LoadingOverlay("hide");
		
		var results = $.trim(data);
		var obj = jQuery.parseJSON(results);
		var arr = jQuery.makeArray(obj);
		counter = arr.length;
		
		$(".contact").show();
		$(".hide-text").hide();
		
		var contact_name = arr[0].contact_name;
		var role_name = arr[0].role_name;
		var resp = arr[0].responsibilities;
		
		$('#cm_contact_name_1').val(contact_name);
		$('#cm_role_name_1').val(role_name);
		$('#cm_resp_1').val(resp);
		
		for(i=1; i<arr.length; i++)
		{ 
			var contact_name = arr[i].contact_name;
			var role_name = arr[i].role_name;
			var resp = arr[i].responsibilities;
			
			var newTextBoxDiv = $(document.createElement('div')).attr("id", 'TextBoxDiv' + counter);
	        
			newTextBoxDiv.after().html('<div class="row"><div class="col-lg-6 mt-2"><label> Contact Name : </label>' + '<input type="text" name="textbox" class="form-control form-control-sm" id="cm_contact_name_' + counter + '" value="'+contact_name+'" ></div> <div class="col-lg-6 mt-2"><label> Contact Name : </label>' + '<input type="text" name="textbox" class="form-control form-control-sm" id="cm_role_name_' + counter + '" value="'+role_name+'" ></div><div class="col-lg-12 mt-2"><label> Resposibilities : </label>' + '<textarea class="form-control" rows="4" id="cm_resp_' + counter + '" >'+resp+'</textarea></div> </div>');
			newTextBoxDiv.appendTo("#TextBoxesGroup");
		}
		
	},'text');
}
</script>