<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="col-12 col-xl-auto mb-3">
    <a class="btn btn-sm btn-light text-primary" href="/bootcamp/dashboard">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
        Back to Dashboard
    </a>
</div>

<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <div class="row">
            	<div class="col-lg-6"><h6 class="m-0 font-weight-bold text-primary float-left" id="bootcamp_name">CMS System Logs</h6></div>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="logTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>User Name</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Date & Time</th>
                            <th>IP Address</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${logList}" var="log">
	                        <tr>
	                        	
	                        	<td><c:out value="${log.id}" /></td>
	                            <td><c:out value="${log.user_name}" /></td>
	                            <td><c:out value="${log.title}" /></td>
	                            <td><c:out value="${log.description}" /></td>
	                            <td><fmt:formatDate value="${log.activity_time}" pattern="dd-MM-yyy hh:mm a"/></td>
	                            <%-- <td><fmt:parseDate value="${log.activity_time}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" /></td> --%>
	                            <td><c:out value="${log.ip_addr}" /></td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>