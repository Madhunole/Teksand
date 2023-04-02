<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.section {
    padding: 20px 0 !important;
}
</style>

<script>
$(document).ready(function() {
    var table = $('#testList').removeAttr('width').DataTable( {
        paging: true,
        columnDefs: [
        	{ width: 50, targets: 1 },
        	{ width: 150, targets: 2 },
        	{ width: 100, targets: 4 },
            { width: 200, targets: 5 }
        ],
        responsive: true
    } );
} );
</script>


<div id="main">
	<div class="visible-md visible-xs visible-sm mobile-menu">
	    <button type="button" data-toggle="offcanvas"><i class="fa fa-bars"></i></button>
	</div>
	<section class="section bgw">
	    <div class="container-fluid">
	        <div class="section-title-2 text-center course-title">
	            <h2>Teksands Test</h2>
	            <hr>
	        </div><!-- end section-title -->
	       	<div class="table-responsive">
				<table id="testList" class="table table-striped table-bordered dt-responsive" style="font-size: 12px;width:100%;">
					<thead class="thead-dark">
						<tr>
							<th>Id</th>
							<th>Test Name</th>
							<th>Topic 1</th>
							<th>Topic 2</th>
							<th>Topic 3</th>
							<th>Test Link</th>
							<th>Created Date</th>
							<th>Action</th>
						</tr>
					</thead>
				<tbody>
					<c:forEach items="${testList}" var="testList">
						<tr>
							<td><c:out value="${testList.test_id}" /></td>
							<td><c:out value="${testList.test_name}" /></td>
							<td><c:out value="${testList.test_topic_1}" /></td>
							<td><c:out value="${testList.test_topic_2}" /></td>
							<td><c:out value="${testList.test_topic_3}" /></td>
							<td><c:out value="${testList.test_link}" /></td>
							<td><fmt:formatDate value="${testList.created_date}" pattern="dd-MMM-yyyy"/></td>
							<td style="vertical-align: middle !important;">
								<a href="/admin/view-test?id=${testList.test_id}" class="btn btn-primary btn-xs">View</a>
								<!--  <button type="button" class="btn btn-primary btn-xs" onclick="ediJobsDetails(${jobs.id})">Edit</button> -->
							</td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
			</div>
	    </div><!-- end container -->
	</section><!-- end section -->
</div>