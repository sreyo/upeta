<html>
<head>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
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
	
// Add the following code if you want the name of the file appear on select
  $(".custom-file-input").on("change", function() {
   var fileName = $(this).val().split("\\").pop();
	 $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});

  $("#myBtn").click(function(){
    $("#myModal").modal();
  });

$("#btn-add").click(function() {
$('input[type="file"]').change(function(e){
    var upload = e.target.files[0].name;
});
var address  = $('#address').val();	
var image    = $('[name=filename]').val();

var data     = $("#seeker_form").serialize()+"&address=" +address +"&image=" +image;alert(data);

/*     var gender   = $('#gender').val();
    var address  = $('#address').val();	
    var dob      = $('#dob').val();
    var data     = $("#member_form").serialize() +"&address=" +address +"&dob="  +dob;
	if(fname!=""&& lname!="" && email!="" && phone!="" && city!=""&& state!=""&& country!=""&& zip!=""&& address!=""&& dob!=""&& gender!=""){

 	$.ajax({
		url: "AddmemServlet",
		type: "POST",
		data: data ,		
		cache: false,
		success : function(data){
		  if($.trim(data) == "success") {
			    alert("Registered Successfully");
			    
				location.href="http://localhost:8080/upeta/login.jsp";

		}else{
			 alert("Something went wrong.");
		}
	}
 	});
 }else{
	alert('Please fill all the field !');
};*/
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

					<li><button type="button"
							class="btn btn-success navbar-btn btn-info" id="myBtn">Sign
							in</button></li>

				</ul>
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog modal-sm ">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header modal-size" style="padding: 35px 35px;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4>
									<span class="glyphicon glyphicon-lock "></span> Login
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
											type="text" class="form-control" id="psw"
											placeholder="Enter password">
									</div>
									<div class="checkbox">
										<label><input type="checkbox" value="" checked>Remember
											me</label>
									</div>
									<button type="submit" class="btn btn-info btn-block">
										<span class="glyphicon glyphicon-off"></span> Login
									</button>
								</form>
							</div>
							<div class="modal-footer">
								<!-- 			          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
-->
								<!-- 			          <p>Not a member? <a href="#">Sign Up</a></p>
		          <p>Forgot <a href="#">Password?</a></p>
-->
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
												<form id="seeker_form">

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
														</div>
														<div class=clearfix></div>
														<div class="form-group  col-sm-4">
															<input type="phone" id="phone" name="phone"
																class="form-control" placeholder="Phone" required>
														</div>
														<div class="form-group col-sm-4">
															<input type="text" id="dob" class=form-control
																placeholder="*Date of Birth"
																onfocus="(this.type='date')"
																onblur="(this.type='text')">
														</div>

														<div class="form-group col-md-4">
															<label>Gender</label>

															<div class="checkbox-inline">
																<label class="form-check-label"> <input
																	type="checkbox" id="gender" class=" form-check-input"
																	value="M">Male
																</label>
															</div>
															<div class="checkbox-inline">
																<label class="form-check-label"> <input
																	type="checkbox" id="gender" class="form-check-input"
																	value="F">Female
																</label>
															</div>

														</div>
														<div class=clearfix></div>
														<div class="form-group col-sm-6">
															<textarea id="address" rows="4" cols="50"
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
															<input type="file"
																class="custom-file-input form-control" id="customFile"
																name="filename">
														</div>
													</div>

													<div class="modal-footer d-flex justify-content-center">
														<button id="btn-add" class="btn btn-info">Sign up</button>
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
									class="glyphicon glyphicon-cloud icon text-success"></span>
							</a>
								<div class="media-body">
									<!--                                   <h3 class="media-heading">Praesent porttitor urna ut enim.</h3>
-->
						<p>Maecenas vitae ex iaculis, efficitur est eu, fermentum
							quam.</p>
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