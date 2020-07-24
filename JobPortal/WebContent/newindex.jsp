<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
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
   
 
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
  <script>
  $(document).ready(function(){
		
	  $("#btn-add").click(function(e) {
	  	 var host = $(location).attr('href') ;
	  	 var res = host.split("=");
	      // $('#hostname').val(res[1]);
	       $('#hostname').val("dev");
	  		 });


	  	//getting current url 
	  	 var currLoc = $(location).attr('href'); 
	  	 var host = $(location).attr('href') ;
	  	 var res = host.split("=");
	     //  $('#hostname').val(res[1]);
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

</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <!-- <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">Products</a></li>
        <li><a href="#">Deals</a></li>
        <li><a href="#">Stores</a></li>
        <li><a href="#">Contact</a></li>
      </ul>-->
      <ul class="nav navbar-nav navbar-right">
			<li><button type="button" class="btn btn-success navbar-btn btn-info" id="myBtn">Sign in</button></li>
      </ul>
    </div>
   </div>
</nav>

<div class="container">    
  <div class="row">
    <div class="col-sm-6">
      <div class="panel panel-primary">
        <div class="panel-heading">Search for Your Next Job:</div>
        <div class="panel-body">
        							<div class="input-group">

								<a href="${pageContext.request.contextPath}/Searchopening.jsp" class="btn btn-info btn-rounded mb-4">
									Search Job</a>
        </div>
        <img src="image_2.jpg" class="img-rounded img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
    <div class="col-sm-6"> 
      <div class="panel panel-danger">
        <div class="panel-heading">Hire a Talent  or Post a Job</div>
        <div class="panel-body">
        <div class="input-group">

		<a href="" class="btn btn-info btn-rounded mb-4 "
									data-toggle="modal" data-target="#modalRegisterForm">
									Sign UP SMART JobBoard </a>
        </div>
        <img src="image_2.jpg" class="img-rounded img-responsive"  style="width:100%" alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>

<footer class="container-fluid text-center">
  <p>			<small>© Copyright 2020. <a href="#">UPETA.com</a></small>
</p>  
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Terms</a></li>
        <li><a href="#">Disclaimer</a></li>
        <li><a href="#">Privacy policy</a></li>
        <li><a href="#">About us</a></li>
        <li><a href="#">Contact us</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      </ul>
    </div>
   </div>
</nav>
</footer>
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
					          <p>Not a member? 	<a href="" class="btn btn-info btn-rounded mb-4 "
									data-toggle="modal" data-target="#modalRegisterForm">
									Sign UP </a>
</p>
							</div>
						</div>

					</div>
				</div>
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
 														</div>
														<div class=clearfix></div>
														<div class="form-group  col-sm-4">
															<input type="tel" id="phone" name="phone"
																class="form-control" placeholder="Phone format[0000-000000]" pattern="[0-9]{4}-[0-9]{6}" required>
														</div>
														<div class="form-group col-sm-4">
															<input type="date" id="dob" name="dob" class=form-control
																placeholder="*Date of Birth"
																onfocus="(this.type='date')"
																onblur="(this.type='text')" required>
														</div>

														<div class="form-group col-md-4">

							    	<div class="form-check-inline">
 									<label class="form-check-label">
   									<input type="radio" class="form-check-input" name="gender" value="M" required>Male
  									</label>
  									<label class="form-check-label">
   									<input type="radio" class="form-check-input" name="gender" value="F" required>Female
  									</label>
									</div>

														</div>
														<div class=clearfix></div>
														<div class="form-group col-sm-6">
															<textarea id="address" name="address" rows="4" cols="50"
																placeholder="Street Address" class="form-control" required></textarea>
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
															<input type="number" id="zip" name="zip"
																class="form-control" placeholder="Zip" required>

														</div>
														<div class="form-group  col-sm-4">
															<select id="country" name="country" class="form-control" required>
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

<!-- 				       <span class="input-group-btn">
							<div class="input-group">

								<a href="" class="btn btn-info btn-rounded mb-4 "
									data-toggle="modal" data-target="#modalRegisterForm">
									Sign UP SMART JobBoard </a>
						</span>
 -->					</div>
<!-------------------------------------------------------- End Modal ------------------------------------------------------->

</body>
</html>
