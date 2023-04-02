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
     <title>Deep Learning - CNN for Image Processing | Teksands.ai</title>
     <meta name="description" content="The Deep Learning Market is expected to register a CAGR of 42.56% over the forecast period from 2020 to 2025. Learn more about deep learning here." />
     <meta name='viewport' content='width=device-width, initial-scale=1'>
     <meta name="robots" content="max-image-preview:standard">
     
     <link rel="alternate" href="https://teksands.ai/" hreflang="x-default" />
     <!--Fonts-->
     <!--ASAP & Roboto-->
     <link rel="preconnect" href="https://fonts.googleapis.com">
     <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
     <link href="https://fonts.googleapis.com/css2?family=Asap:wght@300;500;600;700&family=Roboto:wght@100;400;500;700&display=swap" rel="stylesheet">
     <link rel='stylesheet' type='text/css' media='screen' href='/resources/landing-pages/style/cnn-for-image-processing.css'>
     <!-- <link rel="stylesheet" href="style/pgpads-s-course-content.css"> -->
     
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
    var name = $("#cnn_name").val();
    var email = $("#cnn_email").val();
    var mobile = $("#cnn_mobile").val();
    var coursess = "Deep Learning - CNN for Image Processing using TensorFlow and Keras";
    
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
    	"name": "Deep Learning and cnn for Image Processing",
    	"item": "https://teksands.ai/courses/deep-learning-and-cnn-for-image-processing"  
  	}]
	}
	</script>		
 </head>
 <body>
     <header class="header">
         <a href="#" class="brand">
             <img src="/resources/images/teksands_logo.jpg" alt="Teksands Logo">
         </a>
     </header>
     <main>
         <!--Banner-->
         <div class="banner">
             <div class="overlay"></div>
             <div class="page-container">
                 <div class="flex">
                    <div class="banner-desc">
                        <h1 class="main-heading"> Deep Learning - CNN for Image Processing using TensorFlow and Keras </h1>
                        <p class="sub-heading"></p>

                        <!-- <a href="https://site.teksands.ai/shop/machine-learning/cnn-keras/" class="cta-btn">Enroll Now</a> -->
                     </div> 

                     <div class="form-group">
                 
						<form class="brochure-form" id="brochure-download" method="post" action="">
                             <p class="heading">Register for Demo Class / Download Brochure</p>
                             <input type="text" id="cnn_name" name="name" placeholder="Name" onkeydown="return /[a-z ]/i.test(event.key)" maxlength="100" required ><br/>
                             <input type="email" id="cnn_email" name="email" placeholder="Email"  maxlength="100" required ><br/>
                             <input  type="text" id="cnn_mobile" name="mobile" placeholder="Mobile Number" onkeypress='return isNumberKey(event);' required ><br>
   
                              <p class="agreement">By clicking the button below, you agree to receive communications from us about this programme and other relevant programmes. <a href="https://teksands.ai/privacy-policy/" target="_blank">Privacy Policy</a></p>
							  <input type="button" name="submit" value="SUBMIT" onclick="saveLeads()">
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
            <div class="bg-grey" style="padding-bottom:0;">
              <div class="page-container" style="padding-bottom: 0;margin-bottom: 0;">
                <!-- <div class="course-overview"> -->
                  <div>
                    <div class="container intro-control" style="padding-bottom: 0px;">
                      <h2 class="sec-heading lg-center">Course Introduction</h2>
                      <p class="p-bold p-align">Total Curriculum Duration: 20 Hours</p>
                      <!-- <p class="sec-color p-bold">Course Starts on 27th September, Timings: 6-8 pm, Monday - Friday.</p> -->
                      <p class='p-align'>
                        <strong>Artificial Intelligence</strong> is on a rage! Everyone in the Technology world is talking about it and it is being touted as the godsent miracle to solve the most complex problems mankind wants to solve. Understanding the latest advancements in artificial intelligence can seem overwhelming, but it really boils down to two very popular concepts <a href="https://teksands.ai/courses/machine-learning-mastery" target="_blank"><strong>Machine Learning</strong></a> and <strong>Deep Learning</strong>. However, Deep Learning is gaining much huge popularity due to its clear supremacy in terms of performance in solving very complex problems.
                      </p>
                      <p class='p-align' style="margin-bottom: 0;">
                        As per <strong>Andrew Ng</strong>, Founder and Head of the Google Brain Project, "Deep-learning will transform every single industry. Healthcare and transportation will be transformed by deep-learning. I want to live in an AI-powered society. When anyone goes to see a doctor, I want AI to help that doctor provide higher quality and lower cost medical service. I want every five-year-old to have a personalised tutor."
                      </p>
                  </div>
              </div>
           </div>
         </div>
         <div class="bg-grey" style="margin-top: 0px;">
           <div class="page-container" style="padding-top: 0px;">
            <div class="intro-control">
              <h4 class="sec-heading lg-center">Deep Learning Market Trend</h4>
              <p class='p-align'>
                The Deep Learning Market is expected to register a CAGR of 42.56% over the forecast period from 2020 to 2025. Deep learning, a subfield of machine learning (ML), has led to breakthroughs in several artificial intelligence tasks, including speech recognition, natural language processing and image recognition.
              </p>
              <p class="p-align">
                There is massive amounts of money that Google, Microsoft, Amazon, Facebook and others are pouring in Deep Learning Research and development of Open Source products and libraries such as TensorFlow, CNTK, Keras, Theano, PyTorch, etc. By far, TensorFlow/Keras combination are leading the market in their penetration as the de-facto choice of Deep Learning Libraries of organisations around the world.
              </p>
              <p class="p-align">
                Global Artificial Intelligence Market, By Offering (Hardware, Software and Services), Technology (Machine Learning, Deep Learning, Natural Language Processing, Context-Aware Computing, Computer Vision), End-User Industry (Healthcare, Manufacturing, Automotive, Agriculture, Retail, Security, Human Resources, Marketing, Law, Fintech, Construction, Defense, Aerospace, Supply Chain, Building Automation, Consumer, Food and Beverage, Gaming, Media and Entertainment, Telecommunication and Oil and Gas) are expected to grow at a CAGR of 39.44% in the period of 2020 to 2027 to reach a level of USD 300 Billion by 2027. 
              </p>
              <div class='market-trend-image'>
                <img src="/resources/landing-pages/assets/image-processing/growth.png" alt="Growth" class="img-responsive">
              </div>
              <p class="p-align">
                This phenomena is indicative of a massive surge in demand for Data Science and Machine Learning professionals. The ones among them who possess superior Deep Learning skills are going to be the most successful and will demand salaried at a much higher rate.
              </p>
              <div>
                <h4 class="sec-heading lg-center">Convolutional Neural Network</h4>
                <div>
                  <p class='p-align'>
                    In deep learning, a Convolutional Neural Network or CNN is a class of Artificial Neural Networks or Deep Neural Networks, most commonly applied to analyse visual imagery. Common applications include image analysis and processing, face detection, object detection which has massive amounts of usage in many domains, emotion analysis, more complex usages include uses in self driving cars, etc. 
                  </p>
                  <p class='p-align' style="margin-bottom:0;">
                    Image processing use cases have gathered massive amount of use cases in the industry and consequently, the demand for CNN experts have surged.
                  </p>
                </div>
              </div>
             </div>
           </div>
        </div>
         <div class="gradient-bg">
           <div class="page-container">
            <h4 class="sec-heading lg-center gradient-bg-contents special-underline">Skills You will acquire:</h4>
            <div class="features-container2 width-control">
             <div class="features2">
               <img src="/resources/landing-pages/assets/image-processing/simple.svg" alt="simple">
               <div class=features-p>Artificial Neural Network</div>
              </div>
             <div class="features2">
              <img src="/resources/landing-pages/assets/image-processing/curriculum-4.svg" alt="curriculum-">
               <div class=features-p>Deep Neural Network</div></div>
             <div class="features2">
               <img src="/resources/landing-pages/assets/image-processing/curriculum-6.svg" alt="curriculum">
               <div class=features-p>Convolutional Neural Network</div></div>
             <div class="features2">
               <img src="/resources/landing-pages/assets/image-processing/tensorflow.svg" alt="tensorflow">
               <div class=features-p>TensorFlow</div></div>
             <div class="features2">
               <img src="/resources/landing-pages/assets/image-processing/keras.svg" alt="keras">
               <div class=features-p>Keras</div></div> 
            </div>
           </div>
            <br>
            <!-- <div class="features-new">
              <h4>Pre-requisites and Students' Backgrounds</h4>
              <p class="p-align features-content">
                Before joining this program, we expect you to have some working knowledge of Python as this course will use Python as the language vehicle for CNN solutions.
              </p>
            </div> -->
           </div>
         </div>
         <div>
          <div class="page-container">
              <div>
                 <div >
                     <h2 class="sec-heading lg-center">Program Structure</h2>
                 </div>
                 <div class="course-table" style="overflow-x:auto; max-width: 960px; margin: 0 auto;">
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
                    <h2 class="sec-heading lg-center special-underline gradient-bg-contents">Curriculum</h2>
                    <div class="features-container2 width-control">
                        <div class="features2">
                            <img src="/resources/landing-pages/assets/image-processing/intro.svg" alt = "intro">
                            <p class="features-p">Introduction to Deep Learning</p>
                        </div>
                        <div class="features2">
                            <img src="/resources/landing-pages/assets/image-processing/math.svg" alt = "math">
                            <p class="features-p">Understanding Mathematical Building Blocks of Deep Learning</p>
                        </div>
                        <div class="features2">
                            <img src="/resources/landing-pages/assets/image-processing/network.svg" alt = "network">
                            <p class="features-p">Deep Neural Network Architectures</p>
                        </div>
                        <div class="features2">
                            <img src="/resources/landing-pages/assets/image-processing/curriculum-4.svg" alt = "curriculum">
                            <p class="features-p">Training a DNN: Loss Functions, Optimisers, Initializers</p>
                        </div>
                        <div class="features2">
                            <img src="/resources/landing-pages/assets/image-processing/tensorflow.svg" alt = "tensorflow">
                            <p class="features-p">Introduction to TensorFlow</p>
                        </div>
                        <div class="features2">
                            <img src="/resources/landing-pages/assets/image-processing/keras.svg" alt = "keras">
                            <p class="features-p">Introduction to Keras</p>
                        </div>
                        <div class="features2">
                          <img src="/resources/landing-pages/assets/image-processing/simple.svg" alt="simpl">
                          <p class="features-p">Create a Simple Deep Neural Net</p>
                        </div>
                        <div class="features2">
                            <img src="/resources/landing-pages/assets/image-processing/understand.svg" alt = "understand">
                            <p class="features-p">Understanding Convolutional Neural Networks (Convnets)</p>
                        </div>
                        <div class="features2">
                          <img src="/resources/landing-pages/assets/image-processing/filter.svg" alt = "filter">
                          <p class="features-p">Convolutions, Filters and Pooling Operations</p>
                        </div>
                        <div class="features2">
                          <img src="/resources/landing-pages/assets/image-processing/graph.svg" alt = "graph">
                          <p class="features-p">Using a Pretrained Convnet to do Feature Extraction</p>
                        </div>
                        <div class="features2">
                          <img src="/resources/landing-pages/assets/image-processing/tuning.svg" alt = "tuning">
                          <p class="features-p">Fine-Tuning a Convnet</p>
                        </div>
                        <div class="features2">
                          <img src="/resources/landing-pages/assets/image-processing/separation.svg" alt = "separation">
                          <p class="features-p">Visualizing what Convnets learn and how they make Classification Decisions</p>
                        </div>
                        <div class="features2">
                          <img src="/resources/landing-pages/assets/image-processing/test.svg" alt = "test">
                          <p class="features-p">Final Quiz and Project Assignment</p>
                        </div>
                    </div>
                </div>
             </div>
         </div>
         <!-- Libraries covered -->
         <div>
          <div class="page-container">
              <div>
                 <h2 class="sec-heading lg-center">Technologies Covered</h2>
              </div>
              <div class="projects-container">
                <!--1-->
                <div class="libs text-center">
                    <img class="lib-img" src="/resources/landing-pages/assets/image-processing/lib-1.png" alt="Real Life Projects">
                </div>
                <!--2-->
                <div class="libs text-center">
                    <img class="lib-img" src="/resources/landing-pages/assets/image-processing/lib-2.png" alt="Real Life Projects">
                    <!-- <p class="example"><strong >Example</strong></p>
                    <p>Car Price or House Price prediction given historical transaction data. You will learn how the Linear Regression algorithm learns patterns and helps predict new Car or House price based on parameters given.</p> -->
                </div>
                <!--3-->
                <div class="libs text-center">
                    <img class="lib-img" src="/resources/landing-pages/assets/image-processing/lib-3.png" alt="Real Life Projects">
                </div>
                <!--4-->
                <div class="libs text-center">
                    <img class="lib-img" src="/resources/landing-pages/assets/image-processing/lib-4.png" alt="Real Life Projects">
                </div>
                <!-- 5 -->
                <div class="libs text-center">
                    <img class="lib-img" src="/resources/landing-pages/assets/image-processing/lib-5.png" alt="Real Life Projects">
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
                    <div>Week 1: Introduction to Deep Learning</div>
                    <div>13 Topics</div>
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
                    Understanding Neural Networks
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Deep Neural Network Architectures
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Introduction to TensorFlow and Keras
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Training a Deep Neural Network
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Gradient-based Optimisation
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Chaining Derivatives and Backpropagation
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Loss Functions, Optimizers, Initializers
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Batch-normalization
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                      Dropouts
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Understanding Image Data
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Understanding the Convolution Layer
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Filters and Feature Maps
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Pooling Layer
                  </p>
                </div>
              </div>
            </div>
          </div>

          <!-- First lesson ends here -->
          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >2</span> 
                  <div class='topic-content'>
                    <div>Week 1-2: CNN Architectures</div>
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
                  <span class="ld-lesson-list-steps elgray"> 0/7 Steps </span> -->
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>
                    LeNet-5
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    AlexNet
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    VGGNet
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    ResNet
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    XceptionNet
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    SENet
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Implementing a Convolutional Network using Keras
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Image Augmentation Techniques
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Using Pretrained Models and Transfer Learning
                  </p>
                </div>
              </div>
            </div>
          </div>

          <!-- Second lesson ends here -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >3</span> 
                  <div class='topic-content'>
                    <div>Week 3: Object Detection</div>
                    <div>4 Topics</div>
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
                    Fully Convolutional Networks
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    You Only Look Once(YOLO) Networks
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Semantic Segmentation
                  </p>
                </div>
                <div class="lesson-item">
                  <p>
                    Project Discussion
                  </p>
                </div>
              </div>
            </div>
          </div>

          <!-- Third lesson ends here  -->


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
                     <img class="project-img" src="https://teksands.ai/resources/landing-pages/images/2021/07/project-3.png" alt="Real Life Projects">
                     <h5 class="real-proj">Object Detection</h5>
                 </div>
                 <!--2-->
                 <div class="projects text-center">
                     <img class="project-img" src="/resources/landing-pages/assets/image-processing/driver-drowsiness-detection.jpeg" alt="Real Life Projects">
                     <h5 class="real-proj">Driver Drowsiness Detection Using Python</h5>
                 </div>
                 <!--3-->
                 <div class="projects text-center">
                     <img class="project-img" src="/resources/landing-pages/assets/image-processing/plant-disease.jpeg" alt="Real Life Projects">
                     <h5 class="real-proj">Plant Disease Detection Using Image Processing</h5>
                 </div>
                 <!--4-->
                 <div class="projects text-center">
                     <img class="project-img" src="/resources/landing-pages/assets/image-processing/traffic-sign.jpeg" alt="Real Life Projects">
                     <h5 class="real-proj">Traffic Sign Recognition</h5>
                 </div>
                 <!--5-->
                 <div class="projects text-center">
                     <img class="project-img" src="/resources/landing-pages/assets/image-processing/image-captioning.jpeg" alt="Real Life Projects">
                     <h5 class="real-proj">Image Caption Generator</h5>
                 </div>
                 <!-- 6 -->
                 <div class="projects text-center">
                   <img class="project-img" src="/resources/landing-pages/assets/image-processing/gender-age-detection.jpeg" alt="Real Life Projects">
                   <h5 class="real-proj">Gender and Age Detection</h5>
               </div>
               <!-- 7 -->
               <div class="projects text-center">
                 <img class="project-img" src="/resources/landing-pages/assets/image-processing/visual-tracking.jpeg" alt="Real Life Projects">
                 <h5 class="real-proj">Visual Tracking System</h5>
             </div>
             <!-- 8 -->
             <div class="projects text-center">
               <img class="project-img" src="https://teksands.ai/resources/landing-pages/images/2021/07/project-5.png" alt="Real Life Projects">
               <h5 class="real-proj">Emotion Detection</h5>
             </div>
             <!-- 9 -->
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
                        <p class="width-control">Upon successful completion of the programme, participants will be awarded a verified digital certificate by Teksands.</p>
                        <a class="cta" href="#">Get Certified</a>
                     </div>
                     <div>
                         <img src="/resources/landing-pages/assets/image-processing/certificate-image-processing.jpeg" alt="certificate" width="100%">
                     </div>
                 </div>
             </div>
         </div>
         <!--About Teksands-->
         <div class="bg-grey about" style="background-color: #ffffff;">
            <div class="page-container text-center">
                <div>
                    <img src="/resources/images/teksands_logo.jpg">
                    <p class="about-desc">"Teksands' mission is to have Future ready Technology workforce. We provide Online and Corporate Courses on Deep Tech including Data Science, Machine Learning, Artificial Intelligence, Python, Deep Learning, Neural Network, and much more. Teksands courses are intended to primarily help working professionals achieve career augmentation or career switch in Deep Tech areas by delivering very high quality, application driven training suited to the needs of our learners needs and goals. "Teksands High Impact Series" & "TEKS - RISE" are the flagship programs to offer short term & longer duration Career Oriented courses."</p>
                </div>
            </div>
         </div>
         </div>
         <!-- </main> -->
         <div class="gradient-bg">
             <div class="page-container final-cta">
                <!-- <a class="bottom-cta" href="https://site.teksands.ai/shop/machine-learning/cnn-keras/" target="_blank"><span class="align-middle">Register Now</span></a><br> -->
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
      
       </script>

 </body>
 </html>