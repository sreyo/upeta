<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search for Jobs</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style type="text/css">
/*search box css start here*/
.search-sec{
    padding: 2rem;
}
.search-slt{
    display: block;
    width: 100%;
    font-size: 0.875rem;
    line-height: 1.5;
    color: #55595c;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    height: calc(3rem + 2px) !important;
    border-radius:0;
}
.wrn-btn{
    width: 100%;
    font-size: 16px;
    font-weight: 400;
    text-transform: capitalize;
    height: calc(3rem + 2px) !important;
    border-radius:0;
}
@media (min-width: 992px){
    .search-sec{
        position: relative;
        top: -114px;
        background: rgba(26, 70, 104, 0.51);
    }
}

@media (max-width: 992px){
    .search-sec{
        background: #1A4668;
    }
    
}</style>
<script type="text/javascript">
$(document).on('click','#search',function() {
	    var job   = $('#job').val();
	    var place   = $('#place').val();
		 var host   = $(location).attr('href') ;
		 var res = host.split("=");
	    alert(host);
		$.ajax({
			url: "SearchopenServlet",
			data:{ job : job,place : place, host : res[1] },
			type: "GET",
			cache: false,
			success: function(dataResult){ 
				if(dataResult!=''){
				var data = JSON.parse(JSON.stringify(dataResult));
			    var len = data.length;
     		   $("#table").empty();

			    for (var i = 0; i < len; i++) {
				   var id = data[i].id;
				   var jobcode = data[i].jobcode;
				   var jobtitle  = data[i].jobtitle;
				   var jobtype  = data[i].jobtype;
				   var city = data[i].city;
				   var remotejob = data[i].remotejob;
				   $('#table').append('<tr><td>'+jobcode+'</td><td>'+jobtitle+'</td><td>'+jobtype+'</td><td>'+city+'</td><td>'+remotejob+'</td><button class="btn glyphicon glyphicon-check" data-toggle="tooltip" data-id="'+id+'"  title="Approve"></button></td></tr>');

			    }
	      }else{
			  $("#table").empty();
	    	  $('#table').append('<tr><td>'+"No Job "+'</td></tr>');
	      }
				}
			
		});

		
		
	});


</script>
</head>
<body>
<div class="container">
    <div class="row pt-1 pb-1">
        <div class="col-lg-12">
            <h4 class="text-center">Search Job</h4>
<!--             <h6 class="text-center">awesome responsive image slider with search bar</h6>
 -->        </div>
    </div>
</div>
<section>
    <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
					<img class="d-inline-block w-100" height="400"alt="..." src="image_2.jpg">
            </div>
   </div>
</section>
<section class="search-sec">
    <div class="container">
        <form action="" method="get" novalidate="novalidate">
            <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <input type="text" id="job" class="form-control search-slt" placeholder="Enter Job">
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <input type="text" id="place" class="form-control search-slt" placeholder="Enter Location">
                        </div>
	 <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <input type="button" id="search" class="btn btn-info wrn-btn" value="Search"/>
                        </div>
                    </div>
                </div>
        </form></div>
            <div class="container">
        
        <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 p-0">  
        <table	style="width:100%;" class="table table-responsive table-striped table-hover table-sm table-dark">
		<thead >
			<tr>
				<th style="width:20%;">Job ID</th>
				<th style="width:20%;">Job Title</th>
			    <th style="width:20%;">Job Type</th>
				<th style="width:20%;">Location</th>			
				<th style="width:20%;">Remote</th>
				<th style="width:20%;">Country</th>
			</tr>
		</thead>
		<tbody id="table">

		</tbody>
	</table></div>
	
        </div>
    </div>            
    </div>
</section></body>
</html>