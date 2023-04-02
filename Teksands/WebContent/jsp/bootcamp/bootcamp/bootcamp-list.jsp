<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Begin Page Content -->
<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <div class="row">
            	<div class="col-lg-6"><h6 class="m-0 font-weight-bold text-primary float-left">Bootcamp Master</h6></div>
            	<div class="col-lg-6"><a href="/bootcamp/add-update-bootcamp" class="btn btn-primary cms-btn cms-btn-xs float-right">Add Bootcamp</a></div>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Bootcamp Name</th>
                            <th>Mentor Name</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${bootcampList}" var="bootcampList">
	                        <tr>
	                            <td><c:out value="${bootcampList.id}" /></td>
	                            <td><c:out value="${bootcampList.name}" /></td>
	                            <td><c:out value="${bootcampList.mentor_name}" /></td>
	                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${bootcampList.start_date}" /></td>
	                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${bootcampList.end_date}" /></td>
	                            <td>
	                            	<c:if test = "${bootcampList.active == 'true'}">
	                            		<span class="badge badge-success">Active</span>
	                            	</c:if>
	                            	<c:if test = "${bootcampList.active == 'false'}">
	                            		<span class="badge badge-warning">Inactive</span>
	                            	</c:if> 
	                            </td>
	                            <%-- <td><a href="" class="btn btn-primary cms-btn-xs">View</a> <a href="" class="btn btn-primary cms-btn-xs">Edit</a></td> --%>
	                            <td class="text-center">    
                                    <div class="dropdown custom-dropdown">
                                        <a class="dropdown-toggle font-20 text-primary" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-cog"></i>
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink1" style="will-change: transform;">
                                            <a class="dropdown-item" href="/bootcamp/view-bootcamp?id=${bootcampList.id}">View</a>
                                            <a class="dropdown-item" href="/bootcamp/add-update-bootcamp?id=${bootcampList.id}&mentor_id=${bootcampList.mentor_id}">Edit</a>
                                            <a class="dropdown-item" href="/bootcamp/assign-bootcamp?id=${bootcampList.id}">Assign Candidate</a>
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