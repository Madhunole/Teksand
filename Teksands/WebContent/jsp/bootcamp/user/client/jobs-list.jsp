<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css">  
<style>
.multiselect-container>li>a>label {
    padding: 3px 20px 3px 10px !important;
}
.select_option {
	font-weight: normal;
    display: block;
    white-space: nowrap;
    min-height: 1.2em;
    padding: 0px 2px 1px;
}
.dropdown-menu[x-placement^=bottom], .dropdown-menu[x-placement^=left], .dropdown-menu[x-placement^=right], .dropdown-menu[x-placement^=top] {
    right: 0;
}
li.multiselect-item.multiselect-all {
    padding-top: 0.5rem!important;
}
</style>
<div class="col-12 col-xl-auto mb-3">
    <a class="btn btn-sm btn-light text-primary" href="/bootcamp/client/dashboard">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
        Back to Dashboard
    </a>
</div>

<!-- Begin Page Content -->
<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <div class="row">
            	<div class="col-lg-6"><h6 class="m-0 font-weight-bold text-primary float-left">Job Master</h6></div>
            	<div class="col-lg-6">
            		<a href="/bootcamp/client/client-add-update-jobs" class="btn btn-primary cms-btn cms-btn-xs float-right">Post Job</a>
            	</div>
            </div>
        </div>
        <div class="card-body">
        <div class="">				
		        			<div class="form-group form-validate">
		        				<label class="required">Select the Clients</label>
		        				<div class="row">
		        					<div class="col-lg-4">
		        						<select id="multiple-checkboxes" multiple="multiple" onchange="getSelectValue()">  
									        <c:forEach items="${clients}" var="clients">
												<option class="py-1" value="${clients.id}"><c:out value="${clients.name}" /></option>									        	
									        </c:forEach>
									    </select> 									  
		        					</div>
		        					<div class="col-lg-8">
		        					  <button class="btn btn-primary cms-btn cms-btn-xs" onClick="getResult()"> Submit </button> 
		        					</div>
		        					
		        				</div>
						  	</div>		      
		        </div>
            <div class="table-responsive">
                <table class="table table-bordered" id="jobsMasterList" width="100%" cellspacing="0">
                    <thead>
                    	<tr class="text-center">
                    	<th colspan="10">
                    			<c:forEach items="${clients}" var="clients" varStatus="loop">
                    				<c:out value="${clients.name}" />
                    				 <c:if test="${!loop.last}">,</c:if>								        	
								</c:forEach>         
							</th>        
                    	</tr>
                        <tr>                        	                	
                            <th>Position</th>
                            <th>Date Posted</th>
                            <th>Company</th>
                            <th>CTC</th>
                            <th>Experience Range</th>
                            <th>Required Skills</th>
                            <th>Location</th>  
                            <th>Total Vacancy</th>  
                            <th>No. of Application</th>                       
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${jobMasterList}" var="jobMasterList">
	                        <tr>	                        	
	                            <td><c:out value="${jobMasterList.position}" /></td>
	                            <td><fmt:formatDate type = "both" value = "${jobMasterList.date_of_posted}" /></td>
	                            <td><c:out value="${jobMasterList.company_name}" /></td>
	                            <td>
		                            <c:choose>
					            		<c:when test="${jobMasterList.min_salary_range == '0' && jobMasterList.max_salary_range == '0'}">
					            			<span>Not Disclosed</span>
					            		</c:when>
					            		<c:when test="${not empty jobMasterList.min_salary_range && not empty jobMasterList.max_salary_range}">
					            			<c:out value="${jobMasterList.min_salary_range}" /> - <c:out value="${jobMasterList.max_salary_range}" /> <span>(lakhs)</span>
					            		</c:when>
					            		<c:otherwise>
					            			<span>Not Disclosed</span>
					            		</c:otherwise>
					            	</c:choose>
	                            </td>
	                            <td><c:out value="${jobMasterList.experience}" /></td>
	                            <td><c:out value="${jobMasterList.skills_required}" /></td>
	                            <td><c:out value="${jobMasterList.location}" /></td>
	                            <td><c:out value="${jobMasterList.total_vacancy}" /></td>
	                            <td><c:out value="${jobMasterList.no_of_applied}" /></td>
	                            <td class="text-center">    
                                    <div class="dropdown custom-dropdown">
                                        <a class="dropdown-toggle font-20 text-primary" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-cog"></i>
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink1" style="will-change: transform;">
                                            <a class="dropdown-item" href="javascript:void(0)" onclick="viewJobs(${jobMasterList.id})">View</a>                                           
                                            <a class="dropdown-item" href="/bootcamp/client/client-add-update-jobs?id=${jobMasterList.id}">Edit</a>
                                        </div>
                                    </div>
                                </td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>  
<script>
var selectedValue ="";
function viewJobs(id)
{	 
	id = $.trim(id);	
	$.ajaxSetup({async:false});
	$.post("/bootcamp/client/viewJobs", {id: "" + id + ""}, function(data)
	{		
		window.location = "http://localhost:8080/bootcamp/client/view-jobs";		
	},'text');
}
function getSelectValue()
{
	selectedValue = $('select#multiple-checkboxes').val();
	console.log("selectedValue = " + selectedValue);
}
function getResult()
{	
	window.location.href = "/bootcamp/client/jobs?client_ids="+selectedValue+"";
}
$(document).ready(function () {
	
  	 var clientIds =`${clientIds}`;
	 clientIds = clientIds.split(",");	
	 $('#multiple-checkboxes').val(clientIds).trigger('change');  
	
	 $('#multiple-checkboxes').multiselect({
			buttonWidth: '100%',
			buttonClass: 'form-control form-control-sm',
			nonSelectedText: 'Please Select The Client',
			includeSelectAllOption: true,
			maxHeight: 600,
	 });
	  
	    
     $('#jobsMasterList').DataTable({
        ordering: false,
        "columnDefs": [
        	{ "width": "20%", "targets": 1 },
          ],
     });
    
});

</script>