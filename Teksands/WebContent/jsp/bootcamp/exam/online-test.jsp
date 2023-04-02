<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	    
		<link rel="shortcut icon" href="/resources/images/cropped-ts-favicon.png" />
	    <link rel="stylesheet" type="text/css" href="/resources/revolution/css/settings.css">
	    <link rel="stylesheet" type="text/css" href="/resources/revolution/css/layers.css">
	    <link rel="stylesheet" type="text/css" href="/resources/revolution/css/navigation.css">
	    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css">
	    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
	    <link rel="stylesheet" type="text/css" href="/resources/css/custom.css">
	    <link rel="stylesheet" type="text/css" href="/resources/css/feedback.css">
	    <link rel="stylesheet" href="/resources/js/sweetalert/sweetalert.css"/>
	    <link rel="stylesheet" href="/resources/css/sections.css"/>
	    <link href="/resources/cdn/css/summernote.min.css" rel="stylesheet">
	    <link href="/resources/cdn/css/datepicker.css" rel="stylesheet" type="text/css" />
	    <link rel="stylesheet" href="/resources/plugins/datatable/dataTables.bootstrap.css"/>
	    <link rel="stylesheet" type="text/css" href="/resources/mcq/css/mcq.css">
		<link rel="stylesheet" type="text/css" href="/resources/css/auth_1.css">
	      
	    <script src="/resources/js/jquery.min.js"></script>
	    <script src="/resources/js/bootstrap.js"></script>
	    <script src="/resources/js/plugins.js"></script>
	    <script src="/resources/js/isotope.js"></script>
	    <script src="/resources/js/imagesloaded.pkgd.js"></script>
	    <script src="/resources/js/masonry-home-01.js"></script>  
	    <script src="/resources/cdn/js/bootstrap-datepicker.min.js"></script>
	    <script type="text/javascript" src="/resources/plugins/datatable/jquery.dataTables.js"></script>
	    <script type="text/javascript" src="/resources/plugins/datatable/dataTables.bootstrap.js"></script>
	    <script type="text/javascript" src="/resources/cdn/js/dataTables.buttons.min.js"></script>
	    <script type="text/javascript" src="/resources/cdn/js/jszip.min.js"></script>
	    <script type="text/javascript" src="/resources/cdn/js/pdfmake.min.js"></script>
	    <script type="text/javascript" src="/resources/cdn/js/vfs_fonts.js"></script>
	    <script type="text/javascript" src="/resources/cdn/js/buttons.html5.min.js"></script>
	    <script type="text/javascript" src="/resources/cdn/js/buttons.print.min.js"></script>
	    <script type="text/javascript" src="/resources/cdn/js/jquery.cookie.min.js"></script>
		<script src="/resources/cdn/js/summernote.min.js"></script>
		<script src="/resources/js/sweetalert/sweetalert.min.js"></script>
		<script src="/resources/mcq/js/webcamjs/webcam.min.js"></script>
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
			.post-media img, .content img {
			    width: auto !important;
			}
			#my_camera{
				width: 320px;
				height: 240px;
				border: 1px solid black;
				margin: 20px auto;        
			}
			#img_url {
			    background: #ddd;
			    width: 150px;
			    height: 150px;
			    margin-top: 20px !important;
			    margin-bottom: 20px !important;
			
			}
			input[type=file] {
			    margin: 0 auto;
			}
			#cam_img
			{
				width: 50px !important;
				height: 50px !important;
			}
			.font-italic {
			    font-style: italic!important;
			}
						
.countdown-label {
  	font: thin 15px Arial, sans-serif;
	color: #65584c;
	text-align: center;
	text-transform: uppercase;
	display: inline-block;
  	letter-spacing: 2px;
  	margin-top: 9px
}
#countdown{
	box-shadow: 0 1px 2px 0 rgba(1, 1, 1, 0.4);
	width: 160px;
    height: 48px;
	text-align: center;
	background: #f1f1f1;
	border-radius: 5px;
	margin: auto;
	margin-top: 18px;
}
#countdown #tiles{
  	color: #fff;
	position: relative;
	z-index: 1;
	text-shadow: 1px 0px 0px #ccc;
	display: inline-block;
  	font-family: Arial, sans-serif;
  	text-align: center;  
	padding: 4px;
	border-radius: 5px 5px 0 0;
	font-size: 14px;
	font-weight: thin;
	display: block;    
}
#total{
	box-shadow: 0 1px 2px 0 rgba(1, 1, 1, 0.4);
	width: 160px;
    height: 46px;
	text-align: center;
	background: #f1f1f1;
	border-radius: 5px;
	margin: auto;
	margin-top: 18px;
}
#total #time{
  	color: #fff;
	position: relative;
	z-index: 1;
	text-shadow: 1px 0px 0px #ccc;
	display: inline-block;
  	font-family: Arial, sans-serif;
  	text-align: center;  
	padding: 13px;
	border-radius: 5px 5px 0 0;
	font-size: 14px;
	font-weight: thin;
	display: block;    
}
.color-full {
  background: #53bb74;
}
.color-half {
  background: #ebc85d;
}
.color-empty {
  background: #e5554e;
}
.margintop
{
	margin-top: 30px;
}
.minutesleft
{    
 	box-shadow: 0 1px 2px 0 rgb(1 1 1 / 40%);
    width: 160px;
    height: 20px;
    text-align: center;
    background: #ef5351;
    color: #fbfbfb;
    border-radius: 5px;
    margin-top: 10px !important;
}
</style>
	<script>
			<c:choose>
				<c:when test="${empty test}">
					var test_id = "";				
					var testAuthCode = '';
				</c:when>
				<c:otherwise>
					var test_id = ${test.test_id};
					var testAuthCode = '${test.auth_code}';	
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${empty user_id}">
					var user_id = "";																   
				</c:when>
				<c:otherwise>
					var user_id = ${user_id};
				</c:otherwise>
			</c:choose>
			
			var recordButton = "";
			var stopButton = "";
			var pauseButton = "";
			var user_name = "";
			var user_email = "";
			var user_mobile = "";
			var question_id = "";
			var webcamElement = "";
			var canvasElement = "";
			var snapSoundElement = "";
			var webcam = "";
			var audioFlag = false;
			
			var testQuestionId = "";
			var days, hours, rem_minutes, seconds;
			$( document ).ready(function()
			{			
			    $("#minutes_left").hide();	
			    $("#minutes_left_1").hide();	
				var minutes = '${test.test_time}';
				var target_date = new Date().getTime() + ((minutes * 60 ) * 1000); // set the countdown date
				var time_limit = ((minutes * 60 ) * 1000);
				//set actual timer
				/*setTimeout(
				  function() 
				  {
				    document.getElementById("left").innerHTML = "Timer Stopped";
				  }, time_limit );*/

				 // variables for time units

				var countdown = document.getElementById("tiles"); // get tag element

				getCountdown();

				setInterval(function () { getCountdown(); }, 1000);

				function getCountdown(){

					// find the amount of "seconds" between now and target
					var current_date = new Date().getTime();
					var seconds_left = (target_date - current_date) / 1000;					
						if ( seconds_left >= 0 ) {						 
						  console.log("seconds_left" +seconds_left);
						  if (seconds_left < 120){							  
						     $( '#tiles' ).removeClass('color-full');
						     $( '#tiles' ).addClass('color-half');
						     $("#minutes_left").show();	
							} 
							if (seconds_left < 115){
								$("#minutes_left").hide();									
							}
							if (seconds_left  <= 60 )  {
						    	$( '#tiles' ).removeClass('color-half');
						    	$( '#tiles' ).addClass('color-empty');
						    	$("#minutes_left_1").show();	
						    	window.location.href = "/";						    	
						    }
						  

							if (seconds_left < 52){
								$("#minutes_left_1").hide();									
							}
						    
						    
							days = pad( parseInt(seconds_left / 86400) );
							seconds_left = seconds_left % 86400;
								 
							hours = pad( parseInt(seconds_left / 3600) );
							seconds_left = seconds_left % 3600;
								  
							rem_minutes = pad( parseInt(seconds_left / 60) );
							seconds = pad( parseInt( seconds_left % 60 ) );
		
							// format countdown string + set tag value
							countdown.innerHTML = "<span>Remaining Time: </span>"+"<span id=remHours value="+hours+">" + hours + ":</span><span id=remMins value="+rem_minutes+">" + rem_minutes + ":</span><span id=remSecs value="+seconds+">" + seconds + "</span>"; 
						}				  
				}

				function pad(n) {
					return (n < 10 ? '0' : '') + n;
				}
				
				$(document).keydown(function(event) {
			        if (event.ctrlKey==true && (event.which == '118' || event.which == '86')) {
			            event.preventDefault();
			         }
			    });
				
				var tabCount = 0;
				
				$(window).blur(function() {
				/*	tabCount = tabCount+1;
					
					if(tabCount == 1){
						swal("Notification!", "Please Dont Use Other Tabs, Otherwise Test will abort", "warning");
					}else if(tabCount == 2){
						swal({
						    title: "Notification!",
						 	text: "Your test is Aborted due to Tab Switching",
						    type: "error",
						    showCancelButton: false,
						    confirmButtonText: 'Okay',
						 },function(isConfirm){
						   if (isConfirm){
							   window.close();	 
						    }else{
						    	swal.close();
						    	window.close();
						    	return false;
						    }
						 });
					}*/
				});
				
				recordButton = document.getElementById("recordButton");
				stopButton = document.getElementById("stopButton");
				pauseButton = document.getElementById("pauseButton");
				
				$("#imgup_btn").prop("disabled", true);
			
				$('.otp-info').hide();
				$('.otp_btn').hide();
				$('.audiostart').hide();
				$('.audiopause').hide();
				$('.audiostop').hide();
				$('.audioResume').hide();
				$('#success_step').hide();
				$("#captureBtn").hide();
				$("#showCameraBtn").hide();
				$("#startTestBtn").hide();
				$('#img_url').hide();
				
				$('#audioFile').hide();
				
				$('.audio_start_btn').show();
				$('.audio_pause_btn').hide();
				$('.audio_stop_btn').hide();
				$('.audio_resume_btn').hide();
				
				$('.recorderText').hide();
				$('.voice_next_btn').hide();
				
				
			});
			
			function startRecording() 
			{	
				$('.audiostart').show();
				$('.audiopause').hide();
				$('.audiostop').hide();
				
				//$(".next-q").removeAttr('disabled');
				
				$('.audio_start_btn').hide();
				$('.audio_pause_btn').show();
				$('.audio_stop_btn').show();
				
				$('.recorderText').show();
				
				var constraints = { audio: true, video:false }
			
				navigator.mediaDevices.getUserMedia(constraints).then(function(stream) {
					audioContext = new AudioContext();
					//document.getElementById("formats").innerHTML ="Format: 1 channel pcm @ "+audioContext.sampleRate/1000+"kHz"
					gumStream = stream;
					input = audioContext.createMediaStreamSource(stream);
					rec = new Recorder(input,{numChannels:1})
					rec.record();
				}).catch((err) => {
			    	swal("OOPS!", "Please allow the Microphone permission", "error");
			    	$('.audio_start_btn').show();
			    	$('.audio_pause_btn').hide();
			    	$('.audio_stop_btn').hide();
			    	$('.audiostart').hide();
			    	$('.audiopause').hide();
			    	$('.audiostop').hide();
			    	return false;
			    });
			}
			
			function pauseRecording()
			{
				console.log("pauseButton clicked rec.recording=",rec.recording );
				
				$('.audiostart').hide();
				$('.audiopause').show();
				$('.audiostop').hide();
				
				$('.recorderText').show();
				
				$('.audio_start_btn').hide();
				$('.audio_pause_btn').hide();
				$('.audio_stop_btn').show();
				$('.audio_resume_btn').show();
			
				rec.stop();
			}
			
			function resumeRecording()
			{
				console.log("pauseButton clicked rec.recording=",rec.recording );
				
				$('.recorderText').hide();
				
				$('.audiostart').show();
				$('.audiopause').hide();
				$('.audiostop').hide();
				
				$('.audio_start_btn').hide();
				$('.audio_pause_btn').show();
				$('.audio_stop_btn').show();
				$('.audio_resume_btn').hide();
			
				startRecording();
			}
			
			function stopRecording(id) 
			{
				$('.audiostart').hide();
				$('.audiopause').hide();
				$('.audiostop').show();
				
				$('.audio_start_btn').show();
				$('.audio_pause_btn').hide();
				$('.audio_stop_btn').hide();
				$('.audio_resume_btn').hide();
				
				$('.voice_next_btn').hide();
				
				$('.recorderText').hide();
				
				question_id = id;
				rec.stop();
			    gumStream.getAudioTracks()[0].stop();
				rec.exportWAV(blobTobase64Audio);
			}
			
			function blobTobase64Audio(blob)
			{
				
				var url = URL.createObjectURL(blob);
				var au = document.createElement('audio');
				var li = document.createElement('li');
				var link = document.createElement('a');
				
				au.controls = true;
				au.src = url;
				
				li.appendChild(au);
				
				//recordingsList.prepend(li);
				
				$('#recordingsList_'+question_id).empty();
				
				$('#recordingsList_'+question_id).append(li);
				
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
				var hdn_type = "voice";
				
				$.ajaxSetup({async:false});
				$.post("/bootcamp/addAnswerByQuestionIdAndUserIdAndTestId", {test_id: "" + test_id + "", user_id: "" + user_id + "",  question_id: "" + question_id + "",  question_type: "" + hdn_type + "",correct_answer: "" + base64data + "",}, function(data)
				{		
					
					var result = $.trim(data);
			  		var obj = jQuery.parseJSON(result);
					if(obj.status_code == 200)
			   		{
						$('.audio_start_btn').show();
						$('.audio_pause_btn').hide();
						$('.audio_stop_btn').hide();
						$('#audioFile').hide();
						audioFlag = true;
						return false;
						
			   		} else {
			   			swal("OOPS!", "Something went wrong, Please try again", "error");
			   		 	return false;
			   		}
				},'text');
			}
			
			function getmcqId(id)
			{
				$('.audiostart').hide();
				$('.audiopause').hide();
				$('.audiostop').hide();
			
				var hdn_type = "";
				hdn_type = $('#hdn_type_'+id).val();
				var answer = "";
				
				if(hdn_type == "mcq")
				{		
					answer = "";
					answer = $('input[name="mcq_answer_'+id+'"]:checked').val();
					
					if(answer == null){answer = "";}
					
					if(id == '${last_question_id}')
					{
						swal({
						    title: "Are you sure to Submit this Test?",
						    text: "You won't be able to revert this!",
						    type: "warning",
						    showCancelButton: true,
						    confirmButtonText: 'Yes, Please Submit',
						    cancelButtonText: "No, Review my Answers"
						 },function(isConfirm){
						   if (isConfirm){
							   
							   swal.close();
							   
							    $.ajaxSetup({async:false});
								$.post("/bootcamp/addAnswerByQuestionIdAndUserIdAndTestId", {test_id: "" + test_id + "", user_id: "" + user_id + "",  question_id: "" + id + "",  question_type: "" + hdn_type + "",correct_answer: "" + answer + "",}, function(data)
								{		
									var result = $.trim(data);
							  		var obj = jQuery.parseJSON(result);
							   		if(obj.status_code == 200)
							   		{
							   			$('#success_step').show();							   							   			
							   			var reminaingTime = hours +":"+rem_minutes+":"+seconds;							   		   
							   		 	$.ajaxSetup({async:false});
										$.post("/bootcamp/addTestResult", {test_id: "" + test_id + "", user_id: "" + user_id + "",  remaining_time: "" + reminaingTime + "",}, function(data)
										{	
											if(obj.status_code == 200)
									   		{
												window.location.href = "/bootcamp/view-result?user_id="+user_id+"&authCode="+testAuthCode;
									   		}
											else
											{
												return false;
											}
										});
										
							   		} else {   		
							   			var finalquest = $('#final_quest').val();	
								    	$('#fieldset_'+finalquest).show();
								    	$('#fieldset_'+finalquest).css({"opacity": "1"});
							   			return false;
							   		}		
								},'text');
						    }else {
						    	$('#success_step').hide();
						    	swal.close();
						    	var finalquest = $('#final_quest').val();	
						    	$('#fieldset_'+finalquest).css({"opacity": "1"});
						    	$('#fieldset_'+finalquest).show();
						      	return false;
						    }
						 });
					}else{
						$.ajaxSetup({async:false});
						$.post("/bootcamp/addAnswerByQuestionIdAndUserIdAndTestId", {test_id: "" + test_id + "", user_id: "" + user_id + "",  question_id: "" + id + "",  question_type: "" + hdn_type + "",correct_answer: "" + answer + "",}, function(data)
						{		
							var result = $.trim(data);
					  		var obj = jQuery.parseJSON(result);
					   		if(obj.status_code == 200)
					   		{
					   			return true;
					   		} else {   		
					   			var finalquest = $('#final_quest').val();	
						    	$('#fieldset_'+finalquest).show();
						    	$('#fieldset_'+finalquest).css({"opacity": "1"});
					   			return false;
					   		}		
						},'text');
					}
				}else if(hdn_type == "written")
				{
					answer = "";
					answer = $('#written_'+id+'').val();
					
					if(id == '${last_question_id}'){
						
						swal({
						    title: "Are you sure to Submit this Test?",
						    text: "You won't be able to revert this!",
						    type: "warning",
						    showCancelButton: true,
						    confirmButtonText: 'Yes, Please Submit',
						    cancelButtonText: "No, Review my Answers"
						 },function(isConfirm){
			
						   if (isConfirm){
							   
							   	swal.close();
							   	$.ajaxSetup({async:false});
								$.post("/bootcamp/addAnswerByQuestionIdAndUserIdAndTestId", {test_id: "" + test_id + "", user_id: "" + user_id + "",  question_id: "" + id + "",  question_type: "" + hdn_type + "",correct_answer: "" + answer + "",}, function(data)
								{		
									
									var result = $.trim(data);
							  		var obj = jQuery.parseJSON(result);
							   		if(obj.status_code == 200)
							   		{
							   			$('#success_step').show();
							   			window.location.href = "/bootcamp/view-result?user_id="+user_id+"&authCode="+testAuthCode;
							   			//setTimeout(function(){window.close();},3000);
							   		//	return true;
							   		} else {   		
							   			var finalquest = $('#final_quest').val();	
								    	$('#fieldset_'+finalquest).show();
								    	$('#fieldset_'+finalquest).css({"opacity": "1"});
							   			return false;
							   		}		
								},'text');
						    } else {
						    		$('#success_step').hide();
							    	swal.close();
							    	var finalquest = $('#final_quest').val();	
							    	$('#fieldset_'+finalquest).css({"opacity": "1"});
							    	$('#fieldset_'+finalquest).show();
							      	return false;
							    }
						 });
					}else{
				    	   
				        $.ajaxSetup({async:false});
						$.post("/bootcamp/addAnswerByQuestionIdAndUserIdAndTestId", {test_id: "" + test_id + "", user_id: "" + user_id + "",  question_id: "" + id + "",  question_type: "" + hdn_type + "",correct_answer: "" + answer + "",}, function(data)
						{		
							var result = $.trim(data);
					  		var obj = jQuery.parseJSON(result);
					   		if(obj.status_code == 200)
					   		{
					   			return true;
					   		} else {   		
					   			var finalquest = $('#final_quest').val();	
						    	$('#fieldset_'+finalquest).show();
						    	$('#fieldset_'+finalquest).css({"opacity": "1"});
					   			return false;
					   		}		
						},'text');	
					}
				}else if(hdn_type == "voice")
				{
					if(id == '${last_question_id}')
					{
						if(audioFlag == false){
							swal({
							    title: "Are you sure to Submit this Test?",
							    text: "You won't be able to revert this!",
							    type: "warning",
							    showCancelButton: true,
							    confirmButtonText: 'Yes, Please Submit',
							    cancelButtonText: "No, Review my Answers"
							 },function(isConfirm){
			
							   if (isConfirm)
							   {					   
								   swal.close();
								   stopRecording(id);
								   audioFlag = false;
								   $('#success_step').show();
									window.location.href = "/bootcamp/view-result?user_id="+user_id+"&authCode="+testAuthCode;
								  // setTimeout(function(){window.close();},3000);
								 //  return true;
							    } else {
							    	$('#success_step').hide();
							    	swal.close();
							    	var finalquest = $('#final_quest').val();	
							    	$('#fieldset_'+finalquest).show();
							    	$('#fieldset_'+finalquest).css({"opacity": "1"});
							      	return false;
							    }
							 });
						}else{
							swal({
							    title: "Are you sure to Submit this Test?",
							    text: "You won't be able to revert this!",
							    type: "warning",
							    showCancelButton: true,
							    confirmButtonText: 'Yes, Please Submit',
							    cancelButtonText: "No, Review my Answers"
							 },function(isConfirm){
			
							   if (isConfirm)
							   {
								   swal.close();
								   audioFlag = false;
								   $('#success_step').show();
								   setTimeout(function(){window.close();},3000);
								   return false;
							    } else {
							    	swal.close();
							    	$('#success_step').hide();	
							    	var finalquest = $('#final_quest').val();	
							    	$('#fieldset_'+finalquest).show();
							    	$('#fieldset_'+finalquest).css({"opacity": "1"});
							      	return false;
							    }
							 });
						}
					}else{
						if(audioFlag == false){
							stopRecording(id);
							$('.audio_start_btn').show();
							$('.audio_pause_btn').hide();
							$('.audio_stop_btn').hide();
							$('.voice_next_btn').hide();
							audioFlag = false;
						}else{
							$('.audio_start_btn').show();
							$('.audio_pause_btn').hide();
							$('.audio_stop_btn').hide();
							$('.voice_next_btn').hide();
							audioFlag = false;
						}
					}
				}
			}
			function validateMembershipTabs(step)
			{
				var flag = true;
				var hdn_type_data_steps = $("#hdn_type_data_steps").val();
				
				/* if(step == 1)
				{
					flag = checkEmailAndTestIdExistOrNot();
				}else if(step == 2)
				{
					flag = verifyEmailOtpAndCreateUser();
				} */
				
				/* if(step == hdn_type_data_steps)
				{
					flag = lastStepAddAnswer();
				} */
				return flag;
			}
			</script>
	</head>
	<body>
    	<div id="loader">
			<div class="loader-container">
				<img src="/resources/images/load.gif" alt="" class="loader-site spinner">
			</div>
		</div>
		<div id="wrapper">
			<div class="logo-wrapper">
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-sm-12 text-center">
						<div id="total">  
						  <div id='time' class="btn-primary">
						  <span class="margintop">Total Time: ${test.test_time} minutes</span>						
						  </div>						 
						</div>	
						</div>
						<div class="col-md-4 col-sm-12 text-center">
							<div class="site-logo">
								<a href="/"><img alt="teksands" src="/resources/images/teksands_logo.jpg" class="img-responsive navbar-brand header-logo"></a>
							</div>
						</div>
						<div class="col-md-4 col-sm-12 text-center">
							<div id="countdown">  
							  <div id='tiles' class="color-full"></div>		
							  <label id="minutes_left" class="minutesleft"> 2 minutes left</label>
							  <label id="minutes_left_1" class="minutesleft"> Last 1 minute</label>				 
							</div>
						</div>
					</div>
				</div>
			</div>
			<section class="bgw">
				<div class="container">
				    <div class="row">
				        <div class="col-md-10 col-md-offset-1 col-sm-12">
				            <div class="content">
				                <div class="row big-post">
				                    <div class="col-md-12">
				                        <div class="panel panel-default teksands_form">
				                        	<div class="panel-heading">
				                        		<h3 class="forum-titles entry-title text-center m-0"></h3>
				                        	</div>
				                        	<div class="panel-body">
				                        		<div id="msform">
				                        			<c:forEach items="${testQuestion}" var="testQuestion" varStatus = "counter">
														<fieldset class="panels" id="fieldset_${counter.index}">
															<div class="form-card">
																<div class="row" id="question">
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
																			<c:if test="${not empty testQuestion.option3}">
																				<div class="col-lg-4">
																					<div class="form-group">
																						<input id="mcq_answer_${testQuestion.question_id}_3" type="radio" name="mcq_answer_${testQuestion.question_id}" value="${testQuestion.option3}">
																						<label for="mcq_answer_${testQuestion.question_id}_3"><c:out value="${testQuestion.option3}" /></label>
																					</div>
																				</div>
																			</c:if>
																			<c:if test="${not empty testQuestion.option4}">
																				<div class="col-lg-4">
																					<div class="form-group">
																						<input id="mcq_answer_${testQuestion.question_id}_4" type="radio" name="mcq_answer_${testQuestion.question_id}" value="${testQuestion.option4}">
																						<label for="mcq_answer_${testQuestion.question_id}_4"><c:out value="${testQuestion.option4}" /></label>
																					</div>
																				</div>
																			</c:if>
																			<c:if test="${not empty testQuestion.option5}">
																				<div class="col-lg-4">
																					<div class="form-group">
																						<input id="mcq_answer_${testQuestion.question_id}_5" type="radio" name="mcq_answer_${testQuestion.question_id}" value="${testQuestion.option5}">
																						<label for="mcq_answer_${testQuestion.question_id}_5"><c:out value="${testQuestion.option5}" /></label>
																					</div>
																				</div>
																			</c:if>
																			<c:if test="${not empty testQuestion.option6}">
																				<div class="col-lg-4">
																					<div class="form-group">
																						<input id="mcq_answer_${testQuestion.question_id}_6" type="radio" name="mcq_answer_${testQuestion.question_id}" value="${testQuestion.option6}">
																						<label for="mcq_answer_${testQuestion.question_id}_6"><c:out value="${testQuestion.option6}" /></label>
																					</div>
																				</div>
																			</c:if>
																		</c:when>
																		<c:when test="${testQuestion.question_type == 'written'}">
																			<textarea class="form-control" id="written_${testQuestion.question_id}" name="comments" id="comments" rows="6" placeholder="Write your answer"></textarea>
																		</c:when>
																		<c:when test="${testQuestion.question_type == 'voice'}">
																			<fieldset class="panels">
																				<div id="controls">
																					<div class="col-md-12">
																						<div class="row">
																							<div class="col-lg-12">
																								<button class="btn btn-success btn-radius audio_start_btn"  id="recordButton" onclick="startRecording()">
																									<span><i class="fa fa-microphone"></i></span> <span>Start Recording</span>
																								</button>
																							</div>
																							<div class="col-lg-12">
																								<button class="btn btn-warning btn-radius audio_pause_btn" id="pauseButton" onclick="pauseRecording()">
																		                        	<span><i class="fa fa-microphone-slash"></i></span> <span>Pause Recording</span>
																		                        </button>
																		                        <button class="btn btn-warning btn-radius audio_resume_btn" id="audioResume" onclick="resumeRecording()">
																		                        	<span><i class="fa fa-microphone-slash"></i></span> <span>Restart Recording</span>
																		                        </button>
																		                        <button class="btn btn-danger btn-radius audio_stop_btn"  id="stopButton" onclick="stopRecording(${testQuestion.question_id})">
																		                        	<span><i class="fa fa-stop-circle-o"></i></span> <span>End Recording</span>
																								</button>
																							</div>
																							<div class="col-lg-12 recorderText" style="margin-top: 10px;">
																								<small>(Click Pause and then Restart to Restart your Recording from beginning)</small>
																							</div>
																						</div>
																					</div>
																				</div>
																			</fieldset>
																			<div class="audiostart">	
																				<img alt="" src="/resources/images/audio/start.gif" style="width: 78px !important;">
																				<p>Recording Started</p>
																			</div>
																			<div class="audiopause">
																				<img alt="" src="/resources/images/audio/pause.png" style="width: 40px !important;">
																				<p>Recording Paused</p>
																			</div>
																			<div class="audiostop">
																				<img alt="" src="/resources/images/audio/stop.png" style="width:40px !important;">
																				<p>Recording Complete</p>
																			</div>
																			<ol id="recordingsList_${testQuestion.question_id}"></ol>
																	    </c:when>	
																	</c:choose>													
																</div>												
															</div>
															<c:choose>
															    <c:when test="${testQuestion.question_id == last_question_id}">
															    	<c:if test="${testQuestion.question_type eq 'voice'}">	
															    		<input type="hidden" id="final_quest" value="${counter.index}"/>
																        <input type="hidden" id="hdn_type_${testQuestion.question_id}" value ="${testQuestion.question_type}"/>		
																        <c:if test="${counter.index != 0}">										       
																        	<input type="button" name="previous" class="previous action-button-previous btn btn-outline-primary" value="Previous" />
																        </c:if>
																        <input type="button" name="next" onclick="getmcqId(${testQuestion.question_id})" class="next action-button btn btn-primary" data-custom="teksands" data-steps="${counter.index+2}" value="Submit Test" />
															    	</c:if>
															    	<c:if test="${testQuestion.question_type eq 'mcq'}">	
															    		<input type="hidden" id="final_quest" value="${counter.index}"/>
															        	<input type="hidden" id="hdn_type_${testQuestion.question_id}" value ="${testQuestion.question_type}"/>		
																        <c:if test="${counter.index != 0}">										       
																        	<input type="button" name="previous" class="previous action-button-previous btn btn-outline-primary" value="Previous" />
																        </c:if>
															        	<input type="button" name="next" onclick="getmcqId(${testQuestion.question_id})" class="next action-button btn btn-primary" data-custom="teksands" data-steps="${counter.index+2}" value="Submit Test" />
															    	</c:if>
															    	<c:if test="${testQuestion.question_type eq 'written'}">	
															    		<input type="hidden" id="final_quest" value="${counter.index}"/>
																        <input type="hidden" id="hdn_type_${testQuestion.question_id}" value ="${testQuestion.question_type}"/>		
																        <c:if test="${counter.index != 0}">										       
																        	<input type="button" name="previous" class="previous action-button-previous btn btn-outline-primary" value="Previous" />
																        </c:if>
																        <input type="button" name="next" onclick="getmcqId(${testQuestion.question_id})" class="next action-button btn btn-primary" data-custom="teksands" data-steps="${counter.index+2}" value="Submit Test" />
															    	</c:if>
																</c:when>
															    <c:otherwise>
															    	<c:if test="${testQuestion.question_type eq 'voice'}">	
															    		<input type="hidden" id="hdn_type_${testQuestion.question_id}" value ="${testQuestion.question_type}"/>												        
																        <input type="hidden" id="loop_ind" value="${counter.index}"/>
																        <c:if test="${counter.index != 0}">
																        	<input type="button" name="previous" class="previous action-button-previous btn btn-outline-primary" value="Previous" />
																        </c:if>
															        	<input type="button" name="next" onclick="getmcqId(${testQuestion.question_id})" class="next action-button btn btn-primary next-q" data-custom="teksands" data-steps="${counter.index+2}" value="Next Question" />
															    	</c:if>
															    	<c:if test="${testQuestion.question_type eq 'written'}">	
															    		<input type="hidden" id="hdn_type_${testQuestion.question_id}" value ="${testQuestion.question_type}"/>												        
																        <input type="hidden" id="loop_ind" value="${counter.index}"/>
																        <c:if test="${counter.index != 0}">
																        	<input type="button" name="previous" class="previous action-button-previous btn btn-outline-primary" value="Previous" />
																        </c:if>
																        <input type="button" name="next" onclick="getmcqId(${testQuestion.question_id})" class="next action-button btn btn-primary next-q" data-custom="teksands" data-steps="${counter.index+2}" value="Next Question" />
															    	</c:if>
															    	<c:if test="${testQuestion.question_type eq 'mcq'}">	
															    		<input type="hidden" id="hdn_type_${testQuestion.question_id}" value ="${testQuestion.question_type}"/>												        
																        <input type="hidden" id="loop_ind" value="${counter.index}"/>
																        <c:if test="${counter.index != 0}">
																        	<input type="button" name="previous" class="previous action-button-previous btn btn-outline-primary" value="Previous" />
																        </c:if>
																        <input type="button" name="next" onclick="getmcqId(${testQuestion.question_id})" class="next action-button btn btn-primary next-q" data-custom="teksands" data-steps="${counter.index+2}" value="Next Question" />
															    	</c:if>
															    </c:otherwise>
															</c:choose>
														</fieldset>
													</c:forEach>
													<fieldset>
														<div class="container">
															<div class="row">
															</div>
														</div>
													</fieldset>
					                           		<div id="success_step">
														<div class="form-card">
															<div class="login-one-start text-center">
										                        <div class="mt-5">
										                            <img alt="" src="/resources/images/success.png" style="width: 40px !important;">
										                        </div>
										                        <h3 class="mt-2 text-success-teal">Success!</h3>
										                        <p class="text-muted font-14 mt-4"> 
										                            Thank you for submitting your test. We will get back to you shortly. 
										                        </p>
										                        <div class="login-one-inputs mt-5 font-12 strong">
										                            <a href="/" class="text-primary">Back to Home</a>
										                        </div>
										                    </div>
														</div>
													</div> 										
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
		</div>
	</body>
</html>