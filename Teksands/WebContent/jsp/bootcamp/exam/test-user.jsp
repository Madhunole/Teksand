<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- https://makitweb.com/how-to-capture-picture-from-webcam-with-webcam-js/ -->

<link rel="stylesheet" type="text/css" href="/resources/mcq/css/mcq.css">
<link rel="stylesheet" type="text/css" href="/resources/css/auth_1.css">
<script src="/resources/mcq/js/mcq.js" type="text/javascript"></script>
<script src="/resources/mcq/js/recorder.js" type="text/javascript"></script>

<script src="/resources/mcq/js/webcamjs/webcam.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>

<style>
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
.has-error .help-block, .has-error .control-label, .has-error .radio, .has-error .checkbox, .has-error .radio-inline, .has-error .checkbox-inline, .has-error.radio label, .has-error.checkbox label, .has-error.radio-inline label, .has-error.checkbox-inline label {
    color: #FF0000 !important;
}
/* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/* Firefox */
input[type=number] {
  -moz-appearance: textfield;
}
</style>

<script>
<c:choose>
	<c:when test="${empty test}">
		var test_id = "";	
		var testAuthCode = '';	
		var testName = '';
	</c:when>
	<c:otherwise>
		var test_id = ${test.test_id};
		var testAuthCode = '${test.auth_code}';	
		var testName = '${test.test_name}';
	</c:otherwise>
</c:choose>

var user_name = "";
var user_email = "";
var user_mobile = "";
var user_id = "";
var userAuthCode = "";
var webcamElement = "";
var canvasElement = "";
var snapSoundElement = "";
var webcam = "";
var audioFlag = false;

var testQuestionId = "";

var openedWindow = "";

$( document ).ready(function()
{
	$('#fieldsetuser').show();
	$('#fieldsetVerifyUser').hide();
	$('#fieldsetuploadimg').hide();
	
	$(document).keydown(function(event) {
        if (event.ctrlKey==true && (event.which == '118' || event.which == '86')) {
            event.preventDefault();
         }
    });
	
	$('#user_sign_up_form').validate({
		rules: {
			user_name: {
				required: true,
			},
			user_email: {
				required: true,
				email: true,
			},
			user_mobile: {
				required: true,
			},
	    },
	    messages: {
	    	user_name: "Please Enter Your Name",
	    	user_mobile: "Please Enter Your Mobile",
	    	user_email: "Please Enter Your Email",
		},
		
		errorElement: "div",
		
		errorPlacement: function ( error, element ) {
			
			error.addClass( "help-block" );
			
			element.parents( ".form-validate" ).addClass( "has-feedback" );
			
			if(element.prop( "type" ) === "checkbox"){
				var ele = element.parent("div");
				error.insertAfter( ele.parent("div") );
			}else if(element.prop( "type" ) === "radio"){
				error.insertAfter( element.parent( ".form-radio" ) );
			}else{
				error.insertAfter( element );
			}
			
		},
		
		success: function ( label, element ) {
			if ( !$( element ).next( "span" )[ 0 ] ) {
				
			}
		},
		
		highlight: function ( element, errorClass, validClass ) {
			$( element ).parents( ".form-validate" ).addClass( "has-error" ).removeClass( "has-success" );
			
		},
		
		unhighlight: function ( element, errorClass, validClass ) {
			$( element ).parents( ".form-validate" ).addClass( "has-success" ).removeClass( "has-error" );
			$( element ).next( "span" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
		},		
	    
		submitHandler: function () {
			checkEmailAndTestIdExistOrNot();
	    }
	});
	
	$('#userOtpVerificatiion').validate({
		rules: {
			user_otp: {
				required: true,
			},
	    },
	    messages: {
	    	user_otp: "Please Enter Email OTP",
		},
		
		errorElement: "div",
		
		errorPlacement: function ( error, element ) {
			
			error.addClass( "help-block" );
			
			element.parents( ".form-validate" ).addClass( "has-feedback" );
			
			if(element.prop( "type" ) === "checkbox"){
				var ele = element.parent("div");
				error.insertAfter( ele.parent("div") );
			}else if(element.prop( "type" ) === "radio"){
				error.insertAfter( element.parent( ".form-radio" ) );
			}else{
				error.insertAfter( element );
			}
			
		},
		
		success: function ( label, element ) {
			if ( !$( element ).next( "span" )[ 0 ] ) {
				
			}
		},
		
		highlight: function ( element, errorClass, validClass ) {
			$( element ).parents( ".form-validate" ).addClass( "has-error" ).removeClass( "has-success" );
			
		},
		
		unhighlight: function ( element, errorClass, validClass ) {
			$( element ).parents( ".form-validate" ).addClass( "has-success" ).removeClass( "has-error" );
			$( element ).next( "span" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
		},		
	    
		submitHandler: function () {
			verifyEmailOtpAndCreateUser();
	    }
	});
	
	recordButton = document.getElementById("recordButton");
	stopButton = document.getElementById("stopButton");
	pauseButton = document.getElementById("pauseButton");
	
	$("#imgup_btn").prop("disabled", true);

	$('.otp-info').hide();
	$("#captureBtn").hide();
	$("#showCameraBtn").hide();
	$("#startTestBtn").hide();
	$('#img_url').hide();
	
	$('#camera').hide();
	$('#upload_img').hide();
	
	$("#photoFile").change(function() 
	{
		var filename = $("#photoFile").val();
		if(filename == "")
		{
			swal("OOPS!", "Please select photo image", "warning");
		 	return false;
		}
		var input = this;
		var formData = new FormData($("#imageform1")[0]);	 	
		var flag = false;
		
		$.LoadingOverlay("show");
		$.ajaxSetup({async:false});
		$.ajax({
			url: '/bootcamp/uploadPhotoImage?user_id='+user_id+'',
			type: 'POST',
			data: formData,
			async: true,
			cache: false,
			contentType: false,
			processData: false,
			beforeSend: function( xhr ) {},
				success: function (response) {
			    
				$.LoadingOverlay("hide");
			    
				var obj = jQuery.parseJSON(response);
				
			    if(obj.status == 400)
			    {
					swal("OOPS!", obj.msg, "warning");
					flag = true;
					return false;
				}
				
			    var img_path = $.trim(obj.imagePath);
			    
			    $("#photoImagePath").html(img_path);
			    
			    if (input.files && input.files[0]) 
				{
					var reader = new FileReader();
				    reader.onload = function (e) 
				    {
				    	$('#photoImageView').attr('src', e.target.result).width(150);
					    $("#photoDiv").show();
				    }
				    	reader.readAsDataURL(input.files[0]);
				}
			    	var ePanResponse = obj.ePanResponse;
			        $("#personalDiv").show();		        
			    }
			});
			if(flag)
			{
				return false;
			}
		});
});

function checkEmailAndTestIdExistOrNot()
{
	user_name = $("#user_name").val();
	user_email = $("#user_email").val();
	user_mobile = $("#user_mobile").val();
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/checkTestEmailAlreadyExistsOrNot", {test_id: "" + test_id + "",user_email: "" + user_email + "",}, function(data)
	{		
		$.LoadingOverlay("hide");
		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
   			if(obj.status == "old_user"){
   				swal({
   				    title: "Notification!",
   				 	text: obj.msg,
   				    type: "warning",
   				    showCancelButton: true,
   				    confirmButtonText: 'Yes, Take Test',
   				    cancelButtonText: "No, Cancel"
   				 },function(isConfirm){
   				   if (isConfirm){
   						generateEmailOtpToVerifyUser(); 
   				    }else{
   				    	swal.close();
   				    	return false;
   				    }
   				 });
   			}else if("new_user"){
   				generateEmailOtpToVerifyUser(); 
   			}
			return true;
   		} else {
   			swal("OOPS!", "Please Enter Correct Details", "error");
   			return false;
   		}		
	},'text');
}

function generateEmailOtpToVerifyUser()
{
	user_name = $("#user_name").val();
	user_email = $("#user_email").val();
	user_mobile = $("#user_mobile").val();
	
	if(user_name == ""){
    	swal("OOPS!", "Please Enter Your Name", "error");
	 	return false;
    }
	
	if(user_email == ""){
    	swal("OOPS!", "Please Enter Your Email", "error");
	 	return false;
    }
	
	if(user_mobile == ""){
    	swal("OOPS!", "Please Enter Your Mobile", "error");
	 	return false;
    }
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/generateEmailOtpToVerifyUser", {test_id: "" + test_id + "", user_name: "" + user_name + "", user_email: "" + user_email + "",}, function(data)
	{		
		$.LoadingOverlay("hide");
		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
  			swal("Success!", obj.msg, "success");  
  			$('#fieldsetuser').hide();
  			$('#fieldsetVerifyUser').show();
  			$('#fieldsetuploadimg').hide();
			return true;
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
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/verifyEmailOtpAndCreateUserByTestId", {test_id: "" + test_id + "", user_name: "" + user_name + "", user_email: "" + user_email + "",user_mobile: "" + user_mobile + "",code: "" + user_otp + "",}, function(data)
	{		
		
		$.LoadingOverlay("hide");
		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
   			//swal("Success!", obj.msg, "success");
   			
   			user_id = obj.user_type_id;
   			userAuthCode = obj.msg;
   			
   			checkCameraIsThereOrNot();
   			
   			$('#fieldsetuser').hide();
  			$('#fieldsetVerifyUser').hide();
  			$('#fieldsetuploadimg').show();
   			
			return true;
   		} else {
   			swal("OOPS!", obj.msg, "error");
   		 	return false;
   		}
		
	},'text');
	
	return true;
}

function checkCameraIsThereOrNot()
{
	navigator.mediaDevices.getUserMedia({ audio: false, video: true}).then(function (stream) 
	{
	  	if (stream.getVideoTracks().length > 0){
	  		initCam();
	  		$('#camera').show();
			$('#upload_img').hide();
	  	}else{
	  		swal("OOPS!", "Camera Not Found, Please upload your image", "error");
		 	return false;
	  	}
	 }).catch(function (error) { 
      		$('#upload_img').show();
			$('#camera').hide();
	});
}

function img_pathUrl(input)
{
	$("#imgup_btn").prop("disabled", false);
	$('#img_url').show();
    $('#img_url')[0].src = (window.URL ? URL : webkitURL).createObjectURL(input.files[0]);
}

function isEmail(email) 
{
	  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  return regex.test(email);
}

function initCam() 
{
	 $("#my_camera").show();
	 Webcam.set({width: 320, height: 240,image_format: 'jpeg', jpeg_quality: 90});
	 Webcam.attach( '#my_camera' );
	 $("#startCam").hide();
	 $("#captureBtn").show();
	 $("#results").hide();
}

function take_snapshot()
{
	var shutter = new Audio();
	shutter.autoplay = true;
	shutter.src = navigator.userAgent.match(/Firefox/) ? '/resources/mcq/js/webcamjs/shutter.ogg' : '/resources/mcq/js/webcamjs/shutter.mp3';
	shutter.play();
    Webcam.snap( function(data_uri) 
    {
        document.getElementById('results').innerHTML = '<img id="imageprev" src="'+data_uri+'"/>';
    });
    
    $("#startCam").show();
    $("#results").show();
    $("#my_camera").hide();
    $("#captureBtn").hide();
    $("#showCameraBtn").show();
    $("#startTestBtn").show();
}

function uploadImage(authCode)
{
	var widScrn = screen.width;
	var higScrn = screen.height;
	
	var domain = '${domainName}';
	
	var testLink = ""+domain+"bootcamp/tk-online-test?7e1081a9="+testAuthCode+"&64fca0f5="+userAuthCode+"";
	
	//openedWindow = window.open(testLink,''+testName+'','titlebar=no,toolbar=no,menubar=no,width='+widScrn+',height='+higScrn+'');
	
	openedWindow = window.open(testLink,''+testName+'','directories=no,titlebar=no,toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width='+widScrn+',height='+higScrn+'');
}

function saveImageFileToProfile()
{
	var datapair = "";
	
	if($('#imageprev').length)
	{
		datapair = document.getElementById("imageprev").src;	
	}
	
	if (datapair == "") 
	{
	 	swal("OOPS!", "Please capture the photo image", "warning");	 	
		$('#upload_img').show();
		$('#camera').hide();
		return false;
	}
	
	var img = $.trim(datapair.toString()).replace('data:image/jpeg;base64,', '');
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/uploadPhotoImageBase64", {user_id : user_id,user_name : user_name,base64image : img}, function(data){
		
		$.LoadingOverlay("hide");
		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
		if(obj.status_code == 200)
   		{
			$('#fieldsetuser').hide();
			$('#fieldsetuploadimg').hide();
			
			Webcam.reset();
			
			var widScrn = screen.width;
			var higScrn = screen.height;
			
			var domain = '${domainName}';
			
			var testLink = ""+domain+"bootcamp/tk-online-test?7e1081a9="+testAuthCode+"&64fca0f5="+userAuthCode+"";
			
			//openedWindow = window.open(testLink,'Teksands Online Test','titlebar=no,toolbar=no,menubar=no,width='+widScrn+',height='+higScrn+'');	
			
			openedWindow = window.open(testLink,''+testName+'','directories=no,titlebar=no,toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width='+widScrn+',height='+higScrn+'');
			
			$('#fieldsetuser').show();
  			$('#fieldsetVerifyUser').hide();
  			$('#fieldsetuploadimg').hide();
			
			return false;
			
   		} else 
   		{
   			swal("OOPS!", obj.msg, "error");
   		 	return false;
   		}
	},'text');
}

var timer = setInterval(function() { 
    if(openedWindow.closed) {
        clearInterval(timer);
        document.location.href="/";
    }
}, 1000);
</script>

<section class="section bgw">
	<div class="container">
	    <div class="row">
	        <div class="col-md-10 col-md-offset-1 col-sm-12">
	            <div class="content">
	                <div class="row big-post">
	                    <div class="col-md-12">
	                        <div class="panel panel-default teksands_form">
	                        	<div class="panel-heading">
	                        		<h3 class="forum-titles entry-title text-center m-0"><c:out value="${test.test_name}"></c:out></h3>
	                        	</div>
	                        	<div class="panel-body">
	                        		<div id="msform">
		                           		<fieldset id="fieldsetuser">
											<form id="user_sign_up_form" role="form" method="post" enctype="multipart/form-data">
												<div class="form-card">
													<div class="row user-info">
														<div class="col-lg-12">
															<p style="text-align: justify;"><c:out value="${test.test_description}" escapeXml="false" /></p>
														</div>
														<div class="col-lg-12">
															<div class="form-group form-validate">
																<label>Enter Your Name:</label>
																<input id="user_name" name="user_name" type="text" class="form-control" placeholder="Name">
															</div>
														</div>
														<div class="col-lg-6">
															<div class="form-group form-validate">
																<label>Enter Your Email:</label>
																<input id="user_email" name="user_email" type="email" class="form-control" placeholder="Email">
															</div>
														</div>
														<div class="col-lg-6">
															<div class="form-group form-validate">
																<label>Enter Your Mobile:</label>
																<input id="user_mobile" name="user_mobile" type="number" class="form-control" placeholder="Mobile">
															</div>
														</div>
													</div>
												</div>
												<button type="submit" value="submit" id="submit" class="button button--wayra btn-square"> Submit</button>
											</form>
										</fieldset>
										<fieldset id="fieldsetVerifyUser">
											<form id="userOtpVerificatiion" role="form" method="post" enctype="multipart/form-data">
												<div class="form-card">
													<div class="row">
														<div class="col-lg-4"></div>
														<div class="col-lg-4">
															<div class="form-group form-validate">
																<label>Enter Email OTP:</label>
																<input id="user_otp" name="user_otp" type="number" class="form-control" placeholder="Email OTP">
															</div>
														</div>
														<div class="col-lg-4"></div>
													</div>
												</div>
												<button type="submit" value="submit" id="submit" class="button button--wayra btn-square"> Submit</button>
											</form>
										</fieldset>
										<fieldset id="fieldsetuploadimg">
											<div class="row">
												<div class="col-lg-12 text-center" id="camera">
													<label>Capture your photo and upload</label>
													<div id="my_camera"></div>
													<div id="results" style="margin: 20px 0px;"></div>
													<a href="javascript:void(0)" id="startCam" onclick="initCam()"><img src="/resources/images/camera-1.png" id="cam_img" alt="your image"></a>
													<a href="javascript:void(0)" id="captureBtn" onclick="take_snapshot()">	<img src="/resources/images/camera-2.png" id="cam_img" alt="your image"></a>
													<p class="py-4 font-italic">Click on Camera Button to capture your photo and Proceed to Test</p>																										
													<input type="button" id="startTestBtn" class="action-button btn btn-primary" name="next" onclick="saveImageFileToProfile()" class="next action-button btn btn-primary" data-custom="teksands" data-steps="2" value="Start Test" />
												</div>												
			                                     <div id="upload_img" class="row tab-pane">
													<div class="col-lg-12 text-center">
														<div class="form-group form-group3">																												
															<form id="imageform1" role="form" method="post" enctype="multipart/form-data">
															    <p class="py-4 font-italic">Please upload your recent photo and click on the Start Button</p>
																<input type="hidden" name="imageType" value="photo" />
																<input type="file" id="photoFile"  class="photoFile" name="photoFile" onChange="img_pathUrl(this);" style="margin-top: 25px;"/>
																<div class="col-lg-12 text-center">
																	<img src="" id="img_url" alt="your image">
																</div>
																<input type="button" id="imgup_btn" class="action-button btn btn-primary"name="next" onclick = "uploadImage()" class="next action-button btn btn-primary" data-custom="teksands" data-steps="2" value="Start Test" style="margin-top: 35px;"/>
															</form>
														</div>
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