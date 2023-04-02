<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>

/* Small devices (portrait tablets and large phones, 600px and up) */
@media only screen and (min-width: 600px) {
	.modal {
		left:0px !important;
	}
}

/* Medium devices (landscape tablets, 768px and up) */
@media only screen and (min-width: 768px) {
	.modal {
		left:315px !important;
	}
}
</style>

<script>
$(document).ready(function() {
	    var table = $('#mentors').removeAttr('width').DataTable( {
	        columnDefs: [
	            { width: 100, targets: 4 }
	        ],
	        responsive: true,
	        paging: true
	    } );
	} );


function showDetails(id)
{
	$.ajaxSetup({async:false});
	$.post("/admin/getMentorsById", {id: "" + id + "", }, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
  		$("#span_id").html(obj.id);
	  	$("#span_name").html(obj.name);
	  	$("#span_mobile").html(obj.mobile);
	  	$("#span_email").html(obj.email);
	  	$("#span_gender").html(obj.gender);
	  	$("#span_addr1").html(obj.address1);
	  	$("#span_addr2").html(obj.address2);
	  	$("#span_city").html(obj.city);
	  	$("#span_state").html(obj.state);
	  	$("#span_country").html(obj.country);
	  	$("#span_skills").html(obj.technologies);
	  	$("#span_train_exp").html(obj.con_description);
	  	$("#span_indus_exp").html(obj.tech_description);
	  	$("#span_linkedin_url").html(obj.linkedin_url);
	  	$("#span_date").html(obj.date);
	  	/* $("#anchor_resume").attr("href", "/resources/contributor/"+obj.resume); */
	  	
	  	$("#mentor_view_content").modal('show');
		
	},'text');
    
}
function downloadXl()
{
	top.location =  "/ebpMentorsdownloadXL";
}
</script>

<div id="main">
	<div class="visible-md visible-xs visible-sm mobile-menu">
	    <button type="button" data-toggle="offcanvas"><i class="fa fa-bars"></i></button>
	</div>
	<section class="section bgw">
	    <div class="container-fluid">
	        <div class="section-title-2 text-center course-title">
	            <h2>Teksands Mentors</h2>
	            <hr>
	        </div><!-- end section-title -->
	        <a href="#" onClick="downloadXl();" class="btn btn-primary btn-sm mb-20"><i class="fa fa-file-excel-o"></i> Download Excel</a>
			<div class="table-responsive">
				<table id="mentors" class="table table-striped table-bordered dt-responsive" style="width:100%;font-size:12px;">
			        <thead class="thead-dark">
			            <tr>
			                <th>Id</th>
			                <th>Name</th>
			                <th>Mobile</th>
			                <th>Email</th>
			                <th>City</th>
			                <th>Date</th>
			                <th>Action</th>
			            </tr>
			        </thead>
			        <tbody>
				        <c:forEach items="${mentorsList}" var="mentorsList">
				            <tr>
				                <td><c:out value="${mentorsList.id}" /></td>
				                <td><c:out value="${mentorsList.name}" /></td>
				                <td><c:out value="${mentorsList.mobile}" /></td>
				                <td><c:out value="${mentorsList.email}" /></td>
				                <td><c:out value="${mentorsList.city}" /></td>
				                <td><fmt:formatDate value="${mentorsList.date}" pattern="dd-MMM-yyyy"/></td>
				                <td><button type="button" class="btn btn-primary btn-xs" onclick="showDetails(${mentorsList.id})">View</button></td>
				            </tr>
				        </c:forEach>
			        </tbody>
				</table>
			</div>
	    </div><!-- end container -->
	</section><!-- end section -->
</div>

<div id="mentor_view_content" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="popup-modal" data-dismiss="modal">&times;</button>
		<h4 class="text-center"><b>Admin - Trainers Details</b></h4>
      </div>
      <div class="modal-body">
		  <div class="container-fluid">
		    <div class="row">
		      <div class="col-md-12">
			                   <div class="tab-first menu-center">
			                       <ul class="nav nav-tabs" role="tablist" style="border: 0px solid #ddd;">
			                           <li role="presentation" class="active"><a href="#general" aria-controls="general" role="tab" data-toggle="tab">General</a></li>
			                           <li role="presentation"><a href="#training" aria-controls="training" role="tab" data-toggle="tab" >Training Experience</a></li>
			                           <li role="presentation"><a href="#industry" aria-controls="industry" role="tab" data-toggle="tab" >Industry Experience</a></li>
			                           <li role="presentation"><a href="#contact_info" aria-controls="industry" role="tab" data-toggle="tab">Contact Information</a></li>
			                       </ul>
			
			                       <div class="tab-content tabs-video" style="height: 300px;">
			                           <div role="tabpanel" class="tab-pane active" id="general">
			                               <div class="tab-padding clearfix">
			                                   <table class="table table-bordered">
													  <thead>
													    <tr>
													    </tr>
													  </thead>
													  <tbody>
													  	<tr>
															<td colspan="2"><h4 class="admin-name"><span id="span_name"></span></h4></td>
													    </tr>
													  	<tr>
															<td><b>Id</b></td>
														    <td><span id="span_id"></span></td>
													    </tr>
													    <tr>
															<td><b>Date of Contact</b></td>
														    <td><span id="span_date"></span></td>
													    </tr>
													  	<tr>
															<td><b>Technologies</b></td>
														    <td><span id="span_skills"></span></td>
													    </tr>
													    <tr>
															<td><b>LinkedIn URL</b></td>
														    <td><span id="span_linkedin_url"></span></td>
													    </tr>
													    
													  </tbody>
												</table>
			                               </div>
			                           </div>
			                           <div role="tabpanel" class="tab-pane" id="training">
			                               <div class="tab-padding clearfix">
			                                   <p><span id="span_train_exp"></span></p>
			                               </div>
			                           </div>
			                           <div role="tabpanel" class="tab-pane" id="industry">
			                               <div class="tab-padding clearfix">
			                                   <p><span id="span_indus_exp"></span></p>
			                               </div>
			                           </div>
			                           <div role="tabpanel" class="tab-pane" id="contact_info">
			                               <div class="tab-padding clearfix">
			                                   <table class="table table-bordered">
													  <thead>
													    <tr>
													    </tr>
													  </thead>
													  <tbody>
													    <tr>
															<td><b>Mobile</b></td>
														    <td><span id="span_mobile"></span></td>
													    </tr>
													    <tr>
															<td><b>Email</b></td>
														    <td><span id="span_email"></span></td>
													    </tr>
													  	<tr>
															<td><b>Gender</b></td>
														    <td><span id="span_gender"></span></td>
													    </tr>
													    <tr>
															<td><b>Address</b></td>
														    <td><span id="span_addr1"></span>, <span id="span_addr2"></span></td>
													    </tr>
													    <tr>
															<td><b>City</b></td>
														    <td><span id="span_city"></span></td>
													    </tr>
													    <tr>
															<td><b>State</b></td>
														    <td><span id="span_state"></span></td>
													    </tr>
													    <tr>
															<td><b>Country</b></td>
														    <td><span id="span_country"></span></td>
													    </tr>
													  </tbody>
												</table>
			                               </div>
			                           </div>
			                       </div>
			  </div><!-- end col -->
			  </div>
		    </div>
		  </div>
		</div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>