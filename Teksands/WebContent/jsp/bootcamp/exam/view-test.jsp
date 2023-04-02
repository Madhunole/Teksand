<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.text-bold {
	font-weight: bold;
}
.panel-default {
    border-color: #ddd;
}
.panel {
    margin-bottom: 20px;
    background-color: #fff;
    border: 1px solid transparent;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 1px rgb(0 0 0 / 5%);
    box-shadow: 0 1px 1px rgb(0 0 0 / 5%);
}
.panel-heading {
    padding: 10px 15px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
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

.panel-heading {
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

.form-check-input {
    margin-top: -6px !important;
}
img#theImg {
    width: 266px !important;
}
.mr-2
{
	margin-right: 10px !important;
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

var test_qns_type = "";

$( document ).ready(function() {
	
	$('#view_question').dataTable( {
		paging: false,
        ordering: false,
        info: false,
	} );
	
	$('#userList_dataTable').dataTable( {
		"ordering": false,
	} );
	
	$(".qns_type").hide();
	$(".qns_mcq").hide();
	$(".qns_written").hide();
	$(".qns_voice").hide();
	$(".qns_upload_type").hide();
	
	var table = $('#question_list').removeAttr('width').DataTable( {
        paging: true,
        
    } );
	var table = $('#user_list').removeAttr('width').DataTable( {
        paging: true,
        
    } );
});

function showTypeQuestion()
{
	$(".qns_upload_type").show();
}

function showUploadType()
{
	var qns_upload_type = $("#qns_upload_type").val();
	
	if(qns_upload_type == "manual"){
		showQusType();
	}else{
		openUploadPopUp();
		
		//$("#qns_type").val("select");
		
		$("#qns_type").val($("#qns_type option:first").val());
		$(".qns_type").hide();
		$(".question_table").hide();
		$(".user_table").hide();
		$(".qns_mcq").hide();
		$(".qns_written").hide();
		$(".qns_voice").hide();
	}
	
}

function showQusType()
{
	$(".qns_type").show();
	$(".question_table").hide();
	$(".user_table").hide();
}

function showAddQuestion()
{
	var qns_type = $("#qns_type").val();
	
	test_qns_type = qns_type;
	
	if(qns_type == "mcq"){
		$(".qns_mcq").show();
		$(".qns_written").hide();
		$(".qns_voice").hide();
		$(".question_table").hide();
		$(".user_table").hide();
	}else if(qns_type == "written"){
		$(".qns_mcq").hide();
		$(".qns_written").show();
		$(".qns_voice").hide();
		$(".question_table").hide();
		$(".user_table").hide();
	}else if(qns_type == "voice"){
		$(".qns_mcq").hide();
		$(".qns_written").hide();
		$(".qns_voice").show();
		$(".question_table").hide();
		$(".user_table").hide();
	}else{
		$(".qns_mcq").hide();
		$(".qns_written").hide();
		$(".qns_voice").hide();
		$(".question_table").show();
		$(".user_table").show();
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
	$.post("/bootcamp/addTestQuestion", {
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
   				location.reload();
			}
   			else
   			{
   				location.reload();
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
   			
   			$(".question_table").show();
   			$(".user_table").show();
   			
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
	$.post("/bootcamp/getQuestionsById", {question_id: "" + question_id + "", }, function(data)
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
	
	swal({
	      title: 'Are you sure to delete this Test?',
	      text: "You won't be able to revert this!",
	      type: 'warning',
	      showCancelButton: true,
	      confirmButtonText: 'Confirm',
	      padding: '2em'
	   	}).then(function(result) {
	      if (result.value) 
	      {
	        $.LoadingOverlay("show");
	    	   
	    	  $.ajaxSetup({async:true});
	    	  $.post("/bootcamp/deleteQuestion", {question_id : "" + question_id + "",}, function(data)
		  	    {
	  				$.LoadingOverlay("hide");
	  				
	  				var result = $.trim(data);
	    			var obj = jQuery.parseJSON(result);
	    			if(obj.status_code == 200)
	    			{
	    				swal({title: "Deleted!",text: obj.msg,type: "success"}).then(function() {location.reload();});
	    			} else {
	    				swal("OOPS!", obj.msg, "error");
	    			 	return false;
	    			}
		  	  },'text');
	    	  
	      }
	    })
}

function generateTestLink(id)
{
	var test_id = id;
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/generateTestLinkById", {test_id: "" + test_id + "", }, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
  		if(obj.status_code == 200)
   		{
  			var test_link = obj.status;
  			location.reload(true);  			
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

function downloadTestUserByTestId(id)
{
	top.location =  "/bootcamp/downloadXLAllTestUsersAnswerByTestId?test_id="+id+"";
}

function openUploadPopUp()
{
	$("#question_bulk_upload").modal("show");
}

$(function() {
	$('#form-submit').click(function(e){
	 	e.preventDefault();
	 	
	 	var filename = $("#file").val();
	 	
	 	var test_id = $("#test_id").val();
	 	
	 	if(filename == "")
	 	{
	 		swal("OOPS!", "Please select the file" , "error");
		 	return false;
	 	}

		var formData = new FormData($("#multiform")[0]);
		$.LoadingOverlay("show");
		$.ajaxSetup({async:true});
		$.ajax({
		    url: '/bootcamp/bulkUploadTestQuestionsByTestId?test_id='+test_id+'',
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
		    	$('#question_bulk_upload').modal('toggle');
		    	if(obj.status_code == 200){
		    		swal({title: "Success!", text: obj.msg, type: "success"},function(){ location.reload();});	
		    	}else{
		    		swal("OOPS!", obj.msg, "error");
				 	return false;
		    	}
		    	
		    }
		  });

	 	return false;
	});
});

function showProfilePicture(url)
{
	var imagePath = url;
	
	$('#theImg').attr('src', '');
	
	$('#profile_picture').prepend('<img id="theImg" src="'+imagePath+'" />');
	
	$("#show_profile_picture").modal("show");
}

</script>

<div class="col-6 col-xl-auto mb-3">
    <a class="btn btn-sm btn-light text-primary" href="/bootcamp/list-test">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
        Back to Test List
    </a>
    
</div>

<section>
	<div class="container py-2">
		<div class="row">
			<div class="col-lg-12">
				<div class="card mb-4">
					<div class="card-header">
						<div class="row">
							<div class="col-lg-6"><h6 class="m-0 font-weight-bold text-primary float-left"><c:out value="${test.test_name}"></c:out></h6></div>
							<div class="col-lg-6">
								<a href="javascript:void(0)" class="btn btn-info cms-btn cms-btn-xs float-right">Time: ${test.test_time} minutes</a>	
								<c:if test="${empty test.test_link}">
									<a href="javascript:void(0)"
										onclick="generateTestLink(${test.test_id})"
										class="btn btn-primary cms-btn cms-btn-xs mr-2 float-right">Generate Test
										Link</a>
								</c:if>
								<c:if test="${not empty test.test_link}">
									<button data-text="${test.test_link}"
										class="btn btn-primary cms-btn cms-btn-xs mr-2 float-right"
										onclick="copyTestLink()">Copy Test Link</button>
										<input type="hidden" id="test_link" value="${test.test_link}" />
								</c:if>	
			            	</div>
						</div>
					</div>
					<div class="card-body">
						<p><c:out value="${test.test_description}" escapeXml="false" /></p>
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
						<div class="row">
							<div class="col-lg-12 my-3">
								<button onclick="showTypeQuestion()" class="btn btn-primary btn-sm float-right text-bold"><i class="fa fa-plus-circle"> Add Question</i></button>
							</div>
							<div class="col-lg-6 qns_upload_type">
								<select class="form-control" id="qns_upload_type" name="qns_upload_type" onchange="showUploadType()">
									<option selected disabled="disabled">Select a Type</option>
									<option value="manual">Manual</option>
									<option value="upload">Upload</option>
								</select>
							</div>
							<div class="col-lg-6 qns_type">
								<select class="form-control" id="qns_type" name="qns_type" onchange="showAddQuestion()">
									<option value="question_select" selected disabled="disabled">Select the Question Type</option>
									<option value="mcq">MCQ</option>
									<option value="written">Written</option>
									<option value="voice">Voice</option>
								</select>
							</div>
						</div>
					</div>
					<div class="card-body qns_mcq">
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label>Question</label>
									<input type="text" id="mcq_question" class="form-control" placeholder="Enter a Question">
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<div class="input-group mb-2">	
										<div class="input-group-prepend">
								        	<div class="input-group-text">
								        		<div class="form-check">
								          			<input class="form-check-input" type="radio" name="option" id="radio_option_1" value="1">
								        		</div>
								          	</div>
								        </div>
								        <input type="text" class="form-control" id="option_1" placeholder="Option 1">
								     </div>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<div class="input-group mb-2">	
										<div class="input-group-prepend">
								        	<div class="input-group-text">
								        		<div class="form-check">
								          			<input class="form-check-input" type="radio" name="option" id="radio_option_2" value="2">
								        		</div>
								          	</div>
								        </div>
								        <input type="text" class="form-control" id="option_2" placeholder="Option 2">
								     </div>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<div class="input-group mb-2">	
										<div class="input-group-prepend">
								        	<div class="input-group-text">
								        		<div class="form-check">
								          			<input class="form-check-input" type="radio" name="option" id="radio_option_3" value="3">
								        		</div>
								          	</div>
								        </div>
								        <input type="text" class="form-control" id="option_3" placeholder="Option 3">
								     </div>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<div class="input-group mb-2">	
										<div class="input-group-prepend">
								        	<div class="input-group-text">
								        		<div class="form-check">
								          			<input class="form-check-input" type="radio" name="option" id="radio_option_4" value="4">
								        		</div>
								          	</div>
								        </div>
								        <input type="text" class="form-control" id="option_4" placeholder="Option 4">
								     </div>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<div class="input-group mb-2">	
										<div class="input-group-prepend">
								        	<div class="input-group-text">
								        		<div class="form-check">
								          			<input class="form-check-input" type="radio" name="option" id="radio_option_5" value="5">
								        		</div>
								          	</div>
								        </div>
								        <input type="text" class="form-control" id="option_5" placeholder="Option 5">
								     </div>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<div class="input-group mb-2">	
										<div class="input-group-prepend">
								        	<div class="input-group-text">
								        		<div class="form-check">
								          			<input class="form-check-input" type="radio" name="option" id="radio_option_6" value="6">
								        		</div>
								          	</div>
								        </div>
								        <input type="text" class="form-control" id="option_6" placeholder="Option 6">
								     </div>
								</div>
							</div>
							<div class="col-lg-12 text-center">
								<button class="btn btn-primary" onclick="addQuestion()">Submit</button>
								<input type="hidden" id="quest_id" value=""/>
							</div>
						</div>
					</div>
					<div class="card-body qns_written">
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label>Question</label>
									<input type="text" id="written_question" class="form-control" placeholder="Enter a Question">
								</div>
							</div>
						</div>
						<div class="col-lg-12 text-center">
							<button class="btn btn-primary" onclick="addQuestion()">Submit</button>
						</div>
					</div>
					<div class="card-body qns_voice">
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label>Question</label>
									<input type="text" id="voice_question" class="form-control" placeholder="Enter a Question">
								</div>
							</div>
						</div>
						<div class="col-lg-12 text-center">
							<button class="btn btn-primary" onclick="addQuestion()">Submit</button>
						</div>
					</div>
					<div class="card-body question_table">
						<div class="card">
							<div class="card-header"><b>Questions</b></div>
							<div class="card-body">
					            <div class="table-responsive">
					                <table class="table table-bordered" id="view_question" width="100%" cellspacing="0">
					                    <thead>
					                        <tr>
												<th>Question</th>
												<th>Question Type</th>
												<th>Created Date</th>
												<th>Action</th>
					                        </tr>
					                    </thead>
					                    <tbody>
					                    	<c:forEach items="${testQuestion}" var="testQuestion">
												<tr>
													<td><c:out value="${testQuestion.question}" /></td>
													<td><c:out value="${testQuestion.question_type}" /></td>
													<td><fmt:formatDate value="${testQuestion.created_date}" pattern="dd-MMM-yyyy"/></td>								
														<td class="text-center">    
					                                   <div class="dropdown custom-dropdown">
					                                       <a class="dropdown-toggle font-20 text-primary" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					                                           <i class="fas fa-cog"></i>
					                                       </a>
					                                       <div class="dropdown-menu" aria-labelledby="dropdownMenuLink1" style="will-change: transform;">
					                                           <a class="dropdown-item" href="javascript:void(0)" onclick="editQuestion(${testQuestion.question_id})">Edit</a>
					                                           <a class="dropdown-item" href="javascript:void(0)" onclick="deleteQuestion(${testQuestion.question_id})">Delete</a>
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
					<div class="card-body user_table">
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col-lg-6"><h6 class="m-0 font-weight-bold text-primary float-left">Users</h6></div>
									<div class="col-lg-6">
										<button class="btn btn-primary cms-btn cms-btn-xs float-right" onclick="downloadTestUserByTestId(${test.test_id})">Download Users</button>				
					            	</div>
								</div>
							</div>
							<div class="card-body">
					            <div class="table-responsive">
					                <table class="table table-bordered" id="userList_dataTable" width="100%" cellspacing="0">
					                    <thead>
					                        <tr>
												<th>Submitted Date</th>
												<th>Name</th>
												<th>Email Id</th>
												<th>Mobile No</th>
												<th style="text-align: center;">Action</th>
					                        </tr>
					                    </thead>
					                    <tbody>
					                    	<c:forEach items="${testUser}" var="testUser">
												<tr>
													<td><fmt:formatDate type = "both" value = "${testUser.created_date}" /></td>
													<td><c:out value="${testUser.name}" /></td>
													<td><c:out value="${testUser.email}" /></td>
													<td><c:out value="${testUser.mobile}" /></td>
													<td style="text-align: center;width: 25%;">
														<a href="/bootcamp/view-user-answer-list?test_id=${test.test_id}&user_id=${testUser.user_id}" class="btn btn-primary cms-btn-xs cms-btn float-right">View Answer List</a>
														<button class="btn btn-primary cms-btn-xs cms-btn float-right mr-2" onclick="showProfilePicture('${testUser.profile_picture}')">Show Image</button>										
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
		</div>
	</div>
</section>

<div class="modal fade" id="question_bulk_upload" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Bulk Upload Question</h5>
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
								<input type="hidden" id="test_id" value="${test.test_id}" name="test_id">
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

<div class="modal fade bd-example-modal-sm" id="show_profile_picture" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body">
				<div id="profile_picture"></div>
			</div>
		</div>
	</div>
</div>