<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Smart JobBoard</title>
 <style><%@include file="/WEB-INF/css/resume.css"%></style>

<script type="text/javascript">
$(document).on("click", ".delete", function() { 
	
	var id=$(this).attr("data-id");
	$('#id_d').val(id);
	
	
});

$(document).on("click", "#delete", function() { 
	$.ajax({
		url: "DelresumeServlet",
		type: "POST",
		cache: false,
		data:{
			id: $("#id_d").val()
		},
		success: function(data){
		if($.trim(data) == "success") {
				$('#deleteJobModal').modal('hide');
				$("#"+data).remove();
                location.reload();						
		}

		
		}
	});
});

$(window).load(function() {

    var sesid = $('#idses').val();
	$.ajax({
		url: "ResumeListServlet",
		data:{ sesid : sesid },
		type: "POST",
		cache: false,
		success: function(dataResult){ 
		var data = JSON.parse(JSON.stringify(dataResult));
		var len = data.length;
		for (var i = 0; i < len; i++) {
 			   var id = data[i].id;
			   var name  = data[i].filename;
			   function DoPost(){
				      $.post("download1.jsp", { resume: name } );  //Your values here..
				   }
                                                                                                                                                                                                                                                                                                   
			   $('#panel').append(' <ul class="list-group1"> <li class="list-group-item"><div class="checkbox" <label for="checkbox"> '+name+'</label> </div>    <div class="pull-right action-buttons"><a type="button" id"view" data-toggle="modal" class="delete"   data-backdrop="static" data-keyboard="false"  data-target="#deleteJobModal" data-id="'+id+'" class="trash"><span class="glyphicon glyphicon-trash"></span></a><a href="download1.jsp?filename='+name+'"  class="flag"><span class="glyphicon glyphicon-download"></span></a> </div></li></ul>');
              }
 	}
		
});
});

</script>
</head>
<body>
	<center>
<div class="row">	
<!-- 		<h6>Upload Resume</h6>
 --><form method="post" action="UploadServlet" enctype="multipart/form-data">
	<!-- COMPONENT START -->
	<div class="form-group">
		<div class="input-group input-file" name="photo">
		    <input type ="hidden" class="form-control" id="idses" name="idses"  value="<%=session.getAttribute("name")%>">
    		<input type="file" name="photo" class="form-control" placeholder='Choose a file...' />			
            <span class="input-group-btn">
        		<input type="button" class="btn btn-default btn-choose" value="Upload Resume" disabled/>
    		</span>


		</div>
	</div>
	<!-- COMPONENT END -->
	<div class="form-group">
		<input type="submit" class="btn btn-warning pull-right"  value="Submit"/>
	</div>
</form></div>
    <div class="row">
        <div class="">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-list"></span>Resume Lists
                    <div class="pull-right action-buttons">
                        <div class="btn-group pull-right">
                        </div>
                    </div>
                </div>
                <div class="panel-body" id="panel">
                        </div>
                    </div>
                </div>
            </div>
</center>

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