<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.img-thumbnail {
    border: 0px solid #ddd !important;
}
</style>

<div class="page-title bgg">
    <div class="container clearfix">
       <div class="pull-left">
           <div class="bread">
               <ol class="breadcrumb">
                   <li><a href="#">Home</a></li>
                   <li class="active">404 Page</li>
               </ol>
           </div><!-- end bread -->
       </div><!-- /.pull-right -->
    </div>
</div><!-- end page-title -->

<section class="section bgw">
     <div class="container">
         <div class="row">
             <div id="post-content" class="col-md-12 col-sm-12">
                 <div class="notfound">
                     <img class="img-fluid img-thumbnail" alt="" src="/resources/images/error.png" style="width: 400px;margin: -74px 0 0 0;">
                     <p><c:out value="${errorMsg}"> </c:out></p>
                     <a href="/" class="btn btn-primary btn-lg" style="color: #fff !important;">Back to Home</a>
                </div>
             </div><!-- end col -->
         </div><!-- end row -->
     </div><!-- end container -->
</section><!-- end section -->