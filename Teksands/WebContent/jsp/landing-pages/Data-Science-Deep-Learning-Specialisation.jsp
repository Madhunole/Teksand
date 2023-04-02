<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
 <html>
 <head>
  <link rel="icon" href="/resources/landing-pages/style/cropped-ts-favicon.png" type="image/png" >

    <link href="/resources/landing-pages/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/landing-pages/js/bootstrap.js" rel="stylesheet">

     <meta charset='utf-8'>
     <meta http-equiv='X-UA-Compatible' content='IE=edge'>
     <title>Post Graduate Program on Applied Data Science with Deep Learning</title>
     <meta name="description" content="Data science has became a career buzzword for IT professionals.Click here to know more about Data Science course." />
     <meta name='viewport' content='width=device-width, initial-scale=1'>
     <meta name="robots" content="max-image-preview:standard">
      
     <link rel="alternate" href="https://teksands.ai/" hreflang="x-default" />
     <!--Fonts-->
     <!--ASAP & Roboto-->
     <link rel="preconnect" href="https://fonts.googleapis.com">
     <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
     <link href="https://fonts.googleapis.com/css2?family=Asap:wght@300;500;600;700&family=Roboto:wght@100;400;500;700&display=swap" rel="stylesheet">
     <link rel='stylesheet' type='text/css' media='screen' href='/resources/landing-pages/style/teks-rise.css'>
     
     <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
     <!-- <link rel="stylesheet" href="style/pgpads-s-course-content.css"> -->
    
     <link rel="stylesheet" href="/resources/js/sweetalert/sweetalert.css"/>
     <script src="/resources/js/sweetalert/sweetalert.min.js"></script>
    
     <script src="/resources/js/overlay/loadingoverlay.js"></script>
     
     
     <style>
     
     .brochure-form input[type=button] {
    width: 100%;
    padding: 10px 16px;
    margin: 8px 0;
    display: block;
    border: 1px solid rgba(204, 204, 204, 0);
    border-radius: 4px;
    background-color: #00acd3;
    color: #ffffff;
    font-weight: 500;
    font-size: 1rem;
	}
     
    </style>
     
     
<script>

function saveLeads()
{
    
    var name = $("#ds_name").val();
    var email = $("#ds_email").val();
    var mobile = $("#ds_mobile").val();
    var coursess = "Post Graduate Program on Applied Data Science with Deep Learning and Specialisation";
    
    if(name == ""){
    	swal("OOPS!", "Please Enter Name", "error")
   	    return false;
    }
    
    if(email == "") {
    	swal("OOPS!", "Please Enter Email", "error")
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
    if(!isEmail(email)) {
    	swal("OOPS!", "Please Enter Valid Email", "error")
   	    return false;
    }
    
    console.log("name = " + name);
    console.log("email = " + email);
    console.log("mobile = " + mobile);
    
    $.LoadingOverlay("show");
    
    $.ajaxSetup({async:true});
	$.post("/saveLeads", {name: "" + name + "", 
		email : "" + email + "",
		mobile : "" + mobile + "", 
		course : "" + coursess + ""}, function(data)
	{
		$.LoadingOverlay("hide");
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
   			swal("Thank you for your Interest.", "We have sent the Course Brochure to your email.", "success");
   			
   			$( '#brochure-download' ).each(function(){
   			    this.reset();
   			});

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

</script>

   
 <script type="application/ld+json">
	{
  		"@context": "https://schema.org",
  		"@type": "CollegeOrUniversity",
  		"name": "Teksands",
  		"url": "https://teksands.ai/",
  		"logo": "https://teksands.ai/resources/images/teksands_logo.jpg",
  		"sameAs": [
    		"https://www.facebook.com/Teksands/",
    		"https://www.instagram.com/teksands.ai/",
    		"https://www.youtube.com/channel/UCrfexSD469V7WXVAAVd3Uag/featured",
    		"https://twitter.com/teksands",
    		"https://www.linkedin.com/company/teksands/"
  		]
	}
	</script>
	
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/",
  		"@type": "WebSite",
  		"name": "Teksands",
  		"url": "https://teksands.ai/",
  		"potentialAction": {
    	"@type": "SearchAction",
    	"target": "https://teksands.ai/{search_term_string}",
    	"query-input": "required name=search_term_string"
  	}
	}
	</script>
	
	
 
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org",
  		"@type": "EmploymentAgency",
  		"name": "WRTR INK LLP",
  		"image": "https://lh5.googleusercontent.com/p/AF1QipMp3k4Opfr9Bv-rPQngVLxs_ASDXnmKp68s_ubp=w689-h240-k-no",
  		"@id": "",
  		"url": "https://www.google.com/maps/place/WRTR+INK+LLP/@20.9880134,73.7876857,5z/data=!4m14!1m8!3m7!1s0x3bae6bcec1a821d5:0xfd82d205157fa43c!2sWRTR+INK+LLP!8m2!3d20.9880134!4d82.7525294!14m1!1BCgIgARICEAE!3m4!1s0x3bae6bcec1a821d5:0xfd82d205157fa43c!8m2!3d20.9880134!4d82.7525294",
  		"telephone": "+91 9343518946",
  		"address": {
    	"@type": "PostalAddress",
    	"streetAddress": "Karnataka,",
    	"addressLocality": "Bangalore",
    	"postalCode": "560068",
    	"addressCountry": "IN"
  	},
  		"geo": {
   		"@type": "GeoCoordinates",
    	"latitude": 12.8892684,
    	"longitude": 77.63991
  	},
  		"openingHoursSpecification": {
    	"@type": "OpeningHoursSpecification",
    	"dayOfWeek": [
      	"Monday",
      	"Tuesday",
      	"Wednesday",
      	"Thursday",
      	"Friday",
      	"Saturday"
    ],
    	"opens": "09:00",
    	"closes": "06:00"
  	},
  	"sameAs": [
    "https://www.facebook.com/Teksands/",
    "https://twitter.com/teksands",
    "https://www.instagram.com/teksands.ai/",
    "https://www.youtube.com/channel/UCrfexSD469V7WXVAAVd3Uag/featured",
    "https://www.linkedin.com/company/teksands/",
    "https://teksands.ai/"
  	] 
	}
	</script>	
  
	<script type="application/ld+json">
	{
  		"@context": "https://schema.org/", 
  		"@type": "BreadcrumbList", 
  		"itemListElement": [{
    	"@type": "ListItem", 
    	"position": 1, 
    	"name": "Home",
    	"item": "https://teksands.ai/"  
  	},{
    	"@type": "ListItem", 
    	"position": 2, 
    	"name": "Upcoming Live Courses",
    	"item": "https://teksands.ai/upcoming-live-courses"  
  	},{
    	"@type": "ListItem", 
    	"position": 3, 
    	"name": "PGP Data Science",
    	"item": "https://teksands.ai/courses/pgp-data-science"  
  	}]
	}
	</script>	
	
 </head>
 <body>
     <header class="header">
         <a href="#" class="brand">
             <img src="https://teksands.ai/resources/images/teksands_logo.jpg" alt="Teksands Logo">
         </a>
     </header>
     <main>
         <!--Banner-->
         <div class="banner">
             <div class="overlay"></div>
             <div class="page-container">
                 <div class="flex">
                    <div class="banner-desc">
                        <h1 class="main-heading"> Post Graduate Program on Applied Data Science with Deep Learning and Specialisation (TEKS-RISE)</h1>
                        <p class="sub-heading">4 months + 1 month (Specialisation)</p>

                        <!-- <a href="https://site.teksands.ai/shop/machine-learning/teks-rise/" class="cta-btn" target="_blank">Enroll Now</a> -->
                     </div> 

                     <div class="form-group">
                 
                              <form class="brochure-form" id="brochure-download" method="post" action="">
                             	<p class="heading">Register for Demo Class / Download Brochure</p>
                             	<input type="text" id="ds_name" name="name" placeholder="Name" maxlength="100" onkeydown="return /[a-z ]/i.test(event.key)" required ><br/>
                             	<input type="email" id="ds_email" name="email" placeholder="Email"  maxlength="100"  required ><br/>
                             	<input  type="tel" min="10" id="ds_mobile" name="mobile" placeholder="Mobile Number" onkeypress='return isNumberKey(event);' required ><br>
                              <p class="agreement">By clicking the button below, you agree to receive communications from us about this programme and other relevant programmes. <a href="https://teksands.ai/privacy-policy/" target="_blank">Privacy Policy</a></p>
							  <input type="button" name="submit" value="SUBMIT" onclick="saveLeads()" >
                         </form>
                     </div>
                 </div>
             </div>
         </div>
         <!--Video Introduction-->
         <div class="bg-grey">
            <!-- <div class="page-container">
                <div>
                   <h2 class="sec-heading lg-center">Course Introduction</h2>
                </div>
                <div>
                   <iframe class="course-intro" src="https://player.vimeo.com/video/579362450" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>
                  
                </div>
            </div> -->
            <div class="bg-grey">
              <div class="page-container" style="padding-bottom: 0px;">
                <!-- <div class="course-overview"> -->
                  <div>
                    <div class="container intro-control">
                      <h2 class="sec-heading lg-center">Course Introduction</h2>
                      <p class="p-bold" style="text-align: justify;">This course spans 4 months + 1 month Specialisation</p>
                      <!-- <p class="sec-color p-bold">Course Starts on 27th September, Timings: 6-8 pm, Monday - Friday.</p> -->

                      <p style="text-align: justify;">
                        Data science became a career buzzword for IT professionals when a Harvard Business Review termed it as "The Sexiest Job of the 21st Century". According to the U.S. Bureau of Labour Statistics, growth for data science jobs skills will grow about 30% year on year through 2026. At this point in time in 2021, the average salary of a Data Scientist / Analyst is to the tune of US$ 120K annually.
                      </p>
                      <p style="text-align: justify;">
                        Why Data Science is a sought after skill for employers: Companies across industries are rushing towards automated decision making for all of their departments and that is possible through the application of various Data Science, Analytics, Machine Learning and <a href="https://teksands.ai/blog/optimizers-in-deep-learning" target="_blank"><b>Deep Learning</b></a> skills. Every functional field in any company are seeking out opportunities to keep making their systems smarter and decisions smarter - be it automated voice assistants, smart cars, smart factories, smart marketing and advertising, smart sales predictions, smart investment decisioning and many more.
                      </p>

                      <div class="br">
                        <br />
                      </div>
                      <div class="skills-required">
                        <h4 class="sec-heading lg-center">Skills Required for Data Scientists</h4>
                        <p style="text-align: justify;">
                          If it is your goal is to become a Data Scientist, you have to first understand what it takes to become one, the skills and competencies that you should learn. Data Science is an amazingly interesting field, full of interesting concepts and power to create magic from Data.
                        </p>

                        <p style="text-align: justify;">

                        <p style="text-align: justify;">
                          Comprehensive knowledge on Deep Learning, ML-Ops and AI/ML Product Development are critical knowledge areas for any Data Scientist/Data Engineer/Machine-Learning Professional. This course places a lot of focus into these areas so that there is no learning gap when you start on a Data Science/Machine Learning role.
                        </p>

                        <p style="text-align: justify;">
                          The curriculum prepares you to be a leader in this field through mastery of core data science concepts like Statistical Analysis of Data, Exploratory Data Analysis Techniques using Python, powerful Visualizations, Machine Learning, Deep Learning and Model Deployment in Production. By diving deep on key topics as above in a fully practical way, you'll be prepared to succeed within today's organizations. You'll also work with real data sets from top companies as you build a work portfolio that showcase your skills. Learn the systems and techniques that help organizations overcome data overload and make smart decisions.
                        </p>
                      </div>
                      <br>
                      <div>
                        <h2 class="sec-heading lg-center">Curriculum Approach</h2>
                        <div style="max-width: 1200px;margin: 0 auto;">
                          <p style="text-align: justify;">
                            Curriculum for this Applied Data Science program has been modelled around the life-cycle of Data Science Projects. There is special emphasis on selection of Languages, Algorithms, Libraries, Tools, Projects and Assignments that enable our learners to achieve that. There is special emphasis on Deep Learning and applications of Deep Learning for solving complex problems, ML-Ops so that learners have a hands-on exposure on what happens in real-life situations in terms of going live with your models and maintaining them in production. We also spend a week on industry trends and ML/AI product development practices and mechanics. These topics and exposures will enable our learners with the ability to take up a wide-variety of challenges and job roles.
                          </p>
                        </div>
                      </div>
                      <br>
                      <div class="curriculum-img">
                        <img src="/resources/landing-pages/assets/curriculum-approach-1.png" alt="curriculum approach" class="img-responsive" >
                      </div>
                  </div>
              </div>
           </div>
         </div>


         <!--Course Features-->
         <div class="gradient-bg">
             <div class="page-container">
                <div>
                    <h2 class="sec-heading lg-center text-white special-underline">Course Features</h2>
                    <!-- <p class="all-p">Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor, aperiam officia! Ipsa sed consequatur error unde. Tenetur sed vitae rerum facere, delectus nisi rem autem cum ad blanditiis eos unde?</p> -->
                </div>
                <div class="features-container2 width-control">
                    <div class="features2">
                        <img src="/resources/landing-pages/assets/course-features-1.svg" alt="course features">
                        <p class="features-p">Exploratory and Collaborative Programming</p>
                    </div>
                    <div class="features2">
                        <img src="/resources/landing-pages/assets/course-features-2.svg" alt="course features">
                        <p class="features-p">Business Domain Understanding</p>
                    </div>
                    <div class="features2">
                        <img src="/resources/landing-pages/assets/course-features-3.svg" alt="course features">
                        <p class="features-p">Quizzes, Assignment and Capstone</p>
                    </div>
                    <div class="features2">
                        <img src="/resources/landing-pages/assets/course-features-4.svg" alt="course features">
                        <p class="features-p">Data Science Leadership</p>
                    </div>
                    <div class="features2">
                        <img src="/resources/landing-pages/assets/course-features-5.svg" alt="course features">
                        <p class="features-p">Career Oriented Course</p>
                    </div>
                    <div class="features2">
                        <img src="/resources/landing-pages/assets/course-features-6.svg" alt="course features">
                        <p class="features-p">Pre-requisites and Students Backgrounds</p>
                    </div>
                    <div class="features2">
                        <img src="/resources/landing-pages/assets/course-features-7.svg" alt="course features">
                        <p class="features-p">Renowned Faculty</p>
                    </div>
                    <div class="features2">
                        <img src="/resources/landing-pages/assets/Real-life-Projects.png" alt="course features">
                        <p class="features-p">Real-life Projects</p>
                    </div>
                    <div class="features2">
                        <img src="/resources/landing-pages/assets/Machine_Learning_Logo.png" alt="course features">
                        <p class="features-p">ML-Ops</p>
                    </div>
                    <div class="features2">
                        <img src="/resources/landing-pages/assets/product-development.png" alt="course features">
                        <p class="features-p">Machine Learning Product Development</p>
                    </div>
                    <div class="features2">
                        <img src="/resources/landing-pages/assets/Placement-Assistance.png" alt="course features">
                        <p class="features-p">Placement Assistance</p>
                    </div>
                </div>
             </div>
         </div>
         <!--Program Structure-->
         <div>
          <div class="page-container">
              <div>
                 <div >
                     <h2 class="sec-heading lg-center">Program Structure</h2>
                 </div>
                 <div class="course-table" style="overflow-x:auto; max-width: 960px; margin: 0 auto;">
                     <table class="batch-table width-control">
                         <tr>
                              <th>Program</th>
                              <th>Duration</th>
                         </tr>
                         <tr>
                             <td>Post Graduate Program on Applied Data Science with Deep Learning and Specialisation (TEKS-RISE)</td>
                             <td>4 Months</td>
                             <!-- <td>
                                 <a class="cta" href="https://teksands.ai/shop/machine-learning/machine-learning-mastery/" target="_blank">Register</a><br>
                                 <a class="cta" href="#brochure-download">Request Brochure/ Register for Demo Class</a>
                              </td> -->
                         </tr>
                         <tr>
                          <td>Specialisation Options (R Language, Tableau)</td>
                          <td>1 Month</td>
                         </tr>
                     </table> 
                     <!-- <div style="text-align: center; margin:20px auto; font-weight: 800;">
                       <p>
                        Mode: Live Online, Instructor Led
                       </p>
                       <p>
                        Days/Timings: Weekend Batches / Morning 10:00 am - 1 pm (Saturday/Sunday) 
                       </p>
                     </div> --> 
                     <table class="batch-table" style="margin-top: 20px;">
                        <tr>
                          <th>Mode</th>
                          <th>Days/Timings</th>
                        </tr>
                        <tr>
                          <td>Live Online, Instructor Led</td>
                          <td>Weekend Batches / Morning 10:00 am - 1 pm (Saturday/Sunday)</td>
                        </tr>
                     </table>
                 </div>
              </div>
          </div>
      </div>
         <!--Detailed Course Description-->
         <div class="gradient-bg">
             <div class="page-container">
                <div>
                    <h2 class="sec-heading lg-center special-underline" style="color: aliceblue;">Curriculum</h2>
                    <div class="features-container2 width-control">
                        <div class="features2">
                            <img src="/resources/landing-pages/assets/curriculum-1.svg" alt="curriculum">
                            <p class="features-p">Data Acquisition Techniques</p>
                        </div>
                        <div class="features2">
                            <img src="/resources/landing-pages/assets/curriculum-2.svg"  alt="curriculum">
                            <p class="features-p">Exploratory Data Analysis using Pandas, Numpy libraries</p>
                        </div>
                        <div class="features2">
                            <img src="/resources/landing-pages/assets/curriculum-3.svg"  alt="curriculum">
                            <p class="features-p">Visualizations using Matplotlib, Seaborn libraries</p>
                        </div>
                        <div class="features2">
                            <img src="/resources/landing-pages/assets/curriculum-4.svg"  alt="curriculum">
                            <p class="features-p" style="font-size: small;">Modelling and Predictive Techniques - Supervised Learning, Unsupervised Learning, Prediction Problems, Classification Problems, Clustering using Scikit Learn, StatsModel libraries</p>
                        </div>
                        <div class="features2">
                            <img src="/resources/landing-pages/assets/curriculum-5.svg" alt="curriculum">
                            <p class="features-p">Applied Part - Portfolio Projects</p>
                        </div>
                        <div class="features2">
                            <img src="/resources/landing-pages/assets/curriculum-6.svg" alt="curriculum">
                            <p class="features-p">Deep Learning with CNN, RNN, LSTM, Attention models using Tensorflow and Keras</p>
                        </div>
                        <div class="features2">
                          <img src="/resources/landing-pages/assets/curriculum-7.svg"  alt="curriculum">
                          <p class="features-p">ML-Ops on GCP platform</p>
                        </div>
                        <div class="features2">
                            <img src="/resources/landing-pages/assets/curriculum-8.svg" alt="curriculum">
                            <p class="features-p">Data Science Leadership</p>
                        </div>
                    </div>
                </div>
                <br><br>
                <p class="curriculum-note" style="text-align:center;background-color: rgb(185, 250, 255);">
                  Python will be used as the primary programming language throughout the course. Teksands will organise pre-course Python sessions for those with little or no exposure to Python.
                </p>
             </div>
         </div>
         <!-- Libraries covered -->
         <div>
          <div class="page-container">
              <div>
                 <h2 class="sec-heading lg-center">Libraries Covered</h2>
              </div>
              <div class="projects-container">
                  <!--1-->
                 <div class="libs text-center">
                     <img class="lib-img" src="/resources/landing-pages/assets/pgpads-s-lib-1.png" alt="Real Life Projects">
                 </div>
                 <!--2-->
                 <div class="libs text-center">
                     <img class="lib-img" src="/resources/landing-pages/assets/pgpads-s-lib-2.png" alt="Real Life Projects">
                     <!-- <h5 class="real-proj"></h5> -->
                 </div>
                 <!--3-->
                 <div class="libs text-center">
                     <img class="lib-img" src="/resources/landing-pages/assets/pgpads-s-lib-3.png" alt="Real Life Projects">
                     <!-- <h5 class="real-proj"></h5> -->
                 </div>
                 <!--4-->
                 <div class="libs text-center">
                     <img class="lib-img" src="/resources/landing-pages/assets/pgpads-s-lib-4.png" alt="Real Life Projects">
                     <!-- <h5></h5> -->
                 </div>
                 <!--5-->
                 <div class="libs text-center">
                     <img class="lib-img" src="/resources/landing-pages/assets/pgpads-s-lib-5.svg" alt="Real Life Projects">
                     <!-- <h5 class="real-proj"></h5> -->
                 </div>
                 <!-- 6 -->
                 <div class="libs text-center">
                  <img class="lib-img" src="/resources/landing-pages/assets/pgpads-s-lib-6.png" alt="Real Life Projects">
                  <!-- <h5 class="real-proj"></h5> -->
                </div>
                <!-- 7 -->
                 <div class="libs text-center">
                   <img class="lib-img" src="/resources/landing-pages/assets/pgpads-s-lib-7.png" alt="Real Life Projects">
                   <!-- <h5 class="real-proj"></h5> -->
               </div>
               <!-- 8 -->
               <div class="libs text-center">
                <img class="lib-img" src="/resources/landing-pages/assets/pgpads-s-lib-8.png" alt="Real Life Projects">
                <!-- <h5 class="real-proj"></h5> -->
              </div>
              <!-- 9 -->
              <div class="libs text-center">
                <img class="lib-img" src="/resources/landing-pages/assets/pgpads-s-lib-9.png" alt="Real Life Projects">
                <!-- <h5 class="real-proj"></h5> -->
              </div>
             </div>
          </div>
      </div>
        
         <!-- Course Outline -->
        <div class="page-container">
          <div class="nav course-outline-head">
            <h2 class="lg-center">Course Outline</h2>
            <button class="btn expand-button" id="expand">Expand All</button>
          </div>

        </div>
        
        <div class="content lesson">
          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >1</span> 
                  <div class='topic-content'>
                    <div>Week 1: Introduction to Data Science</div>
                    <div>6 Topics</div>
                  </div>
          </div>
          <div class="accordion-items ">
            <div>
              <!-- List Header -->
              <div class="list-header">
                <div >
                  <span class="ld-text"> Lesson Content </span>
              </div>
              <div class="ld-table-list-lesson-details">
                  <!-- <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/6 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>
                    Introduction to Applied Data Science
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Domains, Business and Data
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Use Cases and Problem Statement understanding
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Data Science Project Life Cycle
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Exploratory and Colloborative Programming
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Quiz
                  </p>
                </div>
              </div>
            </div>
          </div>

          <!-- First lesson ends here -->
          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >2</span> 
                  <div class='topic-content'>
                    <div>Week 1-2: Collecting and Processing Data</div>
                    <div>7 Topics</div>
                  </div>
          </div>
          <div class="accordion-items">
            <div>
              <!-- List Header -->
              <div class="list-header">
                <div >
                  <span class="ld-text"> Lesson Content </span>
              </div>
              <div class="ld-table-list-lesson-details">
                  <!-- <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/7 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>
                    Advanced Data Structures and Manipulation using Python
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    RDBMS and writing SQL
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Working with Files
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Processing Big Data
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Experiment Design and Analysis
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Data Analysis using Excel
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Quiz
                  </p>
                </div>
              </div>
            </div>
          </div>

          <!-- Second lesson ends here -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >3</span> 
                  <div class='topic-content'>
                    <div>Week 2-3: Data Science Concepts</div>
                    <div>7 Topics</div>
                  </div>
          </div>
          <div class="accordion-items">
            <div>
              <!-- List Header -->
              <div class="list-header">
                <div >
                  <span class="ld-text"> Lesson Content </span>
              </div>
              <div class="ld-table-list-lesson-details">
                  <!-- <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/7 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>
                    Supervised and Unsupervised Learning
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Predictive Modelling / Machine Learning
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Types of Algorithms
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Scenario-Algorithm Selection
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Model Training Selection
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Cost Functions
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Quiz
                  </p>
                </div>
              </div>
            </div>
          </div>

          <!-- Third lesson ends here  -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >4</span> 
                  <div class='topic-content'>
                    <div>Week 4: Statistical Techniques</div>
                    <div>5 Topics</div>
                  </div>
          </div>
          <div class="accordion-items">
            <div>
              <!-- List Header -->
              <div class="list-header">
                <div >
                  <span class="ld-text"> Lesson Content </span>
              </div>
              <div class="ld-table-list-lesson-details">
                  <!-- <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/5 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>
                    Descriptive Statistics
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Inferential Statistics
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Probability Theory
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Tests of Significance
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Quiz
                  </p>
                </div> 
              </div>
            </div>
          </div>

          <!-- Fouth lesson ends here -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >5</span> 
                  <div class='topic-content'>
                    <div>Week 4-5: Exploratory Data Analysis</div>
                    <div>8 Topics</div>
                  </div>
          </div>
          <div class="accordion-items">
            <div>
              <!-- List Header -->
              <div class="list-header">
                <div>
                  <span class="ld-text"> Lesson Content </span>
              </div>
              <div class="ld-table-list-lesson-details">
                  <!-- <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/8 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>
                    Statistical Techniques
                  </p>
                </div>
                <div class="lesson-item">
                  <p>Linear Algebra</p>
                </div>
                <div class="lesson-item">
                  <p>Visual Exploration</p>
                </div>
                <div class="lesson-item">
                  <p>Data Mining</p>
                </div>
                <div class="lesson-item">
                  <p>Feature Engineering</p>
                </div>
                <div class="lesson-item">
                  <p>Machine Learning Pipelines</p>
                </div>
                <div class="lesson-item">
                  <p>Causal Inference</p>
                </div>
                <div class="lesson-item">
                  <p>Quiz</p>
                </div>
                <div class="lesson-item">
                  <p>EDA Project Assignment</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Fifth lesson ends here -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >6</span> 
                  <div class='topic-content'>
                    <div>Week 5-6: Predictive Modelling / Machine Learning 1 - Linear Regression</div>
                    <div>9 Topics</div>
                  </div>
          </div>
          <div class="accordion-items">
            <div>
              <!-- List Header -->
              <div class="list-header">
                <div >
                  <span class="ld-text"> Lesson Content </span>
              </div>
              <div class="ld-table-list-lesson-details">
                  <!-- <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/9 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Solving Prediction Problems through Linear Regression</p>
                </div>
                <div class="lesson-item">
                  <p>Data Exploration</p>
                </div>
                <div class="lesson-item">
                  <p>Pre-processing and Feature Engineering</p>
                </div>
                <div class="lesson-item">
                  <p>Creating an LR model</p>
                </div>
                <div class="lesson-item">
                  <p>Optimizing Models through RFE and VIF methods</p>
                </div>
                <div class="lesson-item">
                  <p>Testing LR Assignments</p>
                </div>
                <div class="lesson-item">
                  <p>LR Project Assignment</p>
                </div>
                <div class="lesson-item">
                  <p>Quiz</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Sixth lesson ends here -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >7</span> 
                  <div class='topic-content'>
                    <div>Week 6-7: Predictive Modelling / Machine Learning 2 - Logistic Regression</div>
                    <div>8 Topics</div>
                  </div>
          </div>
          <div class="accordion-items">
            <div>
              <!-- List Header -->
              <div class="list-header">
                <div >
                  <span class="ld-text"> Lesson Content </span>
              </div>
              <div class="ld-table-list-lesson-details">
                  <!-- <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/8 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Estimating Probabilities</p>
                </div>
                <div class="lesson-item">
                  <p>
                    Logistic Regression Cost Functions
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Softmax Regression
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Performance Matrix
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    ROC Curve and AUC
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Optimizing Logistic Regression
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Quiz
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Logistic Regression Project Assignment
                  </p>
                </div>
              </div>
            </div>
          </div>

          <!-- Seventh lesson ends here -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >8</span> 
                  <div class='topic-content'>
                    <div>Week 7-8: Predictive Modelling / Machine Learning 4 - Decision Tree and Random Forest</div>
                    <div>8 Topics</div>
                  </div>
          </div>
          <div class="accordion-items">
            <div>
              <!-- List Header -->
              <div class="list-header">
                <div >
                  <span class="ld-text"> Lesson Content </span>
              </div>
              <div class="ld-table-list-lesson-details">
                  <!-- <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/8 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>
                    Introduction to Decision Trees
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Gini Index and Entropy
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Measuring Performance
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Introduction to Random Forest
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Random Forest Process Steps
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Model Performance and Tuning
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Quiz
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Random Forest Project Assignment
                  </p>
                </div>
              </div>
            </div>
          </div>

          <!-- Eighth lesson ends here -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >9</span> 
                  <div class='topic-content'>
                    <div>Week 8: Predictive Modelling / Machine Learning 5 - Dimensionality Reduction</div>
                    <div>9 Topics</div>
                  </div>
          </div>
          <div class="accordion-items">
            <div>
              <!-- List Header -->
              <div class="list-header">
                <div >
                  <span class="ld-text"> Lesson Content </span>
              </div>
              <div class="ld-table-list-lesson-details">
                  <!-- <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/9 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Introduction to PCA(Predictive Component Analysis)</p>
                </div>
                <div class="lesson-item">
                  <p>PCA Process Steps</p>
                </div>
                <div class="lesson-item">
                  <p>Data Standardization</p>
                </div>
                <div class="lesson-item">
                  <p>Finding Covariance Matrix of our Dataset</p>
                </div>
                <div class="lesson-item">
                  <p>Eigen Vectors and Eigen Values</p>
                </div>
                <div class="lesson-item">
                  <p>Recast Data using new PCAs</p>
                </div>
                <div class="lesson-item">
                  <p>Expained Variance Ration and Screen Plot</p>
                </div>
                <div class="lesson-item">
                  <p>Quiz</p>
                </div>
                <div class="lesson-item">
                  <p>PCA Project Assignment</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Ninth lesson ends here -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >10</span> 
                  <div class='topic-content'>
                    <div>Week 9: Predictive Modelling / Machine Learning 6 - Advanced Classifier: SVM</div>
                    <div>6 Topics</div>
                  </div>
          </div>
          <div class="accordion-items">
            <div>
              <!-- List Header -->
              <div class="list-header">
                <div >
                  <span class="ld-text"> Lesson Content </span>
              </div>
              <div class="ld-table-list-lesson-details">
                  <!-- <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/6 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Introduction to Support Vector Machine</p>
                </div>
                <div class="lesson-item">
                  <p>Linear SVM Classifications</p>
                </div>
                <div class="lesson-item">
                  <p>Non-Linear SVM Classification</p>
                </div>
                <div class="lesson-item">
                  <p>Polynomial Kernel Trick</p>
                </div>
                <div class="lesson-item">
                  <p>Quiz</p>
                </div>
                <div class="lesson-item">
                  <p>SVM Project Assignment</p>
                </div>
              </div>
            </div>
          </div>

          <!--  Tenth lesson ends here -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >11</span> 
                  <div class='topic-content'>
                    <div>Week 9-10: Predictive Modelling / Machine Learning 7 - Clustering using K-Means</div>
                    <div>10 Topics</div>
                  </div>
          </div>
          <div class="accordion-items">
            <div>
              <!-- List Header -->
              <div class="list-header">
                <div >
                  <span class="ld-text"> Lesson Content </span>
              </div>
              <div class="ld-table-list-lesson-details">
                  <!-- <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/8 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Unsupervised Learning</p>
                </div>
                <div class="lesson-item">
                  <p>Introduction to PCA</p>
                </div>
                <div class="lesson-item">
                  <p>PCA Process Steps</p>
                </div>
                <div class="lesson-item">
                  <p>Centroid Optimizing / Convergence</p>
                </div>
                <div class="lesson-item">
                  <p>Other Considerations</p>
                </div>
                <div class="lesson-item">
                  <p>Optimizing Number of Clusters</p>
                </div>
                <div class="lesson-item">
                  <p>Quiz</p>
                </div>
                <div class="lesson-item">
                  <p>K-Means Project Assignment</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Eleventh lesson ends here  -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >12</span> 
                  <div class='topic-content'>
                    <div>Week 11: Neural Networks and Deep Learning</div>
                    <div>8 Topics</div>
                  </div>
          </div>
          <div class="accordion-items">
            <div>
              <!-- List Header -->
              <div class="list-header">
                <div>
                  <span class="ld-text"> Lesson Content </span>
              </div>
              <div class="ld-table-list-lesson-details">
                  <!-- <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/8 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Neural Nets</p>
                </div>
                <div class="lesson-item">
                  <p>
                    Perceptron and MLP (Multi Layered Perceptron)
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Introduction to TensorFlow
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Introduction to Keras
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Classification MLPs
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Regression MLP
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Quiz
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Deep Neural Network Project Assignment
                  </p>
                </div>
              </div>
            </div>
          </div>

          <!-- Twelfth lesson ends here  -->
          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >13</span> 
                  <div class='topic-content'>
                    <div>Week 12: CNN and Image Processing</div>
                    <div>8 Topics</div>
                  </div>
          </div>
          <div class="accordion-items">
            <div>
              <!-- List Header -->
              <div class="list-header">
                <div>
                  <span class="ld-text"> Lesson Content </span>
              </div>
              <div class="ld-table-list-lesson-details">
                  <!-- <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/8 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>CNN Architectures</p>
                </div>
                <div class="lesson-item">
                  <p>Training a CNN</p>
                </div>
                <div class="lesson-item">
                  <p>Image Pre-processing Techniques</p>
                </div>
                <div class="lesson-item">
                  <p>Transfer Learning with CNN</p>
                </div>
                <div class="lesson-item">
                  <p>TensorFlow Implementation of CNN</p>
                </div>
                <div class="lesson-item">
                  <p>Object Detection</p>
                </div>
                <div class="lesson-item">
                  <p>Quiz</p>
                </div>
                <div class="lesson-item">
                  <p>Object Detection Project Assignment</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Thirteenth lesson ends here  -->
          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >14</span> 
                  <div class='topic-content'>
                    <div>Week 13: RNN and LSTM</div>
                    <div>7 Topics</div>
                  </div>
          </div>
          <div class="accordion-items">
            <div>
              <!-- List Header -->
              <div class="list-header">
                <div>
                  <span class="ld-text"> Lesson Content </span>
              </div>
              <div class="ld-table-list-lesson-details">
                  <!-- <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/7 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>RNN Architectures/p>
                </div>
                <div class="lesson-item">
                  <p>Training an RNN</p>
                </div>
                <div class="lesson-item">
                  <p>Unstable Gradients Challenge</p>
                </div>
                <div class="lesson-item">
                  <p>LSTM Architecture</p>
                </div>
                <div class="lesson-item">
                  <p>Training and Predicting a Time Series</p>
                </div>
                <div class="lesson-item">
                  <p>Quiz</p>
                </div>
                <div class="lesson-item">
                  <p>LSTM Project Assignment</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Fourteenth lesson ends here  -->
          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >15</span> 
                  <div class='topic-content'>
                    <div>Week 14: Natural Language Processing with RNN and Attention Models</div>
                    <div>7 Topics</div>
                  </div>
          </div>
          <div class="accordion-items">
            <div>
              <!-- List Header -->
              <div class="list-header">
                <div>
                  <span class="ld-text"> Lesson Content </span>
              </div>
              <div class="ld-table-list-lesson-details">
                  <!-- <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/7 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Generating Text using a RNN</p>
                </div>
                <div class="lesson-item">
                  <p>Bidirectional RNN</p>
                </div>
                <div class="lesson-item">
                  <p>Attention Mechanism</p>
                </div>
                <div class="lesson-item">
                  <p>Encoder-Decoder Models</p>
                </div>
                <div class="lesson-item">
                  <p>Natural Machine Translation using an Encoder-Decoder Model</p>
                </div>
                <div class="lesson-item">
                  <p>Quiz</p>
                </div>
                <div class="lesson-item">
                  <p>NLP Project Assignment</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Fifteenth lesson ends here  -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >16</span> 
                  <div class='topic-content'>
                    <div>Week 15: ML-Ops using Google Cloud Platform</div>
                    <div>7 Topics</div>
                  </div>
          </div>
          <div class="accordion-items">
            <div>
              <!-- List Header -->
              <div class="list-header">
                <div>
                  <span class="ld-text"> Lesson Content </span>
              </div>
              <div class="ld-table-list-lesson-details">
                  <!-- <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/7 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Understanding ML Lifecycle</p>
                </div>
                <div class="lesson-item">
                  <p>Creating Docker Containers for ML Deployments</p>
                </div>
                <div class="lesson-item">
                  <p>Manage Kubernetes Deployments</p>
                </div>
                <div class="lesson-item">
                  <p>Setting up AI Pipelines</p>
                </div>
                <div class="lesson-item">
                  <p>Training, Tuning and Serving a Model</p>
                </div>
                <div class="lesson-item">
                  <p>Kubeflow Pipelines</p>
                </div>
                <div class="lesson-item">
                  <p>CI/CD on KubeFlow Pipelines</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Sixteenth lesson ends here  -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >17</span> 
                  <div class='topic-content'>
                    <div>Week 14-17: Capstone Project</div>
                    <div>3 Topics</div>
                  </div>
          </div>
          <div class="accordion-items">
            <div>
              <!-- List Header -->
              <div class="list-header">
                <div>
                  <span class="ld-text"> Lesson Content </span>
              </div>
              <div class="ld-table-list-lesson-details">
                  <!-- <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/3 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Choice and Briefing of Capstone Projects</p>
                </div>
                <div class="lesson-item">
                  <p>Research, Analysis and Methodology</p>
                </div>
                <div class="lesson-item">
                  <p>Presentation Techniques - Paper and Visual</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Seventeenth lesson ends here  -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >18</span> 
                  <div class='topic-content'>
                    <div>Week 16: Deep Learning Product Development</div>
                    <div>5 Topics</div>
                  </div>
          </div>
          <div class="accordion-items">
            <div>
              <!-- List Header -->
              <div class="list-header">
                <div>
                  <span class="ld-text"> Lesson Content </span>
              </div>
              <div class="ld-table-list-lesson-details">
                  <!-- <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/5 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Current AI Trends</p>
                </div>
                <div class="lesson-item">
                  <p>Start-ups and Products in Data Science/AI/ML</p>
                </div>
                <div class="lesson-item">
                  <p>Upcoming Genre of Products</p>
                </div>
                <div class="lesson-item">
                  <p>Understanding AI Products Development Lifecycle</p>
                </div>
                <div class="lesson-item">
                  <p>Deep Learning Market</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Eighteenth lesson ends here -->


        </div>
        
        <!-- Course outline ends here -->

        <!-- Specialisation Options -->
        <div class="page-container">
          <div class="nav course-outline-head">
            <h2 class="lg-center">Specialisation Options</h2>
            <button class="btn expand-button" id="expand-specialisation">Expand All</button>
          </div>
        </div>
        <div class="content lesson">
          <div class="accordion course-topic expand-specialisation-all">
            <span class="lesson-num" >1</span> 
                  <div class='topic-content'>
                    <div>Option 1: Tableau</div>
                    <div>11 Topics</div>
                  </div>
          </div>
          <div class="accordion-items">
            <div>
              <!-- List Header -->
              <div class="list-header">
                <div>
                  <span class="ld-text"> Lesson Content </span>
              </div>
              <div class="ld-table-list-lesson-details">
                  <!-- <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/11 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Create various Charts and Graphs</p>
                </div>
                <div class="lesson-item">
                  <p>Create Dashboards</p>
                </div>
                <div class="lesson-item">
                  <p>Create Data Hierarchies</p>
                </div>
                <div class="lesson-item">
                  <p>Story-telling</p>
                </div>
                <div class="lesson-item">
                  <p>Working with Parameters</p>
                </div>
                <div class="lesson-item">
                  <p>Creating Data Extracts</p>
                </div>
                <div class="lesson-item">
                  <p>Applying Filters</p>
                </div>
                <div class="lesson-item">
                  <p>Calculated Fields</p>
                </div>
                <div class="lesson-item">
                  <p>Mapping in Tableau</p>
                </div>
                <div class="lesson-item">
                  <p>Advanced Charts</p>
                </div>
                <div class="lesson-item">
                  <p>Publish to Tableau Online</p>
                </div>
              </div>
            </div>
          </div>
          <!-- Specialization 1 ends here -->
          <div class="accordion course-topic expand-specialisation-all">
            <span class="lesson-num" >2</span> 
                  <div class='topic-content'>
                    <div>Option 2: R Language</div>
                    <div>9 Topics</div>
                  </div>
          </div>
          <div class="accordion-items">
            <div>
              <!-- List Header -->
              <div class="list-header">
                <div>
                  <span class="ld-text"> Lesson Content </span>
              </div>
              <div class="ld-table-list-lesson-details">
                  <!-- <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/9 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Fundamentals of R</p>
                </div>
                <div class="lesson-item">
                  <p>Vectors</p>
                </div>
                <div class="lesson-item">
                  <p>Functions</p>
                </div>
                <div class="lesson-item">
                  <p>Packages</p>
                </div>
                <div class="lesson-item">
                  <p>Matrix</p>
                </div>
                <div class="lesson-item">
                  <p>DataFrames</p>
                </div>
                <div class="lesson-item">
                  <p>Visualisations using GGPlot2</p>
                </div>
                <div class="lesson-item">
                  <p>Creating a Linear Regression Model using R</p>
                </div>
                <div class="lesson-item">
                  <p>Creating a Logistic Regression Model using R</p>
                </div>
              </div>
            </div>
          </div>
        </div>
         <!--Reallife Projects-->
         <div>
          <div class="page-container">
              <div>
                 <h2 class="sec-heading lg-center">Real Life Projects</h2>
              </div>
              <div class="projects-container">
                  <!--1-->
                 <div class="projects text-center">
                     <img class="project-img" src="https://teksands.ai/resources/landing-pages/images/2021/07/project-1.png" alt="Real Life Projects">
                     <h5 class="real-proj">Price Prediction Problems</h5>
                 </div>
                 <!--2-->
                 <div class="projects text-center">
                     <img class="project-img" src="https://teksands.ai/resources/landing-pages/images/2021/07/project-2.png" alt="Real Life Projects">
                     <h5 class="real-proj">Customer Churn Analysis</h5>
                 </div>
                 <!--3-->
                 <div class="projects text-center">
                     <img class="project-img" src="https://teksands.ai/resources/landing-pages/images/2021/07/project-3.png" alt="Real Life Projects">
                     <h5 class="real-proj">Credit Card Fraud Detection</h5>
                 </div>
                 <!--4-->
                 <div class="projects text-center">
                     <img class="project-img" src="/resources/landing-pages/assets/project-email.png" alt="Real Life Projects">
                     <h5>Email Spam Filtering</h5>
                 </div>
                 <!--5-->
                 <div class="projects text-center">
                     <img class="project-img" src="https://teksands.ai/resources/landing-pages/images/2021/07/project-5.png" alt="Real Life Projects">
                     <h5 class="real-proj">Sentiment Analysis using NLP Techniques</h5>
                 </div>
                 <!-- 6 -->
                 <div class="projects text-center">
                   <img class="project-img" src="https://teksands.ai/resources/landing-pages/images/2021/07/project-4.png" alt="Real Life Projects">
                   <h5 class="real-proj">Product Recommender Engine</h5>
               </div>
               <!-- 7 -->
               <div class="projects text-center">
                 <img class="project-img" src="/resources/landing-pages/assets/social-media-analysis-tools-1.jpg" alt="Real Life Projects">
                 <h5 class="real-proj">Social Media Analysis</h5>
             </div>
             <!-- 8 -->
             <div class="projects text-center">
               <img class="project-img" src="https://teksands.ai/resources/landing-pages/images/2021/07/project-3.png" alt="Real Life Projects">
               <h5 class="real-proj">Image Recognition</h5>
             </div>
             <!-- 9 -->
             <div class="projects text-center">
               <img class="project-img" src="/resources/landing-pages/assets/driver-drowsiness-detection.jpeg" alt="Real Life Projects">
               <h5 class="real-proj">Driver Drowsiness Detection</h5>
             </div>
             <!-- 10 -->
             <div class="projects text-center">
               <img class="project-img" src="https://teksands.ai/resources/landing-pages/images/2021/07/project-1.png" alt="Real Life Projects">
               <h5 class="real-proj">Price Prediction System</h5>
               <!-- <p class="example"><strong>Example</strong></p>
               <p>We will learn how to use NLP (Natural Language Processing Methods to determine a sentiment score for online product reviews.</p> -->
             </div>
             <!-- 11 -->
             <div class="projects text-center">
               <img class="project-img" src="/resources/landing-pages/assets/text-similarity-detection.jpg" alt="Real Life Projects">
               <h5 class="real-proj">Text Similarity Detection</h5>
               <!-- <p class="example"><strong>Example</strong></p>
               <p>We will learn how to use NLP (Natural Language Processing Methods to determine a sentiment score for online product reviews.</p> -->
             </div>
             <!-- 12 -->
             <div class="projects text-center">
               <img class="project-img" src="/resources/landing-pages/assets/customer-behavorial-segmentation.jpeg" alt="Real Life Projects">
               <h5 class="real-proj">Behavioural Segmentation</h5>
               <!-- <p class="example"><strong>Example</strong></p>
               <p>We will learn how to use NLP (Natural Language Processing Methods to determine a sentiment score for online product reviews.</p> -->
             </div>
             <!-- 13 -->
             <div class="projects text-center">
               <img class="project-img" src="/resources/landing-pages/assets/fake-news-identification.jpeg" alt="Real Life Projects">
               <h5 class="real-proj">Fake News Identification</h5>
               <!-- <p class="example"><strong>Example</strong></p>
               <p>We will learn how to use NLP (Natural Language Processing Methods to determine a sentiment score for online product reviews.</p> -->
             </div>
             <!-- 14 -->
             <div class="projects text-center">
               <img class="project-img" src="/resources/landing-pages/assets/image-captioning.jpeg" alt="Real Life Projects">
               <h5 class="real-proj">Image Captioning</h5>
               <!-- <p class="example"><strong>Example</strong></p>
               <p>We will learn how to use NLP (Natural Language Processing Methods to determine a sentiment score for online product reviews.</p> -->
             </div>
             <!-- 15 -->
             </div>
          </div>
      </div>
         
<!-- <div class="container" style="background: rgb(88,183,236);
        background: linear-gradient(50deg, rgba(1,27,63,1) 0%,rgba(88,183,236,1) 100%); padding-top:32px;padding-bottom:10px;" >
<p class="course-fee">Course Fee: INR 3850 <del class="del">(INR 8200)</del></p>
<hr style="text-align:left;margin-left:0;color:#00acd3;height:3px;">
</div> -->
        <!--FAQs-->
        <div class="bg-grey">
            <div class="page-container width-control">
                <div>
                   <h2 class="sec-heading lg-center">FAQs</h2>
                </div>
                <div>
                   <button class="accordion">What are the Professions/Job Roles in Data Science & Analytics space?</button>
                   <div class="answers">
                       <p>Data Science and Predictive Analytics has served a multitude of functions and job needs and a lot of Job Roles are created in organizations in the last few years. Some of the prominent Job Roles in this space are listed below:</p>
                       <p><strong>Data Scientist: </strong>Data Scientists would have the responsibility of understanding and analysing all the data the organisation has and create Data Driven products and solutions to create businesses processes more efficient, drive automation, create decision systems, future prediction systems, etc.</p>
                       <p><strong>Data Architect: </strong>Data Architects would typically analyse the organisational Data Schemas, design new schemas for newer data driven systems , tune existing data schemas, optimise organisational Mete Data and all data repositories including ETL Systems.</p>
                       <p><strong>Data and Analytics Manager: </strong>Responsible for managing and leading Data initiatives in the organisation, including leadership in ETL programs, Decision Systems programs, leading analytics teams, etc.</p>
                       <p><strong>Data Analyst:</strong>Data Analysts typically gather and analyse data within divisions and organisation for the purpose of building Insights and Analytics solutions and systems using a range of tools, techniques including statistics. This role is highly important for the leadership of any organisation to develop understanding of business trends.</p>
                       <p><strong>Machine Learning Engineer: </strong>Responsible for developing sophisticated Machine Learning Models that are to create various Decision, Prediction, Classification, Clustering systems on Business Data.
                        All the roles above and the plethora of roles this space is offering are growing rapidly in demand and skills shortfall is even expanding leading to high salaries for every skilled personnel in these fields.</p>
                        <p>Given "Data is the new Fuel", demand for professionals in these fields in the many years to come will continue to expand unabated creating massive opportunities for data professionals.</p>
                     </div>
                </div>
                <div>
                    <button class="accordion">What is the skill demand in this field?</button>
                    <div class="answers">
                        <p>With Data Science applications booming through businesses leading to saving costs, better profitability and driving newer business models and products, the demand for these skills have skyrocketed. Literally, every business today is after quality skilled professionals in Data Science and Analytics. Not only they are looking for Data Science and Predictive Analytics skills to create new solutions, but preferring these as must-have skills in all other fields to drive continuous automation and efficiency. Even Business and Operations personnel are today are equipping themselves with foundational knowledge in these areas to save costs through automation.</p>
                        <p><strong>Some statistics: </strong></p>
                        <ul>
                            <li>70-80% Year on Year New Job Numbers Growth in Data Science and related skills</li>
                            <li>15-20% Year on Year Average Salary Growth in these fields</li>
                            <li>85% of the Companies are Investing and expanding their Data Science Teams rapidly</li>
                            <li>In 2020-21, there is a net shortage of 250,000+ skilled resources in these fields</li>
                            <li>2 Years is approximate Data Science Staff Tenure in companies</li>
                        </ul>
                      </div>
                 </div>
                 <div>
                    <button class="accordion">What is the approach of Teaching?</button>
                    <div class="answers">
                        <p>The course is completely based on practical approaches of teaching. Learners will have intense exposure to real code and data while learning the concepts on the go. We will also provide you all the codes used in training and also additional problems for you to work on and practice.</p>
                        <p>The Delivery method is <strong>Online, Live Classes</strong> led by Professional, Industry Experienced Instructors.</p>
                      </div>
                 </div>
                 <div>
                    <button class="accordion">What is the course duration?</button>
                    <div class="answers">
                        <p><strong>4 Months + 1 months Specialisation</strong></p>
                        <p><strong>Weekend Courses: </strong>Weekend Batches / Morning 10:00 am - 1 pm (Saturday/Sunday).</p>
                        <p><em>(Please check your specific course schedule)</em></p>
                      </div>
                 </div>
                 <div>
                    <button class="accordion">Is there any software Requirements for this course?</button>
                    <div class="answers">
                        <ol>
                            <li>Laptop with Windows 7, 8, 10 / MacOS / Linux</li>
                            <li>Internet Connectivity</li>
                            <li>Latest Chrome / Firefox Browser</li>
                            <li>Microsoft Excel</li>
                            <li>Python Version 3 or above <a href="https://www.python.org/downloads/" target="_blank">(https://www.python.org/downloads/)</a></li>
                            <li>Anaconda Platform <a href="https://www.anaconda.com/distribution/" target="_blank">(https://www.anaconda.com/distribution/)</a></li>
                        </ol>
                      </div>
                 </div>
                 <div>
                    <button class="accordion">Who are the instructors for this course?</button>
                    <div class="answers">
                        <p>All courses on Teksands are taught by Industry Professionals, highly qualified and focused Research Scholars from Reputed University</p>
                      </div>
                 </div>
                <div>
                <button class="accordion">
                  Will I get Job Assistance after this program?
                </button>
                <div class="answers">
                    <p>
                      Yes, Teksands will help you in securing a placement after successful completion of the course.
                    </p>
                  </div>
                </div>
                <div>
                 <button class="accordion">
                  How is this Course Different from others in the Market?
                </button>
                 <div class="answers">
                    <p>
                      Teksands Post Grad Program on Data Science focusses on students building a Portfolio of Industry Projects across all learning areas. This portfolio helps you demonstrate your ability to prospective employers and make a difference. Additionally, Teksands course will have important industry-related modules such as ML-Ops and AI Product Development which gives you critical edge in launching a successful career journey.
                    </p>
                   </div>
                </div>
                <div>
                  <button class="accordion">
                    Are there instalment schemes available?
                  </button>
                  <div class="answers">
                     <p>
                      Yes, please speak to your career counsellor to get to know more on instalment schemes. 
                    </p>
                    </div>
                 </div>
                 <div>
                  <button class="accordion">
                    How much time do I have to devote on the course per week?
                  </button>
                  <div class="answers">
                     <p>
                      This is a career focussed course and to be taken very seriously by the students. We recommend a minimum of 10 hours study per week beyond the online classrooms to as much as possible. Your commitment will help you succeed.
                    </p>
                    </div>
                 </div>
            </div>
        </div>
        <!--Topic &Instructor-->
      
         <!--Certificate-->
         <div>
             <div class="page-container">
                 <div class="certificate">
                    <div>
                        <h2 class="sec-heading">Certificate</h2>
                        <p class="width-control">Upon successful completion of the programme, participants will be awarded a verified digital certificate by Teksands.</p>
                        <br>
                        <a class="cta" href="#">Get Certified</a>
                     </div>
                     <div>
                         <img src="/resources/landing-pages/assets/certificate-pgpads-s.jpeg" alt="certificate" width="100%">
                     </div>
                 </div>
             </div>
         </div>
         <!--About Teksands-->
         <div class="bg-grey about">
            <div class="page-container text-center">
                <div>
                    <img src="https://teksands.ai/resources/landing-pages/images/2021/07/logo.jpg" alt="logo">
                    <p class="about-desc">"Teksands' mission is to have Future ready Technology workforce. We provide Online and Corporate Courses on Deep Tech including Data Science, Machine Learning, Artificial Intelligence, Python, Deep Learning, Neural Network, and much more. Teksands courses are intended to primarily help working professionals achieve career augmentation or career switch in Deep Tech areas by delivering very high quality, application driven training suited to the needs of our learners needs and goals. "Teksands High Impact Series" & "TEKS - RISE" are the flagship programs to offer short term & longer duration Career Oriented courses."</p>
                </div>
            </div>
         </div>

         <!--Demo Class-->
         <!-- <div class="bg-grey">
            <div class="page-container">
                <div>
                   <h2 class="sec-heading lg-center">Demo Class Video</h2>
                </div>
                <div>
                   <iframe class="course-intro" src="https://player.vimeo.com/video/587353209" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>
                </div>
            </div>
         </div> -->
         <!--Final CTA-->
         <!-- <div class="gradient-bg">
             <div class="page-container final-cta">
                <a class="bottom-cta" href="https://teksands.ai/shop/machine-learning/machine-learning-mastery/" target="_blank">Register Now</a><br>
                <a class="bottom-cta" href="#brochure-download">Request Brochure/Register for Demo Class</a> 
             </div>
         </div> -->
         </div>
         <!-- </main> -->
         <div class="gradient-bg">
             <div class="page-container final-cta">
                <!-- <a class="bottom-cta" href="https://site.teksands.ai/shop/machine-learning/teks-rise/" target="_blank"><span class="align-middle">Register Now</span></a><br> -->
                <a class="bottom-cta" href="#brochure-download">Request Brochure/Register for Demo Class</a> 
             </div>
         </div>
     </main>
     <footer></footer>
     <!-- <script>
        var acc = document.getElementsByClassName("accordion");
        var i;
        
        for (i = 0; i < acc.length; i++) {
          acc[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.maxHeight) {
              panel.style.maxHeight = null;
            } else {
              panel.style.maxHeight = panel.scrollHeight + "px";
            } 
          });
        }

        var exp = document.getElementById("expand");
        exp.addEventListener("click",function(){
            if(exp.innerText == "Expand All"){
              exp.innerText = "Collapse All";
            }else{
              exp.innerText = "Expand All";
            }
            for(i=0;i<7;i++){
              acc[i].classList.toggle("active");
              // console.log(acc);
              var panel = acc[i].nextElementSibling;
              if(panel.style.maxHeight){
                panel.style.maxHeight = null;
              }
              else{
                panel.style.maxHeight = panel.scrollHeight+ "px";
              }
            }
        });
       
        </script> -->

        <script>
          var acc = document.getElementsByClassName("accordion");
          var i;
          
          for (i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function() {
              this.classList.toggle("active");
              var panel = this.nextElementSibling;
              if (panel.style.maxHeight) {
                panel.style.maxHeight = null;
              } else {
                panel.style.maxHeight = panel.scrollHeight + "px";
              } 
            });
          }
  
          var exp = document.getElementById("expand");
  
          var expandAll = document.getElementsByClassName("expand-all");
          exp.addEventListener("click",function(){
            console.log(expandAll);
              if(exp.innerText == "Expand All"){
                exp.innerText = "Collapse All";
                for(i=0;i<expandAll.length;i++){
                expandAll[i].classList.add("active");
                // console.log(acc);
                var panel = expandAll[i].nextElementSibling;
                panel.style.maxHeight = panel.scrollHeight+ "px";
              }
              }else{
                exp.innerText = "Expand All";
                for(i=0;i<expandAll.length;i++){
                expandAll[i].classList.remove("active");
                // console.log(acc);
                var panel = expandAll[i].nextElementSibling;
                panel.style.maxHeight = null;
              }
              }
          });

          var expandSpecialization = document.getElementById("expand-specialisation");

          var expandSpecializationAll = document.getElementsByClassName("expand-specialisation-all");
          expandSpecialization.addEventListener("click",function(){
            if(expandSpecialization.innerText == "Expand All"){
              expandSpecialization.innerText = "Collapse All";
              for(i=0;i<expandSpecializationAll.length;i++){
                expandSpecializationAll[i].classList.add("active");
                var panel = expandSpecializationAll[i].nextElementSibling;
                panel.style.maxHeight = panel.scrollHeight+"px";
              }
            }else{
              expandSpecialization.innerText = "Expand All";
              for(i=0;i<expandSpecializationAll.length;i++){
                expandSpecializationAll[i].classList.remove("active");
                var panel = expandSpecializationAll[i].nextElementSibling;
                panel.style.maxHeight = null;
              }
            }
          });
         
          function isNumberKey(evt) {
        	    var charCode = (evt.which) ? evt.which : event.keyCode;
        	    console.log(charCode);
        	    if (charCode != 43 &&  charCode > 31
        	    		&& (charCode < 48 || charCode > 57) && (charCode != 32 && charCode != 0) )
        	        return false;

        	    return true;
        	}
       </script>

 </body>
 </html>