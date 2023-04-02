<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="col-12 col-xl-auto mb-3">
    <a class="btn btn-sm btn-light text-primary" href="/bootcamp/candidate-list">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
        Back to Candidate List
    </a>
</div>

<section>
	<div class="container py-2">
		<div class="row">
			<div class="col-lg-4">
				<div class="card mb-4">
					<div class="card-header">
						<div class="row">
							<div class="col-lg-4">
								<c:choose>
									<c:when test="${candidate.active}">
										<span class="btn btn-success cms-btn-xs cms-btn float-left">Active</span>
									</c:when>
									<c:otherwise>
										<span class="btn btn-warning cms-btn-xs cms-btn float-left">Inactive</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="col-lg-8">
								<button type="button" class="btn btn-primary cms-btn-xs cms-btn float-right" data-toggle="modal" data-target=".bd-example-modal-lg">Add Feedbacks</button>
							</div>
						</div>
					</div>
					<c:if test="${not empty candidate.gender || not empty candidate.name || not empty candidate.curr_company_desigination || not empty candidate.mobile
					 || not empty candidate.email  || not empty candidate.gender  || not empty candidate.date_of_birth}">
						<div class="card-body text-center p-0">
							<div class="pt-3">
								<c:if test = "${candidate.gender == 'Male'}">
									<img src="/resources/cms/img/male_profile.png" alt="avatar" class="rounded-circle img-fluid" style="width: 75px;height: 75px;">
								</c:if>
								<c:if test = "${candidate.gender == 'Female'}">
									<img src="/resources/cms/img/female_profile.png" alt="avatar" class="rounded-circle img-fluid" style="width: 75px;height: 75px;">
								</c:if>
							</div>
							<c:if test="${not empty candidate.name}">
								<h5 class="my-3"><c:out value="${candidate.name}"></c:out></h5>
							</c:if>
							<c:if test="${not empty candidate.curr_company_desigination}">
								<p class="text-muted mb-1"><c:out value="${candidate.curr_company_desigination}"></c:out></p>
							</c:if>
							<ul class="list-group list-group-flush rounded-3">
								<c:if test="${not empty candidate.mobile}">
									<li class="list-group-item d-flex justify-content-between p-3 text-left">
										<p class="mb-0"><b>Mobile :</b> <c:out value="${candidate.mobile}"></c:out></p>
									</li>
								</c:if>
								<c:if test="${not empty candidate.email}">
									<li class="list-group-item d-flex justify-content-between p-3 text-left">
										<p class="mb-0"><b>Email :</b> <c:out value="${candidate.email}"></c:out></p>
									</li>
								</c:if>
								<c:if test="${not empty candidate.gender}">
									<li class="list-group-item d-flex justify-content-between p-3 text-left">
										<p class="mb-0"><b>Gender :</b> <c:out value="${candidate.gender}"></c:out></p>
									</li>
								</c:if>
								<c:if test="${not empty candidate.date_of_birth}">
									<li class="list-group-item d-flex justify-content-between p-3 text-left">
										<p class="mb-0"><b>Date of Birth :</b> <fmt:formatDate pattern="dd-MM-yyyy" value="${candidate.date_of_birth}" /></p>
									</li>
								</c:if>
							</ul>
						</div>
					</c:if>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<b>Personal Information</b>
					</div>
					<c:if test="${not empty candidate.marital_status || not empty candidate.current_location || not empty candidate.preferred_location || not empty candidate.permanent_address
					 || not empty candidate.permanent_city  || not empty candidate.permanent_state  || not empty candidate.permanent_country || not empty candidate.permanent_pincode}">
						<div class="card-body text-center p-0">
							<ul class="list-group list-group-flush rounded-3">
								<c:if test="${not empty candidate.marital_status}">
									<li class="list-group-item d-flex justify-content-between p-3 text-left">
										<p class="mb-0"><b>Marriage Status :</b> <c:out value="${candidate.marital_status}"></c:out></p>
									</li>
								</c:if>
								<c:if test="${not empty candidate.current_location}">
									<li class="list-group-item d-flex justify-content-between p-3 text-left">
										<p class="mb-0"><b>Current Location :</b> <c:out value="${candidate.current_location}"></c:out></p>
									</li>
								</c:if>
								<c:if test="${not empty candidate.preferred_location}">
									<li class="list-group-item d-flex justify-content-between p-3 text-left">
										<p class="mb-0"><b>Preferred Location :</b> <c:out value="${candidate.preferred_location}"></c:out></p>
									</li>
								</c:if>
								<c:if test="${not empty candidate.permanent_address || not empty candidate.permanent_city || not empty candidate.permanent_state || not empty candidate.permanent_country || not empty candidate.permanent_pincode}">
									<li class="list-group-item d-flex justify-content-between p-3 text-left"><p class="mb-0">
										<b>Address :</b> <c:out value="${candidate.permanent_address}"></c:out>,<br>
										<c:out value="${candidate.permanent_city}"></c:out>, <c:out value="${candidate.permanent_state}"></c:out>, <c:out value="${candidate.permanent_country}"></c:out> - <c:out value="${candidate.permanent_pincode}"></c:out></p>
									</li>
								</c:if>
							</ul>
						</div>
					</c:if>
				</div>
			</div>
			<div class="col-lg-8">
				<div class="card mb-4">
					<div class="card-header">
						<b>Education Information</b>
					</div>
					<div class="card-body p-0">
						<c:if test="${not empty candidate.ug_college_name || not empty candidate.ug_degree || not empty candidate.ug_graduation_year || not empty candidate.ug_specialization}">
							<c:if test="${not empty candidate.ug_college_name}">
								<div class="row p-2">
									<div class="col-sm-3">
										<p class="mb-0"><b>UG College Name :</b></p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0"><c:out value="${candidate.ug_college_name}"></c:out></p>
									</div>
								</div>
							</c:if>
							<hr>
							<div class="row p-2">
								<c:if test="${not empty candidate.ug_degree}">
									<div class="col-lg-6">
										<div class="row">
											<div class="col-sm-6">
												<p class="mb-0"><b>UG Degree:</b></p>
											</div>
											<div class="col-sm-6">
												<p class="text-muted mb-0"><c:out value="${candidate.ug_degree}"></c:out></p>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${not empty candidate.ug_graduation_year}">
									<div class="col-lg-6">
										<div class="row">
											<div class="col-sm-6">
												<p class="mb-0"><b>UG Graduation Year:</b></p>
											</div>
											<div class="col-sm-6">
												<p class="text-muted mb-0"><c:out value="${candidate.ug_graduation_year}"></c:out></p>
											</div>
										</div>
									</div>
								</c:if>
							</div>
							<hr>
							<c:if test="${not empty candidate.ug_specialization}">
								<div class="row p-2">
									<div class="col-sm-3">
										<p class="mb-0"><b>UG Specialization: </b></p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0"><c:out value="${candidate.ug_specialization}"></c:out></p>
									</div>
								</div>
							</c:if>
						</c:if>
						<c:if test="${not empty candidate.pg_college_name || not empty candidate.pg_degree || not empty candidate.pg_graduation_year || not empty candidate.pg_specialization}">
							<hr>
							<c:if test="${not empty candidate.pg_college_name}">
								<div class="row p-2">
									<div class="col-sm-3">
										<p class="mb-0"><b>PG College Name :</b></p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0"><c:out value="${candidate.pg_college_name}"></c:out></p>
									</div>
								</div>
							</c:if>
							<hr>
							<div class="row p-2">
								<c:if test="${not empty candidate.pg_degree}">
									<div class="col-lg-6">
										<div class="row">
											<div class="col-sm-6">
												<p class="mb-0"><b>PG Degree:</b></p>
											</div>
											<div class="col-sm-6">
												<p class="text-muted mb-0"><c:out value="${candidate.pg_degree}"></c:out></p>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${not empty candidate.pg_graduation_year}">
									<div class="col-lg-6">
										<div class="row">
											<div class="col-sm-6">
												<p class="mb-0"><b>PG Graduation Year:</b></p>
											</div>
											<div class="col-sm-6">
												<p class="text-muted mb-0"><c:out value="${candidate.pg_graduation_year}"></c:out></p>
											</div>
										</div>
									</div>
								</c:if>
							</div>
							<hr>
							<c:if test="${not empty candidate.pg_specialization}">
								<div class="row p-2">
									<div class="col-sm-3">
										<p class="mb-0"><b>PG Specialization: </b></p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0"><c:out value="${candidate.pg_specialization}"></c:out></p>
									</div>
								</div>
							</c:if>
						</c:if>
						<c:if test="${not empty candidate.doctorate_university || not empty candidate.doctorate_degree || not empty candidate.doctorate_graduation_year || not empty candidate.doctorate_specialization}">
							<c:if test="${not empty candidate.doctorate_university}">
								<hr>
								<div class="row p-2">
									<div class="col-sm-3">
										<p class="mb-0"><b>Doctorate University Name :</b></p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0"><c:out value="${candidate.doctorate_university}"></c:out></p>
									</div>
								</div>
							</c:if>
							<hr>
							<div class="row p-2">
								<c:if test="${not empty candidate.doctorate_degree}">
									<div class="col-lg-6">
										<div class="row">
											<div class="col-sm-6">
												<p class="mb-0"><b>Doctorate Degree:</b></p>
											</div>
											<div class="col-sm-6">
												<p class="text-muted mb-0"><c:out value="${candidate.doctorate_degree}"></c:out></p>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${not empty candidate.doctorate_graduation_year}">
									<div class="col-lg-6">
										<div class="row">
											<div class="col-sm-6">
												<p class="mb-0"><b>Doctorate Graduation Year:</b></p>
											</div>
											<div class="col-sm-6">
												<p class="text-muted mb-0"><c:out value="${candidate.doctorate_graduation_year}"></c:out></p>
											</div>
										</div>
									</div>
								</c:if>
							</div>
							<hr>
							<c:if test="${not empty candidate.doctorate_specialization}">
								<div class="row p-2">
									<div class="col-sm-3">
										<p class="mb-0"><b>Doctorate Specialization: </b></p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0"><c:out value="${candidate.doctorate_specialization}"></c:out></p>
									</div>
								</div>
							</c:if>
						</c:if>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<b>Job Information</b>
					</div>
					<div class="card-body p-0">
						<c:if test="${not empty candidate.curr_company_name || not empty candidate.curr_company_desigination || not empty candidate.total_experience 
							|| not empty candidate.functional_area || not empty candidate.role || not empty candidate.industry || not empty candidate.key_skills
							|| not empty candidate.annual_salary || not empty candidate.notice_period || not empty candidate.resume_headling || not empty candidate.summary
							|| not empty candidate.work_permit_status}">
							<c:if test="${not empty candidate.curr_company_name}">
								<div class="row p-2">
									<div class="col-sm-4">
										<p class="mb-0"><b>Current Company Name :</b></p>
									</div>
									<div class="col-sm-8">
										<p class="text-muted mb-0"><c:out value="${candidate.curr_company_name}"></c:out></p>
									</div>
								</div>
							</c:if>
							<hr>
							<div class="row p-2">
								<c:if test="${not empty candidate.curr_company_desigination}">
									<div class="col-lg-6">
										<div class="row">
											<div class="col-sm-6">
												<p class="mb-0"><b>Designation:</b></p>
											</div>
											<div class="col-sm-6">
												<p class="text-muted mb-0"><c:out value="${candidate.curr_company_desigination}"></c:out></p>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${not empty candidate.total_experience}">
									<div class="col-lg-6">
										<div class="row">
											<div class="col-sm-6">
												<p class="mb-0"><b>Total Experience:</b></p>
											</div>
											<div class="col-sm-6">
												<p class="text-muted mb-0"><c:out value="${candidate.total_experience}"></c:out></p>
											</div>
										</div>
									</div>
								</c:if>
							</div>
							<hr>
							<div class="row p-2">
								<c:if test="${not empty candidate.functional_area}">
									<div class="col-lg-6">
										<div class="row">
											<div class="col-sm-6">
												<p class="mb-0"><b>Functional Area:</b></p>
											</div>
											<div class="col-sm-6">
												<p class="text-muted mb-0"><c:out value="${candidate.functional_area}"></c:out></p>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${not empty candidate.role}">
									<div class="col-lg-6">
										<div class="row">
											<div class="col-sm-6">
												<p class="mb-0"><b>Role:</b></p>
											</div>
											<div class="col-sm-6">
												<p class="text-muted mb-0"><c:out value="${candidate.role}"></c:out></p>
											</div>
										</div>
									</div>
								</c:if>
							</div>
							<hr>
							<div class="row p-2">
								<c:if test="${not empty candidate.industry}">
									<div class="col-lg-6">
										<div class="row">
											<div class="col-sm-6">
												<p class="mb-0"><b>Industry:</b></p>
											</div>
											<div class="col-sm-6">
												<p class="text-muted mb-0"><c:out value="${candidate.industry}"></c:out></p>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${not empty candidate.key_skills}">
									<div class="col-lg-6">
										<div class="row">
											<div class="col-sm-6">
												<p class="mb-0"><b>Key Skills:</b></p>
											</div>
											<div class="col-sm-6">
												<p class="text-muted mb-0"><c:out value="${candidate.key_skills}"></c:out></p>
											</div>
										</div>
									</div>
								</c:if>
							</div>
							<hr>
							<div class="row p-2">
								<c:if test="${not empty candidate.annual_salary}">
									<div class="col-lg-6">
										<div class="row">
											<div class="col-sm-6">
												<p class="mb-0"><b>Annuanl Salary:</b></p>
											</div>
											<div class="col-sm-6">
												<p class="text-muted mb-0"><c:out value="${candidate.annual_salary}"></c:out></p>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${not empty candidate.notice_period}">
									<div class="col-lg-6">
										<div class="row">
											<div class="col-sm-6">
												<p class="mb-0"><b>Notice Period:</b></p>
											</div>
											<div class="col-sm-6">
												<p class="text-muted mb-0"><c:out value="${candidate.notice_period}"></c:out> Days</p>
											</div>
										</div>
									</div>
								</c:if>
							</div>
							<hr>
							<c:if test="${not empty candidate.resume_headling}">
								<div class="row p-2">
									<div class="col-sm-3">
										<p class="mb-0"><b>Resume Heading :</b></p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0"><c:out value="${candidate.resume_headling}"></c:out></p>
									</div>
								</div>
							</c:if>
							<hr>
							<c:if test="${not empty candidate.summary}">
								<div class="row p-2">
									<div class="col-sm-3">
										<p class="mb-0"><b>Summary :</b></p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted text-justify mb-0"><c:out value="${candidate.summary}"></c:out></p>
									</div>
								</div>
							</c:if>
							<hr>
							<c:if test="${not empty candidate.work_permit_status}">
								<div class="row p-2">
									<div class="col-sm-3">
										<p class="mb-0"><b>Work Permit Status :</b></p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted text-justify mb-0"><c:out value="${candidate.work_permit_status}"></c:out></p>
									</div>
								</div>
							</c:if>
						</c:if>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="row">
					<div class="col-lg-9">
						<div class="card mb-4">
							<div class="card-header">
								<b>TS Screening Comment</b>
							</div>
							<c:if test="${not empty candidate.ts_screening_comment_1 || not empty candidate.ts_screening_comment_2 || not empty candidate.ts_screening_comment_3}">
								<div class="card-body">
									<ul class="nav nav-pills nav-justified" role="tablist">
										<c:if test="${not empty candidate.ts_screening_comment_1}"><li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">TS Screening Comment 1</a></li></c:if>
										<c:if test="${not empty candidate.ts_screening_comment_2}"><li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">TS Screening Comment 2</a></li></c:if>
										<c:if test="${not empty candidate.ts_screening_comment_3}"><li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">TS Screening Comment 3</a></li></c:if>
									</ul>
									<div class="tab-content">
										<c:if test="${not empty candidate.ts_screening_comment_1}">
											<div class="tab-pane mt-3 active" id="tabs-1" role="tabpanel">
												<p><c:out value="${candidate.ts_screening_comment_1}"></c:out></p>
											</div>
										</c:if>
										<c:if test="${not empty candidate.ts_screening_comment_2}">
											<div class="tab-pane mt-3" id="tabs-2" role="tabpanel">
												<p><c:out value="${candidate.ts_screening_comment_2}"></c:out></p>
											</div>
										</c:if>
										<c:if test="${not empty candidate.ts_screening_comment_3}">
											<div class="tab-pane mt-3" id="tabs-3" role="tabpanel">
												<p><c:out value="${candidate.ts_screening_comment_3}"></c:out></p>
											</div>
										</c:if>
									</div>
								</div>
							</c:if>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="card mb-4">
							<div class="card-header">
								<b>TS Screening Grade</b>
							</div>
							<c:if test="${not empty candidate.ts_screening_grade}">
								<div class="card-body">
									<p><c:out value="${candidate.ts_screening_grade}"></c:out></p>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="card mb-4">
					<div class="card-header">
						<b>Placement Details</b>
					</div>
					<c:if test = "${candidate.placed == 'true'}">
						<div class="card-body">
							<div class="row">
								<c:if test="${not empty candidate.placed_company}">
									<div class="col-lg-9">
										<div class="row">
											<div class="col-sm-4">
												<p class="mb-0"><b>Placed Company Name :</b></p>
											</div>
											<div class="col-sm-8">
												<p class="text-muted mb-0"><c:out value="${candidate.placed_company}"></c:out></p>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${not empty candidate.placed_date}">
									<div class="col-lg-3">
										<div class="row">
											<div class="col-sm-6">
												<p class="mb-0"><b>Placed Date:</b></p>
											</div>
											<div class="col-sm-6">
												<p class="text-muted mb-0"><fmt:formatDate pattern="dd-MM-yyyy" value="${candidate.placed_date}" /></p>
											</div>
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</section>

<div class="modal fade bd-example-modal-lg" tabindex="-1" id="myLargeModalLabel" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Interview Feedbacks</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		    </div>
		    <div class="modal-body">
			   <div class="row">
				   	<div class="col-lg-12">
	            		<ul class="nav nav-pills nav-justified" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">TS Screening Comment 1</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">TS Screening Comment 2</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">TS Screening Comment 3</a>
							</li>
						</ul><!-- Tab panes -->
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="row mt-3">
									<div class="col-lg-12">
					            		<div class="form-group">
											<textarea class="form-control" id="can_ts_screening_1" rows="4"></textarea>
										</div>
					            	</div>
								</div>
							</div>
							<div class="tab-pane" id="tabs-2" role="tabpanel">
								<div class="row mt-3">
									<div class="col-lg-12">
					            		<div class="form-group">
											<textarea class="form-control" id="can_ts_screening_2" rows="4"></textarea>
										</div>
					            	</div>
				            	</div>
							</div>
							<div class="tab-pane" id="tabs-3" role="tabpanel">
								<div class="row mt-3">
									<div class="col-lg-12">
					            		<div class="form-group">
											<textarea class="form-control" id="can_ts_screening_3" rows="4"></textarea>
										</div>
					            	</div>
				            	</div>
							</div>
						</div>
	            	</div>
	            	<div class="col-lg-6">
	            		<div class="form-group">
	            			<label>TS Screening Grade</label>
					    	<input type="number" class="form-control form-control-sm" maxlength="5" id="can_ts_screening_grade" placeholder="">
					  	</div>
	            	</div>
	            	<div class="col-lg-6">
	            		<label>Placed</label>
	            		<select id="can_placed" class="form-control form-control-sm">
							<option value="1">Yes</option>
							<option value="0">No</option>
						</select>
	            	</div>
	            	<div class="col-lg-8">
	            		<div class="form-group">
	            			<label>Placed Company Name</label>
		            		<select class="form-control form-control-sm" id="cms_company_name" name="cms_company_name">
								<c:forEach items="${clientMasterList}" var="clientMasterList">
									<option value="${clientMasterList.id}"><c:out value="${clientMasterList.name}" /></option>
								</c:forEach>
							</select>
					  	</div>
	            	</div>
	            	<div class="col-lg-4">
	            		<div class="form-group">
	            			<label>Placed Date</label>
					    	<input type="text" class="form-control form-control-sm" id="datepicker_2" placeholder="">
					  	</div>
	            	</div>
			   </div>
		    </div>
		    <div class="modal-footer">
		        <button type="button" class="btn btn-secondary cms-btn-xs cms-btn" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary cms-btn-xs cms-btn" onclick="updateCandidateFeedback()">Update Feedback</button>
		      </div>
		</div>
	</div>
</div>

<script>
<c:choose>
	<c:when test="${empty candidate}">
		var id = "";																   
	</c:when>
	<c:otherwise>
		var id = ${candidate.id};
	</c:otherwise>
</c:choose>

$( document ).ready(function() {
	loadData();
});

function updateCandidateFeedback()
{
	var ts_screening_1 = $("#can_ts_screening_1").val();
	var ts_screening_2 = $("#can_ts_screening_2").val();
	var ts_screening_3 = $("#can_ts_screening_3").val();
	var placed_company = $("#can_placed_company").val();
	var ts_screening_grade = $("#can_ts_screening_grade").val();
	var placed = $('#can_placed').find(":selected").text();
	var placed_date = $("#datepicker_2").val();
	
	if(ts_screening_1 == ""){
    	swal("OOPS!", "Please Enter Teksands Screening Comment 1", "error").then(() => {
    		$('html').animate({ scrollTop: $("#can_ts_screening_1").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(ts_screening_grade == ""){
    	swal("OOPS!", "Please Enter Teksands Screening Grade", "error").then(() => {
    		$('html').animate({ scrollTop: $("#can_ts_screening_grade").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(placed == 1)
	{
		if(placed_company == ""){
	    	swal("OOPS!", "Please Enter Candidate Placed Company Name", "error").then(() => {
	    		$('html').animate({ scrollTop: $("#can_placed_company").offset().top-100 }, "slow");
			})
	    	return false;
	    }
		
		if(placed_date == ""){
	    	swal("OOPS!", "Please Select Candidate Placed Date", "error").then(() => {
	    		$('html').animate({ scrollTop: $("#datepicker_2").offset().top-100 }, "slow");
			})
	    	return false;
	    }
	}
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/updateCandidateFeedback", {id: "" + id + "",ts_screening_1: "" + ts_screening_1 + "",ts_screening_2: "" + ts_screening_2 + "",ts_screening_3: "" + ts_screening_3 + "",
											placed_company: "" + placed_company + "",ts_screening_grade: "" + ts_screening_grade + "",placed: "" + placed + "",placed_date: "" + placed_date + "",
	}, function(data)
	{		
			$.LoadingOverlay("hide");
			
			var result = $.trim(data);
			var obj = jQuery.parseJSON(result);
			if(obj.status_code == 200)
			{
				swal("Success!", obj.msg , "success");
				
				$("#can_ts_screening_1").val("");
				$("#can_ts_screening_2").val("");
				$("#can_ts_screening_3").val("");
				$("#can_placed_company").val("");
				$("#can_ts_screening_grade").val("");
				$('#can_placed').find(":selected").text("");
				$("#datepicker_2").val("");
				
				$('#myLargeModalLabel').modal('toggle');
				
	      	return false;
			} else {
				swal("OOPS!", "Please Enter Correct Details", "error");
			 	return false;
			}
		
	},'text');
	return false;
}

function loadData()
{
	var candidate = '${candidate}';
	
	var ts_screening_1 = '${candidate.ts_screening_comment_1}';
	var ts_screening_2 = '${candidate.ts_screening_comment_2}';
	var ts_screening_3 = '${candidate.ts_screening_comment_3}';
	var placed_company = '${candidate.placed_company}';
	var ts_screening_grade = '${candidate.ts_screening_grade}';
	var placed = '${candidate.placed}';
	var placed_date = '${candidate.placed_date}';
	
	$("#can_ts_screening_1").val(ts_screening_1);
	$("#can_ts_screening_2").val(ts_screening_2);
	$("#can_ts_screening_3").val(ts_screening_3);
	$("#can_placed_company").val(placed_company);
	$("#can_ts_screening_grade").val(ts_screening_grade);
	if(placed == true){
		$('#can_placed').val(1);
	}else{
		$('#can_placed').val(0);
	}
	
	$(function() {
	$("#datepicker_2").datepicker({
	        dateFormat: "yy-mm-dd"
	    }).datepicker("setDate", placed_date);
	})
}
</script>