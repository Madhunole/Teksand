<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="/resources/ebp/assets/css/style.css">


<style>
#loader {
	display:none;
}
.about-us .section-heading h2 {
    padding: 50px 50px 30px 50px;
    text-align: center;
    position: relative;
    z-index: 1;
}
.our-portfolio .section-heading h2 {
    margin-bottom: 55px;
}
.our-portfolio .item .showed-content h4{
    color: #03a4ed !important ;
    font-weight: bold;
    font-size: 15px;
	height: 35px;
}
.faq-section {
    width: 80% !important;
}
html, body {
    font-family: 'Poppins', sans-serif !important;
}
p.text-center.footer-text {
    font-size: 14px !important;
}
.faq_area .section-heading h2 {
    text-align: center;
    margin: 0px 90px 0px 90px;
    margin-bottom: 40px;
    position: relative;
    z-index: 1;
}
.panel-title {
    font-family: 'Poppins', sans-serif !important;
}
.panel-default > .panel-heading + .panel-collapse > .panel-body p {
	font-family: 'Poppins', sans-serif !important;
}
h3.mar-top {
    font-size: 18px !important;
    margin: 15px 0 0 0;
}


blockquote {
   margin: 0;
}
blockquote p {
   font-weight: bold;
   font-style: italic;
   font-size: 130%;
   margin-bottom: 1rem;
}

blockquote p,
blockquote cite {
   color: #03a4ed;
   text-align: center;
   display: block;
   font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif !important;
}

blockquote p:before {
   content: open-quote;
}

blockquote p:after {
   content: close-quote;
   margin-left: -0.2rem;
}

blockquote p:before,
blockquote p:after {
   display: inline-block;
   vertical-align: bottom;
   top: 0;
   position: relative;
   padding: 0.1rem;
}
blockquote::before {
	display: none !important;
}
.main-banner .left-content h1 {
    font-size: 32px;
    font-weight: 700;
    color: #2a2a2a;
    line-height: 55px;
}

</style>
  <div class="main-banner wow fadeIn" id="top" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="row">
            <div class="col-lg-6 align-self-center">
              <div class="left-content header-text wow fadeInLeft" data-wow-duration="1s" data-wow-delay="1s">
                <h6>Welcome to Teksands Lift-Off Program</h6>
                <h1>Hire skilled developers directly and faster from our Bootcamp program.</h1>
                <p>Our unique methods of tapping several non-traditional channels for superior candidate sourcing and conducting Bootcamp based skilling programs will give your faster sourcing of talent in trending skill areas like <a href="https://teksands.ai/courses/pgp-data-science" target="_blank"><b>Data Science</b></a>, ML Engineers, Data Engineers, Cloud/DevOps Engineers, IT Security Analysts and Full Stack Developers on React/Angular/.Net/Java.  </p>
                <p><b>Contact us to hire ready-skilled Developers from our Bootcamps</b></p>
                <form>
	                <input type="email" name="Email" id="txt_email" maxlength="100" class="txt_email" placeholder="Your Email" required>
	                <button class="main-button" onclick="contactEBP()">Enquire Now</button>
                </form>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="right-image wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.5s">
                <img src="/resources/ebp/assets/images/banner-right-image.png" alt="team meeting">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

<!--  <section class="section bgw course-section">
      <div class="container">
          <div class="row">
			  <div class="col-lg-6">
			  		<h2 class="sub_heading">The Lift-Off program is our guarantee on providing our clients with ready-skilled developers.</h2>
			  		<p>Conversion rates from interviews as high as 50-60%.</p>
			  		<p>The Lift-Off program taps several traditional and non-traditional channels for superior candidate sourcing and conducting Bootcamp based skilling programs will give your faster and guaranteed sourcing of talent in trending skill areas like Data Science, ML Engineers, Data Engineers, Cloud/DevOps Engineers, IT Security Analysts and Full Stack Developers on React/Angular/.Net/Java.</p>
			  </div>
			  <div class="col-lg-6">
					<video class="videoplayer" controls autoplay muted loop>
						<source src="https://teksands.ai/resources/landing-pages/videos/ebp-teksands.mp4" type="video/mp4" />
					</video>
			  </div>
          </div>
      </div>
  </section> -->
  
  <section class="section bgw course-section">
      <div class="container">
          <div class="row">
			  <div class="col-md-10 col-md-offset-1">
				  <video class="videoplayer" controls autoplay muted loop>
						<source src="https://teksands.ai/resources/landing-pages/videos/ebp-teksands.mp4" type="video/mp4" />
				  </video>
				</div>
          </div>
      </div>
  </section>
  
  
  <div id="about" class="about-us section bgg">
    <div class="container">
      <div class="row text-center">
        <div class="section-heading">
          <h2>Our<span> Specialities</span></h2>
        </div> 
      </div>
      <div class="row">
        <div class="col-lg-4">
          <div class="main-image">
            <img src="/resources/ebp/assets/images/about-left-image.png" alt="person graphic">
          </div>
        </div>
        <div class="col-lg-8 col-xs-12 col-md-12 align-self-center">
          <div class="services">
            <div class="row">
              <div class="col-lg-6 col-xs-6 col-md-6">
                <div class="item">
                  <div class="icon">
                    <img src="/resources/ebp/assets/images/service-icon-01.png" alt="reporting">
                  </div>
                  <div class="right-text">
                    <h4>Faster Candidate Sourcing</h4>  
                  </div>
                </div>
              </div>
              <div class="col-lg-6 col-xs-6 col-md-6">
                <div class="item">
                  <div class="icon">
                    <img src="/resources/ebp/assets/images/service-icon-02.png" alt="">
                  </div>
                  <div class="right-text">
                    <h4>Top Trending Skill Areas </h4>
                    
                  </div>
                </div>
              </div>
              <div class="col-lg-6 col-xs-6 col-md-6">
                <div class="item">
                  <div class="icon">
                    <img src="/resources/ebp/assets/images/service-icon-03.png" alt="">
                  </div>
                  <div class="right-text">
                    <h4>Custom Designed Bootcamps</h4>
                  
                  </div>
                </div>
              </div>
              <div class="col-lg-6 col-xs-6 col-md-6">
                <div class="item">
                  <div class="icon">
                    <img src="/resources/ebp/assets/images/service-icon-04.png" alt="">
                  </div>
                  <div class="right-text">
                    <h4>No Risk Hiring</h4>

                  </div>
                </div>
              </div>
              <div class="col-lg-12 col-xs-12 col-md-12">
                <div class="item">
                  <div class="icon">
                    <img src="/resources/ebp/assets/images/service-icon-04.png" alt="">
                  </div>
                  <div class="right-text">
                    <h4>Guaranteed Conversions from our Bootcamp</h4>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div id="ebp" class="ebp-table">
    <div class="container">
        <div class="row text-center">
          <div class="section-heading">
            <h2>What is the <span>Lift-off Program?</span></h2>
          </div> 
        </div>

        <div class="row">
            <div class="col-md-6 col-sm-6">
                <div class="ebpTable">
                    <div class="ebpTable-header">
                        <span class="heading">
                          For Employers
                        </span>
                    </div>
                    <div class="ebp-plans">
                        <span class="subtitle">"Teksands Lift-off" is a "Sourcing + Job-readiness Program" intended to serve Corporates with the right skilled resources in various in-demand Technology areas. We decide/design Sourcing channels and Bootcamp curriculum along with our clients specific needs and deliver skilled manpower after custom sourcing and a rigorous bootcamp phase.</span>
                    </div>
                    <div class="ebpContent">
                        <ul><br><b>If you are a Corporate looking to hire engineers immediately or <br> through a custom skill program:</b>
                            <li>Candidate Sourcing and Bootcamp based specifically on your skill requirements. We will source the candidates based on your criteria <br> and run the bootcamp designed with input and agreement with you. </li>
                            <li>Ready skilled candidates who have already undergone Bootcamp on specific skills - Cloud, DevOps, Data Science, ML, IT Security, Data Engineering, Salesforce, React/Angular <br>/Java/Python Full Stack. </li>
                            <li></li>
                        </ul>
                    </div><!-- /  CONTENT BOX-->

                    <div class="ebpTable-sign-up"><!-- BUTTON BOX-->
                        <a href="/corporate-enquiry" target="_blank" class="btn btn-block btn-primary btn-default">Get in touch with us</a>
                    </div><!-- BUTTON BOX-->
                </div>
            </div>

            

            <div class="col-md-6 col-sm-6">
                <div class="ebpTable">
                    <div class="ebpTable-header">
                        <span class="heading">
                          For Candidate
                        </span>
                    </div>
                    <div class="ebp-plans">
                        <span class="subtitle">"Teksands Lift-off" is a "Sourcing + Job-readiness Program" intended to provide you the right opportunity with our top-notch clients in various fields like Cloud, DevOps, Data Science, ML, Data Engineering, Salesforce, React, Angular, Java, Python Full Stack and more. If you are passionate about technology and are committed to make it good, reach out to us.</span>
                    </div>
                    <div class="ebpContent">
                        <ul><br><b>If you are a Candidate - get trained through us and we <br> guarantee you a Job in an high-demand skill :</b>
                            <li>Students in 4th year, fresh pass-out or working professionals looking to switch to Technology are eligible to apply through this program. </li>
                            <li>In the Bootcamp, you will go through a rigorous but fun-filled 2-3 months program under an experienced industry Mentor. </li>
                            <li>Post Bootcamp, we get you an unlimited number of Interviews with our prestigious clients. </li>
                        </ul>
                    </div><!-- /  CONTENT BOX-->

                    <div class="ebpTable-sign-up"><!-- BUTTON BOX-->
                        <a href="/ebp-candidate-application" target="_blank" class="btn btn-block btn-primary btn-default">Register with your CV now</a>
                    </div><!-- BUTTON BOX-->
                </div>
            </div>
        </div>
    </div>
</div>

<section class="section bgg" style="padding: 50px 0 50px 0;">
           <div class="container">
               <div class="row">
               		<blockquote>
					   <p>Creating Talent Opportunities in a Talent Challenged Industry</p>
					</blockquote>
              </div><!-- end content -->
          </div><!-- end col -->
</section><!-- end section -->
	
	

  <div id="box" class="our-box">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 align-self-center">
          <div class="box-section">
            Every year, an estimated 15 lac Students graduate out of Engineering colleges in India. Out of this number, only about 4% get into the IT industry with relevant jobs.
            This is an abysmally low number given that IT is the biggest employing industry for grads. At the same time, there is a massive industrial growth around the post-covid world, and a resultant hunger for more and more Technology resources.
            Companies across the world are reeling in a severe shortage of skilled technology resources and at this time the solution lies in bringing more and more graduates in the system taking the percent intake into the industry higher.  
          </div>
        </div> 
      </div>
    </div>
  </div>

  <div id="portfolio" class="our-portfolio section">
    <div class="container">
      <div class="row text-center">
        <div class="section-heading">
          <h2>Lift-off <span>Program Highlights</span></h2>
        </div> 
      </div>
      <div class="row">
        <div class="col-lg-3 col-xs-6 col-sm-6">
         
            <div class="item">
              <div class="showed-content">
                <h4>Curriculum customized for every client</h4>
                <!-- <p>Lorem ipsum dolor sit ameti ctetur aoi adipiscing eto.</p> -->
              </div>
              <!-- <div class="showed-content">
                <img src="/resources/ebp/assets/images/portfolio-image.png" alt="">
              </div> -->
            </div>
        
        </div>
        <div class="col-lg-3 col-xs-6 col-sm-6">
         
            <div class="item">
              <div class="showed-content">
                <h4>Project-based Learning</h4>
                <!-- <p>Lorem ipsum dolor sit ameti ctetur aoi adipiscing eto.</p> -->
              </div>
              <!-- <div class="showed-content">
                <img src="/resources/ebp/assets/images/portfolio-image.png" alt="">
              </div> -->
            </div>
       
        </div>
        <div class="col-lg-3 col-xs-6 col-sm-6">
         
            <div class="item">
              <div class="showed-content">
                <h4>Dedicated Mentors per Cohort</h4>
                <!-- <p>Lorem ipsum dolor sit ameti ctetur aoi adipiscing eto.</p> -->
              </div>
              <!-- <div class="showed-content">
                <img src="/resources/ebp/assets/images/portfolio-image.png" alt="">
              </div> -->
            </div>
          
        </div>
        <div class="col-lg-3 col-xs-6 col-sm-6">
        
            <div class="item">
              <div class="showed-content">
                <h4>Cohorts can start anytime</h4>
                <!-- <p>Lorem ipsum dolor sit ameti ctetur aoi adipiscing eto.</p> -->
              </div>
              <!-- <div class="showed-content">
                <img src="/resources/ebp/assets/images/portfolio-image.png" alt="">
              </div> -->
            </div>
          
        </div>
      </div>
    </div>
  </div>
  <div id="process" class="our-process section">
    <div class="container">
      <div class="row text-center">
        <div class="section-heading">
          <h2>Our<span> Process</span></h2>
        </div> 
      </div>
      <div class="row">
        <div class="col-lg-12 align-self-center">
          <div class="left-image">
            <img src="/resources/ebp/assets/images/process_1.png" alt="">
          </div>
        </div> 
      </div>
    </div>
  </div>

<section class="section faq_area bgw">
    <div class="container">
    	<div class="row text-center">
	      <div class="section-heading">
	        <h2>Frequently<span> Asked Questions</span></h2>
	      </div> 
	    </div>
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel-group first-accordion withicon" id="accordion1">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion1" href="#collapse11">Who is the Lift-off Program for?</a>
                            </h4>
                        </div>
                        <div id="collapse11" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <p>Fresh pass-outs and working professionals at various experience ranges and looking to get a better break into the IT industry. The goal of Teksands Lift-off program is to bring more and more people into the IT industry and custom develop skills in the Industry.</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion1" href="#collapse22">How does it work?</a>
                            </h4>
                        </div>
                        <div id="collapse22" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>An Lift-off program starts with a client confirming requirements. Various candidate pools are tapped. Candidates go through a selection process and provide with an offer letter with a post-bootcamp joining date, subject to successful completion of the bootcamp. Bootcamp ends with an assessment and offer is confirmed by the client for successful candidates.</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion1" href="#collapse111">What is the cost of Lift-off?</a>
                            </h4>
                        </div>
                        <div id="collapse111" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>The Lift-off program is primarily Client driven and client paid. We do not charge the candidate. However, there are other model variants available. On a case by case basis, we publish them in our requirements for a particular cohort.</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion1" href="#collapse44">What is the Bootcamp Duration?</a>
                            </h4>
                        </div>
                        <div id="collapse44" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>Depending on the client requirements, the duration may vary somewhat, but it's normally 2-3 months.</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion1" href="#collapse55">Will I learn the Technologies required during the Bootcamp?</a>
                            </h4>
                        </div>
                        <div id="collapse55" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>The Bootcamp follows the principle of application of Technology through projects. Any skills that you may not possess but is required as part of the client needs will have to be learnt by you. Mentors will help you chose the right material from the net to learn them in the easiest and fastest possible way. In some cases, we will run Pre-Bootcamp workshops for this purpose.</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion1" href="#collapse66">How will the Mentor help me?</a>
                            </h4>
                        </div>
                        <div id="collapse66" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>The Bootcamp is all about application of Technologies through project work just as you will do in real-life when you join your employer. The mentor will help you with all the guidance for you to choose the right approach and solution for that. Cohort Mentor will also help you understand various practical aspects related to project execution, such as, design principles, DevOps aspects in your project, architecture, technology selection, methodologies such as Agile, how to implement solutions into production and so on.</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion1" href="#collapse77">What is the Selection Process?</a>
                            </h4>
                        </div>
                        <div id="collapse77" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>Selection processes depend on the requirements of the client. They will have a combination of aptitude tests, communication skills, programming skills test, etc.</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion1" href="#collapse88">How is the Evaluation after Bootcamp conducted?</a>
                            </h4>
                        </div>
                        <div id="collapse88" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>Again, the Bootcamp assessment can be different from client to client. However, it will be a combination of your score on periodic tests, quality of project work (code/solution), project document quality (design, architecture), etc.</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion1" href="#collapse99">Will I get to select the Technology for my Bootcamp?</a>
                            </h4>
                        </div>
                        <div id="collapse99" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>Depending on the client requirements, the duration may vary somewhat, but it's normally 2-3 months.</p>
                            </div>
                        </div>
                    </div>
                </div>  
            </div><!-- end col -->
        </div><!-- end row -->
    </div>
</section>

<div class="row col-md-8 col-md-offset-2">
   <div class="col-md-6 col-sm-6 text-center">
       <a href="/corporate-enquiry" target="_blank" class="btn btn-primary" style="margin: 0 0 10px 0">Enquiry - For Employers</a>
   </div><!-- end col -->

              <div class="col-md-6 col-sm-6 text-center">
<a href="/ebp-candidate-application" target="_blank" class="btn btn-primary" style="margin: 0 0 10px 0">Enquiry - for Candidates</a>
              </div><!-- end col -->
</div>

<script>
function contactEBP()
{
	var email = $("#txt_email").val();
	
	if(email == ""){
    	swal("OOPS!", "Please Enter Eamil Id", "error")
   	    return false;
    }
	
	if(!isEmail(email)) {
    	swal("OOPS!", "Please Enter Valid Email", "error")
   	    return false;
    }
	
	$.ajaxSetup({async:false});
	$.post("/saveEBPMails", {email: "" + email + "",}, function(data)
	{		
		var result = $.trim(data);
  		var obj = jQuery.parseJSON(result);
   		if(obj.status_code == 200)
   		{
   			swal("Thank you!", "We have received your enquiry and will respond to you shortly", "success");
   			
   	    	$("#txt_email").val("");
   	    	
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