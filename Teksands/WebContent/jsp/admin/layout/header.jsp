<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.dropdown-menu-custom > li > a{
	padding: 12px !important;
}
</style>

<header id="vertical" class="header header-style-1">
       <nav class="navbar navbar-default yamm">
           <div class="container-f">
               <div id="navbar">
                   <ul class="nav navbar-nav">
                      	<li class="dropdown hasmenu">
                           <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Welcome ${accountMap.name}<span class="fa fa-angle-right"></span></a>
                           <ul class="dropdown-menu dropdown-menu-custom vertical-menu">
                               <li><a href="/logout"><b>Logout</b></a></li>
                           </ul>
                       </li>
                   </ul>
               </div><!--/.nav-collapse -->
               <div class="navbar-header">
                   <div class="site-logo text-center">
                       <a href="/"><img alt="" src="/resources/images/teksands_logo.jpg" class="img-responsive navbar-brand header-logo"></a>
                   </div>
               </div>
               <div id="navbar">
                   <ul class="nav navbar-nav">
                   	<li><a href="/admin/dashboard">Dashboard</a></li>
                      	<li class="dropdown hasmenu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Contacts <span class="fa fa-angle-right"></span></a>
                            <ul class="dropdown-menu dropdown-menu-custom vertical-menu">
                               <li><a href="/admin/leads">Leads</a></li>
                        		<li><a href="/admin/contacts">Contacts</a></li>
	                        	<li><a href="/admin/contributor">Contributor</a></li>
	                        	<li><a href="/admin/trainers">Trainers</a></li>
	                        	<li><a href="/admin/careers">Careers</a></li>
	                        	<li><a href="/admin/internships">Internships</a></li>
	                        	<li><a href="/admin/ebooks">Ebooks Download</a></li>
	                        	<li><a href="/admin/it-staffing-cantacts">IT Staffing</a></li>
                            </ul>
                        </li>
                        <li class="dropdown hasmenu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Webinars <span class="fa fa-angle-right"></span></a>
                            <ul class="dropdown-menu dropdown-menu-custom vertical-menu">
                               <li><a href="/admin/webinars-post">Add New</a></li>
                               <li><a href="/admin/webinars">Webinars List</a></li>
                       		<li><a href="/admin/webinars-contacts">Webinars Contacts</a></li>
                            </ul>
                        </li>
                        <li class="dropdown hasmenu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Jobs <span class="fa fa-angle-right"></span></a>
                            <ul class="dropdown-menu dropdown-menu-custom vertical-menu">
                               <li><a href="/admin/jobs-post">Add New</a></li>
                               <li><a href="/admin/jobs">Jobs List</a></li>
                       		<li><a href="/admin/jobs-applications">Jobs Contacts</a></li>
                            </ul>
                        </li>
                        <li class="dropdown hasmenu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">EBP <span class="fa fa-angle-right"></span></a>
                            <ul class="dropdown-menu dropdown-menu-custom vertical-menu">
                               <li><a href="/admin/ebp-candidates">EBP Candidates</a></li>
                               <li><a href="/admin/mentors">EBP Mentors</a></li>
                       			<li><a href="/admin/corporate-enquiry">EBP Corporate Enquiry</a></li>
                       			<li><a href="/admin/ebp-leads">EBP Leads</a></li>
                            </ul>
                        </li>
                   </ul>
               </div><!--/.nav-collapse -->
           </div><!--/.container-fluid -->
       </nav><!-- end nav -->
    </header><!-- end header -->
</div><!-- end sidebar -->