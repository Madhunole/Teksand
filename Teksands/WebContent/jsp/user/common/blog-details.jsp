<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-6300b4015e0a635c"></script>

<script>

function saveContactsfromBlog()
{
    var name = $("#art_name").val();
    var email = $("#art_email").val();
    var mobile = $("#art_phone").val();
    var company = "";
    var requirements = $("#art_message").val();
    
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
   		    
   		 	$("#art_name").val("");
   	    	$("#art_email").val("");
   	   	 	$("#art_phone").val("");
   	    	$("#art_message").val("");
   		    
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
<script type="text/javascript" src="https://platform-api.sharethis.com/js/sharethis.js#property=6305bd0faf6eee0019fb987c&product=inline-share-buttons" async="async"></script>
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
        <!-- <div class="title-area pull-left">
            <h2>Blog Single <small>Listed below our awesome blog posts</small></h2>
        </div> --><!-- /.pull-right -->
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

<section class="section bgw">
    <div class="container">
        <div class="row">
            <div id="post-content" class="col-md-8 col-sm-12">
                <div class="single-content">
                    <div class="row post-micro big-post clearfix">
                        <div class="col-md-12">
                            <div class="large-post-meta">
                                <span class="avatar"><img src="" alt="" class="img-circle">Teksands</span>
                                <small>&#124;</small>
                                <span><i class="fa fa-clock-o"></i> <fmt:formatDate value="${blog.create_date}" pattern="dd-MMM-yyyy"/></span>
                                <small class="hidden-xs">&#124;</small>
                                <small class="hidden-xs">&#124;</small>
                                <span class="hidden-xs"><a href="#"><i class="fa fa-eye"></i> <c:out value="${blog.viewed_count}"></c:out></a></span>
                            </div><!-- end meta -->

                            <h1 class="entry-title"><c:out value="${blog.title}"></c:out></h1>
							<div class="tags clearfix">
							<div class="sharethis-inline-share-buttons"></div>
							</div>		
                            <div class="post-media">
                                <img src="/resources/images/blogs/<c:out value="${blog.title_folder}"></c:out>/<c:out value="${blog.photo}"></c:out>" alt="" class="img-responsive">
                            </div><!-- end post-media -->

                            <div class="clearfix">                   
                                <c:if test="${not empty blog}">
                                	<jsp:include page="../blogs/${blog.blog_url}.jsp"></jsp:include>
                                </c:if>                                
                            </div><!-- end post-padding -->
                        </div><!-- end col -->
                    </div><!-- end post-padding -->
                </div><!-- end content -->
            </div><!-- end col -->

            <div id="sidebar" class="col-md-4 col-sm-12 custom-sidebar">
                <div>
                    <div class="big-title">
                        <h2 class="related-title">
                            <span>CONTACT FORM</span>
                        </h2>
                    </div><!-- end big-title -->
                    <div class="contact_form row">

                            <div class="col-md-12">
                            <input type="text" name="name" id="art_name" class="form-control" placeholder="Name" maxlength="100" onkeydown="return /[a-z ]/i.test(event.key)"> 
                            <input type="text" name="email" id="art_email" class="form-control" placeholder="Email" maxlength="100"> 
                            <input type="text" name="mobile" id="art_phone" class="form-control" placeholder="Phone" onkeypress='return isNumberKey(event);'>  
                            <textarea class="form-control" name="comments" id="art_message" rows="6" placeholder="Message Below"></textarea>
                            <button type="submit" value="SEND" class="button button--wayra btn-block btn-square" onclick="saveContactsfromBlog()"> Contact Now</button>
                            </div>
                    </div>
                </div>

                <div class="widget clearfix">
                    <div class="big-title">
                        <h2 class="related-title">
                            <span>Recent Deep Tech Articles</span>
                        </h2>
                    </div><!-- end big-title -->
                    <div class="postpager liststylepost">
                        <ul class="pager">
                        	<c:forEach items="${latestBlogsList}" var="blogs">
	                            <li>
	                                <div class="post">
	                                    <a href="/blog/${blogs.blog_url}">
	                                        <img alt="" src="/resources/images/blogs/${blogs.title_folder}/${blogs.photo}" class="img-responsive alignleft" style="max-width: 80px; height: 80px !important;">
	                                        <h4><c:out value="${blogs.title}" /></h4>
	                                        <p class="mt-10"><c:out value="${fn:substring(blogs.short_content,0,60)}" />...</p>
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