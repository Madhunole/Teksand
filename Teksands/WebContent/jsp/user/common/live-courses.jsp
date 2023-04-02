<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="page-title bgg">
    <div class="container clearfix">
        <!-- <div class="title-area pull-left">
           <h2>Blog Single <small>Listed below our awesome blog posts</small></h2>
       </div> --><!-- /.pull-right -->
       <div class="pull-left">
           <div class="bread">
               <ol class="breadcrumb">
                   <li><a href="#">Home</a></li>
                   <li class="active">Upcoming Live Courses</li>
               </ol>
           </div><!-- end bread -->
       </div><!-- /.pull-right -->
    </div>
</div><!-- end page-title -->

<section class="section bgw">
    <div class="container">
        <div class="section-title-2 text-center">
            <h1 class="home-h1">Upcoming Live Courses</h1>
            <hr>
       </div><!-- end section-title -->
   </div><!-- end container -->
</section><!-- end section -->


<section class="section bgw">
  <div class="container">
      <div class="row course-grid">
   			<c:forEach items="${coursesList}" var="courses">
	          <div class="col-md-3 col-sm-12 col-xs-12 wow fadeIn">
	              <div class="shop-item course-v2">
	                  <div class="post-media entry">
	                      <img src="/resources/images/courses/${courses.image}" alt="" class="img-responsive">
	                  </div><!-- end post-media -->
	                  <div class="shop-desc">
	                  <div class="clearfix">
	                         <div>
	                             <p class="small-text"><c:out value="${courses.sub_heading}"/></p>
	                         </div><!-- end right -->
	                     </div>
	                     <hr>
	                     	<h3 style="height:105px;text-align:center;"><a target="_blank" href="<c:out value="${courses.link}" escapeXml="false"/>" title=""><c:out value="${courses.title}" escapeXml="false"/></a></h3>
							<p class="text-center title-text"><c:out value="${courses.information}" escapeXml="false"/></p>
							<a target="_blank" href="<c:out value="${courses.link}" escapeXml="false"/>" class="btn btn-course"><c:out value="${courses.price}" escapeXml="false"/></a>
	                  </div>
	              </div><!-- end shop-item -->
	          </div><!-- end carousel-item -->
	       </c:forEach>
      </div><!-- end row -->
  </div><!-- end container -->
</section>


<div class="modal fade" id="ebooks" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
            <input type="name" name="name" class="form-control" id="ebook_name">
          </div>
          <div class="form-group">
            <label for="recipient-mail" class="col-form-label">Email:</label>
            <input type="email" name="email" class="form-control" id="ebook_email">
          </div>
          <div class="form-group">
            <label for="recipient-phone" class="col-form-label">Phone:</label>
            <input type="mobile" name="mobile" class="form-control" id="ebook_mobile">
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="button button--wayra" data-dismiss="modal">Close</button>
        <button type="button" class="button button--wayra" onclick="saveCotactsfromEbooks()">Send</button>
      </div>
    </div>
  </div>
</div>