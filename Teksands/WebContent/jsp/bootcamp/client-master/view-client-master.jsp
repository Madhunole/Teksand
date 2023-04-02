<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="col-12 col-xl-auto mb-3">
    <a class="btn btn-sm btn-light text-primary" href="/bootcamp/client-master">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
        Back to Client Master
    </a>
</div>

<section>
	<div class="container py-2">
		<div class="row">
			<div class="col-lg-12">
				<div class="card mb-4">
					<div class="card-header">
						<div class="row">
							<div class="col-lg-4">
								<c:choose>
									<c:when test="${clientMaster.active}">
										<span class="btn btn btn-success cms-btn-xs cms-btn float-left">Active</span>
									</c:when>
									<c:otherwise>
										<span class="btn btn btn btn-warning cms-btn-xs cms-btn float-left">Inactive</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="col-lg-8">
								<c:choose>
									<c:when test="${clientMaster.active}">
										<a href="javascript:void(0)" onclick="activateDeactivateClientMaster(${clientMaster.id})" type="button" class="btn btn btn-danger cms-btn-xs cms-btn float-right">Deactivate</a>
									</c:when>
									<c:otherwise>
										<a href="javascript:void(0)" onclick="activateDeactivateClientMaster(${clientMaster.id})" type="button" class="btn btn btn-success cms-btn-xs cms-btn float-right">Activate</a>
									</c:otherwise>
								</c:choose>
								<a href="/bootcamp/add-update-client-master?id=${clientMaster.id}" type="button" class="btn btn-primary cms-btn-xs cms-btn float-right mr-2">Edit Details</a>
							</div>
						</div>
					</div>
					<div class="card-body text-left">
						<div class="row">
							<c:if test="${not empty clientMaster.company_name}">
								<div class="col-lg-8">
									<c:if test="${not empty clientMaster.company_name}">
										<div class="row p-2">
											<div class="col-sm-3">
												<p class="mb-2"><b>Company Name :</b></p>
											</div>
											<div class="col-sm-9">
												<p class="text-muted mb-2"><c:out value="${clientMaster.company_name}"></c:out></p>
											</div>
										</div>
									</c:if>
									<c:if test="${not empty clientMaster.client_description}">
										<div class="row p-2">
											<div class="col-sm-12">
												<p class="mb-2"><b>Client Description Summary :</b></p>
											</div>
											<div class="col-sm-12">
												<p class="text-muted mb-2 text-justify"><c:out value="${clientMaster.client_description}"></c:out></p>
											</div>
										</div>
									</c:if>
								</div>
								<div class="col-lg-4">
									<c:if test="${not empty clientMaster.company_type || not empty clientMaster.setup_date || not empty clientMaster.total_placed || not empty clientMaster.created_date}">
										<ul class="list-group list-group-flush rounded-3">
											<c:if test="${not empty clientMaster.company_type}">
												<li class="list-group-item d-flex justify-content-between p-3 text-left border-0">
													<p class="mb-0"><b>Company Type :</b> <c:out value="${clientMaster.company_type}"></c:out></p>
												</li>
											</c:if>
											<c:if test="${not empty clientMaster.setup_date}">
												<li class="list-group-item d-flex justify-content-between p-3 text-left border-0">
													<p class="mb-0"><b>Setup Date :</b> <fmt:formatDate pattern="dd-MM-yyyy" value="${clientMaster.setup_date}" /></p>
												</li>
											</c:if>
											<c:if test="${not empty clientMaster.total_placed}">
												<li class="list-group-item d-flex justify-content-between p-3 text-left border-0">
													<p class="mb-0"><b>Total Placed:</b> <c:out value="${clientMaster.total_placed}"></c:out></p>
												</li>
											</c:if>
											<c:if test="${not empty clientMaster.created_date}">
												<li class="list-group-item d-flex justify-content-between p-3 text-left border-0">
													<p class="mb-0"><b>Created Date:</b> <fmt:formatDate pattern="dd-MM-yyyy" value="${clientMaster.created_date}" /></p>
												</li>
											</c:if>
										</ul>
									</c:if>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<script>
function activateDeactivateClientMaster(id)
{
    $.ajaxSetup({async:false});
	$.post("/bootcamp/activateDeactivateClientMaster", {id: "" + id + "", }, function(data)
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