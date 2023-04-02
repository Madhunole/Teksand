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
     <title>Teksands - Data Science and Predictive Analytics Mastery</title>
     <meta name='viewport' content='width=device-width, initial-scale=1'>
     <link rel="alternate" href="https://teksands.ai/" hreflang="x-default" />
     <!--Fonts-->
     <!--ASAP & Roboto-->
     <link rel="preconnect" href="https://fonts.googleapis.com">
     <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
     <link href="https://fonts.googleapis.com/css2?family=Asap:wght@300;500;600;700&family=Roboto:wght@100;400;500;700&display=swap" rel="stylesheet">
     <link rel='stylesheet' type='text/css' media='screen' href='/resources/landing-pages/style/dspa.css'>
     <link rel="stylesheet" href="/resources/landing-pages/style/dspa-course-content.css">
     
     <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
     
     
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
    
    var name = $("#name").val();
    var email = $("#email").val();
    var mobile = $("#mobile").val();
    var coursess = "Data Science and Predictive Analytics Mastery using Python";
    
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
   			
   			$("#name").val("");
   		    $("#email").val("");
   		    $("#mobile").val("");
   			
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
    
</head>



<body>

<header class="header"><a class="brand" href="#">
<img src="/resources/images/teksands_logo.jpg" alt="Teksands Logo" />
</a></header><main>
<!--Banner--></main>
<div class="banner">
<div class="overlay"></div>
<div class="page-container">
<div class="flex">
<div class="banner-desc">
<h1 class="main-heading">Data Science and Predictive Analytics Mastery using Python</h1>
<p class="sub-heading">20 hours | 2 hours x 10 weekdays</p>
<!-- <a class="cta-btn" href="https://site.teksands.ai/shop/data-science/data-science-and-predictive-analytics-mastery/">Enroll Now</a> -->

</div>
<div class="form-group">
  <form class="brochure-form" id="brochure-download" method="post" action="">
     <p class="heading">Register for Demo Class / Download Brochure</p>
     <input type="text" id="name" name="name" placeholder="Name" required><br/>
     <input type="email" id="email" name="email" placeholder="Email" required ><br/>
     <input  type="tel" min="11" id="mobile" name="mobile" placeholder="Mobile Number" required ><br>
      <p class="agreement">By clicking the button below, you agree to receive communications from us about this programme and other relevant programmes. <a href="#" target="_blank">Privacy Policy</a></p>
     <input type="button" name="submit" value="SUBMIT" onclick="saveLeads()" >
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
<div><iframe class="course-intro" src="https://player.vimeo.com/video/579362383" frameborder="0" allowfullscreen="allowfullscreen"></iframe></div>
</div>
</div>
<!--Course Features-->
<div class="gradient-bg">
<div class="page-container">
<div>
<h2 class="sec-heading lg-center text-white">Courses Features</h2>
<!--
<p class="all-p">Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor, aperiam officia! Ipsa sed consequatur error unde. Tenetur sed vitae rerum facere, delectus nisi rem autem cum ad blanditiis eos unde?</p>
-->

</div>
<div class="features-container">
<div class="features">

<img src="/resources/landing-pages/images/icons/live-instructor.png" alt="live instructor" />
<p class="features-p">10 x 2 Hours LIVE Instructor-led Sessions</p>

</div>
<div class="features">

<img src="/resources/landing-pages/images/icons/7-modules.png" alt="7 modules" />
<p class="features-p">7 Modules</p>

</div>
<div class="features">

<img src="/resources/landing-pages/images/icons/recorded-videos.png" alt="recorded videos" />
<p class="features-p">All Sessions Recorded Videos available</p>

</div>
<div class="features">

<img src="/resources/landing-pages/images/icons/5-projects.png" alt="5 projects" />
<p class="features-p">4 Projects</p>

</div>
<div class="features">

<img src="/resources/landing-pages/images/icons/quiz-assignment.png" alt="quiz assignment" />
<p class="features-p">Quizzes &amp; Assessment</p>

</div>
<!--
<div class="features">
                        <img src="https://teksands.ai/wp-content/uploads/2021/07/support.png">
<p class="features-p">Instructor Support through learners forum</p>

</div>
-->
<div class="features">

<img src="/resources/landing-pages/images/icons/additional-resource.png" alt="additional resource" />
<p class="features-p">Additional Resources</p>

</div>
<div class="features">

<img src="/resources/landing-pages/images/icons/certificate.png"  alt="certificate"/>
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
<!-- <p class="sec-color p-bold">Course Starts on 20th September, Timings: 6-8 pm, Monday - Friday.</p> -->
<p class="t-just">In this course, you will learn the basics of Python Language, Exploratory Data Analysis, Inferential Statistics for Data Scientists, Machine Learning Techniques such as Linear Regression and Logistic Regression for solving Regression and Classification problems.</p>
<p class="t-just">This course is part of the Teksands High Impact Series and is designed specifically for the busy professionals who would want to develop the maximum understanding on the topics in the shortest time possible. This course uses a completely practical based approach to run through as much as projects/code/demo as possible and explain both the concepts and coding/solutions parts on the go with the demo. The learners are then given additional projects as practice assignments for them to solve them on their own and solidify their understandings.</p>

</div>
<div class="text-center">

<img src="/resources/landing-pages/images/icons/course-overview.png" alt="Course Overview" width="80%" />
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
<p class="all-p p-bold text-left">This LIVE course, Machine Learning Mastery will provide 20 hours of intense LIVE Training to the Learners.</p>

<div>
<ol class="course-desc-list">
 	<li style="list-style-type: none;">
<ol class="course-desc-list">
 	<li><strong>Basics of Python Language:</strong> Helps learners to understand the Language Elements of Python and data structures including Pandas and Numpy Libraries. This will enable you to code Machine Learning solutions covered in subsequent chapters.</li>
 	<li><strong>Exploratory Data Analysis:</strong> Learn to make meaning of the data in context of the problem statement and solution. Run a gamut of tools on your data to identify patterns and anomalies, take corrective action to cleanse them before feeding your data to the algorithms.</li>
 	<li><strong>Professional Visualisation:</strong> Learn the art of creating professional Visualisation for advanced technical analysis of your Input Data. Master Visualisations using two strong libraries - Matplotlib and Seaborn.</li>
 	<li><strong>Statistics:</strong> Learn Descriptive and Inferential Statistics and their application to Analytics and Machine Learning. Learn to understand data distributions and patterns, rules, inferences and treatments of various distributions. Learn to apply advanced statistical concepts like Hypothesis testing on your data to make complex decisions on a population of data by testing samples.</li>
 	<li><strong>Linear Regression Algorithm:</strong> Learn to apply Linear Regression Algorithm techniques on prediction problems walking through a real-world project.</li>
 	<li><strong>Logistic Regression Algorithm:</strong> Learn to apply the Logistic Regression Algorithm to understand the foundations of Classification techniques.</li>
</ol>
</li>
</ol>
The course is completely based on practical approaches of teaching. Learners will have intense exposure to real code and data while learning the concepts on the go. We will also provide you all the codes used in training and also additional problems for you to work on and practice.

</div>
</div>
<div>
<h2 class="sec-heading text-left">What will you learn?</h2>
<div class="features-container2">
<div class="features2">

<img src="/resources/landing-pages/images/dspg/data-analysis.png" alt="data analysis" />
<p class="features-p">Python Language</p>

</div>
<div class="features2">

<img src="/resources/landing-pages/images/dspg/machine-learning.png" alt="machine learning" />
<p class="features-p">Machine Learning Foundations</p>

</div>
<div class="features2">

<img src="/resources/landing-pages/images/dspg/data-analysis.png" alt="data analysis" />
<p class="features-p">Exploratory Data Analysis</p>

</div>
<div class="features2">

<img src="/resources/landing-pages/images/dspg/linear-regression.png" alt="linear regression" />
<p class="features-p">Linear Regression with Projects</p>

</div>
<div class="features2">

<img src="/resources/landing-pages/images/dspg/statistics.png" alt="statistics"/>
<p class="features-p">Inferential Statistics</p>

</div>
<div class="features2">

<img src="/resources/landing-pages/images/dspg/visualization.png" alt="visualization" />
<p class="features-p">Developing Visualization</p>

</div>
<div class="features2">

<img src="/resources/landing-pages/images/dspg/logistic.png" alt="logistic" />
<p class="features-p">Logistic Regression with Projects</p>

</div>
</div>
<p class="features-desc"><strong>The course includes a detailed insight into the how Data is Analysed, Prepared and Presented for Data Science challenges and also incorporates two Machine Learning Algorithms to solve Prediction and Classification problems using Python in a total of 20 hours to give the maximum value to our learners out of their busy schedule. </strong></p>

</div>
</div>
</div>
</div>
<!--Course Content-->

<!--Course Content-->

<div class="page-container lesson">
  <div class="nav course-outline-head ">
    <h2 class=" lg-center">Course Outline</h2>
    <button class="btn btn-primary" id="expand" >Expand All</button>
  </div>
  <div class="content ">
    <div class="accordion course-topic expandable expandable">
      <span class="el-lesson-number lesson-num" >1</span> 
      <div class='topic-content'>
        <div>Introduction To Python</div>
        <div>3 Topics</div>
      </div>
    </div>
    <div class="answers">
      <div class="list-header ld-primary-background">
        <div class="ld-table-list-title">
          <span class="ld-item-icon"> <i class="modern-icon-Topic-list"></i> </span>
          <span class="ld-text"> Lesson Content </span>
        </div>
        <!--/.ld-tablet-list-title-->
        <div class="ld-table-list-lesson-details">
          <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
          <span class="ld-lesson-list-steps elgray"> 0/3 Steps </span>
        </div>
        <!--/.ld-table-list-lesson-details-->
      </div>
      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14362">
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
      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14363">
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
      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14364">
        <p
          class="
            ld-table-list-item-preview ld-primary-color-hover ld-topic-row
            learndash-incomplete
          "
        >
          <span class="elumine-icon modern-icon-Topic-text"></span>
          <div class="ld-status-icon ld-status-incomplete"></div>
          <span class="ld-topic-title">Working with Numpy and Pandas Libraries</span>
        </p>
      </div>
    </div>
    <!-- First lesson ends here -->
    
    <div>
      <div class="accordion course-topic expandable">
        <span class="el-lesson-number lesson-num">2</span> 
        <div class="topic-content">
          <div>Advanced Exploratory Data Analysis</div>
          <div>5 Topics</div>
        </div>
      </div>
      <div class="answers">
        <div class="list-header ld-primary-background">
          <div class="ld-table-list-title">
            <span class="ld-item-icon"> <i class="modern-icon-Topic-list"></i> </span>
            <span class="ld-text"> Lesson Content </span>
          </div>
          <!--/.ld-tablet-list-title-->
          <div class="ld-table-list-lesson-details">
            <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
            <span class="ld-lesson-list-steps elgray"> 0/5 Steps </span>
          </div>
          <!--/.ld-table-list-lesson-details-->
      </div>
      <div
  class="ld-table-list-items"
  id="ld-topic-list-14367"
  data-ld-expand-list=""
>
  <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14368">
    <p
      class="
        ld-table-list-item-preview ld-primary-color-hover ld-topic-row
        learndash-incomplete
      "
    >
      <span class="elumine-icon modern-icon-Topic-text"></span>
      <div class="ld-status-icon ld-status-incomplete"></div>
      <span class="ld-topic-title">Data Collection and Data Organisation</span>
    </p>
  </div>
  <!--/.ld-table-list-item-->
  <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14369">
    <p
      class="
        ld-table-list-item-preview ld-primary-color-hover ld-topic-row
        learndash-incomplete
      "
    >
      <span class="elumine-icon modern-icon-Topic-text"></span>
      <div class="ld-status-icon ld-status-incomplete"></div>
      <span class="ld-topic-title">Understanding Features and Data</span>
    </p>
  </div>
  <!--/.ld-table-list-item-->
  <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14370">
    <p
      class="
        ld-table-list-item-preview ld-primary-color-hover ld-topic-row
        learndash-incomplete
      "
    >
      <span class="elumine-icon modern-icon-Topic-text"></span>
      <div class="ld-status-icon ld-status-incomplete"></div>
      <span class="ld-topic-title">Analysis of Patterns</span>
    </p>
  </div>
  <!--/.ld-table-list-item-->
  <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14371">
    <p
      class="
        ld-table-list-item-preview ld-primary-color-hover ld-topic-row
        learndash-incomplete
      "
    >
      <span class="elumine-icon modern-icon-Topic-text"></span>
      <div class="ld-status-icon ld-status-incomplete"></div>
      <span class="ld-topic-title">Finding Data Issues</span>
    </p>
  </div>
  <!--/.ld-table-list-item-->
  <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14372">
    <p
      class="
        ld-table-list-item-preview ld-primary-color-hover ld-topic-row
        learndash-incomplete
      "
    >
      <span class="elumine-icon modern-icon-Topic-text"></span>
      <div class="ld-status-icon ld-status-incomplete"></div>
      <span class="ld-topic-title">Cleansing Data</span>
    </p>
  </div>
  <!--/.ld-table-list-item-->
</div>
</div>

</div>
<!-- End of second lesson -->

  <div>
    <div class="accordion course-topic expandable">
      <span class="el-lesson-number lesson-num">3</span>
      <div class="topic-content">
        <div> Data Visualisations using Matlab and Seaborn</div>
        <div>3 Topics</div>
      </div>
    </div>
    <div class="answers">
      <div class="ld-table-list ld-topic-list ld-no-pagination" id="ld-expand-14374">
        <div class="ld-table-list-header ld-primary-background list-header">
          <div class="ld-table-list-title">
            <span class="ld-item-icon"> <i class="modern-icon-Topic-list"></i> </span>
            <span class=" ld-text"> Lesson Content </span>
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
          id="ld-topic-list-14374"
          data-ld-expand-list=""
        >
          <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14375">
            <p
              class="
                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                learndash-incomplete
              "
            >
              <span class="elumine-icon modern-icon-Topic-text"></span>
              <div class="ld-status-icon ld-status-incomplete"></div>
              <span class="ld-topic-title"
                >Understanding Types of Visualisations</span
              >
            </p>
          </div>
          <!--/.ld-table-list-item-->
          <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14376">
            <p
              class="
                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                learndash-incomplete
              "
            >
              <span class="elumine-icon modern-icon-Topic-text"></span>
              <div class="ld-status-icon ld-status-incomplete"></div>
              <span class="ld-topic-title"
                >Creating Visualisations using Matplotlib Library</span
              >
            </p>
          </div>
          <!--/.ld-table-list-item-->
          <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14377">
            <p
              class="
                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                learndash-incomplete
              "
            >
              <span class="elumine-icon modern-icon-Topic-text"></span>
              <div class="ld-status-icon ld-status-incomplete"></div>
              <span class="ld-topic-title"
                >Advanced Visualisations using Seaborn</span
              >
            </p>
          </div>
          <!--/.ld-table-list-item-->
        </div>
        <!--/.ld-table-list-items-->
        <div class="ld-table-list-footer"></div>
        <!--/.ld-table-list-footer-->
      </div>
      
    </div>
  </div>
  <!-- Third lesson ends here -->


  <div>
    <div class="accordion course-topic expandable">
      <span class="el-lesson-number lesson-num">4</span>
      <div class="topic-content">
        <div> Understanding Statistics for Machine Learining and Data Science</div>
        <div>6 Topics</div>
      </div>
    </div>
    <div class="answers">
      <div class="ld-table-list ld-topic-list ld-no-pagination" id="ld-expand-14381">
        <div class="ld-table-list-header ld-primary-background list-header">
          <div class="ld-table-list-title">
            <span class="ld-item-icon"> <i class="modern-icon-Topic-list"></i> </span>
            <span class="ld-text"> Lesson Content </span>
          </div>
          <!--/.ld-tablet-list-title-->
          <div class="ld-table-list-lesson-details">
            <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span> 
            <span class="ld-lesson-list-steps elgray"> 0/6 Steps </span>
          </div>
          <!--/.ld-table-list-lesson-details-->
        </div>
        <!--/.ld-table-list-header-->
        <div
          class="ld-table-list-items"
          id="ld-topic-list-14381"
          data-ld-expand-list=""
        >
          <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14382">
            <p
              class="
                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                learndash-incomplete
              "
            >
              <span class="elumine-icon modern-icon-Topic-text"></span>
              <div class="ld-status-icon ld-status-incomplete"></div>
              <span class="ld-topic-title">Introduction to Statistics</span>
            </p>
          </div>
          <!--/.ld-table-list-item-->
          <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14383">
            <p
              class="
                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                learndash-incomplete
              "
            >
              <span class="elumine-icon modern-icon-Topic-text"></span>
              <div class="ld-status-icon ld-status-incomplete"></div>
              <span class="ld-topic-title">Descriptive Statistics</span>
            </p>
          </div>
          <!--/.ld-table-list-item-->
          <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14384">
            <p
              class="
                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                learndash-incomplete
              "
            >
              <span class="elumine-icon modern-icon-Topic-text"></span>
              <div class="ld-status-icon ld-status-incomplete"></div>
              <span class="ld-topic-title">Normal Distribution</span>
            </p>
          </div>
          <!--/.ld-table-list-item-->
          <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14385">
            <p
              class="
                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                learndash-incomplete
              "
            >
              <span class="elumine-icon modern-icon-Topic-text"></span>
              <div class="ld-status-icon ld-status-incomplete"></div>
              <span class="ld-topic-title">Central Limit Theorem</span>
            </p>
          </div>
          <!--/.ld-table-list-item-->
          <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14465">
            <p
              class="
                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                learndash-incomplete
              "
            >
              <span class="elumine-icon modern-icon-Topic-text"></span>
              <div class="ld-status-icon ld-status-incomplete"></div>
              <span class="ld-topic-title">Understanding Probability</span>
            </p>
          </div>
          <!--/.ld-table-list-item-->
          <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14467">
            <p
              class="
                ld-table-list-item-preview ld-primary-color-hover ld-topic-row
                learndash-incomplete
              "
            >
              <span class="elumine-icon modern-icon-Topic-text"></span>
              <div class="ld-status-icon ld-status-incomplete"></div>
              <span class="ld-topic-title">Hypothesis Testing</span>
            </p>
          </div>
          <!--/.ld-table-list-item-->
        </div>
        <!--/.ld-table-list-items-->
        <div class="ld-table-list-footer"></div>
        <!--/.ld-table-list-footer-->
      </div>
      
    </div>
  </div>

  <!-- Fourth lesson ends here -->
  
  <div>
    <div class="accordion course-topic expandable">
      <span class="el-lesson-number lesson-num">5</span>
      <div class="topic-content">
        <div> Introduction to Machine Learning</div>
        <div>4 Topics</div>
      </div>
    </div>
    <div class="answers">
      <div
  class="ld-item-list-item-expanded"
  data-height="259"
  style="max-height: 259px"
>
  <div class="ld-table-list ld-topic-list ld-no-pagination" id="ld-expand-14386">
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
        <span class="ld-lesson-list-steps elgray"> 0/4 Steps </span>
      </div>
      <!--/.ld-table-list-lesson-details-->
    </div>
    <!--/.ld-table-list-header-->
    <div
      class="ld-table-list-items"
      id="ld-topic-list-14386"
      data-ld-expand-list=""
    >
      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14387">
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
      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14388">
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
      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14389">
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
      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14390">
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
  <!--/.ld-table-list-->
</div>

    </div>
  </div>

  <!-- Fifth lesson ends here -->
  
  <div>
    <div class="accordion course-topic expandable">
      <span class="el-lesson-number lesson-num">6</span>
      <div class="topic-content">
        <div> Advanced Exploratory Data Analysis</div>
        <div>6 Topics</div>
      </div>
    </div>
    <div class="answers">
      <div
  class="ld-item-list-item-expanded"
  data-height="347"
  style="max-height: 347px"
>
  <div
    class="ld-table-list ld-topic-list ld-no-pagination"
    id="ld-expand-14392"
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
        <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>|
        <span class="ld-lesson-list-steps elgray"> 0/6 Steps </span>
      </div>
      <!--/.ld-table-list-lesson-details-->
    </div>
    <!--/.ld-table-list-header-->
    <div
      class="ld-table-list-items"
      id="ld-topic-list-14392"
      data-ld-expand-list=""
    >
      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14393">
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
      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14394">
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
      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14395">
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
      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14396">
        <p
          class="
            ld-table-list-item-preview ld-primary-color-hover ld-topic-row
            learndash-incomplete
          "
        >
          <span class="elumine-icon modern-icon-Topic-text"></span>
          <div class="ld-status-icon ld-status-incomplete"></div>
          <span class="ld-topic-title"
            >Understanding Classification Techniques more broadly Copy</span
          >
        </p>
      </div>
      <!--/.ld-table-list-item-->
      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14397">
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
      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14398">
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

    </div>

  </div>

  <!-- Sixth lesson ends here -->
  <div>
    <div class="accordion course-topic expandable">
      <span class="el-lesson-number lesson-num">7</span>
      <div class="topic-content">
        <div> Advanced Exploratory Data Analysis</div>
        <div>5 Topics</div>
      </div>
    </div>
    <div class="answers">
      <div
  class="ld-item-list-item-expanded"
  data-height="303"
  style="max-height: 303px"
>
  <div
    class="ld-table-list ld-topic-list ld-no-pagination"
    id="ld-expand-14399"
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
      id="ld-topic-list-14399"
      data-ld-expand-list=""
    >
      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14400">
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
      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14401">
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
      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14483">
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
      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14485">
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
      <div class="ld-table-list-item lesson-item" id="ld-table-list-item-14487">
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

<img class="project-img" src="/resources/landing-pages/images/dspg/project-1.png" alt="Real Life Projects" />
<h3 class="real-proj"> House Price Prediction</h3>
<p class="example"><strong>Example</strong></p>
Car Price or House Price prediction given historical transaction data. You will learn how the Linear Regression algorithm learns patterns and helps predict new Car or House price based on parameters given.

</div>
<!--2-->
<div class="projects text-center">

<img class="project-img" src="/resources/landing-pages/images/dspg/project-2.png" alt="Real Life Projects" />
<h3 class="real-proj">Customer Churn Analysis</h3>
<p class="example"><strong>Example</strong></p>
Predict which customers are likely to leave the current provider based on their behavioural data from past. We will look at a Telecom or Insurance industry case study.

</div>
<!--3-->
<div class="projects text-center">

<img class="project-img" style="height: 210px; width: 240px;" src="/resources/landing-pages/images/dspg/projectt-3.png" alt="Real Life Projects" />
<h3 class="real-proj">Exploratory Data Analysis</h3>
<p class="example"><strong>Example</strong></p>
you will learn how to perform Univariate and Bivariate Analysis of data from a Micro-Credit organisation to determine what attributes from their credit transactions are influencing the probability of Default by borrowers.

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
<div class="course-table" style="overflow-x: auto;">
<table class="batch-table">
<tbody>
<tr>
<th>Start Date</th>
<th>Schedule</th>
<th>Timings</th>
<th></th>
</tr>
<tr>
<td>18<sup>th</sup> Oct</td>
<td>Mon-Fri (10 weekdays)</td>
<td>6 - 8 pm</td>
<!-- <td><a class="cta" href="https://site.teksands.ai/shop/data-science/data-science-and-predictive-analytics-mastery/" target="_blank" rel="noopener">Register</a> -->
<a class="cta" href="#brochure-download">Request Brochure/ Register for Demo Class</a></td>
</tr>
<tr>
  <td>15<sup>th</sup> Nov</td>
  <td>Mon-Fri (10 weekdays)</td>
  <td>6 - 8 pm</td>
  <td>  
    <a class="cta" href="#brochure-download">Request Brochure/ Register for Demo Class</a>
  </td>
</tr>
<!--
<tr>
<td>9th Aug</td>
<td>Mon-Fri (10 weekdays)</td>
<td>7 - 9 am</td>
<td>
                                    <a class="cta">Register</a>
<a class="cta" href="#brochure-download">Request Brochure/ Register for Demo Class</a></td>
</tr>
--></tbody>
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

<button class="accordion">What are the Professions/Job Roles in Data Science &amp; Analytics space?</button>
<div class="answers">

Data Science and Predictive Analytics has served a multitude of functions and job needs and a lot of Job Roles are created in organizations in the last few years. Some of the prominent Job Roles in this space are listed below:

<strong>Data Scientist: </strong>Data Scientists would have the responsibility of understanding and analysing all the data the organisation has and create Data Driven products and solutions to create businesses processes more efficient, drive automation, create decision systems, future prediction systems, etc.

<strong>Data Architect: </strong>Data Architects would typically analyse the organisational Data Schemas, design new schemas for newer data driven systems , tune existing data schemas, optimise organisational Mete Data and all data repositories including ETL Systems.

<strong>Data and Analytics Manager: </strong>Responsible for managing and leading Data initiatives in the organisation, including leadership in ETL programs, Decision Systems programs, leading analytics teams, etc.

<strong>Data Analyst:</strong>Data Analysts typically gather and analyse data within divisions and organisation for the purpose of building Insights and Analytics solutions and systems using a range of tools, techniques including statistics. This role is highly important for the leadership of any organisation to develop understanding of business trends.

<strong>Machine Learning Engineer: </strong>Responsible for developing sophisticated Machine Learning Models that are to create various Decision, Prediction, Classification, Clustering systems on Business Data.
All the roles above and the plethora of roles this space is offering are growing rapidly in demand and skills shortfall is even expanding leading to high salaries for every skilled personnel in these fields.

Given "Data is the new Fuel", demand for professionals in these fields in the many years to come will continue to expand unabated creating massive opportunities for data professionals.

</div>
</div>
<div>

<button class="accordion">What is the skill demand in this field?</button>
<div class="answers">

With Data Science applications booming through businesses leading to saving costs, better profitability and driving newer business models and products, the demand for these skills have skyrocketed. Literally, every business today is after quality skilled professionals in Data Science and Analytics. Not only they are looking for Data Science and Predictive Analytics skills to create new solutions, but preferring these as must-have skills in all other fields to drive continuous automation and efficiency. Even Business and Operations personnel are today are equipping themselves with foundational knowledge in these areas to save costs through automation.

<strong>Some statistics: </strong>
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

The course is completely based on practical approaches of teaching. Learners will have intense exposure to real code and data while learning the concepts on the go. We will also provide you all the codes used in training and also additional problems for you to work on and practice.

The Delivery method is <strong>Online, Live Classes</strong> led by Professional, Industry Experienced Instructors.

</div>
</div>
<div>

<button class="accordion">What is the course duration?</button>
<div class="answers">

<strong>20 Hours</strong>

<strong>Weekday Courses: </strong>Over 2 Weeks, all Weekdays (Monday to Friday), 2 hour Sessions per day.

<strong>Weekend Courses: </strong>Over 3 Weekends, Saturdays and Sundays, 3.5 hour Sessions per day.

<em>(Please check your specific course schedule)</em>

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
 	<li>Python Version 3 or above <a href="https://www.python.org/downloads/" target="_blank" rel="noopener">(https://www.python.org/downloads/)</a></li>
 	<li>Anaconda Platform <a href="https://www.anaconda.com/distribution/" target="_blank" rel="noopener">(https://www.anaconda.com/distribution/)</a></li>
</ol>
</div>
</div>
<div>

<button class="accordion">Who are the instructors for this course?</button>
<div class="answers">

All courses on Teksands are taught by Industry Professionals, highly qualified and focused Research Scholars from Reputed University

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
<a class="cta" href="https://site.teksands.ai/shop/data-science/data-science-and-predictive-analytics-mastery/">Get Certified</a>
</div>
<div><img src="/resources/landing-pages/images/dspg/data-certificate.jpeg" alt="certificate" width="100%" /></div>
</div>
</div>
</div>
<!--About Teksands-->
<div class="bg-grey about">
<div class="page-container text-center">
<div>

<img src="/resources/images/teksands_logo.jpg" />
<p class="about-desc">"Teksands' mission is to have Future ready Technology workforce. We provide Online and Corporate Courses on Deep Tech including Data Science, Machine Learning, Artificial Intelligence, Python, Deep Learning, Neural Network, and much more. Teksands courses are intended to primarily help working professionals achieve career augmentation or career switch in Deep Tech areas by delivering very high quality, application driven training suited to the needs of our learners needs and goals. "Teksands High Impact Series" & "TEKS - RISE" are the flagship programs to offer short term & longer duration Career Oriented courses."</p>

</div>
</div>
</div>

<!--Demo Class video section-->
<div class="bg-grey">
<div class="page-container">
<div>
<h2 class="sec-heading lg-center">Demo Class Video</h2>
</div>
<div><iframe class="course-intro" src="https://player.vimeo.com/video/579362383" frameborder="0" allowfullscreen="allowfullscreen"></iframe></div>
</div>
</div>
<!--Final CTA-->
<div class="gradient-bg">
<div class="page-container final-cta"><a class="bottom-cta" href="https://site.teksands.ai/shop/data-science/data-science-and-predictive-analytics-mastery/" target="_blank" rel="noopener">Register Now</a>
<a class="bottom-cta" href="#brochure-download">Request Brochure/ Register for Demo Class</a></div>
</div>
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
