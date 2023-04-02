<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="col-12 col-xl-auto mb-3">
    <a class="btn btn-sm btn-light text-primary" href="/bootcamp/dashboard">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
        Back to Dashboard
    </a>
</div>

<!-- Begin Page Content -->
<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <div class="row">
            	<div class="col-lg-6"><h6 class="m-0 font-weight-bold text-primary float-left">Job Master</h6></div>
            	<div class="col-lg-6">
            		<a href="/bootcamp/add-update-jobs" class="btn btn-primary cms-btn cms-btn-xs float-right">Post Job</a>
            	</div>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="jobsMasterList" width="100%" cellspacing="0">
                    <thead>
                        <tr>                        	
                            <th>Position</th>
                            <th>Date Posted</th>
                            <th>Company</th>
                            <th>CTC</th>
                            <th>Experience Range</th>
                            <th>Required Skills</th>
                            <th>Location</th>  
                            <th>Total Vacancy</th>    
                            <th>No. of Application</th>                     
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${jobMasterList}" var="jobMasterList">
	                        <tr>	                        	
	                            <td><c:out value="${jobMasterList.position}" /></td>
	                            <td><fmt:formatDate type = "both" value = "${jobMasterList.date_of_posted}" /></td>
	                            <td><c:out value="${jobMasterList.company_name}" /></td>
	                            <td>
		                            <c:choose>
					            		<c:when test="${jobMasterList.min_salary_range == '0' && jobMasterList.max_salary_range == '0'}">
					            			<span>Not Disclosed</span>
					            		</c:when>
					            		<c:when test="${not empty jobMasterList.min_salary_range && not empty jobMasterList.max_salary_range}">
					            			<c:out value="${jobMasterList.min_salary_range}" /> - <c:out value="${jobMasterList.max_salary_range}" /> <span>(lakhs)</span>
					            		</c:when>
					            		<c:otherwise>
					            			<span>Not Disclosed</span>
					            		</c:otherwise>
					            	</c:choose>
	                            </td>
	                            <td><c:out value="${jobMasterList.experience}" /></td>
	                            <td><c:out value="${jobMasterList.skills_required}" /></td>
	                            <td><c:out value="${jobMasterList.location}" /></td>
	                            <td><c:out value="${jobMasterList.total_vacancy}" /></td>
	                            <td><c:out value="${jobMasterList.no_of_applied}" /></td>
	                            <td class="text-center">    
                                    <div class="dropdown custom-dropdown">
                                        <a class="dropdown-toggle font-20 text-primary" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-cog"></i>
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink1" style="will-change: transform;">
                                            <a class="dropdown-item" href="/bootcamp/view-jobs?id=${jobMasterList.id}">View</a>
                                            <a class="dropdown-item" href="/bootcamp/add-update-jobs?id=${jobMasterList.id}">Edit</a>
                                            <a class="dropdown-item" href="/bootcamp/assign-jobs?id=${jobMasterList.id}">Assign Candidate</a>
                                        </div>
                                    </div>
                                </td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function () {
    $('#jobsMasterList').DataTable({
        ordering: false,
        "columnDefs": [
        	{ "width": "20%", "targets": 1 },
          ],
    });
});
</script>