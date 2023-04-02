<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="container-fluid">
	<div class="col-12 col-xl-auto mb-3 pl-0 ">
		<a class="btn btn-sm btn-light text-primary pl-0" href="/bootcamp/brand-dashboard">
	        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
	        Back to Dashboard
	    </a>
	</div>
    <div class="row">
    	<div class="col-lg-12">
    		<div class="card shadow mb-4">
		        <div class="card-header py-3">
		            <div class="row">
		            	<div class="col-lg-6"><h6 class="m-0 font-weight-bold text-primary float-left">Interview Status</h6></div>
		            	<div class="col-lg-6"><a href="javascript:void(0)" onclick="showAddNewParameterModal()" class="btn btn-primary cms-btn cms-btn-xs float-right">Add Interview Status</a></div>
		            </div>
		        </div>
		        <div class="card-body">
		        	<div class="table-responsive">
		                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		                    <thead>
		                        <tr>
		                            <th>Title</th> 
		                            <th>Description</th>                            
		                            <th>Action</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                    	<c:forEach items="${cmsParameter}" var="parameter">
			                        <tr>
			                            <td><c:out value="${parameter.para_title}" /></td>	    
			                            <td><c:out value="${parameter.para_description}" /></td>	                            
			                            <td class="text-center">    
		                                    <div class="dropdown custom-dropdown">
		                                        <a class="dropdown-toggle font-20 text-primary" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                                            <i class="fas fa-cog"></i>
		                                        </a>
		                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink1" style="will-change: transform;">
		                                            <a class="dropdown-item" href="javascript:void(0)" onclick="editParameter(${parameter.id})">Edit</a>
		                                            <a class="dropdown-item" href="javascript:void(0)" onclick="deleteParameterById(${parameter.id})">Delete</a>
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

<div id="add_new_brand_parameter" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
	        	<h5 class="modal-title" id="brandUserTitle">Add New Interview Status</h5>
	        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          		<span aria-hidden="true">&times;</span>
	        	</button>
	      	</div>
	      	<div class="modal-body">
		      	<form id="addParameter" role="form" method="post" enctype="multipart/form-data">
		        	<div class="row">
		        		<div class="col-lg-12">
		        			<div class="form-group form-validate">
		            			<label class="required">Interview Status Title</label>
						    	<input type="text" class="form-control" id="para_title" name="para_title" placeholder="">
						  	</div>
		        		</div>
		        		<div class="col-lg-12">
		        			<div class="form-group form-validate">
		            			<label>Interview Status Description</label>
						    	<textarea class="form-control" id="para_description" name="para_description" rows="3"></textarea>
						  	</div>
		        		</div>		
		        		<div class="col-lg-12 text-center">
		            		<button type="submit" value="submit" id="submit" class="btn btn-primary cms-btn"> Add New Interview Status</button>
		            	</div>
		        	</div>
	        	</form>
        	</div>
		</div>
  	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>

<script>

var parameter_id = "";

$( document ).ready(function() {
	
	
	$('.jobsList').hide();
	
	jQuery.validator.addMethod("validate_email", function(value, element) {

	    if (/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(value)) {
	        return true;
	    } else {
	        return false;
	    }
	}, "Please enter a valid Email.");
	
	
	$('#addParameter').validate({
		rules: {
			para_title: {
				required: true,
			},
	    },
	    messages: {
	    	para_title: "Please Enter the Interview Status Title",
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
			addBrandNewParameter();
	    }
	});
});

function showAddNewParameterModal()
{
	$( '#addParameter' ).each(function(){
	    this.reset();
	});
	
	$('#brandUserTitle').html("Add Interview Status");
	$('#submit').html("Add Interview Status");
	
	$("#add_new_brand_parameter").modal('show');
}

function addBrandNewParameter()
{
	var para_type = "interview_status";
	var para_title = $("#para_title").val();
	var para_description = $("#para_description").val();
	
	$.LoadingOverlay("show");
	  
	$.ajaxSetup({async:false});
	$.post("/bootcamp/addNewParameterForBrand", {
		id: "" + parameter_id + "",
		para_type: "" + para_type + "",
		para_title: "" + para_title + "",
		para_description: "" + para_description + "",
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
			    		window.location.href = "/bootcamp/interview-status"
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

function editParameter(id)
{
	parameter_id = id;
	
	$('#brandUserTitle').html("Edit Interview Status");
	$('#submit').html("Update Interview Status");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/getParameterById", {id: "" + parameter_id + "", }, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
	  	$("#para_type").val(obj.para_type);
	  	$("#para_title").val(obj.para_title);
	  	$("#para_description").val(obj.para_description);
	  	
	  	$("#add_new_brand_parameter").modal('show');
		
	},'text');
}

function deleteParameterById(id)
{
	var param_id = id;
	
	$.LoadingOverlay("show");
 	  
	$.ajaxSetup({async:false});
	$.post("/bootcamp/deleteParameterById", {id: "" + param_id + "", }, function(data)
	{		
		$.LoadingOverlay("hide");
		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
  		if(obj.status_code == 200)
   		{
  			$("#add_new_brand_parameter").modal('hide');
  			
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

</script>