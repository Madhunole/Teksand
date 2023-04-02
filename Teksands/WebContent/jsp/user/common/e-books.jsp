<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>

var ebookId = 0;

function showPopup(id)
{
	ebookId = id;
	$('#ebooks').modal('show');
}

function saveCotactsfromEbooks()
{
    var name = $("#ebook_name").val();
    var email = $("#ebook_email").val();
    var mobile = $("#ebook_mobile").val();
    
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
	$.post("/saveEbooks", {name: "" + name + "", 
		email: "" + email + "",
		mobile: "" + mobile + "", 
		ebookId : "" + ebookId + ""}, function(data)
	{		
		$.LoadingOverlay("hide");
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
   			swal("Thank you.", "We have sent the eBook to your email id", "success");
   			$('#ebooks').modal('toggle');
   		    
   		 	$("#ebook_name").val("");
   	    	$("#ebook_mobile").val("");
   	    	$("#ebook_email").val("");
   		    
          	return false;
   		} else {
   			swal("OOPS!", "Please Enter Correct Details", "error");
   		 	return false;
   		}
		
	},'text');
}

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
                   <li class="active">E-Books</li>
               </ol>
           </div><!-- end bread -->
       </div><!-- /.pull-right -->
    </div>
</div><!-- end page-title -->

<section class="section bgw">
    <div class="container">
        <div class="section-title-2 text-center">
            <h1 class="home-h1">Teksands Ebooks</h1>
            <hr>
       </div><!-- end section-title -->
   </div><!-- end container -->
</section><!-- end section -->


<section class="section bgw">
    <div class="container">
        <div class="row blog-grid">
	        <c:forEach items="${ebookList}" var="ebooks">
	            <div class="col-md-4 col-sm-12 mob20">
	                <div class="shop-item ">
	                    <div class="post-media entry">
	                        <img src="/resources/images/ebooks/${ebooks.image}" alt="" class="img-responsive">
	                    </div><!-- end post-media -->
	                    <div class="shop-desc">
	                        <h3><a href="#" title=""><c:out value="${ebooks.title}" /></a></h3>
	                        <p><c:out value="${fn:substring(ebooks.description,0,120)}" />...</p>
	                    </div>
	                    <div class="large-post-meta">
	                        <div class="text-center"><a href="javascript:void(0);" class="btn btn-primary btn-sm" onclick="showPopup(${ebooks.id})">Download</a></div>
	                    </div><!-- end meta -->
	                </div><!-- end shop-item -->
	            </div><!-- end carousel-item -->
	        </c:forEach>
        </div><!-- end carousel-widget -->
    </div><!-- end container -->
</section><!-- end section -->


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
            <input type="tel" name="mobile" class="form-control" id="ebook_mobile">
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary btn-sm" onclick="saveCotactsfromEbooks()">Send</button>
      </div>
    </div>
  </div>
</div>