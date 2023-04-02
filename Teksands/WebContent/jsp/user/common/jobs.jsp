<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>

<style>
.withborder {
    padding: 15px 15px 15px 15px !important;
    margin-bottom: 20px !important;
}
.job-button {
	text-align: center;
	padding-top: 50px;
}
@media (max-width:1023px) {
	.job-button {
		padding-top: 20px !important;
	}	
}
.mr-1 {
    margin-left: 30px;
}
.big-title {
    margin-top: 0 !important;
}
p.authorbox.h4 {
    font-size: 14px;
    font-weight: 700;
    color: #3ca1db !important;
}
.text-white {
    color: #fff;
}
.help-block {
    color: #FF0000 !important;
}
.form-control-feedback {
	width: 56px !important;
    line-height: 106px !important;
}
.contact_form .form-control {
    margin-bottom: 0 !important;
}
.has-feedback label ~ .form-control-feedback {
    top: 0 !important;
}
</style>

<script>
$(document).ready(function(){
	
	$("#job_file").change(function() 
	{
		var job_mobile = $("#job_details_mobile").val();
		if(job_mobile == "")
		   {
			 $("#file").val(""); 
		 	 swal("OOPS!", "Please fill the form after you upload the resume", "info");
		 	 return false;
		   }
	   $("#txt_resume_mobile").val(job_mobile);
	   var filename = $("#job_file").val(); 
	   if(filename == "")
	   {
		 $("#file").val(""); 
	 	 swal("OOPS!", "Please select the CV document", "info");
	 	 return false;
	   }
	   var input = this;
	 	
	 	var formData = new FormData($("#sideForm_1")[0]);	 	
		var flag = false;
		
		$.LoadingOverlay("show");
		
		$.ajaxSetup({async:false});
		$.ajax({
		    url: '/bootcamp/uploadCandidateCVDocument',
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
		        $("#job_resume").html(img_path);
		    }
		  });
		
		if(flag)
		{
			return false;
		}
	});
	
	$('#sideForm_1').validate({
		rules: {
			job_details_name: {
				required: true,
				minlength: 2,
				maxlength: 100,
			},
			job_details_email: {
				required: true,
				email: true,
				maxlength: 100,
			},
			job_details_mobile: {
				required: true,
				minlength: 10,
				maxlength: 16,
			},
			job_technical_skill: {
				required: true,
				minlength: 2
			},
			job_file: {
				required: true,
			},
	    },
	    messages: {
	    	job_details_name: {
		    	required: "Please Enter Your Name",
		    	maxlength: "Maximum allowed is 100 characters"
	    	},
			job_details_email: {
				required: "Please Enter Your Email",
		    	email: "Please Enter Valid Email",
		    	maxlength: "Maximum allowed is 100 characters"
			},
			job_details_mobile: {
				required: "Please Enter Your Mobile",
				minlength: "Minimum digits allowed for a Mobile number is 10",
				maxlength: "Maximum digits allowed for a Mobile number is 16"
			},
			job_technical_skill: "Please Enter Technical Skils",
			job_file: "Please Upload Your Resume",
		},
		
		errorElement: "div",
		
		errorPlacement: function ( error, element ) {
			
			error.addClass( "help-block" );
			
			element.parents( ".form-validate" ).addClass( "has-feedback" );
			
			if(element.prop( "type" ) === "checkbox"){
				var ele = element.parent("div");
				error.insertAfter( ele.parent("div") );
			}else if(element.prop( "type" ) === "radio"){
				error.insertAfter( element.parent( ".form-radio" ) );
			}else{
				error.insertAfter( element );
			}
			
		},
		
		success: function ( label, element ) {
			if ( !$( element ).next( "span" )[ 0 ] ) {
				
			}
		},
		
		highlight: function ( element, errorClass, validClass ) {
			$( element ).parents( ".form-validate" ).addClass( "has-error" ).removeClass( "has-success" );
			
		},
		
		unhighlight: function ( element, errorClass, validClass ) {
			$( element ).parents( ".form-validate" ).addClass( "has-success" ).removeClass( "has-error" );
			$( element ).next( "span" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
		},		
	    
		submitHandler: function () {
			saveJobsDetails();
	    }
	});
});

function isEmail(email) {
	  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  return regex.test(email);
}

function saveJobsDetails()
{
    var name = $("#job_details_name").val();
    var mobile = $("#job_details_mobile").val();
    var email = $("#job_details_email").val();
    var technical_skills = $("#job_technical_skill").val();
    var summary = "Message from Jobs Listing Page Sidebar";
    var resume = $("#job_resume").html();
    
    $.ajaxSetup({async:false});
	$.post("/saveJobsDetails", {name: "" + name + "", 
		mobile: "" + mobile + "",
		email: "" + email + "",
		summary: "" + summary + "",
		technical_skills: "" + technical_skills + "",
		resume: "" + resume + "",}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
  			
   			swal("Thank you for your Application.", " We will revert soon", "success");
   			
   		    $("#job_details_name").val("");
   		    $("#job_details_mobile").val("");
   		    $("#job_details_email").val("");
   		 	$("#job_technical_skill").val("");
   		 	
   		 	var input = $("#sideForm_1").find("input[name=job_file]");
   			$("#job_resume").html("");
   			input.replaceWith(input.val(''));
   		 	
          	return false;
          	
   		} else {
   			swal("OOPS!", "Please Enter Correct Details", "error");
   		 	return false;
   		}
		
	},'text');
}

function searchJobs()
{
    var keyword = $("#txt_search").val();
    if(keyword == "")
    {
    	swal("OOPS!", "Please Enter Keywords", "error");
    	return false;
    }
    document.location.href = "/jobs/search?keyword="+keyword;
} 
function checkIfEmailAlreadyExistOrNot()
{
	var can_email = $("#job_details_email").val();
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:true});
	$.post("/checkIfEmailAlreadyExistOrNot", {email : "" + can_email + ""}, function(data)       	   
	{
		$.LoadingOverlay("hide");
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		if(obj.status_code == 400)
		{
			swal("Email Already Exist", "", "error");
		
			$("#job_details_email").val("");
	 	    return false;
		}
		
	}, "text");
}
function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    console.log(charCode);
    if (charCode != 43 &&  charCode > 31
    		&& (charCode < 48 || charCode > 57) && (charCode != 32 && charCode != 0) )
        return false;

    return true;
}
</script>

<div class="page-title bgg">
    <div class="container clearfix">
       <div class="pull-left">
           <div class="bread">
               <ol class="breadcrumb">
                   <li><a href="#">Home</a></li>
                   <li class="active">Jobs</li>
               </ol>
           </div><!-- end bread -->
       </div><!-- /.pull-right -->
    </div>
</div><!-- end page-title -->

<section class="section">
    <div class="container">
        <div class="section-title-2 text-center">
            <h1 class="home-h1">Open Jobs</h1>
            <hr>
        </div><!-- end section-title -->
    </div><!-- end container -->
</section><!-- end section -->

<section class="section bgw">
    <div class="container">
        <div class="row">
            <div id="post-content" class="col-md-8 col-sm-12">
	            <div class="content">
	              <c:forEach items="${jobsList}" var="jobs">
		               <div class="content">
		                   <div class="col-md-12 col-sm-12 mob20 boxes text-left withcircle-custom withborder">
				                   <div class="col-md-8 col-sm-12">
					                      <h3 class="job-heading"><a href="/jobs/${jobs.jobs_url}" title=""><c:out value="${jobs.role_name}" /></a></h3>
					                      <p style="margin:10px 0 0 0;" class="authorbox h4"><c:out value="${jobs.company_name}" /></p>
					                      <div class="large-post-meta" style="margin: 10px 0 10px 0px;">
					                         <span class="avatar"><i class="fa fa-suitcase"></i> <c:out value="${jobs.experience}" /></span>
					                         <small>&#124;</small>
					                         <span><i class="fa fa-inr"></i> 
						                         <span>Not Disclosed</span>
					                         </span>
					                         <small>&#124;</small>
					                         <span><i class="fa fa-map-marker"></i> <c:out value="${jobs.location}" /></span>
					                     </div><!-- end meta -->
					                      <p style="margin:0;"><c:out value="${jobs.short_description}" /></p>
					                      <p style="margin:10px 0 0 0;"><b>Skills Required:</b> <c:out value="${jobs.skills_required}" /> | <b>Date Posted:</b> <fmt:formatDate value="${jobs.date}" pattern="dd-MMM-yyyy"/></p>
									</div>
									<div class="col-md-4 col-sm-12 text-right" style="">
										<a href="/jobs/${jobs.jobs_url}" class="btn btn-primary btn-square">View Job Details</a>
									</div>
							</div><!-- end col -->
		               </div><!-- end content -->
		           </c:forEach>
	            </div><!-- end col -->
	            <nav class="clearfix">
	            <ul class="pagination">
					<c:choose>
						<c:when test="${pageid eq 1}">
							<li class="page-item"><a href="<c:url value="?pageid=${pageid - 1}"/>" class="next page-numbers" aria-label="Previous"><i class="fa fa-arrow-left" aria-hidden="true"></i></a></li>
							<!-- <li class="page-item"><a href="#" class="next page-numbers" aria-label="Previous"><i class="bx bx-chevron-left" aria-hidden="true"></i></a></li> -->
						</c:when>
						<c:otherwise>
							<li class="page-item"><a href="<c:url value="?pageid=${pageid - 1}"/>" class="next page-numbers" aria-label="Previous"><i class="fa fa-arrow-left" aria-hidden="true"></i></a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="${beginPaginatorId}" end="${endPaginatorId}" step="1" varStatus="loop">
						<c:choose>
	  						<c:when test="${loop.index == pageid}">
	  							<li class="page-item active"><a href="<c:url value="?pageid=${loop.index}"/>" class="next page-numbers"><c:out value="${loop.index}"/> <span class="sr-only">(current)</span></a></li>
	  						</c:when>
	 						 	<c:otherwise>
	 								<li class="page-item"><a href="<c:url value="?pageid=${loop.index}"/>" class="next page-numbers"><c:out value="${loop.index}"/> <span class="sr-only">(current)</span></a></li>
			     			</c:otherwise>
						</c:choose>
					</c:forEach>
						<c:choose>
							<c:when test="${pageid eq blogsPageCount}">
								<li class="page-item disabled"><a href="#" class="next page-numbers" aria-label="Next"><i class="fa fa-arrow-right" aria-hidden="true"></i></a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a href="<c:url value="?pageid=${pageid + 1}"/>" class="next page-numbers" aria-label="Next"><i class="fa fa-arrow-right" aria-hidden="true"></i></a></li>
							</c:otherwise>
						</c:choose>
	            	</ul>
	            </nav>
            </div>

            <div id="sidebar" class="col-md-4 col-sm-12 custom-sidebar">
            	<div class="widget clearfix">
            		<div class="big-title">
                        <h2 class="related-title">
                            <span>Search Jobs</span>
                        </h2>
                    </div>
					<div class="input-group">
					  <input aria-describedby="basic-addon2" placeholder="Enter keyword to search" class="form-control" id="txt_search" type="text" value="<c:out value="${keyword}"></c:out>">
					  <span id="basic-addon1" class="input-group-addon btn-primary text-white" style="cursor:pointer;" onclick="searchJobs()">Search</span>
					</div>
				</div>
            	<div class="widget clearfix">
                    <div class="big-title">
                        <h2 class="related-title">
                            <span>Submit your CV</span>
                        </h2>
                    </div>
                    <div class="contact_form row">
                    	<form id="sideForm_1" role="form" method="post" enctype="multipart/form-data">
	                        <div class="col-lg-12">
	                        	<div class="form-validate form-group">
	                        		<input type="text" name="job_details_name" id="job_details_name" class="form-control" placeholder="Name" onkeydown="return /[a-z ]/i.test(event.key)">
	                        	</div> 
	                        	<div class="form-validate form-group">
	                        		<input type="text" name="job_details_mobile" id="job_details_mobile" class="form-control" placeholder="Phone" onkeypress='return isNumberKey(event);'>
	                        	</div>
	                        	<div class="form-validate form-group">
	                        		<input type="text" name="job_details_email" id="job_details_email" class="form-control" placeholder="Email" onchange="checkIfEmailAlreadyExistOrNot()">
	                        	</div>
	                        	<div class="form-validate form-group">
	                        		<textarea class="form-control" id="job_technical_skill" name="job_technical_skill" rows="4" placeholder="List your key Skills (separated by comma) *" required></textarea>
	                        	</div>
	                        	<div class="row">
	                        		<div class="col-md-12 form-validate">
										<label for="files">Upload Your Current CV</label>
										<input type="hidden" name="txt_candidate_mobile" id="txt_resume_mobile" value="" />
										<input type="file" id="job_file" name="job_file" class="btn btn-default btn-block" />
										<p id="job_resume"></p>
									</div>
	                        	</div>
	                        	<button type="submit" value="submit" id="submit" class="button button--wayra btn-block btn-square"> Submit</button>
	                        </div>
                        </form>
                    </div>
                </div>
            	<div class="widget clearfix">
                    <div class="big-title">
                        <h2 class="related-title">
                            <span>Recent Jobs</span>
                        </h2>
                    </div><!-- end big-title -->
                    <div class="postpager liststylepost">
                        <ul class="pager">
	                        <c:forEach items="${latestJobs}" var="latestJobs">
	                            <li>
	                                <div class="post">
                                        <h4><c:out value="${latestJobs.role_name}" /> - <a href="/jobs/${latestJobs.jobs_url}" class="btn btn-primary btn-xs">View Details</a></h4>
	                                </div>  
	                            </li>
							</c:forEach>                            
                        </ul>   
                    </div><!-- end postpager -->
                </div><!-- end widget -->
            </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end section -->

<div class="modal fade" id="job-apply" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
	        	<h5 class="modal-title" id="exampleModalLongTitle">Submit your application</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
        		</button>
      		</div>
	      	<div class="modal-body">
		        <div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="member-profile">
							<div class="row profile-badges contact-rm">
								<div class="contact_form">
									<div class="row">
										<div class="col-md-12">
											<input type="text" id="job_name" class="form-control" placeholder="Name *" required>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<input type="text" class="form-control" id="job_mobile" placeholder="Mobile *" required onchange="mobileChange()">
										</div>
										<div class="col-md-6">
											<input type="text" class="form-control" id="job_email" placeholder="Email *" required>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<textarea class="form-control" name="comments" id="job_summary" rows="4" placeholder="Write Your Profile Summary *" required></textarea>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<label for="files">Upload Your Current CV</label>
										<form id="imageform" role="form" method="post" enctype="multipart/form-data">
											<input type="hidden" name="txt_resume_mobile" id="txt_resume_mobile" value="" />
											<input type="file" id="file" name="file" class="btn btn-default btn-block" />
											<p id="para_resume"></p>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		    <div class="modal-footer">
		    	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary" onclick="saveJobs()">Apply</button>
			</div>
		</div>
  	</div>
</div>
