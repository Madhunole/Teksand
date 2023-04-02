<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="col-12 col-xl-auto mb-3">
    <a class="btn btn-sm btn-light text-primary" href="/bootcamp/bootcamp-list">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
        Back to Bootcamp List
    </a>
</div>


<!-- Begin Page Content -->
<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <div class="row">
            	<div class="col-lg-6"><h6 class="m-0 font-weight-bold text-primary float-left" id="bootcamp_name"><c:out value="${bootcamp.name}" /></h6></div>
            	<div class="col-lg-6"><button class="btn btn-primary cms-btn cms-btn-xs float-right" onclick="assignCandidate()">Submit</button></div>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="CandidateTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th><input class="check_all_btn" id="check_all_btn" type="checkbox"></th>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Mobile</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${candidateList}" var="candidateList">
	                        <tr>
	                        	<td>
		                        	<c:set var="check_flag" value="false" />
		                        	<c:forTokens items="${candidateList.bootcamp_ids}" delims="," var="mySplit">
									   <c:if test="${mySplit eq bootcamp.id}">
									   		<c:set var="check_flag" value="true" />
									   </c:if>
									</c:forTokens>
		                        	<c:choose>
			                        	<c:when test="${check_flag eq 'true'}">
			                        		<input class="inp-cbx" id="cbx_${candidateList.id}" checked="checked" type="checkbox" name="inp-cbx" value="${candidateList.id}">
			                        	</c:when>
			                        	<c:otherwise>
			                        		<input class="inp-cbx" id="cbx_${candidateList.id}" type="checkbox" name="inp-cbx" value="${candidateList.id}">
			                        	</c:otherwise>
		                        	</c:choose>
	                        	</td>
	                        	<td><c:out value="${candidateList.id}" /></td>
	                            <td><c:out value="${candidateList.name}" /></td>
	                            <td><c:out value="${candidateList.email}" /></td>
	                            <td><c:out value="${candidateList.mobile}" /></td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->

<script>
<c:choose>
	<c:when test="${empty bootcamp}">
		var bootcamp_id = "";
	</c:when>
	<c:otherwise>
		var bootcamp_id = ${bootcamp.id};
	</c:otherwise>
</c:choose>

$(document).ready(function () { 
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

function assignCandidate()
{
	var arr = [];
	var myTable = $('#CandidateTable').dataTable();
	var rowcollection = myTable.$(".inp-cbx:checked", {"page": "all"});
	rowcollection.each(function(index,elem){
	    var checkbox_value = $(elem).val();
	    arr.push(checkbox_value);
	});
	var bootcamp_name = '${bootcamp.name}';
	
	if(arr.length == '0')
	{
		swal({
		      title: 'Are you sure to deselect the bootcamp all candidates?',
		      text: "You won't be able to revert this!",
		      type: 'warning',
		      showCancelButton: true,
		      confirmButtonText: 'Confirm',
		      padding: '2em'
		    }).then(function(result) {
		      if (result.value) {
		        
		    	  $.LoadingOverlay("show");
		    	  
		    	  $.ajaxSetup({async:true});
		    	  	$.post("/bootcamp/assignBootcampToCandidate", {candidateStr : "" + arr + "", bootcamp_id: "" + bootcamp_id + "",bootcamp_name: "" + bootcamp_name + "",}, function(data)
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
	}else
	{
		swal({
		      title: 'Are you sure to assign the bootcamp ' + arr.length + ' selected candidate?',
		      text: "You won't be able to revert this!",
		      type: 'warning',
		      showCancelButton: true,
		      confirmButtonText: 'Confirm',
		      padding: '2em'
		    }).then(function(result) {
		      if (result.value) {
		        
		    	  $.LoadingOverlay("show");
		    	  
		    	  $.ajaxSetup({async:true});
		    	  	$.post("/bootcamp/assignBootcampToCandidate", {candidateStr : "" + arr + "", bootcamp_id: "" + bootcamp_id + "",bootcamp_name: "" + bootcamp_name + "",}, function(data)
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
}
</script>