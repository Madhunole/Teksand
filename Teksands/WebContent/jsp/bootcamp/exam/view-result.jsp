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
.cardmt
{
	margin-top : 34px;
}
#testRes th
{
	color: white !important;
}
.wrapper{
		background-size: auto;
	}
	.exam_report{
		margin: 10% 0 0 !important;
		background-color: #fff;
		border: 2px solid #0000002b;
	}
	.questions_answered{
		margin: 5% 0 !important;
		background-color: #fff;
		border: 2px solid #0000002b;
	}
	.fail{
		color: red;
		font-weight: 600;
	}
	.pass{
		color: green;
		font-weight: 600;
	}
	.no-ul-list{
		list-style-type:none; 
		padding: 0;
	}
	.ques_header{
		border: 1px solid #d9cccc;
		width: 100%;
		padding: 8px;
		background-color: #03b97c;
		font-weight:600;
		color:#000
	}
	.checkbox_container{
		width: 100%;
		padding: 8px 16px;
		font-weight:600;
		color:#000
	}
	.question-answer{
		width: 100%;
		padding: 0;
		font-weight:600;
		color:#000;
		justify-content: center;
	}
	.paragraph{
		padding: 8px;
		font-weight:600;
		color:#073f5a;
/* 		background-color: #306e59; */
	}
	.question{
		width: 100%;
		padding: 8px 16px;
		font-weight:600;
		color:#000;
		background-color:#03b97c;
	}
	.options{
		padding: 16px 16px 8px;
	}
	.quest_num{
		color: #aa3838;
	    font-size: 12px;
	    margin: 8px;
	    font-weight: 800;
	}
 	.viewAnswers{ 
 		display: none; 
 	}
	.hide_text{
		display: none;
	}
	.answerKeyHead{
		cursor: pointer;
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
    $('.cancel').click(function(){
        window.location.href = '/';
    });

});

function redirectPage()
{
	location.href = "/";
}
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
function answerKeyView(){
	$('.viewAnswers').toggle()
	$('.hide_text').toggle()
	$('.show_text').toggle()
}
</script>

<div class="container cardmt">
    <div class="card shadow mb-4">    
        <div class="card-body">
       		<div class="container-fluid">
					<div class="col-lg-12 col-md-12 col-sm-12" style="margin-bottom: 0px">
						<div class="row" style="margin-top:1rem">
							<div class="form_header_content text-center col-lg-12 col-md-12 col-sm-12" style="display:flex; justify-content: center;padding: 0 !important;">
								<h2 class=" text-uppercase float-start" style="font-size: 16px; background: -webkit-linear-gradient(#319bd2, #319bd2); -webkit-background-clip: text; -webkit-text-fill-color: transparent;  font-weight: 800;margin-bottom: 0 !important;">${test_name}</h2>
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12" style="margin-bottom: 0px;padding: 0 !important">
						<div class="row" style="margin-top:1rem">
							<div class="form_header_content text-left col-lg-12 col-md-12 col-sm-12" style="display:flex; justify-content: center;padding: 0 !important">
				            	<h2 class=" text-uppercase float-start" style="font-size: 16px; background: -webkit-linear-gradient(#319bd2, #319bd2); -webkit-background-clip: text; -webkit-text-fill-color: transparent;  font-weight: 800;">Result Page</h2>
				            </div>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 " style="padding-top: 16px">
						<div class="row" style="width: auto !important">
							<div class="col-lg-6 col-md-6 col-sm-12" style="padding: 0px 12px; color: #000000; font-size: 12px; font-weight: 600;">
								<ul style="list-style-type:none;padding: 0px !important">
							  		<li>
							  			<div class="row">
							  				<div class="col-lg-6 col-md-6 col-sm-6 text-left">Candidate Name : <span style="color: #319bd2; margin-left: 16px">${testUser.name}</span></div>

							  			</div> 
								  		
							  		</li>
							  		<li>
							  			<div class="row">
							  				<div class="col-lg-6 col-md-6 col-sm-6 text-left">Email : <span style="color: #319bd2; margin-left: 16px">${testUser.email}</span> </div>

							  			</div> 
							  		</li>
							  		<li>
							  			<div class="row">
							  				<div class="col-lg-6 col-md-6 col-sm-6 text-left">Test Name : <span style="color: #319bd2; margin-left: 16px">${test_name}</span> </div>

							  			</div> 
							  		</li>
								</ul>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-12" style="padding: 0px 12px; color: #000000; font-size: 12px; font-weight: 600;">
								<ul style="list-style-type:none;padding: 0px !important">
							  		<li>
							  			<div class="row">
							  				<div class="col-lg-6 col-md-6 col-sm-6 text-left">Examination Date : <span style="color: #319bd2; margin-left: 16px"><fmt:formatDate value="${test_date}" pattern="dd-MMM-yyyy"/></span></div>

							  			</div> 
							  		</li>
							  		
							  		<li>
							  			<div class="row">
							  				<div class="col-lg-6 col-md-6 col-sm-6 text-left">Total Time : <span style="color: #319bd2; margin-left: 16px">${start_time}</span></div>

							  			</div> 
							  		</li>
							  		
							  		<li>
							  			<div class="row">
							  				<div class="col-lg-6 col-md-6 col-sm-6 text-left">Time Taken : <span style="color: #319bd2; margin-left: 16px">${end_time}</span></div>

							  			</div> 
							  		</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12" style="padding-right: 6px; padding-left: 6px;">
						<div class="table-responsive"> 
							<table class="table table-bordered" id = "testRes" style="font-size: 12px">
								<thead class="thead-dark" style="background: -webkit-linear-gradient(#379ed7, #379ed7);">
								  <tr>
								    <th class="text-left">Total Number of MCQs:</th>
								    <th class="text-center">Total Correct:</th>
								    <th class="text-center">Total Wrong:</th>		
								      <th class="text-center">Percentage:</th>								   
								  </tr>
								</thead>
								<tbody>
								  <tr style="font-weight:900">
								    <td class="text-left">${mcQtotal}</td>
									<td class="text-center">${mcQcorrect}</td>	
									<td class="text-center">${mcQWrong}</td>		
									<td class="text-center">${mcPercetage}</td>										
								  </tr>
								</tbody>
							</table>
						</div>
					</div>
					
				</div>
        	    <div class="multisteps_form position-relative" style="margin-top: 3rem!important;">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div id="answerKey">
						<c:if test="${mcQtotal > 0 }">
							<div style="background-color: #03b97c; padding: 8px; margin: 12px 0; color: #fff; font-weight: 600;text-align: center" onclick="answerKeyView()" class="answerKeyHead">
								<span class="show_text">View Answer Key </span> <span class = "hide_text">Hide Answer Key</span>
							</div>
						</c:if>
						<div class="viewAnswers" style=" padding: 16px 0; color: #000000; font-size: 12px; font-weight: 600;">
							<div>							  	
							  	<c:forEach var="obj" varStatus="status" items="${testanswerList}">	
											<div class="question-answer">
												<input type="hidden" id="txt_ques_id${obj.question_id}" value="${obj.question_id}">
												<div class="question"><span class="quest_num"> </span> <span>${obj.question}</span></div>
												<div class="options">
													<ul class= "no-ul-list">
														<c:if test="${obj.option1 != null || not empty obj.option1}">														
															<li>																
																	<c:choose>
																		<c:when test="${obj.option1 eq obj.test_answer}">
																			<input id="a1-${obj.question_id}" class="checkbox-custom" checked="checked" type="radio" name='option${obj.question_id}' value='${obj.option1}'>  ${obj.option1}
																		</c:when>
																		<c:otherwise>
																			<input id="a1-${obj.question_id}" class="checkbox-custom" disabled type="radio" name='option${obj.question_id}' value='${obj.option1}'>  ${obj.option1}
																		</c:otherwise>
																	</c:choose>
															</li>
															</c:if>
															<c:if test="${obj.option2 != null || not empty obj.option2}">
															<li>
																	<c:choose>
																		<c:when test="${obj.option2 eq obj.test_answer}">
																			<input id="a2-${obj.question_id}" class="checkbox-custom" checked="checked" type="radio" name='option${obj.question_id}' value='${obj.option2}'>  ${obj.option2}
																		</c:when>
																		<c:otherwise>
																			<input id="a2-${obj.question_id}" class="checkbox-custom" disabled type="radio" name='option${obj.question_id}' value='${obj.option2}'>  ${obj.option2}
																		</c:otherwise>
																	</c:choose>
															</li>
															</c:if>		
															<c:if test="${obj.option3 != null || not empty obj.option3}">
															<li>												
																	<c:choose>
																		<c:when test="${obj.option3 eq obj.test_answer}">
																			<input id="a3-${obj.question_id}" class="checkbox-custom" checked="checked" type="radio" name='option${obj.question_id}' value='${obj.option3}'>  ${obj.option3}
																		</c:when>
																		<c:otherwise>
																			<input id="a3-${obj.question_id}" class="checkbox-custom" disabled type="radio" name='option${obj.question_id}' value='${obj.option3}'>  ${obj.option3}
																		</c:otherwise>
																	</c:choose>
															
															</li>
															</c:if>	
															<c:if test="${obj.option4 != null || not empty obj.option4}">
															<li>	
																
																	<c:choose>
																		<c:when test="${obj.option4 eq obj.test_answer}">
																			<input id="a4-${obj.question_id}" class="checkbox-custom" checked="checked" type="radio" name='option${obj.question_id}' value='${obj.option4}'>  ${obj.option4}
																		</c:when>
																		<c:otherwise>
																			<input id="a4-${obj.question_id}" class="checkbox-custom" disabled type="radio" name='option${obj.question_id}' value='${obj.option4}'>  ${obj.option4}
																		</c:otherwise>
																	</c:choose>
															</li>
														</c:if>		
														<c:if test="${obj.option5 != null || not empty obj.option5}">
															<li>	
																
																	<c:choose>
																		<c:when test="${obj.option5 eq obj.test_answer}">
																			<input id="a4-${obj.question_id}" class="checkbox-custom" checked="checked" type="radio" name='option${obj.question_id}' value='${obj.option5}'>  ${obj.option5}
																		</c:when>
																		<c:otherwise>
																			<input id="a4-${obj.question_id}" class="checkbox-custom" disabled type="radio" name='option${obj.question_id}' value='${obj.option5}'>  ${obj.option5}
																		</c:otherwise>
																	</c:choose>
															</li>
														</c:if>		
														<c:if test="${obj.option6 != null || not empty obj.option6}">
															<li>	
																	<c:choose>
																		<c:when test="${obj.option6 eq obj.test_answer}">
																			<input id="a4-${obj.question_id}" class="checkbox-custom" checked="checked" type="radio" name='option${obj.question_id}' value='${obj.option6}'>  ${obj.option6}
																		</c:when>
																		<c:otherwise>
																			<input id="a4-${obj.question_id}" class="checkbox-custom" disabled type="radio" name='option${obj.question_id}' value='${obj.option6}'>  ${obj.option6}
																		</c:otherwise>
																	</c:choose>
															</li>
														</c:if>				
													</ul>
												</div>
												<c:choose>
													<c:when test="${obj.correct_or_not eq 'N'}">
														<div style="color: red; ; font-weight: 600; padding: 0px 16px 8px;">WRONG ANSWER</div>
														<div style="color: #3cab3c; font-weight: 600; padding: 0px 16px 8px;">CORRECT ANSWER IS : ${obj.correct_answer}</div>
													</c:when>
													<c:otherwise>
														<div style="color: #3cab3c; font-weight: 600; padding: 0px 16px 8px;">CORRECT ANSWER</div>
													</c:otherwise>
												</c:choose>		
											</div>																
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
        </div>
    </div>
</div>

