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
	            <h2>Teksands View Test Answer List</h2>
	            <hr>
	        </div>	       	
	       	<div class="panel panel-default">
	       		<div class="panel-heading"><h4 class="forum-titles">Answers</h4></div>
	       		<div class="panel-body">
	       			<div class="table-responsive">
						<table id="question_list" class="table table-bordered dt-responsive" style="font-size: 12px;width:100%;">
							<thead class="thead-dark">
								<tr>
									<th style="width: 10%;">Type</th>
									<th>Result</th>																		
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${testanswerList}" var="testanswerList">
								
							      	<tr>
										<td><b>Question</b></td>
										<td><c:out value="${testanswerList.question}" /></td>										
									</tr>
								<c:choose>
								    <c:when test="${testanswerList.question_type == 'voice'}">
								    	<tr>
								    	<td><b>Answer</b></td>
										<td>										
								       	<audio controls>										 
											  <source src="${testanswerList.test_answer}" type="audio/mpeg" controls="true">										  
										</audio>
										</td>
										</tr>
								    </c:when>
								    <c:otherwise>
										<tr>
											<td><b>Answer</b></td>
											<td><c:out value="${testanswerList.test_answer}" /></td>
										</tr>
								    </c:otherwise>	
								</c:choose>
								</c:forEach>
							</tbody>
						</table>
					</div>
	       		</div>
	       	</div>
	    </div>
	</section>
</div>


<!-- The modal -->
<div class="modal fade" id="flipFlop" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
<h4 class="modal-title" id="modalLabel">Modal Title</h4>
</div>
<div class="modal-body">
Modal content...
</div>
<div class="modal-footer">
<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
</div>
</div>
</div>
</div>
