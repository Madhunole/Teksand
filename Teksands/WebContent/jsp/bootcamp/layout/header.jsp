<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
function searchCandidates()
{
    var keyword = $("#txt_search").val();
    if(keyword == "")
    {
    	swal("OOPS!", "Please Enter Keywords", "error");
    	return false;
    }
    document.location.href = "/bootcamp/search?keyword="+keyword;
}
</script>

<nav class="navbar navbar-expand navbar-light bg-white topbar mb-3 static-top shadow">
	<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3"><i class="fa fa-bars"></i></button>
	<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
	    <div class="input-group">
	        <input type="text" class="form-control bg-light border-0 small" id="txt_search" placeholder="Search Candidate here..."
	            aria-label="Search" aria-describedby="basic-addon2">
	        <div class="input-group-append">
	            <button class="btn btn-primary" type="button"  onclick="searchCandidates()">
	                <i class="fas fa-search fa-sm"></i>
	            </button>
	        </div>
	    </div>
	</form>
	<ul class="navbar-nav ml-auto">
		<li class="nav-item dropdown no-arrow d-sm-none">
			<a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-search fa-fw"></i></a>
			<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
				<form class="form-inline mr-auto w-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search"aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button"><i class="fas fa-search fa-sm"></i></button>
						</div>
					</div>
				</form>
			</div>
		</li>
		<li class="nav-item dropdown no-arrow">
		    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
		        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		        <span class="mr-2 d-none d-lg-inline text-gray-600 small">Welcome ${accountMap.user_name}</span>
		        <img class="img-profile rounded-circle"
		            src="/resources/cms/img/undraw_profile.svg">
		    </a>
		    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
		        aria-labelledby="userDropdown">
		        <c:choose>
		        	<c:when test="${accountMap.user_type_id eq '1'}">
		        		 <a class="dropdown-item" href="#" data-toggle="modal" data-target="#addNewUser">
				            <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>Add User</a>
		        	</c:when>
		        </c:choose>
		        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#passwordChange">
		            <i class="fas fa-key fa-sm fa-fw mr-2 text-gray-400"></i>Change Password</a>
		        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
		            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>Logout</a>
		    </div>
		</li>
	</ul>
</nav>