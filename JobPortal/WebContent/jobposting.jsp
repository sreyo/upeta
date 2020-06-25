<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/4.5.6/tinymce.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/tinymce/4.5.6/jquery.tinymce.min.js"></script>
<link rel="stylesheet" src="/WEB-INF/css/header.css">
<style type="text/css">
    .addmember {
        height: 100%;
        overflow-y: auto;
        width: 100% !important;
        height: 100% !important;
        margin: 0 !important;
        padding: 0 !important;
        max-width:none !important;

    }
    
   .modal-full {
    min-width: 20%;
    margin-left: 80;
    overflow-y: auto;
    
    
 }
   .modal-header {
    background-color: #5bc0de;
    color:white !important;
    text-align: center;
    font-size: 15px;
  }
  .modal-footer {
    background-color: #f9f9f9;
  }
 

.modal-full .modal-content {
    min-height: 100vh;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	tinymce.init({
	    selector: '#editor'
	});
	
	//add form 
	
	$(document).on('click','#btn_add',function(e) {
    var remote = $('#remote').val();
    /*  var org_select= $('#org_select').val();
    var grptype   = $('#grouptype').val();
 */    var data      = $("#addjobform").serialize() + "&remote=" + remote  ;alert("hello"+data);
	$.ajax({
		data: data,
		type: "POST",
		url: "AddjobServlet",
		success: function(dataResult){
					$('#addEmployeeModal').modal('hide');
					alert('Data added successfully !'); 
                    location.reload();						
				}
	
	});
});
//view form



	// Activate tooltip
/* 	$('[data-toggle="tooltip"]').tooltip();
 */	
	// Select/Deselect checkboxes
	var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function(){
		if(this.checked){
			checkbox.each(function(){
				this.checked = true;                        
			});
		} else{
			checkbox.each(function(){
				this.checked = false;                        
			});
		} 
	});
	checkbox.click(function(){
		if(!this.checked){
			$("#selectAll").prop("checked", false);
		}
	});
});
$( window ).load(function() {
    var sesid = $('#idses').val();	
	$.ajax({
		url: "ViewjobServlet",
		data:{ sesid : sesid },
		type: "POST",
		cache: false,
		success: function(dataResult){ 
		var data = JSON.parse(JSON.stringify(dataResult));
		var len = data.length;alert(JSON.stringify(dataResult));
		for (var i = 0; i < len; i++) {
 			   var id = data[i].jobcode;
	   	       var name  = data[i].name;
			   var jobtitle = data[i].jobtitle;
			   var remotejob = data[i].remotejob;
			   var jobtype = data[i].jobtype;
			   var jobdesc = data[i].jobdesc;
			   var jobstatus = data[i].jobstatus;
			   var city = data[i].city;
var del =' <a href="#deleteEmployeeModal" class="delete" data-id='+id+' data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a></td></tr>';
$('#table').append('<tr><td>'+id+'</td><td>'+jobtitle+'</td><td>'+jobtype+'</td><td>'+city+'</td><td>'+remotejob+'</td><td><a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons update" data-toggle="tooltip" data-id="'+id+'" data-name="'+name+'" data-address="'+address+'" title="Edit">edit</i></a>||'+del)
		}
	}
		
	});


});
</script>
</head>
<body>
    <div class="row">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
						<h4> <b>Job List</b></h4>
					</div>
					<div class="col-sm-6">
						<a href="#addEmployeeModal" class="btn btn-info" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Apply for Job</span></a>
						<a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
					</div>
                </div>
            </div>
            <html>
<!-- <form action="UploadDownloadFileServlet" method="post" enctype="multipart/form-data">
Select File to Upload:<input type="file" name="fileName">
<br>
<input type="submit" value="Upload">
</form>
 -->            
 	<input type="hidden" id="idses"
		value="<%= session.getAttribute("name") %>">
 
 		<table class="table table-striped table-hover">
                <thead>
                    <tr>
<!-- 						<th>
							<span class="custom-checkbox">
								<input type="checkbox" id="selectAll">
								<label for="selectAll"></label>
							</span>
						</th>
 -->                    
                        <th>Job ID</th>
                        <th>Job Title</th>
						<th>Job Type</th>
						<th>Location</th>
                        <th>Remote</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="table">

                
                    <tr>
                    </tr>
                    </tbody>
                    
            </table>
			<div class="clearfix">
                <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                <ul class="pagination">
                    <li class="page-item disabled"><a href="#">Previous</a></li>
                    <li class="page-item"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item active"><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">5</a></li>
                    <li class="page-item"><a href="#" class="page-link">Next</a></li>
                </ul>
            </div>
        </div>
    </div>
	<!-- Edit Modal HTML -->
	<div id="addEmployeeModal" class="modal fade">
		<div class="modal-dialog addmember">
			<div class="modal-content">
				<form id="addjobform">
					<div class="modal-header ">						
						<h4 class="modal-title ">Post a job</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<div class="container-fluid">	
								<div class="form-group col-sm-4" >
									<input type="text" id="jobtitle" name="jobtitle" class="form-control"
										placeholder="Job Title" required>
								</div>
								<div class="form-group col-sm-4">
						           <select id="jobsstatus" name="jobstatus" class="form-control">
						              <option value="j">------Job Status---</option>
						              
						               <option value="p">Permanent</option>
						               <option value="c">Contract</option>
						               <option value="o">other</option>
								</select>							
								</div>
								<div class="form-group col-sm-4">
								    <input type="email" id="email" name="email" class="form-control"
									placeholder="Email " required>
							    </div>
							    <div class=clearfix></div>
							    <div class="form-group  col-sm-4">
								   <input type="phone" id="phone" name="phone" class="form-control" placeholder="Phone" required>
								</div>		
							    
							    <div class="form-group col-md-4">
   									<label>Remote Job</label>
							
									<div class="checkbox-inline">
  									<label class="form-check-label form-control">
  									<input type="checkbox" id="remote" class="form-check-input" value="Yes">Yes
  									</label>
									</div>
									<div class="checkbox-inline">
 									 <label class="form-check-label form-control">
   									 <input type="checkbox" id="remote" class="form-check-input" value="No">No
 									 </label>
								</div>
							    
							  </div>
							<div class=clearfix></div>
								<div class="form-group col-sm-4">
									<textarea id="address" rows="4" cols="50" placeholder="Address" class="form-control"></textarea>
								</div>
							<div class="form-group  col-sm-4">
								   <input type="text" id="org_selectmem" name="org_selectmem" class="form-control"  disabled>
								</div>		
								
        						<div class="form-group  col-sm-4">
   									<select  id="jobtype" name="jobtype" class="form-control">
										<option selected disabled> -- Job Type --</option>
										<option  value="Individual">Individual</option>
										
									</select>
        						
							</div>
				                
							<div class=clearfix></div>
        <div class="form-group  col-sm-3">
			<input type="text" id="city" name="city" class="form-control"
										placeholder="City" required>
							
		</div>
		<div class="form-group  col-sm-3">
			<input type="text" id="state" name="state" class="form-control"
					placeholder="State" required>
		
		</div>
		
		<div class="form-group  col-sm-3">
           <select id="country" name="country" class="form-control">
              <option selected disabled >---Select Country---</option>
              
               <option value="USA">USA</option>
               <option value="UK">UK</option>
               <option value="UAE">UAE</option>
               <option value="INDIA">INDIA</option>
		</select>							
		</div>
        		<div class="form-group  col-sm-3">
			<input type="text" id="zip" name="zip" class="form-control"
					placeholder="Zip" required>
		
		</div>
        
							<div class=clearfix></div>
							
			<div class="form-group col-sm-12">
			    <textarea name="editor" id="editor" rows="10" cols="80">
    This is my textarea to be replaced with HTML editor.
    </textarea>
			
			</div>				
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default"  value="Cancel">
						<input type="submit" id="btn_add" class="btn btn-info" value="Add">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Edit Modal HTML -->
	<div id="editEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">Edit Employee</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<div class="form-group">
							<label>Name</label>
							<input type="text" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Email</label>
							<input type="email" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Address</label>
							<textarea class="form-control" required></textarea>
						</div>
						<div class="form-group">
							<label>Phone</label>
							<input type="text" class="form-control" required>
						</div>					
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
						<input type="submit" class="btn btn-info" value="Save">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Delete Modal HTML -->
	<div id="deleteEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">Delete Employee</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<p>Are you sure you want to delete these Records?</p>
						<p class="text-warning"><small>This action cannot be undone.</small></p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
						<input type="submit" class="btn btn-danger" value="Delete">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>                                		                            