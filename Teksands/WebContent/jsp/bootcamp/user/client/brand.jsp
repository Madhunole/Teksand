<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<section>
	<div class="container py-2">
		<div class="row">
			<div class="col-lg-4">
				<div class="card mb-4">
					<div class="card-body text-center p-0">
						<c:if test="${not empty brand.name}">
							<p class="font-weight-bold text-primary mb-0 mt-3"><c:out value="${brand.name}"></c:out></p>
							<small><a href="<c:out value="${brand.website}"></c:out>" class="text-secondary" target="_blank"><c:out value="${brand.website}"></c:out></a></small>
						</c:if>
						<ul class="list-group list-group-flush rounded-3">
							<c:if test="${not empty brand.cin}">
								<li class="list-group-item d-flex justify-content-between p-3 text-left">
									<p class="mb-0"><b>CIN : </b> <c:out value="${brand.cin}"></c:out></p>
								</li>
							</c:if>
							<c:if test="${not empty brand.gst}">
								<li class="list-group-item d-flex justify-content-between p-3 text-left">
									<p class="mb-0"><b>GST :</b> <c:out value="${brand.gst}"></c:out></p>
								</li>
							</c:if>
							<c:if test="${not empty brand.pan}">
								<li class="list-group-item d-flex justify-content-between p-3 text-left">
									<p class="mb-0"><b>PAN :</b> <c:out value="${brand.pan}"></c:out></p>
								</li>
							</c:if>
							<c:if test="${not empty brand.created_date}">
								<li class="list-group-item d-flex justify-content-between p-3 text-left rounded">
									<p class="mb-0"><b>Date of Created :</b> <fmt:formatDate pattern="dd-MM-yyyy" value="${brand.created_date}" /></p>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-8">
				<c:if test="${not empty brand.description}">
					<div class="card">
						<div class="card-header">
							<p class="mb-0 font-weight-bold">Description</p>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-lg-12">
									<p class="text-justify"><c:out value="${brand.description}"></c:out></p>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<div class="row mt-3">
					<c:if test="${not empty brand.address || not empty brand.city || not empty brand.state || not empty brand.country || not empty brand.pinocde}">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-lg-12">
											<p class="font-weight-bold">Address: </p>
											<p class="mb-0">
												<c:out value="${brand.address}"></c:out>,
												<c:out value="${brand.city}"></c:out>,
												<c:out value="${brand.state}"></c:out>,
												<c:out value="${brand.country}"></c:out> - <c:out value="${brand.pinocde}"></c:out>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${not empty brand.nature_of_business || not empty brand.product_and_service || not empty brand.total_no_employee || not empty brand.annual_revenue}">
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body p-3">
									<div class="row">
										<div class="col-lg-12">
											<ul class="list-group list-group-flush rounded-3">
												<c:if test="${not empty brand.nature_of_business}">
													<li class="list-group-item border-bottom-0 d-flex justify-content-between p-0 text-left">
														<p class="mb-1"><b>Nature of Business :</b> <c:out value="${brand.nature_of_business}"></c:out></p>
													</li>
												</c:if>
												<c:if test="${not empty brand.product_and_service}">
													<li class="list-group-item border-bottom-0 d-flex justify-content-between p-0 text-left">
														<p class="mb-1 mt-1"><b>Product & Services :</b> <c:out value="${brand.product_and_service}"></c:out></p>
													</li>
												</c:if>
												<c:if test="${not empty brand.total_no_employee}">
													<li class="list-group-item border-bottom-0 d-flex justify-content-between p-0 text-left">
														<p class="mb-1 mt-1"><b>Total Employees :</b> <c:out value="${brand.total_no_employee}"></c:out></p>
													</li>
												</c:if>
												<c:if test="${not empty brand.annual_revenue}">
													<li class="list-group-item border-bottom-0 d-flex justify-content-between p-0 text-left">
														<p class="mb-0 mt-1"><b>Annual Revenue :</b> <c:out value="${brand.annual_revenue}"></c:out></p>
													</li>
												</c:if>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</div>
			</div>
			<div class="col-lg-12 mt-3">
				<div class="card shadow mb-4">
			        <div class="card-header py-3">
			            <div class="row">
			            	<div class="col-lg-6">
			            		<h6 class="m-0 font-weight-bold text-primary float-left">Brand Directors</h6>
			            	</div>
			            </div>
			        </div>
			        <div class="card-body">
			            <div class="table-responsive">
			                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			                    <thead>
			                        <tr>
			                            <th>Name</th>
			                            <th>Designation</th>
			                            <th>Email</th>
			                            <th>Mobile</th>
			                            <th>Notes</th>
			                            <th>Created Date</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${brandDirectors}" var="directors">
				                        <tr>
				                            <td><c:out value="${directors.name}" /></td>
				                            <td><c:out value="${directors.designation}" /></td>
				                            <td><c:out value="${directors.email}" /></td>
				                            <td><c:out value="${directors.mobile}" /></td>
				                            <td><c:out value="${directors.notes}" /></td>
				                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${directors.created_date}" /></td>
				                        </tr>
			                        </c:forEach>
			                    </tbody>
			                </table>
			            </div>
			        </div>
			    </div>
			</div>
		</div>
	</div>
</section>