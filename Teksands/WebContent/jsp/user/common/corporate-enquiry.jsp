<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
function saveCorporateEnquiry()
{
    var name = $("#corporate_name").val();
    var email = $("#corporate_email").val();
    var mobile = $("#corporate_mobile").val();
    var company = $("#corporate_company").val();
    var requirements = $("#corporate_requirements").val();
    
    if(name == ""){
    	swal("OOPS!", "Please Enter Name", "error")
   	    return false;
    }
    
    if(email == "") {
    	swal("OOPS!", "Please Enter Emaill", "error")
   	    return false;
    }
    var emaillength = email.length;
    if(emaillength > 100) {
    	swal("OOPS!", "Maximum allowed is 100 characters", "error")
   	    return false;
    }
    
    if(mobile == "") {
    	swal("OOPS!", "Please Enter Mobile", "error")
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
    if(company == "") {
    	swal("OOPS!", "Please Enter Company Name", "error")
   	    return false;
    }
    
    if(requirements == "") {
    	swal("OOPS!", "Please Enter Requirements", "error")
   	    return false;
    }
    
    if(!isEmail(email)) {
    	swal("OOPS!", "Please Enter Valid Email", "error")
   	    return false;
    }
    
    console.log("name = " + name);
    console.log("email = " + email);
    console.log("mobile = " + mobile);
    console.log("company = " + company);
    console.log("requirements = " + requirements);
    
    $.ajaxSetup({async:false});
	$.post("/saveCorporateEnquiry", {name: "" + name + "", 
		email: "" + email + "",
		mobile: "" + mobile + "", 
		company: "" + company + "",
		requirements: "" + requirements + "",}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
   			swal("Thank you for contacting us", "We have received your enquiry and will respond to you shortly", "success");
   			
   		    $("#corporate_name").val("");
   		    $("#corporate_email").val("");
   		    $("#corporate_mobile").val("");
   		    $("#corporate_company").val("");
   		    $("#corporate_requirements").val("");
   			
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

<!-- <div>
<img src="/resources/images/corporate-training.jpg" alt="corporate training" class="img-responsive paralbackground banner" data-img-width="2400" data-img-height="907" data-diff="100">
</div> -->

<div class="page-title bgg">
    <div class="container clearfix">
        <!-- <div class="title-area pull-left">
           <h2>Blog Single <small>Listed below our awesome blog posts</small></h2>
       </div> --><!-- /.pull-right -->
       <div class="pull-left">
           <div class="bread">
               <ol class="breadcrumb">
                   <li><a href="#">Home</a></li>
                   <li class="active">Corporate Enquiry</li>
               </ol>
           </div><!-- end bread -->
       </div><!-- /.pull-right -->
    </div>
</div><!-- end page-title -->


<section class="section bgw">
    <div class="container">
        <div class="section-title-2 text-center">
            <h1 class="home-h1">TEKSANDS BOOTCAMP PROGRAM</h1>
            <hr>
            <p style="margin-top: 40px;text-align: justify;">Teksands is a fast growing start-up in the EdTech Industry. We provide Courses on Deep Tech including Data Science, Machine Learning, Artificial Intelligence, Python, <a href="https://teksands.ai/courses/deep-learning-and-cnn-for-image-processing" target="_blank"><b>Deep Learning</b></a>, and other Deep Tech topics. Our courses are intended to primarily help working professionals achieve career augmentation in Deep Tech areas by delivering very high quality, application driven training suited to the needs of our learners needs and goals. We operate both an online Retail Online Channel as well as Corporate Channels.</p>
            <p style="margin-top: 20px;text-align: justify;">The only way to stay ahead of competition is for businesses to ensure that their personnel are constantly trained on not only the latest Technologies in the market but also methodologies and soft skills to attain holistic success in their career as well as for the Corporates. Teksands Corporate Training focusses on three main verticals - Tech Skills, Methodologies (covers various Project Management, Agile, Business Analysis and other areas) and Soft Skills.</p>
            
        </div><!-- end section-title -->
    </div><!-- end container -->
</section><!-- end section -->

<section class="section bgw">
    <div class="container">
        <div class="section-title-2 text-center custom-section">
            <h2>Teksands Benefits & features</h2>
            <hr>
        </div><!-- end section-title -->
		<div class="row text-center">
          <div class="col-md-4 col-sm-12 mob20">
              <div class="boxes text-center service-first withcircle withborder benefits-section">
              	  <h4 style="color:#fff;"><b>Digital Focussed Young </br>Start-up</b></h4>
              </div><!-- end box -->
          </div><!-- end col -->
          <div class="col-md-4 col-sm-12 mob20">
              <div class="boxes text-center service-first withcircle withborder benefits-section">
                  <h4 style="color:#fff;"><b>More than 3000 hours of Coporate Trainings delivered in last 6 months</b></h4>
              </div><!-- end box -->
          </div><!-- end col -->
          <div class="col-md-4 col-sm-12">
              <div class="boxes text-center service-first withcircle withborder benefits-section">
                  <h4 style="color:#fff;"><b>400+ Trainers Registered with us and growing</b></h4>
              </div><!-- end box -->
          </div><!-- end col -->
        </div><!-- end row -->
        <div class="row text-center" style="margin-top: 20px;">
          <div class="col-md-4 col-sm-12 mob20">
              <div class="boxes text-center service-first withcircle withborder benefits-section">
                  <h4 style="color:#fff;"><b>High pedigreed and highly competent trainers from Industry</b></h4>
              </div><!-- end box -->
          </div><!-- end col -->
          <div class="col-md-4 col-sm-12 mob20">
              <div class="boxes text-center service-first withcircle withborder benefits-section">
                  <h4 style="color:#fff;"><b>Dedicated LMS for </br>the Learners</b></h4>
              </div><!-- end box -->
          </div><!-- end col -->
          <div class="col-md-4 col-sm-12">
              <div class="boxes text-center service-first withcircle withborder benefits-section">
                  <h4 style="color:#fff;"><b>Student and Trainers </br>Dashboards</b></h4>
              </div><!-- end box -->
          </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end container -->
</section><!-- end section -->

<section class="section litpadtop bgw custom-section">
<div class="container">
    <div class="row">
        <div id="sidebar1" class="col-md-12 col-sm-12">
            <div class="widget clearfix">
                <div class="member-profile">
			    <div class="section-title-2 text-center manager-section">
			        <h2>Please leave your Details for a call-back</h2>
			        <hr>
			    </div><!-- end section-title -->

                    <div class="row profile-badges contact-rm">
                        <div class="contact_form">
                                <div class="col-md-12">
                                <input type="text" id="corporate_name" class="form-control" placeholder="Name" maxlength="100" onkeydown="return /[a-z ]/i.test(event.key)"> 
                                <input type="text" id="corporate_company" class="form-control" placeholder="Company"> 
                                <input type="text" id="corporate_email" class="form-control" placeholder="Email" maxlength="100"> 
                                <input type="text" id="corporate_mobile" class="form-control" placeholder="Mobile"  onkeypress='return isNumberKey(event);'> 
                                <textarea class="form-control" id="corporate_requirements" rows="6" placeholder="Requirements"></textarea>
                                <div class="text-center"><button type="button" value="submit" id="submit" class="button button--wayra" onclick="saveCorporateEnquiry()"> Contact Us Today</button></div>
                                </div>
                        </div>
                    </div><!-- end row -->
                </div><!-- end team-member -->
            </div>
        </div><!-- end right -->
    </div><!-- end row -->
</div><!-- end container -->
</section><!-- end section -->


