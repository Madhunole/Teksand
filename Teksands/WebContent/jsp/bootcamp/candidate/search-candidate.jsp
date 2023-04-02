<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="col-12 col-xl-auto mb-3">
    <a class="btn btn-sm btn-light text-primary" href="/bootcamp/candidate-list">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
        Back to Candidate List
    </a>
</div>

<div class="container-fluid">
	<div class="row">
		<c:forEach items="${candidatesearchList}" var="candidate">
			<div class="col-lg-4">
				<div class="card shadow mb-4">
				    <div class="card-header py-3">
				        <h6 class="m-0 font-weight-bold text-primary"><c:out value="${candidate.name}" /></h6>
				    </div>
				    <div class="card-body p-0">
						<ul class="list-group list-group-flush rounded-3">
							<c:if test="${not empty candidate.mobile}">
								<li class="list-group-item d-flex justify-content-between p-3 text-left">
									<p class="mb-0"><b>Designation :</b> <c:out value="${candidate.curr_company_desigination}"></c:out></p>
								</li>
							</c:if>
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
						</ul>
					</div>
				    <div class="card-footer">
				    	<a href="/bootcamp/view-candidate?id=${candidate.id}" class="btn btn-primary cms-btn-xs float-right">View Details</a>
				    </div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>