<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SMART Job Board</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!------ Include the above in your HEAD tag ---------->
<script type="text/javascript">
$(document).ready(function(){
	$('.pass_show').append('<span class="ptxt">Show</span>');  
	});
	  

	$(document).on('click','.pass_show .ptxt', function(){ 

	$(this).text($(this).text() == "Show" ? "Hide" : "Show"); 

	$(this).prev().attr('type', function(index, attr){return attr == 'password' ? 'text' : 'password'; }); 

	});  </script>
</head>
<body>
	<div class="row">
	<form method="post" action="passwordServlet">
<!-- 		<div class="col-sm-6">
		    
		    <label>Current Password</label>
		    <div class="form-group "> 
                <input type="password" value="" class="form-control" placeholder="Current Password"> 
            </div> </div>
 -->            
            <div class="col-sm-6">
            
		    <label>New Password</label>
            <div class="form-group "> 
                <input type="password"  class="form-control" placeholder="New Password" name="password" id="password" data-rule-password="true" required> 
                
            </div> </div>		
            <div class="col-sm-6">
            
		    <label>Confirm Password</label>
            <div class="form-group "> 
            <input type="password"  name="password" id="password_confirm" data-rule-password="true" class="form-control" placeholder="Confirm Password" data-rule-equalTo="#password" required> 
            </div> </div>		
            <div class="col-sm-12">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
            <div class="form-group "> 
                <input type="submit" class="btn btn-info"value="Change Password" class="form-control" > 
            </div> 
            <div class="col-sm-4"></div>
          
           </div> 
		</div>  
		</form>
	</div>
</body>
</html>