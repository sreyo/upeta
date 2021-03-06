<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

<style><%@include file="/WEB-INF/css/dashstyle.css"%></style>
<script type="text/javascript"><%@include file="/WEB-INF/js/dashjs.js"%></script>


<title>DS JobPortal</title>
</head>
<body>
<nav class="navbar navbar-default navbar-static-top">
    <div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle navbar-toggle-sidebar collapsed">
			MENU
			</button>
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">
				Job DashBoard 
			</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">      
<!-- 			<form class="navbar-form navbar-left" method="GET" role="search">
				<div class="form-group">
					<input type="text" name="q" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button>
			</form>
 -->			<ul class="nav navbar-nav navbar-right">
<!-- 				<li><a href="#" target="_blank">Applicant</a></li>
 -->				<li class="dropdown ">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
						<%= session.getAttribute("name") %>

						<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
<!-- 							<li class="dropdown-header">Profile</li>
 --> 							<li><a href="${pageContext.request.contextPath}/profile.jsp">Profile</a></li>
							<li class=""><a href="${pageContext.request.contextPath}/resetpassword.jsp">Change Password</a></li>
<!--							<li class=""><a href="#">Other Link</a></li>
 -->							<li class="divider"></li>
							<li><a href="${pageContext.request.contextPath}/logout.jsp">Logout</a></li>
						</ul>
					</li>
				</ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>  	<div class="container-fluid main-container">
  		<div class="col-md-2 sidebar">
  			<div class="row">
	<!-- uncomment code for absolute positioning tweek see top comment in css -->
	<div class="absolute-wrapper"> </div>
	<!-- Menu -->
	<div class="side-menu">
		<nav class="navbar navbar-dark bg-dark" role="navigation">
			<!-- Main Menu -->
			<div class="side-menu-container">
				<ul class="nav navbar-nav">
   					 <li ><a href="${pageContext.request.contextPath}/profile.jsp"><span class="glyphicon glyphicon-user"></span> My Profile</a></li>
   					 <li><a href="${pageContext.request.contextPath}/search.jsp"><span class="glyphicon glyphicon-list"></span> Apply for Job </a></li>
                    <li ><a href="${pageContext.request.contextPath}/resumeupload.jsp"><span class="glyphicon glyphicon-user"></span> Upload Resume</a></li>
                    <li ><a href="${pageContext.request.contextPath}/Submanage.jsp"><span class="glyphicon glyphicon-dashboard"></span> Application Status</a></li>
                    
<!-- 					<li><a href="#"><span class="glyphicon glyphicon-cloud"></span> Payment </a></li>
 -->
<%-- 					<li class="panel panel-default" id="dropdown">
						<a data-toggle="collapse" href="${pageContext.request.contextPath}/jobapplied.jsp">
							<span class="glyphicon glyphicon-dashboard"></span> Application Status <span class="caret"></span>
						</a>
 --%>
						<!-- Dropdown level 1 -->
						<div id="dropdown-lvl1" class="panel-collapse collapse">
							<div class="panel-body">	
							
<%-- 								<ul class="nav navbar-nav">
									<li><a href="${pageContext.request.contextPath}/yoga.jsp"><span class="glyphicon glyphicon-cog"></span>Yoga</a></li>
									<li><a href="${pageContext.request.contextPath}/meditation.jsp"><span class="glyphicon glyphicon-cog"></span>Meditation</a></li>
                                 </ul>
 --%>                                 </div>
                                 </div>
					
					<!-- Dropdown-->
<!-- 					<li><a href="#"><span class="glyphicon glyphicon-list"></span> Family Members</a></li>
 -->
				</ul>
			</div><!-- /.navbar-collapse -->
		</nav>

	</div>
</div>  		</div>
  		<div class="col-md-10 content">
  			  <div class="panel panel-default">
	<div class="panel-heading">
		Dashboard
	</div>
	