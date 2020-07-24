<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
<!-- Page level plugin JavaScript-->
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>


<meta charset="ISO-8859-1">
<title>SMART Job Board</title>
<style type="text/css">
tfoot input {
        width: 100%;
        padding: 3px;
        box-sizing: border-box;
    }
</style>
<script>
 $(document).on('click','#cancel',function() {
	$('#JobModal form')[0]. reset();
	window.top.location.reload(); 
});
 
 

 $(document).on('click','#view',function() {
	 
	var jobcode = $(this).attr("data-id"); 
    var sesid = $('#idses').val();

/* 	var data = $("#update_form").serialize();alert(data);*/
	$.ajax({
		data: {jobcode:jobcode,sesid:sesid},
		type: "GET",
		url: "JobDetailServlet",
		success: function(dataResult){
		var data = JSON.parse(JSON.stringify(dataResult));
	    var len = data.length;
 		    for (var i = 0; i < len; i++) {
		   var jobcode = data[i].jobcode;
		   var jobtitle = data[i].jobtitle;
		   var jobtype  = data[i].jobtype;
		   var remotejob  = data[i].remotejob;
		   var id = data[i].id;
		   var email = data[i].email;
		   var name  = data[i].filename;
		   var state = data[i].state;
		   var city = data[i].city;
		   var country = data[i].country;
		   var editor = data[i].editor;
		   
		$('#jobcode').val(jobcode);
		$('#jobtitle').val(jobtitle);
		$('#jobtype').val(jobtype);
		$('#remotejob').val(remotejob);
		$('#city').val(city);
		$('#state').val(state);
		$('#country').val(country);


		$('#editor').html($(editor).text());
		if(typeof name !== "undefined")
		{
	    $('#panel').append(' <div class="form-group col-sm-3" ><input type="radio" id="'+id+'" value="'+name+'" name="radioresume"  /><label>'+name+'</label>');}
//<li class="list-group-item"><label for="checkbox"> '+name+'</label>   </li>');

		}
		}
 }); 
}); 

    $(document).ready(function() {        
        $('#tabsearch tfoot th').each( function () {
            var title = $(this).text();
            $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
        } );

        var dt =    $('#tabsearch').DataTable({
            initComplete: function () {
                // Apply the search
                this.api().columns().every( function () {
                    var that = this;
     
                    $( 'input', this.footer() ).on( 'keyup change clear', function () {
                        if ( that.search() !== this.value ) {
                            that
                                .search( this.value )
                                .draw();
                        }
                    } );
                } );
            },
        

        	        "serverSide": true,
        	        "processing":true,
                    "ajax": {
                        "url": "${pageContext.request.contextPath}/SearchServlet", /*Data source*/
                        "type":"GET"
                     },
                     "columnDefs": [{
                         "targets": 4,
                          "data" :"dataSrc",
                          "render": function (data, type, full, meta){
                            return "<a type='button' id='view' class='glyphicon glyphicon-file' data-toggle='modal'  data-backdrop='static' data-keyboard='false' data-id=\"" + full.jobcode + "\" data-target='#JobModal'>  </a>";
    // return "<a href='${pageContext.request.contextPath}/jobdetails.jsp'  class='glyphicon glyphicon-file' data-id=\"" + full[0] + "\" >  </a>";

 						}

                        // "defaultContent": "<a type='button' class='btn btn-info' data-toggle='modal' data-id = 'data[0]' data-target='#JobModal'><span class='glyphicon glyphicon-file'></span> view</a>"
                        // "defaultContent": '<a type="button" class="btn btn-primary"  data-toggle="modal" data-target="#JobModal"  onclick="applyjob(data[0])"> <span class="glyphicon glyphicon-edit"></span>Edit</a> / <a href="" class=class="btn btn-danger">Delete</a>'

                     }],
                     "aoColumns": [
                         { "mData": "jobcode" },
                         { "mData": "jobtitle" },
                         { "mData": "jobtype" },
                         { "mData": "jobstatus" },
                         { "mData": "remotejob" },
                          
                     ],


            	     "lengthChange": false,
            	     "searching": true,
            	     "ordering": true,
            	     "info": true,
            	     // "autoWidth": false,
            	    "order": [[0, 'asc']]

            	      });

/*         	    $('#tabsearch tbody').on( 'click', 'button', function () {
        	        var tr = $(this).closest('tr');
        	        var value = $(tr).find('td').eq(0)[0].innerHTML;alert(value);
        	       //  $('#JobModal').modal('show');
        	       
        	        return false;
        	   });
 */        	    
        	  
/*   var input = $(".dataTables_filter input");
 input.unbind('keyup search input').bind('keypress', function (e) {
     if (e.which == 13) {
        var keywords = input.val().split(' '), filter ='';
        for (var i=0; i<keywords.length; i++) {
            filter = (filter!=='') ? filter+'|'+keywords[i] : keywords[i];
        }            
        dataTable.fnFilter(filter, null, true, false, true, true);
     }
 });
 
 */
    });
</script>
<style type="text/css">
    .addmember {
        height: 100%;
        overflow-y: auto;
        width: 100% !important;
        height: 100% !important;
        margin: 0 !important;
        padding: 0 !important;
        max-width:none !important;

    }
    
   .modal-full {
    min-width: 20%;
    margin-left: 80;
    overflow-y: auto;
    
    
 }
   .modal-header {
    background-color: #5bc0de;
    color:white !important;
    text-align: center;
    font-size: 15px;
  }
  .modal-footer {
    background-color: #f9f9f9;
  }
 

.modal-full .modal-content {
    min-height: 100vh;
}


</style>
</head>
<body>
<div class="row">
<input type ="hidden" class="form-control" id="idses" name="idses"  value="<%=session.getAttribute("name")%>" />

<table id="tabsearch" class="display" style="width:100%">

        <thead>
            <tr>
            <th width="10%">Job Code</th>
			<th width="10%">Job Title</th>
			<th width="10%">Job Type</th>
			<th width="10%">Job Status</th>
			<th width="10%">Job Details</th>
			
			
            </tr>
        </thead>
        <tfoot>
            <tr>
            <th width="10%">Job Code</th>
			<th width="10%">Job Title</th>
			<th width="10%">Job Type</th>
			<th width="10%">Job Status</th>
			<th width="10%">Job Details</th>
			
            </tr>
        </tfoot>
    </table>
    	<div id="JobModal" class="modal fade">
		<div class="modal-dialog lg addmember">
		<form action="ApplicationServlet" role="form" id="rform"enctype="multipart/form-data" method="post">
		
			<div class="modal-content">
			<div class="modal-header">
			<h4 class="modal-title">Apply for JOB</h4>
			</div>
			<div class="modal-body">
			
			<div class="row">
		    <div class="form-group col-sm-4" ></div>
            <div class="form-group col-sm-4" >         
		    <label>Job Code</label> <input type="text" id="jobcode" name="jobcode" value="" class="form-control" readonly="true">
             </div>           
                  <div class="form-group col-sm-4" ></div>
                 </div>
                 <div class="row">
                 <div class="form-group col-sm-4" >  
                 <label>Job Title</label> <input type="text" id="jobtitle"  name="jobtitle" value=""class="form-control" readonly="true">
                 </div>
                 <div class="form-group col-sm-4" >  
				 <label>Job Type</label> <input type="text" id="jobtype"  name="jobtype" value=""  class="form-control" readonly="true">
                 </div>
                 <div class="form-group col-sm-4" >  
				 <label>Remote Job </label> <input type="text" id="remotejob"  name="remotejob" value=""  class="form-control" readonly="true">
                 </div>
                 
                  <div class="form-group col-sm-4" ><label>State</label> 
                  <input type="text" id="state"  name="state" value=""	 class="form-control" readonly="true"></div>
                  <div class="form-group col-sm-4" >
                  <label>City</label> <input type="text" id="city"  name="city" value="" class="form-control" readonly="true"></div>
                  <div class="form-group col-sm-4" >
                  <label>Country</label> <input type="text" id="country"  name="country" value="" class="form-control" readonly="true"></div>
				 <div class="form-group col-sm-12" >
				 <label>Job Description</label> 
<!--      			<textarea id="editor" rows="5" cols="20"></textarea><br />
 -->				 <div contenteditable="true"  id="editor" name="editor" readonly="true"> </div>
				 				        
                    </div>
                    <input type ="hidden" class="form-control" id="idses" name="idses"  value="<%=session.getAttribute("host")%>">
                 
					 <div class="form-group">
					 <label>Select / Upload Resume </label> 
              			 <div class="panel-body" id="panel">
                     </div>
					
					<div class="form-group col-sm-12" >
						
							<input type="file" id="resume"  name="resume"  class="form-control" >
						</div>
					    
						</div>
					</div></div>
					


					
					<div class="modal-footer">
						<input	type="button" class="btn btn-danger" data-dismiss="modal" id="cancel" value="Cancel"/>
						<input type="submit" class="btn btn-info" id="jobapply" name="jobapply" value="Apply"/>
					</div>
			</div>			
		</form>
		</div>
	</div>
    

</body>
</html>