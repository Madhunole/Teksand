<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
 <html>
 <head>
  	<link rel="icon" href="style/cropped-ts-favicon.png" type="image/png" >
	<link href="/resources/landing-pages/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/landing-pages/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/js/sweetalert/sweetalert.css"/>
    
    <link href="/resources/landing-pages/js/bootstrap.js" rel="stylesheet">
    <link href="/resources/landing-pages/js/bootstrap.min.js" rel="stylesheet">
    <script src="/resources/js/sweetalert/sweetalert.min.js"></script>
    
     <meta charset='utf-8'>
     <meta http-equiv='X-UA-Compatible' content='IE=edge'>
     <title>Teksands - Machine Learning Mastery</title>
     <meta name="description" content="The Machine Learning Mastery Using  Python course by Teksands has 10 LIVE online sessions of 2 hours. Click here for more details." />
     <meta name='viewport' content='width=device-width, initial-scale=1'>
     <meta name="robots" content="max-image-preview:standard">
     
     <link rel="alternate" href="https://teksands.ai/" hreflang="x-default" />
     <!--Fonts-->
     
     <link rel="shortcut icon" href="/resources/images/cropped-ts-favicon.png" />
     
     <!--ASAP & Roboto-->
     <link rel="preconnect" href="https://fonts.googleapis.com">
     <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
     <link href="https://fonts.googleapis.com/css2?family=Asap:wght@300;500;600;700&family=Roboto:wght@100;400;500;700&display=swap" rel="stylesheet">
     <link rel='stylesheet' type='text/css' media='screen' href='/resources/landing-pages/style/ml.css'>
     <link rel="stylesheet" href="/resources/landing-pages/style/ml-mastery-1-course-content.css">
     
	 <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	 
	 <script src="<c:url value="/resources/js/overlay/loadingoverlay.js"/>"></script>
	 
	
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

/* $(document).ready(function(){
	  alert("Hello");
	  console.log("hellow");
}); */

function saveLeads()
{
    
    var name = $("#name").val();
    var email = $("#email").val();
    var mobile = $("#mobile").val();
    var coursess = "Machine Learning Mastery using Python";
    
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
   			
   			/* $('#name').val(""); */
   			
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
    	"name": "Machine Learning Project using Python",
    	"item": "https://teksands.ai/courses/machine-learning-mastery"  
  	}]
	}
	</script>		
 </head>
 <body>
     <header class="header">
         <a href="#" class="brand">
             <img src="/resources/landing-pages/images/2021/07/logo.jpg" alt="Teksands Logo">
         </a>
     </header>
     <main>
         <!--Banner-->
         <div class="banner">
             <div class="overlay"></div>
             <div class="page-container">
                 <div class="flex">
                    <div class="banner-desc">
                        <h1 class="main-heading">Machine Learning Mastery using Python</h1>
                        <p class="sub-heading">20 hours | 2 hours x 10 weekdays</p>
                        <!-- <a href="http://site.teksands.ai/shop/machine-learning/machine-learning-mastery/" class="cta-btn">Enroll Now</a> -->
                     </div> 

                     <div class="form-group">
                 
                              <form class="brochure-form" id="brochure-download" method="post" action="">
                             <p class="heading">Register for Demo Class / Download Brochure</p>
                             <input type="text" id="name" name="name" placeholder="Name"  maxlength="100" onkeydown="return /[a-z ]/i.test(event.key)" required /><br>
                             <input type="email" id="email" name="email" placeholder="Email" maxlength="100" required /><br>
                             <input  type="text" id="mobile" name="mobile" placeholder="Mobile Number" onkeypress='return isNumberKey(event);' required /><br>
   
                              <p class="agreement">By clicking the button below, you agree to receive communications from us about this programme and other relevant programmes. <a href="https://teksands.ai/privacy-policy/" target="_blank">Privacy Policy</a></p>
								<input type="button" name="submit" value="SUBMIT" onclick="saveLeads()">
                         </form>
                     </div>
                 </div>
             </div>
         </div>
         <!--Video Introduction-->
         <div class="bg-grey">
            <div class="page-container">
                <div>
                   <h2 class="sec-heading lg-center">Course Introduction</h2>
                </div>
                <div>
                   <iframe class="course-intro" src="https://player.vimeo.com/video/579362450" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>
                </div>
            </div>
         </div>
         <!--Course Features-->
         <div class="gradient-bg">
             <div class="page-container">
                <div>
                    <h2 class="sec-heading lg-center text-white">Courses Features</h2>
                    <!--<p class="all-p">Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor, aperiam officia! Ipsa sed consequatur error unde. Tenetur sed vitae rerum facere, delectus nisi rem autem cum ad blanditiis eos unde?</p>-->
                </div>
                <div class="features-container">
                    <div class="features">
                        <img src="/resources/landing-pages/images/2021/07/live-instructor.png" alt="live instructor">
                        <p class="features-p">10 x 2 Hours LIVE Instructor-led Sessions</p>
                    </div>
                    <div class="features">
                        <img src="/resources/landing-pages/images/2021/07/7-modules.png" alt="modules">
                        <p class="features-p">7 Modules</p>
                    </div>
                    <div class="features">
                        <img src="/resources/landing-pages/images/2021/07/recorded-videos.png" alt="recorded videos">
                        <p class="features-p">All Sessions Recorded Videos available</p>
                    </div>
                    <div class="features">
                        <img src="/resources/landing-pages/images/2021/07/5-projects.png" alt="projects">
                        <p class="features-p">5 Projects</p>
                    </div>
                    <div class="features">
                        <img src="/resources/landing-pages/images/2021/07/quiz-assignment.png" alt="quiz assignment">
                        <p class="features-p">Quizzes & Assessment</p>
                    </div>
                    <div class="features">
                        <img src="/resources/landing-pages/images/2021/07/support.png" alt="support">
                        <p class="features-p">Instructor Support through learners forum</p>
                    </div>
                    <div class="features">
                        <img src="/resources/landing-pages/images/2021/07/additional-resource.png" alt="additional resource">
                        <p class="features-p">Additional Resources</p>
                    </div>
                    <div class="features">
                        <img src="/resources/landing-pages/images/2021/07/certificate.png" alt="certificate">
                        <p class="features-p">Certificate</p>
                    </div>
                </div>
             </div>
         </div>
         <!--Course Overview-->
         <div>
             <div class="page-container">
                 <div class="course-overview">
                    <div>
                        <h2 class="sec-heading text-left">Course Overview</h2>
                        <p class="p-bold">This course spans 2 weeks, 10 LIVE online sessions of 2 hours each, totaling 20 hours.</p>
                        <p class="t-just">In this course, you will learn the basics of <a href="https://teksands.ai/shortreads/python-for-mobile-app-development" target="_blank"><b>Python Language</b></a>, a total of five Machine Learning Techniques such as Linear Regression, Logistic Regression, Support Vector Machines, Decision Tree and Random Forest for solving a variety of problem types. There will also be five projects that will be demonstrated and five projects given as assignments to consolidate your learning.</p>
                        <p class="t-just">Teksands High Impact Series is designed specifically for the busy professionals who would want to develop the maximum understanding on the topics in the shortest time possible. This course uses a completely practical based approach to run through as much as projects/code/demo as possible and explain both the concepts and coding/solutions parts on the go with the demo. The learners are then given additional projects as practice assignments for them to solve them on their own and solidify their understandings.</p>
                    </div>
                    <div class="text-center">
                        <img src="/resources/landing-pages/images/2021/07/course-overview.png" alt="Course Overview" width="80%">
                    </div>
                 </div>
             </div>
         </div>
         <!--Detailed Course Description-->
         <div class="bg-grey">
             <div class="page-container">
                 <div class="course-desc">
                    <div>
                        <h2 class="sec-heading text-left">Detailed Description Of the Courses</h2>
                        <p class="all-p p-bold text-left">This LIVE course, Machine Learning Mastery will provide 20 hours of intense LIVE Training to the Learners.
                        <div>
                            <ol class="course-desc-list">
                                <li>
                                    <strong>Basics of Python Language:</strong> Helps learners to understand the Language Elements of Python and data structures including Pandas and Numpy Libraries. This will enable you to code Machine Learning solutions covered in subsequent chapters. 
                                </li>
                                <li>
                                    <strong>Linear Regression Algorithm:</strong> Techniques walking through a real-world project to solve a prediction problem.
                                </li>
                                <li>
                                    <strong>Logistic Regression Algorithm:</strong> To understand the foundations of Classification techniques. 
                                </li>
                                <li>
                                    <strong>Support Vector Machines:</strong> To solve complex classification problems.
                                </li>
                                <li>
                                    <strong>Decision Tree and Random Forest Algorithms:</strong> Learn these very efficient tree-based techniques for complex classification challenges. 
                                </li>
                                <li>
                                    <strong>Understand how to choose the right algorithms:</strong> For various types of Machine Learning problems. 
                                </li>
                            </ol>
                        </div>
                    </div>
                    <div>
                        <h2 class="sec-heading text-left">What will you learn?</h2>
                        <div class="features-container2">
                            <div class="features2">
                                <img src="/resources/landing-pages/images/2021/07/python.png" alt="python">
                                <p class="features-p">Introduction to Python</p>
                            </div>
                            <div class="features2">
                                <img src="/resources/landing-pages/images/2021/07/machine-learning.png" alt="machine learning">
                                <p class="features-p">Introduction to Machine Learning</p>
                            </div>
                            <div class="features2">
                                <img src="/resources/landing-pages/images/2021/07/linear-regression.png" alt="linear regression">
                                <p class="features-p">Linear Regression with Demo & Assignment</p>
                            </div>
                            <div class="features2">
                                <img src="/resources/landing-pages/images/2021/07/logistic.png" alt="logistic">
                                <p class="features-p">Logistic Regression with Demo & Assignment</p>
                            </div>
                            <div class="features2">
                                <img src="/resources/landing-pages/images/2021/07/support-vector.png" alt="support vector">
                                <p class="features-p">Support Vector Machines with Demo & Assignment</p>
                            </div>
                            <div class="features2">
                                <img src="/resources/landing-pages/images/2021/07/decision-tree.png" alt="decision tree">
                                <p class="features-p">Decision Tree with Assignment</p>
                            </div>
                            <div class="features2">
                                <img src="/resources/landing-pages/images/2021/07/random-forest.png" alt="random forest">
                                <p class="features-p">Random Forest with Assignment</p>
                            </div>
                            <div class="features2">
                                <img src="/resources/landing-pages/images/2021/07/model-section.png" alt="model section">
                                <p class="features-p">Model Selection Methods</p>
                            </div>
                        </div>
                    </div>
                 </div>
             </div>
         </div>

         <!-- Course Outline -->
        <div class="page-container lesson">
            <div class="nav course-outline-head ">
              <h2 class=" lg-center">Course Outline</h2>
              <button class="btn btn-primary" id="expand" >Expand All</button>
            </div>
            <div class="content">
                <div class="accordion expandable course-topic">
                  <span class="el-lesson-number lesson-num" >1</span> 
                  <div class='topic-content'>
                    <div>Introduction To Python</div>
                    <div>3 Topics</div>
                  </div>
                </div>
                <div
                    class="ld-item-list-item-expanded answers"
                >
                    <div
                        class="ld-table-list ld-topic-list ld-no-pagination"
                        id="ld-expand-14492"
                    >
                        <div class="ld-table-list-header ld-primary-background list-header">
                        <div class="ld-table-list-title">
                            <span class="ld-item-icon">
                            <i class="modern-icon-Topic-list"></i>
                            </span>
                            <span class="ld-text"> Lesson Content </span>
                        </div>
                        <!--/.ld-tablet-list-title-->
                        <div class="ld-table-list-lesson-details">
                            <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                            <span class="ld-lesson-list-steps elgray"> 0/3 Steps </span>
                        </div>
                        <!--/.ld-table-list-lesson-details-->
                        </div>
                        <!--/.ld-table-list-header-->
                        <div
                        class="ld-table-list-items"
                        id="ld-topic-list-14492"
                        data-ld-expand-list=""
                        >
                        <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14493">
                            <p
                            class="
                                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                                learndash-incomplete 
                            "
                            >
                            <span class="elumine-icon modern-icon-Topic-text"></span>
                            <div class="ld-status-icon ld-status-incomplete"></div>
                            <span class="ld-topic-title">Python Language elements</span>
                            </p>
                        </div>
                        <!--/.ld-table-list-item-->
                        <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14494">
                            <p
                            class="
                                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                                learndash-incomplete
                            "
                            >
                            <span class="elumine-icon modern-icon-Topic-text"></span>
                            <div class="ld-status-icon ld-status-incomplete"></div>
                            <span class="ld-topic-title">Python Data Structures</span>
                            </p>
                        </div>
                        <!--/.ld-table-list-item-->
                        <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14495">
                            <p
                            class="
                                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                                learndash-incomplete
                            "
                            >
                            <span class="elumine-icon modern-icon-Topic-text"></span>
                            <div class="ld-status-icon ld-status-incomplete"></div>
                            <span class="ld-topic-title"
                                >Working with Numpy and Pandas Libraries</span
                            >
                            </p>
                        </div>
                        <!--/.ld-table-list-item-->
                        </div>
                        <!--/.ld-table-list-items-->
                        <div class="ld-table-list-footer"></div>
                        <!--/.ld-table-list-footer-->
                    </div>
                    <!--/.ld-table-list-->
                </div>
                <!-- First lesson ends here -->
                
                <div class="accordion course-topic expandable">
                  <span class="el-lesson-number lesson-num" >2</span> 
                  <div class='topic-content'>
                    <div>Introduction to Machine Learning</div>
                    <div>4 Topics</div>
                  </div>
                </div>

                <div class="ld-table-list ld-topic-list ld-no-pagination answers " id="ld-expand-14496">
                    <div class="ld-table-list-header ld-primary-background list-header">
                      <div class="ld-table-list-title">
                        <span class="ld-item-icon"> <i class="modern-icon-Topic-list"></i> </span>
                        <span class="ld-text"> Lesson Content </span>
                      </div>
                      <!--/.ld-tablet-list-title-->
                      <div class="ld-table-list-lesson-details">
                        <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                        <span class="ld-lesson-list-steps elgray"> 0/4 Steps </span>
                      </div>
                      <!--/.ld-table-list-lesson-details-->
                    </div>
                    <!--/.ld-table-list-header-->
                    <div
                      class="ld-table-list-items"
                      id="ld-topic-list-14496"
                      data-ld-expand-list=""
                    >
                      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14497">
                        <p
                          class="
                            ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                            learndash-incomplete
                          "
                        >
                          <span class="elumine-icon modern-icon-Topic-text"></span>
                          <div class="ld-status-icon ld-status-incomplete"></div>
                          <span class="ld-topic-title">Real Life Use Cases</span>
                        </p>
                      </div>
                      <!--/.ld-table-list-item-->
                      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14498">
                        <p
                          class="
                            ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                            learndash-incomplete
                          "
                        >
                          <span class="elumine-icon modern-icon-Topic-text"></span>
                          <div class="ld-status-icon ld-status-incomplete"></div>
                          <span class="ld-topic-title">Types of Learning Algorithms</span>
                        </p>
                      </div>
                      <!--/.ld-table-list-item-->
                      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14499">
                        <p
                          class="
                            ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                            learndash-incomplete
                          "
                        >
                          <span class="elumine-icon modern-icon-Topic-text"></span>
                          <div class="ld-status-icon ld-status-incomplete"></div>
                          <span class="ld-topic-title">Measuring Model Accuracy</span>
                        </p>
                      </div>
                      <!--/.ld-table-list-item-->
                      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14500">
                        <p
                          class="
                            ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                            learndash-incomplete
                          "
                        >
                          <span class="elumine-icon modern-icon-Topic-text"></span>
                          <div class="ld-status-icon ld-status-incomplete"></div>
                          <span class="ld-topic-title"
                            >Using Hyperparameters to Optimise Model Performance</span
                          >
                        </p>
                      </div>
                      <!--/.ld-table-list-item-->
                    </div>
                    <!--/.ld-table-list-items-->
                    <div class="ld-table-list-footer"></div>
                    <!--/.ld-table-list-footer-->
                  </div>
                  
                

                <!-- Second lesson ends here -->

                <div class="accordion expandable course-topic">
                  <span class="el-lesson-number lesson-num" >3</span> 
                  <div class='topic-content'>
                    <div>Linear Regression with Demo and Assignment</div>
                    <div>5 Topics</div>
                  </div>
                </div>

                <div
                    class="ld-item-list-item-expanded answers"
                >
                    <div
                        class="ld-table-list ld-topic-list ld-no-pagination"
                        id="ld-expand-14502"
                    >
                        <div class="ld-table-list-header ld-primary-background list-header">
                        <div class="ld-table-list-title">
                            <span class="ld-item-icon">
                            <i class="modern-icon-Topic-list"></i>
                            </span>
                            <span class="ld-text"> Lesson Content </span>
                        </div>
                        <!--/.ld-tablet-list-title-->
                        <div class="ld-table-list-lesson-details">
                            <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                            <span class="ld-lesson-list-steps elgray"> 0/5 Steps </span>
                        </div>
                        <!--/.ld-table-list-lesson-details-->
                        </div>
                        <!--/.ld-table-list-header-->
                        <div
                        class="ld-table-list-items"
                        id="ld-topic-list-14502"
                        data-ld-expand-list=""
                        >
                        <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14503">
                            <p
                            class="
                                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                                learndash-incomplete
                            "
                            >
                            <span class="elumine-icon modern-icon-Topic-text"></span>
                            <div class="ld-status-icon ld-status-incomplete"></div>
                            <span class="ld-topic-title"
                                >Real Life Use Cases of Linear Regression</span
                            >
                            </p>
                        </div>
                        <!--/.ld-table-list-item-->
                        <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14504">
                            <p
                            class="
                                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                                learndash-incomplete
                            "
                            >
                            <span class="elumine-icon modern-icon-Topic-text"></span>
                            <div class="ld-status-icon ld-status-incomplete"></div>
                            <span class="ld-topic-title"
                                >Understanding Linear Regression Concepts</span
                            >
                            </p>
                        </div>
                        <!--/.ld-table-list-item-->
                        <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14505">
                            <p
                            class="
                                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                                learndash-incomplete
                            "
                            >
                            <span class="elumine-icon modern-icon-Topic-text"></span>
                            <div class="ld-status-icon ld-status-incomplete"></div>
                            <span class="ld-topic-title"
                                >Walk through Complete Real Life Industry Project</span
                            >
                            </p>
                        </div>
                        <!--/.ld-table-list-item-->
                        <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14741">
                            <p
                            class="
                                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                                learndash-incomplete
                            "
                            >
                            <span class="elumine-icon modern-icon-Topic-text"></span>
                            <div class="ld-status-icon ld-status-incomplete"></div>
                            <span class="ld-topic-title">Measuring Model Accuracy</span>
                            </p>
                        </div>
                        <!--/.ld-table-list-item-->
                        <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14743">
                            <p
                            class="
                                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                                learndash-incomplete
                            "
                            >
                            <span class="elumine-icon modern-icon-Topic-text"></span>
                            <div class="ld-status-icon ld-status-incomplete"></div>
                            <span class="ld-topic-title">Real Life Industry Assignment</span>
                            </p>
                        </div>
                        <!--/.ld-table-list-item-->
                        </div>
                        <!--/.ld-table-list-items-->
                        <div class="ld-table-list-footer"></div>
                        <!--/.ld-table-list-footer-->
                    </div>
                    <!--/.ld-table-list-->
                    </div>

  
                <!--Third  lesson ends here -->

                <div class="accordion expandable course-topic">
                  <span class="el-lesson-number lesson-num" >4</span> 
                  <div class='topic-content'>
                    <div>Logistic Regression with Demo and Assignment</div>
                    <div>5 Topics</div>
                  </div>
                </div>
                <div
                    class="ld-item-list-item-expanded answers"
                >
                    <div
                        class="ld-table-list ld-topic-list ld-no-pagination"
                        id="ld-expand-14506"
                    >
                        <div class="ld-table-list-header ld-primary-background list-header">
                        <div class="ld-table-list-title">
                            <span class="ld-item-icon">
                            <i class="modern-icon-Topic-list"></i>
                            </span>
                            <span class="ld-text"> Lesson Content </span>
                        </div>
                        <!--/.ld-tablet-list-title-->
                        <div class="ld-table-list-lesson-details">
                            <span class="ld-lesson-list-progress elgray right-border right-border"> 0% Complete </span>
                            <span class="ld-lesson-list-steps elgray"> 0/5 Steps </span>
                        </div>
                        <!--/.ld-table-list-lesson-details-->
                        </div>
                        <!--/.ld-table-list-header-->
                        <div
                        class="ld-table-list-items"
                        id="ld-topic-list-14506"
                        data-ld-expand-list=""
                        >
                        <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14507">
                            <p
                            class="
                                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                                learndash-incomplete
                            "
                            >
                            <span class="elumine-icon modern-icon-Topic-text"></span>
                            <div class="ld-status-icon ld-status-incomplete"></div>
                            <span class="ld-topic-title"
                                >Real Life Use Cases of Logistic Regression</span
                            >
                            </p>
                        </div>
                        <!--/.ld-table-list-item-->
                        <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14508">
                            <p
                            class="
                                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                                learndash-incomplete
                            "
                            >
                            <span class="elumine-icon modern-icon-Topic-text"></span>
                            <div class="ld-status-icon ld-status-incomplete"></div>
                            <span class="ld-topic-title"
                                >Understanding Logistic Regression Concepts</span
                            >
                            </p>
                        </div>
                        <!--/.ld-table-list-item-->
                        <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14509">
                            <p
                            class="
                                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                                learndash-incomplete
                            "
                            >
                            <span class="elumine-icon modern-icon-Topic-text"></span>
                            <div class="ld-status-icon ld-status-incomplete"></div>
                            <span class="ld-topic-title"
                                >Walk through Complete Real Life Industry Project</span
                            >
                            </p>
                        </div>
                        <!--/.ld-table-list-item-->
                        <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14510">
                            <p
                            class="
                                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                                learndash-incomplete
                            "
                            >
                            <span class="elumine-icon modern-icon-Topic-text"></span>
                            <div class="ld-status-icon ld-status-incomplete"></div>
                            <span class="ld-topic-title">Measuring Model Accuracy</span>
                            </p>
                        </div>
                        <!--/.ld-table-list-item-->
                        <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14511">
                            <p
                            class="
                                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                                learndash-incomplete
                            "
                            >
                            <span class="elumine-icon modern-icon-Topic-text"></span>
                            <div class="ld-status-icon ld-status-incomplete"></div>
                            <span class="ld-topic-title">Real Life Industry Assignment</span>
                            </p>
                        </div>
                        <!--/.ld-table-list-item-->
                        </div>
                        <!--/.ld-table-list-items-->
                        <div class="ld-table-list-footer"></div>
                        <!--/.ld-table-list-footer-->
                    </div>
                    <!--/.ld-table-list-->
                    </div>

  
                <!--Fourth  lesson ends here -->

                <div class="accordion expandable course-topic">
                  <span class="el-lesson-number lesson-num" >5</span> 
                  <div class='topic-content'>
                    <div>Support Vector Machines with Demo and Assignment</div>
                    <div>5 Topics</div>
                  </div>
                </div>
  
            <div
                class="ld-item-list-item-expanded answers"
            >
                <div
                  class="ld-table-list ld-topic-list ld-no-pagination"
                  id="ld-expand-14513"
                >
                  <div class="ld-table-list-header ld-primary-background list-header">
                    <div class="ld-table-list-title">
                      <span class="ld-item-icon">
                        <i class="modern-icon-Topic-list"></i>
                      </span>
                      <span class="ld-text"> Lesson Content </span>
                    </div>
                    <!--/.ld-tablet-list-title-->
                    <div class="ld-table-list-lesson-details">
                      <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                      <span class="ld-lesson-list-steps elgray"> 0/5 Steps </span>
                    </div>
                    <!--/.ld-table-list-lesson-details-->
                  </div>
                  <!--/.ld-table-list-header-->
                  <div
                    class="ld-table-list-items"
                    id="ld-topic-list-14513"
                    data-ld-expand-list=""
                  >
                    <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14514">
                      <p
                        class="
                          ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                          learndash-incomplete
                        "
                      >
                        <span class="elumine-icon modern-icon-Topic-text"></span>
                        <div class="ld-status-icon ld-status-incomplete"></div>
                        <span class="ld-topic-title"
                          >Use Cases of Support Vector Machine</span
                        >
                      </p>
                    </div>
                    <!--/.ld-table-list-item-->
                    <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14515">
                      <p
                        class="
                          ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                          learndash-incomplete
                        "
                      >
                        <span class="elumine-icon modern-icon-Topic-text"></span>
                        <div class="ld-status-icon ld-status-incomplete"></div>
                        <span class="ld-topic-title"
                          >Understanding Support Vector Machine Concepts</span
                        >
                      </p>
                    </div>
                    <!--/.ld-table-list-item-->
                    <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14516">
                      <p
                        class="
                          ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                          learndash-incomplete
                        "
                      >
                        <span class="elumine-icon modern-icon-Topic-text"></span>
                        <div class="ld-status-icon ld-status-incomplete"></div>
                        <span class="ld-topic-title"
                          >Walk through Complete Real Life Industry Project</span
                        >
                      </p>
                    </div>
                    <!--/.ld-table-list-item-->
                    <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14517">
                      <p
                        class="
                          ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                          learndash-incomplete
                        "
                      >
                        <span class="elumine-icon modern-icon-Topic-text"></span>
                        <div class="ld-status-icon ld-status-incomplete"></div>
                        <span class="ld-topic-title">Measuring Model Accuracy</span>
                      </p>
                    </div>
                    <!--/.ld-table-list-item-->
                    <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14756">
                      <p
                        class="
                          ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                          learndash-incomplete
                        "
                      >
                        <span class="elumine-icon modern-icon-Topic-text"></span>
                        <div class="ld-status-icon ld-status-incomplete"></div>
                        <span class="ld-topic-title">Real Life Industry Assignment</span>
                      </p>
                    </div>
                    <!--/.ld-table-list-item-->
                  </div>
                  <!--/.ld-table-list-items-->
                  <div class="ld-table-list-footer"></div>
                  <!--/.ld-table-list-footer-->
                </div>
                <!--/.ld-table-list-->
              </div>
              
                <!--Fifth  lesson ends here -->

                <div class="accordion expandable course-topic">
                  <span class="el-lesson-number lesson-num" >6</span> 
                  <div class='topic-content'>
                    <div>Decision Trees and Random Forest with Assignment</div>
                    <div>5 Topics</div>
                  </div>
                </div>

                <div class="ld-item-list-item-expanded answers">
                <div
                  class="ld-table-list ld-topic-list ld-no-pagination"
                  id="ld-expand-14518"
                >
                  <div class="ld-table-list-header ld-primary-background list-header">
                    <div class="ld-table-list-title">
                      <span class="ld-item-icon">
                        <i class="modern-icon-Topic-list"></i>
                      </span>
                      <span class="ld-text"> Lesson Content </span>
                    </div>
                    <!--/.ld-tablet-list-title-->
                    <div class="ld-table-list-lesson-details">
                      <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                      <span class="ld-lesson-list-steps elgray"> 0/5 Steps </span>
                    </div>
                    <!--/.ld-table-list-lesson-details-->
                  </div>
                  <!--/.ld-table-list-header-->
                  <div
                    class="ld-table-list-items"
                    id="ld-topic-list-14518"
                    data-ld-expand-list=""
                  >
                    <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14519">
                      <p
                        class="
                          ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                          learndash-incomplete
                        "
                      >
                        <span class="elumine-icon modern-icon-Topic-text"></span>
                        <div class="ld-status-icon ld-status-incomplete"></div>
                        <span class="ld-topic-title"
                          >Use Cases of Decision Tree and Random Forest Algorithms</span
                        >
                      </p>
                    </div>
                    <!--/.ld-table-list-item-->
                    <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14520">
                      <p
                        class="
                          ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                          learndash-incomplete
                        "
                      >
                        <span class="elumine-icon modern-icon-Topic-text"></span>
                        <div class="ld-status-icon ld-status-incomplete"></div>
                        <span class="ld-topic-title"
                          >Understanding Decision Tree and Random Forest Concepts</span
                        >
                      </p>
                    </div>
                    <!--/.ld-table-list-item-->
                    <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14521">
                      <p
                        class="
                          ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                          learndash-incomplete
                        "
                      >
                        <span class="elumine-icon modern-icon-Topic-text"></span>
                        <div class="ld-status-icon ld-status-incomplete"></div>
                        <span class="ld-topic-title"
                          >Walk through Complete Real Life Industry Project</span
                        >
                      </p>
                    </div>
                    <!--/.ld-table-list-item-->
                    <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14522">
                      <p
                        class="
                          ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                          learndash-incomplete
                        "
                      >
                        <span class="elumine-icon modern-icon-Topic-text"></span>
                        <div class="ld-status-icon ld-status-incomplete"></div>
                        <span class="ld-topic-title">Measuring Model Accuracy</span>
                      </p>
                    </div>
                    <!--/.ld-table-list-item-->
                    <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14523">
                      <p
                        class="
                          ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                          learndash-incomplete
                        "
                      >
                        <span class="elumine-icon modern-icon-Topic-text"></span>
                        <div class="ld-status-icon ld-status-incomplete"></div>
                        <span class="ld-topic-title">Real Life Industry Assignment</span>
                      </p>
                    </div>
                    <!--/.ld-table-list-item-->
                  </div>
                  <!--/.ld-table-list-items-->
                  <div class="ld-table-list-footer"></div>
                  <!--/.ld-table-list-footer-->
                </div>
                <!--/.ld-table-list-->
              </div>
              
                <!-- Sixth lesson ends here -->

                <div class="accordion expandable course-topic">
                  <span class="el-lesson-number lesson-num" >7</span> 
                  <div class='topic-content'>
                    <div>Model Selection Methods</div>
                    <div>1 Topic</div>
                  </div>
                </div>

            <div class="ld-item-list-item-expanded answers"
            >
                <div
                    class="ld-table-list ld-topic-list ld-no-pagination"
                    id="ld-expand-14525"
                >
                    <div class="ld-table-list-header ld-primary-background list-header">
                        <div class="ld-table-list-title">
                            <span class="ld-item-icon">
                                <i class="modern-icon-Topic-list"></i>
                            </span>
                            <span class="ld-text"> Lesson Content </span>
                        </div>
                        <!--/.ld-tablet-list-title-->
                        <div class="ld-table-list-lesson-details">
                            <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                            <span class="ld-lesson-list-steps elgray"> 0/1 Steps </span>
                        </div>
                        <!--/.ld-table-list-lesson-details-->
                    </div>
                    <!--/.ld-table-list-header-->
                    <div
                        class="ld-table-list-items"
                        id="ld-topic-list-14525"
                        data-ld-expand-list=""
                    >
                        <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14526">
                            <p
                                class="
                                    ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                                    learndash-incomplete
                                "
                            >
                                <span class="elumine-icon modern-icon-Topic-text"></span>
                                <div class="ld-status-icon ld-status-incomplete"></div>
                                <span class="ld-topic-title"
                                    >Understand how Learning Algorithms are chosen based on Problem
                                    Statements and Data</span
                                >
                            </p>
                        </div>
                        <!--/.ld-table-list-item-->
                    </div>
                    <!--/.ld-table-list-items-->
                    <div class="ld-table-list-footer"></div>
                    <!--/.ld-table-list-footer-->
                </div>
                <!--/.ld-table-list-->
            </div>

                <!-- Seventh lesson ends here -->
                
            </div>
        </div>
        
        <!-- Course outline ends here -->

         <!--Reallife Projects-->
         <div>
             <div class="page-container">
                 <div>
                    <h2 class="sec-heading lg-center">Real Life Projects</h2>
                 </div>
                 <div class="projects-container">
                     <!--1-->
                    <div class="projects text-center">
                        <img class="project-img" src="/resources/landing-pages/images/2021/07/project-1.png" alt="Real Life Projects">
                        <h3 class="real-proj">House Price Prediction </h3>
                        <p class="example"><strong >Example</strong></p>
                        <p>Car Price or House Price prediction given historical transaction data. You will learn how the Linear Regression algorithm learns patterns and helps predict new Car or House price based on parameters given.</p>
                    </div>
                    <!--2-->
                    <div class="projects text-center">
                        <img class="project-img" src="/resources/landing-pages/images/2021/07/project-2.png" alt="Real Life Projects">
                        <h3 class="real-proj">Customer Churn Analysis </h3>
                        <p class="example"><strong >Example</strong></p>
                        <p>Predict which customers are likely to leave the current provider based on their behavioural data from past. We will look at a Telecom or Insurance industry case study. </p>
                    </div>
                    <!--3-->
                    <div class="projects text-center">
                        <img class="project-img" src="/resources/landing-pages/images/2021/07/project-3.png" alt="Real Life Projects">
                        <h3 class="real-proj">Image Classification </h3>
                        <p class="example"><strong >Example</strong></p>
                        <p>We will look at images handwritten digits and determine which image belongs to which digit by using classification techniques. </p>
                    </div>
                    <!--4-->
                    <div class="projects text-center">
                        <img class="project-img" src="/resources/landing-pages/images/2021/07/project-4.png" alt="Real Life Projects">
                        <h3>Recommender System </h3>
                        <p class="example"><strong >Example</strong></p>
                        <p>We will look at how in Netflix recommends the best possible movies to your liking based on viewing habits of yours and viewers of similar profiles. </p>
                    </div>
                    <!--5-->
                    <div class="projects text-center">
                        <img class="project-img" src="/resources/landing-pages/images/2021/07/project-5.png" alt="Real Life Projects">
                        <h3 class="real-proj">Sentiment Analysis </h3>
                        <p class="example"><strong>Example</strong></p>
                        <p>We will learn how to use NLP (Natural Language Processing Methods to determine a sentiment score for online product reviews.</p>
                    </div>
                </div>
             </div>
         </div>
         <!--Upcoming Batches-->
         <div>
            <div class="page-container">
                <div>
                   <div>
                       <h2 class="sec-heading lg-center">Upcoming Batches</h2>
                   </div>
                   <div class="course-table" style="overflow-x:auto;">
                       <table class="batch-table">
                           <tr>
                                <th>Start Date</th>
                                <th>Schedule</th>
                                <th>Timings</th>
                                <th></th>
                           </tr>
                           <tr>
                               <td>18<sup>th</sup> Oct</td>
                               <td>Mon-Fri (10 weekdays)</td>
                               <td>7 - 9 am</td>
                               <td>
                                   <!-- <a class="cta" href="http://site.teksands.ai/shop/machine-learning/machine-learning-mastery/" target="_blank">Register</a><br> -->
                                   <a class="cta" href="#brochure-download">Request Brochure/ Register for Demo Class</a>
                                </td>
                            </tr>
                            <tr>
                                <td>15<sup>th</sup> Nov</td>
                                <td>Mon-Fri (10 weekdays)</td>
                                <td>7 - 9 am</td>
                                <td>
                                   <a class="cta" href="#brochure-download">Request Brochure/ Register for Demo Class</a>
                                </td>
                            </tr>
                       </table> 
                   </div>
                </div>
            </div>
        </div>
<div class="container" style="background: rgb(88,183,236);
        background: linear-gradient(50deg, rgba(1,27,63,1) 0%,rgba(88,183,236,1) 100%); padding-top:32px;padding-bottom:10px;" >
<p class="course-fee">Course Fee: INR 3850 <del class="del">(INR 8200)</del></p>
<hr style="text-align:left;margin-left:0;color:#00acd3;height:3px;">
</div>
        <!--FAQs-->
        <div class="bg-grey">
            <div class="page-container">
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
                        <p><strong>20 Hours</strong></p>
                        <p><strong>Weekday Courses: </strong>Over 2 Weeks, all Weekdays (Monday to Friday), 2 hour Sessions per day.</p>
                        <p><strong>Weekend Courses: </strong>Over 3 Weekends, Saturdays and Sundays, 3.5 hour Sessions per day.</p>
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
            </div>
        </div>
        <!--Topic &Instructor-->
      
         <!--Certificate-->
         <div>
             <div class="page-container">
                 <div class="certificate">
                    <div>
                        <h2 class="sec-heading">Certificate</h2>
                        <p>Upon successful completion of the programme, participants will be awarded a verified digital certificate by Teksands.</p>
                        <!-- <a class="cta" href="http://site.teksands.ai/shop/machine-learning/machine-learning-mastery/">Get Certified</a> -->
                     </div>
                     <div>
                         <img src="/resources/landing-pages/images/2021/07/get-certificate.jpeg" alt="certificate" width="100%">
                     </div>
                 </div>
             </div>
         </div>
         <!--About Teksands-->
         <div class="bg-grey about">
            <div class="page-container text-center">
                <div>
                    <img src="/resources/landing-pages/images/2021/07/logo.jpg" alt="logo">
                    <p class="about-desc">"Teksands' mission is to have Future ready Technology workforce. We provide Online and Corporate Courses on Deep Tech including Data Science, Machine Learning, Artificial Intelligence, Python, Deep Learning, Neural Network, and much more. Teksands courses are intended to primarily help working professionals achieve career augmentation or career switch in Deep Tech areas by delivering very high quality, application driven training suited to the needs of our learners needs and goals. "Teksands High Impact Series" & "TEKS - RISE" are the flagship programs to offer short term & longer duration Career Oriented courses."</p>
                </div>
            </div>
         </div>

         <!--Demo Class-->
         <div class="bg-grey">
            <div class="page-container">
                <div>
                   <h2 class="sec-heading lg-center">Demo Class Video</h2>
                </div>
                <div>
                   <iframe class="course-intro" src="https://player.vimeo.com/video/587353209" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>
                </div>
            </div>
         </div>
         <!--Final CTA-->
         <div class="gradient-bg">
             <div class="page-container final-cta">
                <!-- <a class="bottom-cta" href="http://site.teksands.ai/shop/machine-learning/machine-learning-mastery/" target="_blank">Register Now</a><br> -->
                <a class="bottom-cta" href="#brochure-download">Request Brochure/Register for Demo Class</a> 
             </div>
         </div>
     </main>
     <footer></footer>
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

        var expand = document.getElementById('expand');
        var expandable_elements = document.getElementsByClassName('expandable');
        var expanded=0; //0 => in collapsed form, 1 => in expanded form
        expand.addEventListener('click',function (){
            if(expanded==0){
                expand.innerText='Collapse All';
                for(i=0;i< expandable_elements.length; i++){
                    expandable_elements[i].classList.add('active');
                    var panel = expandable_elements[i].nextElementSibling;
                    panel.style.maxHeight = panel.scrollHeight + "px";
                }
                expanded=1;
            }
            else if(expanded==1){
                expand.innerText= 'Expand All';
                for(i=0;i<expandable_elements.length;i++){
                    expandable_elements[i].classList.remove('active');
                    var panel = expandable_elements[i].nextElementSibling;
                    panel.style.maxHeight = null;
                }
                expanded=0;
            }
        });
        
       
        </script>


 </body>
 </html>