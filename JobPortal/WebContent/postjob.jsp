<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>User Data</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/tinymce/4.5.6/jquery.tinymce.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/4.5.6/tinymce.min.js"></script>
	<script type="text/javascript">
$(document).ready(function(){
	tinymce.init({
	    selector: '#editor'
	});
	$('#user_form').submit(function(){
		$(this).find(':submit').attr( 'disabled','disabled' );
		});
});
</script>	
	
</head>
<body>
    <div class="row">
				<form id="user_form" method="post" action="AddjobServlet">
					<div class="modal-header">						
						<h4 class="modal-title">Post a Job</h4>
					</div>
					<div class="modal-body">					
			<div class="form-group col-sm-4" >
				<input type="text" id="jobtitle" name="jobtitle" class="form-control" placeholder="Job Title" required>
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
							<input type="radio" id="remote" name="remote" class="form-check-input" value="Yes">Yes
							</label>
					</div>
					<div class="checkbox-inline">
						 <label class="form-check-label form-control">
								 <input type="radio" id="remote" name="remote" class="form-check-input" value="No">No
						 </label>
				</div>
			    
			  </div>
			<div class=clearfix></div>
				<div class="form-group col-sm-4">
					<textarea id="address" rows="4" cols="50" placeholder="Address" class="form-control"></textarea>
				</div>
			<div class="form-group  col-sm-4">
<!-- 				   <input type="text" id="org_selectmem" name="org_selectmem" class="form-control"  disabled>
 -->				</div>		
				
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
		<input type="text" id="city" name="city" class="form-control" placeholder="City" required>
		</div>
		<div class="form-group  col-sm-3">
			<input type="text" id="state" name="state" class="form-control"	placeholder="State" required>
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
			<input type="text" id="zip" name="zip" class="form-control"
					placeholder="Zip" required>
		
		</div>
        
							<div class=clearfix></div>
							
			<div class=" col-sm-12">
		<textarea class="tinymce" id="editor" name="editor"></textarea>
 			
<!-- 			    <textarea class="tinymce" id="editor" rows="10" cols="">
    </textarea> -->
			
					</div>
					<div class="modal-footer">
					    <input type="hidden" value="1" name="type">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
						<button type="submit" form="user_form" class="btn btn-info"  value="Submit" id="btn-add">Add</button>
					</div>
				</form>
				
			</div>
		</div>
	</div>
	</body>
</html>
