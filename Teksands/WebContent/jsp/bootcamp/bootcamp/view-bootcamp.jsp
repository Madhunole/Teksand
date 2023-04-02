<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="col-12 col-xl-auto mb-3">
    <a class="btn btn-sm btn-light text-primary" href="/bootcamp/bootcamp-list">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
        Back to Bootcamp List
    </a>
</div>

<section>
	<div class="container py-2">
		<div class="row">
			<div class="col-lg-12">
				<div class="card mb-4">
					<div class="card-header">
						<div class="row">
							<div class="col-lg-4">
								<c:choose>
									<c:when test="${bootcamp.active}">
										<span class="btn btn btn-success cms-btn-xs cms-btn float-left">Active</span>
									</c:when>
									<c:otherwise>
										<span class="btn btn btn btn-warning cms-btn-xs cms-btn float-left">Inactive</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="col-lg-8">
								<a href="/bootcamp/assign-bootcamp?id=${bootcamp.id}" type="button" class="btn btn-primary cms-btn-xs cms-btn float-right">Assign Candidate</a>
								<c:choose>
									<c:when test="${bootcamp.active}">
										<a href="javascript:void(0)" onclick="activateDeactivateBootcamp(${bootcamp.id})" type="button" class="btn btn btn-danger cms-btn-xs cms-btn float-right mr-2">Deactivate</a>
									</c:when>
									<c:otherwise>
										<a href="javascript:void(0)" onclick="activateDeactivateBootcamp(${bootcamp.id})" type="button" class="btn btn btn-success cms-btn-xs cms-btn float-right mr-2">Activate</a>
									</c:otherwise>
								</c:choose>
								<a href="/bootcamp/add-update-bootcamp?id=${bootcamp.id}" type="button" class="btn btn-primary cms-btn-xs cms-btn float-right mr-2">Edit Details</a>
							</div>
						</div>
					</div>
					<div class="card-body text-left">
						<div class="row">
							<c:if test="${not empty bootcamp.name || not empty bootcamp.requirements_summary}">
								<div class="col-lg-8">
									<c:if test="${not empty bootcamp.name}">
										<div class="row p-2">
											<div class="col-sm-3">
												<p class="mb-2"><b>Bootcamp Name :</b></p>
											</div>
											<div class="col-sm-9">
												<p class="text-muted mb-2"><c:out value="${bootcamp.name}"></c:out></p>
											</div>
										</div>
									</c:if>
									<c:if test="${not empty bootcamp.requirements_summary}">
										<div class="row p-2">
											<div class="col-sm-12">
												<p class="mb-2"><b>Bootcamp Requirement Summary :</b></p>
											</div>
											<div class="col-sm-12">
												<p class="text-muted mb-2"><c:out value="${bootcamp.requirements_summary}"></c:out></p>
											</div>
										</div>
									</c:if>
								</div>
							</c:if>
							<div class="col-lg-4">
								<c:if test="${not empty bootcamp.technologies || not empty bootcamp.role || not empty bootcamp.program_manager}">
									<ul class="list-group list-group-flush rounded-3">
										<c:if test="${not empty bootcamp.technologies}">
											<li class="list-group-item d-flex justify-content-between p-3 text-left border-0">
												<p class="mb-0"><b>Technologies :</b> <c:out value="${bootcamp.technologies}"></c:out></p>
											</li>
										</c:if>
										<c:if test="${not empty bootcamp.role}">
											<li class="list-group-item d-flex justify-content-between p-3 text-left border-0">
												<p class="mb-0"><b>Role :</b> <c:out value="${bootcamp.role}"></c:out></p>
											</li>
										</c:if>
										<c:if test="${not empty bootcamp.program_manager}">
											<li class="list-group-item d-flex justify-content-between p-3 text-left border-0">
												<p class="mb-0"><b>Program Manager:</b> <c:out value="${bootcamp.program_manager}"></c:out></p>
											</li>
										</c:if>
									</ul>
								</c:if>
							</div>
							<div class="col-lg-12">
								<div class="card mb-4">
									<div class="card-header">
										<b>Clients Details</b>
									</div>
									<c:if test="${not empty bootcamp.client_company}">
										<div class="card-body">
											<div class="row">
												<div class="col-lg-8">
													<p class="mb-0"><b>Company :</b> <c:out value="${bootcamp.client_company}"></c:out></p>
												</div>
												<div class="col-lg-4">
													<p class="mb-0"><b>Manager :</b> <c:out value="${bootcamp.client_manager}"></c:out></p>
												</div>
											</div>
										</div>
									</c:if>
								</div>
							</div>
							<div class="col-lg-12">	
								<c:if test="${not empty bootcamp.exp_start_range || not empty bootcamp.exp_end_range || not empty bootcamp.start_date || not empty bootcamp.end_date}">
									<div class="row">
										<div class="col-lg-6">
											<div class="card mb-4">
												<div class="card-header">
													<b>Experience Start & End Range</b>
												</div>
												<c:if test="${not empty bootcamp.exp_start_range}">
													<div class="card-body">
														<p><b>Start Range :</b> <c:out value="${bootcamp.exp_start_range}"></c:out> | <b>End Range :</b> <c:out value="${bootcamp.exp_end_range}"></c:out></p>
													</div>
												</c:if>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="card mb-4">
												<div class="card-header">
													<b>Bootcamp Start & End Date</b>
												</div>
												<c:if test="${not empty bootcamp.start_date}">
													<div class="card-body">
														<p><b>Start Date :</b> <fmt:formatDate pattern="dd-MM-yyyy" value="${bootcamp.start_date}" /> | <b>End Date :</b> <fmt:formatDate pattern="dd-MM-yyyy" value="${bootcamp.end_date}" /></p>
													</div>
												</c:if>
											</div>
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				 <div class="card">
					<div class="card-body">
			            <div class="table-responsive">
			                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			                    <thead>
			                        <tr>
			                            <th>Id</th>
			                            <th>Name</th>
			                            <th>Email</th>
			                            <th>Mobile</th>
			                            <th>City</th>
			                            <th>Submitted Date</th>
			                            <th>Status</th>
			                            <th>Action</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${bootcampActivecandidateList}" var="candidate" >
				                        <tr>
				                        
				                            <td><c:out value="${candidate.id}" /></td>
				                            <td><c:out value="${candidate.name}" /></td>
				                            <td><c:out value="${candidate.email}" /></td>
				                            <td><c:out value="${candidate.mobile}" /></td>
				                            <td><c:out value="${candidate.permanent_city}" /></td>
				                             <td><fmt:formatDate pattern="dd-MM-yyyy" value="${candidate.created_date}" /></td>
				                            <td>
				                            	<c:if test = "${candidate.active == 'true'}">
				                            		<span class="badge badge-success">Active</span>
				                            	</c:if>
				                            	<c:if test = "${candidate.active == 'false'}">
				                            		<span class="badge badge-warning">Inactive</span>
				                            	</c:if> 
				                            </td>
				                            <td class="text-center">    
			                                    <div class="dropdown custom-dropdown">
			                                        <a class="dropdown-toggle font-20 text-primary" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                                            <i class="fas fa-cog"></i>
			                                        </a>
			                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink1" style="will-change: transform;">
			                                            <a class="dropdown-item" href="/bootcamp/view-candidate?id=${candidate.id}">View</a>
			                                            <a class="dropdown-item" href="/bootcamp/add-update-candidate?id=${candidate.id}">Edit</a>
			                                            <a class="dropdown-item" href="javascript:void(0)" data-toggle="modal" onclick="openPopup_Feedback(${candidate.id})">Add Feedback</a>
			                                            <a class="dropdown-item" href="javascript:void(0)" data-toggle="modal" onclick="openPopup(${candidate.id})">Schedule Call</a>
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
      <div class="modal-body">
        <div class="row">
        	<div class="col-lg-6">
        		<label>Select Date</label>
        		<input type="text" class="form-control form-control-sm" id="datepicker_1" placeholder="">
        	</div>
        	<div class="col-lg-6">
        		<label>Select Time</label>
        		<input id="timePicker" class="form-control form-control-sm flatpickr flatpickr-input active" type="text" placeholder="Select Time">
        	</div>
        	<div class="col-lg-12 mt-3">
        		<div class="form-group">
				    <label>Reason of Call</label>
				    <textarea class="form-control" id="reason_call" rows="3"></textarea>
				</div>
        	</div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-sm" onclick="scheduleCall()">Save changes</button>
      </div>
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
		    <div class="modal-body">
			   <div class="row">
				   	<div class="col-lg-4">
	            		<label>Select Interview Type</label>
	            		<select id="can_interview_type" class="form-control form-control-sm">
							<option>Bootcamp Feedback</option>
							<option>Initial Technical Interview</option>
							<option>Interim/Placement Calls</option>
							<option>Mock Interviews </option>
						</select>
	            	</div>
	            	<div class="col-lg-4">
	            		<label>Select Mentor Name</label>
	            		<select id="can_mentor_id" class="form-control form-control-sm">
							<c:forEach items="${mentorMasterList}" var="mentorMasterList">
								<option value="${mentorMasterList.id}"><c:out value="${mentorMasterList.first_name}" /> <c:out value="${mentorMasterList.last_name}" /></option>
							</c:forEach>
						</select>
	            	</div>
	            	<div class="col-lg-4">
	            		<div class="form-group">
	            			<label>TS Screening Grade</label>
					    	<input type="number" class="form-control form-control-sm" maxlength="5" id="can_ts_screening_grade" placeholder="">
					  	</div>
	            	</div>
	            	<div class="col-lg-12">
	            		<textarea class="form-control" placeholder="Leave a comment here" id="can_feedback" style="height: 100px"></textarea>
	            	</div>
			   </div>
		    </div>
		    <div class="modal-footer">
		        <button type="button" class="btn btn-secondary cms-btn-xs cms-btn" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary cms-btn-xs cms-btn" onclick="updateCandidateFeedback()">Update Feedback</button>
		    </div>
		</div>
	</div>
</div>

<script>

var selected_popup_id = "";
var selected_feedback_id = "";

function activateDeactivateBootcamp(id)
{
    $.ajaxSetup({async:false});
	$.post("/bootcamp/activateDeactivateBootcamp", {id: "" + id + "", }, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
  		if(obj.status_code == 200)
   		{
  			swal("Success!", obj.msg , "success").then(function(isConfirm) {if (isConfirm) {location.reload();}});
   			
   		} else {
   			swal("OOPS!", "Something Error!", "error");
   		 	return false;
   		}

	},'text');
}

$(function() {
	$("#datepicker_1").datepicker({
	    changeMonth: true,
	    changeYear: true,
	    yearRange: '1950:2034',
	    dateFormat: 'yy-mm-dd'
	});
});

$(function() {
	$("#datepicker_2").datepicker({
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

function openPopup_Feedback(id)
{
	selected_feedback_id = id;
	$("#myLargeModalLabel").modal("show");
}

function scheduleCall()
{
	var candidate_id = selected_popup_id;
	var call_date = $("#datepicker_1").val();
	var call_time = $("#timePicker").val();
	var call_reason = $("#reason_call").val();

	if(call_date == ""){
    	swal("OOPS!", "Please Pick Date", "error").then(() => {
    		$('html').animate({ scrollTop: $("#datepicker_1").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(call_time == ""){
    	swal("OOPS!", "Please Pick Time", "error").then(() => {
    		$('html').animate({ scrollTop: $("#call_time").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(call_reason == ""){
    	swal("OOPS!", "Please Enter the reason of Call", "error").then(() => {
    		$('html').animate({ scrollTop: $("#call_reason").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/scheduleCallToCandidate", {
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
			swal("Success!", obj.msg , "success");
	      	
	   		$("#datepicker_1").val("");
	    	$("#timePicker").val("");
	    	$("#reason_call").val("");
	    	
	    	$('#schedule_call').modal('toggle');
	    	
		} else {
			swal("OOPS!", obj.msg, "error");
		 	return false;
		}
		
	},'text');
}

function updateCandidateFeedback()
{
	var id = selected_feedback_id;
	var interview_type = $("#can_interview_type").val();
	var mentor_id = $("#can_mentor_id").val();
	var ts_screening_grade = $("#can_ts_screening_grade").val();
	var feedback = $("#can_feedback").val();
	
	if(interview_type == ""){
    	swal("OOPS!", "Please Select the Interview Type", "error").then(() => {
    		$('html').animate({ scrollTop: $("#can_interview_type").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(mentor_id == ""){
    	swal("OOPS!", "Please Select the Mentor Name", "error").then(() => {
    		$('html').animate({ scrollTop: $("#can_mentor_id").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(ts_screening_grade == ""){
    	swal("OOPS!", "Please Enter TS Screening Grade", "error").then(() => {
    		$('html').animate({ scrollTop: $("#can_ts_screening_grade").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(feedback == ""){
    	swal("OOPS!", "Please Enter Interview Feedback", "error").then(() => {
    		$('html').animate({ scrollTop: $("#can_feedback").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/updateCandidateFeedback", {id: "" + id + "",interview_type: "" + interview_type + "",mentor_id: "" + mentor_id + "",ts_screening_grade: "" + ts_screening_grade + "",feedback: "" + feedback + "",
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
</script>