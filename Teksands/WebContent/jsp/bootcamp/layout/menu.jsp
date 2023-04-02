<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
textarea.form-control {
	font-size: 14px;
}
</style>

<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	<li><a class="sidebar-brand d-flex align-items-center justify-content-center" href="/bootcamp">
			<div class="sidebar-brand-icon">
				<img class="mobile" src="/resources/cms/img/logo/teksands_small_logo.png" alt="" style="width: 50px;">
			</div>
			<div class="sidebar-brand-text mx-3"><img class="desktop" src="/resources/cms/img/logo/cms_teksands.png" alt="" style="width: 200px;"></div>
		</a>
	</li>
	<c:choose>
		<c:when test="${accountMap.user_type_id eq '1'}">
			<li class="nav-item <c:if test="${page eq 'dashboard'}"><c:out value="active" /></c:if>">
				<a class="nav-link" href="/bootcamp/dashboard">
				<i class="fas fa-fw fa-tachometer-alt"></i>
				<span>Dashboard</span></a>
			</li>
			<li class="nav-item <c:if test="${page eq 'brand-list' || page eq 'brand-add-update' || page eq 'view-brand'}"><c:out value="active" /></c:if>">
		       <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseOne" aria-expanded="<c:if test="${page eq 'brand-list' || page eq 'brand-add-update'}"><c:out value="true" /></c:if>" aria-controls="collapseOne">
		           <i class="fas fa-copyright"></i>
		           <span>Brand Master</span>
		       </a>
		       <div id="collapseOne" class="collapse <c:if test="${page eq 'brand-list' || page eq 'brand-add-update' || page eq 'view-brand'}"><c:out value="show" /></c:if>" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
		               <a class="collapse-item <c:if test="${page eq 'brand-list'}"><c:out value="active" /></c:if>" href="/bootcamp/brands">Brands</a>
		               <a class="collapse-item <c:if test="${page eq 'brand-add-update'}"><c:out value="active" /></c:if>" href="/bootcamp/add-update-brand">Add Brand</a>
		               <c:if test="${page eq 'view-brand'}">
		               		<a class="collapse-item <c:if test="${page eq 'view-brand'}"><c:out value="active" /></c:if>" href="#">View Brand</a>
		               </c:if>
		           </div>
		       </div>
		   </li>
		<li class="nav-item <c:if test="${page eq 'candidate' || page eq 'add-candidate' || page eq 'view-candidate' || page eq 'candidate-list' }"><c:out value="active" /></c:if>">
		       <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
		           aria-expanded="<c:if test="${page eq 'candidate' || page eq 'add-candidate' || page eq 'view-candidate' || page eq 'candidate-list' }"><c:out value="true" /></c:if>" aria-controls="collapseTwo">
		           <i class="fas fa-users"></i>
		           <span>Candidate Master</span>
		       </a>
		       <div id="collapseTwo" class="collapse <c:if test="${page eq 'candidate' || page eq 'add-candidate' || page eq 'view-candidate' || page eq 'candidate-list' }"><c:out value="show" /></c:if>" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
		               <a class="collapse-item <c:if test="${page eq 'candidate'}"><c:out value="active" /></c:if>" href="/bootcamp/candidate-list">Candidate List</a>
		               <a class="collapse-item <c:if test="${page eq 'add-candidate'}"><c:out value="active" /></c:if>" href="/bootcamp/add-update-candidate">Add Candidate</a>
		             	<c:if test="${page eq 'view-candidate'}">
		                	<a class="collapse-item <c:if test="${page eq 'view-candidate'}"><c:out value="active" /></c:if>" href="#">View Candidate</a>
		               </c:if>		             
		           </div>
		       </div>
		   </li>  
		   <li class="nav-item <c:if test="${page eq 'bootcamp-list' || page eq 'add-bootcamp' || page eq 'view-bootcamp' || page eq 'assign-bootcamp'}"><c:out value="active" /></c:if>">
		       <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree"
		           aria-expanded="true" aria-controls="collapseThree">
		           <i class="fas fa-book-open"></i>
		           <span>Bootcamp Master</span>
		       </a>
		       <div id="collapseThree" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
		               <a class="collapse-item" href="/bootcamp/bootcamp-list">Bootcamp List</a>
		               <a class="collapse-item" href="/bootcamp/add-update-bootcamp">Add Bootcamp</a>
		           </div>
		       </div>
		   </li>		  
		   <li class="nav-item <c:if test="${page eq 'mentor-master' || page eq 'add-mentor-master' || page eq 'view-mentor-master'}"><c:out value="active" /></c:if>">
		       <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFive"
		           aria-expanded="true" aria-controls="collapseFive">
		           <i class="fas fa-chalkboard-teacher"></i>
		           <span>Mentor Master</span>
		       </a>
		       <div id="collapseFive" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
		               <a class="collapse-item" href="/bootcamp/mentor-master">Mentor List</a>
		               <a class="collapse-item" href="/bootcamp/add-update-mentor-master">Add Mentor</a>
		           </div>
		       </div>
		   </li>
		   <li class="nav-item <c:if test="${page eq 'add-update-interview' || page eq 'interview-feedbacks' || page eq 'interview-list'}"><c:out value="active" /></c:if>">
		       <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSix"
		           aria-expanded="true" aria-controls="collapseSix">
		           <i class="fas fa-user-graduate"></i>
		           <span>Interview Master</span>
		       </a>
		       <div id="collapseSix" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
		           	   <a class="collapse-item" href="/bootcamp/interview-list">Interview List</a>
		               <a class="collapse-item" href="/bootcamp/add-update-interview">Add New Interview</a>
		               <a class="collapse-item" href="/bootcamp/interview-feedbacks">Update Feedbacks</a>
		           </div>
		       </div>
		   </li>
		   <li class="nav-item <c:if test="${page eq 'jobs-list' || page eq 'view-jobs' || page eq 'assign-jobs' || page eq 'add-update-jobs'}"><c:out value="active" /></c:if>">
		       <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseSeven" aria-expanded="<c:if test="${page eq 'jobs-list' || page eq 'view-jobs' || page eq 'assign-jobs' || page eq 'add-update-jobs'}"><c:out value="true" /></c:if>" aria-controls="collapseOne">
		           <i class="fas fa-user-shield"></i>
		           <span>Jobs Master</span>
		       </a>
		       <div id="collapseSeven" class="collapse <c:if test="${page eq 'jobs-list' || page eq 'view-jobs' || page eq 'assign-jobs' || page eq 'add-update-jobs'}"><c:out value="show" /></c:if>" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
		               <a class="collapse-item <c:if test="${page eq 'jobs-list'}"><c:out value="active" /></c:if>" href="/bootcamp/jobs-list">Jobs List</a>
		               <a class="collapse-item <c:if test="${page eq 'add-update-jobs'}"><c:out value="active" /></c:if>" href="/bootcamp/add-update-jobs">Add New Job</a>
		               <c:if test="${page eq 'view-jobs'}">
		                	<a class="collapse-item <c:if test="${page eq 'view-jobs'}"><c:out value="active" /></c:if>" href="#">View Job</a>
		               </c:if>
		                <c:if test="${page eq 'assign-jobs'}">
		                	<a class="collapse-item <c:if test="${page eq 'assign-jobs'}"><c:out value="active" /></c:if>" href="#">Assign Job</a>
		               </c:if>
		           </div>
		       </div>
		   </li>
		  <li class="nav-item">
		       <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseEight"
		           aria-expanded="true" aria-controls="collapseEight">
		           <i class="fas fa-pen"></i>
		           <span>Test Master</span>
		       </a>
		       <div id="collapseEight" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
		               <a class="collapse-item" href="/bootcamp/list-test">Test List</a>
		               <a class="collapse-item" href="/bootcamp/create-test">Create Test</a>		              
		           </div>
		       </div>
		   </li>
		   <li class="nav-item <c:if test="${page eq 'log'}"><c:out value="active" /></c:if>">
				<a class="nav-link" href="/bootcamp/log">
				<i class="fas fa-book"></i>
				<span>System Log</span></a>
			</li>
	   </c:when>
	   <c:when test="${accountMap.user_type_id eq '2' || accountMap.user_type_id eq '3'}">
			<li class="nav-item <c:if test="${page eq 'dashboard'}"><c:out value="active" /></c:if>">
				<a class="nav-link" href="/bootcamp/dashboard">
				<i class="fas fa-fw fa-tachometer-alt"></i>
				<span>Dashboard</span></a>
			</li>
			<li class="nav-item <c:if test="${page eq 'bootcamp-list' || page eq 'add-bootcamp' || page eq 'view-bootcamp'}"><c:out value="active" /></c:if>">
		       <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree"
		           aria-expanded="true" aria-controls="collapseThree">
		           <i class="fas fa-book-open"></i>
		           <span>Bootcamp Master</span>
		       </a>
		       <div id="collapseThree" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
		               <a class="collapse-item" href="/bootcamp/bootcamp-list">Bootcamp List</a>
		               <a class="collapse-item" href="/bootcamp/add-update-bootcamp">Add Bootcamp</a>
		           </div>
		       </div>
		   </li>
	   </c:when>
	   <c:when test="${accountMap.user_type_id eq '4'}">
	   		<li class="nav-item <c:if test="${page eq 'dashboard'}"><c:out value="active" /></c:if>">
				<a class="nav-link" href="/bootcamp/dashboard">
				<i class="fas fa-fw fa-tachometer-alt"></i>
				<span>Dashboard</span></a>
			</li>
			<li class="nav-item <c:if test="${page eq 'bootcamp-list' || page eq 'add-bootcamp' || page eq 'view-bootcamp'}"><c:out value="active" /></c:if>">
		       <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree"
		           aria-expanded="true" aria-controls="collapseThree">
		           <i class="fas fa-book-open"></i>
		           <span>Bootcamp Master</span>
		       </a>
		       <div id="collapseThree" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
		               <a class="collapse-item" href="/bootcamp/bootcamp-list">Bootcamp List</a>
		           </div>
		       </div>
		   </li>
	   </c:when>
	   <c:when test="${accountMap.user_type_id eq '6'}">
	   		<li class="nav-item <c:if test="${page eq 'dashboard'}"><c:out value="active" /></c:if>">
				<a class="nav-link" href="/bootcamp/brand-dashboard">
				<i class="fas fa-fw fa-tachometer-alt"></i>
				<span>Dashboard</span></a>
			</li>
	   		<li class="nav-item <c:if test="${page eq 'brand' || page eq 'brand-edit'}"><c:out value="show" /></c:if>">
		       <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseOne" aria-expanded="<c:if test="${page eq 'brand' || page eq 'brand-edit'}"><c:out value="true" /></c:if>" aria-controls="collapseOne">
		           <i class="fas fa-copyright"></i>
		           <span>Brand Master</span>
		       </a>
		       <div id="collapseOne" class="collapse <c:if test="${page eq 'brand' || page eq 'brand-edit'}"><c:out value="show" /></c:if>" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
	               		<a class="collapse-item <c:if test="${page eq 'brand'}"><c:out value="active" /></c:if>" href="/bootcamp/brand">View Brand</a>
	               		<a class="collapse-item <c:if test="${page eq 'brand-edit'}"><c:out value="active" /></c:if>" href="/bootcamp/edit-brand">Edit Brand</a>
		           </div>
		       </div>
		   </li>	   
		   <li class="nav-item <c:if test="${page eq 'candidate' || page eq 'add-candidate' || page eq 'view-candidate' || page eq 'candidate-list' }"><c:out value="active" /></c:if>">
		       <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
		           aria-expanded="<c:if test="${page eq 'candidate' || page eq 'add-candidate' || page eq 'view-candidate' || page eq 'candidate-list' }"><c:out value="true" /></c:if>" aria-controls="collapseTwo">
		           <i class="fas fa-users"></i>
		           <span>Candidate Master</span>
		       </a>
		       <div id="collapseTwo" class="collapse <c:if test="${page eq 'candidate' || page eq 'add-candidate' || page eq 'view-candidate' || page eq 'candidate-list' }"><c:out value="show" /></c:if>" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
		               <a class="collapse-item <c:if test="${page eq 'candidate'}"><c:out value="active" /></c:if>" href="/bootcamp/brand-candidate-list">Candidate List</a>
		               <a class="collapse-item <c:if test="${page eq 'add-candidate'}"><c:out value="active" /></c:if>" href="/bootcamp/brand-add-update-candidate">Add Candidate</a>
		             	<c:if test="${page eq 'view-candidate'}">
		                	<a class="collapse-item <c:if test="${page eq 'view-candidate'}"><c:out value="active" /></c:if>" href="#">View Candidate</a>
		               </c:if>		             
		           </div>
		       </div>
		  	</li> 
			<!-- <li class="nav-item <c:if test="${page eq 'bootcamp-list' || page eq 'add-bootcamp' || page eq 'view-bootcamp' || page eq 'assign-bootcamp'}"><c:out value="active" /></c:if>">
		       <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree"
		           aria-expanded="true" aria-controls="collapseThree">
		           <i class="fas fa-book-open"></i>
		           <span>Bootcamp Master</span>
		       </a>
		       <div id="collapseThree" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
		               <a class="collapse-item" href="/bootcamp/bootcamp-list">Bootcamp List</a>
		               <a class="collapse-item" href="/bootcamp/add-update-bootcamp">Add Bootcamp</a>
		           </div>
		       </div>
		   </li>	 -->
		   <li class="nav-item <c:if test="${page eq 'brand-clients' || page eq 'add-update-client' || page eq 'view-client'}"><c:out value="active" /></c:if>">
		       <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseFour" aria-expanded="<c:if test="${page eq 'client-jobs'}"><c:out value="true" /></c:if>" aria-controls="collapseFour">
		           <i class="fas fa-user-shield"></i>
		           <span>Client Master</span>
		       </a>
		       <div id="collapseFour" class="collapse <c:if test="${page eq 'brand-clients'|| page eq 'add-update-client' || page eq 'view-client'}"><c:out value="show" /></c:if>" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
		               <a class="collapse-item <c:if test="${page eq  'brand-clients'}"><c:out value="active" /></c:if>" href="/bootcamp/brand-clients">Client List</a>
		               <a class="collapse-item <c:if test="${page eq 'add-update-client'}"><c:out value="active" /></c:if>" href="/bootcamp/brand-add-update-client">Add New Client</a>
		                 <c:if test="${page eq 'view-client'}">
		                	<a class="collapse-item <c:if test="${page eq 'view-client'}"><c:out value="active" /></c:if>" href="#">View Client</a>
		               </c:if>		              
		           </div>
		       </div>
		   </li>
		  <!-- <li class="nav-item <c:if test="${page eq 'mentor-master' || page eq 'add-mentor-master' || page eq 'view-mentor-master'}"><c:out value="active" /></c:if>">
		       <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFive"
		           aria-expanded="true" aria-controls="collapseFive">
		           <i class="fas fa-chalkboard-teacher"></i>
		           <span>Mentor Master</span>
		       </a>
		       <div id="collapseFive" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
		               <a class="collapse-item" href="/bootcamp/mentor-master">Mentor List</a>
		               <a class="collapse-item" href="/bootcamp/add-update-mentor-master">Add Mentor</a>
		           </div>
		       </div>
		   </li>
		   <li class="nav-item <c:if test="${page eq 'add-update-interview' || page eq 'interview-feedbacks' || page eq 'interview-list'}"><c:out value="active" /></c:if>">
		       <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSix"
		           aria-expanded="true" aria-controls="collapseSix">
		           <i class="fas fa-user-graduate"></i>
		           <span>Interview Master</span>
		       </a>
		       <div id="collapseSix" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
		           	   <a class="collapse-item" href="/bootcamp/interview-list">Interview List</a>
		               <a class="collapse-item" href="/bootcamp/add-update-interview">Add New Interview</a>
		               <a class="collapse-item" href="/bootcamp/interview-feedbacks">Update Feedbacks</a>
		           </div>
		       </div>
		   </li>		 -->    		
		   <li class="nav-item <c:if test="${page eq 'brand-jobs' || page eq 'view-jobs' || page eq 'assign-jobs' || page eq 'add-update-jobs' || page eq 'view-jobs'}"><c:out value="active" /></c:if>">
		       <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseSeven" aria-expanded="<c:if test="${page eq 'client-jobs'}"><c:out value="true" /></c:if>" aria-controls="collapseOne">
		           <i class="fas fa-user-shield"></i>
		           <span>Jobs Master</span>
		       </a>
		       <div id="collapseSeven" class="collapse <c:if test="${page eq 'brand-jobs'|| page eq 'add-update-jobs' || page eq 'view-jobs'}"><c:out value="show" /></c:if>" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
		               <a class="collapse-item <c:if test="${page eq  'brand-jobs'}"><c:out value="active" /></c:if>" href="/bootcamp/brand-jobs">Jobs List</a>
		               <a class="collapse-item <c:if test="${page eq 'add-update-jobs'}"><c:out value="active" /></c:if>" href="/bootcamp/brand-add-update-jobs">Add New Job</a>
		                 <c:if test="${page eq 'view-jobs'}">
		                	<a class="collapse-item <c:if test="${page eq 'view-jobs'}"><c:out value="active" /></c:if>" href="#">View Job</a>
		               </c:if>		              
		           </div>
		       </div>
		   </li>
		    <li class="nav-item <c:if test="${page eq 'brand-user-list' || page eq 'brand-new-user'}"><c:out value="active" /></c:if>">
		       <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseEight" aria-expanded="<c:if test="${page eq 'client-jobs'}"><c:out value="true" /></c:if>" aria-controls="collapseOne">
		           <i class="fas fa-user-shield"></i>
		           <span>User Master</span>
		       </a>
		       <div id="collapseEight" class="collapse <c:if test="${page eq 'brand-user-list'|| page eq 'brand-new-user'}"><c:out value="show" /></c:if>" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
		               <a class="collapse-item <c:if test="${page eq  'brand-user-list'}"><c:out value="active" /></c:if>" href="/bootcamp/users">User List</a>
		               <a class="collapse-item <c:if test="${page eq 'band-new-user'}"><c:out value="active" /></c:if>" href="/bootcamp/brand-add-update-user">Add New User</a>		               	              
		           </div>
		       </div>
		   </li>		   
		  <!--  <li class="nav-item">
		       <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseNine"
		           aria-expanded="true" aria-controls="collapseNine">
		           <i class="fas fa-pen"></i>
		           <span>Test Master</span>
		       </a>
		       <div id="collapseNine" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
		               <a class="collapse-item" href="/bootcamp/list-test">Test List</a>
		               <a class="collapse-item" href="/bootcamp/create-test">Create Test</a>		              
		           </div>
		       </div>
		   </li> 
		   <li class="nav-item <c:if test="${page eq 'log'}"><c:out value="active" /></c:if>">
				<a class="nav-link" href="/bootcamp/log">
				<i class="fas fa-book"></i>
				<span>System Log</span></a>
			</li>--> 
			<li class="nav-item <c:if test="${page eq 'brand-skills-list'}"><c:out value="active" /></c:if>">
		       <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTen" aria-expanded="<c:if test="${page eq 'brand-skills-list'}"><c:out value="true" /></c:if>" aria-controls="collapseOne">
		           <i class="fas fa-copyright"></i>
		           <span>Parameter Master</span>
		       </a>
		       <div id="collapseTen" class="collapse <c:if test="${page eq 'brand-skills-list' || page eq 'brand-domains-list' || page eq 'brand-application-status-list' || page eq 'brand-interview-status-list' || page eq 'brand-interview-rounds-list' || page eq 'brand-interview-results-list' || page eq 'brand-joining-status-list' || page eq 'brand-offer-status-list' || page eq 'brand-document-status-list'}"><c:out value="show" /></c:if>" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
	               		<a class="collapse-item <c:if test="${page eq 'brand-skills-list'}"><c:out value="active" /></c:if>" href="/bootcamp/skills">Skills</a>
	               		<a class="collapse-item <c:if test="${page eq 'brand-domains-list'}"><c:out value="active" /></c:if>" href="/bootcamp/domains">Domains</a>
	               		<a class="collapse-item <c:if test="${page eq 'brand-application-status-list'}"><c:out value="active" /></c:if>" href="/bootcamp/application-status">Application Status</a>
	               		<a class="collapse-item <c:if test="${page eq 'brand-interview-status-list'}"><c:out value="active" /></c:if>" href="/bootcamp/interview-status">Interview Status</a>
	               		<a class="collapse-item <c:if test="${page eq 'brand-interview-rounds-list'}"><c:out value="active" /></c:if>" href="/bootcamp/interview-rounds">Interview Rounds</a>
	               		<a class="collapse-item <c:if test="${page eq 'brand-interview-results-list'}"><c:out value="active" /></c:if>" href="/bootcamp/interview-results">Interview Results</a>	               			               		
	               		<a class="collapse-item <c:if test="${page eq 'brand-joining-status-list'}"><c:out value="active" /></c:if>" href="/bootcamp/joining-status">Joining Status</a>
	               		<a class="collapse-item <c:if test="${page eq 'brand-offer-status-list'}"><c:out value="active" /></c:if>" href="/bootcamp/offer-status">Offer Status</a>
	               		<a class="collapse-item <c:if test="${page eq 'brand-document-status-list'}"><c:out value="active" /></c:if>" href="/bootcamp/document-status">Document Status</a>	               		
		           </div>
		       </div>
		   </li>
	   </c:when>
	   <c:when test="${accountMap.user_type_id eq '7'}">
	  		<li class="nav-item <c:if test="${page eq 'dashboard'}"><c:out value="active" /></c:if>">
				<a class="nav-link" href="/bootcamp/client/dashboard">
				<i class="fas fa-fw fa-tachometer-alt"></i>
				<span>Dashboard</span></a>
			</li>
	   		<!-- <li class="nav-item <c:if test="${page eq 'client-brand'}"><c:out value="active" /></c:if>">
				<a class="nav-link" href="/bootcamp/client/brand">
				<i class="fas fa-copyright"></i>
				<span>Brand</span></a>
			</li> -->
			<li class="nav-item <c:if test="${page eq 'candidate' || page eq 'add-candidate' || page eq 'view-candidate' || page eq 'candidate-list' }"><c:out value="active" /></c:if>">
		       <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOne"
		           aria-expanded="<c:if test="${page eq 'candidate' || page eq 'add-candidate' || page eq 'view-candidate' || page eq 'candidate-list' }"><c:out value="true" /></c:if>" aria-controls="collapseTwo">		        
		           <i class="fas fa-users"></i>
		           <span>Candidate Master</span>
		       </a>
		       <div id="collapseOne" class="collapse <c:if test="${page eq 'candidate' || page eq 'add-candidate' || page eq 'view-candidate' || page eq 'candidate-list' }"><c:out value="show" /></c:if>" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
		               <a class="collapse-item <c:if test="${page eq 'candidate'}"><c:out value="active" /></c:if>" href="/bootcamp/client/candidate-list">Candidate List</a>
		               <a class="collapse-item <c:if test="${page eq 'add-candidate'}"><c:out value="active" /></c:if>" href="/bootcamp/client/add-update-candidate">Add Candidate</a>
		             	<c:if test="${page eq 'view-candidate'}">
		                	<a class="collapse-item <c:if test="${page eq 'view-candidate'}"><c:out value="active" /></c:if>" href="#">View Candidate</a>
		               </c:if>		             
		           </div>
		       </div>
		  	</li> 
		  	<li class="nav-item <c:if test="${page eq 'client-clients' || page eq 'add-update-client' || page eq 'view-client'}"><c:out value="active" /></c:if>">
		       <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="<c:if test="${page eq 'client-jobs'}"><c:out value="true" /></c:if>" aria-controls="collapseFour">
		           <i class="fas fa-user-shield"></i>
		           <span>Client Master</span>
		       </a>
		       <div id="collapseTwo" class="collapse <c:if test="${page eq 'client-clients'|| page eq 'add-update-client' || page eq 'view-client'}"><c:out value="show" /></c:if>" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
		               <a class="collapse-item <c:if test="${page eq  'client-clients'}"><c:out value="active" /></c:if>" href="/bootcamp/client/clients">Client List</a>
		               <a class="collapse-item <c:if test="${page eq 'add-update-client'}"><c:out value="active" /></c:if>" href="/bootcamp/client/add-update-client">Add New Client</a>
		                 <c:if test="${page eq 'view-client'}">
		                	<a class="collapse-item <c:if test="${page eq 'view-client'}"><c:out value="active" /></c:if>" href="#">View Client</a>
		               </c:if>		              
		           </div>
		       </div>
		   </li>
		   <li class="nav-item <c:if test="${page eq 'client-jobs' || page eq 'view-jobs' || page eq 'assign-jobs' || page eq 'client-add-update-jobs' || page eq 'view-jobs'}"><c:out value="active" /></c:if>">
		       <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseThree" aria-expanded="<c:if test="${page eq 'client-jobs'}"><c:out value="true" /></c:if>" aria-controls="collapseOne">
		           <i class="fas fa-user-shield"></i>
		           <span>Jobs Master</span>
		       </a>
		       <div id="collapseThree" class="collapse <c:if test="${page eq 'client-jobs'|| page eq 'client-add-update-jobs' || page eq 'view-jobs'}"><c:out value="show" /></c:if>" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		           <div class="bg-white py-2 collapse-inner rounded">
		               <a class="collapse-item <c:if test="${page eq 'client-jobs'}"><c:out value="active" /></c:if>" href="/bootcamp/client/jobs">Jobs List</a>
		               <a class="collapse-item <c:if test="${page eq 'client-add-update-jobs'}"><c:out value="active" /></c:if>" href="/bootcamp/client/client-add-update-jobs">Add New Job</a>
		                 <c:if test="${page eq 'view-jobs'}">
		                	<a class="collapse-item <c:if test="${page eq 'view-jobs'}"><c:out value="active" /></c:if>" href="#">View Job</a>
		               </c:if>		              
		           </div>
		       </div>
		   </li>
	   </c:when>
   </c:choose>
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>
</ul>