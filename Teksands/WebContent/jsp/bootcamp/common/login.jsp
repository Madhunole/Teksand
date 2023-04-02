<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Teach Me | Responsive Learning Management System Template</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <link rel="shortcut icon" href="/resources/images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="/resources/images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="57x57" href="/resources/images/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/resources/images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/resources/images/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/resources/images/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/resources/images/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/resources/images/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/resources/images/apple-touch-icon-152x152.png">

    <link rel="stylesheet" type="text/css" href="/resources/revolution/css/settings.css">
    <link rel="stylesheet" type="text/css" href="/resources/revolution/css/layers.css">
    <link rel="stylesheet" type="text/css" href="/resources/revolution/css/navigation.css">

    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/custom.css">
    <link rel="stylesheet" href="/resources/js/sweetalert/sweetalert.css"/>
    
    <style>
	    body.login .section {
		    padding-top: 5em;
		}
    </style>
    
<script>
function validateLogin()
{
    var email = $("#cms_email").val();
    var password = $("#cms_pass").val();
    
    if(email == ""){
    	swal("OOPS!", "Please Enter Email", "error")
   	    return false;
    }
    if(!isEmail(email)) {
    	swal("OOPS!", "Please Enter Valid Email", "error")
   	    return false;
    }
    if(password == "") {
    	swal("OOPS!", "Please Enter Password", "error")
   	    return false;
    }
    
    $.LoadingOverlay("show");
    
    $.ajaxSetup({async:false});
	$.post("/bootcamp/validateLogin", {email: "" + email + "", 
		password: "" + password + "",}, function(data)
	{		
	    $.LoadingOverlay("hide");
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
   			swal("Success!", "You are successfully logged in", "success")
   			if(obj.user_type_id == 1 || obj.user_type_id == 2 || obj.user_type_id == 3){
   				window.location.replace("/bootcamp/dashboard");
   			}
   			
   			if(obj.user_type_id == 4){
   				window.location.replace("/bootcamp/bootcamp-list");
   			}
   			
   			if(obj.user_type_id == 6){
   				window.location.replace("/bootcamp/brand-dashboard");
   			}
   			
   			if(obj.user_type_id == 7){
   				window.location.replace("/bootcamp/client/dashboard");
   			}
   			
   			$("#cms_email").val("");
   		    $("#cms_pass").val(""); 
   		} 
   		else {
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

</head>
	<body class="login">
        <div id="loader">
			<div class="loader-container">
				<img src="/resources/images/load.gif" alt="" class="loader-site spinner">
			</div>
		</div>
	    <div id="wrapper">
	        <section class="section">
	            <div class="container">
	                <div class="row">
	                    <div class="col-md-6 col-md-offset-3">
	                        <div class="widget contentwidget">
	                            <div class="loginbox text-center">
	                                <img alt="TeksandsCMS" src="/resources/images/cms/logo/TeksandsCMS.png" style="width: 70%;">
	                                <div>
	                                    <input type="text" id="cms_email" name="text" placeholder="Email" required class="form-control" />
	                                    <input type="password" id="cms_pass" name="email" placeholder="Password" required class="form-control" />
	                                    <button class="btn btn-primary btn-block" onclick="validateLogin()">Login Account</button>
	                                </div>    
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </section>
	    </div>
    	<div class="dmtop"></div>
    	<script src="/resources/js/jquery.min.js"></script>
    	<script src="/resources/js/bootstrap.js"></script>
    	<script src="/resources/js/plugins.js"></script>
    	<script src="/resources/js/overlay/loadingoverlay.js"></script>
		<script src="/resources/js/sweetalert/sweetalert.min.js"></script>
	</body>
</html>

<!-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>SB Admin 2 - Login</title>
    <link href="/resources/cms/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="/resources/cms/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-primary">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Enter Email Address...">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div>
                                        <a href="index.html" class="btn btn-primary btn-user btn-block">
                                            Login
                                        </a>
                                        <hr>
                                        <a href="index.html" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> Login with Google
                                        </a>
                                        <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                        </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.html">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="register.html">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
        </div>
    </div>
    <script src="/resources/cms/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/cms/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/cms/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/resources/cms/js/sb-admin-2.min.js"></script>
</body>
</html> -->