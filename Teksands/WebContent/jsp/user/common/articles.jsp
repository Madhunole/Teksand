<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
function saveContactsfromBlog()
{
    var name = $("#blog_name").val();
    var email = $("#blog_email").val();
    var mobile = $("#blog_phone").val();
    var company = "";
    var requirements = $("#blog_message").val();
    
    if(name == ""){
    	swal("OOPS!", "Please Enter Name", "error");
	 	return false;
    }
    
    if(email == "") {
    	swal("OOPS!", "Please Enter Email", "error");
	 	return false;
    }
    var emaillength = email.length;
    if(emaillength > 100) {
    	swal("OOPS!", "Maximum allowed is 100 characters", "error")
   	    return false;
    }
    
    if(mobile == "") {
    	swal("OOPS!", "Please Enter Mobile", "error");
	 	return false;
    }
	var mobilelength = mobile.length;
    
    if(mobilelength < 10)
    {
    	swal("OOPS!", "Minimum digits allowed for a Mobile number is 10", "error")
   	    return false;	
    }
    if(mobilelength > 16)
    {
    	swal("OOPS!", "Maximum digits allowed for a Mobile number is 16", "error")
   	    return false;	
    }
    if(requirements == "") {
    	swal("OOPS!", "Please Enter Message", "error");
	 	return false;
    }
    
    if(!isEmail(email)) {
    	swal("OOPS!", "Please Enter Valid Email", "error");
	 	return false;
    }
    
    console.log("name = " + name);
    console.log("email = " + email);
    console.log("mobile = " + mobile);
    console.log("company = " + company);
    console.log("requirements = " + requirements);
    
    $.ajaxSetup({async:false});
	$.post("/saveContacts", {name: "" + name + "", 
		email: "" + email + "",
		mobile: "" + mobile + "", 
		company: "" + company + "",
		requirements: "" + requirements + "",}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
   			swal("Thank you for contacting us", "We have received your enquiry and will respond to you shortly", "success");
   			
   		 	$("#blog_name").val("");
   	    	$("#blog_email").val("");
   	   	 	$("#blog_phone").val("");
   	    	$("#blog_message").val("");
   		    
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
function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    console.log(charCode);
    if (charCode != 43 &&  charCode > 31
    		&& (charCode < 48 || charCode > 57) && (charCode != 32 && charCode != 0) )
        return false;

    return true;
}
</script>
<script type="text/javascript" src="https://platform-api.sharethis.com/js/sharethis.js#property=63109be5a4cf5e001279b916&product=inline-share-buttons" async="async"></script>
<script>
$(document).ready(function() {
    var dialogShown = $.cookie('dialogShown');
    if (!dialogShown) {
        $(window).load(function(){
        	$('#home_popup').modal('show');
            $.cookie('dialogShown', 1);
        });
    }
    else {
        $("#home_popup").hide();
    }
});
</script>


<div class="page-title bgg">
    <div class="container clearfix">
       <div class="pull-left">
           <div class="bread">
               <ol class="breadcrumb">
                   <li><a href="#">Home</a></li>
                   <li class="active">Blog</li>
               </ol>
           </div><!-- end bread -->
       </div><!-- /.pull-right -->
    </div>
</div><!-- end page-title -->

<section class="section">
    <div class="container">
        <div class="section-title-2 text-center">
            <h1 class="home-h1">Teksands Latest Articles</h1>
            <hr>
       </div><!-- end section-title -->
   </div><!-- end container -->
</section><!-- end section -->


<section class="section">
    <div class="container">
        <div class="row">
            <div id="post-content" class="col-md-8 col-sm-12">
                <div class="content">
					<c:forEach items="${articleList}" var="article">
                		<div class="row post-micro clearfix">
	                        <div class="col-md-4">
	                            <div class="post-media entry">
	                            <c:choose>
	                              <c:when test="${article.photo}">
	                              <img src="/resources/images/articles/Understanding-The-Goto-Statement-In-Python/big_blog_01.jpg" alt="" class="img-responsive" style="width: 100% !important; height: 190px !important;">							     	
								  </c:when>										  					  
								  <c:otherwise>
								 	<img src="/resources/images/articles/<c:out value="${article.title_folder}"></c:out>/<c:out value="${article.photo}"></c:out>" alt="" class="img-responsive" style="width: 100% !important; height: 190px !important;">
								  </c:otherwise>
								</c:choose>	                                
	                            </div><!-- end post-media -->
	                        </div><!-- end col -->
	                        <div class="col-md-8">
	                            <h3 class="entry-title"><a href="/shortreads/${article.blog_url}" title=""><c:out value="${article.title}" /></a></h3>
	                            <!-- <div class="post-sharing">
									<div class="sharethis-inline-share-buttons"></div>
	                            </div>end post-sharing -->
	                            <p class="mt-10"><c:out value="${fn:substring(article.short_content,0,120)}" />...</p>
	                            <a href="/shortreads/${article.blog_url}" title="" class="btn btn-primary btn-sm">Continue Reading</a>
	                        </div><!-- end col -->
	                    </div><!-- end post-padding -->
                    </c:forEach>
                </div><!-- end content -->
			
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
            </div><!-- end col -->
            <div id="sidebar" class="col-md-4 col-sm-12 custom-sidebar">
				<div>
                    <div class="big-title">
                        <h2 class="related-title">
                            <span>Sign up for Updates</span>
                        </h2>
                    </div>
                    <div class="contact_form row">
                            <div class="col-md-12">
                            <input type="text" name="name" id="blog_name" class="form-control" placeholder="Name" maxlength="100" onkeydown="return /[a-z ]/i.test(event.key)"> 
                            <input type="text" name="email" id="blog_email" class="form-control" placeholder="Email" maxlength="100"> 
                            <input type="text" name="mobile" id="blog_phone" class="form-control" placeholder="Phone" onkeypress='return isNumberKey(event);'> 
                            <textarea class="form-control" name="comments" id="blog_message" rows="6" placeholder="Message Below"></textarea>
                            <button type="submit" value="SEND" class="button button--wayra btn-block btn-square" onclick="saveContactsfromBlog()"> Contact Now</button>
                            </div>
                    </div>
                </div>
                
                <div class="widget clearfix">
                    <div class="big-title">
                        <h2 class="related-title">
                            <span>Recent Articles</span>
                        </h2>
                    </div><!-- end big-title -->
                    <div class="postpager liststylepost">
                        <ul class="pager">
                        	<c:forEach items="${LatestArticles}" var="article">
	                            <li>
	                                <div class="post">
	                                    <a href="/shortreads/${article.blog_url}">
	                                        <img alt="" src="/resources/images/articles/${article.title_folder}/${article.photo}" class="img-responsive alignleft" style="max-width: 80px; height: 80px !important;">
	                                        <h4><c:out value="${article.title}" /></h4>
	                                        <p class="mt-10"><c:out value="${fn:substring(article.short_content,0,60)}" />...</p>
	                                    </a>
	                                </div>  
	                            </li>
                             </c:forEach>
                        </ul>   
                    </div><!-- end postpager -->
                </div><!-- end widget -->
                <div class="widget clearfix">
                    <div class="big-title">
                        <h2 class="related-title">
                            <span>Upcoming Courses</span>
                        </h2>
                    </div><!-- end big-title -->
                    <div class="postpager liststylepost">
                        <ul class="pager">
                            <li>
                                <div class="post">
                                    <a href="/courses/deep-learning-and-cnn-for-image-processing">
                                        <img alt="" src="/resources/landing-pages/images/ml.png" class="img-responsive alignleft">
                                        <h4>Deep Learning - CNN for Image Processing using TensorFlow and Keras</h4>
                                        <small>View Course</small>
                                    </a>
                                </div>  
                            </li>
                            <li>
                                <div class="post">
                                    <a href="/courses/pgp-data-science">
                                        <img alt="" src="/resources/landing-pages/images/dspm.png" class="img-responsive alignleft">
                                        <h4>Post Graduate Program on Applied Data Science with Deep Learning and Specialisation</h4>
                                        <small>View Course</small>
                                    </a>
                                </div>  
                            </li>
                            <li>
                                <div class="post">
                                    <a href="/courses/dev-ops">
                                        <img alt="" src="/resources/landing-pages/images/devops.png" class="img-responsive alignleft">
                                        <h4>DevOps Mastery Program</h4>
                                        <small>View Course</small>
                                    </a>
                                </div>  
                            </li>
                        </ul>   
                    </div><!-- end postpager -->
                </div><!-- end widget -->
            </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end section -->