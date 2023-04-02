<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
 <html>
 <head>
  	<link rel="icon" href="/resources/landing-pages/style/cropped-ts-favicon.png" type="image/png" >
	<link href="/resources/landing-pages/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/landing-pages/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/landing-pages/js/bootstrap.js" rel="stylesheet">
    <link href="/resources/landing-pages/js/bootstrap.min.js" rel="stylesheet">
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Teksands - DevOps Mastery</title>
    <meta name="description" content="The demand for DevOps professionals have increased tremendously.  Click here to know the DevOps Mastery Program of Teksands." />
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <meta name="robots" content="max-image-preview:standard">
     
    <link rel="alternate" href="https://teksands.ai/" hreflang="x-default" />
    <!--Fonts-->
    <!--ASAP & Roboto-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Asap:wght@300;500;600;700&family=Roboto:wght@100;400;500;700&display=swap" rel="stylesheet">
    <link rel='stylesheet' type='text/css' media='screen' href="/resources/landing-pages/style/devops_mastery.css">
    
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="/resources/js/sweetalert/sweetalert.css"/>
    <script src="/resources/js/sweetalert/sweetalert.min.js"></script>
    <script src="<c:url value="/resources/js/overlay/loadingoverlay.js"/>"></script>
    
    <style>
    .lesson-features {
        margin: 0 auto;
    	max-width: 400px;
    	border: 2px solid #fff;
    	background-color: #0a2b51 !important;
    }
    .features-head {
	    text-align: center;
	    color: #fff;
	}
    </style>
    
 <script>
    
function saveLeads()
{
    var name = $("#name").val();
    var email = $("#email").val();
    var mobile = $("#mobile").val();
    var coursess = "DevOps Mastery Program";
    
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
    	"name": "DevOps Mastery Program",
    	"item": "https://teksands.ai/courses/dev-ops"  
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
                        <h1 class="main-heading">DevOps Mastery Program</h1>
                        <p class="sub-heading">30 hours | 2 hours x 15 weekdays</p>
                        <!-- <a href="https://site.teksands.ai/shop/machine-learning/devops_mastery/" class="cta-btn">Enroll Now</a> -->
                     </div> 

                     <div class="form-group form-style">
                 
                            <form class="brochure-form" id="brochure-download" method="post">
                            <p class="heading">Register for Demo Class / Download Brochure</p>
                            <input type="text" id="name" name="name" placeholder="Name" maxlength="100" onkeydown="return /[a-z ]/i.test(event.key)"><br/>
                            <input type="email" id="email" name="email" placeholder="Email" maxlength="100" ><br/>
                            <input  type="text" id="mobile" name="mobile" placeholder="Mobile Number"  onkeypress='return isNumberKey(event);'><br>
   
                              <p class="agreement">By clicking the button below, you agree to receive communications from us about this programme and other relevant programmes. <a href="https://teksands.ai/privacy-policy/" target="_blank">Privacy Policy</a></p>
                            <input type="button" name="submit" value="SUBMIT" onclick="saveLeads()">
                        	</form>
                     </div>
                 </div>
             </div>
         </div>
         <!--Course Introduction-->
         <div class="bg-grey">
            <div class="page-container">
              <div class="course-overview">
                <div>
                  <div class="container intro-control">
                    <h2 class="sec-heading lg-center">Course Introduction</h2>
                    <p class="p-bold">This course spans 3 weeks, 15 LIVE online sessions of 2 hours each, totaling 30 hours.</p>
                    <!-- <p class="sec-color p-bold">Course Starts on 27th September, Timings: 6-8 pm, Monday - Friday.</p> -->
                    <p>
                      DevOps has taken the Software Development world by storm in the last few years, making the traditional
                      Software Engineering process much more efficient, disciplined, easily repeatable and making engineering
                      process tasks highly automated. As a result, the demand for DevOps professionals have increased
                      tremendously. Not only have exclusive DevOps roles have emerged offering lucrative career options, all
                      Developers and Engineers are also expected to have solid DevOps knowledge and become full-stack.
                    </p>
                    <p>
                      The DevOps market is expected to grow at a CAGR of 20-25% yearly between 2021-26. This underscores
                      the phenomenal rate at which DevOps professionals will be needed in the Market.
                    </p>
                    <p>
                      Virtually, every company in the world with a significant Software Development practice is in need of DevOps
                      professionals and the gap in demand-supply is massive at this moment indicating the huge opportunity that
                      lies ahead for skilled professionals. A simple search in Naukri.com reveals more than 30,000 DevOps openings
                      in India at the moment this page is written.
                    </p>
                    <p>
                      The DevOps Mastery Program from <a href="https://teksands.ai/" target="_blank"><b>Teksands</b></a> is crafted to provide you with deep knowledge of a full gamut
                      of DevOps tools including Git, Jenkins, Docker, Ansible, Terraform, Kubernetes, Prometheus, and Grafana.
                      This DevOps program is completely hands-on driven and covers all DevOps areas such as Continuous
                      Development, Configuration Management and Continuous Integration, and finally, Continuous Monitoring of
                      software throughout its development life cycle.
                    </p>
                  </div>
                  <div class="audience">
                    <h4 class="sec-heading lg-center">Intended Audience</h4>
                    <ul>
                      <li>
                        All Software Developers, Engineers including Data Engineers, AI/ML Engineers, IoT Engineers,
                        professionals from all other specific disciplines today need to apply DevOps in their Engineering practices.</li>
                      <br>
                      <li>
                        Infra and Production Engineers whose role convers functions such as Deployments, Migrations,
                        Monitoring, etc are especially in need for DevOps tools and technologies.
                      </li> 
                      <br>
                      <li>
                        Professionals who are aiming to become specialist DevOps Engineers.
                      </li><br>
                    </ul>
                  </div>
                </div>
                <div class="text-center">
                  <img src="/resources/landing-pages/assets/devops-course-overview-min.png" alt="Course Overview" width="80%">
                  <p class="sec-color p-bold"></p>
                </div>
                
                <!-- <iframe class="course-intro" src="https://player.vimeo.com/video/579362383" frameborder="0" allowfullscreen="allowfullscreen"></iframe>  -->
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
                      <div class="feature-header">
                        <img src="/resources/landing-pages/images/2021/07/live-instructor.png" alt="live instructor">
                        <h6 class="features-p">30 Hours of Live Instructor-led Sessions</h6>
                      </div>
                    </div>
                    <div class="features">
                      <div class="feature-header">
                        <img src="/resources/landing-pages/assets/modules.svg" alt="modules">
                        <h6 class="features-p">11 Course Modules</h6>
                      </div>
                    </div>
                    <div class="features">
                      <div class="feature-header">
                        <img src="/resources/landing-pages/assets/projects.png" alt="projects">
                        <h6 class="features-p">Hands-on Projects</h6>
                      </div>
                    </div>
                    <div class="features">
                      <div class="feature-header">
                        <img src="/resources/landing-pages/images/2021/07/quiz-assignment.png" alt="quiz assignment">
                        <h6 class="features-p">Assignments</h6>
                      </div>
                    </div>
                    <div class="features">
                      <div class="feature-header">
                        <img src="/resources/landing-pages/images/2021/07/recorded-videos.png" alt="recorded videos">
                        <h6 class="features-p">Lifetime Access</h6>
                      </div>
                    </div>
                    <!-- <div class="features">
                      <div class="feature-header">
                        <img src="/resources/landing-pages/images/2021/07/quiz-assignment.png">
                        <h6 class="features-p">24 x 7 Expert Support</h6>
                      </div>
                    </div> -->
                    <div class="features">
                      <div class="feature-header">
                        <img src="/resources/landing-pages/images/2021/07/support.png" alt="support">
                        <h6 class="features-p">Forum</h6>
                      </div>
                    </div>
                    <div class="features">
                      <div class="feature-header">
                        <img src="/resources/landing-pages/images/2021/07/certificate.png" alt="certificate">
                        <h6 class="features-p">Certification</h6>
                      </div>
                    </div>
                </div>
                
					<div class="features content lesson-features">
	                   <div class="feature-header">
	                     <img src="/resources/landing-pages/assets/image-processing/career.png" alt="career">
	                     <h6 class="features-p features-head">CAREER ASSISTANCE FROM OUR PLACEMENT CELL</h6>
	                   </div>
                 	</div>
             	
             </div>
         </div>
         <!--Course Overview-->
         <!-- <div>
             <div class="page-container">
                 <div class="course-overview">
                    <div>
                        <h2 class="sec-heading text-left">Course Overview</h2>
                        <p class="t-just">Teksands High Impact Series is designed specifically for the busy professionals who would want to develop the maximum understanding on the topics in the shortest time possible. This course uses a completely practical based approach to run through as much as projects/code/demo as possible and explain both the concepts and coding/solutions parts on the go with the demo. The learners are then given additional projects as practice assignments for them to solve them on their own and solidify their understandings.</p>
                    </div>
                    <div class="text-center">
                        <img src="/resources/landing-pages/images/2021/07/course-overview.png" alt="Course Overview" width="80%">
                        <p class="sec-color p-bold"></p>
                    </div>
                 </div>
             </div>
         </div> -->
         <!--Detailed Course Description-->
         <div class="bg-grey">
             <div class="page-container">
                 <div class="course-desc">
                    <div>
                        <h2 class="sec-heading text-left">Detailed Description Of the Courses</h2>
                        <p class="all-p p-bold text-left">This course, DevOps Mastery will provide 30 hours of intense LIVE Training to the Learners.
                        <div>
                            <ol class="course-desc-list">
                                <li><strong>DevOps Introduction:</strong> 
                                    Understand how DevOps facilitate collaborative approaches to make the
                                    Application Development team and the IT Operations team of an
                                    organization to seamlessly work with better communication. In this
                                    section you will learn about the DevOps process areas introduction and
                                    introduction to DevOps Pipelines.      
                                  </li>
                                <li><strong>Version Control with Git:</strong>
                                    A version control system is based around the concept of managing
                                    changes on your applications, facilitating concurrent development and
                                    synchronisations between changes. In this section, you will learn Git, the
                                    most popular version control tool in use today. You will learn how to
                                    create branches, manage concurrency, cloning, checkout, merging, and all
                                    other commonly used commands.   
                                  </li>
                                <li><strong>Continuous Integration using Jenkins:</strong>  
                                    Jenkins is an open-source automation tool written in Java with plugins
                                    built for Continuous Integration purposes and is the most popular tool
                                    now for Continuous Integration automation. In this section, you will learn
                                    how to deploy code and manage pipelines using Jenkins, including
                                    managing master-slave architecture and notifications management.
                                </li>
                                <li><strong>Configuration Management Using Ansible:</strong>
                                    Configuration management is a process for maintaining computer
                                    systems, servers, and software in a desired, consistent state. In this
                                    section, you will learn Ansible, the most popular Configuration
                                    Management tool in use today, concepts such as Inventory, Hosts and
                                    Tasks, how to create playbooks, and more.
                                </li>
                                <li><strong>Containerization using Docker:</strong> 
                                    Containerization is the process of bundling an application together with
                                    all of its required libraries, frameworks, configuration files and
                                    dependencies so that it can be run efficiently in different computing
                                    environments. In this section, you will learn in detail about Docker and
                                    how to create and manage containers using Docker including concepts
                                    such as Images, Networks, Swarms, Docker-compose, Container
                                    Registries and more.
                                </li>
                                <li><strong>Orchestration using Kubernetes:</strong> 
                                    Kubernetes is a powerful open-source system, initially developed by
                                    Google, for managing containerized applications in a clustered
                                    environment. In this section, you will learn about Container
                                    Orchestration, Kubernetes Architecture, Deployments, Microservices and
                                    more.
                                </li>
                                <li><strong>Monitoring using Prometheus and Grafana:</strong>
                                  Grafana is an open source solution for running data analytics, pulling up
                                  metrics that make sense of the massive amount of data & to monitor our
                                  apps with the help of cool customizable dashboards and Prometheus is an
                                  open-source systems monitoring and alerting toolkit. In this section, you
                                  will learn the concepts of Monitoring, and Monitoring using Graphana
                                  and Prometheus.
                                </li>
                                <li><strong>Provisioning using Terraform:</strong> 
                                  Provisioning is the enterprise-wide configuration, deployment and
                                  management of multiple types of IT system resources. In this section, you
                                  will learn about Infrastructure provisioning automation using Terraform.
                                </li>
                                <li><strong>Selenium:</strong> 
                                  Selenium is a free (open-source) automated testing framework used to
                                  validate web applications across different browsers and platforms. In this
                                  section, you will learn about test automation and use of Selenium to
                                  Automate test cases for your application, and also integrate.
                                </li>
                                <li><strong>Nagios:</strong> 
                                  Nagios provides a monitoring, alerting, graphing, and reporting platform
                                  for your entire infrastructure, including servers, operating systems,
                                  applications, network devices, websites, hypervisors, cloud servers, and
                                  much more. In this section, you will learn Nagios Network Monitoring,
                                  Nagios Server, and commonly used commands.
                                </li>
                                <li><strong>AWS EC2 and IAM:</strong> 
                                    In this section, you will learn about AWS fundamentals, setting up an
                                    AWS instance, Creating Security Groups, AWS CLI, understand
                                    virtualisation, etc.
                                </li>
                            </ol>
                        </div>
                    </div>
                    <div>
                        <h2 class="sec-heading text-left">What will you learn?</h2>
                        <div class="features-container2">
                            <div class="features2">
                                <img src="/resources/landing-pages/assets/devops2.png" alt="devops">
                                <p class="features-p">DevOps Introduction</p>
                            </div>
                            <div class="features2">
                                <img src="/resources/landing-pages/assets/git.jpg" alt="git">
                                <p class="features-p">Version Control with Git</p>
                            </div>
                            <div class="features2">
                                <img src="/resources/landing-pages/assets/jenkins.svg" alt="jenkins">
                                <p class="features-p">Continuous Integration using Jenkins</p>
                            </div>
                            <div class="features2">
                                <img src="/resources/landing-pages/assets/ansible.png" alt="ansible">
                                <p class="features-p">Configuration Management Using Ansible</p>
                            </div>
                            <div class="features2">
                                <img src="/resources/landing-pages/assets/docker.png" alt="docker">
                                <p class="features-p">Containerization using Docker</p>
                            </div>
                            <div class="features2">
                                <img src="/resources/landing-pages/assets/kubernetes.png" alt="docker">
                                <p class="features-p">Orchestration using Kubernetes</p>
                            </div>
                            <div class="features2">
                                <img src="/resources/landing-pages/assets/prometheus.png" alt="prometheus">
                                <p class="features-p">Monitoring using Prometheus and Grafana</p>
                            </div>
                            <div class="features2">
                                <img src="/resources/landing-pages/assets/terraform.jpeg" alt="terraform">
                                <p class="features-p">Provisioning using Terraform</p>
                            </div>
                            <div class="features2">
                              <img src="/resources/landing-pages/assets/selenium.png" alt="selenium">
                              <p class="features-p">Selenium</p>
                            </div>
                            <div class="features2">
                              <img src="/resources/landing-pages/assets/nagios.png" alt="nagios">
                              <p class="features-p">Nagios</p>
                            </div>
                            <div class="features2">
                              <img src="/resources/landing-pages/assets/aws_ec2-min.png" alt="aws ec2 min">
                              <p class="features-p">AWS EC2 and IAM</p>
                            </div>
                        </div>
                    </div>
                 </div>
             </div>
         </div>

        <!-- Course Outline -->
        <div class="page-container lesson">
          <div class="nav course-outline-head">
            <h2 class="lg-center">Course Outline</h2>
            <button class="btn btn-primary" id="expand" >Expand All</button>
          </div>
        </div>
        <div class="content lesson">
          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >1</span> 
                  <div class='topic-content'>
                    <div>DevOps Introduction</div>
                    <div>5 Topics</div>
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
                  <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/5 Steps </span>
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Current challenges in Software Engineering processes</p>
                </div>
                <div class="lesson-item">
                  <p>Role of DevOps in Software Engineering Life-cycle</p>
                </div>
                <div class="lesson-item">
                  <p>DevOps processes overview</p>
                </div>
                <div class="lesson-item">
                  <p>Introduction to DevOps Tools</p>
                </div>
                <div class="lesson-item">
                  <p>Introduction to DevOps Delivery Pipeline</p>
                </div>
              </div>
            </div>
          </div>

          <!-- First lesson ends here -->
          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >2</span> 
                  <div class='topic-content'>
                    <div>Version Control with Git</div>
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
                  <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/4 Steps </span>
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Understanding Version Control and its role</p>
                </div>
                <div class="lesson-item">
                  <p>Understanding key concepts of Git</p>
                </div>
                <div class="lesson-item">
                  <p>Perform various Git commands such as git add, git fetch, git commit,
                    git init, git checkout, git clone, git branch, etc.</p>
                </div>
                <div class="lesson-item">
                  <p>Remotes</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Second lesson ends here -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >3</span> 
                  <div class='topic-content'>
                    <div>Continuous Integration using Jenkins</div>
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
                  <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/6 Steps </span>
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Introduction to Jenkins</p>
                </div>
                <div class="lesson-item">
                  <p>Deploying Code using Jenkins</p>
                </div>
                <div class="lesson-item">
                  <p>Jenkins Pipelines</p>
                </div>
                <div class="lesson-item">
                  <p>Master-Slave Architecture</p>
                </div>
                <div class="lesson-item">
                  <p>Authorizations</p>
                </div>
                <div class="lesson-item">
                  <p>Notifications in Jenkins</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Third lesson ends here  -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >4</span> 
                  <div class='topic-content'>
                    <div>Configuration Management Using Ansible</div>
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
                  <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/8 Steps </span>
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Introduction to Configuration Management</p>
                </div>
                <div class="lesson-item">
                  <p>Introduction to Ansible</p>
                </div>
                <div class="lesson-item">
                  <p>Ansible Setup</p>
                </div>
                <div class="lesson-item">
                  <p>Inventory, Hosts and Tasks</p>
                </div>
                <div class="lesson-item">
                  <p>Ansible Playbooks</p>
                </div>
                <div class="lesson-item">
                  <p>Packages and Services</p>
                </div>
                <div class="lesson-item">
                  <p>Ansible Roles, handlers, variables</p>
                </div>
                <div class="lesson-item">
                  <p>Troubleshooting</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Fouth lesson ends here -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >5</span> 
                  <div class='topic-content'>
                    <div>Containerization using Docker</div>
                    <div>10 Topics</div>
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
                  <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/10 Steps </span>
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Understanding Containerization</p>
                </div>
                <div class="lesson-item">
                  <p>Introduction to Docker</p>
                </div>
                <div class="lesson-item">
                  <p>Setting up Docker</p>
                </div>
                <div class="lesson-item">
                  <p>Creating Containers</p>
                </div>
                <div class="lesson-item">
                  <p>Docker Networks</p>
                </div>
                <div class="lesson-item">
                  <p>Managing Images</p>
                </div>
                <div class="lesson-item">
                  <p>Container Lifetime and Persistency</p>
                </div>
                <div class="lesson-item">
                  <p>Docker-compose</p>
                </div>
                <div class="lesson-item">
                  <p>Docker Swarm</p>
                </div>
                <div class="lesson-item">
                  <p>Container Registries with Docker</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Fifth lesson ends here -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >6</span> 
                  <div class='topic-content'>
                    <div>Orchestration using Kubernetes</div>
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
                  <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/8 Steps </span>
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Container Orchestration</p>
                </div>
                <div class="lesson-item">
                  <p>Kubernetes Architecture</p>
                </div>
                <div class="lesson-item">
                  <p>Setting up Kubernetes</p>
                </div>
                <div class="lesson-item">
                  <p>PODs, Replicasets, Deployments</p>
                </div>
                <div class="lesson-item">
                  <p>Working with YAML</p>
                </div>
                <div class="lesson-item">
                  <p>Networking in Kubernetes</p>
                </div>
                <div class="lesson-item">
                  <p>Kubernetes Services</p>
                </div>
                <div class="lesson-item">
                  <p>Microservices Architecture</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Sixth lesson ends here -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >7</span> 
                  <div class='topic-content'>
                    <div>Monitoring using Prometheus and Grafana</div>
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
                  <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/9 Steps </span>
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Understanding Monitoring</p>
                </div>
                <div class="lesson-item">
                  <p>Setting up monitoring and alerting using Prometheus</p>
                </div>
                <div class="lesson-item">
                  <p>Deploy Grafana dashboards to visualize data</p>
                </div>
                <div class="lesson-item">
                  <p>Integrate Prometheus and Grafana to monitor a full pipeline</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Seventh lesson ends here -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >8</span> 
                  <div class='topic-content'>
                    <div>Provisioning using Terraform</div>
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
                  <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/8 Steps </span>
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Understanding Provisioning</p>
                </div>
                <div class="lesson-item">
                  <p>Introduction to Terraform</p>
                </div>
                <div class="lesson-item">
                  <p>Terraform Architecture</p>
                </div>
                <div class="lesson-item">
                  <p>Deploy a Terraform Configuration File</p>
                </div>
                <div class="lesson-item">
                  <p>Use Basic Terraform Commands</p>
                </div>
                <div class="lesson-item">
                  <p>Terraform Resources</p>
                </div>
                <div class="lesson-item">
                  <p>State Commands</p>
                </div>
                <div class="lesson-item">
                  <p>Deploy a Terraform Project</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Eighth lesson ends here -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >9</span> 
                  <div class='topic-content'>
                    <div>Selenium</div>
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
                  <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/5 Steps </span>
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Learn and install Selenium</p>
                </div>
                <div class="lesson-item">
                  <p>Create Test cases in Selenium WebDriver</p>
                </div>
                <div class="lesson-item">
                  <p>Utilize X-Path and TestNG to locate elements</p>
                </div>
                <div class="lesson-item">
                  <p>Execute code on several browsers using Selenium suite of tools</p>
                </div>
                <div class="lesson-item">
                  <p>Integrate Selenium with Jenkins</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Ninth lesson ends here -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >10</span> 
                  <div class='topic-content'>
                    <div>Nagios</div>
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
                  <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/6 Steps </span>
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Understanding Network Monitoring</p>
                </div>
                <div class="lesson-item">
                  <p>Introduction to Nagios</p>
                </div>
                <div class="lesson-item">
                  <p>Setting up Nagios Server</p>
                </div>
                <div class="lesson-item">
                  <p>Connecting Remote Servers</p>
                </div>
                <div class="lesson-item">
                  <p>Plugins and Objects</p>
                </div>
                <div class="lesson-item">
                  <p>Implement and Nagios commands</p>
                </div>
              </div>
            </div>
          </div>

          <!--  Tenth lesson ends here -->

          <div class="accordion course-topic expand-all">
            <span class="lesson-num" >11</span> 
                  <div class='topic-content'>
                    <div>AWS EC2 and IAM</div>
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
                  <span class="ld-lesson-list-progress elgray right-border"> 0% Complete </span>
                  <span class="ld-lesson-list-steps elgray"> 0/10 Steps </span>
              </div>
              </div>
              <!-- List Header ends -->
              <div>
                <div class="lesson-item">
                  <p>Introduction to AWS</p>
                </div>
                <div class="lesson-item">
                  <p>Setting up your Account</p>
                </div>
                <div class="lesson-item">
                  <p>AWS Management Console</p>
                </div>
                <div class="lesson-item">
                  <p>IAM overview</p>
                </div>
                <div class="lesson-item">
                  <p>IAM Policies and ROles</p>
                </div>
                <div class="lesson-item">
                  <p>EC2 Setup</p>
                </div>
                <div class="lesson-item">
                  <p>Security Groups</p>
                </div>
                <div class="lesson-item">
                  <p>AWS CLI</p>
                </div>
                <div class="lesson-item">
                  <p>IAM Service</p>
                </div>
                <div class="lesson-item">
                  <p>Understanding Virtualization</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Eleventh lesson ends here  -->

        </div>
        
        <!-- Course outline ends here -->

        <!--Course Projects-->
      <div>
          <div class="page-container">
              <div>
                 <h2 class="sec-heading lg-center">Course Projects</h2>
              </div>
              <div class="projects-container">
                  <!--1-->
                 <div class="projects text-center">
                   <div class="project-img-container">
                     <img class="project-img" src="/resources/landing-pages/assets/aws-min.png" alt="Real Life Projects">
                   </div>
                     <h5 class="real-proj">Create an AWS Instance and write a small web-app (a web-page for example)</h5>
                     <!-- <p class="example"><strong >Example</strong></p>
                     <p>Car Price or House Price prediction given historical transaction data. You will learn how the Linear Regression algorithm learns patterns and helps predict new Car or House price based on parameters given.</p> -->
                 </div>
                 <!--2-->
                 <div class="projects text-center">
                   <div class="project-img-container">
                     <img class="project-img" src="/resources/landing-pages/assets/CI_CD_pipeline_with_Jenkins-min.png" alt="Real Life Projects">
                   </div>
                     <h5 class="real-proj">Create and run a CI/CD pipeline using Jenkins for an app</h5>
                 </div>
                 <!--3-->
                 <div class="projects text-center">
                     <img class="project-img" src="/resources/landing-pages/assets/git_version_management.png" alt="Real Life Projects">
                     <h5 class="real-proj">Set up Git version management</h5>
                 </div>
                 <!--4-->
                 <div class="projects text-center">
                     <img class="project-img" src="/resources/landing-pages/assets/ansible_config.jpg" alt="Real Life Projects">
                     <h5 class="real-proj">Set up Ansible Configuration Management</h5>
                 </div>
                 <!--5-->
                 <div class="projects text-center">
                     <img class="project-img" src="/resources/landing-pages/assets/docker_containers-min.png" alt="Real Life Projects">
                     <h5 class="real-proj">Set up using Docker Containers</h5>
                 </div>
                 <!-- 6 -->
                 <div class="projects text-center">
                    <img class="project-img" src="/resources/landing-pages/assets/kubernetes_orchestration-min.jpeg" alt="Real Life Projects">
                    <h5 class="real-proj">Set up Orchestration using Kubernetes</h5>
                 </div>
                 <!-- 7 -->
                 <div class="projects text-center">
                    <img class="project-img" src="/resources/landing-pages/assets/selenium_test.jpg" alt="Real Life Projects">
                    <h5 class="real-proj">Set up a couple of test cases using Selenium</h5>
                 </div>
                 <!-- 8 -->
                 <div class="projects text-center">
                    <img class="project-img" src="/resources/landing-pages/assets/monitoring_using_grafana-min.png" alt="Real Life Projects">
                    <h5 class="real-proj">Set up monitoring using Graphana</h5>
                 </div>

             </div>
          </div>
      </div>

        <!-- Upcoming batches -->
        <!-- <div>
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
                             <td>25<sup>th</sup> Oct</td>
                             <td>Mon-Fri (15 weekdays)</td>
                             <td>6 - 8 pm</td>
                             <td>
                                 <a class="cta" href="https://site.teksands.ai/shop/machine-learning/devops_mastery/" target="_blank">Register</a><br>
                                 <a class="cta" href="#brochure-download">Request Brochure/ Register for Demo Class</a>
                              </td>
                         </tr>
                         <tr>
                             <td style="padding: 40px;">15<sup>th</sup> Nov</td>
                             <td style="padding: 40px;">Mon-Fri (15 weekdays)</td>
                             <td style="padding: 40px;">7 - 9 pm</td>
                             <td style="padding: 40px;">
                                 <a class="cta" href="https://site.teksands.ai/shop/machine-learning/devops_mastery/" target="_blank">Register</a><br>
                                 <a class="cta" href="#brochure-download">Request Brochure/ Register for Demo Class</a>
                                 <p style="color:#dd0001;font-size: 17px;margin-bottom: 0;font-weight: bold;">Sold Out</p>
                              </td>
                         </tr>
                         <tr>
                          <td>29<sup>th</sup> Nov</td>
                          <td>Mon-Fri (15 weekdays)</td>
                          <td>7 - 9 pm</td>
                          <td>
                              <a class="cta" href="https://site.teksands.ai/shop/machine-learning/devops_mastery/" target="_blank">Register</a><br>
                              <a class="cta" href="#brochure-download">Request Brochure/ Register for Demo Class</a>
                           </td>
                      </tr>
                      <tr style="background-color: #f8f8f8;">
                          <td>13<sup>th</sup> Dec</td>
                          <td>Mon-Fri (15 weekdays)</td>
                          <td>7 - 9 pm</td>
                          <td>
                              <a class="cta" href="https://site.teksands.ai/shop/machine-learning/devops_mastery/" target="_blank">Register</a><br>
                              <a class="cta" href="#brochure-download">Request Brochure/ Register for Demo Class</a>
                           </td>
                      </tr>
                     </table> 
                 </div>
              </div>
          </div>
      </div> -->
      <div class="container" style="background: rgb(88,183,236);
          background: linear-gradient(50deg, rgba(1,27,63,1) 0%,rgba(88,183,236,1) 100%); padding-top:32px;padding-bottom:10px;" >
        <p class="course-fee" style="text-align:center;">Course Fee: INR 5750 <del class="del" style="font-size: 1.3rem;">(INR 12850)</del></p>
      </div>

        <!--FAQs-->
        <div class="bg-grey">
            <div class="page-container">
                <div>
                   <h2 class="sec-heading lg-center">FAQs</h2>
                </div>
                <div><button class="accordion">What is the Skills Demand in DevOps?</button>
                  <div class="answers">
                      <p>
                        There is a huge number of positions open at any point of time in DevOps. In mid-2021, there are 60K+ job
                        openings on DevOps open in just Naukri.com and that only a fraction of the total demand in the industry.
                        DevOps is not only for exclusive careers but also for every full-stack developers, infra and production
                        engineers as well as for architects to fully familiarise themselves.
                      </p>
                    </div>
                </div>
                <div><button class="accordion">What is the Course Duration?</button>
                  <div class="answers">
                      <p>
                        <strong>30 Hours</strong> 
                      </p>
                      <p>
                        <strong>Weekdays:</strong> Over 3 Weeks, all Weekdays (Monday to Friday), 2 hour Sessions per day.
                      </p>
                      <p>
                        <strong>Weekend Course: </strong>Over 5 Weekends, Saturdays and Sundays, 3 hour Sessions per day.(Please check your
                        specific course schedule)
                      </p>
                    </div>
                </div>
                <div><button class="accordion">What are the skills that you will be learning with our DevOps course?</button>
                  <div class="answers">
                      <p>
                        This course is specifically designed for working professionals and those who are inclined to build a career in
                        DevOps or have DevOps as part of their core job, e.g. for Full-Stack Developers.
                      </p>
                      <p>
                        There are 7 Practice Areas of DevOps:
                      </p>
                      <ul>
                        <li>Configuration Management</li>
                        <li>Continuous Integration</li>
                        <li>Automated Testing</li>
                        <li>Infrastructure as Code</li>
                        <li>Continuous Delivery</li>
                        <li>Continuous Deployment</li>
                        <li>Continuous Monitoring</li>
                      </ul>
                      <p>
                        This DevOps Course focusses on all of them and ensures that we equip our learners with the best of breed
                        technologies and tools in all these areas. You will learn Git, Jenkins, Ansible, Docker (Containerization),
                        Kubernetes and Microservices, Graphana, Terraform, Selenium for Test Automation, Nagios and AWS EC2
                        foundations.
                      </p>
                    </div>
                </div>
                <div><button class="accordion">Who will this Course be beneficial for?</button>
                    <div class="answers">
                        <p>
                          Professionals who want to build a career in DevOps, Could Engineers, Infrastructure Provisioning and
                          Maintenance, Production Engineering, Support Engineers, to become Full-Stack Developers are key
                          intended audience:
                        </p>
                        <ul>
                          <li>DevOps Career seekers</li>
                          <li>Infra Specialists/Engineers</li>
                          <li>System Administrators</li>
                          <li>Cloud Professionals</li>
                          <li>Solutions Architects</li>
                          <li>Infrastrcture Architects</li>
                          <li>Site Reliability Enginners</li>
                          <li>Technical Leads</li>
                          <li>Software Engineers (Full-Stack)</li>
                          <li>Freshers (DevOps/Infra/Full-Stack Careers)</li>
                        </ul>
                      </div>
                </div>
                <div><button class="accordion">What are the key Learning Areas in this Course?</button>
                  <div class="answers">
                      <p>You will learn these key concepts and technologies:</p>
                      <ul>
                        <li>DevOps Process Areas, Architectures and Lifecycle</li>
                        <li>Version Management using Git</li>
                        <li>CI/CD using Jenkins and Maven</li>
                        <li>Infrastructure Management using Ansible</li>
                        <li>Build and Deploy containers using Docker</li>
                        <li>Orchestrate your containerized environment and Microservices with Kubernetes</li>
                        <li>Environment Monitoring using Prometheus and Grafana</li>
                        <li>Infra Provisioning using Terraform</li>
                        <li>Introduction to Amazon Cloud</li>
                    </ul>
                  </div>
                </div>
                <div><button class="accordion">What are the pre-requisites for this DevOps Certification Course?</button>
                  <div class="answers">
                      <ul>
                        <li>Understanding and exposure to Unix/Linux/OS.</li>
                        <li>Understanding and exposure to any scripting/programming language.</li>
                      </ul>
                      <p>
                        Teksands runs free bootcamps for Python and Linux from time to time and you are welcome to join one of
                        these bootcamps to get brushed up.
                      </p>
                  </div>
                </div>
                <div><button class="accordion">What is the Teaching Approach of Teksands?</button>
                  <div class="answers">
                      <p>
                        The course is completely based on practical approaches of teaching. Learners will have intense exposure to
                        real code and data while learning the concepts on the go. We will also provide you all the codes used in
                        training and also additional problems for you to work on and practice. The Delivery method is Online, Live
                        Classes led by Professional, Industry Experienced Instructors.
                      </p>
                  </div>
                </div>
            </div>
        </div>
        <!--Topic &Instructor-->

        <!-- Certificate -->
        <!-- <div>
          <div class="page-container">
              <div class="certificate">
                 <div>
                     <h2 class="sec-heading">Certificate</h2>
                     <p>Upon successful completion of the programme, participants will be awarded a verified digital certificate by Teksands.</p>
                     <a class="cta" href="https://site.teksands.ai/shop/machine-learning/devops_mastery/">Get Certified</a>
                  </div>
                  <div>
                      <img src="/resources/landing-pages/assets/DevOps_getCertificate.jpeg" alt="certificate" width="100%">
                  </div>
              </div>
          </div>
        </div> -->

         <!--About Teksands-->
         <div class="bg-grey about">
            <div class="page-container text-center">
                <div>
                    <img src="/resources/landing-pages/images/2021/07/logo.jpg">
                    <p class="about-desc">"Teksands' mission is to have Future ready Technology workforce. We provide Online and Corporate Courses on Deep Tech including Data Science, Machine Learning, Artificial Intelligence, Python, Deep Learning, Neural Network, and much more. Teksands courses are intended to primarily help working professionals achieve career augmentation or career switch in Deep Tech areas by delivering very high quality, application driven training suited to the needs of our learners needs and goals. "Teksands High Impact Series" & "TEKS - RISE" are the flagship programs to offer short term & longer duration Career Oriented courses."</p>
                </div>
            </div>
         </div>
         </div>
         <!--Final CTA-->
         <div class="gradient-bg">
             <div class="page-container final-cta ">
                <!-- <a class="bottom-cta" href="https://site.teksands.ai/shop/machine-learning/devops_mastery/" target="_blank"><span class="align-middle">Register Now</span></a><br> -->
                <!-- <a class="bottom-cta" href="#brochure-download">Request Brochure/Register for Demo Class</a> --> 
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