<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="col-12 col-xl-auto mb-3">
	<c:choose>
		<c:when test="${not empty jobId}">
			<a class="btn btn-sm btn-light text-primary" href="/bootcamp/client/view-jobs?id=${jobId}">
		        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
		        Back to Job View
		    </a>
		</c:when>
		<c:otherwise>
			<a class="btn btn-sm btn-light text-primary" href="/bootcamp/client/candidate-list">
		        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
		        Back to Candidate List
		    </a>
		</c:otherwise>
	</c:choose>
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
										<span class="btn btn btn-success cms-btn-xs cms-btn float-left">Active</span>
									</c:when>
									<c:otherwise>
										<span class="btn btn btn btn-warning cms-btn-xs cms-btn float-left">Inactive</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="col-lg-8">
								<c:choose>
									<c:when test="${candidate.active}">
										<a href="javascript:void(0)" onclick="activateDeactivateCandidate(${candidate.id},2)" type="button" class="btn btn btn-danger cms-btn-xs cms-btn float-right">Deactivate</a>
									</c:when>
									<c:otherwise>
										<a href="javascript:void(0)" onclick="activateDeactivateCandidate(${candidate.id},1)" type="button" class="btn btn btn-success cms-btn-xs cms-btn float-right">Activate</a>
									</c:otherwise>
								</c:choose>
								<a href="/bootcamp/client/add-update-candidate?id=${candidate.id}&source=view_candidate" type="button" class="btn btn-primary cms-btn-xs cms-btn float-right mr-2">Edit Details</a>
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
								<c:if test="${not empty candidate.resume}">
									<li class="list-group-item d-flex justify-content-between p-3 text-left">
										<a href="${candidate.resume}" class="btn btn-primary btn-sm" target="_blank">View CV</a>
										<a href="${candidate.resume}" class="btn btn-primary btn-sm" target="_blank" download>Download CV</a>
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
				<div class="row">
					<div class="col-lg-12">
						<div class="card mb-4">
							<div class="card-header">
								<b>Mentors Feedback</b>
							</div>
							<div class="card-body">
								<c:forEach items="${candidateFeedbackList}" var="candidateFeedbackList">
									<p><c:out value="${candidateFeedbackList.mentor_name}"></c:out>: <c:out value="${candidateFeedbackList.feedback}"></c:out></p>
								</c:forEach>
							</div>
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
			
			<div class="col-lg-12">
				<div class="card shadow mb-4">
			        <div class="card-header py-3">
			            <div class="row">
			            	<div class="col-lg-6"><h6 class="m-0 font-weight-bold text-primary float-left">Call Schedule History</h6></div>
			            </div>
			        </div>
			        <div class="card-body">
			            <div class="table-responsive">
			                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			                    <thead>
			                        <tr>
			                            <th>Id</th>
			                            <th>Call Date</th>
			                            <th>Call Time</th>
			                            <th>Reason for Call</th>
			                            <th>Status</th>
			                            <th>Action</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${callScheduleList}" var="callScheduleList">
				                        <tr>
				                            <td><c:out value="${callScheduleList.id}" /></td>
				                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${callScheduleList.call_date}" /></td>
				                            <td><c:out value="${callScheduleList.call_time}" /></td>
				                            <td><c:out value="${callScheduleList.call_reason}" /></td>
				                            <td>
				                            	<c:if test = "${callScheduleList.active == 'true'}">
				                            		<span class="badge badge-success">Active</span>
				                            	</c:if>
				                            	<c:if test = "${callScheduleList.active == 'false'}">
				                            		<span class="badge badge-warning">Inactive</span>
				                            	</c:if> 
				                            </td>
				                            <td><a href="javascript:void(0)" onclick="activateDeactivateCall(${callScheduleList.id})" class="btn btn-primary cms-btn-xs">Cancel Call</a></td>
				                        </tr>
			                        </c:forEach>
			                    </tbody>
			                </table>
			            </div>
			        </div>
			    </div>
			</div>
			
			<div class="col-lg-12">
				<div class="card shadow mb-4">
			        <div class="card-header py-3">
			            <div class="row">
			            	<div class="col-lg-6"><h6 class="m-0 font-weight-bold text-primary float-left">Test History</h6></div>
			            </div>
			        </div>
			        <div class="card-body">
			            <div class="table-responsive">
			                <table class="table table-bordered" id="testTable" width="100%" cellspacing="0">
			                    <thead>
			                        <tr>
			                            <th>Id</th>
			                            <th>Test Name</th>
			                            <th>Test Topic</th>
			                            <th>Total Marks</th>
			                            <th>Mark Scored</th>
			                            <th>Date</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${testResultsList}" var="testResultsList">
				                        <tr>
				                            <td><c:out value="${testResultsList.id}" /></td>
				                            <td><c:out value="${testResultsList.test_name}" /></td>
				                            <td><c:out value="${testResultsList.test_topic}" /></td>
				                            <td><c:out value="${testResultsList.total_marks}" /></td>
				                            <td><c:out value="${testResultsList.marks_scores}" /></td>
				                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${testResultsList.created_date}" /></td>
				                        </tr>
			                        </c:forEach>
			                    </tbody>
			                </table>
			            </div>
			        </div>
			    </div>
			</div>
			<div class="col-lg-12">
				<div class="card shadow mb-4">
			        <div class="card-header py-3">
			            <div class="row">
			            	<div class="col-lg-6"><h6 class="m-0 font-weight-bold text-primary float-left">Active Interview</h6></div>
			            </div>
			        </div>
			        <div class="card-body">
			            <div class="table-responsive">
			                <table class="table table-bordered" id="interviewTable" width="100%" cellspacing="0">
			                    <thead>
			                        <tr>
			                            <th>Id</th>
			                            <th>Bootcamp Name</th>
			                            <th>Company Name</th>
			                            <th>Interviewer Name</th>
			                            <th>Interview Date</th>
			                            <th>Status</th>
			                            <th>Action</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${activeInterviewList}" var="activeInterviewList">
				                        <tr>
				                            <td><c:out value="${activeInterviewList.id}" /></td>
				                            <td><c:out value="${activeInterviewList.bootcamp_name}" /></td>
				                            <td><c:out value="${activeInterviewList.company_name}" /></td>
				                            <td><c:out value="${activeInterviewList.interviewer_name}" /></td>
				                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${activeInterviewList.interview_date}" /></td>
				                          	<td>
				                            	<c:if test = "${activeInterviewList.active == 'true'}">
				                            		<span class="badge badge-success">Active</span>
				                            	</c:if>
				                            	<c:if test = "${activeInterviewList.active == 'false'}">
				                            		<span class="badge badge-warning">Inactive</span>
				                            	</c:if> 
				                            </td>
				                            <td>
					                            <c:choose>
													<c:when test="${activeInterviewList.active}">
														<a href="javascript:void(0)" onclick="activateDeactivateInterview(${activeInterviewList.id})" class="btn btn-primary cms-btn-xs">Cancel</a>
													</c:when>
													<c:otherwise>
														<a href="javascript:void(0)" onclick="activateDeactivateInterview(${activeInterviewList.id})" class="btn btn-primary cms-btn-xs">Activate</a>
													</c:otherwise>
												</c:choose>
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
</section>

<script>
var status ="0";
function activateDeactivateCandidate(id,status)
{
    $.ajaxSetup({async:false});
	$.post("/bootcamp/client/activateDeactivateCandidate", {id: "" + id + "", }, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
  		if(obj.status_code == 200)
   		{
  			if(status == 1)
  			{
	  			$.toast({
				    heading: 'Success',
				    text: 'The Candidate activated Successfully',
				    icon: 'success',
				    position: 'top-right',
				    bgColor: '#d4edda',
				    textColor: '#155724',
				    afterShown: function () {
				    	setTimeout(function() {
				    		location.reload();
				    	}, 5000);
				    },
				}) 
   			}
	  		else
	  		{
	  			if(status == 2)
	  	  			$.toast({
	  				    heading: 'Success',
	  				    text: 'The Candidate Deactivated Successfully',
	  				    icon: 'success',
	  				    position: 'top-right',
	  				    bgColor: '#d4edda',
	  				    textColor: '#155724',
	  				    afterShown: function () {
	  				    	setTimeout(function() {
	  				    		location.reload();
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

function activateDeactivateCall(id)
{
    $.ajaxSetup({async:false});
	$.post("/bootcamp/client/activateDeactivateCalls", {id: "" + id + "", }, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
  		if(obj.status_code == 200)
   		{
  			swal("Success!", obj.msg , "success").then(function(isConfirm) {if (isConfirm) {location.reload();}});
   			
   		} else {
   			swal("OOPS!", "Something Error!", "error");
   		 	return false;
   		}

	},'text');
}

function activateDeactivateInterview(id)
{
    $.ajaxSetup({async:false});
	$.post("/bootcamp/activateDeactivateInterview", {id: "" + id + "", }, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
  		if(obj.status_code == 200)
   		{
  			swal("Success!", obj.msg , "success").then(function(isConfirm) {if (isConfirm) {location.reload();}});
   			
   		} else {
   			swal("OOPS!", "Something Error!", "error");
   		 	return false;
   		}

	},'text');
}
</script>