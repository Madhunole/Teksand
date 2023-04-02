<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
            	    <div class="row blog-grid">
            	    <c:forEach items="${blogsList}" var="blogs">
	                    <div class="col-md-6">
	                        <div class="shop-item">
	                            <div class="post-media entry">
	                                <img src="/resources/upload/${blogs.photo}" alt="" class="img-responsive">
	                                <div class="magnifier">
	                                    <div class="shop-bottom clearfix">
	                                        <a href="#" title="Full Preview"><i class="fa fa-link"></i></a>
	                                    </div><!-- end shop-bottom -->
	                                </div><!-- end magnifier -->
	                            </div><!-- end post-media -->
	                            <div class="shop-desc">
	                                <div class="shop-price clearfix">
	                                    <small><a href="#">${blogs.category_name}</a></small>
	                                </div>
	                                <h3><a href="/blog/${blogs.blog_url}" title=""><c:out value="${blogs.title}" /></a></h3>
	                                <p class="mt-10"><c:out value="${fn:substring(blogs.short_content,0,120)}" />...</p>
	                                <p class="mt-10"><a class="btn btn-primary btn-square" href="/blog/${blogs.blog_url}">Continue reading</a></p>
	                            </div>
	                        </div><!-- end shop-item -->
	                    </div><!-- end carousel-item -->
	                    </c:forEach>
					</div><!-- end carousel-widget -->
				
				
				
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
				
				

                <!-- <nav class="clearfix">
                    <ul class="pagination">
                        <li><a class="active" href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">...</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                          <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                          </a>
                        </li>
                    </ul>
                </nav> -->
            </div><!-- end col -->
            

            <div id="sidebar" class="col-md-4 col-sm-12 custom-sidebar">
                <div>
                    <div class="big-title">
                        <h2 class="related-title">
                            <span>CONTACT FORM</span>
                        </h2>
                    </div><!-- end big-title -->
                    <div class="contact_form">
                        <form id="contactform" class="row" action="contact.php" name="contactform" method="post">
                            <div class="col-md-12">
                            <input type="text" name="name" id="name" class="form-control" placeholder="Name"> 
                            <input type="text" name="email" id="email" class="form-control" placeholder="Email"> 
                            <input type="text" name="name" id="phone" class="form-control" placeholder="Phone"> 
                            <textarea class="form-control" name="comments" id="comments" rows="6" placeholder="Message Below"></textarea>
                            <button type="submit" value="SEND" id="submit" class="btn btn-primary"> Send Form</button>
                            </div>
                        </form> 
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
                            <li>
                                <div class="post">
                                    <a href="#">
                                        <img alt="" src="/resources/upload/pager_01.png" class="img-responsive alignleft">
                                        <h4>Learning Professional English in 20 Days</h4>
                                    </a>
                                </div>  
                            </li>
                            <li>
                                <div class="post">
                                    <a href="#">
                                        <img alt="" src="/resources/upload/pager_02.png" class="img-responsive alignleft">
                                        <h4>Selecting Material Design and Color Palette</h4>
                                    </a>
                                </div>  
                            </li>
                            <li>
                                <div class="post">
                                    <a href="#">
                                        <img alt="" src="/resources/upload/pager_03.jpg" class="img-responsive alignleft">
                                        <h4>Getting Starting Web Design and Web Development</h4>
                                    </a>
                                </div>  
                            </li>
                        </ul>   
                    </div><!-- end postpager -->
                </div><!-- end widget -->

                <div class="widget clearfix">
                    <img alt="" src="/resources/images/300x250_ad_image.png" class="img-responsive">
                    
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
                                    <a href="#">
                                        <img alt="" src="/resources/upload/pager_04.jpg" class="img-responsive alignleft">
                                        <h4>Learning Web Design & Development</h4>
                                        <small>View Course</small>
                                    </a>
                                </div>  
                            </li>
                            <li>
                                <div class="post">
                                    <a href="#">
                                        <img alt="" src="/resources/upload/pager_05.jpg" class="img-responsive alignleft">
                                        <h4>Graphic Design Introduction Course</h4>
                                        <small>View Course</small>
                                    </a>
                                </div>  
                            </li>
                            <li>
                                <div class="post">
                                    <a href="#">
                                        <img alt="" src="/resources/upload/pager_06.jpg" class="img-responsive alignleft">
                                        <h4>Social Media Marketing Strategy</h4>
                                        <small>View Course</small>
                                    </a>
                                </div>  
                            </li>
                            <li>
                                <div class="post">
                                    <a href="#">
                                        <img alt="" src="/resources/upload/pager_06.jpg" class="img-responsive alignleft">
                                        <h4>Search Engine Marketing Strategy</h4>
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