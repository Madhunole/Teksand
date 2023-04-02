<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.input-group-addon {
    padding: 0 !important;
    background-color: #fff !important;
    border: 0px solid #ccc !important;
}
.form-date {
    width: 132% !important;
}
</style>

<script>
$(function () {
	  $("#datepicker").datepicker({ 
	        autoclose: true, 
	        todayHighlight: true
	  }).datepicker('update', new Date());
	});
$(function () {
	  $("#datepicker2").datepicker({ 
	        autoclose: true, 
	        todayHighlight: true
	  }).datepicker('update', new Date());
	});
function saveWebinars()
{
    var title = $("#webi_title").val();
    var short_description = $("#webi_short_description").val();
    var images = $("#webi_image").html();
    var category = $("#webi_category").val();
    var start_date = $("#webi_start_date").val();
    var start_date = $("#webi_end_date").val();
    var status = "1";
    
    if(title == ""){
    	swal("OOPS!", "Please Enter Title of Webinars", "error");
	 	return false;
    }
    
    if(short_description == "") {
    	swal("OOPS!", "Please Enter Webinar Short Description", "error");
	 	return false;
    }
    
    if(images == "") {
    	swal("OOPS!", "Please Upload Webinar Image", "error");
	 	return false;
    }
    
    console.log("title = " + title);
    
    $.ajaxSetup({async:false});
	$.post("/admin/saveWebinars", {title: "" + title + "", 
		short_description: "" + short_description + "",
		images: "" + images + "",
		category: "" + category + "",
		start_date: "" + start_date + "",
		start_date: "" + start_date + "",
		status: "" + status + "",}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
  			
   			swal("Thank you", "Webinar Posted Successfully", "success");

	   		$("#webi_title").val("");
	   	    $("#webi_short_description").val("");
	   	    $("#webi_image").html("");
	   	    $("#webi_category").val("");
	   	    $("#webi_start_date").val("");
	   	    $("#webi_end_date").val("");
   			
   			return false;
   		} else {
   			swal("OOPS!", "Please Enter Correct Details", "error");
   		 	return false;
   		}
		
	},'text');
}
$(document).ready(function(){
	
	$("#file").change(function() 
	{
		   var filename = $("#file").val(); 
		   if(filename == "")
		   {
			 $("#file").val(""); 
		 	 swal("OOPS!", "Please select the image", "info");
		 	 return false;
		   }
		   var input = this;
		   
		   var formData = new FormData($("#imageform")[0]);	 	
			var flag = false;
		
		$.LoadingOverlay("show");
		
		$.ajaxSetup({async:true});
		$.ajax({
		    url: '/admin/uploadWebinarsImage',
		    type: 'POST',
		    data: formData,
		    async: true,
		    cache: false,
		    contentType: false,
		    processData: false,
		    beforeSend: function( xhr ) {

		    },
		    success: function (response) {
		    	$.LoadingOverlay("hide");
		    	var obj = jQuery.parseJSON(response);
				if(obj.status == 400){
					swal("OOPS!", obj.msg, "info");
					flag = true;
					return false;
				}
				var img_path = $.trim(obj.msg);
		        $("#webi_image").html(img_path);
		    }
		  });
	});
	
});
</script>

<div id="main">
	<div class="visible-md visible-xs visible-sm mobile-menu">
	    <button type="button" data-toggle="offcanvas"><i class="fa fa-bars"></i></button>
	</div>
	<section class="section bgw">
	    <div class="container-fluid">
	        <div class="section-title-2 text-center course-title">
	            <h2>Teksands Webinar Post</h2>
	            <hr>
	        </div><!-- end section-title -->
			<div id="sidebar1" class="col-lg-10 col-md-offset-1 col-md-12">
               <div class="widget clearfix">
                   <div class="member-profile">
                       <div class="edit-profile loginform">
                               <div class="form-group">
                                   <label>Title</label>
                                   <input type="text" id="webi_title" class="form-control" placeholder="Title">
                               </div>
                               <div class="form-group">
                                   <label>Short Description</label>
                                   <textarea class="form-control" id="webi_short_description" placeholder="Short Description"></textarea>
                               </div>
                               <div class="row">
								  <div class="col-md-12">
									  	<label for="files">Upload Webinar Image</label>
										<form id="imageform" role="form" method="post" enctype="multipart/form-data">
											<input type="hidden" name="txt_resume_mobile" id="txt_resume_mobile" value="" />
											<input type="file" id="file" name="file" class="btn btn-default btn-block" />
											<p id="webi_image"></p>
										</form>
									</div>
                              	</div>
                              	<div class="form-group">
                              		<div class="row">
                              			<div class="col-md-4">
		                                   <label>Category</label>
		                                   <input type="text" class="form-control" id="webi_category" placeholder="category">
	                                    </div>
	                                    <div class="col-md-4">
									    	<div class="form-group">
										    	<label>Start Date</label>
										      	<div id="datepicker" class="input-group date" data-date-format="mm-dd-yyyy">
												    <input type="text" class="form-control form-date" id="webi_start_date">
												    <span class="input-group-addon"></span>
												</div>
											</div>
									    </div>
									    <div class="col-md-4">
									    	<label>End Date</label>
									    	<div id="datepicker2" class="input-group date" data-date-format="mm-dd-yyyy">
											    <input type="text" class="form-control form-date" id="webi_end_date">
											    <span class="input-group-addon"></span>
											</div>
									    </div>
                              		</div>
                               </div>
                               <p class="text-center"><button type="submit" class="btn btn-primary btn-square" onclick="saveWebinars()">Post Webinar</button></p>
                       </div><!-- end edit profile -->
                   </div><!-- end team-member -->
               </div>
           </div><!-- end right -->
	    </div><!-- end container -->
	</section><!-- end section -->
</div>