<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="col-12 col-xl-auto mb-3">
    <a class="btn btn-sm btn-light text-primary" href="/bootcamp/candidate-list">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
        Back to Candidate List
    </a>
</div>

<!-- Begin Page Content -->
<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <div class="row">
            	<div class="col-lg-6"><h6 class="m-0 font-weight-bold text-primary float-left">Candidate's</h6></div>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Mobile</th>
                            <th>City</th>
                            <th>Submitted Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${candidateList}" var="candidateList">
	                        <tr>
	                            <td><c:out value="${candidateList.id}" /></td>
	                            <td><c:out value="${candidateList.name}" /></td>
	                            <td><c:out value="${candidateList.email}" /></td>
	                            <td><c:out value="${candidateList.mobile}" /></td>
	                            <td><c:out value="${candidateList.permanent_city}" /></td>
	                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${candidateList.created_date}" /></td>
	                            <td>
	                            	<c:if test = "${candidateList.active == 'true'}">
	                            		<span class="badge badge-success">Active</span>
	                            	</c:if>
	                            	<c:if test = "${candidateList.active == 'false'}">
	                            		<span class="badge badge-warning">Inactive</span>
	                            	</c:if> 
	                            </td>
	                            <td><a href="/bootcamp/update-interview-feedback?id=${candidateList.id}" class="btn btn-primary cms-btn-xs">Add Feedbacks</a></td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->