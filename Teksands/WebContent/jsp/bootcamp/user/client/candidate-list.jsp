<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
<style>
.flatpickr-calendar {
    width: 222.875px !important;
}
.error
{
    width: 100% !important;
    margin-top: 10px !important;
    font-size: 12px !important;
    color: #e74a3b !important;
}
</style>

<div class="col-12 col-xl-auto mb-3">
    <a class="btn btn-sm btn-light text-primary" href="/bootcamp/client/dashboard">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
        Back to Dashboard
    </a>
</div>

<!-- Begin Page Content -->
<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <div class="row">
            	<div class="col-lg-6"><h6 class="m-0 font-weight-bold text-primary float-left">Candidate Master</h6></div>
            	<div class="col-lg-6">
            		<a href="/bootcamp/client/add-update-candidate" class="btn btn-primary cms-btn cms-btn-xs float-right">Add Candidate</a>
            		<button class="btn btn-primary cms-btn cms-btn-xs float-right mr-2" onclick="downloadCandidate()">Download</button>
            		<button class="btn btn-primary cms-btn cms-btn-xs float-right mr-2" onclick="openUploadPopUp()">Bulk Upload</button>
            	</div>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Key Skills</th>
                            <th>Job Title</th>
                            <th>CTC (LPA)</th>
                            <th>Notice Period</th>
                            <th>LWD</th>
                            <th>Years of Exp</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${candidateList}" var="candidateList">
	                        <tr>
	                            <td><c:out value="${candidateList.name}" /></td>
	                            <td><c:out value="${candidateList.key_skills}" /></td>
	                            <td><c:out value="${candidateList.job_title}" /></td>
	                            <td><c:out value="${candidateList.annual_salary}" /></td>
	                            <td><c:out value="${candidateList.notice_period}" /></td>
	                            <td><fmt:formatDate value="${candidateList.last_working_day}" pattern="dd-MMM-yyyy"/></td>
	                            <td><c:out value="${candidateList.total_experience}" /></td>
	                            <td class="text-center">    
                                    <div class="dropdown custom-dropdown">
                                        <a class="dropdown-toggle font-20 text-primary" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-cog"></i>
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink1" style="will-change: transform;">
                                            <a class="dropdown-item" href="/bootcamp/client/view-candidate?id=${candidateList.id}">View</a>
                                            <a class="dropdown-item" href="/bootcamp/client/add-update-candidate?id=${candidateList.id}">Edit</a>
                                           	<c:if test="${not empty candidateList.resume}">
                                           		<a class="dropdown-item" href="${candidateList.resume}" target="_blank">View CV</a>
                                            	<a class="dropdown-item" href="${candidateList.resume}" download>Download CV</a>
                                           	</c:if>
                                            <a class="dropdown-item" href="javascript:void(0)" data-toggle="modal" onclick="openPopup(${candidateList.id})">Schedule Call</a>
                                            <a class="dropdown-item" href="javascript:void(0)" data-toggle="modal" onclick="openTestPopup(${candidateList.id})">Add Test Result</a>
                                            <a class="dropdown-item" href="javascript:void(0)" data-toggle="modal" onclick="openPopup_Feedback(${candidateList.id})">Add Feedback</a>
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
<!-- /.container-fluid -->

<div class="modal fade" id="openTestPopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Add Test Result</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="test_form" role="form" method="post" enctype="multipart/form-data">
      <div class="modal-body">
        <div class="row">
        	<div class="col-lg-12">
        		<div class="form-group">
           			<label class="required">Test Name</label>
			    	<input type="text" class="form-control form-control-sm" id="test_name" name="test_name"  placeholder="Enter Test Name" required>
			  	</div>
        	</div>
        	<div class="col-lg-12">
        		<div class="form-group">
           			<label class="required">Test Topics</label>
			    	<input type="text" class="form-control form-control-sm" id="test_topics" name="test_topics" placeholder="Enter Test Topics" required>
			  	</div>
        	</div>
        	<div class="col-lg-6">
        		<label>Test Total Marks</label>
           		<select id="test_total_marks" name="test_total_marks" class="form-control form-control-sm" aria-label="Default select example" required></select>
        	</div>
        	<div class="col-lg-6">
        		<label>Candidate Marks Scored</label>
           		<select id="test_marks_scored" name="test_marks_scored" class="form-control form-control-sm" aria-label="Default select example" required></select>
        	</div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary btn-sm">Add Results</button>
      </div>
      </form>
    </div>
  </div>
</div>

<div class="modal fade" id="candidate_bulk_upload" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Bulk Upload Candidate</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-lg-12">
        		<form role="form" id="multiform" method="post" enctype="multipart/form-data">
                      <div class="form-group bottom20">
                          <label>Upload File:</label>
                          <input type="file" id="file" name="file">
                      </div>
                      <div class="form-group">
                           <p><i>Only .XLS format is allowed</i></p>
                      </div>
                      <div class="form-group">
                           <a href="#" id="form-submit" class="btn btn-info ladda-button" data-style="expand-right" data-size="l"><span class="ladda-label">Upload</span></a>
                      </div>
				</form>
        	</div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="schedule_call" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
   
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Schedule a Call To Candidate</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="schedule_form" role="form" method="post" enctype="multipart/form-data">
      <div class="modal-body">     
        <div class="row">
        	<div class="col-lg-6">
        		<label>Select Date</label>
        		<input type="text" class="form-control form-control-sm" id="datepicker_1" name="datepicker_1" placeholder="" required>
        	</div>
        	<div class="col-lg-6">
        		<label>Select Time</label>
        		<input id="timePicker" name="timePicker" class="form-control form-control-sm flatpickr flatpickr-input active" type="text" placeholder="Select Time" required>
        	</div>
        	<div class="col-lg-12 mt-3">
        		<div class="form-group">
				    <label>Reason of Call</label>
				    <textarea class="form-control" id="reason_call" name="reason_call" rows="3" required></textarea>
				</div>
        	</div>
        </div>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary btn-sm">Send Mail</button>
      </div>
       </form>
    </div>
  </div>
</div>

<div class="modal fade bd-example-modal-lg" tabindex="-1" id="myLargeModalLabel" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Candidate Feedbacks</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		    </div>
		     <form id="candidate_feedback" role="form" method="post" enctype="multipart/form-data">
		   	 <div class="modal-body">		   
			   <div class="row">
				   	<div class="col-lg-4">
	            		<label>Select Interview Type</label>
	            		<select id="can_interview_type"  id="can_interview_type" name="can_interview_type" class="form-control form-control-sm" required>
							<option>Bootcamp Feedback</option>
							<option>Initial Technical Interview</option>
							<option>Interim/Placement Calls</option>
							<option>Mock Interviews </option>
						</select>
	            	</div>
	            	<div class="col-lg-4">
	            		<label>Select Mentor Name</label>
	            		<select id="can_mentor_id" name="can_mentor_id" class="form-control form-control-sm">
							<c:forEach items="${mentorMasterList}" var="mentorMasterList">
								<option value="${mentorMasterList.id}"><c:out value="${mentorMasterList.first_name}" /> <c:out value="${mentorMasterList.last_name}" /></option>
							</c:forEach>
						</select>
	            	</div>
	            	<div class="col-lg-4">
	            		<div class="form-group">
	            			<label>TS Screening Grade</label>
					    	<input type="number" class="form-control form-control-sm" maxlength="5" id="can_ts_screening_grade" name="can_ts_screening_grade"  placeholder="">
					  	</div>
	            	</div>
	            	<div class="col-lg-12">
	            		<textarea class="form-control" placeholder="Leave a comment here" id="can_feedback" name="can_feedback" style="height: 100px"></textarea>
	            	</div>
			   </div>
			 
		    </div>
		    <div class="modal-footer">
		        <button type="button" class="btn btn-secondary cms-btn-xs cms-btn" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary cms-btn-xs cms-btn">Update Feedback</button>
		    </div>
		    </form>
		</div>
	</div>
</div>

<script>
var selected_popup_id = "";
var click_popup_id = "";

$( document ).ready(function() {
	var select = '';
    for (i=1;i<=100;i++){
        select += '<option val=' + i + '>' + i + '</option>';
    }
    $('#test_total_marks').html(select);
    $('#test_marks_scored').html(select);
    $( "#schedule_form" ).validate( {		
		rules: {
			datepicker_1: {
				required: true
			},
			timePicker: {
				required: true		     
			},
			reason_call: {
				required: true
			}			
		},
		messages: {
			datepicker_1: "Please Pick Date",
			timePicker: "Please Pick Time",			
			reason_call: "Please Enter the reason of Call",			
			
		},
		errorElement: "div",
		
		ignore: ':hidden:not(.summernote),.note-editable.card-block',
		
		errorPlacement: function ( error, element ) {
			
			error.addClass( "help-block" );
			
			element.parents( ".form-validate" ).addClass( "has-feedback" );			
		
			
			if(element.prop( "type" ) === "checkbox"){
				var ele = element.parent("div");
				error.insertAfter( ele.parent("div") );
			}else if(element.prop( "type" ) === "radio"){
				error.insertAfter( element.parent( ".form-radio" ) );
			}else if(element.hasClass("summernote")){
				error.insertAfter(element.siblings(".hdn_summernote"));
			}else{
				error.insertAfter( element );
			}
		},
		success: function ( label, element ) {
			if ( !$( element ).next( "span" )[ 0 ] ) {	
				click_popup_id = "1";
			}
		},
		highlight: function ( element, errorClass, validClass ) {
			$( element ).parents( ".form-validate" ).addClass( "has-error" ).removeClass( "has-success" );			
		},
		unhighlight: function ( element, errorClass, validClass ) {
			$( element ).parents( ".form-validate" ).addClass( "has-success" ).removeClass( "has-error" );
			$( element ).next( "span" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
		}
	});	
    $( "#test_form" ).validate( {		
		rules: {
			test_name: {
				required: true
			},
			test_topics: {
				required: true		     
			},
			test_total_marks: {
				required: true
			},
			test_marks_scored: {
				required: true
			}
		},
		messages: {
			test_name: "Please Enter the Test Name",
			test_topics: "Please Enter the Test Topic Name",			
			test_total_marks: "Please Select the Test Total Marks",			
			test_marks_scored: "Please Select the Candidate Scored Marks",
		},
						
		errorElement: "div",
		
		ignore: ':hidden:not(.summernote),.note-editable.card-block',
		
		errorPlacement: function ( error, element ) {
			
			error.addClass( "help-block" );
			
			element.parents( ".form-validate" ).addClass( "has-feedback" );			
		
			
			if(element.prop( "type" ) === "checkbox"){
				var ele = element.parent("div");
				error.insertAfter( ele.parent("div") );
			}else if(element.prop( "type" ) === "radio"){
				error.insertAfter( element.parent( ".form-radio" ) );
			}else if(element.hasClass("summernote")){
				error.insertAfter(element.siblings(".hdn_summernote"));
			}else{
				error.insertAfter( element );
			}
		},
		success: function ( label, element ) {
			if ( !$( element ).next( "span" )[ 0 ] ) {	
				click_popup_id = "2";
			}
		},
		highlight: function ( element, errorClass, validClass ) {
			$( element ).parents( ".form-validate" ).addClass( "has-error" ).removeClass( "has-success" );			
		},
		unhighlight: function ( element, errorClass, validClass ) {
			$( element ).parents( ".form-validate" ).addClass( "has-success" ).removeClass( "has-error" );
			$( element ).next( "span" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
		}
	});	
    $( "#candidate_feedback" ).validate( {		
    	rules: {
    		can_interview_type: {
    			required: true
    		},
    		can_mentor_id: {
    			required: true		     
    		},
    		can_ts_screening_grade: {
    			required: true
    		},	
    		can_feedback: {
    			required: true
    		}
    	},
    	messages: {
    		can_interview_type: "Please Select the Interview Type",
    		can_mentor_id: "Please Select the Mentor Name",			
    		can_ts_screening_grade: "Please Enter TS Screening Grade",			
    		can_feedback: "Please Enter Interview Feedback"
    	},
    	errorElement: "div",
    	
    	ignore: ':hidden:not(.summernote),.note-editable.card-block',
    	
    	errorPlacement: function ( error, element ) {
    		
    		error.addClass( "help-block" );
    		
    		element.parents( ".form-validate" ).addClass( "has-feedback" );			
    	
    		
    		if(element.prop( "type" ) === "checkbox"){
    			var ele = element.parent("div");
    			error.insertAfter( ele.parent("div") );
    		}else if(element.prop( "type" ) === "radio"){
    			error.insertAfter( element.parent( ".form-radio" ) );
    		}else if(element.hasClass("summernote")){
    			error.insertAfter(element.siblings(".hdn_summernote"));
    		}else{
    			error.insertAfter( element );
    		}
    	},
    	success: function ( label, element ) {
    		if ( !$( element ).next( "span" )[ 0 ] ) {	
    			click_popup_id = "3";
    		}
    	},
    	highlight: function ( element, errorClass, validClass ) {
    		$( element ).parents( ".form-validate" ).addClass( "has-error" ).removeClass( "has-success" );			
    	},
    	unhighlight: function ( element, errorClass, validClass ) {
    		$( element ).parents( ".form-validate" ).addClass( "has-success" ).removeClass( "has-error" );
    		$( element ).next( "span" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
    	}
    });	
});

$(function() {
	$("#datepicker_1").datepicker({
	    changeMonth: true,
	    changeYear: true,
	    yearRange: '1950:2034',
	    dateFormat: 'yy-mm-dd'
	});
});

function openPopup(id)
{
	selected_popup_id = id;
	$("#schedule_call").modal("show");
}

function openTestPopup(id)
{
	selected_popup_id = id;
	$("#openTestPopup").modal("show");
}

$.validator.setDefaults( {
	submitHandler: function () {			
		if( click_popup_id == "1")
		{			
			scheduleCall();
		}
		if(click_popup_id == "2")
		{			
			addTestResult();
		}
		if(click_popup_id == "3")
		{
			updateCandidateFeedback();
		}
	}
} );
function scheduleCall()
{	
	var candidate_id = selected_popup_id;
	var call_date = $("#datepicker_1").val();
	var call_time = $("#timePicker").val();
	var call_reason = $("#reason_call").val();
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/client/clientscheduleCallToCandidate", {
		candidate_id: "" + candidate_id + "",
		call_date: "" + call_date + "",
		call_time: "" + call_time + "",
		call_reason: "" + call_reason + "",
	}, function(data)
	{		
		$.LoadingOverlay("hide");
		
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		if(obj.status_code == 200)
		{
			$.toast({
			    heading: 'Success',
			    text: 'Call Scheduled Successfully',
			    icon: 'success',
			    position: 'top-right',
			    bgColor: '#d4edda',
			    textColor: '#155724',
			    afterShown: function () {
			    	setTimeout(function() {			    		
			    	}, 5000);
			    },
			}) 
			
	   		$("#datepicker_1").val("");
	    	$("#timePicker").val("");
	    	$("#reason_call").val("");
	    	
	    	$('#schedule_call').modal('toggle');
	    	
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

function addTestResult()
{
	var candidate_id = selected_popup_id;
	var test_name = $("#test_name").val();
	var test_topics = $("#test_topics").val();
	var test_total_marks = $("#test_total_marks").val();
	var test_marks_scored = $("#test_marks_scored").val();

	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/client/addTestResultToCandidate", {
		candidate_id: "" + candidate_id + "",
		test_name: "" + test_name + "",
		test_topics: "" + test_topics + "",
		test_total_marks: "" + test_total_marks + "",
		test_marks_scored: "" + test_marks_scored + "",
	}, function(data)
	{		
		$.LoadingOverlay("hide");
		
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		if(obj.status_code == 200)
		{
			swal("Success!", obj.msg , "success");
			
			$("#test_name").val("");
			$("#test_topics").val("");
			$("#test_total_marks").val("");
			$("#test_marks_scored").val("");
	    	
	    	$('#openTestPopup').modal('toggle');
	    	
		} else {
			swal("OOPS!", obj.msg, "error");
		 	return false;
		}
		
	},'text');
}

function openUploadPopUp()
{
	$("#candidate_bulk_upload").modal("show");
}

$(function() {
	$('#form-submit').click(function(e){
	 	e.preventDefault();
	 	
	 	var filename = $("#file").val();

	 	if(filename == "")
	 	{
	 		swal("OOPS!", "Please select the file" , "error");
		 	return false;
	 	}

		var formData = new FormData($("#multiform")[0]);
		$.LoadingOverlay("show");
		$.ajaxSetup({async:true});
		$.ajax({
		    url: '/bootcamp/client/bulkUploadCandidateDetails',
		    type: 'POST',
		    data: formData,
		    async: true,
		    cache: false,
		    contentType: false,
		    processData: false,
		    beforeSend: function( xhr ) {
		    },
		    success: function (response) {
		    	$.LoadingOverlay("hide");
		    	var result = $.trim(response);
				var obj = jQuery.parseJSON(result);
		    	$('#candidate_bulk_upload').modal('toggle');
		    	if(obj.status_code == 200){
		    		swal({title: "Success!", text: obj.msg, type: "success"},function(){ location.reload();});	
		    		$.toast({
					    heading: 'Success',
					    text: 'Candiate Details are Updated Successfully',
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
		    	}else{
		    		swal("OOPS!", obj.msg, "error");
				 	return false;
		    	}
		    	
		    }
		  });

	 	return false;
	});
});

function openPopup_Feedback(id)
{
	selected_feedback_id = id;
	$("#myLargeModalLabel").modal("show");
}

function updateCandidateFeedback()
{
	var id = selected_feedback_id;
	var interview_type = $("#can_interview_type").val();
	var mentor_id = $("#can_mentor_id").val();
	var ts_screening_grade = $("#can_ts_screening_grade").val();
	var feedback = $("#can_feedback").val();
		
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/client/updateCandidateFeedback", {id: "" + id + "",interview_type: "" + interview_type + "",mentor_id: "" + mentor_id + "",ts_screening_grade: "" + ts_screening_grade + "",feedback: "" + feedback + "",
	}, function(data)
	{		
		$.LoadingOverlay("hide");
		
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		if(obj.status_code == 200)
		{
			swal("Success!", obj.msg , "success");
			$("#can_interview_type").val("");
			$("#can_mentor_name").val("");
			$("#can_ts_screening_grade").val("");
			$("#can_feedback").val("");
			$('#myLargeModalLabel').modal('toggle');
			
		} else {
			swal("OOPS!", "Please Enter Correct Details", "error");
		 	return false;
		}
		
	},'text');
	return false;
}

function downloadCandidate()
{
	top.location =  "/bootcamp/client/canidateDownloadXL";
}
</script>