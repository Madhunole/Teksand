<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<footer class="sticky-footer bg-white">
    <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <span>© <span id="year"></span> Teksands - Wrtr Ink LLP - All Rights Reserved</span>
        </div>
    </div>
</footer>

<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Click "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary btn-sm" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary cms-btn btn-sm" href="/bootcamp/logout">Logout</a>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="passwordChange" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Change Password</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-lg-4">
        		<div class="form-group">
			    	<label>Old Password</label>
			    	<input type="text" class="form-control" id="old_password" placeholder="Password">
			  	</div>
        	</div>
        	<div class="col-lg-4">
        		<div class="form-group">
			    	<label>New Password</label>
			    	<input type="text" class="form-control" id="new_password" placeholder="Password">
			  	</div>
        	</div>
        	<div class="col-lg-4">
        		<div class="form-group">
			    	<label>Confirm Password</label>
			    	<input type="text" class="form-control" id="confirm_password" placeholder="Password">
			  	</div>
        	</div>
        	<div class="col-lg-12">
        		<div class="form-check">
					<input type="checkbox" class="form-check-input" id="pass_check">
					<label class="form-check-label">I confirm to Change my account password</label>
				</div>
        	</div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-sm" onclick="changePassword()">Change Password</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="addNewUser" tabindex="-1" role="dialog" aria-labelledby="addNewUser" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add New User</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-lg-4">
        		<div class="form-group">
			    	<label>User Name</label>
			    	<input type="text" class="form-control" id="cms_user_name" placeholder="Name">
			  	</div>
        	</div>
        	<div class="col-lg-4">
        		<div class="form-group">
			    	<label>User Email</label>
			    	<input type="text" class="form-control" id="cms_user_email" placeholder="Email">
			  	</div>
        	</div>
        	<div class="col-lg-4">
        		<div class="form-group">
			    	<label>User Mobile</label>
			    	<input type="text" class="form-control" id="cms_user_mobile" placeholder="Mobile">
			  	</div>
        	</div>
        	<div class="col-lg-4">
        		<div class="form-group">
			    	<label>Password</label>
			    	<input type="text" class="form-control" id="cms_user_password" placeholder="Password">
			  	</div>
        	</div>
        	<div class="col-lg-4">
        		<div class="form-group">
			    	<label>Confirm Password</label>
			    	<input type="text" class="form-control" id="cms_user_confirm_password" placeholder="Password">
			  	</div>
        	</div>
        	<div class="col-lg-4">
        		<label>Select User Role</label>
        		<select class="form-control form-control-sm" id="cms_user_type_id">
					<option value="2">Mentor</option>
					<option value="3">Cordinator</option>
					<option value="4">Client Manager</option>
				</select>
        	</div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-sm" onclick="addNewUser()">Add New User</button>
      </div>
    </div>
  </div>
</div>

<script>
$( document ).ready(function() 
{
	document.getElementById("year").innerHTML = new Date().getFullYear();
});
function changePassword()
{
	var old_password = $("#old_password").val();
	var new_password = $("#new_password").val();
	var confirm_password = $("#confirm_password").val();
	
	if(old_password == "")
    {
    	swal("Oops!", "Please enter your old password", "error");
    	return;
    }
	
	if(new_password == "")
    {
    	swal("Oops!", "Please enter your new password", "error");
    	return;
    }
	
    if(confirm_password == "")
    {
    	swal("Oops!", "Please confirm your password", "error");
    	return;
    }
    
    if(new_password != confirm_password)
    {
    	swal("Oops!", "New & Confirm Password does not match", "error");
    	return;
    }
    
    if ($('#pass_check').is(":checked"))
	{
	  
	}else{
		swal("Oops!", "Please confirm the password change", "error");
    	return;
	}
    
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:true});
	$.post("/bootcamp/changePassword", {old_password : old_password, new_password : new_password}, function(data)
    {
		$.LoadingOverlay("hide");
		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
		{
   			swal("Success!", obj.msg , "success");
   			
   			$('#passwordChange').modal('toggle');
   		 	
   			$("#old_password").val("");
   			$("#new_password").val("");
   			$("#confirm_password").val("");

		}
		else
		{
			swal("OOPS!", obj.msg , "error");
   		 	return false;
		}
		
    }, "text");
}

function addNewUser()
{
	var cms_user_name = $("#cms_user_name").val();
	var cms_user_email = $("#cms_user_email").val();
	var cms_user_mobile = $("#cms_user_mobile").val();
	var cms_user_password = $("#cms_user_password").val();
	var cms_user_confirm_password = $("#cms_user_confirm_password").val();
	var cms_user_type_id = $("#cms_user_type_id").val();
	
    if(cms_user_name == "")
    {
    	swal("Oops!", "Please enter the user name", "error");
    	return;
    }
    
    if(cms_user_email == "")
    {
    	swal("Oops!", "Please enter the user email", "error");
    	return;
    }
    
    if(!isEmail(cms_user_email)) {
    	swal("OOPS!", "Please Enter Valid Email", "error");
	 	return false;
    }
    
    if(cms_user_mobile == "")
    {
    	swal("Oops!", "Please enter the user mobile", "error");
    	return;
    }
    
    if(cms_user_password == "")
    {
    	swal("Oops!", "Please enter the user password", "error");
    	return;
    }
    
    if(cms_user_confirm_password == "")
    {
    	swal("Oops!", "Please enter the user confirm password", "error");
    	return;
    }
    
    if(cms_user_password != cms_user_confirm_password)
    {
    	swal("Oops!", "Password & Confirm Password does not match", "error");
    	return;
    }
    
    if(cms_user_type_id == "")
    {
    	swal("Oops!", "Please select the User Role", "error");
    	return;
    }
    
    $.LoadingOverlay("show");
	
	$.ajaxSetup({async:true});
	$.post("/bootcamp/addUser", {name : cms_user_name, email : cms_user_email, mobile : cms_user_mobile, password : cms_user_password, user_type_id : cms_user_type_id}, function(data)
    {
		$.LoadingOverlay("hide");
		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
		{
   			swal("Success!", obj.msg , "success");
   			
   			$('#addNewUser').modal('toggle');
   		 	
   			$("#user_name").val("");
   			$("#user_email").val("");
   			$("#user_mobile").val("");
   			$("#user_password").val("");
   			$("#user_confirm_password").val("");
   			$("#user_type_id").val("");

		}
		else
		{
			swal("OOPS!", obj.msg , "error");
   		 	return false;
		}
		
    }, "text");
}

function isEmail(email) {
	  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  return regex.test(email);
}
</script>