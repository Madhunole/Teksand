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
	    var table = $('#webinars').removeAttr('width').DataTable( {
	        paging:         true,
	        columnDefs: [
	            { width: 100, targets: 5 },
	            { width: 100, targets: 6 }
	        ],
	        dom: 'Bfrtip',
	        buttons: [
	        	{
	                extend:    'excelHtml5',
	                text:      'Excel Download <i class="fa fa-file-excel-o"></i>',
	                titleAttr: 'Excel'
	            },
	        ],
	        responsive: true
	    } );
	} );


function showDetails(id)
{
    $.ajaxSetup({async:false});
	$.post("/admin/getWebinarsById", {id: "" + id + ""}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
  		$("#admin_webinars").modal('show');

  		$("#span_id").html(obj.id);
	  	$("#span_title").html(obj.title);
	  	$("#span_short_description").html(obj.short_description);
	  	$("#span_category").html(obj.category);
	  	$("#span_start_date").html(obj.start_date);
	  	$("#span_end_date").html(obj.end_date);
	  	$("#span_description").html(obj.content);
	  	$("#span_image").html(obj.images);
		
	},'text');
    
}
function savePublish(value)
{
	var id = $("#span_id").html();
	
	$.ajaxSetup({async:false});
	$.post("/admin/saveWebinarPublish", {id: "" + id + "", value: "" + value + ""}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
  		
  		if(value == "1") {
  			swal("Thank you", "Webinar Published Successfully", "success");
  		 	return false;
  	    }
  		
  		if(value == "0") {
  			swal("Thank you", "Webinar Unpublished Successfully", "success");
  		 	return false;
  	    }
		
	},'text');
}
</script>


<div id="main">
	<div class="visible-md visible-xs visible-sm mobile-menu">
	    <button type="button" data-toggle="offcanvas"><i class="fa fa-bars"></i></button>
	</div>
	<section class="section bgw">
	    <div class="container-fluid">
	        <div class="section-title-2 text-center course-title">
	            <h2>Teksands Webinars</h2>
	            <hr>
	        </div><!-- end section-title -->
			<p class="text-right"><a target="_blank" href="/admin/webinars-post" class="btn btn-primary btn-square btn-sm">Add New</a></p>
			<div class="table-responsive">
        		<table id="webinars" class="table table-striped table-bordered dt-responsive" style="width:100%;font-size:12px !important;vertical-align: middle;">
			        <thead class="thead-dark">
			            <tr>
			                <th>Id</th>
			                <th>Title</th>
			                <th>Category</th>
			                <th>Start Date</th>
			                <th>Status</th>
			                <th>Action</th>
			            </tr>
			        </thead>
			        <tbody>
				        <c:forEach items="${webinarsList}" var="webinar">
				            <tr>
				                <td><c:out value="${webinar.id}" /></td>
				                <td><c:out value="${webinar.title}" /></td>
				                <td><c:out value="${webinar.category}" /></td>
				                <td><fmt:formatDate value="${webinar.start_date}" pattern="dd-MMM-yyyy"/></td>
				                <td><c:out value="${webinar.status}" /></td>
				                <td style="vertical-align: middle !important;"><button type="button" class="btn btn-primary btn-xs" onclick="showDetails(${webinar.id})">View</button></td>
				            </tr>
				        </c:forEach>
			        </tbody>
				</table>
			</div>
			<small><b>Note: Active = 1 & Inactive = 0</b></small>
	    </div><!-- end container -->
	</section><!-- end section -->
</div>

<div id="admin_webinars" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="popup-modal" data-dismiss="modal">&times;</button>
		<h4 class="text-center"><b>Admin - Webinars Details</b></h4>
      </div>
      <div class="modal-body">
		  <div class="container-fluid">
		    <div class="row">
		      <div class="col-md-12">
                <div class="tab-first menu-center">
	                <a href="#" class="btn btn-primary btn-square btn-sm" onclick="savePublish(1)">Publish</a>
	                <a href="#" class="btn btn-primary btn-square btn-sm" onclick="savePublish(0)">UnPublish</a>
                    <ul class="nav nav-tabs" role="tablist" style="border: 0px solid #ddd;">
                        <li role="presentation" class="active"><a href="#general_webinar" aria-controls="general-webinar" role="tab" data-toggle="tab" class="custom-tabs">General</a></li>
                        <li role="presentation"><a href="#webinar_description" aria-controls="webinar-description" role="tab" data-toggle="tab" class="custom-tabs">Description</a></li>
                    </ul>
                    <div class="tab-content tabs-video" style="height: 330px;">
                        <div role="tabpanel" class="tab-pane active" id="general_webinar">
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
											<td><b>Title</b></td>
										    <td><b><span id="span_title"></span></b></td>
									    </tr>
									    <tr>
											<td><b>Short Description</b></td>
										    <td><span id="span_short_description"></span></td>
									    </tr>
									    <tr>
											<td><b>Image Name</b></td>
										    <td><span id="span_image"></span></td>
									    </tr>
									    <tr>
											<td><b>Category</b></td>
										    <td><span id="span_category"></span></td>
									    </tr>
									    <tr>
											<td><b>Start Date</b></td>
										    <td><span id="span_start_date"></span></td>
									    </tr>
									    <tr>
											<td><b>End Date</b></td>
										    <td><span id="span_end_date"></span></td>
									    </tr>
								  </tbody>
							</table>
						
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="webinar_description">
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