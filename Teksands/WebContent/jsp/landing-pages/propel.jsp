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
.our-portfolio .item .showed-content h3{
    color: #03a4ed !important ;
    font-weight: bold;
    font-size: 18px;
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
.our-portfolio {
    padding-top: 15px !important;
}
.mt-4 {
    margin-top: 2rem;
}
.our-portfolio .showed-content {
    padding: 25px;
}

</style>
<div class="main-banner wow fadeIn" id="top" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="row">
            <div class="col-lg-6 align-self-center">
              <div class="left-content header-text">
                <h2>AN UNIQUE MENTORSHIP BASED SKILLING FRAMEWORK</h2>
                <p>Are you wondering how to upskill your new IT workforce or early talent / freshers for faster and more efficient deployment in projects?</p>
                <p>Is cross-skilling your existing IT workforce a challenge? Existing skilling programs are not delivering well to equip them faster and effectively?</p>
              </div>
            </div>
            <div class="col-lg-6 align-self-center text-center">
              	<img src="/resources/images/propel/propel.png" style="width: 65%;" title="" alt="">
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
            <h2>Our unique Propel <span>Program helping Technology organizations with</span></h2>
          </div> 
        </div>
        <div class="row">
            <div class="col-md-6 col-sm-6">
                <div class="ebpTable">
                    <div class="ebp-plans">
                        <span class="subtitle">Technology Induction for Campus Hires and other Early Talent making them project ready in 4-6 weeks-time through an intensive curriculum and individualized mentoring</span>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-sm-6">
                <div class="ebpTable">
                    <div class="ebp-plans">
                        <span class="subtitle">Cross Skilling of experienced Engineers for your next projects through co-developed curriculum and </br>individualized mentoring.</span>
                    </div>
				</div>
            </div>
        </div>
    </div>
</div>

<section class="section bgg" style="padding: 50px 0 50px 0;">
          <div class="container">
              <div class="row">
              		<blockquote>
				   <p>Through the Propel program, we help our clients onboard early talent and experienced engineers efficiently into their projects through custom Technical Induction and Cross Skilling programs</p>
				</blockquote>
             </div><!-- end content -->
         </div><!-- end col -->
</section><!-- end section -->                                                                                                                                                                                                                              

<section class="section tek_section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-8 col-xl-7 my-3">
                <div>
                    <h2 class="h1 mb-4">Salient Features of the Propel Program:</h2>
                </div>
                <div class="row pt-3">
                    <div class="col-md-12 my-3">
                        <div class="media  wow fadeInUp" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInUp;">
                            <div class="icon-lg border border-primary rounded bg-gray-100 dots-icon">
                                <i class="bi-laptop"></i>
                                <i class="fa fa-university fa-3x mobile-icon" style="font-size: 12px;color: #3ca1db;"></i>
                            </div>
                            <div class="media-body ps-3">
                                <p class="m-0">Program Curriculum co-developed by Teksands with inputs from Client's business stakeholders.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 my-3">
                        <div class="media  wow fadeInUp" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInUp;">
                            <div class="icon-lg border border-primary rounded bg-gray-100 dots-icon">
                                <i class="bi-command"></i>
                                <i class="fa fa-university fa-3x mobile-icon" style="font-size: 12px;color: #3ca1db;"></i>
                            </div>
                            <div class="media-body ps-3">
                                <p class="m-0">Healthy balance of Conceptual aspects and Project-based learning infused in curriculume.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 my-3">
                        <div class="media  wow fadeInUp" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInUp;">
                            <div class="icon-lg border border-primary rounded bg-gray-100 dots-icon">
                                <i class="bi-tools"></i>
                                <i class="fa fa-university fa-3x mobile-icon" style="font-size: 12px;color: #3ca1db;"></i>
                            </div>
                            <div class="media-body ps-3">
                                <p class="m-0">Extensive Projects, Assignments and Tests embedded within the program to maximize learning.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 my-3">
                        <div class="media  wow fadeInUp" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInUp;">
                            <div class="icon-lg border border-primary rounded bg-gray-100 dots-icon">
                                <i class="bi-tools"></i>
                                <i class="fa fa-university fa-3x mobile-icon" style="font-size: 12px;color: #3ca1db;"></i>
                            </div>
                            <div class="media-body ps-3">
                                <p class="m-0">Our extensive network of Practicing Professionals from India and abroad delivers the courses.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 my-3">
                        <div class="media  wow fadeInUp" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInUp;">
                            <div class="icon-lg border border-primary rounded bg-gray-100 dots-icon">
                                <i class="bi-tools"></i>
                                <i class="fa fa-university fa-3x mobile-icon" style="font-size: 12px;color: #3ca1db;"></i>
                            </div>
                            <div class="media-body ps-3">
                                <p class="m-0">Key feature of our programs: Extensive 1:1 or individualized Mentoring by Senior Mentors from Industry to help students achieve individual learning goals. These also act as checkpoints and candidate evaluation and provide effective feedback to the client organization. </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 my-3">
                        <div class="media  wow fadeInUp" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInUp;">
                            <div class="icon-lg border border-primary rounded bg-gray-100 dots-icon">
                                <i class="bi-tools"></i>
                                <i class="fa fa-university fa-3x mobile-icon" style="font-size: 12px;color: #3ca1db;"></i>
                            </div>
                            <div class="media-body ps-3">
                                <p class="m-0">For Early Talent, we also have the option of including the following.</p>
                                <ul>
                                	<li>Soft Skills modules, such as professional etiquettes, business communication, presentation skills, working in teams, increasing your productivity, etc. </li>
                                	<li>Software Engineering modules, such as Agile, DevOps, Software Testing, Software Estimation, Application Design and Architecture, Data Modelling, Algorithm Development, etc.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 my-3">
                        <div class="media  wow fadeInUp" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInUp;">
                            <div class="icon-lg border border-primary rounded bg-gray-100 dots-icon">
                                <i class="bi-tools"></i>
                                <i class="fa fa-university fa-3x mobile-icon" style="font-size: 12px;color: #3ca1db;"></i>
                            </div>
                            <div class="media-body ps-3">
                                <p class="m-0">Certification Support - we also provide certification preparation support to our client engineers</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 my-3">
                        <div class="media  wow fadeInUp" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInUp;">
                            <div class="icon-lg border border-primary rounded bg-gray-100 dots-icon">
                                <i class="bi-tools"></i>
                                <i class="fa fa-university fa-3x mobile-icon" style="font-size: 12px;color: #3ca1db;"></i>
                            </div>
                            <div class="media-body ps-3">
                                <p class="m-0">Extensive Projects, Assignments and Tests embedded within the program to maximize learning.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 my-3">
                <div class="custom-form">
                    <div class="big-title">
                        <h2 class="related-title">
                            <span>Submit Equiry</span>
                        </h2>
                    </div><!-- end big-title -->
                    <div class="loginform">
                        <div class="row">
                            <div class="col-md-12">
	                            <input type="text" name="name" class="form-control" placeholder="Your name"> 
	                            <input type="text" name="name" class="form-control" placeholder="Organization"> 
	                            <input type="email" name="email" class="form-control" placeholder="Email"> 
	                            <input type="number" name="name" class="form-control" placeholder="Mobile"> 
	                            <button type="submit" class="button button--wayra btn-block btn-square btn-lg"> Submit</button>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="tek_section">
    <div class="container">
        <div class="row align-items-center">
        	<div class="col-lg-4 my-3 ms-auto wow fadeInRight" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInRight;">
                <img src="/resources/images/propel/talent.png" title="" alt="">
            </div>
            <div class="col-lg-8 col-xl-7 my-3">
                <div class="wow fadeInUp" data-wow-duration="0.3s" style="visibility: visible; animation-duration: 0.3s; animation-name: fadeInUp;">
                    <h2 class="h1 mb-4">Propel Outcomes</h2>
                </div>
                <div class="row pt-3">
                    <div class="col-md-6 my-3">
                        <div class="media  wow fadeInUp" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInUp;">
                            <div class="icon-lg border border-primary rounded bg-gray-100 dots-icon" style=" margin: 8px 0 0 0; ">
                                <i class="bi-laptop"></i>
                                <i class="fa fa-university fa-3x mobile-icon" style="font-size: 12px;color: #3ca1db;"></i>
                            </div>
                            <div class="media-body ps-3">
                                <p class="m-0">Fully skilled employee on target technology areas.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 my-3">
                        <div class="media  wow fadeInUp" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInUp;">
                            <div class="icon-lg border border-primary rounded bg-gray-100 dots-icon" style=" margin: 8px 0 0 0; ">
                                <i class="bi-command"></i>
                                <i class="fa fa-university fa-3x mobile-icon" style="font-size: 12px;color: #3ca1db;"></i>
                            </div>
                            <div class="media-body ps-3">
                                <p class="m-0">Gained knowledge on practical industry practices.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 my-3">
                        <div class="media  wow fadeInUp" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInUp;">
                            <div class="icon-lg border border-primary rounded bg-gray-100 dots-icon" style=" margin: 8px 0 0 0; ">
                                <i class="bi-command"></i>
                                <i class="fa fa-university fa-3x mobile-icon" style="font-size: 12px;color: #3ca1db;"></i>
                            </div>
                            <div class="media-body ps-3">
                                <p class="m-0">Confident Resource deployed into your Projects within a span of 4-6 weeks.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 my-3">
                        <div class="media  wow fadeInUp" data-wow-duration="0.3s" data-wow-delay="0.1s" style="visibility: visible; animation-duration: 0.3s; animation-delay: 0.1s; animation-name: fadeInUp;">
                            <div class="icon-lg border border-primary rounded bg-gray-100 dots-icon" style=" margin: 8px 0 0 0; ">
                                <i class="bi-command"></i>
                                <i class="fa fa-university fa-3x mobile-icon" style="font-size: 12px;color: #3ca1db;"></i>
                            </div>
                            <div class="media-body ps-3">
                                <p class="m-0">Comprehensive Performance Reporting on individual learners to client.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
	
  <div id="portfolio" class="our-portfolio">
    <div class="container">
      <div class="row text-center">
        <div class="section-heading">
          <h2>Some of our key <span>Expertise Areas (not limited to):</span></h2>
        </div> 
      </div>
      <div class="row">
        <div class="col-lg-6 col-xs-6 col-sm-6">
            <div class="item">
              <div class="showed-content">
                <h3>Big Data Engineering</h3>
                <p style="font-size: 13px;">(Hadoop, HIVE, Spark, Yarn and associated stack)</p>
              </div>
            </div>
        </div>
        <div class="col-lg-6 col-xs-6 col-sm-6">
            <div class="item">
              <div class="showed-content">
                <h3>Cloud</h3>
                <p style="font-size: 13px;">(AWS, AZURE, GCP)</p>
              </div>
            </div>
        </div>
        <div class="col-lg-6 col-xs-6 col-sm-6 mt-4">
            <div class="item">
              <div class="showed-content">
                <h3>DevOps</h3>
                <p style="font-size: 13px;">(Jenkins, Docker, Ansible, Kubernetes, Chef, Puppet, Grafana, Prometheus, Splunk)</p>
              </div>
            </div>
        </div>
        <div class="col-lg-6 col-xs-6 col-sm-6 mt-4">
            <div class="item">
              <div class="showed-content">
                <h3>Integration Technologies</h3>
                <p style="font-size: 13px;">(Mulesoft, Dell Boomi)</p>
              </div>
            </div>
        </div>
        <div class="col-lg-6 col-xs-6 col-sm-6 mt-4">
            <div class="item">
              <div class="showed-content">
                <h3>Full Stack Engineering</h3>
                <p style="font-size: 13px;">(MEAN, MERN, Java)</p>
              </div>
            </div>
        </div>
        <div class="col-lg-6 col-xs-6 col-sm-6 mt-4">
            <div class="item">
              <div class="showed-content">
                <h3 style="height: 64px;">Machine Learning and Deep Learning</h3>
              </div>
            </div>
        </div>
        <div class="col-lg-12 col-xs-6 col-sm-6 mt-4">
            <div class="item">
              <div class="showed-content">
                <h3>Python/Java/Spring/Hibernate/PhP-MySQL/Magento/Spark/Scala/Kafka/Salesforce/PowerBI/Cloud-DevOps</h3>
                <p></p>
              </div>
            </div>
        </div>
      </div>
    </div>
  </div>
  
<section class="section">
    <div class="container">
    <div class="section-title-2 text-center course-title">
        <h2>Our Clients</h2>
        <hr>
    </div>
        <div id="owl-client" class="clients">
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
        </div>
    </div>
</section>


