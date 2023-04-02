<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
$(document).ready(function() {
	    var table = $('#jobs_applications').removeAttr('width').DataTable( {
	        paging:         true,
	        columnDefs: [
	            { width: 100, targets: 5 }
	        ],
	        responsive: true
	    } );
	} );

function downloadXl()
{
	top.location =  "/jobsContactsdownloadXL";
}
</script>


<div id="main">
	<div class="visible-md visible-xs visible-sm mobile-menu">
	    <button type="button" data-toggle="offcanvas"><i class="fa fa-bars"></i></button>
	</div>
	<section class="section bgw">
	    <div class="container-fluid">
	        <div class="section-title-2 text-center course-title">
	            <h2>Teksands Jobs Applications</h2>
	            <hr>
	        </div><!-- end section-title -->
	        <a href="#" onClick="downloadXl();" class="btn btn-primary btn-sm mb-20"><i class="fa fa-file-excel-o"></i> Download Excel</a>
			<div class="table-responsive">
				<table id="jobs_applications" class="table table-striped table-bordered dt-responsive" style="width:100%;font-size:12px;">
			        <thead class="thead-dark">
			            <tr>
			                <th>Id</th>
			                <th>Jobs Id</th>
			                <th>Name</th>
			                <th>Email</th>
			                <th>Mobile</th>
			                <th>Date</th>
			                <th>Summary</th>
			                <th>Resume</th>
			            </tr>
			        </thead>
			        <tbody>
				        <c:forEach items="${jobsApplications}" var="jobs">
				            <tr>
				                <td><c:out value="${jobs.id}" /></td>
				                <td><c:out value="${jobs.jobs_id}" /></td>
				                <td><c:out value="${jobs.name}" /></td>
				                <td><c:out value="${jobs.email}" /></td>
				                <td><c:out value="${jobs.mobile}" /></td>
				                <td><fmt:formatDate value="${jobs.date}" pattern="dd-MMM-yyyy"/></td>
				                <td><c:out value="${jobs.summary}" /></td>
				                <td><a href="/resources/contributor/${jobs.resume}" class="btn btn-primary btn-xs">Download Resume</a></td>
				            </tr>
				        </c:forEach>
			        </tbody>
				</table>
			</div>
	    </div><!-- end container -->
	</section><!-- end section -->
</div>