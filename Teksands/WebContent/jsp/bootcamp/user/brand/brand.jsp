<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<section>
	<div class="container py-2">
		<div class="row">
			<div class="col-lg-4">
				<div class="card mb-4">
					<div class="card-header">	
					<div class="col-lg-4">
						<c:choose>
							<c:when test="${brand.active}">
								<span class="btn btn btn-success cms-btn-xs cms-btn float-left">Active</span>
							</c:when>
							<c:otherwise>
								<span class="btn btn btn btn-warning cms-btn-xs cms-btn float-left">Inactive</span>
							</c:otherwise>
							</c:choose>
							</div>
						<%-- <a href="/bootcamp/add-update-client?brand_id=${brand.id}&source=view_brand" type="button" class="btn btn-success cms-btn-xs cms-btn float-right">Add Client</a> --%>
						<c:choose>
						    <c:when test="${brand.active}">
								<a href="javascript:void(0)" onclick="activateDeactivateBrand(${brand.id},2)" type="button" class="btn btn btn-danger cms-btn-xs cms-btn float-right">Deactivate</a>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0)" onclick="activateDeactivateBrand(${brand.id},1)" type="button" class="btn btn btn-success cms-btn-xs cms-btn float-right">Activate</a>
							</c:otherwise>
						</c:choose>				
						<a href="/bootcamp/edit-brand" type="button" class="btn btn-primary cms-btn-xs cms-btn float-right mr-2">Edit</a>						
					</div>
					<div class="card-body text-center p-0">
						<c:if test="${not empty brand.name}">
							<p class="font-weight-bold text-primary mb-0 mt-3"><c:out value="${brand.name}"></c:out></p>
							<small><a href="<c:out value="${brand.website}"></c:out>" class="text-secondary" target="_blank"><c:out value="${brand.website}"></c:out></a></small>
						</c:if>
						<ul class="list-group list-group-flush rounded-3">
							<c:if test="${not empty brand.cin}">
								<li class="list-group-item d-flex justify-content-between p-3 text-left">
									<p class="mb-0"><b>CIN : </b> <c:out value="${brand.cin}"></c:out></p>
								</li>
							</c:if>
							<c:if test="${not empty brand.gst}">
								<li class="list-group-item d-flex justify-content-between p-3 text-left">
									<p class="mb-0"><b>GST :</b> <c:out value="${brand.gst}"></c:out></p>
								</li>
							</c:if>
							<c:if test="${not empty brand.pan}">
								<li class="list-group-item d-flex justify-content-between p-3 text-left">
									<p class="mb-0"><b>PAN :</b> <c:out value="${brand.pan}"></c:out></p>
								</li>
							</c:if>
							<c:if test="${not empty brand.created_date}">
								<li class="list-group-item d-flex justify-content-between p-3 text-left rounded">
									<p class="mb-0"><b>Date of Created :</b> <fmt:formatDate pattern="dd-MM-yyyy" value="${brand.created_date}" /></p>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-8">
				<c:if test="${not empty brand.description}">
					<div class="card">
						<div class="card-header">
							<p class="mb-0 font-weight-bold">Description</p>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-lg-12">
									<p class="text-justify"><c:out value="${brand.description}"></c:out></p>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<div class="row mt-3">
					<c:if test="${not empty brand.address || not empty brand.city || not empty brand.state || not empty brand.country || not empty brand.pinocde}">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-lg-12">
											<p class="font-weight-bold">Address: </p>
											<p class="mb-0">
												<c:out value="${brand.address}"></c:out>,
												<c:out value="${brand.city}"></c:out>,
												<c:out value="${brand.state}"></c:out>,
												<c:out value="${brand.country}"></c:out> - <c:out value="${brand.pinocde}"></c:out>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${not empty brand.nature_of_business || not empty brand.product_and_service || not empty brand.total_no_employee || not empty brand.annual_revenue}">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body p-3">
									<div class="row">
										<div class="col-lg-12">
											<ul class="list-group list-group-flush rounded-3">
												<c:if test="${not empty brand.nature_of_business}">
													<li class="list-group-item border-bottom-0 d-flex justify-content-between p-0 text-left">
														<p class="mb-1"><b>Nature of Business :</b> <c:out value="${brand.nature_of_business}"></c:out></p>
													</li>
												</c:if>
												<c:if test="${not empty brand.product_and_service}">
													<li class="list-group-item border-bottom-0 d-flex justify-content-between p-0 text-left">
														<p class="mb-1 mt-1"><b>Product & Services :</b> <c:out value="${brand.product_and_service}"></c:out></p>
													</li>
												</c:if>
												<c:if test="${not empty brand.total_no_employee}">
													<li class="list-group-item border-bottom-0 d-flex justify-content-between p-0 text-left">
														<p class="mb-1 mt-1"><b>Total Employees :</b> <c:out value="${brand.total_no_employee}"></c:out></p>
													</li>
												</c:if>
												<c:if test="${not empty brand.annual_revenue}">
													<li class="list-group-item border-bottom-0 d-flex justify-content-between p-0 text-left">
														<p class="mb-0 mt-1"><b>Annual Revenue :</b> <c:out value="${brand.annual_revenue}"></c:out></p>
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
			<div class="col-lg-12 mt-3">
				<div class="card shadow mb-4">
			        <div class="card-header py-3">
			            <div class="row">
			            	<div class="col-lg-6">
			            		<h6 class="m-0 font-weight-bold text-primary float-left">Brand Directors</h6>
			            	</div>
			            	<div class="col-lg-6">
			            		<a href="javascript:void(0)" class="btn btn-primary cms-btn cms-btn-xs float-right" onclick="showAddNewDiorectorModal()">Add Directors</a>
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
			                            <th>Email</th>
			                            <th>Mobile</th>
			                            <th>Notes</th>
			                            <th>Created Date</th>
			                            <th>Action</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${brandDirectors}" var="directors">
				                        <tr>
				                            <td><c:out value="${directors.name}" /></td>
				                            <td><c:out value="${directors.designation}" /></td>
				                            <td><c:out value="${directors.email}" /></td>
				                            <td><c:out value="${directors.mobile}" /></td>
				                            <td><c:out value="${directors.notes}" /></td>
				                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${directors.created_date}" /></td>
				                            <td class="text-center">    
			                                    <div class="dropdown custom-dropdown">
			                                        <a class="dropdown-toggle font-20 text-primary" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                                            <i class="fas fa-cog"></i>
			                                        </a>
			                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink1" style="will-change: transform;">
			                                            <a class="dropdown-item" href="javascript:void(0)" onclick="editBrandDirector(${directors.id})">Edit</a>
			                                            <a class="dropdown-item" href="javascript:void(0)" onclick="deleteBrandDirectorById(${directors.id})">Delete</a>
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

<div id="edit_brand_director" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
	        	<h5 class="modal-title" id="brandDirectorTitle">Add Brand Director</h5>
	        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          		<span aria-hidden="true">&times;</span>
	        	</button>
	      	</div>
	      	<form id="addUpdateBrandDirectorForm" role="form" method="post" enctype="multipart/form-data">
		      	<div class="modal-body">
		      		<div class="row">
		        		<div class="col-lg-6">
							<div class="form-group form-validate">
	           					<label class="required">Name</label>
				    			<input type="text" class="form-control" id="brand_director_name" name="brand_director_name">
				  			</div>
	       				</div>
	       				<div class="col-lg-6">
	       					<div class="form-group form-validate">
	           					<label>Designation</label>
				    			<input type="text" class="form-control" id="brand_director_designation" name="brand_director_designation">
				  			</div>
	       				</div>
	       				<div class="col-lg-6">
	       					<div class="form-group form-validate">
	           					<label>Mobile</label>
				    			<input type="text" class="form-control" id="brand_director_mobile" name="brand_director_mobile">
				  			</div>
	       				</div>
	       				<div class="col-lg-6">
	       					<div class="form-group form-validate">
	           					<label class="required">Email</label>
				    			<input type="text" class="form-control" id="brand_director_email" name="brand_director_email">
				  			</div>
	       				</div>
	       				<div class="col-lg-12">
	           				<div class="form-group form-validate">
	           					<label>Notes</label>
				    			<textarea rows="3" maxlength="500" class="form-control" id="brand_director_notes" name="brand_director_notes"></textarea>
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
	<c:when test="${empty brand}">
	  var brand_id = "";																   
	</c:when>
	<c:otherwise>
	  var brand_id = "${brand.id}";
	</c:otherwise>
</c:choose>

var brand_director_id = "";

$(document).ready(function() 
{
	$( "#addUpdateBrandDirectorForm" ).validate( {
    	rules: {
    		brand_director_name: {
				required: true,
				minlength: 2
			},
			brand_director_email: {
				required: true,
				email: true,
			},
		},
		messages: {
			brand_director_name: "Please Enter Name",
			brand_director_email: "Please Enter Email",
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
		addUpdateBrandDirectorByBrandId();
	}
} );

var status ="0";

function activateDeactivateBrand(id,status)
{
    $.ajaxSetup({async:false});
	$.post("/bootcamp/brandactivateDeactivateBrand", {id: "" + id + "", }, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
  		if(obj.status_code == 200)
   		{
  			if(status == 1)
  			{
	  			$.toast({
				    heading: 'Success',
				    text: 'The Brand activated Successfully',
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
	  				    text: 'The Brand Deactivated Successfully',
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

function showAddNewDiorectorModal()
{
	$("#edit_brand_director").modal('show');
}

function addUpdateBrandDirectorByBrandId()
{
	var brand_director_name = $("#brand_director_name").val();
	var brand_director_designation = $("#brand_director_designation").val();
	var brand_director_mobile = $("#brand_director_mobile").val();
	var brand_director_email = $("#brand_director_email").val();
	var brand_director_notes = $("#brand_director_notes").val();
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/addUpdateBrandDirectorByBrandId", {brand_id: "" + brand_id + "",brand_director_id: "" + brand_director_id + "",
		brand_director_name: "" + brand_director_name + "",
		brand_director_designation: "" + brand_director_designation + "",
		brand_director_mobile: "" + brand_director_mobile + "",
		brand_director_email: "" + brand_director_email + "",
		brand_director_notes: "" + brand_director_notes + "",
	}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
  		if(obj.status_code == 200)
		{
  			$( '#addUpdateBrandDirectorForm' ).each(function(){
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

function editBrandDirector(id)
{
	brand_director_id = id;
	
	$('#brandDirectorTitle').html("Edit Brand Director");
	$('#submit').html("Update Director Details");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/getBrandDirectorById", {brand_director_id: "" + brand_director_id + "", }, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
	  	$("#brand_director_name").val(obj.name);
	  	$("#brand_director_designation").val(obj.designation);
	  	$("#brand_director_mobile").val(obj.mobile);
	  	$("#brand_director_email").val(obj.email);
	  	$("#brand_director_notes").val(obj.notes);
	  	
	  	$("#edit_brand_director").modal('show');
		
	},'text');
}

function deleteBrandDirectorById(id)
{
	var brand_director_id = id;
	
	swal({
      title: 'Are you sure to Delete This Brand Director?',
      text: "You won't be able to revert this!",
      type: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Confirm',
      padding: '2em'
    }).then(function(result) {
      if (result.value) {
    	  
   	  	$.LoadingOverlay("show");
   	  
   		$.ajaxSetup({async:false});
   		$.post("/bootcamp/brandeleteDirectorById", {brand_director_id: "" + brand_director_id + "", }, function(data)
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