<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="container-fluid">
	<div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary"></h6>
            <div class="row">
            	<div class="col-lg-6"><h6 class="m-0 font-weight-bold text-primary float-left">Client Master</h6></div>
            	<div class="col-lg-6"><a href="/bootcamp/add-update-client-master" class="btn btn-primary cms-btn cms-btn-xs float-right">Add Client</a></div>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Company Type</th>
                            <th>SetUp Date</th>
                            <th>Total Placed</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${clientMasterList}" var="clientMasterList">
	                        <tr>
	                            <td><c:out value="${clientMasterList.id}" /></td>
	                            <td><c:out value="${clientMasterList.company_name}" /></td>
	                            <td><c:out value="${clientMasterList.company_type}" /></td>
	                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${clientMasterList.setup_date}" /></td>
	                            <td><c:out value="${clientMasterList.total_placed}" /></td>
	                           	<td>
		                           	<c:if test = "${clientMasterList.active == 'true'}">
		                           		<span class="badge badge-success">Active</span>
		                           	</c:if>
		                           	<c:if test = "${clientMasterList.active == 'false'}">
		                           		<span class="badge badge-warning">Inactive</span>
		                           	</c:if> 
	                           	</td>
	                           	<td class="text-center">    
                                    <div class="dropdown custom-dropdown">
                                        <a class="dropdown-toggle font-20 text-primary" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-cog"></i>
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink1" style="will-change: transform;">
                                            <a class="dropdown-item" href="/bootcamp/view-client-master?id=${clientMasterList.id}">View</a>
                                            <a class="dropdown-item" href="/bootcamp/add-update-client-master?id=${clientMasterList.id}">Edit</a>
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
