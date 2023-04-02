<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
function webinarRegistration()
{
    var webinar = $("#webinar_name").val();
    var name = $("#web_name").val();
    var email = $("#web_email").val();
    var mobile = $("#web_mobile").val();
    
    if(webinar == ""){
    	swal("OOPS!", "Please Enter Webinar Name", "error")
   	    return false;
    }
    
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
    
    console.log("webinar = " + webinar);
    console.log("name = " + name);
    console.log("email = " + email);
    console.log("mobile = " + mobile);
    
    $.LoadingOverlay("show");
    
    $.ajaxSetup({async:true});
	$.post("/webinarRegistration", {name: "" + name + "", 
		email: "" + email + "",
		mobile: "" + mobile + "", 
		webinar: "" + webinar + "",}, function(data)
	{		
		$.LoadingOverlay("hide");
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
   			swal("Thank you.", "Thank you for registering for the webinar. We will send you the calendar invite shortly on your mail.", "success");
   			$('#webinars').modal('toggle');
   		    
   			$("#webinar_name").val("");
   			$("#web_name").val("");
   	    	$("#web_email").val("");
   	    	$("#web_mobile").val("");
   		    
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
       <div class="pull-left">
           <div class="bread">
               <ol class="breadcrumb">
                   <li><a href="#">Home</a></li>
                   <li class="active">Webinars Registration</li>
               </ol>
           </div><!-- end bread -->
       </div><!-- /.pull-right -->
    </div>
</div><!-- end page-title -->

<section class="section">
    <div class="container">
        <div class="section-title-2 text-center">
            <h2>Webinars Registration</h2>
            <hr>
       </div>
   </div>
</section>

<section class="section bgw">
	<div class="container">
	    <div class="row">
		    <div id="sidebar1" class="col-md-6 col-sm-12">
	            <div class="clearfix">
	                <div class="member-profile">
				   		<img alt="" src="/resources/images/webinars/webinar-registration.jpeg" style="width: 550px; height: auto;" class="img-responsive">
	                </div>
	            </div>
			</div><!-- end right -->
	        <div id="sidebar1" class="col-md-6 col-sm-12">
	            <div class="clearfix">
	                <div class="member-profile">
	                    <div id="sidebar2" class="col-md-12 col-sm-12 mob30">
	                        <div class="widget clearfix">
	                            <div class="member-profile">
	                                <div class="contact_form">
                                       <div class="col-md-12">
	                                        <input type="text" id="webinar_name" name="name" class="form-control" placeholder="Webinar Name *">	
	                                        <input type="text" id="web_name" name="name" class="form-control" placeholder="Name *"> 
	                                        <input type="email" id="web_email" name="email"  class="form-control" placeholder="Email *"> 
	                                        <input type="number" id="web_mobile" name="tel" class="form-control" placeholder="Mobile *">
	                                        <button type="submit" value="SEND" class="button button--wayra btn-block btn-square" onclick="webinarRegistration()">Register</button>
                                       </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</section>
