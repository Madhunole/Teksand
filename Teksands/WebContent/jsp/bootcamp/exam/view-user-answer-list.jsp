<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.comment-header {
	padding: 0 0 10px 15px !important;
    margin-bottom: 0 !important;
    background-color: #fff !important;
    border-bottom: 1px solid #e3e6f0 !important;
    font-size: 17px !important;
    font-weight: bold !important;
    color: #51abdf !important;
}

</style>
<script>

var user_id = '${user_id}';
var test_id = '${test_id}';

$(document).ready(function () {
    $('#viewUserAnswerList').DataTable({
    	paging: false,
        ordering: false,
        info: false,
    });
});

function getAnswerById(answer_id)
{
	if(answer_id == "")
    {
		swal("OOPS!", "There is no answer", "info");
 	    return false;
    }
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:true});
	$.post("/bootcamp/getAnswerById", {answer_id : "" + answer_id + ""}, function(data)       	   
	{
		$.LoadingOverlay("hide");
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		
		if(obj == null || obj == "null")
		{
			swal("OOPS!", "There is no answer", "info");
	 	    return false;
		}
		else
		{
			var question = obj.status;
			var answer = obj.msg;
			
			$("#span_test_question").html(question);
			$("#span_test_answer").html(answer);
			
			$('#answer_modal').modal('show');
		}
		
	}, "text");
}

function showAddComment()
{
	$('#add_comment').modal('show');
}

function addCommentByUserId()
{
	var user_test_comment = $("#user_test_comment").val();
	
	if(user_test_comment == "")
    {
		swal("OOPS!", "Please enter the comment", "info");
 	    return false;
    }
	
	$('#add_comment').modal('hide');
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:true});
	$.post("/bootcamp/addCommentByUserId", {user_id : "" + user_id + "",test_id : "" + test_id + "",user_test_comment : "" + user_test_comment + ""}, function(data)       	   
	{
		$.LoadingOverlay("hide");
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		
		if(obj.status_code == 200)
		{
			location.reload();
			return false;
      		
		} else {
			swal("OOPS!", "Please Enter Correct Details", "error");
		 	return false;
		}
		
	}, "text");
}

function addPassTrue()
{
	var result = "true";
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:true});
	$.post("/bootcamp/passUserTestByUserIdAndTestId", {user_id : "" + user_id + "",test_id : "" + test_id + "",result : "" + result + ""}, function(data)       	   
	{
		$.LoadingOverlay("hide");
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		
		if(obj.status_code == 200)
		{
			swal("Success!", obj.msg , "success");
			return false;
      		
		} else {
			swal("OOPS!", obj.msg, "error");
		 	return false;
		}
		
	}, "text");
}

function downloadUserAnswer()
{
	top.location =  "/bootcamp/downloadUserAnswerByUserIdAndTestId?user_id="+user_id+"&test_id="+test_id+"";
}
</script>

<div class="col-12 col-xl-auto mb-3">
    <a class="btn btn-sm btn-light text-primary" href="javascript:void(0)" onclick="history.back()">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
        Back to View Test
    </a>
</div>

<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
        	<div class="row">
            	<div class="col-lg-6">
            		<h6 class="m-0 font-weight-bold text-primary float-left"><c:out value="${testName}" /></h6>
            	</div>
            	<div class="col-lg-6">
            		<button class="btn btn-success cms-btn cms-btn-xs float-right" onclick="downloadUserAnswer()">Download Answers</button>
            		<button class="btn btn-primary cms-btn cms-btn-xs float-right mr-2" onclick="showAddComment()">Add Comment</button>
            		<button class="btn btn-success cms-btn cms-btn-xs float-right mr-2" onclick="addPassTrue()">Pass</button>
            	</div>
            </div>
        </div>
        <div class="card-body">
       		<div class="table-responsive">
             	<table class="table table-bordered">
             		<thead>
             			<tr>
             				<th>Name</th>
             				<th>Email</th>
             				<th>Mobile</th>
             				<th>Submitted Date</th>
             			</tr>
             		</thead>
             		<tbody>
             			<tr>
             				<td><c:out value="${testUser.name}" /></td>
             				<td><c:out value="${testUser.email}" /></td>
             				<td><c:out value="${testUser.mobile}" /></td>
             				<td><fmt:formatDate pattern="dd-MM-yyyy" value="${testUser.created_date}" /></td>
             			</tr>
             			<c:if test="${mcQtotal > 0}">
	             			<tfoot>
		             			<tr>
		             				<td><p class="mb-0 font-weight-bold text-info">Total Number of MCQs: <c:out value="${mcQtotal}" /></p></td>
		             				<td><p class="mb-0 font-weight-bold text-success">Total Correct: <c:out value="${mcQcorrect}" /></p></td>
		             				<td><p class="mb-0 font-weight-bold text-danger">Total Wrong: <c:out value="${mcQWrong}" /></p></td>
		             				<td><p class="mb-0 font-weight-bold text-warning">Percentage: <c:out value="${mcPercetage}" />%</p></td>
		             			</tr>
	             			</tfoot>
             			</c:if>
             		</tbody>
             	</table>
			</div>
        	<div class="table-responsive">
                <table class="table table-bordered" id="viewUserAnswerList" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Question</th>
                            <th>Type</th>
                            <th>Answer</th>
                            <c:if test="${mcQtotal > 0}">
	                           	<th>Correct Answer</th>
	                            <th>Correct Or Not</th>
                            </c:if>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${testanswerList}" var="testAnswer">
                    		<input type="hidden" id="testId" value="${testAnswer.test_id}">
	                        <tr>
	                            <td><c:out value="${testAnswer.question}" /></td>
	                            <td><c:out value="${testAnswer.question_type}" /></td>
	                            <c:choose>
	                            	<c:when test="${testAnswer.question_type == 'written'}">
	                            		<c:if test="${mcQtotal > 0}">
	                            			<c:if test="${empty testAnswer.test_answer}">
	                            				<td>Not Attempted</td>
	                            			</c:if>
	                            			<c:if test="${not empty testAnswer.test_answer}">
	                            				<td><c:out value="${testAnswer.test_answer}" /></td>
	                            			</c:if>
	                            			<td>-</td>
	                            			<td>-</td>
	                            		</c:if>
	                            		<c:if test="${mcQtotal eq 0}">
	                            			<c:if test="${empty testAnswer.test_answer}">
	                            				<td>Not Attempted</td>
	                            			</c:if>
	                            			<c:if test="${not empty testAnswer.test_answer}">
	                            				<td><c:out value="${testAnswer.test_answer}" /></td>
	                            			</c:if>
	                            		</c:if>
	                            	</c:when>
	                            	<c:when test="${testAnswer.question_type == 'voice'}">
	                            		<c:if test="${mcQtotal > 0}">
		                            		<c:if test="${empty testAnswer.test_answer}">
	                            				<td>Not Attempted</td>
	                            			</c:if>
	                            			<c:if test="${not empty testAnswer.test_answer}">
	                            				<td>
			                            			<audio controls>										 
														<source src="${testAnswer.test_answer}" type="audio/mpeg" controls="true">										  
													</audio>
												</td>
	                            			</c:if>
											<td>-</td>
											<td>-</td>
										</c:if>
										<c:if test="${mcQtotal eq 0}">
		                            		<c:if test="${empty testAnswer.test_answer}">
	                            				<td>Not Attempted</td>
	                            			</c:if>
	                            			<c:if test="${not empty testAnswer.test_answer}">
	                            				<td>
			                            			<audio controls>										 
														<source src="${testAnswer.test_answer}" type="audio/mpeg" controls="true">										  
													</audio>
												</td>
	                            			</c:if>
										</c:if>
	                            	</c:when>
	                            	<c:when test="${testAnswer.question_type == 'mcq'}">
	                            		<c:if test="${empty testAnswer.test_answer}">
                            				<td>Not Attempted</td>
                            			</c:if>
                            			<c:if test="${not empty testAnswer.test_answer}">
                            				<td><c:out value="${testAnswer.test_answer}" /></td>
                            			</c:if>
	                            		<td><c:out value="${testAnswer.correct_answer}" /></td>
	                            		<td><c:out value="${testAnswer.correct_or_not}" /></td>
	                            	</c:when>
	                            </c:choose>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="card mt-4 mb-4 py-3 border-left-primary">
	             <div class="card-header comment-header">Comments</div>
	             <div class="card-body">
	             	<p style="margin-bottom: 0;"><c:out value="${testComment.comment}" /></p>
	             </div>
	         </div>
        </div>
    </div>
</div>

<div id="answer_modal" class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel"><span id="span_test_question"></span></h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		     </div>
		     <div class="modal-body">
		     	<p><span id="span_test_answer"></span></p>
		     </div>
		</div>
	</div>
</div>

<div id="add_comment" class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Add Comment</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		     </div>
		     <div class="modal-body">
		     	<div class="row">
		     		<div class="col-lg-12">
		     			<div class="form-group">
					    	<label for="exampleFormControlTextarea1">Add Your Comment</label>
					    	<textarea class="form-control" id="user_test_comment" rows="3"></textarea>
					  	</div>
		     		</div>
		     		<div class="col-lg-12">
		     			<button class="btn btn-primary btn-sm float-right" onclick="addCommentByUserId()">Submit</button>
		     		</div>
		     	</div>
		     </div>
		</div>
	</div>
</div>
