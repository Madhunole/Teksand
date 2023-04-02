<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
    font-size: 14px; !important;
}
.has-feedback label ~ .form-control-feedback {
    top: 0 !important;
}
.text-danger {
    color: #dc3545 !important;
}
.valid-res {
    width: 100% !important;
	margin-top: 10px !important;
    font-size: 12px !important;
    color: #e74a3b !important;
}
.invalid-res {    
    width: 100% !important;
  	margin-top: 10px !important;
    font-size: 12px !important;
    color: #e74a3b !important;
}
.error
{
    width: 100% !important;
    margin-top: 10px !important;
    font-size: 12px !important;
    color: #e74a3b !important;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
<script>
<c:choose>
	<c:when test="${empty jobMaster}">
		var id = "";																   
	</c:when>
	<c:otherwise>
		var id = ${jobMaster.id};
	</c:otherwise>
</c:choose>
$(document).ready(function(){	
	
    $('#job_failiure').hide();
    $('#skill-failiure').hide();
    
	$("html, body").animate({ scrollTop: 0 }, "slow");
	
	$('#skills_competencies').summernote({
		  height: 300,
		  minHeight: 300,
		  maxHeight: 300,
		  focus: true
	});
	$('#job_responsibilities').summernote({
		  height: 300,
		  minHeight: 300,
		  maxHeight: 300,
		  focus: true
	});	
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
			min_exp_range: {
				required: true,
			},
			max_exp_range: {
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
			min_exp_range: "Please Enter Min Experience",
			max_exp_range: "Please Enter Max Experience",
			industry: "Please Enter Industry",
			skills_required: "Please Enter Skills Required",
			min_salary_range: "Please Enter Min Salary Range",
			max_salary_range: "Please Enter Max Salary Range",		
			location: "Please Enter location",
			qualification: "Please Enter Qualification",
			short_description: "Please Enter Short Description",
			//category: "Pleas Enter Category",
			//tags: "Please Enter Tags",
			contact_mobile: {
				required: "Please Enter Your Mobile no",
				minlength: "Please Enter Your 10 Digit Mobile Number"
			},
			/* skills_competencies: "Please write Skills Competencies",
			job_responsibilities: "Please write Jobs Responsibilities", */
			contact_person: "Please Enter Contact Person Name",
			contact_email: "Please Enter Contact Person Email",
			company_name: "Please Enter Company Name",
			company_website: "Please Enter Company Website",
			emp_type: "Please Select the EMP Type",
			domain: "Please Enter Domain",
			emp_mode: "Please Select EMP Mode",
			company_about: "Please Enter the Company Details",
			company_address: "Please Enter the Company Address",			
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
	
	$('#job_post').on('submit', function(e) {
		if($('#skills_competencies').summernote('isEmpty')) {
			e.preventDefault();
			$('#skill-failiure').show();
		    if($('#job_responsibilities').summernote('isEmpty'))
		    {
		   		$('#job_failiure').show();		   	
			    return false;
		    }
		    else
		    {
		    	$('#job_failiure').hide();
		    	 return false;
		    }
		   
		  }
		
		else if($('#job_responsibilities').summernote('isEmpty')) {
			e.preventDefault();
		    $('#job_failiure').show();
		    if($('#skills_competencies').summernote('isEmpty'))
		    {
		   		$('#skill-failiure').show();
		   		 return false;
		    }
		    else
		    {		    	
		    	$('#skill-failiure').hide();
		    	 return false;
		    }
		  }		
		else
		{			
			$('#skill-failiure').hide();
			$('#job_failiure').hide();
		}
		
	});	

});

$.validator.setDefaults( {
	submitHandler: function () {	
		var skill = $('#skills_competencies').summernote('code');
		var job = $('#job_responsibilities').summernote('code');		
		if(skill != "" && job != ""){
			saveJobs();
		}
		else
		{
			if(skill == "")
				$('.summernote').summernote('focus');
			else
				$('.summernote').summernote('focus');
		}
	}
} );

function saveJobs()
{	
	var role_name = $("#role_name").val();
	var jobs_url = $("#jobs_url").val();
	var total_vacancy = $("#total_vacancy").val();
	var position = $("#position").val();
	var min_exp_range = $("#min_exp_range").val();
	var max_exp_range = $("#max_exp_range").val();
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
	var meta_title = $("#meta_title").val();
	var meta_desc = $("#meta_desc").val();
	var meta_keywords = $("#meta_keywords").val();
	var active = "1";
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/addOrUpdateNewJob", {id: "" + id + "",
		role_name: "" + role_name + "", 
		total_vacancy: "" + total_vacancy + "",
		position: "" + position + "",
		min_exp_range: "" + min_exp_range + "",
		max_exp_range: "" + max_exp_range + "",
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
		meta_title: "" +meta_title+ "",
		meta_desc: "" +meta_desc+ "",
		meta_keywords: "" +meta_keywords+ "",
		active: "" + active + "",}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
   			if(id == "")
   			{
	   			$.toast({
				    heading: 'Success',
				    text: 'We have succesfully Added the Job details',
				    icon: 'success',
				    position: 'top-right',
				    bgColor: '#d4edda',
				    textColor: '#155724',
				    afterShown: function () {
				    	setTimeout(function() {
				    		window.location.href = "/bootcamp/jobs-list"
				    	}, 5000);
				    },
				}) 
   			}
   			else
   			{
   				$.toast({
				    heading: 'Success',
				    text: 'We have succesfully Updated the Job details',
				    icon: 'success',
				    position: 'top-right',
				    bgColor: '#d4edda',
				    textColor: '#155724',
				    afterShown: function () {
				    	setTimeout(function() {
				    		window.location.href = "/bootcamp/jobs-list"
				    	}, 5000);
				    },
				}) 
   				
   			}
   		
   		} else {
   			$.toast({
			    heading: '<b>Error</b>',
			    text: 'Failure, Please Try Again',
			    icon: 'error',
			    position: 'top-right',
			    bgColor: '#f8d7da',
			    textColor: '#721c24',
			})
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

<div class="col-12 col-xl-auto mb-3">
<c:choose>
		<c:when test="${source eq 'view_jobs'}">
			<a class="btn btn-sm btn-light text-primary" href="/bootcamp/view-jobs?id=${jobMaster.id}">
		        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
		        Back to Job View
		    </a>
		</c:when>
		<c:otherwise>
			<a class="btn btn-sm btn-light text-primary" href="/bootcamp/jobs-list">
		        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
		        Back to Jobs List
		    </a>
		</c:otherwise>
	</c:choose>
</div>

<div class="container-fluid">
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			 <c:choose>
	            	<c:when test="${empty jobMaster}">
	            		<h6 class="m-0 font-weight-bold text-primary float-left">Add New Jobs Post</h6>		
	            	</c:when>
	            	<c:otherwise>
	            		<h6 class="m-0 font-weight-bold text-primary float-left">Update Jobs Post </h6>
	            	</c:otherwise>
	            </c:choose>
		</div>
		<div class="card-body">
            <div class="row">
            	
            <div class="col-lg-12">
            <div class="edit-profile loginform contact_form">
			<form id="job_post" role="form" method="post" enctype="multipart/form-data">
				<div class="row form-group">
				<div class="col-md-6 form-validate">
               		<label>Role Name <span class="text-danger">*</span></label>
                   	<input type="text" id="role_name" class="form-control" name="role_name" placeholder="Role Name" value="${jobs.role_name}" required>
                </div>
                <div class="col-md-6 form-validate">
               		<label>Position <span class="text-danger">*</span></label>
                   	<input type="text" id="position" class="form-control" name="position" placeholder="Position" value="${jobs.position}" required>
                </div>
				</div>
				<div class="row form-group form-validate">
		    		<div class="col-md-3">
				    	<label>Total Vacancy <span class="text-danger">*</span></label>
				    	<input type="number" id="total_vacancy" name="total_vacancy" class="form-control" placeholder="Total vacancy" value="${jobs.total_vacancy}" required>				      
					</div>
		    		<div class="col-md-5">
			      		<%-- <label>Experience <span class="text-danger">*</span></label>
			      		<input type="number" id="experience" name="experience" min="1" max="100" class="form-control" placeholder="Experience" value="${jobs.experience}" required> --%>
			      		<div class="row">
                       		<div class="col-lg-6 form-validate">
                       			<label>Min Experience (Years) <span class="text-danger">*</span></label>
                       			<input type="number" id="min_exp_range" name="min_exp_range" min="0" max="50" class="form-control" placeholder="Min Experience" value="${jobs.experience}">
                       		</div>
                       		<div class="col-lg-6 form-validate">
                       			<label>Max Experience (Years) <span class="text-danger">*</span></label>
                       			<input type="number" id="max_exp_range" name="max_exp_range" min="0" max="50" class="form-control" placeholder="Max Experience" value="${jobs.experience}">
                       		</div>
                       	</div>
		    		</div>
				    <div class="col-md-4 form-validate">
			      		<label>Industry <span class="text-danger">*</span></label>
				    	<input type="text" class="form-control" id="industry" name="industry" placeholder="Industry" value="${jobs.industry}" required>				    
				    </div>
		  		</div>
                <div class="form-group form-validate">
                	<label>Skills Required <span class="text-danger">*</span></label>
                    <input type="text" id="skills_required" class="form-control" name="skills_required" placeholder="HTML, CSS.." value="${jobs.skills_required}" required>
                </div>
               <div class="form-group">
                	<div class="row">
                    	<div class="col-md-4 col-sm-4">
                        	<label>Salary Range (LPA) <span class="text-danger">*</span></label>
                        	<div class="row">
                        		<div class="col-lg-6 form-validate">
                        			<input type="number" id="min_salary_range" name="min_salary_range" min="0" max="500" class="form-control" placeholder="Min Salary" value="${jobs.min_salary_range}" required>                        			
                        		</div>
                        		<div class="col-lg-6 form-validate">
                        			<input type="number" id="max_salary_range" name="max_salary_range" min="0" max="500" class="form-control" placeholder="Max Salary" value="${jobs.max_salary_range}">                        		
                        		</div>
                        	</div>
						</div>
                        <div class="col-md-4 col-sm-4 form-validate">
			    			<label>Location <span class="text-danger">*</span></label>
			      			<input type="text" class="form-control" id="location" name="location" placeholder="Location" value="${jobs.location}" required>			      			
			    		</div>
			    		<div class="col-md-4 col-sm-4 form-validate">
			    			<label>Qualification <span class="text-danger">*</span></label>
			    			<input type="text" class="form-control" id="qualification" name="qualification" placeholder="Qualification" value="${jobs.qualification}" required>			    			
			    		</div>
					</div>
				</div>
                <div class="form-group form-validate">
                	<label>Short Description <span class="text-danger">*</span></label>
                    <textarea class="form-control" id="short_description" rows="3" name="short_description" placeholder="Short Description" required>${jobs.short_description}</textarea>                    
				</div>
				<div class="form-group form-validate">
                	<label>Skills Competencies <span class="text-danger">*</span></label>
                    <input id="skills_competencies" class="post-content summernote" name="skills_competencies"></input>
                    <div class="hdn_summernote" id="hdn_summernote"></div>
					<div class="invalid-res" id="skill-failiure">
			          Please Enter the Skills Competencies.
				    </div> 
				</div>
				    
                <div class="form-group form-validate">
                	<label>Jobs Responsibilities <span class="text-danger">*</span></label>
                    <input id="job_responsibilities" class="post-content summernote" name="job_responsibilities" aria-invalid=false></input>
                    <div class="hdn_summernote" id="hdn_summernote1"></div>                  
				    <div class="invalid-res" id="job_failiure">
			          Please Enter the Jobs Responsibilities.
				    </div> 
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
                            <input type="text" class="form-control" id="contact_person" name="contact_person" placeholder="Contact Person" value="${jobs.contact_person}" required>                             
						</div>
                        <div class="col-md-4 form-validate">
			    			<label>Contact Mobile</label>
			      			<input type="text" class="form-control" id="contact_mobile" name="contact_mobile" placeholder="Contact Mobile" value="${jobs.contact_mobile}">			      		
			    		</div>
			    		<div class="col-md-4 form-validate">
			    			<label>Contact Mail Id <span class="text-danger">*</span></label>
			    			<input type="text" class="form-control" id="contact_email" name="contact_email" placeholder="Contact Mail Id" value="${jobs.contact_email}" required>			    			
			    		</div>
		    		</div>
				</div>
                <div class="form-group">
                	<div class="row">
                    	<div class="col-md-6 form-validate">
                        	<label>Company Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="company_name" name="company_name" placeholder="Company Name" value="${jobs.company_name}" required>
						</div>
                        <div class="col-md-6 form-validate">
		    				<div class="form-group">
			    				<label>Company Website <span class="text-danger">*</span></label>
			      				<input type="text" class="form-control" id="company_website" name="company_website" placeholder="Company Website" value="${jobs.company_website}" required>			      				
							</div>
			    		</div>
					</div>
					<div class="form-group form-validate">
	                	<label>About Company</label>
	                    <textarea class="form-control" id="company_about" rows="3" name="company_about" placeholder="About Company">${jobs.short_description}</textarea>	                   
					</div>
	                <div class="form-group form-validate">
	                	<div class="row">
	                    	<div class="col-md-12">
								<label>Company Address</label>
								<input type="text" class="form-control" id="company_address" name="company_address" placeholder="Company Address" value="${jobs.company_address}">								
							</div>
						</div>
					</div>
	                <div class="form-group form-validate">
	                	<div class="row">
	                    	<div class="col-md-4">
	                        	<label>EMP Type <span class="text-danger">*</span></label>
	                            <select class="form-control" id="emp_type" name="emp_type" required>
				      	  			<option value ="" selected disabled>Select the EMP Type</option>
									<option <c:if test="${jobs.emp_type eq 'Part Time'}" >selected</c:if> value="Part Time">Part Time</option>
									<option <c:if test="${jobs.emp_type eq 'Full Time 1 Lakhs'}" >selected</c:if> value="Full Time">Full Time</option>
				  				</select>				  				
							</div>
							<div class="col-md-4 form-validate">
				    			<label>Domain <span class="text-danger">*</span></label>
				      			<input type="text" class="form-control" id="domain" name="domain" placeholder="UX, Design & Architecture" value="${jobs.domain}" required>				      		
				    		</div>
				    		<div class="col-md-4 form-validate">
	                        	<label>Job Mode <span class="text-danger">*</span></label>
	                            <select class="form-control" id="emp_mode" name="emp_mode" required>
				      	  			<option value ="" selected disabled>Select the Job Mode</option>
									<option <c:if test="${jobs.job_mode eq 'Work from Home'}" >selected</c:if> value="Work from Home" >Work from Home</option>
									<option <c:if test="${jobs.job_mode eq 'Hybrid'}" >selected</c:if> value="Hybrid">Hybrid</option>
									<option <c:if test="${jobs.job_mode eq 'Work from Office'}" >selected</c:if> value="Work from Office">Work from Office</option>
				  				</select>				  				
							</div>
			    		</div>
					</div>					
					
					<div class="co-lg-12 mt-4">
						<div class="card">
							<div class="card-header font-weight-bold text-primary">
								Meta SEO
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12">
										 <div class="form-group form-validate">
						                	<label>Meta Title</label>
						                    <input type="text" class="form-control" id="meta_title" name="meta_title" placeholder="Meta Title" value="${jobs.meta_title}">	                   
										</div>
									</div>
									<div class="col-lg-12">
										 <div class="form-group form-validate">
						                	<label>Meta Description</label>
											<textarea class="form-control" id="meta_desc" rows="3" name="meta_desc" placeholder="Meta Description">${jobs.meta_desc}</textarea>
										</div>
									</div>
									<div class="col-lg-12">
										<div class="form-group form-validate">
						                	<label>Meta Keywords</label>
						                    <input type="text" class="form-control" id="meta_keywords" name="meta_keywords" placeholder="Meta Keywords" value="${jobs.meta_keywords}">	                   
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row mt-4">
						<div class="col-lg-12 text-center">
							<c:choose>
				            	<c:when test="${empty jobMaster}">
				            		<button type="submit" value="submit" id="submit" class="btn btn-primary cms-btn"> Create Job</button>
				            	</c:when>
				            	<c:otherwise>
				            		<button type="submit" value="submit" id="submit" class="btn btn-primary cms-btn"> Update Job</button>
				            	</c:otherwise>
				            </c:choose>
						</div>
					</div>
				</div><!-- end edit profile -->
				</form>
	    	</div><!-- end container -->											   
            	</div>
            </div>
        </div>
	</div>
</div>

<script type="text/javascript">

$(document).ready(function() {
	$('#cms_jobs_requirement').summernote({
		  height: 300,
		  minHeight: 300,
		  maxHeight: 300,
		  focus: true
	});
	$('#cms_role_description').summernote({
		  height: 300,
		  minHeight: 300,
		  maxHeight: 300,
		  focus: true
	});
	
	for (var i=1; i<21; i++){
	   $('<option/>').val([i]).html([i]).appendTo('#cms_min_exp');
	};
	
	for (var i=1; i<21; i++){
	   $('<option/>').val([i]).html([i]).appendTo('#cms_job_no_of_position');
	};
	
	loadData();
});

function getClientContactByCampnayId()
{
	var companyId = $("#cms_job_company").val();
	
	if(companyId == "")
    {
		swal("OOPS!", "Please Select the Company Name", "info");
 	    return false;
    }
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:true});
	$.post("/bootcamp/getClientContactByCampnayId", {companyId : "" + companyId + ""}, function(data)       	   
	{
		$.LoadingOverlay("hide");
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		
		if(obj == null || obj == "null")
		{
			swal("OOPS!", "This Company Does not have contact details. Please enter the contact name.", "info");
	 	    return false;
		}else
		{
			var ccontact_name = obj.contact_name;
			$("#cms_job_contact_person").val(ccontact_name);
		}
		
	}, "text");
}

function addUpdateNewJob()
{
	var job_title = $("#cms_job_title").val();
	var job_post_by = $("#cms_job_post_by").val();
	var jobs_requirement = $('#cms_jobs_requirement').summernote('code');
	var role_description = $('#cms_role_description').summernote('code');
	var job_company_id = $("#cms_job_company").val();
	var job_contact_person = $("#cms_job_contact_person").val();
	var job_no_of_position = $("#cms_job_no_of_position").val();
	var min_exp = $("#cms_min_exp").val();
	var tech_skills = $("#cms_tech_skills").val();
	
	if(job_title == "")
    {
		swal("OOPS!", "Please Enter the Job Title", "info");
 	    return false;
    }
	
	if(job_post_by == "")
    {
		swal("OOPS!", "Please enter the Job posting person name", "info");
 	    return false;
    }
	
	if(jobs_requirement == "")
    {
		swal("OOPS!", "Please enter jobs requirements", "info");
 	    return false;
    }
	
	if(job_company_id == "")
    {
		swal("OOPS!", "Please Select the Company Name", "info");
 	    return false;
    }
	
	if(job_contact_person == "")
    {
		swal("OOPS!", "Please Enter the Company Contact Person", "info");
 	    return false;
    }
	
	if(job_no_of_position == "")
    {
		swal("OOPS!", "Please Select the Number of Positions", "info");
 	    return false;
    }
	
	if(min_exp == "")
    {
		swal("OOPS!", "Please Select minimum experience", "info");
 	    return false;
    }
	
	if(tech_skills == "")
    {
		swal("OOPS!", "Please Enter the Technology Skills", "info");
 	    return false;
    }
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/addOrUpdateNewJob", {id: "" + id + "",job_title: "" + job_title + "",job_post_by: "" + job_post_by + "",jobs_requirement: "" + jobs_requirement + "",
		role_description: "" + role_description + "",job_company_id: "" + job_company_id + "",job_contact_person: "" + job_contact_person + "",
		job_no_of_position: "" + job_no_of_position + "",min_exp: "" + min_exp + "",tech_skills: "" + tech_skills + "",
	}, function(data)
	{		
			$.LoadingOverlay("hide");
			
			var result = $.trim(data);
			var obj = jQuery.parseJSON(result);
			if(obj.status_code == 200)
			{
				swal("Success!", obj.msg , "success");
				
				$("#cms_job_title").val("");
				$("#cms_job_post_by").val("");
				$('#cms_jobs_requirement').summernote('code', '');
				$('#cms_role_description').summernote('code', '');
				$("#cms_job_company").val("");
				$("#cms_job_contact_person").val("");
				$("#cms_job_no_of_position").val("");
				$("#cms_min_exp").val("");
				$("#cms_tech_skills").val("");
				
			} else {
				swal("OOPS!", "Please Enter Correct Details", "error");
			 	return false;
			}
		
	},'text');
}

function loadData()
{
	var jobMaster = '${jobMaster}';
	
	var jobTitle = ''
	
	var roleName = '${jobMaster.role_name}';
	var position = '${jobMaster.position}';
	var total_vacancy = '${jobMaster.total_vacancy}';
	var experience = '${jobMaster.experience}';
	var industry = '${jobMaster.industry}';
	var skills_required = '${jobMaster.skills_required}';
	var min_salary_range = '${jobMaster.min_salary_range}';
	var max_salary_range ='${jobMaster.max_salary_range}';
	var location = '${jobMaster.location}';
	var qualification = '${jobMaster.qualification}';
	var short_description = '${jobMaster.short_description}';
	var category = '${jobMaster.category}';
	var tags = '${jobMaster.tags}';
	var contact_person = '${jobMaster.contact_person}';
	var contact_mobile = '${jobMaster.contact_mobile}';
	var contact_email = '${jobMaster.contact_email}';
	var company_name = '${jobMaster.company_name}';
	var company_website = '${jobMaster.company_website}';
	var company_about = `${jobMaster.company_about}`;
	var company_address = '${jobMaster.company_address}';
	var emp_type = '${jobMaster.emp_type}';
	var domain = '${jobMaster.domain}';
	var job_mode = '${jobMaster.job_mode}';
	var meta_title = '${jobMaster.meta_title}';
	var meta_desc = '${jobMaster.meta_desc}';
	var meta_keywords = '${jobMaster.meta_keywords}';
	
	
	$("#role_name").val(roleName);
	$("#position").val(position);
	$("#total_vacancy").val(total_vacancy);
	$("#experience").val(experience);	
	$("#industry").val(industry);
	$("#skills_required").val(skills_required);
	$("#min_salary_range").val(min_salary_range);
	$("#max_salary_range").val(max_salary_range);
	$("#location").val(location);
	$("#qualification").val(qualification);
	$("#short_description").val(short_description);
	$('#skills_competencies').summernote('code', `${jobMaster.skills_competencies}`);
	$('#job_responsibilities').summernote('code', `${jobMaster.job_responsibilities}`);
	$("#category").val(category);
	$("#tags").val(tags);
	$("#contact_person").val(contact_person);
	$("#contact_mobile").val(contact_mobile);
	$("#contact_email").val(contact_email);
	$("#company_name").val(company_name);
	$("#company_website").val(company_website);
	$("#company_about").val(company_about);
	$("#company_address").val(company_address);
	$("#emp_type").val(emp_type);
	$("#domain").val(domain);
	$("#emp_mode").val(job_mode);
	$("#meta_title").val(meta_title);
	$("#meta_desc").val(meta_desc);
	$("#meta_keywords").val(meta_keywords);
	
}
</script>