<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>

function saveContactsFromContact()
{
    var name = $("#con_name").val();
    var email = $("#con_email").val();
    var mobile = $("#con_mobile").val();
    var company = "";
    var requirements = $("#con_message").val();
    
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
			//swal ("Thank you","We will get back to you","error");
			swal("Thank you for contacting us", "We have received your enquiry and will respond to you shortly", "success");
   			
			$("#con_name").val("");
			$("#con_email").val("");
			$("#con_mobile").val("");
			$("#con_message").val("");
			    
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



<div class="page-title bgg">
    <div class="container clearfix">
        <!-- <div class="title-area pull-left">
           <h2>Blog Single <small>Listed below our awesome blog posts</small></h2>
       </div> --><!-- /.pull-right -->
       <div class="pull-left">
           <div class="bread">
               <ol class="breadcrumb">
                   <li><a href="#">Home</a></li>
                   <li class="active">Contact US</li>
               </ol>
           </div><!-- end bread -->
       </div><!-- /.pull-right -->
    </div>
</div><!-- end page-title -->

<section class="section bgw">
    <div class="container">

        <div class="section-title-2 text-center course-title">
            <h1 class="home-h1">CONTACT DETAILS</h1>
            <p class="lead">For your pre-sale questions, please use form below</p>
            <hr>
        </div><!-- end section-title -->

        <div class="row">
            <div class="col-md-5">
                <div class="widget">
                    <ul class="contact-details">
                        <li><i class="fa fa-link"></i> <a href="/">www.teksands.ai</a></li>
                        <li><i class="fa fa-envelope-o"></i> <a href="mailto:info@teksands.ai">info@teksands.ai</a></li>
                        <li><i class="fa fa-phone"></i> +91 63 6273 2428</li>
                        <!-- <li><i class="fa fa-home"></i> Envato INC 22 Elizabeth St.</li> -->
                    </ul>
                    <hr>
                    <div class="social-icons">
                        <ul class="list-inline">
                           <li class="facebook"><a data-toggle="tooltip" data-placement="bottom" title="Facebook" href="https://www.facebook.com/Teksands/"><i class="fa fa-facebook"></i></a></li>
	                       <li class="instagram"><a data-toggle="tooltip" data-placement="bottom" title="Instagram" href="https://www.instagram.com/teksands.ai/"><i class="fa fa-instagram"></i></a></li>
	                       <li class="twitter"><a data-toggle="tooltip" data-placement="bottom" title="Twitter" href="https://twitter.com/teksands"><i class="fa fa-twitter"></i></a></li>
	                       <li class="linkedin"><a data-toggle="tooltip" data-placement="bottom" title="Linkedin" href="https://www.linkedin.com/company/teksands/"><i class="fa fa-linkedin"></i></a></li>
	                       <li class="vimeo"><a data-toggle="tooltip" data-placement="bottom" title="Vimeo" href="https://vimeo.com/user145878395"><i class="fa fa-vimeo"></i></a></li>
	                       <li class="youtube"><a data-toggle="tooltip" data-placement="bottom" title="Youtube" href="https://www.youtube.com/channel/UCrfexSD469V7WXVAAVd3Uag/featured"><i class="fa fa-youtube"></i></a></li>
                        </ul>
                    </div><!-- end social icons -->
                </div><!-- end widget -->
            </div>   
            <div class="col-md-7">
                <div class="contact_form">
                    <div id="message"></div>
                         <div class="col-md-12">
                        <input type="text" name="name" id="con_name" class="form-control" placeholder="Name" maxlength="100" onkeydown="return /[a-z ]/i.test(event.key)"> 
                        <input type="text" name="email" id="con_email" class="form-control" placeholder="Email"  maxlength="100" > 
                        <input type="text" name="phone" id="con_mobile" class="form-control" placeholder="Phone"  onkeypress='return isNumberKey(event);' > 
                        <textarea class="form-control" name="comments" id="con_message" rows="6" placeholder="Message Below"></textarea>
                        <button type="submit" value="SEND" id="submit" class="button button--wayra" onclick="saveContactsFromContact()"> Contact Now</button>
                        </div>
				</div>
            </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end section -->

<!-- <div class="googlemap">
    <div id="map"></div>
</div>end googlemap -->