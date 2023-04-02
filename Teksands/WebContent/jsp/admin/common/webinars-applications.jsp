<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
$(document).ready(function() {
	    var table = $('#webinars').removeAttr('width').DataTable( {
	        paging:         true,
	        columnDefs: [
	            { width: 100, targets: 4 }
	        ],
	        responsive: true
	    } );
	} );
function downloadXl()
{
	top.location =  "/webinarsdownloadXL";
}
</script>

<div id="main">
	<div class="visible-md visible-xs visible-sm mobile-menu">
	    <button type="button" data-toggle="offcanvas"><i class="fa fa-bars"></i></button>
	</div>
	<section class="section bgw">
	    <div class="container-fluid">
	        <div class="section-title-2 text-center course-title">
	            <h2>Teksands Webinars Contacts</h2>
	            <hr>
	        </div><!-- end section-title -->
	        <a href="#" onClick="downloadXl();" class="btn btn-primary btn-sm mb-20"><i class="fa fa-file-excel-o"></i> Download Excel</a>
			<div class="table-responsive">
	            <table id="webinars" class="table table-striped table-bordered dt-responsive" style="width:100%;font-size:12px;">
			        <thead class="thead-dark">
			            <tr>
			                <th>Id</th>
			                <th>Name</th>
			                <th>Email</th>
			                <th>Mobile</th>
			                <th>Date</th>
			                <th>Webinar Name</th>
			            </tr>
			        </thead>
			        <tbody>
				        <c:forEach items="${webinars}" var="webinar">
				            <tr>
				                <td><c:out value="${webinar.id}" /></td>
				                <td><c:out value="${webinar.name}" /></td>
				                <td><c:out value="${webinar.email}" /></td>
				                <td><c:out value="${webinar.mobile}" /></td>
				                <td><fmt:formatDate value="${webinar.date}" pattern="dd-MMM-yyyy"/></td>
				                <td><c:out value="${webinar.webinar_name}" /></td>
				            </tr>
				        </c:forEach>
			        </tbody>
				</table>
			</div>
	    </div><!-- end container -->
	</section><!-- end section -->
</div>