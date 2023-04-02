<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.text-bold {
   font-weight: bold;
}
.float-right {
	float: right;
}

.dropdown-item{
	display: block;
    width: 100%;
    padding: 0.25rem 1.5rem;
    clear: both;
    font-weight: 400;
    color: #3a3b45;
    text-align: inherit;
    white-space: nowrap;
    background-color: transparent;
    border: 0;
}

#question_list .dropdown-menu {
    margin: 0 0 0 -105px !important;
}

#question_list .dropdown {
    text-align: center;
}
.panel-default > .panel-heading {
    color: #fff !important;
    background-color: #3ca1db !important;
    border-color: #3ca1db !important;
}
.forum-titles {
    color: #fff;
    text-transform: uppercase;
    font-size: 13px;
    font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
    font-weight: 700;
}
</style>

<script>
<c:choose>
	<c:when test="${empty test}">
		var test_id = "";																   
	</c:when>
	<c:otherwise>
		var test_id = ${test.test_id};
	</c:otherwise>
</c:choose>

var test_qns_type = "";

</script>

<div id="main">
	<div class="visible-md visible-xs visible-sm mobile-menu">
	    <button type="button" data-toggle="offcanvas"><i class="fa fa-bars"></i></button>
	</div>
	<section class="section bgw">
	    <div class="container-fluid">
	        <div class="section-title-2 text-center course-title">
	            <h2>Teksands View User Test List</h2>
	            <hr>
	        </div>	       	
	       	<div class="panel panel-default">
	       		<div class="panel-heading"><h4 class="forum-titles">Tests</h4></div>
	       		<div class="panel-body">
	       			<div class="table-responsive">
						<table id="question_list" class="table table-bordered dt-responsive" style="font-size: 12px;width:100%;">
							<thead class="thead-dark">
								<tr>
									<th style="width: 5%;">Id</th>
									<th>Test Id</th>
									<th>Name</th>
									<th>Email</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${testList}" var="testList">
									<tr>
										<td><c:out value="${testList.user_id}" /></td>
										<td><c:out value="${testList.test_id}" /></td>
										<td><c:out value="${testList.name}" /></td>
										<td><c:out value="${testList.email}" /></td>
										<td style="vertical-align: middle !important;">
											<a href="/admin/view-user-answer-list?test_id=${testList.test_id}&user_id=${testList.user_id}" class="btn btn-primary btn-xs">View Answer List</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
	       		</div>
	       	</div>
	    </div>
	</section>
</div>
