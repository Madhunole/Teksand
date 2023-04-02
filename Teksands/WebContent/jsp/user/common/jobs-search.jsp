<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
</style>

<script>
var jobsId = 0;

function showPopup(id)
{
	jobsId = id;
	$('#job-apply').modal('show');
}
$(document).ready(function(){
	
	$("#file").change(function() 
	{
		var job_mobile = $("#job_mobile").val();
	   	if(job_mobile == "")
		   {
			 $("#file").val(""); 
		 	 swal("OOPS!", "Please fill the form after you upload the resume", "info");
		 	 return false;
		   }
	   $("#txt_resume_mobile").val(job_mobile);
	   var filename = $("#file").val(); 
	   if(filename == "")
	   {
		 $("#file").val(""); 
	 	 swal("OOPS!", "Please select the CV document", "info");
	 	 return false;
	   }
	   var input = this;
	 	
	 	var formData = new FormData($("#imageform")[0]);	 	
		var flag = false;
		
		$.LoadingOverlay("show");
		
		$.ajaxSetup({async:false});
		$.ajax({
		    url: '/uploadCVDocument',
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
		        $("#para_resume").html(img_path);
		    }
		  });
		
		if(flag)
		{
			return false;
		}
	});
	
});
function mobileChange()
{
	var job_mobile = $("#job_mobile").val();
   if(job_mobile == "")
   {
	   $("#file").val(""); 
 	 swal("OOPS!", "Please fill the form after you upload the resume", "info");
 	 return false;
   }
   $("#txt_resume_mobile").val(job_mobile);
}
function saveJobs()
{
    var name = $("#job_name").val();
    var mobile = $("#job_mobile").val();
    var email = $("#job_email").val();
    var summary = $("#job_summary").val();
    var resume = $("#para_resume").html();

    if(name == ""){
    	swal("OOPS!", "Please Enter Name", "error");
	 	return false;
    }

    if(mobile == "") {
    	swal("OOPS!", "Please Enter Your Mobile", "error");
	 	return false;
    }
    
    if(email == "") {
    	swal("OOPS!", "Please Enter Your Email", "error");
	 	return false;
    }
    
    if(summary == "") {
    	swal("OOPS!", "Please Enter Your Profilr Summary", "error");
	 	return false;
    }
    
    if(!isEmail(email)) {
    	swal("OOPS!", "Please Enter Valid Email", "error");
	 	return false;
    }
    
    console.log("name = " + name);
    console.log("mobile = " + mobile);
    console.log("email = " + email);
    console.log("summary = " + summary);
    
    $.ajaxSetup({async:false});
	$.post("/saveJobs", {name: "" + name + "", 
		mobile: "" + mobile + "",
		email: "" + email + "",
		summary: "" + summary + "",
		resume: "" + resume + "",
		jobsId: "" + jobsId + "", }, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
  			
   			swal("Thank you for contacting us", "We have received your enquiry and will respond to you shortly", "success");
   			
   			$('#job-apply').modal('toggle');
   		    
   		    $("#job_name").val("");
   		    $("#job_mobile").val("");
   		    $("#job_email").val("");
   		    $("#job_summary").val("");
   			
          	return false;
          	
   		} else {
   			swal("OOPS!", "Please Enter Correct Details", "error");
   		 	return false;
   		}
		
	},'text');
}

function isEmail(email) {
	  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  return regex.test(email);
}

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
	 	
	 	var formData = new FormData($("#imageform")[0]);	 	
		var flag = false;
		
		$.LoadingOverlay("show");
		
		$.ajaxSetup({async:false});
		$.ajax({
		    url: '/uploadResume',
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
	
});
function mobileChangeDetails()
{
	var job_mobile = $("#job_details_mobile").val();
   if(job_mobile == "")
   {
	   $("#file").val(""); 
 	 swal("OOPS!", "Please fill the form after you upload the resume", "info");
 	 return false;
   }
   $("#txt_resume_mobile").val(job_mobile);
}
function saveJobsDetails()
{
    var name = $("#job_details_name").val();
    var mobile = $("#job_details_mobile").val();
    var email = $("#job_details_email").val();
    var summary = "Message from Jobs Listing Page Sidebar";
    var resume = $("#job_resume").html();
    var technical_skills = $("#job_technical_skill").val();
    var year_passing = $("#job_year_passing").val();

    if(name == ""){
    	swal("OOPS!", "Please Enter Name", "error");
	 	return false;
    }

    if(mobile == "") {
    	swal("OOPS!", "Please Enter Your Mobile", "error");
	 	return false;
    }
    
    if(email == "") {
    	swal("OOPS!", "Please Enter Your Email", "error");
	 	return false;
    }
    
    if(technical_skills == "") {
    	swal("OOPS!", "Please Enter Your Technical Skilss", "error");
	 	return false;
    }
    
    if(year_passing == "") {
    	swal("OOPS!", "Please Enter Your Year of Passings", "error");
	 	return false;
    }
    
    if(!isEmail(email)) {
    	swal("OOPS!", "Please Enter Valid Email", "error");
	 	return false;
    }
    
    console.log("name = " + name);
    console.log("mobile = " + mobile);
    console.log("email = " + email);
    console.log("summary = " + summary);
    console.log("technical_skills = " + technical_skills);
    console.log("year_passing = " + year_passing);
    
    $.ajaxSetup({async:false});
	$.post("/saveJobsDetails", {name: "" + name + "", 
		mobile: "" + mobile + "",
		email: "" + email + "",
		summary: "" + summary + "",
		year_passing: "" + year_passing + "",
		technical_skills: "" + technical_skills + "",
		resume: "" + resume + "",}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
  			
   			swal("Thank you for contacting us", "We have received your enquiry and will respond to you shortly", "success");
   			
   		    $("#job_details_name").val("");
   		    $("#job_details_mobile").val("");
   		    $("#job_details_email").val("");
   		 	$("#job_year_passing").val("");
   			$("#job_year_passing").val("");
   			
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
	               <c:forEach items="${jobsearchList}" var="jobs">
		               <div class="content">
		                   <div class="col-md-12 col-sm-12 mob20 boxes text-left withcircle-custom withborder">
				                   <div class="col-md-8 col-sm-12">
					                      <h3 class="job-heading"><a href="/jobs/${jobs.jobs_url}" title=""><c:out value="${jobs.role_name}" /></a></h3>
					                      <p style="margin:10px 0 0 0;" class="authorbox h4"><c:out value="${jobs.company_name}" /></p>
					                      <div class="large-post-meta" style="margin: 10px 0 10px 0px;">
					                         <span class="avatar"><i class="fa fa-suitcase"></i> <c:out value="${jobs.experience}" /></span>
					                         <small>&#124;</small>
					                         <span><i class="fa fa-inr"></i> 
						                         <c:choose>
								            		<c:when test="${jobs.min_salary_range == '0' && jobs.max_salary_range == '0'}">
								            			<span>Not Disclosed</span>
								            		</c:when>
								            		<c:when test="${not empty jobs.min_salary_range && not empty jobs.max_salary_range}">
								            			<c:out value="${jobs.min_salary_range}" /> - <c:out value="${jobs.max_salary_range}" /> <span>(lakhs)</span>
								            		</c:when>
								            		<c:otherwise>
								            			<span>Not Disclosed</span>
								            		</c:otherwise>
								            	</c:choose>
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
                        <div class="col-md-12">
                        	<input type="text" name="name" id="job_details_name" class="form-control" placeholder="Name"> 
                        	<input type="text" name="mobile" id="job_details_mobile" class="form-control" placeholder="Phone" required onchange="mobileChangeDetails()">
                        	<input type="text" name="email" id="job_details_email" class="form-control" placeholder="Email">
                        	<input type="text" name="technical_skill" id="job_technical_skill" class="form-control" placeholder="Technical Skills">
                        	<input type="number" name="year_passing" id="job_year_passing" class="form-control" placeholder="Year of Passing">
                        	<div class="row">
                        		<div class="col-md-12">
								<label for="files">Upload Your Current CV</label>
								<form id="imageform" role="form" method="post" enctype="multipart/form-data">
									<input type="hidden" name="txt_resume_mobile" id="txt_resume_mobile" value="" />
									<input type="file" id="job_file" name="job_file" class="btn btn-default btn-block" />
									<p id="job_resume"></p>
								</form>
							</div>
                        	</div>
                        	<button type="submit" value="SEND" class="button button--wayra btn-block btn-square" onclick="saveJobsDetails()"> Contact Now</button>
                        </div>
                    </div>
                </div>
            	<div class="widget clearfix">
                    <div class="postpager mr-1">
						<img alt="" src="/resources/images/300x250_ad_image.png" class="img-responsive">
                    </div><!-- end postpager -->
                </div><!-- end widget -->
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
                                        <img alt="" src="/resources/images/jobs/logos/${latestJobs.company_logo}" class="img-responsive alignleft">
                                        <h4><c:out value="${latestJobs.role_name}" /></h4>
                                        <p><c:out value="${fn:substring(latestJobs.short_description,0,100)}" />. <a href="/jobs/${latestJobs.jobs_url}" class="btn btn-primary btn-xs">View Details</a></p>
	                                </div>  
	                            </li>
							</c:forEach>                            
                        </ul>   
                    </div><!-- end postpager -->
                </div><!-- end widget -->
				<div class="widget clearfix">
                    <div class="postpager mr-1">
						<img alt="" src="/resources/images/300x250_ad_image.png" class="img-responsive">
                    </div><!-- end postpager -->
                </div><!-- end widget -->
            </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end section -->
