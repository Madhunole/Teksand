<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" type="text/css" href="/resources/mcq/css/mcq.css">
<link rel="stylesheet" type="text/css" href="/resources/css/auth_1.css">
<script src="/resources/mcq/js/mcq.js" type="text/javascript"></script>
<script src="/resources/mcq/js/recorder.js" type="text/javascript"></script>

<style>
.user-info .form-control {
	border: 1px solid rgb(204, 204, 204) !important;
    height: 50px !important;
    box-shadow: none !important;
    border-radius: 0 !important;
    margin-bottom: 20px !important;
    border-color: #e9e9ec !important;
}
.user-info .form-control {
    display: block !important;
    width: 100% !important;
    padding: 6px 12px !important;
    font-size: 14px !important;
    line-height: 1.42857143 !important;
    color: #555 !important;
    background-color: #fff !important;
    background-image: none !important;
}
.user-info input, button, select, textarea {
    font-family: inherit !important;
    font-size: inherit !important;
    line-height: inherit !important;
}
.user-info label {
    display: inline-block !important;
    max-width: 100% !important;
    margin-bottom: 5px !important;
    font-weight: bold !important;
}
.user-info .form-group {
    margin-bottom: 15px !important;
}
.m-0 {
	margin: 0px !important;
}
.panel-heading {
    padding: 20px !important;
}
.content .entry-title {
    font-size: 17px !important;
}

.panel-default > .panel-heading {
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
.text-success-teal {
    color: #237a28 !important;
    font-size: 2.75rem;
}
.login-one-start {
    padding: 0 !important;
}
#recordingsList
{
    text-align: center;
    width: 38%;
    margin: 22px auto;
}
#recordingsList li
{
  display: grid !important;
}
.audiobtn a
{
	width: 100px !important;
    background: #3ca1db !important;
    border-color: #3ca1db !important;
    font-weight: bold !important;
    color: white !important;
    border: 0 none !important;
    border-radius: 0px !important;
    cursor: pointer!important;
    padding: 10px 5px !important;
    margin: 10px 5px !important;
    text-align: center !important;  	
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

var recordButton = "";
var stopButton = "";
var pauseButton = "";

var user_name = "";
var user_email = "";
var user_mobile = "";

var user_id = "";
var question_id = "";

$( document ).ready(function(){
	recordButton = document.getElementById("recordButton");
	stopButton = document.getElementById("stopButton");
	pauseButton = document.getElementById("pauseButton");
	$('.otp-info').hide();
	$('.otp_btn').hide();
	// DISABLE NEXT BUTTON UNTIL FORM CRITERIA MET

	var $panelsInput = $('.panels input'),
			$rowsInput = $('.rows input');

	$panelsInput.click(function () {
	  if ($(this).closest('.panels').find('input:checked').length >= 1 || $(this).closest('.panels').find('input:text') != "") {	
	    $(this).closest('.panels').find('.next-q').prop('disabled', false);
	  }
	  else {
	    $(this).closest('.panels').find('.next-q').prop('disabled', true);
	  }	
	});	
});

function validateMembershipTabs(step)
{
	var flag = true;
	
	/* if(step == 1)
	{
		flag = checkEmailAndTestIdExistOrNot();
	}else if(step == 2)
	{
		flag = verifyEmailOtpAndCreateUser();
	} */
	
	return flag;
}


function checkEmailAndTestIdExistOrNot()
{
	user_name = $("#user_name").val();
	user_email = $("#user_email").val();
	user_mobile = $("#user_mobile").val();
	
	$.ajaxSetup({async:false});
	$.post("/exam/checkEmailAndTestIdExistOrNot", {test_id: "" + test_id + "", user_name: "" + user_name + "", user_email: "" + user_email + "",}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
  			if(obj.status == "test_taken"){
  				swal("Success!", obj.msg, "success");
  				location.href = "/";
  			}
  			else if(obj.status == "old_user"){
  				swal("Success!", obj.msg, "success");  
  				user_id = obj.user_type_id;
  				$('#fieldsetuser').hide();
  				$('#fieldset1').show();
  				return true;
  			}  			
  			else{  				
  				swal("Success!", obj.msg, "success");  				
  				$('.user-info').hide();
  				$('.otp-info').show();
  				$('.user_btn').hide();
  				$('.otp_btn').show();  				
  				return false;
  			}
   		} else {
   			swal("OOPS!", "Please Enter Correct Details", "error");
   			return false;
   		}		
	},'text');
	
	return true;
}

function verifyEmailOtpAndCreateUser()
{
	var user_otp = $("#user_otp").val();
	
	if(user_otp == ""){
    	swal("OOPS!", "Please Enter Email OTP", "error");
	 	return false;
    }
	
	$.ajaxSetup({async:false});
	$.post("/exam/verifyEmailOtpAndCreateUser", {test_id: "" + test_id + "", user_name: "" + user_name + "", user_email: "" + user_email + "",user_mobile: "" + user_mobile + "",code: "" + user_otp + "",}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
   			swal("Success!", obj.msg, "success");
   			user_id = obj.user_type_id;
   			$('#fieldsetuser').hide();
			$('#fieldset1').show();
			$('.user-info').show();
   			return true;
   		} else {
   			swal("OOPS!", obj.msg, "error");
   		 	return false;
   		}
		
	},'text');
	
	return true;
}

function isEmail(email) {
	  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  return regex.test(email);
}

function startRecording() {
	$(".next-q").removeAttr('disabled');	
	var constraints = { audio: true, video:false }	
	$("#recordButton").attr("disabled", true);
    $("#stopButton").attr("disabled", false);
    $("#pauseButton").attr("disabled", false);

	navigator.mediaDevices.getUserMedia(constraints).then(function(stream) {
		audioContext = new AudioContext();
		document.getElementById("formats").innerHTML ="Format: 1 channel pcm @ "+audioContext.sampleRate/1000+"kHz"
		gumStream = stream;
		input = audioContext.createMediaStreamSource(stream);
		rec = new Recorder(input,{numChannels:1})
		rec.record()
	})
}

function pauseRecording(){
	if (rec.recording){
		rec.stop();
		pauseButton.innerHTML="Resume";
	}else{
		rec.record()
		pauseButton.innerHTML="Pause";
	}
}



function stopRecording(id) {
	
	question_id = id;
	
	$("#recordButton").attr("disabled", false);
    $("#stopButton").attr("disabled", true);
    $("#pauseButton").attr("disabled", true);
	
    
    
	pauseButton.innerHTML="Pause";
	rec.stop();
	gumStream.getAudioTracks()[0].stop();
	rec.exportWAV(createDownloadLink);
}

function createDownloadLink(blob) {
	
	console.log("createDownloadLink called");
	
	var url = URL.createObjectURL(blob);
	var au = document.createElement('audio');
	var li = document.createElement('li');
	var link = document.createElement('a');
	
	/*var filename = new Date().toISOString();
	au.controls = true;
	au.src = url;
	link.href = url;
	link.download = filename+".wav";
	link.innerHTML = "Save to disk";
	li.appendChild(au);
	li.appendChild(document.createTextNode(filename+".wav "))
	li.appendChild(link);*/
	
	var upload = document.createElement('a');
	upload.href="javascript:void(0)";
	upload.innerHTML = "Upload";
	
	upload.addEventListener("click", function(event){
		  var xhr = new XMLHttpRequest();
		  xhr.onload=function(e) {
		      if(this.readyState === 4) {
		          console.log("Server returned: ",e.target.responseText);
		      }
		  };
		  blobTobase64Audio(blob);
	})
	const lists = document.getElementsByClassName('recordingsList_'+question_id);
	
	li.appendChild(document.createTextNode (" "))
	li.appendChild(upload)
	lists[0].appendChild(li);

	//recordingsList.appendChild(li);
}

function blobTobase64Audio(blob)
{
	console.log("blobTobase64Audio called");
	
	console.log("blob : " + blob);
	
	var reader = new FileReader();
	var base64data;
	reader.readAsDataURL(blob); 
	reader.onloadend = function() 
	{
		base64data = reader.result;
		saveAudioFile(base64data);
	}	
}

function saveAudioFile(base64data)
{
	console.log("saveAudioFile called");
	
	var hdn_type = "voice";
	
	console.log("test_id = " + test_id);
	console.log("user_id = " + user_id);
	console.log("question_id = " + question_id);
	console.log("question_type = " + hdn_type);
	console.log("correct_answer = " + base64data);
	
	$.ajaxSetup({async:false});
	$.post("/exam/addAnswer", {test_id: "" + test_id + "", user_id: "" + user_id + "",  question_id: "" + question_id + "",  question_type: "" + hdn_type + "",correct_answer: "" + base64data + "",}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
		if(obj.status_code == 200)
   		{
			swal("Thank you", obj.msg, "success");
			return false;
   		} else {
   			swal("OOPS!", "Please Enter Correct Details", "error");
   		 	return false;
   		}
	},'text');
}

function getmcqId(id)
{
	var hdn_type = "";
	hdn_type = $('#hdn_type_'+id).val();
	var answer = "";
	
	if(hdn_type == "mcq")
	{		
		answer = "";
		answer = $('input[name="mcq_answer_'+id+'"]:checked').val();
		if(typeof(answer)  === "undefined") 
		{			
  			swal("OOPS!", "Please Select the Answer", "error");  			
  		 	return false;  				
		}
		$.ajaxSetup({async:false});
		$.post("/exam/addAnswer", {test_id: "" + test_id + "", user_id: "" + user_id + "",  question_id: "" + id + "",  question_type: "" + hdn_type + "",correct_answer: "" + answer + "",}, function(data)
		{		
			var result = $.trim(data);
	  		var obj = jQuery.parseJSON(result);
	   		if(obj.status_code == 200)
	   		{
	   			swal("Success!", obj.msg, "success");
	   			user_id = obj.user_type_id;
	   			$(".next-q").attr('disabled', 'disabled');
	   			return true;
	   		} else {   		
	   			$(".next-q").attr('disabled', 'disabled');
	   			//swal("OOPS!", obj.msg, "error");
	   			return false;
	   		}		
		},'text');	
	}
	else if(hdn_type == "written")
	{
		answer = "";
		answer = $('#written_'+id+'').val();
		if(answer == "")
		{			
  			swal("OOPS!", "Please Enter the Answer", "error");
  		 	return false;  				
		}
		$.ajaxSetup({async:false});
		$.post("/exam/addAnswer", {test_id: "" + test_id + "", user_id: "" + user_id + "",  question_id: "" + id + "",  question_type: "" + hdn_type + "",correct_answer: "" + answer + "",}, function(data)
		{		
			var result = $.trim(data);
	  		var obj = jQuery.parseJSON(result);
	   		if(obj.status_code == 200)
	   		{
	   			swal("Success!", obj.msg, "success");
	   			user_id = obj.user_type_id;
	   			$(".next-q").attr('disabled', 'disabled');
	   			return true;
	   		} else {   		
	   			$(".next-q").attr('disabled', 'disabled');
	   			//swal("OOPS!", obj.msg, "error");
	   			return false;
	   		}		
		},'text');	
	}
}
</script>

<section class="section bgw">
	<div class="container">
	    <div class="row">
	        <div class="col-md-10 col-md-offset-1 col-sm-12">
	            <div class="content">
	                <div class="row big-post">
	                    <div class="col-md-12">
	                        <div class="panel panel-default teksands_form">
	                        	<div class="panel-heading"><h3 class="forum-titles entry-title text-center m-0"><c:out value="${test.test_name}"></c:out></h3></div>
	                        	<div class="panel-body">
	                        		<div id="msform">
		                           		<fieldset id="fieldsetuser">
											<div class="form-card">
												<div class="row user-info">
													<div class="col-lg-12 user_data">
														<p style=" text-align: justify; "><c:out value="${test.test_description}"></c:out></p>
													</div>
													<div class="col-lg-12 user_data">
														<div class="form-group">
															<label>Enter Your Name:</label>
															<input id="user_name" type="text" class="form-control" placeholder="name">
														</div>
													</div>
													<div class="col-lg-6 user_data">
														<div class="form-group">
															<label>Enter Your Email:</label>
															<input id="user_email" type="email" class="form-control" placeholder="email">
														</div>
													</div>
													<div class="col-lg-6 user_data">
														<div class="form-group">
															<label>Enter Your Mobile:</label>
															<input id="user_mobile" type="number" class="form-control" placeholder="mobile">
														</div>
													</div>
												</div>
												<div class="row otp-info">
													<div class="col-lg-4"></div>
													<div class="col-lg-4">
														<div class="form-group">
															<label>Enter Email OTP:</label>
															<input id="user_otp" type="number" class="form-control" placeholder="Email OTP">
														</div>
													</div>
													<div class="col-lg-4"></div>
												</div>
											</div>
											<button class="action-button btn btn-primary user_btn" data-custom="teksands" onclick ="checkEmailAndTestIdExistOrNot()"> Next Step</button>											
											<input type="button" class="action-button btn btn-primary otp_btn"name="next" id="emailotp" onclick="verifyEmailOtpAndCreateUser()" class="next action-button btn btn-primary" data-custom="teksands" data-steps="1" value="Next Step" />
										</fieldset>					
										 <c:forEach items="${testQuestion}" var="testQuestion" varStatus = "counter">
											<fieldset class="panels" id="fieldset1">
												<div class="form-card">
													<div class="row user-info" id="question">
															<h2><c:out value="${testQuestion.question}" /></h2>
														<c:choose>
										   					 <c:when test="${testQuestion.question_type == 'mcq'}">
																<div class="col-lg-4">
																	<div class="form-group">
																		<input id="mcq_answer_${testQuestion.question_id}_1" type="radio" name="mcq_answer_${testQuestion.question_id}" value="${testQuestion.option1}">
																		<label for="mcq_answer_${testQuestion.question_id}_1"><c:out value="${testQuestion.option1} "/></label>
																	</div>
																</div>
																<div class="col-lg-4">
																	<div class="form-group">
																		<input id="mcq_answer_${testQuestion.question_id}_2" type="radio" name="mcq_answer_${testQuestion.question_id}" value="${testQuestion.option2}">
																		<label for="mcq_answer_${testQuestion.question_id}_2"><c:out value="${testQuestion.option2} "/></label>
																	</div>
																</div>
																<div class="col-lg-4">
																	<div class="form-group">
																		<input id="mcq_answer_${testQuestion.question_id}_3" type="radio" name="mcq_answer_${testQuestion.question_id}" value="${testQuestion.option3}">
																		<label for="mcq_answer_${testQuestion.question_id}_3"><c:out value="${testQuestion.option3}" /></label>
																	</div>
																</div>
																<div class="col-lg-4">
																	<div class="form-group">
																		<input id="mcq_answer_${testQuestion.question_id}_4" type="radio" name="mcq_answer_${testQuestion.question_id}" value="${testQuestion.option4}">
																		<label for="mcq_answer_${testQuestion.question_id}_4"><c:out value="${testQuestion.option4}" /></label>
																	</div>
																</div>
																<div class="col-lg-4">
																	<div class="form-group">
																		<input id="mcq_answer_${testQuestion.question_id}_5" type="radio" name="mcq_answer_${testQuestion.question_id}" value="${testQuestion.option5}">
																		<label for="mcq_answer_${testQuestion.question_id}_5"><c:out value="${testQuestion.option5}" /></label>
																	</div>
																</div>
																<div class="col-lg-4">
																	<div class="form-group">
																		<input id="mcq_answer_${testQuestion.question_id}_6" type="radio" name="mcq_answer_${testQuestion.question_id}" value="${testQuestion.option6}">
																		<label for="mcq_answer_${testQuestion.question_id}_6"><c:out value="${testQuestion.option6}" /></label>
																	</div>
																</div>
															</c:when>
															<c:when test="${testQuestion.question_type == 'written'}">
															<input type="text" id="written_${testQuestion.question_id}" placeholder="" class="form-control form-control-sm" />
															</c:when>
															<c:when test="${testQuestion.question_type == 'voice'}">
																<fieldset class="panels">
																	<div id="controls">
																		<div class="col-md-12">
													                        <button class="button button--ujarak"  id="recordButton" onclick="startRecording()">Record</button>
													                        <button class="button button--ujarak"  id="pauseButton" onclick="pauseRecording()">Pause</button>
													                        <button class="button button--ujarak" data-text="HOVER ME" id="stopButton" onclick="stopRecording(${testQuestion.question_id})">Stop</button>
													                    </div>
																    </div>
																    <div id="formats">Format: start recording to see sample rate</div>
																  	<p><strong>Recordings:</strong></p>
																  	<ol id="recordingsList_${testQuestion.question_id}" class="recordingsList_${testQuestion.question_id} audiobtn"></ol>
																</fieldset>		
														    </c:when>	
														</c:choose>													
													</div>												
												</div>
												<input type="hidden" id="hdn_type_${testQuestion.question_id}" value ="${testQuestion.question_type}"/>
												<input type="button" name="next" onclick="getmcqId(${testQuestion.question_id})" class="next action-button btn btn-primary next-q" disabled data-custom="teksands" data-steps="${counter.index+2}" value="Next Step" />
											</fieldset>
										</c:forEach>
										<fieldset>
											<div class="form-card">
												<div class="login-one-start text-center">
							                        <div class="mt-5">
							                            <img alt="" src="/resources/images/success.png" style="width: 40px !important;">
							                        </div>
							                        <h3 class="mt-2 text-success-teal">Success !</h3>
							                        <p class="text-muted font-14 mt-4"> 
							                            Thank you for your submission, We will get back to you with your result. 
							                        </p>
							                        <div class="login-one-inputs mt-5 font-12 strong">
							                            <a href="/" class="text-primary">Back to Home</a>
							                        </div>
							                    </div>
											</div>
										</fieldset> 										
	                        	</div>
	                        	</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</section>

<!-- <section>
	<div id="controls">
	  	 <button id="recordButton" onclick="startRecording()">Record</button>
	  	 <button id="pauseButton" onclick="pauseRecording()" disabled>Pause</button>
	  	 <button id="stopButton" onclick="stopRecording()" disabled>Stop</button>
    </div>
    <div id="formats">Format: start recording to see sample rate</div>
  	<p><strong>Recordings:</strong></p>
  	<ol id="recordingsList"></ol>
</section> -->