<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.section-title-2 {
	padding: 0 0 60px !important;
}
.admin-section {
    padding-top: 35px;
}
.admin-section-bottom {
	padding: 50px 0 50px 0;
}
h3.widget-title {
    font-size: 20px !important;
    margin: -15px 0 0 0 !important;
}
.stat-module i {
    margin-top: 8px !important;
}
.stat-module i {
    font-size: 30px !important;
}
.stat-count {
    display: block;
    font-weight: 700;
    font-family: 'Open Sans' !important;
    padding: 0;
    color: #222;
    font-size: 32px;
}

#chartdivbar {
  width: 100%;
  height: 500px;
}
#chartdivbar a {display:none !important;}
</style>

<script>
$(document).ready(function() {
	    var table = $('#articles').removeAttr('width').DataTable( {
	        paging: true,
	        columnDefs: [
	        	{ width: 10, targets: 0}
	        ],
	        dom: 'Bfrtip',
	        responsive: true
	    } );
	} );
	
$(document).ready(function() {
    	var table = $('#blogsList').removeAttr('width').DataTable( {
        	paging: true,
        	columnDefs: [
        		{ width: 100, targets: 3},
        		{ width: 10, targets: 4}
        	],
        	dom: 'Bfrtip',
       		responsive: true
    } );
} );

$(document).ready(function() {
	var table = $('#coursesList').removeAttr('width').DataTable( {
    	paging: true,
    	columnDefs: [
    		{ width: 10, targets: 0}
    	],
    	dom: 'Bfrtip',
   		responsive: true
	} );
} );

$(document).ready(function() {
	var table = $('#ebooksList').removeAttr('width').DataTable( {
    	paging: true,
    	columnDefs: [
    		{ width: 10, targets: 0}
    	],
    	dom: 'Bfrtip',
   		responsive: true
	} );
} );

$(document).ready(function() {
	var table = $('#jobsList').removeAttr('width').DataTable( {
    	paging: true,
    	columnDefs: [
    		{ width: 10, targets: 0}
    	],
    	dom: 'Bfrtip',
   		responsive: true
	} );
} );

$(document).ready(function() {
	var table = $('#webinarsList').removeAttr('width').DataTable( {
    	paging: true,
    	columnDefs: [
    		{ width: 10, targets: 0}
    	],
    	dom: 'Bfrtip',
   		responsive: true
	} );
} );

am5.ready(function() {

	// Create root element
	// https://www.amcharts.com/docs/v5/getting-started/#Root_element
	var root = am5.Root.new("chartdivbar");


	// Set themes
	// https://www.amcharts.com/docs/v5/concepts/themes/
	root.setThemes([
	  am5themes_Animated.new(root)
	]);


	// Create chart
	// https://www.amcharts.com/docs/v5/charts/xy-chart/
	var chart = root.container.children.push(am5xy.XYChart.new(root, {
	  panX: true,
	  panY: true,
	  wheelX: "panX"
	}));

	// Add cursor
	// https://www.amcharts.com/docs/v5/charts/xy-chart/cursor/
	var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {}));
	cursor.lineY.set("visible", false);


	// Create axes
	// https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
	var xRenderer = am5xy.AxisRendererX.new(root, { minGridDistance: 30 });
	xRenderer.labels.template.setAll({
	  rotation: -90,
	  centerY: am5.p50,
	  centerX: am5.p100,
	  paddingRight: 15
	});

	var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
	  maxDeviation: 0.3,
	  categoryField: "country",
	  renderer: xRenderer,
	  tooltip: am5.Tooltip.new(root, {})
	}));

	var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
	  maxDeviation: 0.3,
	  renderer: am5xy.AxisRendererY.new(root, {})
	}));


	// Create series
	// https://www.amcharts.com/docs/v5/charts/xy-chart/series/
	var series = chart.series.push(am5xy.ColumnSeries.new(root, {
	  name: "Series 1",
	  xAxis: xAxis,
	  yAxis: yAxis,
	  valueYField: "value",
	  sequencedInterpolation: true,
	  categoryXField: "country",
	  tooltip: am5.Tooltip.new(root, {
	    labelText:"{valueY}"
	  })
	}));

	series.columns.template.setAll({ cornerRadiusTL: 5, cornerRadiusTR: 5 });
	series.columns.template.adapters.add("fill", (fill, target) => {
	  return chart.get("colors").getIndex(series.columns.indexOf(target));
	});

	series.columns.template.adapters.add("stroke", (stroke, target) => {
	  return chart.get("colors").getIndex(series.columns.indexOf(target));
	});


	// Set data
	var data = [{
	  country: "Leads",
	  value: ${leadsCount}
	}, {
	  country: "Contacts",
	  value: ${contactsCount}
	}, {
	  country: "Contributor",
	  value: ${contributorCount}
	}, {
	  country: "Trainers",
	  value: ${trainersCount}
	}, {
	  country: "Career",
	  value: ${careerCount}
	}, {
	  country: "Internship",
	  value: ${internshipCount}
	}, {
	  country: "EbooksDownload",
	  value: ${ebooksDownloadCount}
	}];

	xAxis.data.setAll(data);
	series.data.setAll(data);


	// Make stuff animate on load
	// https://www.amcharts.com/docs/v5/concepts/animations/
	series.appear(1000);
	chart.appear(1000, 100);

	}); // end am5.ready()
		
</script>



<div id="main">
	<div class="visible-md visible-xs visible-sm mobile-menu">
	    <button type="button" data-toggle="offcanvas"><i class="fa fa-bars"></i></button>
	</div>

	<div class="section bgw admin-section-bottom">
	    <div class="container-fluid">
			  <div class="section-title-2 text-center">
                 <h2>Teksands Dashboard</h2>
                 <hr>
             </div><!-- end section-title -->
	         <div class="col-lg-12">
                  <div class="col-lg-6">
	                  <div class="row statscounts">
	                      <div class="col-lg-12">
	                      		 <div class="statwrap col-md-4 col-sm-6 col-xs-12">
			                          <span class="stat-count"><c:out value="${leadsCount}"></c:out></span>
			                          <small>Leads Captured</small>
			                      </div><!-- end col -->
			
			                      <div class="statwrap col-md-4 col-sm-6 col-xs-12">
			                          <span class="stat-count"><c:out value="${contactsCount}"></c:out></span>
			                          <small>Contacted People</small>
			                      </div><!-- end col -->
			                      
			                      <div class="statwrap col-md-4 col-sm-6 col-xs-12">
			                          <span class="stat-count"><c:out value="${contributorCount}"></c:out></span>
			                          <small>Contributors</small>
			                      </div><!-- end col -->
	                      </div>
			
						<div class="col-lg-12" style=" margin: 45px 0 45px 0; ">
				
	                      <div class="statwrap col-md-4 col-sm-6 col-xs-12">
	                          <span class="stat-count"><c:out value="${trainersCount}"></c:out></span>
	                          <small>Trainers Contacted</small>
	                      </div><!-- end col -->
	                      <div class="statwrap col-md-4 col-sm-6 col-xs-12">
	                          <span class="stat-count"><c:out value="${careerCount}"></c:out></span>
	                          <small>Career</small>
	                      </div><!-- end col -->
	
	                      <div class="statwrap col-md-4 col-sm-6 col-xs-12">
	                          <span class="stat-count"><c:out value="${internshipCount}"></c:out></span>
	                          <small>Internships</small>
	                      </div><!-- end col -->
	                      </div>
	                      
	                      <div class="col-lg-12">
	                      
	                      <div class="statwrap col-md-4 col-sm-6 col-xs-12">
	                          <span class="stat-count"><c:out value="${ebooksDownloadCount}"></c:out></span>
	                          <small>Ebooks Downloads</small>
	                      </div><!-- end col -->
	
	                      <div class="statwrap col-md-4 col-sm-6 col-xs-12">
	                          <span class="stat-count"><c:out value="${jobsApplicationsCount}"></c:out></span>
	                          <small>Jobs Applications</small>
	                      </div><!-- end col -->
	                      
	                      <div class="statwrap col-md-4 col-sm-6 col-xs-12">
	                          <span class="stat-count"><c:out value="${webinarContactsCount}"></c:out></span>
	                          <small>Webinars Contacts</small>
	                      </div><!-- end col -->
	                      </div>
	                  </div><!-- end row -->
                  </div>
                  <div class="col-md-6">
					<div class="chartdivbar" id="chartdivbar"></div>
				</div>
              </div><!-- end content -->
	    </div><!-- end container -->
	</div><!-- end section -->
	
	
	<div class="section bgg course-section">
            <div class="container-fluid">
                <div class="row">
                	<div class="col-lg-12">
	                    <div class="col-md-6">
	                        <div class="stat-module text-left">
	                            <div class="row">
	                                <div class="col-md-3 col-sm-6 col-xs-12 text-center">
	                                    <i class="fa fa-newspaper-o"></i>
	                                </div>
	                                <div class="col-md-6 col-sm-6 col-xs-12">
	                                    <h4>Live Tech Articles</h4>
	                                </div>
	                                <div class="col-md-3 col-sm-6 col-xs-12">
	                                    <span class="stat-count"><c:out value="${blogsCount}"></c:out></span>
	                                </div>
	                            </div><!-- end row -->
	
	                            <div class="row">
	                                <div class="col-md-3 col-sm-6 col-xs-12 text-center">
	                                    <i class="fa fa-rss"></i>
	                                </div>
	                                <div class="col-md-6 col-sm-6 col-xs-12">
	                                    <h4>Live Blogs</h4>
	                                </div>
	                                <div class="col-md-3 col-sm-6 col-xs-12">
	                                    <span class="stat-count"><c:out value="${articleCount}"></c:out></span>
	                                </div>
	                            </div><!-- end row -->
	
	                            <div class="row">
	                                <div class="col-md-3 col-sm-6 col-xs-12 text-center">
	                                    <i class="fa fa-graduation-cap"></i>
	                                </div>
	                                <div class="col-md-6 col-sm-6 col-xs-12">
	                                    <h4>Live Courses</h4>
	                                </div>
	                                <div class="col-md-3 col-sm-6 col-xs-12">
	                                    <span class="stat-count"><c:out value="${coursesCount}"></c:out></span>
	                                </div>
	                            </div><!-- end row -->
	                        </div><!-- end stat-module -->
	                    </div>
                    
	                    <div class="col-md-6">
	                        <div class="stat-module text-left">
	                            <div class="row">
	                                <div class="col-md-3 col-sm-6 col-xs-12 text-center">
	                                    <i class="fa fa-book"></i>
	                                </div>
	                                <div class="col-md-6 col-sm-6 col-xs-12">
	                                    <h4>Live Ebooks</h4>
	                                </div>
	                                <div class="col-md-3 col-sm-6 col-xs-12">
	                                    <span class="stat-count"><c:out value="${ebooksCount}"></c:out></span>
	                                </div>
	                            </div><!-- end row -->
	
	                            <div class="row">
	                                <div class="col-md-3 col-sm-6 col-xs-12 text-center">
	                                    <i class="fa fa-briefcase"></i>
	                                </div>
	                                <div class="col-md-6 col-sm-6 col-xs-12">
	                                    <h4>Live Jobs</h4>
	                                </div>
	                                <div class="col-md-3 col-sm-6 col-xs-12">
	                                    <span class="stat-count"><c:out value="${jobsCount}"></c:out></span>
	                                </div>
	                            </div><!-- end row -->
	
	                            <div class="row">
	                                <div class="col-md-3 col-sm-6 col-xs-12 text-center">
	                                    <i class="fa fa-video-camera"></i>
	                                </div>
	                                <div class="col-md-6 col-sm-6 col-xs-12">
	                                    <h4>Live Webinars</h4>
	                                </div>
	                                <div class="col-md-3 col-sm-6 col-xs-12">
	                                    <span class="stat-count"><c:out value="${webinarsCount}"></c:out></span>
	                                </div>
	                            </div><!-- end row -->
	                        </div><!-- end stat-module -->
	                    </div>
					</div>
                </div><!--end of row-->
            </div><!-- end container -->
        </div><!-- end row fluid -->
        
        <div class="section bgg course-section">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="tab-first menu-center">
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#techarticles" aria-controls="techarticles" role="tab" data-toggle="tab">Tech Articles</a></li>
                                <li role="presentation"><a href="#blogs" aria-controls="blogs" role="tab" data-toggle="tab">Blogs</a></li>
                                <li role="presentation"><a href="#courses" aria-controls="courses" role="tab" data-toggle="tab">Courses</a></li>
                                <li role="presentation"><a href="#ebooks" aria-controls="ebooks" role="tab" data-toggle="tab">Ebooks</a></li>
                                <li role="presentation"><a href="#jobs" aria-controls="jobs" role="tab" data-toggle="tab">Jobs</a></li>
                                <li role="presentation"><a href="#webinars" aria-controls="webinars" role="tab" data-toggle="tab">Webinars</a></li>
                            </ul>

                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="techarticles">
                                    <div class="tab-padding clearfix">
                                        <div class="table-responsive">
											<table id="articles" class="table table-striped table-bordered dt-responsive" style="font-size: 12px;width: 100%;">
												<thead class="thead-dark">
													<tr>
														<th>Id</th>
														<th>Title</th>
														<th>Created Date</th>
														<th>SEO Title Tags</th>
														<th>Viewed Count</th>
														<th>Action</th>
													</tr>
												</thead>
											<tbody>
												<c:forEach items="${techArticleList}" var="techArticleList">
													<tr>
														<td><c:out value="${techArticleList.id}" /></td>
														<td><c:out value="${techArticleList.title}" /></td>
														<td><fmt:formatDate value="${techArticleList.create_date}" pattern="dd-MMM-yyyy"/></td>
														<td><c:out value="${techArticleList.meta_title}" /></td>
														<td><c:out value="${techArticleList.viewed_count}" /></td>
														<td><a href="https://teksands.ai/blog/${techArticleList.blog_url}" class="btn btn-primary btn-xs" target="_blank">View</a></td>
													</tr>
												</c:forEach>
											</tbody>
											</table>
										</div>
                                    </div>
                                </div>
                                
                                <div role="tabpanel" class="tab-pane" id="blogs">
                                    <div class="tab-padding clearfix">
                                        <div class="table-responsive">
											<table id="blogsList" class="table table-striped table-bordered dt-responsive" style="font-size: 12px;width: 100%;">
												<thead class="thead-dark">
													<tr>
														<th>Id</th>
														<th>Title</th>
														<th>Created Date</th>
														<th>SEO Title Tags</th>
														<th>Viewed Count</th>
														<th>Action</th>
													</tr>
												</thead>
											<tbody>
												<c:forEach items="${shortreadsList}" var="shortreadsList">
													<tr>
														<td><c:out value="${shortreadsList.id}" /></td>
														<td><c:out value="${shortreadsList.title}" /></td>
														<td><fmt:formatDate value="${shortreadsList.create_date}" pattern="dd-MMM-yyyy"/></td>
														<td><c:out value="${shortreadsList.meta_title}" /></td>
														<td><c:out value="${shortreadsList.viewed_count}" /></td>
														<td><a href="https://teksands.ai/${shortreadsList.blog_url}" class="btn btn-primary btn-xs" target="_blank">View</a></td>
													</tr>
												</c:forEach>
											</tbody>
											</table>
										</div>
                                    </div>
                                </div>
                                
                                <div role="tabpanel" class="tab-pane" id="courses">
                                    <div class="tab-padding clearfix">
                                        <div class="table-responsive">
											<table id="coursesList" class="table table-striped table-bordered dt-responsive" style="font-size: 12px;width: 100%;">
												<thead class="thead-dark">
													<tr>
														<th>Id</th>
														<th>Title</th>
														<th>Created Date</th>
														<th>Information</th>
														<th>Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${coursesAllList}" var="coursesAllList">
														<tr>
															<td><c:out value="${coursesAllList.id}" /></td>
															<td><c:out value="${coursesAllList.title}" /></td>
															<td><fmt:formatDate value="${coursesAllList.date}" pattern="dd-MMM-yyyy"/></td>
															<td><c:out value="${coursesAllList.information}" /></td>
															<td><a href="<c:out value="${coursesAllList.link}" escapeXml="false"/>" class="btn btn-primary btn-xs" target="_blank">View</a></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
                                    </div>
                                </div>
                                
                                <div role="tabpanel" class="tab-pane" id="ebooks">
                                    <div class="tab-padding clearfix">
                                        <div class="table-responsive">
											<table id="ebooksList" class="table table-striped table-bordered dt-responsive" style="font-size: 12px;width: 100%;">
												<thead class="thead-dark">
													<tr>
														<th>Id</th>
														<th>Title</th>
														<th>PDF Link</th>
														<th>Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${ebooksAllList}" var="ebooksAllList">
														<tr>
															<td><c:out value="${ebooksAllList.id}" /></td>
															<td><c:out value="${ebooksAllList.title}" /></td>
															<td><c:out value="${ebooksAllList.link}" /></td>
															<td><a href="https://teksands.ai/e-books" class="btn btn-primary btn-xs" target="_blank">View</a></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
                                    </div>
                                </div>
                                
                                <div role="tabpanel" class="tab-pane" id="jobs">
                                    <div class="tab-padding clearfix">
                                        <div class="table-responsive">
											<table id="jobsList" class="table table-striped table-bordered dt-responsive" style="font-size: 12px;width: 100%;">
												<thead class="thead-dark">
													<tr>
														<th>Id</th>
														<th>Role Name</th>
														<th>Total Vacancy</th>
														<th>Experience</th>
														<th>Salary Range</th>
														<th>Company</th>
														<th>Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${jobsAllList}" var="jobsAllList">
														<tr>
															<td><c:out value="${jobsAllList.id}" /></td>
															<td><c:out value="${jobsAllList.role_name}" /></td>
															<td><c:out value="${jobsAllList.total_vacancy}" /></td>
															<td><c:out value="${jobsAllList.experience}" /></td>
															<td>
																<c:choose>
												            		<c:when test="${jobsAllList.min_salary_range == '0' && jobsAllList.max_salary_range == '0'}">
												            			<span>Not Disclosed</span>
												            		</c:when>
												            		<c:when test="${not empty jobsAllList.min_salary_range && not empty jobsAllList.max_salary_range}">
												            			<c:out value="${jobsAllList.min_salary_range}" /> - <c:out value="${jobsAllList.max_salary_range}" /> <span>(lakhs)</span>
												            		</c:when>
												            		<c:otherwise>
												            			<span>Not Disclosed</span>
												            		</c:otherwise>
												            	</c:choose>
															</td>
															<td><c:out value="${jobsAllList.company_name}" /></td>
															<td><a href="https://teksands.ai/jobs/${jobsAllList.jobs_url}" class="btn btn-primary btn-xs" target="_blank">View</a></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
                                    </div>
                                </div>
                                
                                <div role="tabpanel" class="tab-pane" id="webinars">
                                    <div class="tab-padding clearfix">
                                        <div class="table-responsive">
											<table id="webinarsList" class="table table-striped table-bordered dt-responsive" style="font-size: 12px;width: 100%;">
												<thead class="thead-dark">
													<tr>
														<th>Id</th>
														<th>Title</th>
														<th>Short Contents</th>
														<th>Start Date</th>
														<th>End Date</th>
														<th>Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${webinarsAllList}" var="webinarsAllList">
														<tr>
															<td><c:out value="${webinarsAllList.id}" /></td>
															<td><c:out value="${webinarsAllList.title}" /></td>
															<td><c:out value="${webinarsAllList.short_description}" /></td>
															<td><fmt:formatDate value="${webinarsAllList.start_date}"/></td>
															<td><fmt:formatDate value="${webinarsAllList.end_date}"/></td>
															<td><a href="https://teksands.ai/webinars" class="btn btn-primary btn-xs" target="_blank">View</a></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
        </div><!-- end section -->
</div>

