<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>EBP - Trail - Hire Model - Teksands</title>
    <link rel="shortcut icon" href="/resources/images/cropped-ts-favicon.png" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/landing-pages/it-staffing/css/animate.css">
    <link rel="stylesheet" type="text/css" href="/resources/landing-pages/it-staffing/css/bbpress.css">
    <link rel="stylesheet" type="text/css" href="/resources/landing-pages/it-staffing/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/resources/landing-pages/it-staffing/css/carousel.css">
    <link rel="stylesheet" type="text/css" href="/resources/landing-pages/it-staffing/css/custom.css">
    <link rel="stylesheet" type="text/css" href="/resources/landing-pages/it-staffing/css/et-line.css">
    <link rel="stylesheet" type="text/css" href="/resources/landing-pages/it-staffing/css/feedback.css">
    <link rel="stylesheet" type="text/css" href="/resources/landing-pages/it-staffing/css/sections.css">
    <link rel="stylesheet" type="text/css" href="/resources/landing-pages/it-staffing/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/js/sweetalert/sweetalert.css"/>
	<link rel="stylesheet" type="text/css" href="/resources/landing-pages/ebp/custom.css">
</head>
<body>
	<section class="service-top-menu">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 col-sm-12">
                    <div class="topmenu">
                        <span class="hidden-xs hidden-sm hidden-md hidden-lg"><i class="fa fa-lock"></i> <a href="/login">Customer Login</a></span>
                        <span class="hidden-xs"><i class="fa fa-envelope-o"></i> <a href="mailto:info@teksands.ai">info@teksands.ai</a></span> <span><i class="fa fa-phone-square"></i> +91 63 6273 2428</span> <span><a href="https://wa.me/916362732428/?text=hi" target="_blank"><i class="fa fa-whatsapp"></i></a></span>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12 text-right">
                    <div class="social-icons">
                        <ul class="list-inline">
                            <li class="facebook"><a data-toggle="tooltip" data-placement="bottom" title="" href="https://www.facebook.com/Teksands/" target="_blank" data-original-title="Facebook"><i class="fa fa-facebook"></i></a></li>
                            <li class="instagram"><a data-toggle="tooltip" data-placement="bottom" title="" href="https://www.instagram.com/teksands.ai/" target="_blank" data-original-title="Instagram"><i class="fa fa-instagram"></i></a></li>
                            <li class="twitter"><a data-toggle="tooltip" data-placement="bottom" title="" href="https://twitter.com/teksands" target="_blank" data-original-title="Twitter"><i class="fa fa-twitter"></i></a></li>
                            <li class="linkedin"><a data-toggle="tooltip" data-placement="bottom" title="" href="https://www.linkedin.com/company/teksands/" target="_blank" data-original-title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                            <li class="vimeo"><a data-toggle="tooltip" data-placement="bottom" title="" href="https://vimeo.com/user145878395" target="_blank" data-original-title="Vimeo"><i class="fa fa-vimeo"></i></a></li>
                            <li class="youtube"><a data-toggle="tooltip" data-placement="bottom" title="" href="https://www.youtube.com/channel/UCrfexSD469V7WXVAAVd3Uag/featured" target="_blank" data-original-title="Youtube"><i class="fa fa-youtube"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="logo-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-sm-12 col-lg-4 text-center">
                    <div class="site-logo">
                        <a href="/" class="logo"><img alt="teksands" src="/resources/landing-pages/it-staffing/images/teksands_logo.jpg" class="img-responsive navbar-brand header-logo" style="width: auto; height: 65px; margin: 5px 0 0 -20px;"></a>
                    </div>
                </div>
                <div class="col-lg-8 text-right hidden-xs">
                    <div class="postpager">
                        <ul class="pager row-fluid">
                            <li class="col-md-4 col-sm-4 col-xs-12">
                                <div class="post">
                                    <a href="/ebp" target="_blank">
                                        <img alt="" src="/resources/landing-pages/it-staffing/images/liftoff.png" class="img-responsive alignleft">
                                        <div class="text-left">
                                            <h4>Liftoff Bootcamp Program - Hire Skilled Developers in HTD and THD Models</h4>
                                            <small class="mt-2">Learn More</small>
                                        </div>
                                    </a>
                                </div>
                            </li>
                            <li class="col-md-4 col-sm-4 col-xs-12">
                                <div class="post">
                                    <a href="/corporate-training" target="_blank">
                                        <img alt="" src="/resources/landing-pages/it-staffing/images/propel.png" class="img-responsive alignleft">
                                        <div class="text-left">
                                            <h4>Propel - Upskill your Freshers or Cross-skill your workforce</h4> <small class="mt-2">Learn More</small>
                                        </div>
                                    </a>
                                </div>
                            </li>
                            <li class="col-md-4 col-sm-4 col-xs-12">
                                <div class="post">
                                    <a href="/accel-hire" target="_blank">
                                        <img alt="" src="/resources/landing-pages/it-staffing/images/accel.png" class="img-responsive alignleft">
                                        <div class="text-left">
                                            <h4>Accel Hire - Lateral Hiring at pace</h4> <small class="mt-2">Learn More</small>
                                        </div>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="main-header">
        <div class="container">
            <button onclick="myFunction()" class="navbar-toggle">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
         
            <ul id="myDIV" class="collaps">
                <li><a href="#">HOME</a></li>
                <li class="dropdown">
                    <button class="dropbtn">SERVICES<span class="fa fa-angle-down"></span></button>
                    <ul class="dropdown-content">
                        <li class="sub-dropdown">
                            <a href="#" class="d-flex justify-content-between">Lift Off - Source-Train-Hire<span class="fa fa-angle-right"></span></a>
                            <ul class="sub-dropdown-item">
                                <li><a href="/ebp">Lift-off Program</a></li>
								<li><a href="/ebp-candidate-application">Candidate Apply</a></li>
								<li><a href="/corporate-enquiry">Corporate Enquiry</a></li>
								<li><a href="/mentor-registration">Mentor Registration</a></li>
                            </ul>
                        </li>
                        <li><a href="/it-staffing">IT Staffing</a></li>
                        <li><a href="/corporate-training">Propel - Corporate Training</a></li>
						<li><a href="/accel-hire">Accel Hire - Lateral Services </a></li>
                        <li><a href="#">Diversity Hiring</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <button class="dropbtn">COURSES<span class="fa fa-angle-down"></span></button>
                    <ul class="dropdown-content">
                      	<li><a href="/corporate-training">Corporate Training</a></li>
						<li><a href="/upcoming-live-courses">Upcoming LiveCourses</a></li>
						<li><a href="/upcoming-live-courses">View All</a></li>
						<li><a href="/upcoming-live-courses">All Free Courses</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <button class="dropbtn">TEKSANDS UNIV<span class="fa fa-angle-down"></span></button>
                    <ul class="dropdown-content">
                       	<li><a href="/blog">Tech Articles</a></li>
						<li><a href="/shortreads">Blogs</a></li>
						<li><a href="/e-books">Download Free e-Books</a></li>
						<li><a href="/webinars">Webinars</a></li>
						<li><a href="/videos">Tech Videos</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <button class="dropbtn">CAREER<span class="fa fa-angle-down"></span></button>
                    <ul class="dropdown-content">
                        <li><a href="/work-with-us">Work with us</a></li>
						<li><a href="/internships">Internships</a></li>
						<li><a href="/become-a-trainer">Trainer/Mentor Registration</a></li>
						<li><a href="/become-a-trainer">Freelance as a Trainer</a></li>
						<li><a href="/jobs">Open Jobs</a></li>
                    </ul>
                </li>
                <li><a href="/contact-us">CONTACT US</a></
            </ul>
        </div>
    </section>
	<section class="ebp">
        <div class="engagement">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="heading">
                            <h3 class="mb-5">What is Source - <span>Trail - Hire Model</span> </h3>
                        </div>
                    </div>
                    <div class="row">
		                <div class="col-lg-5">
		                    <div class="why-tech-img">
		                        <img src="/resources/landing-pages/ebp/images/banner.png" style="width: 93%; border-radius: 12px;"/>
		                    </div>
		                </div>
		                <div class="col-lg-7 ps-4">
		                    <div class="why-tech-text">
		                        <p>If you are looking to hire IT Engineers at scale in skills such as Cloud, Data, ML/Data Science, DevOps, Cyber Security, Tech Support, Full-Stack Development - the Source Train Hire (STH) Model is the ideal solution. The STH model is a zero risk, zero commitment, outcome-based model that works best for scaled hiring. Teksands is helping a number of global IT companies scale complete teams through the STH model. </p>
		                        <p>Teksands' STH Model which we lovingly call the "Lift-Off Bootcamp Program" is a strong Framework that is Technology agnostic focussed towards Sourcing the right Candidates, providing them with the best Training and 1:1 Mentorship and a strong set of Entry, Interim and Exit gating assessments. Every cohort is specifically designed to meet the customers needs of skills and candidate readiness. At the end of each Lift-off Bootcamp, only a select set of candidates who successfully pass all the assessments are sent for Client Assessments leading to very high conversion rates.</p>
		                    </div>
		                </div>
           			 </div>
                </div>
            </div>
        </div>
    </section>
    <section class="ebp">
        <div class="stage staffing-models">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="stage-box">
                            <div class="stage-no justify-content-center">
                                <h3>Benefits of <span>Train Hire for Clients</span></h3>
                            </div>
                            <ul>
                                <li>No upfront commitment. Charges are only on Candidates successfully completing client evaluations and joining.</li>
                                <li>Strong framework leads to high conversion rates thereby reducing your hiring effort and cost drastically.</li>
                                <li>The STH Model taps alternate Candidate pools and brings down overall Resource costs.The success of this model is strong evaluations, training and mentorship from Teksands. </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="stage-box">
                            <div class="stage-no justify-content-center">
                                <h3>Benefits for <span>the Student</span></h3>
                            </div>
                            <ul>
                                <li>The Bootcamps are FREE for the Candidates.</li>
                                <li>Extensive training to build up your competency on the said skill.</li>
                                <li>Rigorous readiness framework to help consolidate your learning further.</li>
                                <li>Placement at the end of the Bootcamp.</li>
                                <li>The Bootcamp is Merit based, hence, great opportunity to do well and leverage your talent.</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="ebp">
        <div class="engagement">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="heading">
                            <h3 class="mb-5">Cause attached - <span>To STH</span> </h3>
                        </div>
                    </div>
                    <div class="row">
		                <div class="col-lg-7">
		                    <div class="why-tech-text">
		                    	<h3 class="mb-3 fw-bold">Teksands' Mission</h3>
		                        <p>Every year, only 4% Engineering passouts get absorbed into the IT industry. This is abysmally low given IT is the biggest employing industry. One of the key reasons is that graduates are not skilled enough, more so not guided enough on career opportunities and skilling needs.</p>
		                        <p>Teksands takes a pledge to tap this pool of unemployed or underemployed candidates and skill them through our FREE Bootcamp program and provide placements.</p>
		                        <p>This helps in two ways,</p>
		                        <ul>
		                        	<li class="uiul">Help the candidates get a great career in IT</li>
		                        	<li class="uiul">Create a bigger resource pool in the IT industry.</li>
		                        </ul>
		                    </div>
		                </div>
		                <div class="col-lg-5">
		                    <div class="why-tech-img">
		                        <img src="/resources/landing-pages/ebp/images/mission.png" style="border-radius: 12px;"/>
		                    </div>
		                </div>
           			 </div>
                </div>
            </div>
        </div>
    </section>
    <section class="ebp">
        <div class="stage staffing-models">
            <div class="container">
                <div class="row">
                	<div class="col-12">
                        <div class="heading">
                            <h3 class="mb-5">Our <span>Technologies</span> </h3>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="stage-box text-center">
                        	<img alt="" src="/resources/landing-pages/ebp/icons/data-science.png" style="width: 30%;">
                            <div class="stage-no justify-content-center">
                            	<p class="fw-bold mb-0">Big Data</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="stage-box text-center">
                        	<img alt="" src="/resources/landing-pages/ebp/icons/cloud.png" style="width: 30%;">
                            <div class="stage-no justify-content-center">
                            	<p class="fw-bold mb-0">Cloud</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="stage-box text-center">
                        	<img alt="" src="/resources/landing-pages/ebp/icons/Devops.png" style="width: 45%;">
                            <div class="stage-no justify-content-center">
                            	<p class="fw-bold mb-0">DevOps</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="stage-box text-center">
                        	<img alt="" src="/resources/landing-pages/ebp/icons/cloud.png" style="width: 30%;">
                            <div class="stage-no justify-content-center">
                            	<p class="fw-bold mb-0">Cloud Data Engineering</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="stage-box text-center">
                        	<img alt="" src="/resources/landing-pages/ebp/icons/deep-learning.png" style="width: 30%;">
                            <div class="stage-no justify-content-center">
                            	<p class="fw-bold mb-0">Deep Learning</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="stage-box text-center">
                        	<img alt="" src="/resources/landing-pages/ebp/icons/sales-force.png" style="width: 30%;">
                            <div class="stage-no justify-content-center">
                            	<p class="fw-bold mb-0">Salesforce</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="stage-box text-center">
                        	<img alt="" src="/resources/landing-pages/ebp/icons/cyber-security.png" style="width: 30%;">
                            <div class="stage-no justify-content-center">
                            	<p class="fw-bold mb-0">Cyber Security</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="stage-box text-center">
                        	<img alt="" src="/resources/landing-pages/ebp/icons/machine-learning.png" style="width: 30%;">
                            <div class="stage-no justify-content-center">
                            	<p class="fw-bold mb-0">Machine Learning</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4 mx-auto">
                        <div class="stage-box text-center">
                        	<img alt="" src="/resources/landing-pages/ebp/icons/full-stack.png" style="width: 30%;">
                            <div class="stage-no justify-content-center">
                            	<p class="fw-bold mb-0">Full-Stack Development</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="ebp">
        <div class="engagement" style="padding-top: 15px !important;">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="heading">
                            <h3 class="mb-5">Cause attached - <span>To STH</span> </h3>
                        </div>
                    </div>
                    <div class="row">
                    	<div class="col-lg-6">
		                    <div class="why-tech-img">
		                        <img src="/resources/landing-pages/ebp/images/man.png" style="border-radius: 12px;"/>
		                    </div>
		                </div>
		                <div class="col-lg-6">
		                    <div class="why-teksands-text ps-3">
		                    	<ul>
		                    		<li>A large US Headquartered Products & Services organization hired 30 AWS Data Engineers in the STH Model (Source-Train-Hire).</li>
		                    		<li>Delivered ~50 laterals & 50+ Bootcamp produced Azure Data Engineers for a US $25 Billion Multinational IT organization.</li>
		                    		<li>A marquee product company in the Embedded Systems space hired 20+ Machine Learning engineers through STH Model (Source-Train-Hire).</li>
		                    		<li>Delivered a batch of 20+ Hadoop Data Engineers to a IoT based products company.</li>
		                    		<li>Delivered a batch of 12 Junior Java Developers to a Logistic domain Products company.</li>
		                    		<li>Delivered a complete Tech support Team of 80+ Support Engineers for a US Multinational.</li>
		                    		<li>Delivering a 50-member Cyber-Security cohort across two multinational companies - a Global Insurance giant and a Global IT Services multinational.</li>
		                    	</ul>
		                    </div>
		                </div>
           			 </div>
                </div>
            </div>
        </div>
    </section>
    <section class="ebp">
    	<div class="container engagement" style="padding-top: 15px !important;">
    		<div class="row">
               	<div class="col-12">
					<div class="heading">
                    	<h3 class="mb-5">Our <span>Statistics</span> </h3>
                	</div>
        		</div>
        		<div class="col-lg-7 mx-auto">
        			<div style="border-radius: 20px;border: 1px solid #3ca0db;">
	        			<table class="table table-striped mb-0 bordered" style="border-radius: 20px; overflow: hidden;">
						  <thead>
						  	<tr style="background-color: #ececec;">
						      <th colspan="4" class="text-center" style="font-size: 14px;">Below are some statistics from our Bootcamp in the year of 2022</th>
						    </tr>
						    <tr style="background-color: #eaf7ff !important;font-size: 15px;">
						      <th scope="col" class="text-center">No.</th>
						      <th scope="col">Name</th>
						      <th scope="col" class="text-center">Count</th>
						    </tr>
						  </thead>
						  <tbody style="font-size: 12px;">
						    <tr>
						      <th scope="row" class="text-center">1.</th>
						      <td>Total Number of Bootcamps Conducted</td>
						      <td class="text-center">22</td>
						    </tr>
						    <tr>
						      <th scope="row" class="text-center">2.</th>
						      <td>Total Number of Clients Served</td>
						      <td class="text-center">7</td>
						    </tr>
						    <tr>
						      <th scope="row" class="text-center">3.</th>
						      <td>Total Number of Candidates Placed</td>
						      <td class="text-center">280+</td>
						    </tr>
						    <tr>
						      <th scope="row" class="text-center">4.</th>
						      <td>Median Experience Level(Years)</td>
						      <td class="text-center">1.3</td>
						    </tr>
						    <tr>
						      <th scope="row" class="text-center">5.</th>
						      <td>Median Salary(LPA)</td>
						      <td class="text-center">4.6</td>
						    </tr>
						  </tbody>
						</table>
        			</div>
        		</div>
			</div>
		</div>
    </section>
    <section class="ebp ps-3 pe-3">
    	<div class="container engagement" style="padding-top: 15px !important;">
    		<div class="row">
               	<div class="col-12">
					<div class="heading">
                    	<h3 class="mb-5">The Bootcamp <span>FrameWork</span> </h3>
                	</div>
                	<h4 class="text-center fw-bold" style="color: #7a7a7a;">BOOTCAMP FRAMEWORK: SOURCE - TRAIN - HIRE(STH) MODEL</h4>
        		</div>
        		<div class="col-lg-12 text-center mt-4">
        			<img alt="" src="/resources/landing-pages/ebp/framework.svg">
        		</div>
			</div>
		</div>
    </section>
    <section class="ebp ebp-call ps-3 pe-3" id="goToCaontactForm">
    	<div class="container engagement" style="padding-top: 15px !important;">
    		<div class="row">
               	<div class="col-12">
					<div class="heading">
                    	<h3 class="mb-5">I want to know about source - <span>Train - Hire Model</span> </h3>
                	</div>
        		</div>
        		<div class="col-lg-9 mx-auto">
        			<div class="stage staffing-models">
        				<div class="stage-box">
        					<div class="row">
        						<div class="col-lg-5">
        							<img alt="" src="/resources/landing-pages/ebp/images/form.png" style="width: 85%;">
        						</div>
        						<div class="col-lg-7">
        							<form id="reachWithUs" role="form" method="post" enctype="multipart/form-data">
        								 <div class="col-lg-12">
				                        	<div class="form-validate mb-3">
				                        		<label>Your full name</label>
				                        		<input type="text" id="client_name" name="client_name" class="form-control" placeholder="Name">
				                        	</div>
				                        	<div class="form-validate mb-3">
				                        		<label>Organisation Name</label>
				                        		<input type="text" id="client_company_name" name="client_company_name" class="form-control" placeholder="Organisation Name">
				                        	</div>
				                        	<div class="form-validate mb-3">
				                        		<label>Official Email Id</label>
				                        		<input type="text" id="client_email" name="client_email" class="form-control" placeholder="Email">
				                        	</div>
				                        	<div class="form-validate mb-3">
				                        		<label>Contact Number</label>
				                        		<input type="text" id="client_mobile" name="client_mobile" class="form-control" placeholder="Mobile">
				                        	</div>
				                        </div>
				                        <div class="col-lg-12 text-center">
				                        	<button type="submit" value="submit" id="submit" class="btn btn-primary btn-lg btn-square" style="font-size: 13px; font-weight: normal !important;"> Get In Touch With Us</button>
				                        </div>
        							</form>
        						</div>
        					</div>
        				</div>
        			</div>
        		</div>
			</div>
		</div>
    </section>
    <section class="ebp ebp-call ps-3 pe-3">
    	<div class="container engagement" style="padding-top: 15px !important;padding-bottom: 0 !important;">
    		<div class="row">
               	<div class="col-12">
					<div class="heading">
                    	<h3 class="mb-5">Our Happy <span>Customers</span> </h3>
                	</div>
        		</div>
        		<div class="col-lg-12">
        			<div class="row">
        				<div class="col-lg-3">
        					<div class="card card-body shadow mb-5 bg-body border-0 p-5" style="border-radius: 10px !important;">
        						<img alt="" src="/resources/landing-pages/ebp/clientImages/Picture1.png">
        					</div>
        				</div>
        				<div class="col-lg-3">
        					<div class="card card-body shadow mb-5 bg-body border-0 p-5" style="border-radius: 10px !important;">
        						<img alt="" src="/resources/landing-pages/ebp/clientImages/Picture2.png">
        					</div>
        				</div>
        				<div class="col-lg-3">
        					<div class="card card-body shadow mb-5 bg-body border-0 p-5" style="border-radius: 10px !important;">
        						<img alt="" src="/resources/landing-pages/ebp/clientImages/Picture3.png">
        					</div>
        				</div>
        				<div class="col-lg-3">
        					<div class="card card-body shadow mb-5 bg-body border-0 p-5" style="border-radius: 10px !important;">
        						<img alt="" src="/resources/landing-pages/ebp/clientImages/Picture4.png">
        					</div>
        				</div>
        				<div class="col-lg-3">
        					<div class="card card-body shadow mb-5 bg-body border-0 p-5" style="border-radius: 10px !important;">
        						<img alt="" src="/resources/landing-pages/ebp/clientImages/Picture5.png">
        					</div>
        				</div>
        				<div class="col-lg-3">
        					<div class="card card-body shadow mb-5 bg-body border-0 p-5" style="border-radius: 10px !important;">
        						<img alt="" src="/resources/landing-pages/ebp/clientImages/Picture6.png">
        					</div>
        				</div>
        				<div class="col-lg-3">
        					<div class="card card-body shadow mb-5 bg-body border-0 p-5" style="border-radius: 10px !important;">
        						<img alt="" src="/resources/landing-pages/ebp/clientImages/Picture7.png">
        					</div>
        				</div>
        				<div class="col-lg-3">
        					<div class="card card-body shadow mb-5 bg-body border-0 p-5" style="border-radius: 10px !important;">
        						<img alt="" src="/resources/landing-pages/ebp/clientImages/Picture8.png">
        					</div>
        				</div>
        				<div class="col-lg-3">
        					<div class="card card-body shadow mb-5 bg-body border-0 p-5" style="border-radius: 10px !important;">
        						<img alt="" src="/resources/landing-pages/ebp/clientImages/Picture9.png">
        					</div>
        				</div>
        				<div class="col-lg-3">
        					<div class="card card-body shadow mb-5 bg-body border-0 p-5" style="border-radius: 10px !important;">
        						<img alt="" src="/resources/landing-pages/ebp/clientImages/Picture10.png">
        					</div>
        				</div>
        				<div class="col-lg-3">
        					<div class="card card-body shadow mb-5 bg-body border-0 p-5" style="border-radius: 10px !important;">
        						<img alt="" src="/resources/landing-pages/ebp/clientImages/Picture11.png">
        					</div>
        				</div>
        				<div class="col-lg-3">
        					<div class="card card-body shadow mb-5 bg-body border-0 p-5" style="border-radius: 10px !important;">
        						<img alt="" src="/resources/landing-pages/ebp/clientImages/Picture12.png">
        					</div>
        				</div>
        				<div class="col-lg-3">
        					<div class="card card-body shadow mb-5 bg-body border-0 p-5" style="border-radius: 10px !important;">
        						<img alt="" src="/resources/landing-pages/ebp/clientImages/Picture13.png">
        					</div>
        				</div>
        				<div class="col-lg-3">
        					<div class="card card-body shadow mb-5 bg-body border-0 p-5" style="border-radius: 10px !important;">
        						<img alt="" src="/resources/landing-pages/ebp/clientImages/Picture14.png">
        					</div>
        				</div>
        				<div class="col-lg-3">
        					<div class="card card-body shadow mb-5 bg-body border-0 p-5" style="border-radius: 10px !important;">
        						<img alt="" src="/resources/landing-pages/ebp/clientImages/Picture15.png">
        					</div>
        				</div>
        				<div class="col-lg-3">
        					<div class="card card-body shadow mb-5 bg-body border-0 p-5" style="border-radius: 10px !important;">
        						<img alt="" src="/resources/landing-pages/ebp/clientImages/Picture16.png">
        					</div>
        				</div>
        			</div>
        		</div>
			</div>
		</div>
    </section>
    <section class="welcomebox-wrapper">
        <div class="container">
            <div class="welcomebox m900 welcomebox-p">
                <div class="row">
                    <div class="col-md-8 col-sm-8 col-xs-12">
                        <h3 class="mar-top" style="text-align: center;font-size: 18px;font-weight: bold;color: #fff;margin-top: 10px;line-height: 27px;">I want to know more about Source - Train - Hire Model:</h3>
                    </div>
                    <!-- end col -->
                    <div class="col-md-4 col-sm-4 col-xs-12 text-right">
                        <a href="#goToCaontactForm" class="btn btn-default">Get In Touch With Us</a>
                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end callout -->
        </div>
    </section>

    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-3">
                    <div class="widget">
                        <h2 class="related-title">
                            <span>About Teksands</span>
                        </h2>

                        <div class="text-widget">
                            <p style="text-align: justify;">We are Teksands, a Talent Solutions company with a whole range of services encompassing Talent Sourcing and Skilling. Our flagship Lift-off bootcamp program delivers FTE hiring for our clients in HTD and THD models. Our corporate bootcamps deliver upskilling and cross-skilling of your IT Workforce through the Propel program. Our Accel Lateral Hiring services ensure fast-paced and effective Lateral Hiring for all levels of IT workforce for your organization.</p>
                        </div>
                    </div>
                    <!-- end widget -->
                </div>
                <!-- end col -->

                <div class="col-md-6 col-lg-3">
                    <div class="widget">
                        <h2 class="related-title">
                            <span>ASSOCIATE WITH US</span>
                        </h2>
                        <ul class="contact-details">
                            <li><a href="/work-with-us">Work With Us</a></li>
                            <li><a href="/internships">Internship</a></li>
                            <li><a href="/become-a-trainer">Become A Trainer</a></li>
                            <li><a href="/contributor">Contributor</a></li>
                        </ul>
                    </div>
                    <!-- end widget -->
                </div>
                <!-- end col -->

                <div class="col-md-6 col-lg-3">
                    <div class="widget">
                        <h2 class="related-title">
                            <span>Services</span>
                        </h2>
                        <ul class="contact-details">
                            <li><a href="/ebp">Lift Off - Source-Train-Hire</a></li>
                            <li><a href="/corporate-training">Propel - Corporate Training</a></li>
                            <li><a href="/accel-hire">Accel Hire - Lateral Services </a></li>
                            <li><a href="#">Diversity Hiring</a></li>
                        </ul>
                    </div>
                    <!-- end widget -->
                </div>
                <!-- end col -->

                <div class="col-md-6 col-lg-3">
                    <div class="widget">
                        <h2 class="related-title">
                            <span>Contact Details</span>
                        </h2>

                        <ul class="contact-details hidden-xs">
                            <li><i class="fa fa-link"></i> <a href="/">www.teksands.ai</a></li>
                            <li><i class="fa fa-envelope-o"></i> <a href="mailto:info@teksands.ai">info@teksands.ai</a></li>
                            <li><i class="fa fa-phone"></i> +91 63 6273 2428</li>
                            <li><i class="fa fa-home"></i> Bangalore</li>
                        </ul>

                        <div class="col-xs-12 hidden-sm hidden-md hidden-lg">
                            <div class="col-xs-6" style="padding: 0 0 0 0">
                                <ul class="contact-details">
                                    <li><i class="fa fa-link"></i> <a href="/">www.teksands.ai</a></li>
                                    <li><i class="fa fa-envelope-o"></i> <a href="mailto:info@teksands.ai">info@teksands.ai</a></li>
                                </ul>
                            </div>
                            <div class="col-xs-6" style="padding: 0 0 0 0">
                                <ul class="contact-details">
                                    <li><i class="fa fa-phone"></i> +91 63 6273 2428</li>
                                    <li><i class="fa fa-home"></i> Bangalore</li>
                                </ul>
                            </div>
                        </div>

                    </div>
                    <!-- end widget -->
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </footer>
    <section class="logo-section dark-logo">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-4 col-sm-12 text-center">
                    <div class="site-logo">
                        <a href="/"><img alt="teksands" src="/resources/landing-pages/it-staffing/images/teksands_logo.jpg" class="img-responsive navbar-brand header-logo" style="width: auto; height: 65px; margin: 5px 0 0 -20px;"></a>
                    </div>
                </div>
                <div class="col-md-8 text-right hidden-xs">
                    <div class="postpager">
                        <ul class="pager row-fluid">
                            <li class="col-md-4 col-sm-4 col-xs-12">
                                <div class="post">
                                    <a href="/ebp" target="_blank">
                                        <img alt="" src="/resources/landing-pages/it-staffing/images/liftoff.png" class="img-responsive alignleft">
                                        <div class="text-left">
                                            <h4>Liftoff Bootcamp Program - Hire Skilled Developers in HTD and THD Models</h4>
                                            <small class="mt-2">Learn More</small>
                                        </div>
                                    </a>
                                </div>
                            </li>
                            <li class="col-md-4 col-sm-4 col-xs-12">
                                <div class="post">
                                    <a href="/corporate-training" target="_blank">
                                        <img alt="" src="/resources/landing-pages/it-staffing/images/propel.png" class="img-responsive alignleft">
                                        <div class="text-left">
                                            <h4>Propel - Upskill your Freshers or Cross-skill your workforce</h4> <small class="mt-2">Learn More</small>
                                        </div>
                                    </a>
                                </div>
                            </li>
                            <li class="col-md-4 col-sm-4 col-xs-12">
                                <div class="post">
                                    <a href="/accel-hire" target="_blank">
                                        <img alt="" src="/resources/landing-pages/it-staffing/images/accel.png" class="img-responsive alignleft">
                                        <div class="text-left">
                                            <h4>Accel Hire - Lateral Hiring at pace</h4> <small class="mt-2">Learn More</small>
                                        </div>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="service-top-menu">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-4 col-sm-12">
                    <div class="topmenu">
                        <span><a href="/contact-us">Contact</a></span>
                        <span><a href="/terms-of-use">Terms of Use</a></span>
                        <span><a href="/privacy-policy">Privacy &amp; Cookie Policy</a></span>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 text-left hidden-xs">
                    <div class="topmenu">
                        <p class="text-center footer-text">
                            © 2022 Teksands - Wrtr Ink
                            LLP - All Rights Reserved
                        </p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 text-right">
                    <div class="social-icons">
                        <ul class="list-inline">
                            <li class="facebook"><a data-toggle="tooltip" data-placement="bottom" title="" href="https://www.facebook.com/Teksands/" target="_blank" data-original-title="Facebook"><i class="fa fa-facebook"></i></a></li>
                            <li class="instagram"><a data-toggle="tooltip" data-placement="bottom" title="" href="https://www.instagram.com/teksands.ai/" target="_blank" data-original-title="Instagram"><i class="fa fa-instagram"></i></a></li>
                            <li class="twitter"><a data-toggle="tooltip" data-placement="bottom" title="" href="https://twitter.com/teksands" target="_blank" data-original-title="Twitter"><i class="fa fa-twitter"></i></a></li>
                            <li class="linkedin"><a data-toggle="tooltip" data-placement="bottom" title="" href="https://www.linkedin.com/company/teksands/" target="_blank" data-original-title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                            <li class="vimeo"><a data-toggle="tooltip" data-placement="bottom" title="" href="https://vimeo.com/user145878395" target="_blank" data-original-title="Vimeo"><i class="fa fa-vimeo"></i></a></li>
                            <li class="youtube"><a data-toggle="tooltip" data-placement="bottom" title="" href="https://www.youtube.com/channel/UCrfexSD469V7WXVAAVd3Uag/featured" target="_blank" data-original-title="Youtube"><i class="fa fa-youtube"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script type="text/javascript" src="/resources/landing-pages/it-staffing/js/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/landing-pages/it-staffing/js/bootstrap.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script type="text/javascript" src="/resources/landing-pages/it-staffing/js/imagesloaded.pkgd.js"></script>
    <script type="text/javascript" src="/resources/landing-pages/it-staffing/js/isotope.js"></script>
    <script type="text/javascript" src="/resources/landing-pages/it-staffing/js/masonry-home-01.js"></script>
    <script type="text/javascript" src="/resources/landing-pages/it-staffing/js/plugins.js"></script>
    <script src="/resources/js/sweetalert/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.js"></script>
    <script>
    $( document ).ready(function()
	{
    	$('#reachWithUs').validate({
    		rules: {
    			client_name: {
    				required: true,
    			},
    			client_company_name: {
    				required: true,
    			},
    			client_email: {
    				required: true,
    			},
    			client_mobile: {
    				required: true,
    			},
    	    },
    	    messages: {
    	    	client_name: "Please Enter Your Name",
    	    	client_company_name: "Please Enter Your Organisation Name",
    	    	client_email: "Please Enter Your Email",
    	    	client_mobile: "Please Enter Your Mobile",
    		},
    		
    		errorElement: "div",
    		
    		errorPlacement: function ( error, element ) {
    			
    			error.addClass( "help-block" );
    			
    			element.parents( ".form-validate" ).addClass( "has-feedback" );
    			
    			if(element.prop( "type" ) === "checkbox"){
    				var ele = element.parent("div");
    				error.insertAfter( ele.parent("div") );
    			}else if(element.prop( "type" ) === "radio"){
    				error.insertAfter( element.parent( ".form-radio" ) );
    			}else{
    				error.insertAfter( element );
    			}
    			
    		},
    		
    		success: function ( label, element ) {
    			if ( !$( element ).next( "span" )[ 0 ] ) {
    				
    			}
    		},
    		
    		highlight: function ( element, errorClass, validClass ) {
    			$( element ).parents( ".form-validate" ).addClass( "has-error" ).removeClass( "has-success" );
    			
    		},
    		
    		unhighlight: function ( element, errorClass, validClass ) {
    			$( element ).parents( ".form-validate" ).addClass( "has-success" ).removeClass( "has-error" );
    			$( element ).next( "span" ).addClass( "glyphicon-ok" ).removeClass( "glyphicon-remove" );
    		},		
    	    
    		submitHandler: function () {
    			saveEbpContactUs();
    	    }
    	});
    });
    
    function saveEbpContactUs()
    {
    	var name = $("#client_name").val();
    	var email = $("#client_email").val();
    	var mobile = $("#client_mobile").val();
    	var company = $("#client_company_name").val();
    	
    	$.ajaxSetup({async:false});
    	$.post("/saveEBPContact", 
		{
    		name: "" + name + "",
    		email: "" + email + "",
    		mobile: "" + mobile + "",
    		company: "" + company + "",
    	}, function(data)
    	{		
    		var result = $.trim(data);
      		var obj = jQuery.parseJSON(result);
       		if(obj.status_code == 200)
       		{
       			swal("Thank you!", "We have received your enquiry and will respond to you shortly", "success");
       			$("#client_name").val("");
       			$("#client_email").val("");
       			$("#client_mobile").val("");
       			$("#client_company_name").val("");
       	    	return false;
       		} else {
       			swal("OOPS!", "Please Enter Correct Details", "error");
       		 	return false;
       		}
    		
    	},'text');
    	
    }
    </script>
</body>
</html>
