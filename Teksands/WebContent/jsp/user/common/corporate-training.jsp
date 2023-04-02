<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
function saveContacts()
{
    var name = $("#txt_name").val();
    var email = $("#txt_email").val();
    var mobile = $("#txt_mobile").val();
    var company = $("#txt_company").val();
    var requirements = $("#txt_requirements").val();
    
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
   			swal("Thank you for contacting us", "We have received your enquiry and will respond to you shortly", "success");
   			
   		    $("#txt_name").val("");
   		    $("#txt_email").val("");
   		    $("#txt_mobile").val("");
   		    $("#txt_company").val("");
   		    $("#txt_requirements").val("");
   			
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

<div>
<img src="/resources/images/corporate-training.jpg" alt="corporate training" class="img-responsive paralbackground banner" data-img-width="2400" data-img-height="907" data-diff="100">
</div>

<div class="page-title bgg">
    <div class="container clearfix">
        <!-- <div class="title-area pull-left">
           <h2>Blog Single <small>Listed below our awesome blog posts</small></h2>
       </div> --><!-- /.pull-right -->
       <div class="pull-left">
           <div class="bread">
               <ol class="breadcrumb">
                   <li><a href="#">Home</a></li>
                   <li class="active">Corporate Training</li>
               </ol>
           </div><!-- end bread -->
       </div><!-- /.pull-right -->
    </div>
</div><!-- end page-title -->


<section class="section bgw">
    <div class="container">
        <div class="section-title-2 text-center">
            <h2>WE ARE TEKSANDS</h2>
            <hr>
            <p style="margin-top: 40px;text-align: justify;">Teksands is a fast growing start-up in the EdTech Industry. We provide Courses on Deep Tech including <a href="https://teksands.ai/shortreads/how-is-data-science-creating-ripples-in-the-healthcare-industry" target="_blank"><b>Data Science</b></a>, Machine Learning, Artificial Intelligence, Python, Deep Learning, and other Deep Tech topics. Our courses are intended to primarily help working professionals achieve career augmentation in Deep Tech areas by delivering very high quality, application driven training suited to the needs of our learners needs and goals. We operate both an online Retail Online Channel as well as Corporate Channels.</p>
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


<section class="section bgw">
   <div class="container">
   		<div class="section-title-2 text-center course-title">
            <h1 class="home-h1">Course List</h1>
            <hr>
        </div><!-- end section-title -->
       <div class="row">
           <div class="col-md-12 col-sm-12">

               <div class="tab-first">
                   <ul class="nav nav-tabs" role="tablist">
                       <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"><i class="fa fa-graduation-cap"></i> Tech Skills</a></li>
                       <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"><i class="fa fa-university"></i> Soft Skills</a></li>
                       <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab"><i class="fa fa-home"></i> Software Engineering</a></li>
                   </ul>

                   <div class="tab-content">
                       <div role="tabpanel" class="tab-pane active" id="home">
                           <div class="tab-padding clearfix">
                               <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>React/Node</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>React</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Node</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>AWS</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>JavaScript</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Python</b></p>
				                        </div>
			                    </div><!-- end col -->
			               </div> 
			              	<div class="tab-padding clearfix" style="margin-top: 20px;">
                               <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Python/React</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>TypeScript</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Java</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>PostgreSQL</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Docker</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>React Native</b></p>
				                        </div>
			                    </div><!-- end col -->
			               </div>
			               <div class="tab-padding clearfix" style="margin-top: 20px;">
                               <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Graph QL</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>MongoDB</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Kubernetes</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>PHP</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>PHP/Laravel</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Golang</b></p>
				                        </div>
			                    </div><!-- end col -->
			               </div>
			               <div class="tab-padding clearfix" style="margin-top: 20px;">
                               <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Ruby on Rails</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>CSS</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Angular</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Microservices</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>ML/NLP</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>ML/CV</b></p>
				                        </div>
			                    </div><!-- end col -->
			               </div>
			               <div class="tab-padding clearfix" style="margin-top: 20px;">
                               <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>SQL</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Blockchain</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Angular</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Vue.js</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Android</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>C++</b></p>
				                        </div>
			                    </div><!-- end col -->
			               </div>
			               <div class="tab-padding clearfix" style="margin-top: 20px;">
                               <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Python/Django</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>iOS</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name-1"><b>Python/Data Engineering</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Flutter</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>AI/ML</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Angulare/Node</b></p>
				                        </div>
			                    </div><!-- end col -->
			               </div>
			               <div class="tab-padding clearfix" style="margin-top: 20px;">
                               <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>C#</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>UX</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>MySQL</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Azure</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>ASP .Net</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Kotlin</b></p>
				                        </div>
			                    </div><!-- end col -->
			               </div>
			               <div class="tab-padding clearfix" style="margin-top: 20px;">
                               <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>ETL</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Linux</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Elasticsearch</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Azure</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Boostrap</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Scala</b></p>
				                        </div>
			                    </div><!-- end col -->
			               </div>
			               <div class="tab-padding clearfix" style="margin-top: 20px;">
                               <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Spring Boot</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
			                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>TensorFlow</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Terraform</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Spark</b></p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-2 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft tech-skill-course-icon"></i>
				                            <p class="tech-skill-course-name"><b>Other Skills</b></p>
				                        </div>
			                    </div><!-- end col -->
			               </div>
                       </div>
                       <div role="tabpanel" class="tab-pane" id="profile">
                           <div class="tab-padding clearfix">
                               <div class="col-md-3 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft soft-skill-course-icon"></i>
				                            <p class="soft-skill-course-name">Business Analysis</p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-3 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft soft-skill-course-icon"></i>
				                            <p class="soft-skill-course-name">Project Management</p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-3 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft soft-skill-course-icon"></i>
				                            <p class="soft-skill-course-name">Agile Scrum</p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-3 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft soft-skill-course-icon"></i>
				                            <p class="soft-skill-course-name">Scaled Agile Framework</p>
				                        </div>
			                    </div><!-- end col -->
			               </div> 
			              	<div class="tab-padding clearfix" style="margin-top: 20px;">
                                <div class="col-md-3 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft soft-skill-course-icon"></i>
				                            <p class="soft-skill-course-name">Kanban</p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-3 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft soft-skill-course-icon"></i>
				                            <p class="soft-skill-course-name">Jira</p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-3 col-sm-12 mob20">
				                        <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft soft-skill-course-icon"></i>
				                            <p class="soft-skill-course-name">ITIL 4</p>
				                        </div>

			                    </div><!-- end col -->
			               </div>
                       </div>
                       <div role="tabpanel" class="tab-pane" id="messages">
                           <div class="tab-padding clearfix">
                               <div class="col-md-3 col-sm-12 mob20">
			                            <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft soft-skill-course-icon"></i>
				                            <p class="engi-course-name">Professional Communication</p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-3 col-sm-12 mob20">
			                            <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft soft-skill-course-icon"></i>
				                            <p class="soft-engi-course-name">Negotiation Skills</p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-3 col-sm-12 mob20">
			                            <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft soft-skill-course-icon"></i>
				                            <p class="soft-engi-course-name">Effective Writing</p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-3 col-sm-12 mob20">
			                            <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft soft-skill-course-icon"></i>
				                            <p class="soft-engi-course-name">Managing Stress</p>
				                        </div>
			                    </div><!-- end col -->

			               </div> 
			               <div class="tab-padding clearfix" style="margin-top: 20px;">
                               <div class="col-md-3 col-sm-12 mob20">
			                            <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft soft-skill-course-icon"></i>
				                            <p class="soft-engi-course-name">Conflict Resolution</p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-3 col-sm-12 mob20">
			                            <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft soft-skill-course-icon"></i>
				                            <p class="soft-engi-course-name">Problem Solving Skills</p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-3 col-sm-12 mob20">
			                            <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft soft-skill-course-icon"></i>
				                            <p class="soft-engi-course-name">Critical Thinking</p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-3 col-sm-12 mob20">
			                            <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft soft-skill-course-icon"></i>
				                            <p class="soft-engi-course-name">Improving Productivity</p>
				                        </div>
			                    </div><!-- end col -->

			               </div> 
			              	
			     
			              
                       </div>
                       <div role="tabpanel" class="tab-pane" id="settings">
                           <div class="tab-padding clearfix">
                               <div class="col-md-4 col-sm-12 mob20">
			                            <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft course-icon"></i>
				                            <p class="course-name">Professional responsive and retina ready template.</p>
				                        </div>
			                        </div><!-- end col -->
			                    <div class="col-md-4 col-sm-12 mob20">
			                            <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft course-icon"></i>
				                            <p class="course-name">Professional responsive and retina ready template.</p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-4 col-sm-12 mob20">
			                            <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft course-icon"></i>
				                            <p class="course-name">Professional responsive and retina ready template.</p>
				                        </div>
			                    </div><!-- end col -->

			               </div> 
			              	<div class="tab-padding clearfix" style="margin-top: 20px;">
                               <div class="col-md-4 col-sm-12 mob20">
			                            <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft course-icon"></i>
				                            <p class="course-name">Professional responsive and retina ready template.</p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-4 col-sm-12 mob20">
			                            <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft course-icon"></i>
				                            <p class="course-name">Professional responsive and retina ready template.</p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-4 col-sm-12 mob20">
			                            <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft course-icon"></i>
				                            <p class="course-name">Professional responsive and retina ready template.</p>
				                        </div>
			                    </div><!-- end col -->

			               </div>
			               <div class="tab-padding clearfix" style="margin-top: 20px;">
                               <div class="col-md-4 col-sm-12 mob20">
			                            <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft course-icon"></i>
				                            <p class="course-name">Professional responsive and retina ready template.</p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-4 col-sm-12 mob20">
			                            <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft course-icon"></i>
				                            <p class="course-name">Professional responsive and retina ready template.</p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-4 col-sm-12 mob20">
			                            <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft course-icon"></i>
				                            <p class="course-name">Professional responsive and retina ready template.</p>
				                        </div>
			                    </div><!-- end col -->

			               </div>
			               <div class="tab-padding clearfix" style="margin-top: 20px;">
                               <div class="col-md-4 col-sm-12 mob20">
			                            <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft course-icon"></i>
				                            <p class="course-name">Professional responsive and retina ready template.</p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-4 col-sm-12 mob20">
			                            <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft course-icon"></i>
				                            <p class="course-name">Professional responsive and retina ready template.</p>
				                        </div>
			                    </div><!-- end col -->
			                    <div class="col-md-4 col-sm-12 mob20">
			                            <div class="tab-boxes shadow">
				                            <i class="fa fa-graduation-cap alignleft course-icon"></i>
				                            <p class="course-name">Professional responsive and retina ready template.</p>
				                        </div>
			                    </div><!-- end col -->
                           </div>
                       </div>
                   </div>
               </div>
           </div><!-- end col -->
       </div><!-- end row -->
   </div><!-- end container -->
</section><!-- end section -->

<section class="section course-section">
    <div class="container">
    <div class="section-title-2 text-center course-title">
        <h2>Companies We Served</h2>
        <hr>
    </div><!-- end section-title -->
        <div id="owl-client" class="clients">
            <!-- <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/coforge.png" alt="" class="img-responsive"></a>
            </div>end logo

            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/directi.png" alt="" class="img-responsive"></a>
            </div>end logo

            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/hdfc_logo.png" alt="" class="img-responsive"></a>
            </div>end logo

            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/hexaware.png" alt="" class="img-responsive"></a>
            </div>end logo
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/lti.png" alt="" class="img-responsive"></a>
            </div>end logo
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/magna.png" alt="" class="img-responsive"></a>
            </div>end logo

            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/nucleussoftware.png" alt="" class="img-responsive"></a>
            </div>end logo
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/tech-mahendra.png" alt="" class="img-responsive"></a>
            </div>end logo -->
            
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/contentbloom.png" alt="" class="img-responsive"></a>
            </div>

            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/dxc.png" alt="" class="img-responsive"></a>
            </div>

            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/flutura.png" alt="" class="img-responsive"></a>
            </div>

            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/newpage.png" alt="" class="img-responsive"></a>
            </div>
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/tata.png" alt="" class="img-responsive"></a>
            </div>
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/visionet.png" alt="" class="img-responsive"></a>
            </div>
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/skillmine.png" alt="" class="img-responsive"></a>
            </div>
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/coforge.png" alt="" class="img-responsive"></a>
            </div>
             <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/diageo.png" alt="" class="img-responsive"></a>
            </div>
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/fitterfly.png" alt="" class="img-responsive"></a>
            </div>
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/fulcrumdigital.png" alt="" class="img-responsive"></a>
            </div>
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/gspann.png" alt="" class="img-responsive"></a>
            </div>
            <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/Mahat.png" alt="" class="img-responsive"></a>
            </div>
             <div class="client-logo">
                <a href="#"><img src="/resources/images/clients/neoware.png" alt="" class="img-responsive"></a>
            </div>
        </div><!-- end row -->
    </div><!-- end container -->
</section>
<!-- <section class="section bgg course-section">
    <div class="container">
	    <div class="section-title-2 text-center course-title">
	        <h2>Testimonials</h2>
	        <hr>
	    </div>
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-12">
                <div class="testimonial text-center">
                    <img class="img-circle" src="/resources/images/testimonial/john_small.png" alt="">
                    <div class="testimonial-meta">
                    <h4>Prabir K</h4>
                    </div>
                    <p>"Tremendous learning opportunity at the Data Science batch I was part of. The faculty was very knowledgeable and in-depth. Although the course was compact, it really taught a huge lot of details on Data Science space"</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12">
                <div class="testimonial text-center">
                    <img class="img-circle" src="/resources/images/testimonial/mark_small.png" alt="">
                    <div class="testimonial-meta">
                    <h4>Sujoy R</h4>
                    </div>
                    <p>"I want to switch my technology to Machine Learning. There are opportunities in my company but I needed to learn the Machine Learning techniques quickly so that I can start in a project. Teksands Machine Learning mastery gave me that opportunity to learn the maximum at the shortest time. The quality of the training was awesome."</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12">
                <div class="testimonial text-center">
                    <img class="img-circle" src="/resources/images/testimonial/john_small.png" alt="">
                    <div class="testimonial-meta">
                    <h4>Justin P</h4>
                    </div>
                    <p>"I am managing projects for some time and our customers are asking more and more automations using smart technologies like Predictive Models or Machine Learning. I wanted to learn the Technology myself but can't go through an 8 months course for that. Thankful to Teksands for the High Impact Series course on Machine Learning. The faculty was great and experience was fully hands-on"</p>
                </div>
            </div>
        </div>
    </div>
</section>-->

<section class="section litpadtop bgw course-section">
<div class="container">
    <div class="row">
        <div id="sidebar1" class="col-md-12 col-sm-12">
            <div class="widget clearfix">
                <div class="member-profile">
			    <div class="section-title-2 text-center course-section">
			        <h2>Success Stories</h2>
			        <hr>
			    </div><!-- end section-title -->

                    <div class="row profile-badges">
                        <div class="col-md-12 col-sm-12 wow fadeIn">
                            <div class="boxes text-left service-first withcircle withborder leftservice">
                                <i class="fa fa-user-plus alignleft"></i>
                                <p style="text-align:justify" class="stories">Indian multinational IT services company needed to create a series of AI-based solutions for a financial services client for their risk modelling domain. About 10 members had to be inducted in the team of which 7 did not have the right level of Deep Learning knowledge especially on RNN/LSTM architectures which was to be used extensively. We created a custom training plan for the team focusing on Deep Learning foundations to advanced level spanning about 50 (online) theory hours and 100 practical hours. Training was attended by 18 staff members, followed by custom developed assessments to evaluate competency levels. 2 support sessions were scheduled for each of the next 3 weeks for the team to clear any doubts. 3 custom created projects (similar to the kind of projects they were to work on) were assigned to the team to work on and present to the management and trainer and feedbacks provided.</p>
                            </div><!-- end box -->
                        </div><!-- end col -->

                        <div class="col-md-12 col-sm-12 wow fadeIn" style="margin-top: 20px;">
                            <div class="boxes text-left service-first withcircle withborder leftservice">
                                <i class="fa fa-trophy alignleft"></i>
                                <p style="text-align:justify">Indian mid-sized service company wanted to introduce DevOps their financial services accounts and wanted complete teams to go through complete DevOps stack to be applied on Java and .Net development stacks. These were to be showcase examples and value-add offerings to their customers. A DevOps training curriculum was created comprising Jenkins, Docker, Git, Ansible, Selenium, Chef, Ansible, Splunk and Kubernetes. Custom assessments and projects were created and learners were supported through the e2e deployment by them. We ran 7 batches of ~20 members each for this company.</p>
                            </div><!-- end box -->
                        </div><!-- end col -->

                        <div class="col-md-12 col-sm-12 wow fadeIn" style="margin-top: 20px;">
                            <div class="boxes text-left service-first withcircle withborder leftservice">
                                <i class="fa fa-birthday-cake alignleft"></i>
                                <p style="text-align:justify">A startup company embarked on a new app development using React Native, Mongo DB, Node JS. About 12 members of the team had to be trained. The training was created in such a way that the blueprint of the app was created as part of the training, a pilot design, complete implementation of the pilot using the above technologies and DevOps including microservices were done as part of the training. Post training support for development of the app was given by the trainer for the next 1 month with 8 contact hours every week.</p>
                            </div><!-- end box -->
                        </div><!-- end col -->
                    </div><!-- end row -->
                </div><!-- end team-member -->
            </div>
        </div><!-- end right -->
    </div><!-- end row -->
</div><!-- end container -->
</section><!-- end section -->


<section class="welcomebox-wrapper">
    <div class="container">
        <div class="welcomebox m900">   
            <div class="row">
                <div class="col-md-8 col-sm-8 col-xs-12">
                    <h3 style="font-size: 20px;font-weight: bold;color: #fff;">Download course list</h3>
                </div><!-- end col -->
            <div class="col-md-4 col-sm-4 col-xs-12 text-right">
                <a href="javascript:void(0);" class="btn btn-default" data-toggle="modal" data-target="#DownloadformModal">Download</a>
                
            </div><!-- end col -->
        </div><!-- end row -->
    </div><!-- end callout -->  
    </div>
</section><!-- end section -->

<section class="section litpadtop bgw custom-section">
<div class="container">
    <div class="row">
        <div id="sidebar1" class="col-md-12 col-sm-12">
            <div class="widget clearfix">
                <div class="member-profile">
			    <div class="section-title-2 text-center manager-section">
			        <h2>Talk to our Corporate Relationship Manager</h2>
			        <hr>
			    </div><!-- end section-title -->

                    <div class="row profile-badges contact-rm">
                        <div class="contact_form">
                                <div class="col-md-12">
                                <input type="text" id="txt_name" class="form-control" placeholder="Name" maxlength="100" onkeydown="return /[a-z ]/i.test(event.key)"> 
                                <input type="text" id="txt_company" class="form-control" placeholder="Company"> 
                                <input type="text" id="txt_email" class="form-control" placeholder="Email"  maxlength="100"> 
                                <input type="text" id="txt_mobile" class="form-control" placeholder="Mobile"  onkeypress='return isNumberKey(event);'> 
                                <textarea class="form-control" id="txt_requirements" rows="6" placeholder="Requirements"></textarea>
                                <div class="text-center"><button type="button" value="submit" id="submit" class="button button--wayra" onclick="saveContacts()"> Contact Us Today</button></div>
                                </div>
                        </div>
                    </div><!-- end row -->
                </div><!-- end team-member -->
            </div>
        </div><!-- end right -->
    </div><!-- end row -->
</div><!-- end container -->
</section><!-- end section -->


