<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.section {
    padding: 20px 0 !important;
}
</style>

<script>
$(document).ready(function() {
    var table = $('#testList').removeAttr('width').DataTable( {
        paging: true,
        columnDefs: [
        	{ width: 50, targets: 1 },
        	{ width: 150, targets: 2 },
        	{ width: 100, targets: 4 },
            { width: 200, targets: 5 }
        ],
        responsive: true
    } );
} );

function deleteTestById(id)
{
	var test_id = id;
	
	swal({
	      title: 'Are you sure to delete this Test?',
	      text: "You won't be able to revert this!",
	      type: 'warning',
	      showCancelButton: true,
	      confirmButtonText: 'Confirm',
	      padding: '2em'
	   	}).then(function(result) {
	      if (result.value) 
	      {
	        $.LoadingOverlay("show");
	    	   
	    	  $.ajaxSetup({async:true});
	    	  $.post("/bootcamp/deleteTestById", {test_id : "" + test_id + "",}, function(data)
		  	    {
	  				$.LoadingOverlay("hide");
	  				
	  				var result = $.trim(data);
	    			var obj = jQuery.parseJSON(result);
	    			if(obj.status_code == 200)
	    			{
	    				swal({title: "Deleted!",text: obj.msg,type: "success"}).then(function() {location.reload();});
	    			} else {
	    				swal("OOPS!", obj.msg, "error");
	    			 	return false;
	    			}
		  	  },'text');
	    	  
	      }
	    })
}
</script>
<div class="container-fluid">
	<div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary"></h6>
            <div class="row">
            	<div class="col-lg-6"><h6 class="m-0 font-weight-bold text-primary float-left">Test Master</h6></div>
            	<div class="col-lg-6"><a href="/bootcamp/create-test" class="btn btn-primary cms-btn cms-btn-xs float-right">Create Test</a></div>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="testList" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                         	<th>Test Name</th>
							<th>Topic 1</th>
							<th>Topic 2</th>
							<th>Topic 3</th>
							<th>Test Time</th>
							<th>Test Link</th>						
							<th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                       	<c:forEach items="${testList}" var="testList">
						<tr>
							<td><c:out value="${testList.test_name}" /></td>
							<td><c:out value="${testList.test_topic_1}" /></td>
							<td><c:out value="${testList.test_topic_2}" /></td>
							<td><c:out value="${testList.test_topic_3}" /></td>
							<td><c:out value="${testList.test_time}" /></td>
							<td><c:out value="${testList.test_link}" /></td>							
                           	<td class="text-center">    
                                   <div class="dropdown custom-dropdown">
                                       <a class="dropdown-toggle font-20 text-primary" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                           <i class="fas fa-cog"></i>
                                       </a>
                                       <div class="dropdown-menu" aria-labelledby="dropdownMenuLink1" style="will-change: transform;">
                                           <a class="dropdown-item" href="/bootcamp/view-test?id=${testList.test_id}">View</a>
                                           <a class="dropdown-item" href="/bootcamp/create-test?id=${testList.test_id}">Edit</a>
                                           <a class="dropdown-item" href="javascript:void(0)" onclick="deleteTestById(${testList.test_id})">Delete</a>
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

