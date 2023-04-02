<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
$(document).ready(function() {
	    var table = $('#ebooks').removeAttr('width').DataTable( {
	        paging:         true,
	        columnDefs: [
	            { width: 100, targets: 4 }
	        ],
	        responsive: true
	    } );
	} );
function downloadXl()
{
	top.location =  "/ebooksdownloadXL";
}
</script>


<div id="main">
	<div class="visible-md visible-xs visible-sm mobile-menu">
	    <button type="button" data-toggle="offcanvas"><i class="fa fa-bars"></i></button>
	</div>
	<section class="section bgw">
	    <div class="container-fluid">
	        <div class="section-title-2 text-center course-title">
	            <h2>Teksands Ebooks</h2>
	            <hr>
	        </div><!-- end section-title -->
	        <a href="#" onClick="downloadXl();" class="btn btn-primary btn-sm mb-20"><i class="fa fa-file-excel-o"></i> Download Excel</a>
			<div class="table-responsive">
            	<table id="ebooks" class="table table-striped table-bordered dt-responsive" style="width:100%;font-size:12px;">
			        <thead class="thead-dark">
			            <tr>
			                <th>Id</th>
			                <th>Name</th>
			                <th>Email</th>
			                <th>Mobile</th>
			                <th>Date</th>
			                <th>Download File</th>
			            </tr>
			        </thead>
			        <tbody>
				        <c:forEach items="${ebooks}" var="ebooks">
				            <tr>
				                <td><c:out value="${ebooks.id}" /></td>
				                <td><c:out value="${ebooks.name}" /></td>
				                <td><c:out value="${ebooks.mobile}" /></td>
				                <td><c:out value="${ebooks.email}" /></td>
				                <td><fmt:formatDate value="${ebooks.date}" pattern="dd-MMM-yyyy"/></td>
				                <td><c:out value="${ebooks.download_file}" /></td>
				            </tr>
				        </c:forEach>
			        </tbody>
				</table>
			</div>
	    </div><!-- end container -->
	</section><!-- end section -->
</div>