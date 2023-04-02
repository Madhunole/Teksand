<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
	</div>
	<div class="row">
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total Bootcamp</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value="${bootcampCount}"></c:out></div>
						</div>
						<div class="col-auto">
							<i class="fas fa-book-open fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total Candidates</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value="${candidateCount}"></c:out></div>
						</div>
						<div class="col-auto">
							<i class="fas fa-users fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total Mentors</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value="${mentorCount}"></c:out></div>
						</div>
						<div class="col-auto">
							<i class="fas fa-chalkboard-teacher fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-warning shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Total Clients</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value="${clientCount}"></c:out></div>
						</div>
						<div class="col-auto">
							<i class="fas fa-hands-helping fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
	  <div class="col-xl-8 col-lg-7">
	      <div class="card shadow mb-4">
	          <div
	              class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
	              <h6 class="m-0 font-weight-bold text-primary">Latest Bootcamp</h6>
	          </div>
	          <div class="card-body">
		          	<div class="table-responsive">
		                <table class="table table-bordered" id="homeDataTable" width="100%" cellspacing="0">
		                    <thead>
		                        <tr>
		                            <th>Id</th>
		                            <th>Bootcamp Name</th>
		                            <th>Start Date</th>
		                            <th>End Date</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                    	<c:forEach items="${bootcampList}" var="bootcampList">
			                        <tr>
			                            <td><c:out value="${bootcampList.id}" /></td>
			                            <td><c:out value="${bootcampList.name}" /></td>
			                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${bootcampList.start_date}" /></td>
			                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${bootcampList.end_date}" /></td>
			                        </tr>
		                        </c:forEach>
		                    </tbody>
		                </table>
	            	</div>
	          </div>
	      </div>
	  </div>
	  <div class="col-xl-4 col-lg-5">
	      <div class="card shadow mb-4">
	          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">Recent Candidates</h6>
	          </div>
	          <div class="card-body">
	              <div class="table-responsive">
		                <table class="table table-bordered" id="CandidateTable_1" width="100%" cellspacing="0">
		                    <thead>
		                        <tr>
		                            <th>Id</th>
                            		<th>Name</th>
                            		<th>Gender</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                    	<c:forEach items="${candidateList}" var="candidateList">
			                        <tr>
			                            <td><c:out value="${candidateList.id}" /></td>
			                            <td><c:out value="${candidateList.name}" /></td>
			                            <td><c:out value="${candidateList.gender}" /></td>
			                        </tr>
		                        </c:forEach>
		                    </tbody>
		                </table>
	            	</div>
	            </div>
	        </div>
	    </div>
	    
	    <c:choose>
		    <c:when test="${accountMap.user_type_id eq '1'}">
			    <div class="col-xl-12 col-lg-12">
			      <div class="card shadow mb-4">
			          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">Recent Activities</h6>
			          </div>
			          <div class="card-body">
			              <div class="table-responsive">
				                <table class="table table-bordered" id="recentLog" width="100%" cellspacing="0">
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
					                            <td><c:out value="${log.ip_addr}" /></td>
					                        </tr>
				                        </c:forEach>
				                    </tbody>
				                </table>
			            	</div>
			            </div>
			        </div>
			    </div>
		    </c:when>
	    </c:choose>
	</div>
</div>
