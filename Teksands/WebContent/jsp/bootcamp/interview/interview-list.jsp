<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Begin Page Content -->
<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <div class="row">
            	<div class="col-lg-6"><h6 class="m-0 font-weight-bold text-primary float-left">Interview Master</h6></div>
            	<div class="col-lg-6"><a href="/bootcamp/add-update-interview" class="btn btn-primary cms-btn cms-btn-xs float-right">Create Interview</a></div>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Candidate Name</th>
                            <th>Bootcamp Name</th>
                            <th>Company Name</th>
                            <th>Interviewer Name</th>
                            <th>Interview  Type</th>
                            <th>Interview Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${interviewList}" var="interview">
	                        <tr>
	                            <td><c:out value="${interview.id}" /></td>
	                            <td><c:out value="${interview.candidate_name}" /></td>
	                            <td><c:out value="${interview.bootcamp_name}" /></td>
	                            <td><c:out value="${interview.company_name}" /></td>
	                            <td><c:out value="${interview.interviewer_name}" /></td>
	                            <td><c:out value="${interview.interview_type}" /></td>
	                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${interview.interview_date}" /></td>
	                            <td>
	                            	<c:if test = "${interview.active == 'true'}">
	                            		<span class="badge badge-success">Active</span>
	                            	</c:if>
	                            	<c:if test = "${interview.active == 'false'}">
	                            		<span class="badge badge-warning">Inactive</span>
	                            	</c:if> 
	                            </td>
	                            <td class="text-center">    
                                    <div class="dropdown custom-dropdown">
                                        <a class="dropdown-toggle font-20 text-primary" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-cog"></i>
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink1" style="will-change: transform;">
											<a class="dropdown-item" href="javascript:void(0)" onclick="openInterviewFeedbackPopup(${interview.candidate_id})">Add Feedback</a>
                                            <c:choose>
												<c:when test="${interview.active}">
													<a class="dropdown-item" href="javascript:void(0)" onclick="activateDeactivateInterview(${interview.id})">Cancel</a>
												</c:when>
												<c:otherwise>
													<a class="dropdown-item" href="javascript:void(0)" onclick="activateDeactivateInterview(${interview.id})">Activate</a>
												</c:otherwise>
											</c:choose>
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

<div class="modal fade" id="interviewFeedbackPopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Interview Feedback</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
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
var interview_id = "";
function activateDeactivateInterview(id)
{
    $.ajaxSetup({async:false});
	$.post("/bootcamp/activateDeactivateInterview", {id: "" + id + "", }, function(data)
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

function openInterviewFeedbackPopup(id)
{
	interview_id = id;
	$("#interviewFeedbackPopup").modal("show");
}

function updateCandidateFeedback()
{
	var id = interview_id;
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
			$('#interviewFeedbackPopup').modal('toggle');
			
		} else {
			swal("OOPS!", "Please Enter Correct Details", "error");
		 	return false;
		}
		
	},'text');
	return false;
}
</script>