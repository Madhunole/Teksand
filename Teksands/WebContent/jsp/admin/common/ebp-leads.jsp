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
	    var table = $('#leads').removeAttr('width').DataTable( {
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
	
function downloadXl()
{
	top.location =  "/ebpLeadsDownloadXL";
}	
</script>


<div id="main">
	<div class="visible-md visible-xs visible-sm mobile-menu">
	    <button type="button" data-toggle="offcanvas"><i class="fa fa-bars"></i></button>
	</div>
	<section class="section bgw">
	    <div class="container-fluid">
	        <div class="section-title-2 text-center course-title">
	            <h2>Teksands Leads</h2>
	            <hr>
	        </div><!-- end section-title -->
	       	<a href="#" onClick="downloadXl();" class="btn btn-primary btn-sm mb-20"><i class="fa fa-file-excel-o"></i> Download Excel</a>
			<div class="table-responsive">
				<table id="leads" class="table table-striped table-bordered dt-responsive" style="font-size: 12px;width:100%;">
					<thead class="thead-dark">
						<tr>
							<th>Id</th>
			                <th>Name</th>
			                <th>Company</th>
			                <th>Email</th>
			                <th>Mobile</th>
			                <th>Date</th>
						</tr>
					</thead>
				<tbody>
					<c:forEach items="${ebpEmailsList}" var="ebpEmails">
			            <tr>
			                <td><c:out value="${ebpEmails.id}" /></td>
			                <td><c:out value="${ebpEmails.name}" /></td>
			                <td><c:out value="${ebpEmails.company}" /></td>
			                <td><c:out value="${ebpEmails.email}" /></td>
			                <td><c:out value="${ebpEmails.mobile}" /></td>
			                <td><fmt:formatDate value="${ebpEmails.date}" pattern="dd-MMM-yyyy"/></td>
			            </tr>
			        </c:forEach>
				</tbody>
				</table>
			</div>
	    </div><!-- end container -->
	</section><!-- end section -->
</div>