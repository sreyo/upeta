<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SMART JobBoard</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<link rel="stylesheet" src="/WEB-INF/css/styles.css">

<style type="text/css">
  .modal-header {
    background-color: #5bc0de;
    color:white !important;
    text-align: center;
    font-size: 15px;
  }
  .modal-footer {
    background-color: #f9f9f9;
  }
  .modal-size{
  	height:10px;
  	font-size: 10px;
   }
   .modal-body {
    background-image: url(fill.jpg);
    background-repeat: no-repeat;
    background-size: 100% 100%;
    height: 400px;
}
   
</style>
<script>
$(document).ready(function(){
	
	$('#modalRegisterForm').on('loaded.bs.modal', function (e) {alert("hai");})

$("#btn-add").click(function() {
	 var host = $(location).attr('href') ;
	 var res = host.split("=");
     //$('#hostname').val(res[1]);
     $('#hostname').val("dev");

	   $("#seeker_form").validate({
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
		                digits: true
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
		            },

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
		 });


/* }) */;
	//getting current url 
	 var currLoc = $(location).attr('href'); 
	 var host = $(location).attr('href') ;
	 var res = host.split("=");
     //$('#hostname').val(res[1]);
     $('#hostname').val("dev");

	
// Add the following code if you want the name of the file appear on select
  $(".custom-file-input").on("change", function() {
   var fileName = $(this).val().split("\\").pop();
	 $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
   });

  $("#myBtn").click(function(){
    $("#myModal").modal();
   });
// form validation

 $("#btn-add1").click(function() {
 var image = $('input[type=file]').val().split('\\').pop();

 var gender   = $('#gender').val();
 var address  = $('#address').val();	
 var dob      = $('#dob').val();

 var data     = $("#seeker_form").serialize()+"&address=" +address +"&image=" +image +"&dob="  +dob;
/* alert(data);
 */
if(image!=""&fname!=""&& lname!="" && email!="" && phone!="" && city!=""&& state!=""&& country!=""&& zip!=""&& address!=""&& dob!=""&& gender!=""){
 
	$.ajax({
		url: "SeekerServlet",
		type: "POST",
		data: data,
        enctype:"multipart/form-data",
        processData : false,
        contentType : false,
		cache: false,
		success : function(data){
		if($.trim(data) == "success") {
			$('#modalRegisterForm').modal('hide');
/*             location.reload();						
 */		   	 alert("Registered Successfully");
			    
		}else{
			 alert("Something went wrong.");
		}
	}
 	});
 }else{
	alert('Please fill all the field !');
 };
 });
 

$("#btn_login").click(function() {
	 var user   = $('#usrname').val();
	 var pswd   = $('#psw').val();
	 var host   = $(location).attr('href') ;
	 var res = host.split("=");
   // $('#hostname').val("example");
   //  $.session.set("domain","example");
	 //var host = $(location).attr('host') ;
    $.ajax({
		url: "LoginServlet",
		type: "POST",
		data:{ usr:user, pasw:pswd, host: "dev" },
		cache: false,
		success : function(data){
		if($.trim(data) == "superadmin") {
	        window.location.replace("upetadmindashboard.jsp");
		}else if($.trim(data) == "admin") {
	        window.location.replace("clientdashboard.jsp");
		}else if($.trim(data) == "user") {
	        window.location.replace("userdashboard.jsp");
		}else if($.trim(data) == "index") {
/* 	        window.location.replace("index.jsp?domain="+res[1]);
 */         window.location.replace("index.jsp");   
        }else if($.trim(data) == "home") {
        	alert("Wrong username or password..Try again...");
	        window.location.replace("index.jsp");
        }
	  }
    });
 });
});
</script>

<!------ Include the above in your HEAD tag ---------->

</head>
<body>
	<div class="wrapper">
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navigation">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand text-uppercase" href="#">SMART JobBoard
				</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navigation">
				<ul class="nav navbar-nav navbar-right">
					<!--                 <li><a href="#">About</a></li>
               <li><a href="#">Features</a></li>
-->
			<!-- Trigger the modal with a button -->

			<li><button type="button" class="btn btn-success navbar-btn btn-info" id="myBtn">Sign in</button></li>
			</ul>
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog modal-sm ">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header modal-size" style="padding: 35px 35px;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4>
									<span class="glyphicon glyphicon-lock ">Login</span> 
								</h4>
							</div>
							<div class="modal-body" style="padding: 40px 50px;">
								<form role="form">
									<div class="form-group">
										<label for="usrname"><span
											class="glyphicon glyphicon-user"></span> Username</label> <input
											type="text" class="form-control" id="usrname"
											placeholder="Enter email">
									</div>
									<div class="form-group">
										<label for="psw"><span
											class="glyphicon glyphicon-eye-open"></span> Password</label> <input
											type="password" class="form-control" id="psw"
											placeholder="Enter password">
									</div>
									<div class="checkbox">
										<label><input type="checkbox" value="" checked>Remember
											me</label>
									</div>
									
									<input type="button" id="btn_login" class="btn btn-info btn-block" value="login">
								</form>
							</div>
							<div class="modal-footer">
								<!-- 			          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
-->
					          <p>Not a member? 	<a href="" class="btn btn-info btn-rounded mb-4 "
									data-toggle="modal" data-target="#modalRegisterForm">
									Sign UP </a>
</p>
							</div>
						</div>

					</div>
				</div>

			</div>
		</div>
	</nav>
	<header class="header">
		<div class="container">
			<div class="row">
				<div class="col-md-5 col-md-offset-1">
					<div class="content">
						<div class="pull-middle">
							<h1 class="page-header"></h1>
							<p class="lead">Find The Job That Fits Your Life</p>
							<div class="panel panel-default">
								<div class="panel-body">

									<!-------------------------------------------------  Registration Modal ------------------------------------------------------->

									<div class="modal fade" id="modalRegisterForm" tabindex="-1"
										role="dialog" aria-labelledby="myModalLabel"
										aria-hidden="true">
										<div class="modal-dialog modal-lg" role="document">

											<div class="modal-content">
											
											<form id="seeker_form" action="duptestservlet" method="post" enctype="multipart/form-data">
													<div class="modal-header text-center">
														<h4 class="modal-title w-100 font-weight-bold">Sign
															up SMART JobBoard</h4>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>



													<div class="modal-body mx-3">
														<div class="form-group col-sm-4">
															<input type="text" id="fname" name="fname"
																class="form-control" placeholder="FirstName" required>
														</div>
														<div class="form-group col-sm-4">
															<input type="text" id="lname" name="lname"
																class="form-control" placeholder="LastName" required>
														</div>
														<div class="form-group col-sm-4">
															<input type="email" id="email" name="email"
																class="form-control" placeholder="Email " required>
														
<!--    <input type="text" class="input-group form-control" placeholder="email" aria-label="email" aria-describedby="basic-addon2">
  <div class="input-group-append">
    <input type="button" class="input-group-text" id="emailchk" value="check">
  </div>
 --> 
 </div>
														<div class=clearfix></div>
														<div class="form-group  col-sm-4">
															<input type="phone" id="phone" name="phone"
																class="form-control" placeholder="Phone" required>
														</div>
														<div class="form-group col-sm-4">
															<input type="text" id="dob" name="dob" class=form-control
																placeholder="*Date of Birth"
																onfocus="(this.type='date')"
																onblur="(this.type='text')">
														</div>

														<div class="form-group col-md-4">

							    	<div class="form-check-inline">
 									<label class="form-check-label">
   									<input type="radio" class="form-check-input" name="gender" value="M">Male
  									</label>
  									<label class="form-check-label">
   									<input type="radio" class="form-check-input" name="gender" value="F">Female
  									</label>
									</div>

														</div>
														<div class=clearfix></div>
														<div class="form-group col-sm-6">
															<textarea id="address" name="address" rows="4" cols="50"
																placeholder="Street Address" class="form-control"></textarea>
														</div>
														<div class="form-group col-sm-6">
															<input type="text" id="city" name="city"
																class="form-control" placeholder="City" required>
														</div>

														<div class=clearfix></div>
														<div class="form-group  col-sm-4">
															<input type="text" id="state" name="state"
																class="form-control" placeholder="State" required>

														</div>
														<div class="form-group  col-sm-4">
															<input type="text" id="zip" name="zip"
																class="form-control" placeholder="Zip" required>

														</div>
														<div class="form-group  col-sm-4">
															<select id="country" name="country" class="form-control">
																<option value="1">---Select Country---</option>

																<option value="USA">USA</option>
																<option value="UK">UK</option>
																<option value="UAE">UAE</option>
																<option value="INDIA">INDIA</option>
															</select>
														</div>
														<div class=clearfix></div>
														 	<div class="form-group col-sm-12">
														 	<input type="hidden" id="hostname" name="hostname" class="form-control" ></div>

														<div class="form-group col-sm-12">
														
							<input  class="custom-file-input form-control" type="file" id="upload" name="upload" accept="file_extension " />
														
														</div>
													</div>

													<div class="modal-footer d-flex justify-content-center">
												<input type="submit" id="btn-add" class="btn btn-info" value="Sign up">
												
													</div>
												</form>
 </div>
</div>
</div>

				       <span class="input-group-btn">
							<div class="input-group">

								<a href="" class="btn btn-info btn-rounded mb-4 "
									data-toggle="modal" data-target="#modalRegisterForm">
									Sign UP SMART JobBoard </a>
						</span>
					</div>
					<!-------------------------------------------------------- End Modal ------------------------------------------------------->

					<!--                             <form action="#" role="form">
                                   <input type="email" class="form-control" placeholder="Email Address" required>
                                   <span class="input-group-btn">
                                     <button class="btn btn-success btn-circle" type="submit">Sign up</button>
                                   </span>                        
                               </div>
                           </form>
-->
                           </form>

							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4 col-md-offset-1 text-center mt-100 mb-100">
				<div class="phone">
					<img class="img-responsive img-rounded" src="image_2.jpg">
				</div>
			</div>
		</div>
</div>
</header>
<section class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-1 text-center mt-100 mb-100">
				<div class="phone">
					<img class="img-responsive img-rounded" src="image_7.jpg">
				</div>
			</div>
			<div class="col-md-5 col-md-offset-1">
				<div class="content">
					<div class="pull-middle">
						<h2 class="lead">Most Versatile Job Board Theme Ever!</h2>
						<ul class="media-list">
							<li class="media"><a class="media-left" href="#"> <span
									class="text-success"></span>
							</a>
								<div class="media-body">
					  <span class="input-group-btn">
							<div class="input-group">

								<a href="${pageContext.request.contextPath}/Searchopening.jsp" class="btn btn-info btn-rounded mb-4">
									Search Job</a>
						</span>
					</div>
					</div></li>
				<li class="media"><a class="media-left" href="#"> <span
						class="glyphicon glyphicon-lock icon text-success"></span>
				</a>
					<div class="media-body">
						<!--                                   <h3 class="media-heading">Cras consequat est et elit.</h3>
-->
						<p>Integer suscipit massa at tellus semper, at aliquam
							ante bibendum.</p>
					</div></li>
				<li class="media"><a class="media-left" href="#"> <span
						class="glyphicon glyphicon-user icon text-success"></span>
				</a>
					<div class="media-body">
						<!--                                   <h3 class="media-heading">Aenean vel enim quis dui blandit.</h3>
-->
										<p>Maecenas vitae ex iaculis, efficitur est eu, fermentum
											quam.</p>
									</div></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-3 text-right">
					<div class="content">
						<div class="pull-middle">
							<h4>
								<strong>Describe your product.</strong>
							</h4>
							<p>Proin sapien neque, consequat ac tempus aliquam, gravida
								in urna. Phasellus et lectus in odio imperdiet tempus. Aenean
								posuere, nunc a tristique imperdiet, massa dolor dictum eros,
								sit amet tempor turpis turpis vel tortor.</p>
							<small>Phasellus feugiat at lorem a tincidunt. Nam
								hendrerit leo vitae orci pellentesque, nec euismod dolor
								condimentum.</small>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-md-offset-1 mt-100 mb-100">
					<div class="phone">
						<img class="img-responsive img-rounded" src="image_4.jpg">
					</div>
				</div>
				<div class="col-md-3 col-md-offset-1">
					<div class="content">
						<div class="pull-middle">
							<h4>
								<strong>Even more stuff.</strong>
							</h4>
							<p>Proin sapien neque, consequat ac tempus aliquam, gravida
								in urna. Phasellus et lectus in odio imperdiet tempus. Aenean
								posuere, nunc a tristique imperdiet, massa dolor dictum eros,
								sit amet tempor turpis turpis vel tortor.</p>
							<a class="btn btn-success btn-info" href="#">Sign up for free</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer class="footer text-center">
		<div class="container">
			<small>© Copyright 2020. Crafted with love by <a href="#">@Sreyo.com</a></small>
		</div>
	</footer>
	</div>
</body>
</html>