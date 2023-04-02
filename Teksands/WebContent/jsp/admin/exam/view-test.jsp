<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.text-bold {
	font-weight: bold;
}

.float-right {
	float: right;
}

.dropdown-item {
	display: block;
	width: 100%;
	padding: 0.25rem 1.5rem;
	clear: both;
	font-weight: 400;
	color: #3a3b45;
	text-align: inherit;
	white-space: nowrap;
	background-color: transparent;
	border: 0;
}

#question_list .dropdown-menu {
	margin: 0 0 0 -105px !important;
}

#question_list .dropdown {
	text-align: center;
}

.panel-default>.panel-heading {
	color: #fff !important;
	background-color: #3ca1db !important;
	border-color: #3ca1db !important;
}

.forum-titles {
	color: #fff;
	text-transform: uppercase;
	font-size: 13px;
	font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-weight: 700;
}
</style>

<script>
<c:choose>
	<c:when test="${empty test}">
		var test_id = "";																   
	</c:when>
	<c:otherwise>
		var test_id = ${test.test_id};
	</c:otherwise>
</c:choose>

$(document).ready(function () {
    $('#viewUserAnswerList').DataTable({
    	paging: false,
        ordering: false,
        info: false,
    });
});

var test_qns_type = "";

$( document ).ready(function() {
	$(".qns_type").hide();
	$(".qns_mcq").hide();
	$(".qns_written").hide();
	$(".qns_voice").hide();
	
	var table = $('#question_list').removeAttr('width').DataTable( {
        paging: true,
        
    } );
	var table = $('#user_list').removeAttr('width').DataTable( {
        paging: true,
        
    } );
});

function showQusType()
{
	$(".qns_type").show();
}

function showAddQuestion()
{
	var qns_type = $("#qns_type").val();
	
	test_qns_type = qns_type;
	
	if(qns_type == "mcq"){
		$(".qns_mcq").show();
		$(".qns_written").hide();
		$(".qns_voice").hide();
	}else if(qns_type == "written"){
		$(".qns_mcq").hide();
		$(".qns_written").show();
		$(".qns_voice").hide();
	}else if(qns_type == "voice"){
		$(".qns_mcq").hide();
		$(".qns_written").hide();
		$(".qns_voice").show();
	}else{
		$(".qns_mcq").hide();
		$(".qns_written").hide();
		$(".qns_voice").hide();
	}
}

function addQuestion()
{	
	var quest_id ="";
	var question = "";
	var option1 = "";
	var option2 = "";
	var option3 = "";
	var option4 = "";
	var option5 = "";
	var option6 = "";
	var correct_answer = "";
	quest_id = $("#quest_id").val();	
	var qns_type = $("#qns_type").val();
	
	test_qns_type = qns_type;
	if(test_qns_type == "mcq"){		
		question = $("#mcq_question").val();		
		option1 = $("#option_1").val();
		option2 = $("#option_2").val();
		option3 = $("#option_3").val();
		option4 = $("#option_4").val();
		option5 = $("#option_5").val();
		option6 = $("#option_6").val();
		var answer_no = $('input[name="option"]:checked').val();
		correct_answer = $("#option_"+answer_no).val();
		
		if(question == ""){
	    	swal("OOPS!", "Please Enter Question", "error");
		 	return false;
	    }
		
		if(option1 == ""){
	    	swal("OOPS!", "Please Enter option1", "error");
		 	return false;
	    }
		
		if(option2 == ""){
	    	swal("OOPS!", "Please Enter option2", "error");
		 	return false;
	    }
		
		if(option3 == ""){
	    	swal("OOPS!", "Please Enter option3", "error");
		 	return false;
	    }
		
		if(option4 == ""){
	    	swal("OOPS!", "Please Enter option4", "error");
		 	return false;
	    }
		
		if(option5 == ""){
	    	swal("OOPS!", "Please Enter option5", "error");
		 	return false;
	    }
		
		if(option6 == ""){
	    	swal("OOPS!", "Please Enter option6", "error");
		 	return false;
	    }
		
		if($('input[name="option"]:checked').length == 0){
	    	swal("OOPS!", "Please Select the Correct Answer", "error");
		 	return false;
	    }
	}
	
	if(test_qns_type == "written"){
		question = $("#written_question").val();
		
		if(question == ""){
	    	swal("OOPS!", "Please Enter Question", "error");
		 	return false;
	    }
	}
		
	if(test_qns_type == "voice"){
		
		question = $("#voice_question").val();
		
		if(question == ""){
	    	swal("OOPS!", "Please Enter Question", "error");
		 	return false;
	    }
	}
	
	$.ajaxSetup({async:false});
	$.post("/admin/addTestQuestion", {
		test_id: "" + test_id + "", 
		test_qns_type: "" + test_qns_type + "",
		quest_id: "" + quest_id + "", 
		question: "" + question + "", 
		option1: "" + option1 + "",
		option2: "" + option2 + "",
		option3: "" + option3 + "",
		option4: "" + option4 + "",
		option5: "" + option5 + "",
		option6: "" + option6 + "",
		correct_answer: "" + correct_answer + "",}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
   			if(quest_id != "")
			{
   				swal({title: "Success!", text: "Test Question Updated Successfully", type: "success"},function(){ location.reload();});
			}
   			else
   			{
  			swal({title: "Success!", text: "Test Question Added Successfully", type: "success"},function(){ location.reload();});
   			}

   			$("#mcq_question").val("");
   			$("#written_question").val("");
   			$("#voice_question").val("");
   			$("#option_1").val("");
   			$("#option_2").val("");
   			$("#option_3").val("");
   			$("#option_4").val("");
   			$("#option_5").val("");
   			$("#option_6").val("");
   		} else {
   			swal("OOPS!", "Please Enter Correct Details", "error");
   		 	return false;
   		}
		
	},'text');
	
}

function editQuestion(id)
{
	var question_id = id;
	
	$.ajaxSetup({async:false});
	$.post("/admin/getQuestionsById", {question_id: "" + question_id + "", }, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
  		if(obj != null)
   		{
  			var question_type = obj.question_type;
  			var question = obj.question;
  			var option1 = obj.option1;
  			var option2 = obj.option2;
  			var option3 = obj.option3;
  			var option4 = obj.option4;
  			var option5 = obj.option5;
  			var option6 = obj.option6;
  			var correct_answer = obj.correct_answer;
  			
  			console.log("correct_answer = " + correct_answer);
  			$("#quest_id").val(question_id);
  			if(question_type == "mcq"){
  				$("#qns_type").val(question_type);
  				$("#mcq_question").val(question);
  				$("#option_1").val(option1);
  				$("#option_2").val(option2);
  				$("#option_3").val(option3);
  				$("#option_4").val(option4);
  				$("#option_5").val(option5);
  				$("#option_6").val(option6);
  				
  				if(correct_answer == option1){
  					
  					$("#radio_option_1").prop("checked", true);
  				}
  				if(correct_answer == option2){
  					$("#radio_option_2").prop("checked", true);
  				}
  				if(correct_answer == option3){
  					$("#radio_option_3").prop("checked", true);
  				}
  				if(correct_answer == option4){
  					$("#radio_option_4").prop("checked", true);
  				}
  				if(correct_answer == option5){
  					$("#radio_option_5").prop("checked", true);
  				}
  				if(correct_answer == option6){
  					$("#radio_option_6").prop("checked", true);
  				}
  				
  				$(".qns_mcq").show();
  				$(".qns_written").hide();
  				$(".qns_voice").hide();
  				$('html').animate({ scrollTop: $("#mcq_question").offset().top-100 }, "slow");
  			}
  			
  			if(question_type == "written"){
  				$("#qns_type").val(question_type);
  				$("#written_question").val(question);
  				$(".qns_mcq").hide();
  				$(".qns_written").show();
  				$(".qns_voice").hide();
  				$('html').animate({ scrollTop: $("#written_question").offset().top-100 }, "slow");
  			}
  				
  			if(question_type == "voice"){
  				$("#qns_type").val(question_type);
  				$("#voice_question").val(question);
  				$(".qns_mcq").hide();
  				$(".qns_written").hide();
  				$(".qns_voice").show();
  				$('html').animate({ scrollTop: $("#voice_question").offset().top-100 }, "slow");
 			}
   			
   		} else {
   			swal("OOPS!", "Something Error!", "error");
   		 	return false;
   		}

	},'text');
}

function deleteQuestion(id)
{
	var question_id = id;
	
	const sweetOptions = {
	    title: "Are you sure  you want to delete this Question?",
	    text: "You won't be able to revert this!",
	    type: "warning",
	    showCancelButton: true,
	    confirmButtonText: "Yes!",
	    cancelButtonText: "Cancel!",
	    closeOnConfirm: false,
	    closeOnCancel: false 
	}
		
	swal(sweetOptions, (isConfirmed) => {
	    if (isConfirmed) {
	    	$.LoadingOverlay("show");
	    	   
	    	  $.ajaxSetup({async:true});
	    	  $.post("/admin/deleteQuestion", {question_id : "" + question_id + "",}, function(data)
		  	    {
	  				$.LoadingOverlay("hide");
	  				
	  				var result = $.trim(data);
	    			var obj = jQuery.parseJSON(result);
	    			if(obj.status_code == 200)
	    			{
	    				swal({title: "Success!", text: obj.msg, type: "success"},function(){ location.reload();});
	    			} else {
	    				swal("OOPS!", obj.msg, "error");
	    			 	return false;
	    			}
		  	  },'text');
	    } else {
	        swal("Cancelled", "Delete cancelled", "error");
	    }
	 })
}

function generateTestLink(id)
{
	var test_id = id;
	
	$.ajaxSetup({async:false});
	$.post("/admin/generateTestLinkById", {test_id: "" + test_id + "", }, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
  		if(obj.status_code == 200)
   		{
  			var test_link = obj.status;
  			swal({title: "Success!", text: "Test Link Created Successfully", type: "success"},function(){ location.reload();});
  			
   		} else {
   			swal("OOPS!", "Something Error!", "error");
   		 	return false;
   		}

	},'text');
}
function copyTestLink()
{
	  var copyText = $("#test_link").val();
	  var textarea = document.createElement("textarea");
	  textarea.textContent = copyText;
	  textarea.style.position = "fixed"; // Prevent scrolling to bottom of page in MS Edge.
	  document.body.appendChild(textarea);
	  textarea.select();
	  document.execCommand("copy"); 
}
/*function copyTestLink()
{
	$('.copyboard').on('click', function(e) {
	  e.preventDefault();
	  var copyText = $(this).attr('data-text');

	  var textarea = document.createElement("textarea");
	  textarea.textContent = copyText;
	  textarea.style.position = "fixed"; // Prevent scrolling to bottom of page in MS Edge.
	  document.body.appendChild(textarea);
	  textarea.select();
	  document.execCommand("copy"); 

	  document.body.removeChild(textarea);
	})
}*/
</script>

<div id="main">
	<div class="visible-md visible-xs visible-sm mobile-menu">
		<button type="button" data-toggle="offcanvas">
			<i class="fa fa-bars"></i>
		</button>
	</div>
	<section class="section bgw">
		<div class="container-fluid">
			<div class="section-title-2 text-center course-title">
				<h2>Teksands View Test sdsd</h2>
				<hr>
			</div>
			<div id="bbpress-forums" class="panel panel-default">
				<div class="panel-heading bbp-header">
					<div class="row">
						<div class="col-lg-6">
							<h4 class="forum-titles">
								<c:out value="${test.test_name}"></c:out>
							</h4>
						</div>
						<div class="col-lg-6">
							<c:if test="${empty test.test_link}">
								<a href="javascript:void(0)"
									onclick="generateTestLink(${test.test_id})"
									class="btn btn-warning btn-sm float-right">Generate Test
									Link</a>
							</c:if>
							<c:if test="${not empty test.test_link}">
								<button data-text="${test.test_link}"
									class="copyboard btn btn-warning btn-sm float-right"
									onclick="copyTestLink()">Copy Test Link</button>
									<input type="hidden" id="test_link" value="${test.test_link}" />
							</c:if>
							
						</div>
					</div>
				</div>
				<div class="panel-body">
					<p>
						<c:out value="${test.test_description}"></c:out>
					</p>
					<div class="row">
						<div class="col-lg-4">
							<p>
								<span class="text-bold">Topic 1</span> : <span><c:out
										value="${test.test_topic_1}"></c:out></span>
							</p>
						</div>
						<div class="col-lg-4">
							<p>
								<span class="text-bold">Topic 2</span> : <span><c:out
										value="${test.test_topic_2}"></c:out></span>
							</p>
						</div>
						<div class="col-lg-4">
							<p>
								<span class="text-bold">Topic 3</span> : <span><c:out
										value="${test.test_topic_3}"></c:out></span>
							</p>
						</div>
					</div>
					<div class="col-lg-12">
						<button onclick="showQusType()"
							class="btn btn-primary float-right text-bold">
							<i class="fa fa-plus-circle"> Add Question</i>
						</button>
					</div>
					<div class="row">
						<div class="col-lg-6 qns_type">
							<select class="form-control" id="qns_type" name="qns_type"
								onchange="showAddQuestion()">
								<option>Select the Question Type</option>
								<option value="mcq">MCQ</option>
								<option value="written">Written</option>
								<option value="voice">Voice</option>
							</select>
						</div>
					</div>
					<div class="panel panel-default qns_mcq" style="margin-top: 30px;">
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-12">
									<div class="form-group">
										<label>Question</label> <input type="text" id="mcq_question" class="form-control" placeholder="question">
									</div>
								</div>
								<div class="col-lg-12">
									<div class="btn-group" data-toggle="buttons">
										<div class="row">
											<div class="col-lg-4">
												<label>Option 1</label>
												<div class="input-group" style="margin-bottom: 15px;">
													<span class="input-group-addon"><input type="radio"
														id="radio_option_1" name="option" value="1" /></span> <input
														type="text" class="form-control" id="option_1"
														placeholder="Option 1">
												</div>
											</div>
											<div class="col-lg-4">
												<label>Option 2</label>
												<div class="input-group" style="margin-bottom: 15px;">
													<span class="input-group-addon"><input type="radio"
														id="radio_option_2" name="option" value="2" /></span> <input
														type="text" class="form-control" id="option_2"
														placeholder="Option 2">
												</div>
											</div>
											<div class="col-lg-4">
												<label>Option 3</label>
												<div class="input-group" style="margin-bottom: 15px;">
													<span class="input-group-addon"><input type="radio"
														id="radio_option_3" name="option" value="3" /></span> <input
														type="text" class="form-control" id="option_3"
														placeholder="Option 3">
												</div>
											</div>
											<div class="col-lg-4">
												<label>Option 4</label>
												<div class="input-group" style="margin-bottom: 15px;">
													<span class="input-group-addon"><input type="radio"
														id="radio_option_4" name="option" value="4" /></span> <input
														type="text" class="form-control" id="option_4"
														placeholder="Option 4">
												</div>
											</div>
											<div class="col-lg-4">
												<label>Option 5</label>
												<div class="input-group" style="margin-bottom: 15px;">
													<span class="input-group-addon"><input type="radio"
														id="radio_option_5" name="option" value="5" /></span> <input
														type="text" class="form-control" id="option_5"
														placeholder="Option 5">
												</div>
											</div>
											<div class="col-lg-4">
												<label>Option 6</label>
												<div class="input-group" style="margin-bottom: 15px;">
													<span class="input-group-addon"><input type="radio"
														id="radio_option_6" name="option" value="6" /></span> <input
														type="text" class="form-control" id="option_6"
														placeholder="Option 6">
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-12 text-center">
									<button class="btn btn-primary" onclick="addQuestion()">Submit</button>
									<input type="hidden" id="quest_id" value=""/>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-default qns_written"
						style="margin-top: 30px;">
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-12">
									<div class="form-group">
										<label>Question</label> <input type="text" id="written_question" class="form-control" placeholder="question">
									</div>
								</div>
							</div>
							<div class="col-lg-12 text-center">
								<button class="btn btn-primary" onclick="addQuestion()">Submit</button>
							</div>
						</div>
					</div>
					<div class="panel panel-default qns_voice"
						style="margin-top: 30px;">
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-12">
									<div class="form-group">
										<label>Question</label> <input type="text" id="voice_question"
											class="form-control" placeholder="question">
									</div>
								</div>
							</div>
							<div class="col-lg-12 text-center">
								<button class="btn btn-primary" onclick="addQuestion()">Submit</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="forum-titles">Questions</h4>
				</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table id="question_list" class="table table-bordered dt-responsive" style="font-size: 12px; width: 100%;">
							<thead class="thead-dark">
								<tr>
									<th style="width: 5%;">Id</th>
									<th>Question</th>
									<th>Question Type</th>
									<th>Created Date</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${testQuestion}" var="testQuestion">
									<tr>
										<td><c:out value="${testQuestion.question_id}" /></td>
										<td><c:out value="${testQuestion.question}" /></td>
										<td><c:out value="${testQuestion.question_type}" /></td>
										<td><fmt:formatDate value="${testQuestion.created_date}" pattern="dd-MMM-yyyy"/></td>
										<td>
											<div class="dropdown">
												<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
													<i class="fa fa-cog"></i>
												</button>
											 <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
												<li><a href="javascript:void(0)" onclick="editQuestion(${testQuestion.question_id})">Edit</a></li>
												<li><a href="javascript:void(0)" onclick="deleteQuestion(${testQuestion.question_id})">Delete</a></li>												
												</ul>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="forum-titles">Usersqqqqqqqqqqqqqqq</h4>
				</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table id="user_list" class="table table-bordered dt-responsive"
							style="font-size: 12px; width: 100%;">
							<thead class="thead-dark">
								<tr>
									<th style="width: 5%;">Id</th>
									<th>Name</th>
									<th>Email Id</th>
									<th>Mobile No</th>
									<th style="text-align: center;">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${testUser}" var="testUser">
									<tr>
										<td><c:out value="${testUser.user_id}" /></td>
										<td><c:out value="${testUser.name}" /></td>
										<td><c:out value="${testUser.email}" /></td>
										<td><c:out value="${testUser.mobile}" /></td>
										<td style="text-align: center;">
											<a href="/admin/view-user-answer-list?test_id=${test.test_id}&user_id=${testUser.user_id}" class="btn btn-primary btn-xs">View Answer List</a>											
										</td>
									</tr>
								</c:forEach> 
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>


<!-- The modal -->
<div class="modal fade" id="flipFlop" tabindex="-1" role="dialog"
	aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="modalLabel">Modal Title</h4>
			</div>
			<div class="modal-body">Modal content...</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
