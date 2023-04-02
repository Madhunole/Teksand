<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="col-12 col-xl-auto mb-3 pl-0 ">
		<a class="btn btn-sm btn-light text-primary pl-0" href="/bootcamp/dashboard">
	       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left me-1"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
	       Go to Dashboard
	    </a>
	</div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <div class="row">
            	<div class="col-lg-6"><h6 class="m-0 font-weight-bold text-primary float-left">Brand Master</h6></div>
            	<div class="col-lg-6"><a href="/bootcamp/add-update-brand" class="btn btn-primary cms-btn cms-btn-xs float-right">Add Brand</a></div>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Nature of Business</th>
                            <th>Products and Services</th>
                            <th>Created Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${brands}" var="brand">
	                        <tr>
	                            <td><c:out value="${brand.name}" /></td>
	                            <td><c:out value="${brand.nature_of_business}" /></td>
	                            <td><c:out value="${brand.product_and_service}" /></td>
	                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${brand.created_date}" /></td>
	                            <td class="text-center">    
                                    <div class="dropdown custom-dropdown">
                                        <a class="dropdown-toggle font-20 text-primary" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-cog"></i>
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink1" style="will-change: transform;">
                                            <a class="dropdown-item" href="/bootcamp/view-brand?brand_id=${brand.id}">View</a>
                                            <a class="dropdown-item" href="/bootcamp/add-update-brand?brand_id=${brand.id}">Edit</a>                                            
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
<!-- /.container-fluid -->

<script>
function deleteBrandById(id)
{
	var brand_id = id;
	
	swal({
      title: 'Are you sure to Delete This Brand?',
      text: "You won't be able to revert this!",
      type: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Confirm',
      padding: '2em'
    }).then(function(result) {
      if (result.value) {
    	  
   	  	$.LoadingOverlay("show");
   	  
   		$.ajaxSetup({async:false});
   		$.post("/bootcamp/deleteBrandById", {brand_id: "" + brand_id + "", }, function(data)
   		{		
   			$.LoadingOverlay("hide");
   			
   			var result = $.trim(data);
   	  		var obj = jQuery.parseJSON(result);
   	  		
   	  		if(obj.status_code == 200)
   	   		{
   	  			$.toast({
				    heading: '<b>Success</b>',
				    text: obj.msg,
				    icon: 'success',
				    position: 'top-right',
				    bgColor: '#d4edda',
				    textColor: '#155724',
				    hideAfter: 1000,
				    
				    afterShown: function () {
				    	setTimeout(function() {
				    		window.location.href = "/bootcamp/brands"
				    	}, 1050);
				    },
				})
   	   		} else {
	   	   		$.toast({
				    heading: '<b>Error</b>',
				    text: 'Failure, Please Try Again',
				    icon: 'error',
				    position: 'top-right',
				    bgColor: '#f8d7da',
				    textColor: '#721c24',
				})
   	   		 	return false;
   	   		}
   		},'text');
      }
    })
}
</script>