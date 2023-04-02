<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css">  

<style>
.multiselect-container>li>a>label {
    padding: 3px 20px 3px 10px !important;
}
.select_option {
	font-weight: normal;
    display: block;
    white-space: nowrap;
    min-height: 1.2em;
    padding: 0px 2px 1px;
}
.dropdown-menu[x-placement^=bottom], .dropdown-menu[x-placement^=left], .dropdown-menu[x-placement^=right], .dropdown-menu[x-placement^=top] {
    right: 0;
}
li.multiselect-item.multiselect-all {
    padding-top: 0.5rem!important;
}
</style>

<div class="container-fluid">
	<div class="col-12 col-xl-auto mb-3 pl-0 ">
		<a class="btn btn-sm btn-light text-primary pl-0" href="/bootcamp/brand-dashboard">
	        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
	        Back to Dashboard
	    </a>
	</div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <div class="row">
            	<div class="col-lg-6"><h6 class="m-0 font-weight-bold text-primary float-left">User Master</h6></div>
            	<div class="col-lg-6"><a href="/bootcamp/brand-add-update-user" class="btn btn-primary cms-btn cms-btn-xs float-right">Add User</a></div>
            </div>
        </div>
        <div class="card-body">
        	<div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Mobile</th>
                            <th>User Type</th>
                            <th>Created Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${cmsUser}" var="user">
	                        <tr>
	                            <td><c:out value="${user.name}" /></td>
	                            <td><c:out value="${user.email}" /></td>
	                            <td><c:out value="${user.mobile}" /></td>
	                            <c:if test="${user.user_type eq 'clientAdmin'}">
	                            	<td>Client Admin</td>	
	                            </c:if>
	                            <c:if test="${user.user_type eq 'recruiter'}">
	                            	<td>Recruiter</td>	
	                            </c:if>
	                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${user.created_date}" /></td>
	                            <td class="text-center">    
                                    <div class="dropdown custom-dropdown">
                                        <a class="dropdown-toggle font-20 text-primary" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-cog"></i>
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink1" style="will-change: transform;">
                                            <a class="dropdown-item" href="/bootcamp/brand-add-update-user?id=${user.id}">Edit</a>
                                            <a class="dropdown-item" href="javascript:void(0)" onclick="deleteUserById(${user.id})">Delete</a>
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

<div id="add_new_brand_user" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
	        	<h5 class="modal-title" id="brandUserTitle">Add New User</h5>
	        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          		<span aria-hidden="true">&times;</span>
	        	</button>
	      	</div>
	      	<div class="modal-body">
		      	<form id="addNewUser" role="form" method="post" enctype="multipart/form-data">
		        	<div class="row">
		        		<div class="col-lg-12">
		        			<div class="form-group form-validate">
		            			<label class="required">Name</label>
						    	<input type="text" class="form-control" id="brand_user_name" name="brand_user_name" placeholder="">
						  	</div>
		        		</div>
		        		<div class="col-lg-6">
		        			<div class="form-group form-validate">
		            			<label class="required">Email</label>
						    	<input type="text" class="form-control" id="brand_user_email" name="brand_user_email" placeholder="">
						  	</div>
		        		</div>
		        		<div class="col-lg-6">
		        			<div class="form-group form-validate">
		            			<label class="required">Mobile</label>
						    	<input type="text" class="form-control" id="brand_user_mobile" name="brand_user_mobile" placeholder="">
						  	</div>
		        		</div>
		        		<div class="col-lg-6">
		        			<div class="form-group form-validate">
		        				<label class="required">Access Permission</label>
		            			<select id="brand_access_permission" name="brand_access_permission" class="form-control form-control-sm" onchange="showJobsList()">
									<option>Permission</option>
									<option value="7">Client Admin</option>
									<option value="8">Recruiter</option>
								</select>
						  	</div>
		        		</div>
		        		<div class="col-lg-6 jobsList">
		        			<div class="form-group form-validate">
		        				<div class="row">
		        					<div class="col-lg-12">
		        						<label class="required">Access Permission</label>
		        					</div>
		        					<div class="col-lg-12">
		        						<select id="multiple-checkboxes" multiple="multiple" onchange="getSelectValue()">  
									        <c:forEach items="${jobsMaster}" var="jobs">
												<option class="py-1" value="${jobs.id}"><c:out value="${jobs.role_name}" /></option>									        	
									        </c:forEach>
									    </select>  
		        					</div>
		        				</div>
						  	</div>
		        		</div>
		        		<div class="col-lg-12 text-center">
		            		<button type="submit" value="submit" id="submit" class="btn btn-primary cms-btn"> Add New User</button>
		            	</div>
		        	</div>
	        	</form>
        	</div>
		</div>
  	</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>  
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>


<script>

var brand_user_id = "";

$( document ).ready(function() {
	
	$('#multiple-checkboxes').multiselect({
		buttonWidth: '100%',
		buttonClass: 'form-control form-control-sm',
		nonSelectedText: 'Please Select The Job',
		includeSelectAllOption: true,
		maxHeight: 600,
	});
	
	$('.jobsList').hide();
	
	jQuery.validator.addMethod("validate_email", function(value, element) {

	    if (/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(value)) {
	        return true;
	    } else {
	        return false;
	    }
	}, "Please enter a valid Email.");
	
	$( "#addNewUser" ).validate( {
    	rules: {
    		brand_user_name: {
				required: true,
				minlength: 2
			},
			brand_user_mobile: {
				required: true,
				minlength: 10
			},
			brand_user_email: {
				required: true,
				validate_email : true,
			},
			brand_access_permission: {
				required: true,
			},
		},
		messages: {
			brand_user_name: "Please Enter Name",
			brand_user_mobile: {
				required: "Please Enter Your Mobile",
				minlength: "Please Enter Your 10 Digit Mobile Number"
			},
			brand_user_email: "Please enter a valid Email",
			brand_access_permission: "Please Enter Account Permission",
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
		addBrandNewUser();
	}
} );

function showJobsList()
{
	var selectedValue = $("#brand_access_permission").val();
	
	if(selectedValue == "8"){
		$(".jobsList").show();
	}else{
		$('.jobsList').hide();
	}
}

function showAddNewDiorectorModal()
{
	$( '#addNewUser' ).each(function(){
	    this.reset();
	});
	
	$('#brandUserTitle').html("Add New User");
	$('#submit').html("Add New User");
	
	$("#add_new_brand_user").modal('show');
}

function addBrandNewUser()
{
	var brand_user_name = $("#brand_user_name").val();
	var brand_user_mobile = $("#brand_user_mobile").val();
	var brand_user_email = $("#brand_user_email").val();
	var brand_access_permission = $("#brand_access_permission").val();
	
	$.LoadingOverlay("show");
	  
	$.ajaxSetup({async:false});
	$.post("/bootcamp/addNewUserForBrand", {
		brand_user_id: "" + brand_user_id + "",
		brand_user_name: "" + brand_user_name + "",
		brand_user_mobile: "" + brand_user_mobile + "",
		brand_user_email: "" + brand_user_email + "",
		brand_access_permission: "" + brand_access_permission + "",
	}, function(data)
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
			    		window.location.href = "/bootcamp/users"
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
	brand_user_id = id;
	
	$('#brandUserTitle').html("Edit User Details");
	$('#submit').html("Update User Details");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/getBrandUserById", {brand_user_id: "" + brand_user_id + "", }, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
	  	$("#brand_user_name").val(obj.name);
	  	$("#brand_user_mobile").val(obj.mobile);
	  	$("#brand_user_email").val(obj.email);
	  	$("#brand_access_permission").val(obj.user_type_id);
	  	
	  	$("#add_new_brand_user").modal('show');
		
	},'text');
}

function deleteUserById(id)
{
	var brand_user_id = id;
	
	swal({
	      title: 'Are you sure to Delete This User?',
	      text: "You won't be able to revert this!",
	      type: 'warning',
	      showCancelButton: true,
	      confirmButtonText: 'Confirm',
	      padding: '2em'
	    }).then(function(result) {
	      if (result.value) {
	    	  
	   	  	$.LoadingOverlay("show");
	   	  
	   		$.ajaxSetup({async:false});
	   		$.post("/bootcamp/deleteUserById", {brand_user_id: "" + brand_user_id + "", }, function(data)
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

function getSelectValue()
{
	var selectedValue = $('select#multiple-checkboxes').val();
	console.log("selectedValue = " + selectedValue);
}
</script>