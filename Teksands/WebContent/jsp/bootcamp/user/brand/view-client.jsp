<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<section>
	<div class="container py-2">
		<div class="col-12 col-xl-auto mb-3 pl-0 ">
			<a class="btn btn-sm btn-light text-primary pl-0" href="/bootcamp/brand-clients">
		       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
		       Back to Clients 
		    </a>
		</div>
		<div class="row">
			<div class="col-lg-4">
				<div class="card mb-4">
					<div class="card-header">
					<div class="col-lg-4">
						<c:choose>
							<c:when test="${client.active}">
								<span class="btn btn btn-success cms-btn-xs cms-btn float-left">Active</span>
							</c:when>
							<c:otherwise>
								<span class="btn btn btn btn-warning cms-btn-xs cms-btn float-left">Inactive</span>
							</c:otherwise>
							</c:choose>
							</div>
						<%-- <a href="/bootcamp/add-update-client?brand_id=${brand.id}&source=view_brand" type="button" class="btn btn-success cms-btn-xs cms-btn float-right">Add Client</a> --%>
						<c:choose>
						    <c:when test="${client.active}">
								<a href="javascript:void(0)" onclick="activateDeactivateClient(${client.id},2)" type="button" class="btn btn btn-danger cms-btn-xs cms-btn float-right">Deactivate</a>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0)" onclick="activateDeactivateClient(${client.id},1)" type="button" class="btn btn btn-success cms-btn-xs cms-btn float-right">Activate</a>
							</c:otherwise>
						</c:choose>
						<a href="/bootcamp/brand-add-update-client?client_id=${client.id}&source=view_client" type="button" class="btn btn-primary cms-btn-xs cms-btn float-right mr-2">Edit</a>
					</div>
					<div class="card-body text-center p-0">
						<c:if test="${not empty client.name}">
							<p class="font-weight-bold text-primary mb-0 mt-3"><c:out value="${client.name}"></c:out></p>
							<small><a href="<c:out value="${client.website}"></c:out>" class="text-secondary" target="_blank"><c:out value="${client.website}"></c:out></a></small>
						</c:if>
						<ul class="list-group list-group-flush rounded-3">
							<c:if test="${not empty client.cin}">
								<li class="list-group-item d-flex justify-content-between p-3 text-left">
									<p class="mb-0"><b>CIN : </b> <c:out value="${client.cin}"></c:out></p>
								</li>
							</c:if>
							<c:if test="${not empty client.gst}">
								<li class="list-group-item d-flex justify-content-between p-3 text-left">
									<p class="mb-0"><b>GST :</b> <c:out value="${client.gst}"></c:out></p>
								</li>
							</c:if>
							<c:if test="${not empty client.pan}">
								<li class="list-group-item d-flex justify-content-between p-3 text-left">
									<p class="mb-0"><b>PAN :</b> <c:out value="${client.pan}"></c:out></p>
								</li>
							</c:if>
							<c:if test="${not empty client.created_date}">
								<li class="list-group-item d-flex justify-content-between p-3 text-left rounded">
									<p class="mb-0"><b>Date of Created :</b> <fmt:formatDate pattern="dd-MM-yyyy" value="${client.created_date}" /></p>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-8">
				<c:if test="${not empty client.description}">
					<div class="card">
						<div class="card-header">
							<p class="mb-0 font-weight-bold">Description</p>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-lg-12">
									<p class="text-justify"><c:out value="${client.description}"></c:out></p>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<div class="row mt-3">
					<c:if test="${not empty client.address || not empty client.city || not empty client.state || not empty client.country || not empty client.pinocde}">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-lg-12">
											<p class="font-weight-bold">Address: </p>
											<p class="mb-0">
												<c:out value="${client.address}"></c:out>,
												<c:out value="${client.city}"></c:out>,
												<c:out value="${client.state}"></c:out>,
												<c:out value="${client.country}"></c:out> - <c:out value="${client.pinocde}"></c:out>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${not empty client.nature_of_business || not empty client.product_and_service || not empty client.total_no_employee || not empty client.annual_revenue}">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body p-3">
									<div class="row">
										<div class="col-lg-12">
											<ul class="list-group list-group-flush rounded-3">
												<c:if test="${not empty client.nature_of_business}">
													<li class="list-group-item border-bottom-0 d-flex justify-content-between p-0 text-left">
														<p class="mb-1"><b>Nature of Business :</b> <c:out value="${client.nature_of_business}"></c:out></p>
													</li>
												</c:if>
												<c:if test="${not empty client.product_and_service}">
													<li class="list-group-item border-bottom-0 d-flex justify-content-between p-0 text-left">
														<p class="mb-1 mt-1"><b>Product & Services :</b> <c:out value="${client.product_and_service}"></c:out></p>
													</li>
												</c:if>
												<c:if test="${not empty client.total_no_employee}">
													<li class="list-group-item border-bottom-0 d-flex justify-content-between p-0 text-left">
														<p class="mb-1 mt-1"><b>Total Employees :</b> <c:out value="${client.total_no_employee}"></c:out></p>
													</li>
												</c:if>
												<c:if test="${not empty client.annual_revenue}">
													<li class="list-group-item border-bottom-0 d-flex justify-content-between p-0 text-left">
														<p class="mb-0 mt-1"><b>Annual Revenue :</b> <c:out value="${client.annual_revenue}"></c:out></p>
													</li>
												</c:if>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</div>
			</div>
			<div class="col-lg-12 py-3">
				<div class="card shadow mb-4">
			        <div class="card-header py-3">
			            <div class="row">
			            	<div class="col-lg-6">
			            		<h6 class="m-0 font-weight-bold text-primary float-left">Client Contacts</h6>
			            	</div>
			            	<div class="col-lg-6">
			            		<a href="javascript:void(0)" class="btn btn-primary cms-btn cms-btn-xs float-right" onclick="showAddNewClientContactModal()">Add Client Contact</a>
			            	</div>
			            </div>
			        </div>
			        <div class="card-body">
			            <div class="table-responsive">
			                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			                    <thead>
			                        <tr>
			                            <th>Name</th>
			                            <th>Designation</th>
			                            <th>Department</th>
			                            <th>Email</th>
			                            <th>Mobile</th>			                            
			                            <th>Notes</th>
			                            <th>Created Date</th>
			                            <th>Action</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${clientcontacts}" var="clientcontacts">
				                        <tr>
				                            <td><c:out value="${clientcontacts.name}" /></td>
				                            <td><c:out value="${clientcontacts.designation}" /></td>
				                            <td><c:out value="${clientcontacts.department}" /></td>
				                            <td><c:out value="${clientcontacts.email}" /></td>
				                            <td><c:out value="${clientcontacts.mobile}" /></td>
				                            <td><c:out value="${clientcontacts.notes}" /></td>
				                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${clientcontacts.created_date}" /></td>
				                            <td class="text-center">    
			                                    <div class="dropdown custom-dropdown">
			                                        <a class="dropdown-toggle font-20 text-primary" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                                            <i class="fas fa-cog"></i>
			                                        </a>
			                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink1" style="will-change: transform;">
			                                            <a class="dropdown-item" href="javascript:void(0)" onclick="editClientContact(${clientcontacts.id})">Edit</a>
			                                            <a class="dropdown-item" href="javascript:void(0)" onclick="deleteClientContactById(${clientcontacts.id})">Delete</a>
			                                        </div>
			                                    </div>
			                                </td>
				                        </tr>
			                        </c:forEach>
			                    </tbody>
			                </table>
			            </div>
			        </div>
			    </div>
			</div>
		</div>
	</div>
</section>

<div id="edit_client_contact" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
	        	<h5 class="modal-title" id="brandDirectorTitle">Add New Client Contact</h5>
	        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          		<span aria-hidden="true">&times;</span>
	        	</button>
	      	</div>
	      	<form id="addUpdateClientContactForm" role="form" method="post" enctype="multipart/form-data">
		      	<div class="modal-body">
		      		<div class="row">
		        		<div class="col-lg-6">
							<div class="form-group form-validate">
	           					<label class="required">Name</label>
				    			<input type="text" class="form-control" id="client_contact_name" name="client_contact_name">
				  			</div>
	       				</div>
	       				<div class="col-lg-6">
	       					<div class="form-group form-validate">
	           					<label>Designation</label>
				    			<input type="text" class="form-control" id="client_contact_designation" name="client_contact_designation">
				  			</div>
	       				</div>
	       				<div class="col-lg-6">
	       					<div class="form-group form-validate">
	           					<label>Department</label>
				    			<input type="text" class="form-control" id="client_contact_department" name="client_contact_department">
				  			</div>
	       				</div>
	       				<div class="col-lg-6">
	       					<div class="form-group form-validate">
	           					<label>Mobile</label>
				    			<input type="text" class="form-control" id="client_contact_mobile" name="client_contact_mobile">
				  			</div>
	       				</div>
	       				<div class="col-lg-12">
	       					<div class="form-group form-validate">
	           					<label class="required">Email</label>
				    			<input type="text" class="form-control" id="client_contact_email" name="client_contact_email">
				  			</div>
	       				</div>	       				
	       				<div class="col-lg-12">
	           				<div class="form-group form-validate">
	           					<label>Notes</label>
				    			<textarea rows="3" maxlength="500" class="form-control" id="client_contact_notes" name="client_contact_notes"></textarea>
				  			</div>
	           			</div>
		        	</div>
		      	</div>
		      	<div class="modal-footer">
		        	<button type="button" class="btn btn-secondary btn-sm cms-btn" data-dismiss="modal">Close</button>
		        	<button type="submit" value="submit" id="submit" class="btn btn-primary btn-sm cms-btn"> Add New Director</button>
		      	</div>
	      	</form>
		</div>
  	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>

<script>

<c:choose>
	<c:when test="${empty client}">
	  var client_id = "";																   
	</c:when>
	<c:otherwise>
	  var client_id = "${client.id}";
	</c:otherwise>
</c:choose>

var client_contact_id = "";

$(document).ready(function() 
{
	$( "#addUpdateClientContactForm" ).validate( {
    	rules: {
    		client_contact_name: {
				required: true,
				minlength: 2
			},
			client_contact_email: {
				required: true,
				email: true,
			},
		},
		messages: {
			client_contact_name: "Please Enter Name",
			client_contact_email: "Please Enter Email",
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
		addUpdateClientContactByBrandId();
	}
} );

var status ="0";

function activateDeactivateClient(id,status)
{
    $.ajaxSetup({async:false});
	$.post("/bootcamp/brandactivateDeactivateClient", {id: "" + id + "", }, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
  		if(obj.status_code == 200)
   		{
  			if(status == 1)
  			{
	  			$.toast({
				    heading: 'Success',
				    text: 'The Client activated Successfully',
				    icon: 'success',
				    position: 'top-right',
				    bgColor: '#d4edda',
				    textColor: '#155724',
				    afterShown: function () {
				    	setTimeout(function() {
				    		location.reload();
				    	}, 5000);
				    },
				}) 
   			}
	  		else
	  		{
	  			if(status == 2)
	  	  			$.toast({
	  				    heading: 'Success',
	  				    text: 'The Client Deactivated Successfully',
	  				    icon: 'success',
	  				    position: 'top-right',
	  				    bgColor: '#d4edda',
	  				    textColor: '#155724',
	  				    afterShown: function () {
	  				    	setTimeout(function() {
	  				    		location.reload();
	  				    	}, 5000);
	  				    },
	  				}) 
	  			
	  		}  	
   			
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

function branddeleteClientById(id)
{
	var client_id = id;
	swal({
      title: 'Are you sure to Delete This Client?',
      text: "You won't be able to revert this!",
      type: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Confirm',
      padding: '2em'
    }).then(function(result) {
      if (result.value) {
    	  
   	  	$.LoadingOverlay("show");
   	  
   		$.ajaxSetup({async:false});
   		$.post("/bootcamp/branddeleteClientById", {client_id: "" + client_id + "", }, function(data)
   		{		
   			$.LoadingOverlay("hide");
   			
   			var result = $.trim(data);
   	  		var obj = jQuery.parseJSON(result);
   	  		
   	  		if(obj.status_code == 200)
   	   		{
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
    })
}

function showAddNewClientContactModal()
{
	$( '#addUpdateClientContactForm' ).each(function(){
	    this.reset();
	});
	
	$('#brandDirectorTitle').html("Add New Client Contact");
	$('#submit').html("Add New Client Contact");
	
	$("#edit_client_contact").modal('show');
}

function addUpdateClientContactByBrandId()
{	
	var client_contact_name = $("#client_contact_name").val();
	var client_contact_designation = $("#client_contact_designation").val();
	var client_contact_department = $("#client_contact_department").val();
	var client_contact_mobile = $("#client_contact_mobile").val();
	var client_contact_email = $("#client_contact_email").val();
	var client_contact_notes = $("#client_contact_notes").val();
	$.ajaxSetup({async:false});
	$.post("/bootcamp/brandaddUpdateClientContact", {client_id: "" + client_id + "", client_contact_id: "" + client_contact_id + "",
		client_contact_name: "" + client_contact_name + "",
		client_contact_designation: "" + client_contact_designation + "",
		client_contact_department: "" + client_contact_department + "",
		client_contact_mobile: "" + client_contact_mobile + "",
		client_contact_email: "" + client_contact_email + "",
		client_contact_notes: "" + client_contact_notes + "",
	}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
  		if(obj.status_code == 200)
		{
  			$( '#addUpdateClientContactForm' ).each(function(){
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
			    		location.reload();
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

function editClientContact(id)
{
	client_contact_id = id;
	$('#brandDirectorTitle').html("Edit Client Contact");
	$('#submit').html("Update Client Contact Details");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/getClientContactById", {client_contact_id: "" + client_contact_id + "", }, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
	  	$("#client_contact_name").val(obj.name);
	  	$("#client_contact_designation").val(obj.designation);
		$("#client_contact_department").val(obj.department);
	  	$("#client_contact_mobile").val(obj.mobile);
	  	$("#client_contact_email").val(obj.email);
	  	$("#client_contact_notes").val(obj.notes);
	  	
	  	$("#edit_client_contact").modal('show');
		
	},'text');
}

function deleteClientContactById(id)
{
	var client_contact_id = id;
	
	swal({
      title: 'Are you sure to Delete This Client Contact?',
      text: "You won't be able to revert this!",
      type: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Confirm',
      padding: '2em'
    }).then(function(result) {
      if (result.value) {
    	  
   	  	$.LoadingOverlay("show");
   	  
   		$.ajaxSetup({async:false});
   		$.post("/bootcamp/branddeleteClientContactById", {client_contact_id: "" + client_contact_id + "", }, function(data)
   		{		
   			$.LoadingOverlay("hide");
   			
   			var result = $.trim(data);
   	  		var obj = jQuery.parseJSON(result);
   	  		
   	  		if(obj.status_code == 200)
   	   		{
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
				    		location.reload();
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
    })
}
</script>