<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<script type="text/javascript">

$(document).ready(function() {

    var userid = $('#userid').val();
		$.ajax({
			url: "ViewuserServlet",
			data:{ userid : userid },
			type: "GET",
			cache: false,
			success: function(dataResult){ 
				var data = JSON.parse(JSON.stringify(dataResult));
				
			    var len = data.length;
			    for (var i = 0; i < len; i++) {
				   var applicantid = data[i].applicantid;
				   var firstname  = data[i].firstname;
				   var lastname  = data[i].lastname;
				   var email = data[i].email;
				   var phone = data[i].phone;
				   var gender = data[i].gender;
				   var address = data[i].address;
				   var username = data[i].username;
                   var city = data[i].city;
                   var state = data[i].state;
                   var country = data[i].country;
                   var zip = data[i].zip;
				 
        		   $('#appid').val(applicantid);
        		   $('#fname').val(firstname);
        		   $('#lname').val(lastname);
        		   $('#email').val(email);
        		   $('#phone').val(phone);
        		   $('#address').val(address);
        		   $('#username').val(username);
        		   $('#city').val(city);
        		   $('#state').val(state);
        		   $('#zip').val(zip);
        		   $("[name=gender]").val([gender]);
        		   $('[name=country]').val(country);

			    }
	      }
			
		});
		
	});
	 $(document).on('click','#update',function(e) {

		 
		 
		var appid   = $("#appid").val();
		var fname   = $("#fname").val();
		var lname   = $("#lname").val();
		var email   = $("#email").val();
		var phone   = $("#phone").val();
		var address = $("#address").val();
		var city    = $("#city").val();
		var state   = $("#state").val();
		var zip     = $("#zip").val();
		var gender  = $("#gender").val();
		var country = $("#country").val();
        var appid   = $('#appid').val();


		
		var data = $("#update_form").serialize() ;
		$.ajax({
			data: data,
			type: "GET",
			cache:false,
			url: "UpdateuserServlet",
			success: function(data){
				  if($.trim(data) == "success") {
						alert('Data updated successfully !'); 
					    location.reload();

				}else{
					 alert("Something went wrong.");
				}
		           
					
			}
		});
	}); 


	
	

</script>
  <div class="card bg-info text-info">

<div class="container-fluid">
<form id="update_form">
	<div class="row">
	         <div class="form-group col-sm-4" ></div>
	
        <div class="form-group col-sm-4" >         
        </div>           
         <div class="form-group col-sm-4" ></div>
         </div>

	<div class="row">
	         <div class="form-group col-sm-4" ></div>
	
        <div class="form-group col-sm-4" >         
          <input type="text" id="appid" name="appid" class="form-control" placeholder="Applicant" readonly required>
        </div>           
         <div class="form-group col-sm-4" ></div>
         </div>
         <div class="row">
         
        <div class="form-group col-sm-4" >
           <input type="text" id="fname" name="fname" class="form-control" placeholder="FirstName" required>
        
        </div>
        <div class="form-group col-sm-4" >
			<input type="text" id="lname" name="lname" class="form-control" placeholder="Lastname" required>
        </div>
        <div class="form-group col-sm-4" >
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
        
        </div>
        <div class="clearfix"></div>
        
<!--         <div class="form-group col-sm-6" >
            <input type="password" class="form-control" id="password" placeholder="Confirm Password">
        </div>
        <div class="clearfix"></div>
 -->           
          <div class="form-group col-sm-4" >
			<label class="radio-inline"><input type="radio" name="gender" value="M" >Male</label>
			<label class="radio-inline"><input type="radio" name="gender" value="F">Female</label>
			</div>    
		 <div class=" form-group col-sm-4 ">
            <input class="form-control" type="phone" value="" id="phone" name = "phone" placeholder="Phone ">
        </div>
                   <div class="form-group col-sm-4" >
                 <input type="text" class="form-control" id="username" placeholder="Username"  name="username"disabled>
        
        </div>
         <div class="clearfix"></div>
           
       	 <div class="form-group col-sm-4">
            <input type="hidden" id="userid" name="userid" value="<%= session.getAttribute("name") %>">
		    <textarea class="form-control" id=address name="address" rows="3">Address</textarea>
  		</div>
        
        <div class="form-group  col-sm-4">
			<input type="text" id="city" name="city" class="form-control"	placeholder="City" required>
		</div>
		<div class="form-group  col-sm-4">
			<input type="text" id="state" name="state" class="form-control"
					placeholder="State" required>
		
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
        		<div class="form-group  col-sm-4">
			<input type="text" id="zip" name="zip" class="form-control"
					placeholder="Zip" required>
		
		</div>
        
        <div class="form-group col-sm-4" >
        </div>
         <div class="form-group col-sm-4" >
        </div>
        <div class="form-group col-sm-4" >
        </div>
        <div class="form-group col-sm-6" >
        </div>
        <div class="form-group col-sm-6" >
            <input type="button" class="btn btn-info" id="update" value="Update"/>
        </div>

    <br /><br />
	</div>
	</form>
</div>
</div>
</body>
</html>




