<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>

<style>
@media (max-width: 768px){
	
}
.jobs-image {
	height: 50px;
    padding: 12px 0 0 70px;
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
.text-danger {
    color: #dc3545!important;
}
</style>

<script>

$(document).ready(function(){
	
	$("html, body").animate({ scrollTop: 0 }, "slow");
	
	$( "#job_post" ).validate( {
		rules: {
			role_name: {
				required: true,
				minlength: 2
			},
			position: {
				required: true,
				minlength: 2
			},
			total_vacancy: {
				required: true,
			},
			experience: {
				required: true,
			},
			industry: {
				required: true,
			},
			skills_required: {
				required: true,
			},
			min_salary_range: {
				required: true,
			},
			max_salary_range: {
				required: true,
			},
			location: {
				required: true,
			},
			qualification: {
				required: true,
			},
			short_description: {
				required: true,
			},
			/* skills_competencies: {
				required: true,
			},
			job_responsibilities: {
				required: true,
			}, */
			contact_person: {
				required: true,
			},
			contact_email: {
				required: true,
				email: true
			},
			company_name: {
				required: true,
			},
			company_website: {
				required: true,
			},
			emp_type: {
				required: true,
			},
			domain: {
				required: true,
			},
			emp_mode: {
				required: true,
			},
		},
		messages: {
			role_name: "Please Enter Role Name",
			position: "Please Enter Position",
			total_vacancy: "Please Enter Total Vacancy",
			experience: "Please Select Experience",
			industry: "Please Enter Industry",
			skills_required: "Please Enter Skills Required",
			min_salary_range: "Please Enter Min Salary Range",
			max_salary_range: "Please Enter Max Salary Range",
			location: "Please Enter location",
			qualification: "Please Enter Qualification",
			short_description: "Please Enter Short Description",
			/* skills_competencies: "Please write Skills Competencies",
			job_responsibilities: "Please write Jobs Responsibilities", */
			contact_person: "Please Enter Contact Person Name",
			contact_email: "Please Enter Contact Person Email",
			company_name: "Please Enter Company Name",
			company_website: "Please Enter Company Website",
			emp_type: "Please Select the EMP Type",
			domain: "Please Enter Domain",
			emp_mode: "Please Select EMP Mode",
		},
		errorElement: "div",
		
		ignore: ':hidden:not(.summernote),.note-editable.card-block',
		
		errorPlacement: function ( error, element ) {
			
			error.addClass( "help-block" );
			
			element.parents( ".form-validate" ).addClass( "has-feedback" );
			
			/* if(element.prop( "name" ) === "skills_competencies"){
				error.insertAfter( element.parent( ".note-editor" ) );
			} */
			
			/* if() {
				//error.insertAfter(element.siblings(".hdn_summernote"));
				error.insertAfter( element.parent( "#hdn_summernote" ) );
            } */
			
			if(element.prop( "type" ) === "checkbox"){
				var ele = element.parent("div");
				error.insertAfter( ele.parent("div") );
			}else if(element.prop( "type" ) === "radio"){
				error.insertAfter( element.parent( ".form-radio" ) );
			}else if(element.hasClass("summernote")){
				//error.insertAfter( element.parent( ".hdn_summernote" ) );
				error.insertAfter(element.siblings(".hdn_summernote"));
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
	
	/* $("#job_post_file").change(function() 
	{
		var filename = $("#job_post_file").val(); 
	   if(filename == "")
	   {
		 $("#file").val(""); 
	 	 swal("OOPS!", "Please select the CV document", "info");
	 	 return false;
	   }
	   var input = this;
	 	
	 	var formData = new FormData($("#imageform")[0]);	 	
		var flag = false;
		
		$.LoadingOverlay("show");
		
		$.ajaxSetup({async:false});
		$.ajax({
		    url: '/admin/uploadCompanyLogo',
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
		        $("#jobs_post").html(img_path);
		    }
		  });
		
		if(flag)
		{
			return false;
		}
	}); */
	
});

/* function mobileChange()
{
	var job_mobile = $("#contact_mobile").val();
   if(job_mobile == "")
   {
	   $("#file").val(""); 
 	 swal("OOPS!", "Please fill the form after you upload the resume", "info");
 	 return false;
   }
   $("#txt_resume_mobile").val(job_mobile);
} */


$.validator.setDefaults( {
	ignore: ":hidden:not(.post-content)",
	submitHandler: function () {
		saveJobs();
	}
} );


function saveJobs()
{
	var id = '${jobs.id}';
	var role_name = $("#role_name").val();
	var jobs_url = $("#jobs_url").val();
	var total_vacancy = $("#total_vacancy").val();
	var position = $("#position").val();
	var experience = $("#experience").val();
	var min_salary_range = $("#min_salary_range").val();
	var max_salary_range = $("#max_salary_range").val();
	var skills_required = $("#skills_required").val();
	var location = $("#location").val();
	var qualification = $("#qualification").val();
	var short_description = $("#short_description").val();
	var image = $("#image").val();
	var skills_competencies = $('#skills_competencies').summernote('code');
	var job_responsibilities = $('#job_responsibilities').summernote('code');
	var industry = $("#industry").val();
	var category = $("#category").val();
	var tags = $("#tags").val();
	var company_name = $("#company_name").val();
	/* var company_logo = $("#jobs_post").html(); */
	var company_about = $("#company_about").val();
	var company_website = $("#company_website").val();
	var company_address = $("#company_address").val();
	var contact_person = $("#contact_person").val();
	var contact_email = $("#contact_email").val();
	var contact_mobile = $("#contact_mobile").val();
	var emp_type = $("#emp_type").val();
	var domain = $("#domain").val();
	var job_mode = $("#emp_mode").val();
	var active = "1";
	
	$.ajaxSetup({async:false});
	$.post("/admin/saveOrUpdateJobs", {id: "" + id + "",
		role_name: "" + role_name + "", 
		total_vacancy: "" + total_vacancy + "",
		position: "" + position + "",
		experience: "" + experience + "",
		min_salary_range: "" + min_salary_range + "",
		max_salary_range: "" + max_salary_range + "",
		skills_required: "" + skills_required + "",
		location: "" + location + "",
		qualification: "" + qualification + "",
		short_description: "" + short_description + "",
		skills_competencies: "" + skills_competencies + "",
		job_responsibilities: "" + job_responsibilities + "",
		industry: "" + industry + "",
		category: "" + category + "",
		tags: "" + tags + "",
		company_name: "" + company_name + "",
		company_about: "" + company_about + "",
		company_website: "" + company_website + "",
		company_address: "" + company_address + "",
		contact_person: "" + contact_person + "",
		contact_email: "" + contact_email + "",
		contact_mobile: "" + contact_mobile + "",
		emp_type: "" + emp_type + "",
		job_mode: "" + job_mode + "",
		domain: "" + domain + "",
		active: "" + active + "",}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
  			
   			swal({
   	            title: "Thank you",
   	            text: obj.msg,
   	            type: "success"
   	        }, function() {
   	        	window.location = "/admin/jobs";
   	        	$("#role_name").val("");
   	   			$("#jobs_url").val("");
   	   			$("#total_vacancy").val("");
   	   			$("#position").val("");
   	   			$("#experience").val("");
   	   			$("#salary_range").val("");
   	   			$("#skills_required").val("");
   	   			$("#location").val("");
   	   			$("#qualification").val("");
   	   			$("#short_description").val("");
   	   			$("#skills_competencies").val("");
   	   			$("#job_responsibilities").val("");
   	   			$("#industry").val("");
   	   			$("#category").val("");
   	   			$("#tags").val("");
   	   			$("#company_name").val("");
   	   			$("#company_about").val("");
   	   			$("#company_website").val("");
   	   			$("#company_address").val("");
   	   			$("#contact_person").val("");
   	   			$("#contact_email").val("");
   	   			$("#contact_mobile").val("");
   	   			$("#emp_mode").val("");
   	   			$("#domain").val("");
   	        });
   			
   			return false;
   		} else {
   			swal("OOPS!", "Please Enter Correct Details", "error");
   		 	return false;
   		}
		
	},'text');
}

$(document).ready(function() {
	$('#skills_competencies').summernote({
		  height: 300,
		  minHeight: 300,
		  maxHeight: 300,
		});
	
	$("#skills_competencies").summernote("code", `${jobs.skills_competencies}`);

});

$(document).ready(function() {
	
	$('#job_responsibilities').summernote({
		height: 300,
		minHeight: 300,
		maxHeight: 300,
	});
	
	$("#job_responsibilities").summernote("code", `${jobs.job_responsibilities}`);
	
});

</script>

<div id="main">
	<div class="visible-md visible-xs visible-sm mobile-menu">
	    <button type="button" data-toggle="offcanvas"><i class="fa fa-bars"></i></button>
	</div>
	<section class="section bgw">
	    <div class="container-fluid">
	    	<div class="section-title-2 text-center course-title">
	            <c:choose>
	            	<c:when test="${empty jobs}">
	            		<h2>Teksands Jobs Post</h2>		
	            	</c:when>
	            	<c:otherwise>
	            		<h2>Teksands Update Jobs </h2>
	            	</c:otherwise>
	            </c:choose>
	            <hr>
	        </div><!-- end section-title -->
			<div class="edit-profile loginform contact_form">
			<form id="job_post" role="form" method="post" enctype="multipart/form-data" class="summernoteForm">
				<div class="form-group form-validate">
               		<label>Role Name <span class="text-danger">*</span></label>
                   	<input type="text" id="role_name" class="form-control" name="role_name" placeholder="Role Name" value="${jobs.role_name}" required>
				</div>
				<div class="form-group form-validate">
                   	<label>Position <span class="text-danger">*</span></label>
                   	<input type="text" id="position" class="form-control" name="position" placeholder="Position" value="${jobs.position}">
               	</div>
                <div class="row form-group">
		    		<div class="col-md-4 form-validate">
				    	<label>Total Vacancy <span class="text-danger">*</span></label>
				    	<input type="number" id="total_vacancy" name="total_vacancy" class="form-control" placeholder="Total vacancy" value="${jobs.total_vacancy}">
					</div>
		    		<div class="col-md-4 form-validate">
			      		<label>Experience <span class="text-danger">*</span></label>
			      		<input type="number" id="experience" name="experience" min="1" max="100" class="form-control" placeholder="Total vacancy" value="${jobs.experience}">
		    		</div>
				    <div class="col-md-4 form-validate">
			      		<label>Industry <span class="text-danger">*</span></label>
				    	<input type="text" class="form-control" id="industry" name="industry" placeholder="industry" value="${jobs.industry}">
				    </div>
		  		</div>
                <div class="form-group form-validate">
                	<label>Skills Required <span class="text-danger">*</span></label>
                    <input type="text" id="skills_required" class="form-control" name="skills_required" placeholder="HTML, CSS.." value="${jobs.skills_required}">
                </div>
                <div class="form-group">
                	<div class="row">
                    	<div class="col-md-4 col-sm-4">
                        	<label>Salary Range <span class="text-danger">*</span></label>
                        	<div class="row">
                        		<div class="col-lg-6 form-validate">
                        			<input type="number" id="min_salary_range" name="min_salary_range" min="0" max="500" class="form-control" placeholder="Min Salary" value="${jobs.min_salary_range}">
                        		</div>
                        		<div class="col-lg-6 form-validate">
                        			<input type="number" id="max_salary_range" name="max_salary_range" min="0" max="500" class="form-control" placeholder="Max Salary" value="${jobs.max_salary_range}">
                        		</div>
                        	</div>
						</div>
                        <div class="col-md-4 col-sm-4 form-validate">
			    			<label>Location <span class="text-danger">*</span></label>
			      			<input type="text" class="form-control" id="location" name="location" placeholder="location" value="${jobs.location}">
			    		</div>
			    		<div class="col-md-4 col-sm-4 form-validate">
			    			<label>Qualification <span class="text-danger">*</span></label>
			    			<input type="text" class="form-control" id="qualification" name="qualification" placeholder="qualification" value="${jobs.qualification}">
			    		</div>
					</div>
				</div>
                <div class="form-group form-validate">
                	<label>Short Description <span class="text-danger">*</span></label>
                    <textarea class="form-control" id="short_description" name="short_description" placeholder="Short Description">${jobs.short_description}</textarea>
				</div>
				<div class="form-group form-validate">
                	<label>Skills Competencies <span class="text-danger">*</span></label>
                    <input id="skills_competencies" class="post-content summernote" name="skills_competencies"></input>
                    <div class="hdn_summernote" id="hdn_summernote"></div>
				</div>
                <div class="form-group form-validate">
                	<label>Jobs Responsibilities <span class="text-danger">*</span></label>
                    <input id="job_responsibilities" class="post-content summernote" name="job_responsibilities"></input>
                    <div class="hdn_summernote" id="hdn_summernote"></div>
				</div>
				<div class="form-group">
                	<div class="row">
                    	<div class="col-md-6 form-validate">
                        	<label>Category</label>
                            <input type="text" class="form-control" id="category" name="category" placeholder="Category" value="${jobs.category}">
						</div>
                        <div class="col-md-6 form-validate">
		    				<div class="form-group">
			    				<label>Tags</label>
			      				<input type="text" class="form-control" id="tags" name="tags" placeholder="Tags" value="${jobs.tags}">
							</div>
			    		</div>
					</div>
				</div>
				<div class="form-group">
                	<div class="row">
                    	<div class="col-md-4 form-validate">
                        	<label>Contact Person <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="contact_person" name="contact_person" placeholder="Contact Person" value="${jobs.contact_person}">
						</div>
                        <div class="col-md-4 form-validate">
			    			<label>Contact Mobile</label>
			      			<input type="text" class="form-control" id="contact_mobile" name="contact_mobile" placeholder="Contact Mobile" value="${jobs.contact_mobile}">
			    		</div>
			    		<div class="col-md-4 form-validate">
			    			<label>Contact Mail Id <span class="text-danger">*</span></label>
			    			<input type="text" class="form-control" id="contact_email" name="contact_email" placeholder="Contact Mail Id" value="${jobs.contact_email}">
			    		</div>
		    		</div>
				</div>
                <div class="form-group">
                	<div class="row">
                    	<div class="col-md-6 form-validate">
                        	<label>Company Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="company_name" name="company_name" placeholder="Company Name" value="${jobs.company_name}">
						</div>
                        <div class="col-md-6 form-validate">
		    				<div class="form-group">
			    				<label>Company Website <span class="text-danger">*</span></label>
			      				<input type="text" class="form-control" id="company_website" name="company_website" placeholder="Company Website" value="${jobs.company_website}">
							</div>
			    		</div>
					</div>
					<div class="form-group form-validate">
	                	<label>About Company</label>
	                    <textarea class="form-control" id="company_about" name="company_about" placeholder="About Company">${jobs.short_description}</textarea>
					</div>
	                <div class="form-group form-validate">
	                	<div class="row">
	                    	<div class="col-md-12">
								<label>Company Address</label>
								<input type="text" class="form-control" id="company_address" name="company_address" placeholder="Company Address" value="${jobs.company_address}">
							</div>
						</div>
					</div>
	                <div class="form-group">
	                	<div class="row">
	                    	<div class="col-md-4 form-validate">
	                        	<label>EMP Type <span class="text-danger">*</span></label>
	                            <select class="form-control" id="emp_type" name="emp_type">
				      	  			<option selected disabled>Select the EMP Type</option>
									<option <c:if test="${jobs.emp_type eq 'Part Time'}" >selected</c:if> value="Part Time">Part Time</option>
									<option <c:if test="${jobs.emp_type eq 'Full Time 1 Lakhs'}" >selected</c:if> value="Full Time">Full Time</option>
				  				</select>
							</div>
							<div class="col-md-4 form-validate">
				    			<label>Domain <span class="text-danger">*</span></label>
				      			<input type="text" class="form-control" id="domain" name="domain" placeholder="UX, Design & Architecture" value="${jobs.domain}">
				    		</div>
				    		<div class="col-md-4 form-validate">
	                        	<label>Job Mode <span class="text-danger">*</span></label>
	                            <select class="form-control" id="emp_mode" name="emp_mode">
				      	  			<option selected disabled>Select the Job Mode</option>
									<option <c:if test="${jobs.job_mode eq 'Work from Home'}" >selected</c:if> value="Work from Home">Work from Home</option>
									<option <c:if test="${jobs.job_mode eq 'Hybrid'}" >selected</c:if> value="Hybrid">Hybrid</option>
									<option <c:if test="${jobs.job_mode eq 'Work from Office'}" >selected</c:if> value="Work from Office">Work from Office</option>
				  				</select>
							</div>
			    		</div>
					</div>
					<div class="row">
						<div class="col-lg-12 text-center">
							<c:choose>
				            	<c:when test="${empty jobs}">
				            		<button type="submit" value="submit" id="submit" class="btn btn-primary btn-square"> Create Job</button>
				            	</c:when>
				            	<c:otherwise>
				            		<button type="submit" value="submit" id="submit" class="btn btn-primary btn-square"> Update Job</button>
				            	</c:otherwise>
				            </c:choose>
						</div>
					</div>
				</div><!-- end edit profile -->
				</form>
	    	</div><!-- end container -->
	    </div>
	</section><!-- end section -->
</div>

<!-- <style>
.invalid-feedback {
    color: red !important;
	margin-bottom: 10px !important;
}
.note-editor.note-frame.panel.panel-default {
    margin-bottom: 10px !important;
}
</style>

<script>
$(document).ready(function(){
	var summernoteForm = $('.form-validate-summernote');
    var summernoteElement = $('.summernote');
    var summernoteElement_1 = $('.summernote_1');
    var summernoteValidator = summernoteForm.validate({
        errorElement: "div",
        errorClass: 'is-invalid',
        validClass: 'is-valid',
        ignore: ':hidden:not(.summernote),.note-editable.card-block',
        ignore: ':hidden:not(.summernote_1),.note-editable.card-block',
        errorPlacement: function (error, element) {
            error.addClass("invalid-feedback");
            if (element.prop("type") === "checkbox") {
                error.insertAfter(element.siblings("label"));
            } else if (element.hasClass("summernote")) {
                error.insertAfter(element.siblings(".hdn_summernote"));
            } else if (element.hasClass("summernote_1")) {
                error.insertAfter(element.siblings(".hdn_summernote_1"));
            } else {
                error.insertAfter(element);
            }
        }
    });

    summernoteElement.summernote({
        height: 300,
        callbacks: {
            onChange: function (contents, $editable) {
            	summernoteElement.val(summernoteElement.summernote('isEmpty') ? "" : contents);
            	summernoteValidator.element(summernoteElement);
            }
        }
    });
    
    summernoteElement_1.summernote({
        height: 300,
        callbacks: {
            onChange: function (contents, $editable) {
            	summernoteElement_1.val(summernoteElement_1.summernote('isEmpty') ? "" : contents);
            	summernoteValidator.element(summernoteElement_1);
            }
        }
    });
});

</script>

<div id="main">
	<div class="visible-md visible-xs visible-sm mobile-menu">
	    <button type="button" data-toggle="offcanvas"><i class="fa fa-bars"></i></button>
	</div>
	<div class="section">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<form id="job_post" role="form" method="post" enctype="multipart/form-data" class="form-validate-summernote">
						<textarea class="summernote" required data-msg="Please write something :)"></textarea>
						<div class="hdn_summernote" id="hdn_summernote"></div>
						<textarea class="summernote_1" required data-msg="Please write something :)"></textarea>
						<div class="hdn_summernote_1" id="hdn_summernote_1"></div>
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
 -->







