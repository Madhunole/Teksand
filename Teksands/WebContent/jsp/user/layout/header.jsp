<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
@media (max-width: 768px){
	.logo-wrapper {
	    padding: 0 !important;
	}
	.navbar-brand {
	    width: 85% !important;
		padding: 10px 0 0 0;
	}
}
@media (max-width: 992px) {
	.logo-wrapper {
	    padding: 0 !important;
	}
	.navbar-brand {
	    width: 85% !important;
		padding: 10px 0 0 0;
	}
}

.logo-wrapper .pager h4 {
    font-size: 12px !important;
}
</style>

<div class="topbar hidden-xs">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-12 text-left">
				<div class="topmenu">
					<c:choose>
						<c:when test="${empty accountMap}">
							<span class="hidden-xs hidden-sm hidden-md hidden-lg"><i class="fa fa-lock"></i> <a
								href="/login">Customer Login</a></span>
						</c:when>
						<c:otherwise>
							<span class="dropdown hasmenu">Welcome ${accountMap.name}<i
								class="fa fa-angle-down" aria-hidden="true"
								style="font-size: 15px; margin-left: 5px;"></i>
								<ul class="dropdown-menu" style="margin: 0 0 0 -3px;min-width: 125px;">
									<li><a href="/admin/dashboard">Dashboard</a></li>
									<li><a href="/logout">Logout</a></li>
								</ul>
							</span>
						</c:otherwise>
					</c:choose>
					<span class="hidden-xs"><i class="fa fa-envelope-o"></i> <a
						href="mailto:info@teksands.ai">info@teksands.ai</a></span> <span><i
						class="fa fa-phone-square"></i> +91 63 6273 2428</span> <span><a
						href="https://wa.me/916362732428/?text=hi" target=_blank><i
							class="fa fa-whatsapp"></i></a></span>
				</div>
				<!-- end callus -->
			</div>

			<div class="col-md-6 col-sm-12 text-right">
				<div class="social-icons">
					<ul class="list-inline">
						<li class="facebook"><a data-toggle="tooltip"
							data-placement="bottom" title="Facebook"
							href="https://www.facebook.com/Teksands/" target="_blank"><i
								class="fa fa-facebook"></i></a></li>
						<li class="instagram"><a data-toggle="tooltip"
							data-placement="bottom" title="Instagram"
							href="https://www.instagram.com/teksands.ai/" target="_blank"><i
								class="fa fa-instagram"></i></a></li>
						<li class="twitter"><a data-toggle="tooltip"
							data-placement="bottom" title="Twitter"
							href="https://twitter.com/teksands" target="_blank"><i
								class="fa fa-twitter"></i></a></li>
						<li class="linkedin"><a data-toggle="tooltip"
							data-placement="bottom" title="Linkedin"
							href="https://www.linkedin.com/company/teksands/" target="_blank"><i
								class="fa fa-linkedin"></i></a></li>
						<li class="vimeo"><a data-toggle="tooltip"
							data-placement="bottom" title="Vimeo"
							href="https://vimeo.com/user145878395" target="_blank"><i
								class="fa fa-vimeo"></i></a></li>
						<li class="youtube"><a data-toggle="tooltip"
							data-placement="bottom" title="Youtube"
							href="https://www.youtube.com/channel/UCrfexSD469V7WXVAAVd3Uag/featured"
							target="_blank"><i class="fa fa-youtube"></i></a></li>
					</ul>
				</div>
				<!-- end social icons -->
			</div>
			<!-- end col -->
		</div>
		<!-- end row -->
	</div>
	<!-- end topbar -->
</div>
<!-- end topbar -->

<div class="logo-wrapper">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-12 text-center">
				<div class="site-logo">
					<a href="/"><img alt="teksands" src="/resources/images/teksands_logo.jpg" class="img-responsive navbar-brand header-logo" style="width: auto; height: 65px; margin: 5px 0 0 -20px;"></a>
				</div>
			</div>
			<!-- end col -->

			<div class="col-md-8 text-right hidden-xs">
				<div class="postpager">
					<ul class="pager row-fluid">
						<li class="col-md-4 col-sm-4 col-xs-12">
							<div class="post">
								<a
									href="/ebp"
									target="_blank"> <img alt=""
									src="/resources/images/header/liftoff.png"
									class="img-responsive alignleft" alt="Deep Learning">
									<h4>Liftoff Bootcamp Program - Hire Skilled Developers in HTD and THD Models</h4> <small>Learn More</small>
								</a>
							</div>
						</li>
						<li class="col-md-4 col-sm-4 col-xs-12">
							<div class="post">
								<a
									href="/corporate-training"
									target="_blank"> <img alt=""
									src="/resources/images/header/propel.png"
									class="img-responsive alignleft" alt="Post Graduate Program">
									<h4>Propel - Upskill your Freshers or Cross-skill your workforce</h4> <small>Learn More</small>
								</a>
							</div>
						</li>
						<li class="col-md-4 col-sm-4 col-xs-12">
							<div class="post">
								<a href="/accel-hire" target="_blank"> <img
									alt="" src="/resources/images/header/accel.png"
									class="img-responsive alignleft" alt="DevOps Mastery Program">
									<h4>Accel Hire - Lateral Hiring at pace</h4> <small>Learn More</small>
								</a>
							</div>
						</li>
					</ul>
				</div>
				<!-- end postpager -->
			</div>
			<!-- end col -->
		</div>
		<!-- end row -->
	</div>
	<!-- end container -->
</div>
<!-- end logo-wrapper -->

<header class="header">
	<div class="container">
		<nav class="navbar navbar-default yamm">
			<div class="container-f">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>

				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="/">Home</a></li>
						<li class="dropdown has-submenu">
                           <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Services <span class="fa fa-angle-down"></span></a>
                           <ul class="dropdown-menu">
                               <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Lift Off - Source-Train-Hire <span class="fa fa-angle-right"></span></a>
                                   <ul class="dropdown-menu show-left" role="menu">
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
                       	<li><a href="/upcoming-live-courses">Courses</a></li>
						<!-- <li class="dropdown hasmenu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"><a href="/corporate-training">Corporate Training</a>Courses <span
								class="fa fa-angle-down"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/corporate-training">Corporate Training</a></li>
								<li><a href="/upcoming-live-courses">Upcoming Live
										Courses</a></li>
								<li><a href="/upcoming-live-courses">View All</a></li>
								<li><a href="/upcoming-live-courses">All Free Courses</a></li>
							</ul></li> -->
						<li class="dropdown hasmenu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">Teksands Univ <span
								class="fa fa-angle-down"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/blog">Tech Articles</a></li>
								<li><a href="/shortreads">Blogs</a></li>
								<li><a href="/e-books">Download Free e-Books</a></li>
								<!-- <li><a href="/webinars">Webinars</a></li> -->
								<li><a href="/videos">Tech Videos</a></li>
							</ul></li>
						<!-- <li><a href="/corporate-training">Corporate Training</a></li>
						<li class="dropdown hasmenu"><a href="/ebp"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">Lift-off Program <span
								class="fa fa-angle-down"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/ebp">Lift-off Program</a></li>
								<li><a href="/ebp-candidate-application">Candidate Apply</a></li>
								<li><a href="/corporate-enquiry">Corporate Enquiry</a></li>
								<li><a href="/mentor-registration">Mentor Registration</a></li>
							</ul>
						</li> -->
						<li class="dropdown hasmenu"><a href="/contributor"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">Career <span
								class="fa fa-angle-down"></span></a>
							<ul class="dropdown-menu">
								<li><a href="/work-with-us">Work with us</a></li>
								<li><a href="/internships">Internships</a></li>
								<li><a href="/become-a-trainer">Trainer/Mentor Registration</a></li>								
								<li><a href="/jobs">Open Jobs</a></li>
							</ul>
						</li>
						<li><a href="/contact-us">Contact Us</a></li>
						<!-- <li><a href="https://site.teksands.ai" target="_blank">Student Login</a></li> -->
					</ul>

					<!-- <ul class="nav navbar-nav navbar-right">
						<li class="cartmenu"><a href="#"><i
								class="fa fa-shopping-bag"></i></a></li>
						<li class="dropdown cartmenu searchmenu hasmenu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"><i
								class="fa fa-search"></i></a>
							<ul class="dropdown-menu show-right">
								<li>
									<div id="custom-search-input">
										<div class="input-group col-md-12">
											<input type="text" class="form-control input-lg"
												placeholder="Search here..." /> <span
												class="input-group-btn">
												<button class="btn btn-primary btn-lg" type="button">
													<i class="fa fa-search"></i>
												</button>
											</span>
										</div>
									</div>
								</li>
							</ul></li>
					</ul> -->
				</div>
				<!--/.nav-collapse -->
			</div>
			<!--/.container-fluid -->
		</nav>
		<!-- end nav -->
	</div>
	<!-- end container -->
</header>
<!-- end header -->