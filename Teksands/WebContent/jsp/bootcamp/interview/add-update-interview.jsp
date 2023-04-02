<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
div#ui-datepicker-div {
    z-index: 10 !important;
}
</style>

<div class="col-12 col-xl-auto mb-3">
    <a class="btn btn-sm btn-light text-primary" href="/bootcamp/interview-list">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
        Back to Interview List
    </a>
</div>

<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Create Interview</h6>
        </div>
        <div class="card-body">
            <div class="row">
            	<div class="col-lg-6">
            		 <select class="form-control" id="cms_interview_type" name="cms_interview_type">
					 	<option>Select Interview Type</option>
						<option>Initial Technical Interview</option>
						<option>Interim/Placement Calls</option>
						<option>Mock Interviews</option>
					 </select>
            	</div>
            	<div class="col-lg-6">
            		 <select class="form-control" id="cms_bootcamp" name="cms_bootcamp" onchange="showCandidateList()">
					 	<option>Select Bootcamp</option>
						<c:forEach items="${bootcampList}" var="bootcampList">
							<option value="${bootcampList.id}"><c:out value="${bootcampList.name}" /></option>
						</c:forEach>
					 </select>
            	</div>
            	<div class="col-lg-12 canidateList mt-4">
            		<div class="table-responsive">
		                <table class="table table-bordered" id="CandidateTable" width="100%" cellspacing="0">
		                    <thead>
		                        <tr>
		                            <th><input class="check_all_btn" id="check_all_btn" type="checkbox"></th>
		                            <th>Id</th>
		                            <th>Name</th>
		                            <th>Email</th>
		                            <th>Mobile</th>
		                            <th>City</th>
		                            <th>Submitted Date</th>
		                            <th>Status</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                    	<c:forEach items="${candidateList}" var="candidate">
			                        <tr>
			                            <td>
				                        	<input class="inp-cbx" id="cbx_${candidate.id}" type="checkbox" name="inp-cbx" value="${candidate.id}">
			                        	</td>
			                            <td><c:out value="${candidate.id}" /></td>
			                            <td><c:out value="${candidate.name}" /></td>
			                            <td><c:out value="${candidate.email}" /></td>
			                            <td><c:out value="${candidate.mobile}" /></td>
			                            <td><c:out value="${candidate.permanent_city}" /></td>
			                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${candidate.created_date}" /></td>
			                            <td>
			                            	<c:if test = "${candidate.active == 'true'}">
			                            		<span class="badge badge-success">Active</span>
			                            	</c:if>
			                            	<c:if test = "${candidate.active == 'false'}">
			                            		<span class="badge badge-warning">Inactive</span>
			                            	</c:if> 
			                            </td>
			                        </tr>
		                        </c:forEach>
		                    </tbody>
		                </table>
		            </div>
            	</div>
            	<div class="col-lg-12 canidateList mt-4 text-center">
            		<a href="javascript:void(0)" class="btn btn-primary assign-btn" onclick="showCompany()">Assign Company</a>
            	</div>
            	<div class="col-lg-4 companyDetails mt-4">
            		<label>Select Company Name</label>
            		<select class="form-control form-control-sm" id="cms_company_name" name="cms_company_name">
						<c:forEach items="${clientMasterList}" var="clientMasterList">
							<option value="${clientMasterList.id}"><c:out value="${clientMasterList.name}" /></option>
						</c:forEach>
					</select>
            	</div>
            	<div class="col-lg-4 companyDetails mt-4">
            		<div class="form-group">
            			<label>Interviewer Name</label>
				    	<input type="text" class="form-control form-control-sm" id="cms_interviewer_name" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-4 companyDetails mt-4">
            		<div class="form-group">
            			<label>Interview Date</label>
				    	<input type="text" class="form-control form-control-sm" id="interview_date" placeholder="">
				  	</div>
            	</div>
            	<div class="col-lg-12 companyDetails mt-4 text-center">
            		<a href="javascript:void(0)" class="btn btn-primary" onclick="createInterview()">Create Interview</a>
            	</div>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function () { 
	
	$('.canidateList').hide();
	$('.companyDetails').hide();
	
    var oTable = $('#CandidateTable').dataTable({
        stateSave: true
    });

    var allPages = oTable.fnGetNodes();

    $('body').on('click', '#check_all_btn', function () {
        if ($(this).hasClass('inp-cbx')) {
            $('input[type="checkbox"]', allPages).prop('checked', false);
        } else {
            $('input[type="checkbox"]', allPages).prop('checked', true);
        }
        $(this).toggleClass('inp-cbx');
    })
});

function showCandidateList()
{
	var bootcamp_name = $('#cms_bootcamp').find(":selected").text();
	if (bootcamp_name == "Select Bootcamp")
	{
		$('.canidateList').hide();
		$('.companyDetails').hide();
	}else
	{
		$('.canidateList').show();
		getBootcampActiveCandidates();
	}
}

$(function() {
  $("#interview_date").datepicker({
    changeMonth: true,
    changeYear: true,
    yearRange: '1950:2034',
    dateFormat: 'yy-mm-dd'
	});
});

function showCompany()
{
	var arr = [];
	var myTable = $('#CandidateTable').dataTable();
	var rowcollection = myTable.$(".inp-cbx:checked", {"page": "all"});
	rowcollection.each(function(index,elem){
	    var checkbox_value = $(elem).val();
	    arr.push(checkbox_value);
	});
	
	if(arr.length == '0')
	{
		swal("OOPS!", "Please Select Atleast One Candidate", "error").then(() => {
    		$('html').animate({ scrollTop: $("#company_name").offset().top-100 }, "slow");
		})
    	return false;
	}else{
		$('.assign-btn').hide();
		$('.companyDetails').show();
	}
}

function createInterview()
{
	var bootcamp_id = $("#cms_bootcamp").val();
	var arr = [];
	var myTable = $('#CandidateTable').dataTable();
	var rowcollection = myTable.$(".inp-cbx:checked", {"page": "all"});
	rowcollection.each(function(index,elem){
	    var checkbox_value = $(elem).val();
	    arr.push(checkbox_value);
	});
	var company_id = $("#cms_company_name").val();
	var cms_interviewer_name = $("#cms_interviewer_name").val();
	var interview_date = $("#interview_date").val();
	var interview_type = $('#cms_interview_type').find(":selected").text();
	
	if(company_id == ""){
    	swal("OOPS!", "Please Select Client Company Name", "error").then(() => {
    		$('html').animate({ scrollTop: $("#cms_company_name").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(cms_interviewer_name == ""){
    	swal("OOPS!", "Please Enter Interviewe Name", "error").then(() => {
    		$('html').animate({ scrollTop: $("#cms_interviewer_name").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	if(interview_date == ""){
    	swal("OOPS!", "Please Enter Interview Date", "error").then(() => {
    		$('html').animate({ scrollTop: $("#interview_date").offset().top-100 }, "slow");
		})
    	return false;
    }
	
	swal({
	      title: 'Are you sure to assign the Interview ' + arr.length + ' selected candidate?',
	      text: "You won't be able to revert this!",
	      type: 'warning',
	      showCancelButton: true,
	      confirmButtonText: 'Confirm',
	      padding: '2em'
	    }).then(function(result) {
	      if (result.value) {
	        
	    	  $.LoadingOverlay("show");
	    	  
	    	  $.ajaxSetup({async:true});
	    	  $.post("/bootcamp/addUpdateInterview", {candidateStr : "" + arr + "", bootcamp_id: "" + bootcamp_id + "",
	    		  company_id: "" + company_id + "",cms_interviewer_name: "" + cms_interviewer_name + "",interview_date: "" + interview_date + "", interview_type: "" + interview_type + "",}, function(data)
		  	    {
	  				$.LoadingOverlay("hide");
	  				
	  				var result = $.trim(data);
	    			var obj = jQuery.parseJSON(result);
	    			if(obj.status_code == 200)
	    			{
	    				swal("Success!", obj.msg, "success");
	    			} else {
	    				swal("OOPS!", obj.msg, "error");
	    			 	return false;
	    			}
		  	  },'text');
	    }
	})
}

function getBootcampActiveCandidates()
{
	var bootcamp_id = $("#cms_bootcamp").val();
	
	$.LoadingOverlay("show");
	
	$.ajaxSetup({async:true});
	$.post("/bootcamp/add-update-interview", {bootcamp_id : "" + bootcamp_id + ""}, function(data)       	   
	{
		$.LoadingOverlay("hide");
		var result = $.trim(data);
		var obj = jQuery.parseJSON(result);
		
	}, "text");
}
</script>