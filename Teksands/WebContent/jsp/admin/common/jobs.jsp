<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<style>

/* Small devices (portrait tablets and large phones, 600px and up) */
@media only screen and (min-width: 600px) {
	.modal {
		left:0px !important;
	}
}

/* Medium devices (landscape tablets, 768px and up) */
@media only screen and (min-width: 768px) {
	.modal {
		left:315px !important;
	}
}

.text-danger {
    color: #dc3545!important;
}

.text-success {
    color: #28a745!important;
}
</style>

<script>
function showDetails(id)
{
    $.ajaxSetup({async:false});
	$.post("/admin/getJobsById", {id: "" + id + ""}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
  		$("#admin_jobs").modal('show');

  		$("#span_id").html(obj.id);
	  	$("#span_date").html(obj.date);
	  	$("#span_role_name").html(obj.role_name);
	  	$("#span_total_vacancy").html(obj.total_vacancy);
	  	$("#span_experience").html(obj.experience);
	  	$("#span_min_salary_range").html(obj.min_salary_range);
	  	$("#span_max_salary_range").html(obj.max_salary_range);
	  	$("#span_skills_required").html(obj.skills_required);
	  	$("#span_location").html(obj.location);
	  	$("#span_qualification").html(obj.qualification);
	  	$("#span_skills_competencies").html(obj.skills_competencies);
	  	$("#span_job_responsibilities").html(obj.job_responsibilities);
	  	$("#span_industry").html(obj.industry);
	  	$("#span_company_name").html(obj.company_name);
	  	$("#span_company_website").html(obj.company_website);
	  	$("#span_company_address").html(obj.company_address);
	  	$("#span_contact_person").html(obj.contact_person);
	  	$("#span_contact_email").html(obj.contact_email);
	  	$("#span_contact_mobile").html(obj.contact_mobile);
	  	$("#span_emp_type").html(obj.emp_type);
	  	$("#span_domain").html(obj.domain);
		
	},'text');
    
}
function savePublish(value)
{
	var id = $("#span_id").html();
	
	$.ajaxSetup({async:false});
	$.post("/admin/saveJobsPublish", {id: "" + id + "", value: "" + value + ""}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
  		if(value == "1") {
  			swal("Thank you", "Jobs Published Successfully", "success");
  		 	return false;
  	    }
  		
  		if(value == "0") {
  			swal("Thank you", "Jobs Unpublished Successfully", "success");
  		 	return false;
  	    }
		
	},'text');
}

function ediJobsDetails(id)
{
	document.location = "/admin/jobs-post?id="+id;
}

</script>

<div id="main">
	<div class="visible-md visible-xs visible-sm mobile-menu">
	    <button type="button" data-toggle="offcanvas"><i class="fa fa-bars"></i></button>
	</div>
	<section class="section bgw">
	    <div class="container-fluid">
	        <div class="section-title-2 text-center course-title">
	            <h2>Teksands Jobs List</h2>
	            <hr>
	        </div><!-- end section-title -->
	        <p class="text-right"><a href="/admin/jobs-post" class="btn btn-primary btn-square btn-sm">Add New</a></p>
			<div class="table-responsive">
				<table id="jobs_applications" class="table table-striped table-bordered dt-responsive" style="width:100%;font-size:12px;">
					<thead class="thead-dark">
				    	<tr>
				        	<th>Id</th>
				            <th>Role Name</th>
				            <th>Total Vacancy</th>
				            <th>Experience</th>
				            <th>Salary Range</th>
				            <th>Company Name</th>
				            <th>Status</th>
				            <th>Date</th>
				            <th>Action</th>
						</tr>
					</thead>
				    <tbody>
						<c:forEach items="${jobsList}" var="jobs">
					    	<tr>
					        	<td><c:out value="${jobs.id}" /></td>
					            <td><c:out value="${jobs.role_name}" /></td>
					            <td><c:out value="${jobs.total_vacancy}" /></td>
					            <td><c:out value="${jobs.experience}" /></td>
					            <td>
					            	<c:choose>
					            		<c:when test="${jobs.min_salary_range == '0' && jobs.max_salary_range == '0'}">
					            			<span>Not Disclosed</span>
					            		</c:when>
					            		<c:when test="${not empty jobs.min_salary_range && not empty jobs.max_salary_range}">
					            			<c:out value="${jobs.min_salary_range}" /> - <c:out value="${jobs.max_salary_range}" /> <span>(lakhs)</span>
					            		</c:when>
					            		<c:otherwise>
					            			<span>Not Disclosed</span>
					            		</c:otherwise>
					            	</c:choose>
					            </td>
					            <td><c:out value="${jobs.company_name}" /></td>
					            <td>
					            
					            <c:if test="${jobs.active == 1}">
					            	<span class="text-success">Active</span>
					            </c:if>
					            
					            <c:if test="${jobs.active == 0}">
					            	<span class="text-danger">Inactive</span>
					            </c:if>
					            
					            </td>
					            <td><fmt:formatDate value="${jobs.date}" pattern="dd-MMM-yyyy"/></td>
					            <td style="vertical-align: middle !important;"><button type="button" class="btn btn-primary btn-xs" onclick="showDetails(${jobs.id})">View</button> <button type="button" class="btn btn-primary btn-xs" onclick="ediJobsDetails(${jobs.id})">Edit</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<small><b>Note: Active = 1 & Inactive = 0</b></small>
	    </div><!-- end container -->
	</section><!-- end section -->
</div>

<div id="admin_jobs" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="popup-modal" data-dismiss="modal">&times;</button>
		<h4 class="text-center"><b>Admin - Jobs List</b></h4>
      </div>
      <div class="modal-body">
		  <div class="container-fluid">
		    <div class="row">
		      <div class="col-md-12">
                <div class="tab-first menu-center">
	                <a href="#" class="btn btn-primary btn-square btn-sm" onclick="savePublish(1)">Publish</a>
	                <a href="#" class="btn btn-primary btn-square btn-sm" onclick="savePublish(0)">UnPublish</a>
                    <ul class="nav nav-tabs" role="tablist" style="border: 0px solid #ddd;">
                        <li role="presentation" class="active"><a href="#general_jobs" aria-controls="general-jobs" role="tab" data-toggle="tab">General</a></li>
                        <li role="presentation"><a href="#details_jobs" aria-controls="details-jobs" role="tab" data-toggle="tab">Jobs Details</a></li>
                        <li role="presentation"><a href="#details_company" aria-controls="details-company" role="tab" data-toggle="tab">Company Details</a></li>
                        <li role="presentation"><a href="#skills_competencies" aria-controls="skills-competencies" role="tab" data-toggle="tab">Skills Competencies</a></li>
                        <li role="presentation"><a href="#job_responsibilities" aria-controls="job-responsibilities" role="tab" data-toggle="tab">Job Responsibilities</a></li>
                    </ul>
                    <div class="tab-content tabs-video" style="height: 330px;">
                        <div role="tabpanel" class="tab-pane active" id="general_jobs">
                            <div class="tab-padding clearfix">
                                <table class="table table-bordered">
								  <thead>
								    <tr>
								    </tr>
								  </thead>
									  <tbody>
											<tr>
												<td><b>Id</b></td>
											    <td><span id="span_id"></span></td>
										    </tr>
										    <tr>
												<td><b>Role Name</b></td>
											    <td><b><span id="span_role_name"></span></b></td>
										    </tr>
										    <tr>
												<td><b>Date</b></td>
											    <td><span id="span_date"></span></td>
										    </tr>
										    <tr>
												<td><b>Total Vacancy</b></td>
											    <td><span id="span_total_vacancy"></span></td>
										    </tr>
										    <tr>
												<td><b>Experience</b></td>
											    <td><span id="span_experience"></span></td>
										    </tr>
										    <tr>
												<td><b>Salary Range</b></td>
											    <td><span id="span_min_salary_range"></span> - <span id="span_max_salary_range"></span> <span>(lakhs)</span></td>
										    </tr>
									  </tbody>
								</table>
						    </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="details_jobs">
                            <div class="tab-padding clearfix">
                                <table class="table table-bordered">
								  <thead>
								    <tr>
								    </tr>
								  </thead>
									  <tbody>
											<tr>
												<td><b>Skills Required</b></td>
											    <td><span id="span_skills_required"></span></td>
										    </tr>
										    <tr>
												<td><b>Location</b></td>
											    <td><b><span id="span_location"></span></b></td>
										    </tr>
										    <tr>
												<td><b>Qualification</b></td>
											    <td><span id="span_qualification"></span></td>
										    </tr>
										    <tr>
												<td><b>Industry</b></td>
											    <td><span id="span_industry"></span></td>
										    </tr>
										    <tr>
												<td><b>Emp Type</b></td>
											    <td><span id="span_emp_type"></span></td>
										    </tr>
										    <tr>
												<td><b>Domain</b></td>
											    <td><span id="span_domain"></span></td>
										    </tr>
									  </tbody>
								</table>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="details_company">
                            <div class="tab-padding clearfix">
                                <table class="table table-bordered">
								  <thead>
								    <tr>
								    </tr>
								  </thead>
									  <tbody>
											<tr>
												<td><b>Company Name</b></td>
											    <td><span id="span_company_name"></span></td>
										    </tr>
										    <tr>
												<td><b>Company Website</b></td>
											    <td><b><span id="span_company_website"></span></b></td>
										    </tr>
										    <tr>
												<td><b>Company Address</b></td>
											    <td><span id="span_company_address"></span></td>
										    </tr>
										    <tr>
												<td><b>Contact Person</b></td>
											    <td><span id="span_contact_person"></span></td>
										    </tr>
										    <tr>
												<td><b>Contact Mail Id</b></td>
											    <td><span id="span_contact_email"></span></td>
										    </tr>
										    <tr>
												<td><b>Contact Mobile</b></td>
											    <td><span id="span_contact_mobile"></span></td>
										    </tr>
									  </tbody>
								</table>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="skills_competencies">
                            <div class="tab-padding clearfix">
                                <p><span id="span_skills_competencies"></span></p>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="job_responsibilities">
                            <div class="tab-padding clearfix">
                                <p><span id="span_job_responsibilities"></span></p>
                            </div>
                        </div>
                    </div>
			  </div><!-- end col -->
		      </div>
		    </div>
		  </div>
		</div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>