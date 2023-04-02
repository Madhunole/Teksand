<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="col-12 col-xl-auto mb-3">
    <a class="btn btn-sm btn-light text-primary" href="/bootcamp/mentor-master">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
        Back to Mentor List
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
									<c:when test="${mentorMaster.active}">
										<span class="btn btn btn-success cms-btn-xs cms-btn float-left">Active</span>
									</c:when>
									<c:otherwise>
										<span class="btn btn btn btn-warning cms-btn-xs cms-btn float-left">Inactive</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="col-lg-8">
								<c:choose>
									<c:when test="${mentorMaster.active}">
										<a href="javascript:void(0)" onclick="activateDeactivateMentor(${mentorMaster.id})" type="button" class="btn btn btn-danger cms-btn-xs cms-btn float-right">Deactivate</a>
									</c:when>
									<c:otherwise>
										<a href="javascript:void(0)" onclick="activateDeactivateMentor(${mentorMaster.id})" type="button" class="btn btn btn-success cms-btn-xs cms-btn float-right">Activate</a>
									</c:otherwise>
								</c:choose>
								<a href="/bootcamp/add-update-mentor-master?id=${mentorMaster.id}" type="button" class="btn btn-primary cms-btn-xs cms-btn float-right mr-2">Edit Details</a>
							</div>
						</div>
					</div>
					<c:if test="${not empty mentorMaster.first_name || not empty mentorMaster.last_name || not empty mentorMaster.mobile || not empty mentorMaster.email
					 || not empty mentorMaster.skills  || not empty mentorMaster.grade || not empty mentorMaster.experience}">
						<div class="card-body text-center p-0">
							<div class="pt-3">
								<img src="/resources/cms/img/male_profile.png" alt="avatar" class="rounded-circle img-fluid" style="width: 75px;height: 75px;">
							</div>
							<c:if test="${not empty mentorMaster.first_name || not empty mentorMaster.last_name}">
								<h5 class="my-3"><c:out value="${mentorMaster.first_name}"></c:out> <c:out value="${mentorMaster.last_name}"></c:out></h5>
							</c:if>
							<c:if test="${not empty mentorMaster.linkedin_profile}">
								<p class="text-muted mb-1"><a href="${mentorMaster.linkedin_profile}"><i class="fab fa-linkedin"></i></a></p>
							</c:if>
							<ul class="list-group list-group-flush rounded-3">
								<c:if test="${not empty mentorMaster.mobile}">
									<li class="list-group-item d-flex justify-content-between p-3 text-left">
										<p class="mb-0"><b>Mobile :</b> <c:out value="${mentorMaster.mobile}"></c:out></p>
									</li>
								</c:if>
								<c:if test="${not empty mentorMaster.email}">
									<li class="list-group-item d-flex justify-content-between p-3 text-left">
										<p class="mb-0"><b>Email :</b> <c:out value="${mentorMaster.email}"></c:out></p>
									</li>
								</c:if>
								<c:if test="${not empty mentorMaster.skills}">
									<li class="list-group-item d-flex justify-content-between p-3 text-left">
										<p class="mb-0"><b>Skills :</b> <c:out value="${mentorMaster.skills}"></c:out></p>
									</li>
								</c:if>
								<c:if test="${not empty mentorMaster.grade}">
									<li class="list-group-item d-flex justify-content-between p-3 text-left">
										<p class="mb-0"><b>Grade :</b> <c:out value="${mentorMaster.grade}"></c:out></p>
									</li>
								</c:if>
								<c:if test="${not empty mentorMaster.experience}">
									<li class="list-group-item d-flex justify-content-between p-3 text-left">
										<p class="mb-0"><b>Experience :</b> <c:out value="${mentorMaster.experience}"></c:out></p>
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
						<b>Feedbacks</b>
					</div>
					<div class="card-body p-0">
						<c:if test="${not empty mentorMaster.feedbacks}">
							<c:if test="${not empty mentorMaster.feedbacks}">
								<div class="row p-2">
									<div class="col-sm-12">
										<p class="text-muted mb-0"><c:out value="${mentorMaster.feedbacks}"></c:out></p>
									</div>
								</div>
							</c:if>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
function activateDeactivateMentor(id)
{
    $.ajaxSetup({async:false});
	$.post("/bootcamp/activateDeactivateMentorMaster", {id: "" + id + "", }, function(data)
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