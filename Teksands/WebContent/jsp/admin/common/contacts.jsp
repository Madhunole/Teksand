<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
$(document).ready(function() {
	    var table = $('#contacts').removeAttr('width').DataTable( {
	        paging:         true,
	        columnDefs: [
	        	{ width: 100, targets: 4 },
	        	{ width: 50, targets: 5 },
	        	{ width: 50, targets: 6 }
	        ],
	        responsive: true
	    } );
	} );

function downloadXl()
{
	top.location =  "/contactsdownloadXL";
}
</script>


<div id="main">
	<div class="visible-md visible-xs visible-sm mobile-menu">
	    <button type="button" data-toggle="offcanvas"><i class="fa fa-bars"></i></button>
	</div>
	<section class="section bgw">
	    <div class="container-fluid">
	        <div class="section-title-2 text-center course-title">
	            <h2>Teksands Contacts</h2>
	            <hr>
	        </div><!-- end section-title -->
	        <a href="#" onClick="downloadXl();" class="btn btn-primary btn-sm mb-20"><i class="fa fa-file-excel-o"></i> Download Excel</a>
			<div class="table-responsive">
                 <table id="contacts" class="table table-striped table-bordered dt-responsive" style="width:100%;font-size:12px;">
			        <thead class="thead-dark">
			            <tr>
			                <th>Id</th>
			                <th>Name</th>
			                <th>Company</th>
			                <th>Email</th>
			                <th>Mobile</th>
			                <th>Requirements</th>
			                <th>Date</th>
			            </tr>
			        </thead>
			        <tbody>
				        <c:forEach items="${contacts}" var="contacts">
				            <tr>
				                <td><c:out value="${contacts.id}" /></td>
				                <td><c:out value="${contacts.name}" /></td>
				                <td><c:out value="${contacts.company}" /></td>
				                <td><c:out value="${contacts.email}" /></td>
				                <td><c:out value="${contacts.mobile}" /></td>
				                <td><c:out value="${contacts.requirements}" /></td>
				                <td><fmt:formatDate value="${contacts.date}" pattern="dd-MMM-yyyy"/></td>
				            </tr>
				        </c:forEach>
			        </tbody>
				</table>
			</div>
	    </div><!-- end container -->
	</section><!-- end section -->
</div>