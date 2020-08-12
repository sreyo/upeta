<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
<!-- 	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 --><!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 -->	<script src="http://cdnjs.cloudflare.com/ajax/libs/tinymce/4.5.6/jquery.tinymce.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/4.5.6/tinymce.min.js"></script>
	<script type="text/javascript">
$(document).ready(function(){
	 var host   = $(location).attr('href') ;
	 var res = host.split("=");
	 res[1] = "dev";
     alert(host);
 	$('#hostname').val(res[1]);

	tinymce.init({
	    selector: '#editor'
	});
	$('#user_form').submit(function(){
		$(this).find(':submit').attr( 'disabled','disabled' );
		});
/* 	   $("#user_form").validate({
		      rules: {
		          fname: { minlength: 3,
		                   required: true
				  },
		          lname: {required: true},
		          email: {
		             required: true,
		             email: true,//add an email rule that will ensure the value entered is valid email id.
		             maxlength: 255,
		          },
		          phone: {
		                required: true,
		                minlength: 10,
		                maxlength: 13,
		                number: true
		            },
		          address: {
		                required: true,
		                minlength: 10,
		            },


		       },        highlight: function(element) {
		            $(element).closest('.form-group').addClass('has-error');
		        },
		        unhighlight: function(element) {
		            $(element).closest('.form-group').removeClass('has-error');
		        },
		        errorElement: 'span',
		        errorClass: 'help-block',
		        errorPlacement: function(error, element) {
		            if(element.parent('.input-group').length) {
		                error.insertAfter(element.parent());
		            } else {
		                error.insertAfter(element);
		            }},

		       messages: {
		    	    fname: 'This field is required',
		    	    lname: 'This field is required',
		    	    email: 'Enter a valid email',
		    	    phone: 'Enter valid phone number'
		     },
		        submitHandler: function(form) {
		            form.submit();
		        }

		    });

 */
 });
</script>	
	
</head>
<body>
    <div class="row">
						<form id="seeker_form" action="duptestservlet" method="post"
							enctype="multipart/form-data">
							<div class="modal-header text-center">
								<h4 class="modal-title w-100 font-weight-bold">Add  Candidate</h4>
							</div>



							<div class="modal-body mx-3">
								<div class="form-group col-sm-4">
									<input type="text" id="fname" name="fname" class="form-control"
										placeholder="FirstName" required>
								</div>
								<div class="form-group col-sm-4">
									<input type="text" id="lname" name="lname" class="form-control"
										placeholder="LastName" required>
								</div>
								<div class="form-group col-sm-4">
									<input type="email" id="email" name="email"
										class="form-control" placeholder="Email " required>
								</div>
								<div class=clearfix></div>
								<div class="form-group  col-sm-4">
									<input type="tel" id="phone" name="phone" class="form-control"
										placeholder="Phone format[0000-000000]"
										pattern="[0-9]{4}-[0-9]{6}" required>
								</div>
								<div class="form-group col-sm-4">
									<input type="date" id="dob" name="dob" class=form-control
										placeholder="*Date of Birth" onfocus="(this.type='date')"
										onblur="(this.type='text')" required>
								</div>

								<div class="form-group col-md-4">

									<div class="form-check-inline">
										<label class="form-check-label"> <input type="radio"
											class="form-check-input" name="gender" value="M" required>Male
										</label> <label class="form-check-label"> <input type="radio"
											class="form-check-input" name="gender" value="F" required>Female
										</label>
									</div>

								</div>
								<div class=clearfix></div>
								<div class="form-group col-sm-6">
									<textarea id="address" name="address" rows="4" cols="50"
										placeholder="Street Address" class="form-control" required></textarea>
								</div>
								<div class="form-group col-sm-6">
									<input type="text" id="city" name="city" class="form-control"
										placeholder="City" required>
								</div>

								<div class=clearfix></div>
								<div class="form-group  col-sm-4">
									<input type="text" id="state" name="state" class="form-control"
										placeholder="State" required>

								</div>
								<div class="form-group  col-sm-4">
									<input type="number" id="zip" name="zip" class="form-control"
										placeholder="Zip" required>

								</div>
								<div class="form-group  col-sm-4">
									<select id="country" name="country" class="form-control"
										required>
										<option value="1">---Select Country---</option>

										<option value="USA">USA</option>
										<option value="UK">UK</option>
										<option value="UAE">UAE</option>
										<option value="INDIA">INDIA</option>
									</select>
								</div>
								<div class=clearfix></div>
								<div class="form-group col-sm-12">
									<input type="hidden" id="hostname" name="hostname"
										class="form-control">
								</div>

								<div class="form-group col-sm-12">

									<input class="custom-file-input form-control" type="file"
										id="upload" name="upload" accept="file_extension " />

								</div>
							</div>

							<div class="modal-footer d-flex justify-content-center">
								<input type="submit" id="btn-add" class="btn btn-info"
									value="Add">

							</div>
						</form>
				</form>
				
			</div>
	</body>
</html>
