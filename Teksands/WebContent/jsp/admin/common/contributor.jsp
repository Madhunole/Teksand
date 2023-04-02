<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
$(document).ready(function() {
	    var table = $('#contributor').removeAttr('width').DataTable( {
	        columnDefs: [
	            { width: 100, targets: 12 }
	        ],
	        responsive: true,
	        paging: true
	    } );
	} );
function downloadXl()
{
	top.location =  "/contributorsdownloadXL";
}
</script>

<div id="main">
	<div class="visible-md visible-xs visible-sm mobile-menu">
	    <button type="button" data-toggle="offcanvas"><i class="fa fa-bars"></i></button>
	</div>
	<section class="section bgw">
	    <div class="container-fluid">
	        <div class="section-title-2 text-center course-title">
	            <h2>Teksands Contributors</h2>
	            <hr>
	        </div><!-- end section-title -->
	        <a href="#" onClick="downloadXl();" class="btn btn-primary btn-sm mb-20"><i class="fa fa-file-excel-o"></i> Download Excel</a>
				<div class="table-responsive">
                      <table id="contributor" class="table table-striped table-bordered dt-responsive" style="width:100%;font-size:12px;">
				        <thead class="thead-dark">
				            <tr>
				                <th>Id</th>
				                <th>Name</th>
				                <th>Mobile</th>
				                <th>Email</th>
				                <th>Address 1</th>
				                <th>Address 2</th>
				                <th>City</th>
				                <th>State</th>
				                <th>Country</th>
				                <th>Pincode</th>
				                <th>Core Skill</th>
				                <th>Experience</th>
				                <th>Resume</th>
				                <th>Date</th>
				            </tr>
				        </thead>
				        <tbody>
					        <c:forEach items="${contributor}" var="contributor">
					            <tr>
					                <td><c:out value="${contributor.id}" /></td>
					                <td><c:out value="${contributor.name}" /></td>
					                <td><c:out value="${contributor.mobile}" /></td>
					                <td><c:out value="${contributor.email}" /></td>
					                <td><c:out value="${contributor.address1}" /></td>
					                <td><c:out value="${contributor.address2}" /></td>
					                <td><c:out value="${contributor.city}" /></td>
					                <td><c:out value="${contributor.state}" /></td>
					                <td><c:out value="${contributor.country}" /></td>
					                <td><c:out value="${contributor.pincode}" /></td>
					                <td><c:out value="${contributor.core_skills}" /></td>
					                <td><c:out value="${contributor.experience}" /></td>
					                <td><a href="/resources/contributor/${contributor.resume}" download="resumes"><c:out value="${contributor.resume}" /></a></td>
					                <%-- <td><c:out value="${contributor.resume}" /></td> --%>
					                <td><fmt:formatDate value="${contributor.date}" pattern="dd-MMM-yyyy"/></td>
					            </tr>
					        </c:forEach>
				        </tbody>
				</table>
			</div>
	    </div><!-- end container -->
	</section><!-- end section -->
</div>