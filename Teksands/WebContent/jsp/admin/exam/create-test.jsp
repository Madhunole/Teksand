<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
@media (max-width: 768px){	
}
</style>
<script src="/resources/mcq/js/app.js" type="text/javascript"></script>

<script>
function saveTest()
{
	var name = $("#name").val();
	var description = $("#description").val();
	var topic1 = $("#topic1").val();
	var topic2 = $("#topic2").val();
	var topic3 = $("#topic3").val();	
	
	if(name == ""){
    	swal("OOPS!", "Please Enter Test Name", "error");
	 	return false;
    }

    if(description == ""){
    	swal("OOPS!", "Please Enter Test Descriptions", "error");
	 	return false;
    }    

    if(topic1 == ""){
    	swal("OOPS!", "Please Enter Topic 1", "error");
	 	return false;
    }

    $.ajaxSetup({async:false});
	$.post("/admin/saveOrUpdateTest", {name: "" + name + "", description: "" + description + "",topic1: "" + topic1 + "",topic2: "" + topic2 + "",topic3: "" + topic3 + "",}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
  			
   			swal("Thank you", "Test Created Successfully", "success");

   			$("#name").val("");
   			$("#description").val("");
   			$("#topic1").val("");
   			$("#topic2").val("");
   			$("#topic3").val("");
   			return false;
   		} else {
   			swal("OOPS!", "Please Enter Correct Details", "error");
   		 	return false;
   		}
		
	},'text');
}  
</script>

<div id="main">
	<div class="visible-md visible-xs visible-sm mobile-menu">
	    <button type="button" data-toggle="offcanvas"><i class="fa fa-bars"></i></button>
	</div>
	<section class="section bgw">
	    <div class="container-fluid">
	        <div class="section-title-2 text-center course-title">
	            <h2>Create Test</h2>
	            <hr>
	        </div><!-- end section-title -->
			<div class="edit-profile loginform">
				<div class="form-group">
               		<label>Test Name</label>
                   	<input type="text" id="name" class="form-control" placeholder="Name" value="${test.name}">
				</div>
				<div class="form-group">
                	<label>Test Description</label>
                    <textarea class="form-control" id="description" placeholder="Description">${test.description}</textarea>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label>Topic 1</label>
		                   	<input type="text" id="topic1" class="form-control" placeholder="Topic 1" value="${test.topic1}">
	                   	</div>
					</div>
					<div class="col-md-4">
					<div class="form-group">
							<label>Topic 2</label>
	                   		<input type="text" id="topic2" class="form-control" placeholder="Topic 2" value="${test.topic2}">
	                   	</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label>Topic 3</label>
	                   		<input type="text" id="topic3" class="form-control" placeholder="Topic 3" value="${test.topic3}">
	                   	</div>      
					</div>
				</div>           
               	<p class="text-center">
          			<button type="submit" class="btn btn-primary btn-square" onclick="saveTest()">Create Test</button>
          		</p>          		  	  
			</div>
	    </div>	
	</section><!-- end section -->
</div>