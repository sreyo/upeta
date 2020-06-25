<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/4.5.6/tinymce.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/tinymce/4.5.6/jquery.tinymce.min.js"></script>
   

<script type="text/javascript">
$(document).ready(function(){
	tinymce.init({
	    selector: '#editor'
	});
	$('#addjobform').submit(function(){
		$(this).find(':submit').attr( 'disabled','disabled' );
		});
});

$(document).on('click','.update',function(e) {
	var jobcode=$(this).attr("data-id");
	var jobtitle = $(this).attr("data-jobtitle");
    var jobtype = $(this).attr("data-jobtype");
    var jobstatus =  $(this).attr("data-jobstatus");	
	var remotejob=$(this).attr("data-remotejob");
	var email=$(this).attr("data-email");
	var phone=$(this).attr("data-phone");
	var city=$(this).attr("data-city");
    var address=$(this).attr("data-address");
 	var gender = $(this).attr("data-gender");
    var state = $(this).attr("data-state");
    var country = $(this).attr("data-country");
    var zip = $(this).attr("data-zip");
    var editor = $(this).attr("data-editor");


	   $('#id').val(jobcode);
	   $('#jobtitle').val(jobtitle);
	   $('#jobtype').val(jobtype);
	   $('#jobstatus').val(jobstatus);
	   $('#remotejob').val(remotejob);
	   $('#email').val(email);
	   $('#phone').val(phone);
	   $('#address').val(address);
	   $('#username').val(username);
	   $('#city').val(city);
	   $('#state').val(state);
	   $('#zip').val(zip);
	   $("[name=gender]").val([gender]);
	   $('[name=country]').val(country);
	   $("[name=jobtype]").val([jobtype]);
	   $('#jobtype').val(jobtype).attr("selected", "selected");

 
 });

$(document).on('click','#update',function(e) {
	tinymce.activeEditor.setContent(editor);

	var data = $("#update_form").serialize();
	$.ajax({
		data: data,
		type: "post",
		url: "UpdatejobpostServlet",
		success: function(dataResult){
				var dataResult = JSON.parse(dataResult);
				if(dataResult.statusCode==200){
					$('#editEmployeeModal').modal('hide');
					alert('Data updated successfully !'); 
                    location.reload();						
				}
				else if(dataResult.statusCode==201){
				   alert(dataResult);
				}
		}
	});
});



$(document).on("click", ".delete", function() { 
	
	var id=$(this).attr("data-id");
	$('#id_d').val(id);
	
	
});

$(document).on("click", "#delete", function() { 
	$.ajax({
		url: "DeljobServlet",
		type: "GET",
		cache: false,
		data:{
			id: $("#id_d").val()
		},
		success: function(data){alert(data);
		if($.trim(data) == "success") {
				$('#deleteJobModal').modal('hide');
				$("#"+data).remove();
                location.reload();						
		}

		
		}
	});
});
$( window ).load(function() {
	var myVariable;
    var sesid = $('#idses').val();	
	$.ajax({
		url: "ViewjobServlet",
		data:{ sesid : sesid },
		type: "POST",
		cache: false,
		success: function(dataResult){ 
		var data = JSON.parse(JSON.stringify(dataResult)); alert(JSON.stringify(dataResult)); 
		var len = data.length;
		for (var i = 0; i < len; i++) {
 			   var id = data[i].jobcode;
	   	       var name  = data[i].name;
	   	       var email = data[i].email;
			   var jobtitle = data[i].jobtitle;
			   var remotejob = data[i].remotejob;
			   var jobtype = data[i].jobtype;
			   var jobstatus = data[i].jobstatus;
			   var gender = data[i].gender;
			   var jobdesc = data[i].editor;
			   var city = data[i].city;
			   var state = data[i].state;
			   var country = data[i].country;
			   var phone = data[i].phone;
			   var num = data[i].count;
var view ='<a href="#viewJobModal" class="view" data-id='+id+' data-toggle="modal"><i class="glyphicon glyphicon-eye-open" data-toggle="tooltip"  title="View"></i></a></td>';        
var notf = '<td><a href="#" class="badge badge-pill badge-info"><div id="stage"></div> Applied -  '+num+'</a></td></tr>';
var del='<a href="#deleteJobModal" class="delete" data-id='+id+' data-toggle="modal"><i class="glyphicon glyphicon-remove-sign" data-toggle="tooltip"  title="Delete"></i></a>';
$('#table').append('<tr><td>'+id+'</td><td>'+jobtitle+'</td><td>'+jobtype+'</td><td>'+city+','+state+'</td><td>'+remotejob+'</td><td>'+jobstatus+'</td><td><a href="#editJobModal" class="edit" data-toggle="modal"><i class="update glyphicon glyphicon-edit" data-toggle="tooltip" data-id="'+id+'" data-name="'+name+'" data-address="'+address+'"   data-email="'+email+'" data-remotejob="'+remotejob +'"data-jobtitle="'+jobtitle+'" data-jobtype="'+jobtype+'"   data-phone="'+phone+'" data-city="'+city+'" data-address="'+address+'" data-gender="'+gender+'" data-state="'+state+'" data-country="'+country+'" data-zip="'+zip+'"  title="Edit"></i></a>||'+del+'||'+view+'||'+notf);
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
                    <div class="col-sm-12" align="center">
						<h4> <b>Job List</b></h4>
					</div>
                </div>
            </div>
 	<input type="hidden" id="idses"	value="<%= session.getAttribute("name") %>">
 
 		<table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Job ID</th>
                        <th>Job Title</th>
						<th>Job Type</th>
						<th>Location</th>
                        <th>Remote</th>
                        <th>Status</th>
                        
                        <th>Action</th>
                        <th>Applicant</th>
                        
                    </tr>
                </thead>
                <tbody id="table">
                <tr>
                </tr>
                </tbody>
            </table>
			<div class="clearfix">
        </div>
    </div>
<!-- Edit Modal HTML -->
  <div class="modal fade" id="editJobModal" data-backdrop="false"
tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
 
<!-- 	<div id="editJobModal" class="modal fade">
 -->		<div class="modal-dialog">
			<div class="modal-content">
				<form id="update_form">
					<div class="modal-header">						
						<h4 class="modal-title">Edit Job Details</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
			<div class="form-group col-sm-4" >
				<input type="text" id="jobtitle" name="jobtitle" class="form-control" placeholder="Job Title"  value=" " required>
			</div>
			<div class="form-group col-sm-4">
	           <select id="jobtype" name="jobtype" class="form-control">
	              <option value="">------JobType---</option>
	              <option value="Permanent">FullTime</option>
	              <option value="Contract">Contract</option>
	              <option value="Other">other</option>
			 </select>							
			</div>
				<div class="form-group col-sm-4">
				    <input type="email" id="email" name="email" class="form-control" val=""  placeholder="Email " required>
			    </div>
			    <div class=clearfix></div>
			    <div class="form-group  col-sm-4">
				   <input type="phone" id="phone" name="phone" class="form-control" placeholder="Phone" val="" required>
				</div>		
			    
			    <div class="form-group col-md-8">
				<label>Remote Job</label>
			
					<div class="checkbox-inline">
							<input type="radio" id="remote" name="remote" class="form-check-input" value="Yes">Yes
					</div>
					<div class="checkbox-inline">
								 <input type="radio" id="remote" name="remote" class="form-check-input" value="No">No
				</div>
			    
			  </div>
			<div class=clearfix></div>
				<div class="form-group col-sm-4">
					<textarea id="address" rows="4" cols="50" placeholder="Address" class="form-control" val=""></textarea>
				</div>
			<div class="form-group  col-sm-4">
				   <input type="text" id="org_selectmem" name="org_selectmem" class="form-control"  disabled>
				</div>		
				
    						<div class="form-group  col-sm-4">
    						
								<select  id="jobstatus" name="jobstatus" class="form-control">
						<option value="" > ---Status---</option>
						<option  value="Active">Active</option>
						<option  value="Hold">Hold</option>
						<option  value="Close">Close</option>
						
						
					</select>
    						
			</div>
                
		<div class=clearfix></div>
        <div class="form-group  col-sm-3">
		<input type="text" id="city" name="city" class="form-control" placeholder="City" val="" required>
		</div>
		<div class="form-group  col-sm-3">
			<input type="text" id="state" name="state" class="form-control"	placeholder="State" val="" required>
		</div>
		
		<div class="form-group  col-sm-3">
           <select id="country" name="country" class="form-control">
              <option selected disabled >---Country---</option>
              
               <option value="USA">USA</option>
               <option value="UK">UK</option>
               <option value="UAE">UAE</option>
               <option value="INDIA">INDIA</option>
		</select>							
		</div>
        		<div class="form-group  col-sm-3">
			<input type="text" id="zip" name="zip" class="form-control" val=""
					placeholder="Zip" required>
		
		</div>
        
							<div class=clearfix></div>
							
			<div class=" col-sm-12">
			
			    <textarea class="tinymce" id="editor" rows="10" cols="80">
    </textarea>
			
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
	  <div class="modal fade" id="deleteJobModal" data-backdrop="false"
tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	
		<div class="modal-dialog ">
			<div class="modal-content">
				<form>

					<div class="modal-header">
						<h4 class="modal-title">Delete User</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="close">&times;</button>
					</div>
					<div class="modal-body">
						<input type="hidden" id="id_d" name="id" class="form-control">
						<p>Are you sure you want to delete these Records?</p>
						<p class="text-warning">
							<small>This action cannot be undone.</small>
						</p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel">
						<button type="button" class="btn btn-danger" id="delete">Delete</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>                                		                            