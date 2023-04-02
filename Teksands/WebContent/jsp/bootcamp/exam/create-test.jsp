<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
@media (max-width: 768px){	
}
</style>
<script src="/resources/mcq/js/app.js" type="text/javascript"></script>

<script>
<c:choose>
<c:when test="${empty test}">
	var id = "";																   
</c:when>
<c:otherwise>
	var id = ${test.test_id};
</c:otherwise>
</c:choose>

$(document).ready(function() {
	$('#description').summernote({
		  height: 300,
		  minHeight: 300,
		  maxHeight: 300,
		});
	
	$("#description").summernote("code", `${test.test_description}`);

});


function saveTest()
{

	var id = '${test.test_id}';
	
	var name = $("#name").val();
	var description = $('#description').summernote('code');
	var topic1 = $("#topic1").val();
	var topic2 = $("#topic2").val();
	var topic3 = $("#topic3").val();
	var test_time = $("#test_time").val();	
	
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
    if(test_time == ""){
    	swal("OOPS!", "Please Enter Test Time", "error");
	 	return false;
    }
    
    $.ajaxSetup({async:false});
	$.post("/bootcamp/saveOrUpdateTest", {id: "" + id + "",name: "" + name + "", description: "" + description + "",topic1: "" + topic1 + "",topic2: "" + topic2 + "",topic3: "" + topic3 + "",test_time: "" + test_time + ""}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
  			$("#name").val("");
   			$("#description").val("");
   			$("#topic1").val("");
   			$("#topic2").val("");
   			$("#topic3").val("");
   			$("#test_time").val("");
   		    document.location.href = "/bootcamp/list-test";
   			return false;
   		} else {
   			swal("OOPS!", "Please Enter Correct Details", "error");
   		 	return false;
   		}
		
	},'text');
}  
</script>

<div class="col-12 col-xl-auto mb-3">
    <a class="btn btn-sm btn-light text-primary" href="/bootcamp/list-test">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
        Back to Test List
    </a>
</div>
<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
			<c:choose>
				<c:when test="${empty test}">
				 	<h6 class="m-0 font-weight-bold text-primary">Add Test</h6>											   
				</c:when>
				<c:otherwise>
				  	<h6 class="m-0 font-weight-bold text-primary">Update Test Details</h6>
				</c:otherwise>
			</c:choose>
        </div>
        <div class="card-body">
            <div class="row">
				<div class="col-lg-12">
            		<div class="form-group">
						<label>Test Name</label>
						<input type="text" id="name" class="form-control form-control-sm" placeholder="Name" value="${test.test_name}">            			
				  	</div>
            	</div>
				<div class="col-lg-12">
            		<div class="form-group">
						<label>Test Description</label>
                    	<input id="description" class="post-content summernote" name="skills_competencies"></input>				
					</div>
            	</div>
            	<div class="col-lg-3">
            		<div class="form-group">
						<label>Topic 1</label>
		                <input type="text" id="topic1" class="form-control form-control-sm" placeholder="Topic 1" value="${test.test_topic_1}">            			
				  	</div>
            	</div>
            	<div class="col-lg-3">
            			<label>Topic 2</label>
	                   	<input type="text" id="topic2" class="form-control form-control-sm" placeholder="Topic 2" value="${test.test_topic_2}">
            	</div>
            	<div class="col-lg-3">
            		<div class="form-group">
            				<label>Topic 3</label>
	                   		<input type="text" id="topic3" class="form-control form-control-sm" placeholder="Topic 3" value="${test.test_topic_3}">
				  	</div>
            	</div>         
            	<div class="col-lg-3">
            		<div class="form-group">
            				<label>Test Time in Minutes</label>
	                   		<input type="number" id="test_time" class="form-control form-control-sm" placeholder="Test Time" value="${test.test_time}">
				  	</div>
            	</div>             	
				<div class="col-lg-12 text-center mt-3">
					<c:choose>
						<c:when test="${empty test}">
						 	<a href="javascript:void(0)" class="btn btn-primary cms-btn" onclick="saveTest()">Add Test</a>												   
						</c:when>
						<c:otherwise>
						  	<a href="javascript:void(0)" class="btn btn-primary cms-btn" onclick="saveTest()">Update Details</a>
						</c:otherwise>
					</c:choose>	
            	</div>
            </div>
        </div>
    </div>
</div>
