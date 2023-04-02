<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="container-fluid">
	<div class="card shadow mb-4">
        <div class="card-header py-3">
            <div class="row">
            	<div class="col-lg-6"><h6 class="m-0 font-weight-bold text-primary float-left">Mentor Master</h6></div>
            	<div class="col-lg-6"><a href="/bootcamp/add-update-mentor-master" class="btn btn-primary cms-btn cms-btn-xs float-right">Add Mentor</a></div>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Mobile</th>
                            <th>Email</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${mentorMasterList}" var="mentorMasterList">
	                        <tr>
	                            <td><c:out value="${mentorMasterList.id}" /></td>
	                            <td><c:out value="${mentorMasterList.first_name}" /> <c:out value="${mentorMasterList.last_name}" /></td>
	                            <td><c:out value="${mentorMasterList.mobile}" /></td>
	                            <td><c:out value="${mentorMasterList.email}" /></td>
	                           	<td>
		                           	<c:if test = "${mentorMasterList.active == 'true'}">
		                           		<span class="badge badge-success">Active</span>
		                           	</c:if>
		                           	<c:if test = "${mentorMasterList.active == 'false'}">
		                           		<span class="badge badge-warning">Inactive</span>
		                           	</c:if> 
	                           	</td>
	                           	<td class="text-center">    
                                    <div class="dropdown custom-dropdown">
                                        <a class="dropdown-toggle font-20 text-primary" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-cog"></i>
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink1" style="will-change: transform;">
                                            <a class="dropdown-item" href="/bootcamp/view-mentor-master?id=${mentorMasterList.id}">View</a>
                                            <a class="dropdown-item" href="//bootcamp//add-update-mentor-master?id=${mentorMasterList.id}">Edit</a>
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
