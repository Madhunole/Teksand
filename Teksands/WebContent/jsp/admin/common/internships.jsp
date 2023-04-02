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
	    var table = $('#internships').removeAttr('width').DataTable( {
	        columnDefs: [
	            { width: 100, targets: 5 },
	            { width: 100, targets: 6 },
	        ],
	        responsive: true,
	        paging: true
	    } );
	} );
	

function showDetails(id)
{
    $.ajaxSetup({async:false});
	$.post("/admin/getInternshipsById", {id: "" + id + "", }, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
  		$("#admin_internships").modal('show');

  		$("#span_id").html(obj.id);
	  	$("#span_first_name").html(obj.first_name);
	  	$("#span_last_name").html(obj.last_name);
	  	$("#span_mobile").html(obj.mobile);
	  	$("#span_email").html(obj.email);
	  	$("#span_college").html(obj.college);
	  	$("#span_skills").html(obj.skills);
	  	$("#span_resume").html(obj.resume);
	  	$("#span_description").html(obj.description);
	  	$("#span_date").html(obj.date);
	  	$("#anchor_resume").attr("href", "/resources/contributor/"+obj.resume);
		
	},'text');
    
}

function downloadXl()
{
	top.location =  "/internshipdownloadXL";
}
</script>

<div id="main">
	<div class="visible-md visible-xs visible-sm mobile-menu">
	    <button type="button" data-toggle="offcanvas"><i class="fa fa-bars"></i></button>
	</div>
	<section class="section bgw">
	    <div class="container-fluid">
	        <div class="section-title-2 text-center course-title">
	            <h2>Teksands Internship</h2>
	            <hr>
	        </div><!-- end section-title -->
	        <a href="#" onClick="downloadXl();" class="btn btn-primary btn-sm mb-20"><i class="fa fa-file-excel-o"></i> Download Excel</a>
			<div class="table-responsive">
				<table id="internships" class="table table-striped table-bordered dt-responsive" style="width:100%;font-size:12px;">
			        <thead class="thead-dark">
			            <tr>
			                <th>Id</th>
			                <th>Name</th>
			                <th>Mobile</th>
			                <th>Email</th>
			                <th>College</th>
			                <th>Date</th>
			                <th>Action</th>
			            </tr>
			        </thead>
			        <tbody>
				        <c:forEach items="${internship}" var="internship">
				            <tr>
				                <td><c:out value="${internship.id}" /></td>
				                <td><c:out value="${internship.first_name}" />&nbsp;<c:out value="${internship.last_name}" /></td>
				                <td><c:out value="${internship.mobile}" /></td>
				                <td><c:out value="${internship.email}" /></td>
				                <td><c:out value="${internship.college}" /></td>
				                <td><fmt:formatDate value="${internship.date}" pattern="dd-MMM-yyyy"/></td>
				                <td><button type="button" class="btn btn-primary btn-xs" onclick="showDetails(${internship.id})">View</button></td>
				            </tr>
				        </c:forEach>
			        </tbody>
				</table>
			</div>
	    </div><!-- end container -->
	</section><!-- end section -->
</div>


<div id="admin_internships" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="popup-modal" data-dismiss="modal">&times;</button>
		<h4 class="text-center"><b>Admin - Internships Details</b></h4>
      </div>
      <div class="modal-body">
		  <div class="container-fluid">
		    <div class="row">
		      <div class="col-md-12">
                 <div class="tab-first menu-center">
                     <ul class="nav nav-tabs" role="tablist" style="border: 0px solid #ddd;">
                         <li role="presentation" class="active"><a href="#general_intern" aria-controls="general" role="tab" data-toggle="tab" >General</a></li>
                         <li role="presentation"><a href="#intern_description" aria-controls="description" role="tab" data-toggle="tab">Description</a></li>
                     </ul>
                     <div class="tab-content tabs-video" style="height: 330px;">
                         <div role="tabpanel" class="tab-pane active" id="general_intern">
                             <div class="tab-padding clearfix">
                                 <table class="table table-bordered">
								  <thead>
								    <tr>
								    </tr>
								  </thead>
								  <tbody>
									<tr>
										<td><b>Id</b></td>
									    <td><span id="span_id"></span></td>
								    </tr>
								    <tr>
										<td><b>First Name</b></td>
									    <td><span id="span_first_name"></span></td>
								    </tr>
								    <tr>
										<td><b>Last Name</b></td>
									    <td><span id="span_last_name"></span></td>
								    </tr>
								    <tr>
										<td><b>Mobile</b></td>
									    <td><span id="span_mobile"></span></td>
								    </tr>
								    <tr>
										<td><b>Email Id</b></td>
									    <td><span id="span_email"></span></td>
								    </tr>
								    <tr>
										<td><b>College Id</b></td>
									    <td><span id="span_college"></span></td>
								    </tr>
								    <tr>
										<td><b>Skills</b></td>
									    <td><span id="span_skills"></span></td>
								    </tr>
								    <tr>
										<td><b>Date</b></td>
									    <td><span id="span_date"></span></td>
								    </tr>
								  </tbody>
							</table>
							<div class="text-center">
							    <a id="anchor_resume" href="#" class="btn btn-primary btn-xs btn-download" download>Download Resume</a>
							</div>
                             </div>
                         </div>
                         <div role="tabpanel" class="tab-pane" id="intern_description">
                             <div class="tab-padding clearfix">
                                 <p><span id="span_description"></span></p>
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