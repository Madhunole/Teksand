<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.job-p p {
	margin-bottom: 0px !important;
}
</style>

<div class="col-12 col-xl-auto mb-3">
    <a class="btn btn-sm btn-light text-primary" href="/bootcamp/brand-jobs">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
        Back to Jobs List
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
								<p class="mb-2"><b><c:out value="${jobMaster.role_name}"></c:out></b></p>
							</div>
							<div class="col-lg-8">
								<a href="/bootcamp/brand-add-update-jobs?id=${jobMaster.id}&source=view_jobs" type="button" class="btn btn-primary cms-btn-xs cms-btn float-right mr-2">Edit</a>
								<c:choose>
									<c:when test="${jobMaster.active}">
										<a href="javascript:void(0)" onclick="activateDeactivateJob(${jobMaster.id},2)" type="button" class="btn btn btn-danger cms-btn-xs cms-btn float-right mr-2">Deactivate</a>
									</c:when>
									<c:otherwise>
										<a href="javascript:void(0)" onclick="activateDeactivateJob(${jobMaster.id},1)" type="button" class="btn btn btn-success cms-btn-xs cms-btn float-right mr-2">Activate</a>
									</c:otherwise>
								</c:choose>										
							</div>
						</div>
					</div>
					<div class="card-body text-left">
						<div class="row">
							<div class="col-lg-12">
								<div class="row p-2">
									<div class="col-sm-4">
										<div class="row">
											<div class="col-sm-5"><p class="mb-2"><b>Company:</b></p></div>
											<div class="col-sm-7"><p class="mb-2"><c:out value="${jobMaster.company_name}"></c:out></p></div>
											<div class="col-sm-5"><p class="mb-2"><b>Contact Name:</b></p></div>
											<div class="col-sm-7"><p class="mb-2"><c:out value="${jobMaster.contact_person}"></c:out></p></div>
											<div class="col-sm-5"><p class="mb-2"><b>Contact Email:</b></p></div>
											<div class="col-sm-7"><p class="mb-2"><c:out value="${jobMaster.contact_email}"></c:out></p></div>
											<div class="col-sm-5"><p class="mb-2"><b>Contact Mobile:</b></p></div>
											<div class="col-sm-7"><p class="mb-2"><c:out value="${jobMaster.contact_mobile}"></c:out></p></div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="row">
											<div class="col-sm-5"><p class="mb-2"><b>No Of Positions:</b></p></div>
											<div class="col-sm-7"><p class="mb-2"><c:out value="${jobMaster.total_vacancy}"></c:out></p></div>
											<div class="col-sm-5"><p class="mb-2"><b>Position:</b></p></div>
											<div class="col-sm-7"><p class="mb-2"><c:out value="${jobMaster.position}"></c:out></p></div>
											<div class="col-sm-5"><p class="mb-2"><b>Experience:</b></p></div>
											<div class="col-sm-7"><p class="text-muted mb-2"><c:out value="${jobMaster.experience}"></c:out></p></div>
											<div class="col-sm-5"><p class="mb-2"><b>Salary Range:</b></p></div>
											<div class="col-sm-7">
												<p class="text-muted mb-2">
													<c:choose>
									            		<c:when test="${jobMaster.min_salary_range == '0' && jobMaster.max_salary_range == '0'}">
									            			<span>Not Disclosed</span>
									            		</c:when>
									            		<c:when test="${not empty jobMaster.min_salary_range && not empty jobMaster.max_salary_range}">
									            			<c:out value="${jobMaster.min_salary_range}" /> - <c:out value="${jobMaster.max_salary_range}" /> <span>(lakhs)</span>
									            		</c:when>
									            		<c:otherwise>
									            			<span>Not Disclosed</span>
									            		</c:otherwise>
									            	</c:choose>
												</p>
											</div>
											<div class="col-sm-5"><p class="mb-2"><b>Skills Required:</b></p></div>
											<div class="col-sm-7"><p class="text-muted mb-2"><c:out value="${jobMaster.skills_required}"></c:out></p></div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="row">
											<div class="col-sm-4"><p class="mb-2"><b>Location:</b></p></div>
											<div class="col-sm-8"><p class="mb-2"><c:out value="${jobMaster.total_vacancy}"></c:out></p></div>
											<div class="col-sm-4"><p class="mb-2"><b>Qualification</b></p></div>
											<div class="col-sm-8"><p class="mb-2"><c:out value="${jobMaster.qualification}"></c:out></p></div>
											<div class="col-sm-4"><p class="mb-2"><b>Industry</b></p></div>
											<div class="col-sm-8"><p class="text-muted mb-2"><c:out value="${jobMaster.industry}"></c:out></p></div>
											<div class="col-sm-4"><p class="mb-2"><b>Emp Type</b></p></div>
											<div class="col-sm-8"><p class="text-muted mb-2"><c:out value="${jobMaster.emp_type}"></c:out></p></div>
											<div class="col-sm-4"><p class="mb-2"><b>Category</b></p></div>
											<div class="col-sm-8"><p class="text-muted mb-2"><c:out value="${jobMaster.category}"></c:out></p></div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="card job-p">
									<div class="card-header">
										<p class="mb-2"><b>Job Requirement:</b></p>
									</div>
									<div class="card-body">
										<c:out value="${jobMaster.skills_competencies}" escapeXml="false" />
									</div>
								</div>
							</div>
							<div class="col-lg-12 mt-3">
								<div class="card job-p">
									<div class="card-header">
										<p class="mb-2"><b>Job Role Description:</b></p>
									</div>
									<div class="card-body">
										<c:out value="${jobMaster.job_responsibilities}" escapeXml="false" />
									</div>
								</div>
							</div>
			            </div>
			         </div>
				</div>
				<div class="card">
					<div class="card-header">
						<div class="row">
							<div class="col-lg-6">
								<p class="mb-2"><b>Applied Candidates</b></p>
							</div>	
							<div class="col-lg-6">
								<a href="javascript:void(0)" type="button" class="btn btn-primary cms-btn-xs cms-btn float-right" onclick="downloadAppliedCandidateResumes()">Download all CVs</a>
								<a href="javascript:void(0)" type="button" class="btn btn-primary cms-btn-xs cms-btn float-right mr-2" onclick="XlDownloadAllApplicantByJobID()">Download List of Applicants</a>
							</div>						
						</div>
					</div>
					<div class="card-body">
			            <div class="table-responsive">
			                <table class="table table-bordered" id="jobsMasterView" width="100%" cellspacing="0">
			                    <thead>
			                        <tr>
			                            <th>Name</th>
			                            <th>Email</th>
			                            <th>Mobile</th>
			                            <th>Experience</th>
			                            <th>Submitted Date</th>
			                            <th>Action</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${candidate}" var="candidate" >
				                        <tr>
				                            <td><c:out value="${candidate.name}" /></td>
				                            <td><c:out value="${candidate.email}" /></td>
				                            <td><c:out value="${candidate.mobile}" /></td>
				                            <td><c:out value="${candidate.total_experience}" /></td>
				                            <td><fmt:formatDate type = "both" value = "${candidate.created_date}" /></td>
				                            <td class="text-center">    
			                                    <div class="dropdown custom-dropdown">
			                                        <a class="dropdown-toggle font-20 text-primary" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                                            <i class="fas fa-cog"></i>
			                                        </a>
			                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink1" style="will-change: transform;">		                                      	
														
			                                            <a class="dropdown-item" href="/bootcamp/brand-view-candidate?id=${candidate.id}&jobId=${jobMaster.id}">View</a>
			                                            <a class="dropdown-item" href="/bootcamp/brand-add-update-candidate?id=${candidate.id}">Edit</a>
			                                            <c:choose>
															<c:when test="${not empty candidate.resume}">
																<a class="dropdown-item" href="${candidate.resume}" target="_blank">View CV</a>																
															</c:when>
															<c:otherwise>
															 <a class="dropdown-item" href="javascript:void(0)" target="_blank">View CV</a>												
															</c:otherwise>
														</c:choose>  
														<c:choose>
															<c:when test="${not empty candidate.resume}">
																<a class="dropdown-item" href="${candidate.resume}" target="_blank">Download CV</a>	
															</c:when>
															<c:otherwise>
																<a class="dropdown-item" href="javascript:void(0)" target="_blank">Download CV</a>														
															</c:otherwise>
														</c:choose> 			                                            			                                            
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
  <form id="schedule_candidate" role="form" method="post" enctype="multipart/form-data">
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
        <button type="submit" class="btn btn-primary btn-sm">Save changes</button>
      </div>
    </div>
    </form>
  </div>
</div>

<div class="modal fade bd-example-modal-lg" tabindex="-1" id="myLargeModalLabel" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<form id="candidate_feedback" role="form" method="post" enctype="multipart/form-data">
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
					    	<input type="number" class="form-control form-control-sm" maxlength="5" id="can_ts_screening_grade"  name="can_ts_screening_grade" placeholder="" required>
					  	</div>
	            	</div>
	            	<div class="col-lg-12">
	            		<textarea class="form-control" placeholder="Leave a comment here" id="can_feedback" name="can_feedback" style="height: 100px" required></textarea>
	            	</div>
			   </div>
		    </div>
		    <div class="modal-footer">
		        <button type="button" class="btn btn-secondary cms-btn-xs cms-btn" data-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary cms-btn-xs cms-btn">Update Feedback</button>
		    </div>
		</div>
		</form>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
<script>

var selected_popup_id = "";
var selected_feedback_id = "";

$(document).ready(function () {
    $('#jobsMasterView').DataTable({
    	"ordering": false,
        "columnDefs": [
        	{ "width": "20%", "targets": 5 },
          ],
    });

    $( "#candidate_feedback").validate( {
    	rules: {
    		can_ts_screening_grade: {
    			required: true,
    		},
    		can_feedback: {
    			required: true
    		},		
    	},
    	messages: {
    		can_ts_screening_grade: "Please Enter Screening",
    		can_feedback: "Please Enter Comment",	
    	},
    	submitHandler: function () {			
    		updateCandidateFeedback();		
    	}    	
    } );	
    
    $( "#schedule_candidate").validate( {
    	rules: {
    		datepicker_1: {
    			required: true,
    		},
    		timePicker: {
    			required: true
    		},	
    		reason_call: {
    			required: true
    		},	
    	},
    	messages: {
    		datepicker_1: "Please Select Date",
    		timePicker: "Please Select Time",	
    		reason_call: "Please Enter Reason for Call",	
    	},
    	submitHandler: function () {			
    		scheduleCall();		
    	}    	
    } );	
});
function updateCandidateFeedback()
{
	var id = selected_feedback_id;
	var interview_type = $("#can_interview_type").val();
	var mentor_id = $("#can_mentor_id").val();
	var ts_screening_grade = $("#can_ts_screening_grade").val();
	var feedback = $("#can_feedback").val();
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/brandupdateCandidateFeedback", {id: "" + id + "",interview_type: "" + interview_type + "",mentor_id: "" + mentor_id + "",ts_screening_grade: "" + ts_screening_grade + "",feedback: "" + feedback + "",
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

function activateDeactivateJob(id,status)
{
    $.ajaxSetup({async:false});
	$.post("/bootcamp/brandactivateDeactivateJob", {id: "" + id + "", }, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		if(status == 1)
			{
   			$.toast({
			    heading: 'Success',
			    text: 'The Job Activated Successfully',
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
				$.toast({
			    heading: 'Success',
			    text: 'The Job deactivated Successfully',
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

	},'text');
}

function activateDeactivateBootcamp(id)
{
    $.ajaxSetup({async:false});
	$.post("/bootcamp/client/activateDeactivateBootcamp", {id: "" + id + "", }, function(data)
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
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/brandscheduleCallToCandidate", {
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

function XlDownloadAllApplicantByJobID()
{
	var job_id = '${jobMaster.id}'
	top.location =  "/bootcamp/branddownloadXLForAppliedCandidatesByJobID?job_id="+job_id;
}

function downloadAppliedCandidateResumes()
{
	var job_id = '${jobMaster.id}'
	top.location =  "/bootcamp/brandgetAllAppliedCandidateCvAndZipAndDownload?job_id="+job_id;
}
</script>