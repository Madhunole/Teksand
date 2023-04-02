<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- https://github.com/jquery-validation/jquery-validation/blob/master/demo/bootstrap/index.html -->

<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>

<style>
.text-danger {
    color: #dc3545!important;
}
.checkbox label::after {
    top: 2px !important;
    left: 1px !important;
}
.checkbox label::before {
    margin-left: -20px!important;
    top: 6px!important;
}
.form-control-progrom {
    height: 33px !important;
    margin-bottom: 20px !important;
    box-shadow: none !important;
    color: #555 !important;
    border-radius: 0 !important;
    letter-spacing: 0.3px !important;
    font-size: 13px !important;
    border: 0px solid #e9e9ec !important;
    border-bottom: 1px solid #e9e9ec !important;
}
.form-lable{
    color: #777 !important;
    font-size: 11px !important;
}
.input-group-btn:first-child > .btn, .input-group-btn:first-child > .btn-group {
    margin-right: -1px !important;
    margin-top: -19px !important;
    padding: 13px !important;
    font-size: 12px !important;
}

.btn-outline-primary {
    color: #3ca1db;
    background-color: transparent;
    background-image: none;
    border-color: #3ca1db;
}
.btn-outline-primary:hover {
    background-color: #3ca1db !important;
    color: #fff !important;
}
.mt-5 {
    margin-top: 25px !important;
}

@media only screen and (min-width: 992px) {
	.mx-auto {
		margin-left: 15%!important;
		margin-right: 10%!important;
	}
}

@media only screen and (min-width: 1200px) {
	.mx-auto {
		margin-left: 15%!important;
		margin-right: 10%!important;
	}
}
.help-block {
    color: #FF0000 !important;
}
.form-control-feedback {
	width: 56px !important;
    line-height: 106px !important;
}
.contact_form .form-control {
    margin-bottom: 0 !important;
}
.has-feedback label ~ .form-control-feedback {
    top: 0 !important;
}
.error
{
    width: 100%;
    margin-top: 0.25rem;
    font-size: 80%;
    color: #e74a3b;
}
</style>


<script>

<c:choose>
	<c:when test="${empty auth_code}">
		var auth_code = "";																   
	</c:when>
	<c:otherwise>
		var auth_code = '${auth_code}';
	</c:otherwise>
</c:choose>


$( document ).ready(function() {
	
	$("#other_text").hide();
	$(".can_last_working_day").hide();
	
	for (i = new Date().getFullYear(); i > 1949; i--)
    {
        $('#can_ug_graduation_year').append($('<option />').val(i).html(i));
    }
    
    for (i = new Date().getFullYear(); i > 1949; i--)
    {
        $('#can_pg_year').append($('<option />').val(i).html(i));
    }
    
    $("#file").change(function() 
  		{
  		   var can_mobile = $("#can_mobile").val();
  		   if(can_mobile == "")
  		   {
  			   $("#file").val(""); 
  		 	   swal("OOPS!", "Please fill in the Mobile Number before you upload the CV", "info");
  		 	   return false;
  		   }
  		   $("#txt_candidate_mobile").val(can_mobile);
  		   var filename = $("#file").val(); 
  		   if(filename == "")
  		   {
  			   $("#file").val(""); 
  		 	   swal("OOPS!", "Please select the CV document", "info");
  		 	   return false;
  		   }
  		   var input = this;
  		 	
  		 	var formData = new FormData($("#signupForm")[0]);	 	
  			var flag = false;
  			
  			$.LoadingOverlay("show");
  			
  			$.ajaxSetup({async:false});
  			$.ajax({
  			    url: '/bootcamp/uploadCandidateCVDocument',
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
  			    	var obj = jQuery.parseJSON(response);
  					if(obj.status == 400){
  						swal("OOPS!", obj.msg, "info");
  						flag = true;
  						return false;
  					}
  			        var img_path = $.trim(obj.msg);
  			        $("#para_resume").html(img_path);
  			        var url = '${resume_path}' + img_path;
  			        $("#para_resume").attr("href",url);
  			    }
  			  });
  			
  			if(flag)
  			{
  				return false;
  			}
  		});
  		
  	$( "#signupForm" ).validate( {
		rules: {
			name: {
				required: {
			        depends:function(){
			            $(this).val($.trim($(this).val()));
			            return true;
			        }
			    },
			    minlength: 2
			},
			email: {
				required: {
			        depends:function(){
			            $(this).val($.trim($(this).val()));
			            return true;
			        }
			    },
				email: true
			},
			mobile: {
				required: {
			        depends:function(){
			            $(this).val($.trim($(this).val()));
			            return true;
			        }
			    },
				minlength: 10
			},
			key_skill: {
				required: {
			        depends:function(){
			            $(this).val($.trim($(this).val()));
			            return true;
			        }
			    },
				minlength: 2
			},
			company_name: {
				required: {
			        depends:function(){
			            $(this).val($.trim($(this).val()));
			            return true;
			        }
			    },
				minlength: 2
			},
			ctc: {
				required: {
			        depends:function(){
			            $(this).val($.trim($(this).val()));
			            return true;
			        }
			    },
			},
			notice_period_month: {
				required: {
			        depends:function(){
			            $(this).val($.trim($(this).val()));
			            return true;
			        }
			    },
				minlength: 1
			},
			notice_period_flag: {
				required: true,
			},
			last_working_date: {
				required: true,
				date: true,
			},
			experience: {
				required: {
			        depends:function(){
			            $(this).val($.trim($(this).val()));
			            return true;
			        }
			    },
			},
			ug_degree: {
				required: {
			        depends:function(){
			            $(this).val($.trim($(this).val()));
			            return true;
			        }
			    },
			},
			ug_degree_stream: {
				required: {
			        depends:function(){
			            $(this).val($.trim($(this).val()));
			            return true;
			        }
			    },
			},
			ug_degree_cgpa: {
				required: {
			        depends:function(){
			            $(this).val($.trim($(this).val()));
			            return true;
			        }
			    },
			},
			can_ug_graduation_year: {
				required: {
			        depends:function(){
			            $(this).val($.trim($(this).val()));
			            return true;
			        }
			    },
			},
			can_current_location: {
				required: {
			        depends:function(){
			            $(this).val($.trim($(this).val()));
			            return true;
			        }
			    },
			},
			file: {
				required: true,
			},
		},
		messages: {
			name: "Please Enter Your Name",
			email: "Please Enter Email Address",
			mobile: {
				required: "Please Enter Your Mobile",
				minlength: "Please Enter Your 10 Digit Mobile Number"
			},
			key_skill: "Please Enter Key Skils",
			company_name: "Please Enter Your current Company Name",
			ctc: "Please Enter Your Current CTC (LPA)",
			notice_period_month: "Please Enter Your Notice Period",
			last_working_date: "Please Select the Last Working Date",
			experience: "Please Enter Your Experience",
			ug_degree: "Please Enter Your Bachelors Degree",
			ug_degree_stream: "Please Enter Your Bachelors Degree Stream",
			ug_degree_cgpa: "Please Enter Your Bachelor's Degree CGPA",
			can_ug_graduation_year: "Please Select Your Post Graduation Year",
			can_current_location: "Please Enter Your Current Location (City/State)",
			file: "Please Upload Your Resume",
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
		}
	} );
});

$.validator.setDefaults( {
	submitHandler: function () {
		saveCandidate();
	}
} );

function showOtherLanguage()
{
	if($('.checkbox3').is(":checked")){
 		$("#other_text").show();
	}else{
 		$("#other_text").hide();
	}
}

function saveCandidate()
{
	var can_name = $("#can_name").val();
	var can_email = $("#can_email").val();
	var can_mobile = $("#can_mobile").val();
	var can_key_skills = $("#can_key_skills").val();
	var can_company_name = $("#can_company_name").val();
	var can_ctc = $("#can_ctc").val();
	var can_last_working_date = $("#can_last_working_date").val();
	var can_experience = $("#can_experience").val();
	var can_certification = $("#can_certification").val();
	var can_checkbox3_text_box = $("#can_checkbox3_text_box").val();
	var can_bachelors_degree = $("#can_bachelors_degree").val();
	var can_bachelors_degree_stream = $("#can_bachelors_degree_stream").val();
	var can_bachelors_degree_cgpa = $("#can_bachelors_degree_cgpa").val();
	var can_ug_graduation_year = $("#can_ug_graduation_year").val();
	var can_pg_degree = $("#can_pg_degree").val();
	var can_pg_year = $("#can_pg_year").val();
	var can_how_find_me = $("#can_how_find_me").val();
	var can_resume = $("#para_resume").html();
	var can_last_working_day = $("#can_last_working_day").val();
	
	var can_current_location = $("#can_current_location").val();
	var can_preferred_location = $("#can_preferred_location").val();
	
	/* var can_checkbox_java;
	var can_checkbox_python;
	var can_checkbox_other;
	
	if($('#can_checkbox_java').is(":checked")){ can_checkbox_java = "java"; }else{ can_checkbox_java = "";}
	
	if($('#can_checkbox_python').is(":checked")){ can_checkbox_python = "python" }else{ can_checkbox_python = ""}
	
	if($('#can_checkbox_other').is(":checked")){ can_checkbox_other = "others" }else{can_checkbox_other = "";} */
	
	/* can_checkbox_java: "" + can_checkbox_java + "",
	can_checkbox_python: "" + can_checkbox_python + "",
	can_checkbox_other: "" + can_checkbox_other + "",
	can_checkbox3_text_box: "" + can_checkbox3_text_box + "", */
	
	$.ajaxSetup({async:false});
	$.post("/saveCandidateFromWebsite", {can_name: "" + can_name + "", 
		can_email: "" + can_email + "",
		can_mobile: "" + can_mobile + "", 
		can_key_skills: "" + can_key_skills + "",
		can_ctc: "" + can_ctc + "",
		can_last_working_date: "" + can_last_working_date + "",
		can_last_working_day: "" + can_last_working_day + "",
		can_experience: "" + can_experience + "",
		can_certification: "" + can_certification + "",
		can_bachelors_degree: "" + can_bachelors_degree + "",
		can_bachelors_degree_stream: "" + can_bachelors_degree_stream + "",
		can_bachelors_degree_cgpa: "" + can_bachelors_degree_cgpa + "",
		can_ug_graduation_year: "" + can_ug_graduation_year + "",
		can_pg_degree: "" + can_pg_degree + "",
		can_pg_year: "" + can_pg_year + "",
		can_how_find_me: "" + can_how_find_me + "",
		can_current_location: "" + can_current_location + "",
		can_preferred_location: "" + can_preferred_location + "",
		para_resume: "" + para_resume + "",
		auth_code: "" + auth_code + "",
	}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
			swal({
   	            title: "Thank you for your Application.",
   	            text: "We will get back to you shortly.",
   	            type: "success"
   	        }, function() {
   	        	window.location = "/";
   	        	$("#can_name").val("");
   				$("#can_email").val("");
   				$("#can_mobile").val("");
   				$("#can_key_skills").val("");
   				$("#can_company_name").val("");
   				$("#can_last_working_date").val("");
   				$("#can_experience").val("");
   				$("#can_certification").val("");
   				$("#can_checkbox3_text_box").val("");
   				$("#can_bachelors_degree").val("");
   				$("#can_bachelors_degree_stream").val("");
   				$("#can_bachelors_degree_cgpa").val("");
   				$("#can_ug_graduation_year").val("");
   				$("#can_pg_degree").val("");
   				$("#can_pg_year").val("");
   				$("#can_how_find_me").val("");
   				$("#para_resume").html("");  
   				$("#file").val("");
   	        });
          	
          	
   		} else {
   			swal("OOPS!", "Please Enter Correct Details", "error");
   		 	return false;
   		}
		
	},'text');
}

function getFlagForNoticePeriod()
{
	var flag = $('input[name="notice_period_flag"]:checked').val();
	
	if(flag == "1"){
		$(".can_last_working_day").show();
	}else if(flag == "0"){
		$(".can_last_working_day").hide();
	}else{
		swal("OOPS!", "Are you in your Notice Period", "error");
	 	return false;
	}
}
</script>

<div class="page-title bgg">
    <div class="container clearfix">
       <div class="pull-left">
           <div class="bread">
               <ol class="breadcrumb">
                   <li><a href="#">Home</a></li>
                   <li class="active">Register Candidate</li>
               </ol>
           </div>
       </div>
    </div>
</div>

<section class="section bgw">
	<div class="container">
	    <div class="row">
	        <div class="col-md-9 mx-auto">
	            <div class="forumwrapper">
	                <div class="forumwrapper-padding">
	                    <div id="bbpress-forums">
	                        <div class="table-responsive">
	                            <ul class="bbp-forums">
	                                <li class="bbp-header">
	                                    <ul class="forum-titles">
	                                        <li>Position Application Form</li>
	                                    </ul>
	                                </li>
	                                <li class="bbp-body">       
	                                    <ul class="forum type-forum status-publish hentry loop-item-0 odd bbp-forum-status-open bbp-forum-visibility-publish">
	                                        <li>
	                                        	<form id="signupForm" role="form" method="post" enctype="multipart/form-data">
	                                            	<div class="row contact_form">
	                                            		<c:if test="${not empty job_title}">
	                                            			<h4 class="h4 text-center"><c:out value="${job_title}"></c:out></h4>
	                                            		</c:if>
	                                            		<div class="col-lg-12">
		                                            		<div class="form-group form-validate">
					                                            <label class="form-lable">Your Full Name (as in official documents) <span class="text-danger">*</span></label>
					                                            <input type="text" name="name" id="can_name" class="form-control" placeholder="Name" required>
					                                        </div>
		                                            	</div>
		                                            	<div class="col-lg-6">
			                                            	<div class="form-group form-validate">
					                                            <label class="form-lable">Email <span class="text-danger">*</span></label>
					                                            <input type="text" name="email" id="can_email" class="form-control" placeholder="Email">
					                                        </div>
		                                            	</div>
		                                            	<div class="col-lg-6">
			                                            	<div class="form-group form-validate">
					                                            <label class="form-lable">Contact Number <span class="text-danger">*</span></label>
					                                            <input type="text" name="mobile" id="can_mobile" class="form-control" placeholder="Contact Number">
					                                        </div>
		                                            	</div>
		                                            	<div class="col-lg-12">
			                                            	<div class="form-group form-validate">
					                                            <label class="form-lable">Key Skills (List multiple skills, separated by comma)<span class="text-danger">*</span></label>
					                                            <input type="text" name="key_skill" id="can_key_skills" class="form-control" placeholder="Key Skills">
					                                        </div>
		                                            	</div>
		                                            	<div class="col-lg-6">
			                                            	<div class="form-group form-validate">
					                                            <label class="form-lable">Current Company Name (put NA if Fresher) <span class="text-danger">*</span></label>
					                                            <input type="text" name="company_name" id="can_company_name" class="form-control" placeholder="Current Company Name">
					                                        </div>
		                                            	</div>
		                                            	<div class="col-lg-6">
			                                            	<div class="form-group form-validate">
					                                            <label class="form-lable">Current CTC (LPA) <span class="text-danger">*</span></label>
					                                            <input type="number" name="ctc" id="can_ctc" class="form-control" placeholder="Current CTC (LPA)"  min="0" max="200">
					                                        </div>
		                                            	</div>
		                                            	<div class="col-lg-4">
			                                            	<div class="form-group form-validate">
					                                            <label class="form-lable">Notice Period (months) <span class="text-danger">*</span></label>
					                                            <input type="number" name="notice_period_month" id="can_last_working_date" class="form-control" placeholder="Notice Period (months)">
					                                        </div>
		                                            	</div>
		                                            	<div class="col-lg-4">
			                                            	<div class="form-check form-validate">
			                                            		<label class="form-lable">Are you in your Notice Period <span class="text-danger">*</span></label><br>
			                                            		<div class="form-group form-radio" style="margin-top: 9px;margin-bottom: 10px;">
				                                            		<input class="form-check-input" type="radio" name="notice_period_flag" id="radio_1" value="1" onchange="getFlagForNoticePeriod()">
				                                            		<label class="form-check-label form-lable" for="radio_1" style="margin: 0 15px 0 0;">Yes</label>
				                                            		<input class="form-check-input" type="radio" name="notice_period_flag" id="radio_2" value="0" onchange="getFlagForNoticePeriod()">
				                                            		<label class="form-check-label form-lable" for="radio_2">No</label>
			                                            		</div>
															</div>
		                                            	</div>
		                                            	<div class="col-lg-4 can_last_working_day">
			                                            	<div class="form-group form-validate">
					                                            <label class="form-lable">Last Working Day <span class="text-danger">*</span></label>
					                                            <input type="date" name="last_working_date" id="can_last_working_day" class="form-control" placeholder="Total IT Experience">
					                                        </div>
		                                            	</div>
		                                            	<div class="col-lg-4">
			                                            	<div class="form-group form-validate">
					                                            <label class="form-lable">Total Years of IT Experience <span class="text-danger">*</span></label>
					                                            <input type="number" name="experience" id="can_experience" class="form-control" placeholder="Total IT Experience">
					                                        </div>
		                                            	</div>
		                                            	<div class="col-lg-12">
			                                            	<div class="form-group form-validate">
					                                            <label class="form-lable">Certifications</label>
					                                            <input type="text" name="certifications" id="can_certification" class="form-control" placeholder="List Certifications you have done">
					                                        </div>
		                                            	</div>
		                                            	<div class="col-lg-4">
			                                            	<div class="form-group form-validate">
					                                            <label class="form-lable">Bachelors Degree (BTech, BE, BCA?) <span class="text-danger">*</span></label>
					                                            <input type="text" name="ug_degree" id="can_bachelors_degree" class="form-control" placeholder="Bachelors Degree">
					                                        </div>
		                                            	</div>
		                                            	<div class="col-lg-4">
			                                            	<div class="form-group form-validate">
					                                            <label class="form-lable">Bachelors Degree Stream (CS, EC,..) <span class="text-danger">*</span></label>
					                                            <input type="text" name="ug_degree_stream" id="can_bachelors_degree_stream" class="form-control" placeholder="Bachelors Degree Stream">
					                                        </div>
		                                            	</div>
		                                            	<div class="col-lg-4">
			                                            	<div class="form-group form-validate">
					                                            <label class="form-lable">Bachelor's Degree CGPA/Percentage Marks <span class="text-danger">*</span></label>
					                                            <input type="text" name="ug_degree_cgpa" id="can_bachelors_degree_cgpa" class="form-control" placeholder="Bachelor's Degree CGPA">
					                                        </div>
		                                            	</div>
		                                            	<div class="col-lg-4">
			                                            	<div class="form-group form-validate">
					                                            <label class="form-lable">Year of Passing Graduation <span class="text-danger">*</span></label>
					                                            <select name="can_ug_graduation_year" id="can_ug_graduation_year" class="form-control form-control-sm">
					                                            	<option selected></option>
					                                            </select>
					                                        </div>
		                                            	</div>
		                                            	<div class="col-lg-4">
			                                            	<div class="form-group form-validate">
					                                            <label class="form-lable">Post Graduation Degree</label>
					                                            <input type="text" name="pg_degree" id="can_pg_degree" class="form-control" placeholder="Post Graduation Degree">
					                                        </div>
		                                            	</div>
		                                            	<div class="col-lg-4">
			                                            	<div class="form-group form-validate">
					                                            <label class="form-lable">Post Graduation Year</label>
					                                            <select name="can_pg_graduation_year" id="can_pg_year" class="form-control form-control-sm">
					                                            	<option selected></option>
					                                            </select>
					                                        </div>
		                                            	</div>
		                                            	<div class="col-lg-12">
			                                            	<div class="row">
			                                            		<div class="col-lg-6">
					                                            	<div class="form-group form-validate">
							                                            <label class="form-lable">Current Location (City/State)</label>
							                                            <input type="text" name="can_current_location" id="can_current_location" class="form-control" placeholder="Current Location (City/State)">
							                                        </div>
				                                            	</div>
				                                            	<div class="col-lg-6">
					                                            	<div class="form-group form-validate">
							                                            <label class="form-lable">Preferred Location</label>
							                                            <input type="text" name="can_preferred_location" id="can_preferred_location" class="form-control" placeholder="Preferred Location">
							                                        </div>
				                                            	</div>
			                                            	</div>
		                                            	</div>
		                                            	<div class="col-lg-12">
			                                            	<div class="form-group form-validate">
					                                            <label class="form-lable">How did you get to know about this opportunity (name the name of the person who referred you or the website)</label>
					                                            <input type="text" name="how_find" id="can_how_find_me" class="form-control" placeholder="How did you get to know about this opportunity">
					                                        </div>
		                                            	</div>
		                                            	<div class="col-md-12 form-validate">
														  	<label for="files" class="form-lable">Upload Your Current CV <span class="text-danger">*</span></label>
				                                   			<input type="hidden" name="txt_candidate_mobile" id="txt_candidate_mobile" value="" />
															<input type="file" id="file" name="file" class="btn btn-default btn-block" />
															<a id="para_resume" href="" class="text-primary" target="_blank"></a>
					                                   	</div>
					                                   	<div class="col-md-12 mt-5">
					                                   		<div class="text-center">
					                                   			<button type="submit" value="submit" id="submit" class="btn btn-primary btn-square"> Submit</button>
					                                   		</div>
						                                </div>
	                                            	</div>
	                                            </form>
	                                        </li>
	                                    </ul>
	                                 </li>
	                            </ul>
	                        </div>
	                    </div> 
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</section>

