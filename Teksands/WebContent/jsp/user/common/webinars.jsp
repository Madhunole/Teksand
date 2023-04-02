<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script>

var webinarId = 0;

function showPopup(id)
{
	webinarId = id;
	$('#webinars').modal('show');
}

function saveCotactsfromWebinars()
{
    var name = $("#webinar_name").val();
    var email = $("#webinar_email").val();
    var mobile = $("#webinar_mobile").val();
    
    if(name == ""){
    	swal("OOPS!", "Please Enter Name", "error")
   	    return false;
    }
    
    if(email == "") {
    	swal("OOPS!", "Please Enter Email", "error")
   	    return false;
    }
    
    if(mobile == "") {
    	swal("OOPS!", "Please Enter Mobile", "error")
   	    return false;
    }
    
    if(!isEmail(email)) {
    	swal("OOPS!", "Please Enter Valid Email", "error")
   	    return false;
    }
    
    console.log("name = " + name);
    console.log("email = " + email);
    console.log("mobile = " + mobile);
    
    $.LoadingOverlay("show");
    
    $.ajaxSetup({async:true});
	$.post("/saveWebinars", {name: "" + name + "", 
		email: "" + email + "",
		mobile: "" + mobile + "", 
		webinarId : "" + webinarId + ""}, function(data)
	{		
		$.LoadingOverlay("hide");
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
   			swal("Thank you.", "Thank you for registering for the webinar. We will send you the calendar invite shortly on your mail.", "success");
   			$('#webinars').modal('toggle');
   		    
   		 	$("#webinar_name").val("");
   	    	$("#webinar_email").val("");
   	    	$("#webinar_mobile").val("");
   		    
          	return false;
   		} else {
   			swal("OOPS!", "Please Enter Correct Details", "error");
   		 	return false;
   		}
		
	},'text');
}
</script>

<section class="section paralbackground banner" style="background-image:url('/resources/upload/pagebanner_03.jpg');min-height:400px !important" data-img-width="2400" data-img-height="907" data-diff="100">
    <div class="overlay"></div>
</section><!-- end section -->
        
<div class="page-title bgg">
    <div class="container clearfix">
       <div class="pull-left">
           <div class="bread">
               <ol class="breadcrumb">
                   <li><a href="#">Home</a></li>
                   <li class="active">Webinars</li>
               </ol>
           </div><!-- end bread -->
       </div><!-- /.pull-right -->
    </div>
</div><!-- end page-title -->

<section class="section">
    <div class="container">
        <div class="section-title-2 text-center">
            <h1 class="home-h1">Upcoming Webinars</h1>
            <hr>
       </div><!-- end section-title -->
   </div><!-- end container -->
</section><!-- end section -->

<section class="section">
    <div class="container">
    	<div class="row text-center">
	        <div id="owl-shop" class="carousel-widget">
	            <c:forEach items="${webinarsActiveList}" var="webinar">
		            <div class="carousel-item">
		               <div class="col-md-12 col-sm-12 mob20 withborder">
	                        <div class="boxes text-center service-first withcircle">
	            				<div class="post-media entry">
	                                <img src="/resources/images/webinars/${webinar.images}" alt="" class="img-responsive">
	                            </div><!-- end post-media -->
	                            <h3 style="margin: 20px 0 0 0;"><c:out value="${webinar.title}" /></h3>
	                        </div><!-- end box -->
	                        <p style="margin: 10px 0 0 0;"><i class="fa fa-calendar"></i> | <b><c:out value="${webinar.start_date}" /></b> | <b>02:30 PM (IST)</b></p>
	                        <p style="margin: 10px 0 0 0;"><c:out value="${webinar.short_description}" /></p>
	                        <a href="javascript:void(0);" class="btn btn-primary btn-trans btn-radius" style="margin: 10px 0 0 0;" onclick="showPopup(${webinar.id})">Register Now</a>
	                    </div><!-- end col -->
	                </div><!-- end carousel-item -->
	             </c:forEach>
	        </div><!-- end carousel-widget -->
        </div>
    </div><!-- end container -->
</section><!-- end section -->

<section class="section">
    <div class="container">
    	<div class="section-title-2 text-center video-section">
            <h2>Browse by Categories</h2>
            <hr>
        </div><!-- end section-title -->
        <div class="row">
        	<div class="col-md-12 col-sm-12">
            	<div class="tab-first menu-center">
	                <ul class="nav nav-pills nav-justified" role="tablist">
	                    <li role="presentation" class="active"><a href="#all" aria-controls="all" role="tab" data-toggle="tab">All</a></li>
                        <li role="presentation"><a href="#datascience_web" aria-controls="datascience_web" role="tab" data-toggle="tab">Data Science</a></li>
                        <li role="presentation"><a href="#machinelearning_web" aria-controls="machinelearning_web" role="tab" data-toggle="tab">Machine Learning</a></li>
                        <li role="presentation"><a href="#devops_web" aria-controls="devops_web" role="tab" data-toggle="tab">DevOps</a></li>
                        <li role="presentation"><a href="#deeplearning_web" aria-controls="deeplearning_web" role="tab" data-toggle="tab">Deep Learning</a></li>
	                </ul>
                		<div class="tab-content tabs-video" style="height:auto;">
		                    <div role="tabpanel" class="tab-pane active" id="all">
		                        <div class="tab-padding clearfix text-center">
		                        	<c:forEach items="${webinar_category1}" var="webinar">
							               <div class="col-md-3 col-sm-12 mt-bottom">
					                        <div class="shop-item ">
					                            <div class="post-media entry">
					                                <img src="/resources/images/webinars/${webinar.images}" alt="" class="img-responsive">
					                            </div><!-- end post-media -->
					                            <div class="shop-desc" style="padding: 0 0 0 0 !important">
					                                <h3 style="margin: 0 0 0 0 !important;"><a href="#" title=""><c:out value="${webinar.title}" /></a></h3>
					                                <p style="margin: 0 0 0 0 !important;"><i class="fa fa-calendar"></i> | <b><c:out value="${webinar.start_date}" /></b> | <b>02:30 PM (IST)</b></p>
					                                <p style="margin: 0 0 0 0 !important;"><c:out value="${fn:substring(webinar.short_description,0,120)}" />...</p>
					                                <a href="javascript:void(0);" class="btn btn-primary btn-sm mt-10" style="margin: 10px;" onclick="showPopup(${webinar.id})">Register Now</a>
					                            </div>
					                        </div><!-- end shop-item -->
					                    </div><!-- end carousel-item -->
					                </c:forEach>
				                 </div>
		                    </div>
		                    <div role="tabpanel" class="tab-pane" id="datascience_web">
		                        <div class="tab-padding clearfix text-center">
				                   <c:forEach items="${webinar_category2}" var="webinar">
							               <div class="col-md-3 col-sm-12 mt-bottom">
					                        <div class="shop-item ">
					                            <div class="post-media entry">
					                                <img src="/resources/images/webinars/${webinar.images}" alt="" class="img-responsive">
					                            </div><!-- end post-media -->
					                            <div class="shop-desc" style="padding: 0 0 0 0 !important">
					                                <h3 style="margin: 0 0 0 0 !important;"><a href="#" title=""><c:out value="${webinar.title}" /></a></h3>
					                                <p style="margin: 0 0 0 0 !important;"><i class="fa fa-calendar"></i> | <b><c:out value="${webinar.start_date}" /></b> | <b>02:30 PM (IST)</b></p>
					                                <p style="margin: 0 0 0 0 !important;"><c:out value="${fn:substring(webinar.short_description,0,120)}" />...</p>
					                                <a href="javascript:void(0);" class="btn btn-primary btn-sm mt-10" style="margin: 10px;" onclick="showPopup(${webinar.id})">Register Now</a>
					                            </div>
					                        </div><!-- end shop-item -->
					                    </div><!-- end carousel-item -->
					                </c:forEach>
				                 </div>
		                    </div>
		                    <div role="tabpanel" class="tab-pane" id="machinelearning_web">
		                        <div class="tab-padding clearfix text-center">
									<c:forEach items="${webinar_category3}" var="webinar">
							               <div class="col-md-3 col-sm-12 mt-bottom">
					                        <div class="shop-item ">
					                            <div class="post-media entry">
					                                <img src="/resources/images/webinars/${webinar.images}" alt="" class="img-responsive">
					                            </div><!-- end post-media -->
					                            <div class="shop-desc" style="padding: 0 0 0 0 !important">
					                                <h3 style="margin: 0 0 0 0 !important;"><a href="#" title=""><c:out value="${webinar.title}" /></a></h3>
					                                <p style="margin: 0 0 0 0 !important;"><i class="fa fa-calendar"></i> | <b><c:out value="${webinar.start_date}" /></b> | <b>02:30 PM (IST)</b></p>
					                                <p style="margin: 0 0 0 0 !important;"><c:out value="${fn:substring(webinar.short_description,0,120)}" />...</p>
					                                <a href="javascript:void(0);" class="btn btn-primary btn-sm mt-10" style="margin: 10px;" onclick="showPopup(${webinar.id})">Register Now</a>
					                            </div>
					                        </div><!-- end shop-item -->
					                    </div><!-- end carousel-item -->
					                </c:forEach>
				                 </div>
		                    </div>
		                    <div role="tabpanel" class="tab-pane" id="devops_web">
		                        <div class="tab-padding clearfix text-center">
									<c:forEach items="${webinar_category4}" var="webinar">
							               <div class="col-md-3 col-sm-12 mt-bottom">
					                        <div class="shop-item ">
					                            <div class="post-media entry">
					                                <img src="/resources/images/webinars/${webinar.images}" alt="" class="img-responsive">
					                            </div><!-- end post-media -->
					                            <div class="shop-desc" style="padding: 0 0 0 0 !important">
					                                <h3 style="margin: 0 0 0 0 !important;"><a href="#" title=""><c:out value="${webinar.title}" /></a></h3>
					                                <p style="margin: 0 0 0 0 !important;"><i class="fa fa-calendar"></i> | <b><c:out value="${webinar.start_date}" /></b> | <b>02:30 PM (IST)</b></p>
					                                <p style="margin: 0 0 0 0 !important;"><c:out value="${fn:substring(webinar.short_description,0,120)}" />...</p>
					                                <a href="javascript:void(0);" class="btn btn-primary btn-sm mt-10" style="margin: 10px;" onclick="showPopup(${webinar.id})">Register Now</a>
					                            </div>
					                        </div><!-- end shop-item -->
					                    </div><!-- end carousel-item -->
					                </c:forEach>
				                 </div>
		                    </div>
		                    <div role="tabpanel" class="tab-pane" id="deeplearning_web">
		                        <div class="tab-padding clearfix text-center">
									<c:forEach items="${webinar_category5}" var="webinar">
							               <div class="col-md-3 col-sm-12 mt-bottom">
					                        <div class="shop-item ">
					                            <div class="post-media entry">
					                                <img src="/resources/images/webinars/${webinar.images}" alt="" class="img-responsive">
					                            </div><!-- end post-media -->
					                            <div class="shop-desc" style="padding: 0 0 0 0 !important">
					                                <h3 style="margin: 0 0 0 0 !important;"><a href="#" title=""><c:out value="${webinar.title}" /></a></h3>
					                                <p style="margin: 0 0 0 0 !important;"><i class="fa fa-calendar"></i> | <b><c:out value="${webinar.start_date}" /></b> | <b>02:30 PM (IST)</b></p>
					                                <p style="margin: 0 0 0 0 !important;"><c:out value="${fn:substring(webinar.short_description,0,120)}" />...</p>
					                                <a href="javascript:void(0);" class="btn btn-primary btn-sm mt-10" style="margin: 10px;" onclick="showPopup(${webinar.id})">Register Now</a>
					                            </div>
					                        </div><!-- end shop-item -->
					                    </div><!-- end carousel-item -->
					                </c:forEach>
				                 </div>
		                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- end col -->
</section><!-- end section -->

<section class="section">
    <div class="container">
        <div class="section-title-2 text-center">
            <h2>Past Webinars</h2>
            <hr>
       </div><!-- end section-title -->
   </div><!-- end container -->
</section><!-- end section -->

<section class="section">
   <div class="container">
       <div id="owl-blog" class="carousel-widget text-center">
	       	<c:forEach items="${inactivewebinarList}" var="webinar">
	           	<div class="carousel-item">
	               <div class="carousel-item">
		               <div class="col-md-12 col-sm-12 mob20 withborder">
	                        <div class="boxes text-center service-first withcircle">
	            				<div class="post-media entry">
	                                <img src="/resources/images/webinars/${webinar.images}" alt="" class="img-responsive">
	                            </div><!-- end post-media -->
	                            <h3 style="margin: 20px 0 0 0;"><c:out value="${webinar.title}" /></h3>
	                        </div><!-- end box -->
	                        <p style="margin: 10px 0 0 0;"><i class="fa fa-calendar"></i> | <b><c:out value="${webinar.start_date}" /></b> | <b>02:30 PM (IST)</b></p>
	                        <p style="margin: 10px 0 0 0;"><c:out value="${webinar.short_description}" /></p>
	                    </div><!-- end col -->
	                </div><!-- end carousel-item -->
	           </div><!-- end carousel-item -->
			</c:forEach>
       </div><!-- end carousel-widget -->
   </div><!-- end container -->
</section><!-- end section -->

<div class="modal fade" id="webinars" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Sign Up</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Name:</label>
            <input type="name" name="name" class="form-control" id="webinar_name">
          </div>
          <div class="form-group">
            <label for="recipient-mail" class="col-form-label">Email:</label>
            <input type="email" name="email" class="form-control" id="webinar_email">
          </div>
          <div class="form-group">
            <label for="recipient-phone" class="col-form-label">Phone:</label>
            <input type="tel" name="mobile" class="form-control" id="webinar_mobile">
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary btn-sm" onclick="saveCotactsfromWebinars()">Send</button>
      </div>
    </div>
  </div>
</div>