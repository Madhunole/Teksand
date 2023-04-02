<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script>

function validateLogin()
{
    var email = $("#user_email").val();
    var password = $("#user_pass").val();
    
    if(email == ""){
    	swal("OOPS!", "Please Enter Email", "error")
   	    return false;
    }
    
    if(password == "") {
    	swal("OOPS!", "Please Enter Password", "error")
   	    return false;
    }
    
    if(!isEmail(email)) {
    	swal("OOPS!", "Please Enter Valid Email", "error")
   	    return false;
    }
    
    console.log("email = " + email);
    console.log("password = " + password);
    
    $.ajaxSetup({async:false});
	$.post("/validateLogin", {email: "" + email + "", 
		password: "" + password + "",}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
   			$(window).load(function() {  
   		      $("#loader").fadeOut(1000);  
   		   });
   			
   			$("#user_email").val("");
   		    $("#user_pass").val(""); 
   		 	document.location = "/admin/dashboard";
   		} else {
   			swal("OOPS!", obj.msg, "error");
   		 	return false;
   		}
		
	},'text');
}

function isEmail(email) {
	  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  return regex.test(email);
}

</script>

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="big-title">
                    <h1 class="related-title home-h1">
                        <span>Admin Login</span>
                    </h1>
                </div><!-- end big-title -->
                <div class="loginform">
                        <div class="col-md-12">
                        <input type="email" name="mail" id="user_email" class="form-control" placeholder="Email"> 
                        <input type="password" name="password"  id="user_pass" class="form-control" placeholder="Password"> 
                        <button type="submit" value="SEND" class="btn btn-primary btn-square btn-block" onclick="validateLogin()"> Login Account</button>
                        </div>
                </div>
            </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end section -->