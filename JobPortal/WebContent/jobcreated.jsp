<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SMART JobBoard</title>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css">
<script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/4.5.6/tinymce.min.js"></script>

<style type="text/css">
td.details-control {
    background: url('details_open.png') no-repeat left center;
    cursor: pointer;
}
tr.details td.details-control {
    background: url('details_close.png') no-repeat right center;
}

</style>
<script type="text/javascript">

$(document).ready(function(){
	tinymce.init({
	    selector: '#editor'
	});
	$('#addjobform').submit(function(){
		$(this).find(':submit').attr( 'disabled','disabled' );
		});
});




function format ( d ) {var str="";
//var len = d.filename.length;var i;var str="";
//for(i=0;i<len;i++){
	str += '<ul class="list-group"><li class="list-group-item  txt;">Resume:  '+d.resumename+'   <a href="download1.jsp?filename='+d.resumename+'"  class="flag"><span class="glyphicon glyphicon-download"></span></a> </li></ul>'
//}

    return str //'Resume : '+d.resumename+'<br>'+
        // 'Full name: '+d.firstname+''+d.lastname+'<br>'+
         
}

$(document).ready(function() {
     
  var dt =  $("#example").DataTable( {
        "processing": false,
        "serverSide": false,
        "sort": "position",
        "ajax": "${pageContext.request.contextPath}/ViewjobServlet",
        "aoColumnDefs": [
            { "sClass": "details-control", "aTargets": [ 0 ] ,
            "orderable":      false,
            "data":           null,
            "defaultContent": ""
            },
/*             { "sClass": "", "aTargets": [ 5 ] ,
                "orderable":      false,
                "data":           null,
                "defaultContent": "<button class='btn btn-info'>Shortlist</button>"
                },
 */
          ],

        "aoColumns": [
            { "mData": "" },
            { "mData": "" },
            { "mData": "" },
/*             { "mData": "resumename" },
*/          { "mData": "" },
            { "mData": "" },
             
        ]
    } );
    var dataTable = $('table').DataTable();

    $.fn.dataTableExt.afnFiltering.push(
      function(oSettings, aData, iDataIndex) {
          var keywords = $(".dataTables_filter input").val().split(' ');  
          var matches = 0;
          for (var k=0; k<keywords.length; k++) {
              var keyword = keywords[k];
              for (var col=0; col<aData.length; col++) {
                  if (aData[col].indexOf(keyword)>-1) {
                      matches++;
                      break;
                  }
              }
          }
          return matches == keywords.length;
       }
    );
    // Array to track the ids of the details displayed rows
    var detailRows = [];
 
    $('#example tbody').on( 'click', 'tr td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = dt.row( tr );
        var idx = $.inArray( tr.attr('id'), detailRows );
 
        if ( row.child.isShown() ) {
            tr.removeClass( 'details' );
            row.child.hide();
 
            // Remove from the 'open' array
            detailRows.splice( idx, 1 );
        }
        else {
            tr.addClass( 'details' );
            row.child( format( row.data() ) ).show();
 
            // Add to the 'open' array
            if ( idx === -1 ) {
                detailRows.push( tr.attr('id') );
            }
        }
    } );
 
    // On each draw, loop over the `detailRows` array and show any child rows
    dt.on( 'draw', function () {
        $.each( detailRows, function ( i, id ) {
            $('#'+id+' td.details-control').trigger( 'click' );
        } );
    } );
});

</script>

</head>
<body>
	<div class="row">    
	<div class="col-sm-6">
	
	</div>
	</div>
	<div class="row">  
	<div class="col-sm-12 float-right">
		<a href="#addJobModal" class="btn btn-info btn-xs " data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Create Job</span></a>
	</div>
  	<div class="col-md-4 col-md-offset-4"><h4> <b>Job List</b></h4></div>
	
	</div>
	<div class="row">

	<form action="">
    <table id="example" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                        <th>Job ID</th>
                        <th>Job Title</th>
						<th>Job Type</th>
						<th>Location</th>
                        <th>Remote</th>
                        <th>Status</th>
                        
                        <th>Action</th>
                        <th>Applicant</th>
          </tr>
        </thead>       
    </table>
	</form>
	</div>
<!-- ---------------------------------------ADD MODAL-------------------------------- -->!>
	
	<div id="addJobModal" class="modal fade">
	<div class="modal-dialog ">
			
	 <div class="modal-content">
				<form id="addjobform">
					<div class="modal-header ">						
						<h4 class="modal-title ">Post a job</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<div class="container-fluid">	
								<div class="form-group col-sm-4" >
									<input type="text" id="jobtitle" name="jobtitle" class="form-control"
										placeholder="Job Title" required>
								</div>
								<div class="form-group col-sm-4">
						           <select id="jobtype" name="jobtype" class="form-control">
						              <option value="">------JobType---</option>
						              
						               <option value="Permanent">FullTime</option>
						               <option value="Contract">Contract</option>
						               <option value="Other">other</option>
								</select>							
								</div>
								<div class="form-group col-sm-4">
								    <input type="email" id="email" name="email" class="form-control"
									placeholder="Email " required>
							    </div>
							    <div class=clearfix></div>
							    <div class="form-group  col-sm-4">
								   <input type="phone" id="phone" name="phone" class="form-control" placeholder="Phone" required>
								</div>		
							    
							    <div class="form-group col-md-4">
   									<label>Remote Job</label>
							
									<div class="checkbox-inline">
  									<label class="form-check-label form-control">
  									<input type="radio" id="remote" name="remote" class="form-check-input" value="Yes">Yes
  									</label>
									</div>
									<div class="checkbox-inline">
 									 <label class="form-check-label form-control">
   									 <input type="radio" id="remote" name="remote" class="form-check-input" value="No">No
 									 </label>
								</div>
							    
							  </div>
							<div class=clearfix></div>
								<div class="form-group col-sm-4">
									<textarea id="address" rows="4" cols="50" placeholder="Address" class="form-control"></textarea>
								</div>
							<div class="form-group  col-sm-4">
								   <input type="text" id="org_selectmem" name="org_selectmem" class="form-control"  disabled>
								</div>		
								
        						<div class="form-group  col-sm-4">
        						
   									<select  id="jobstatus" name="jobstatus" class="form-control">
										<option value="" > ---Status---</option>
										<option  value="Active">Active</option>
										<option  value="Hold">Hold</option>
										<option  value="Close">Close</option>
										
										
									</select>
        						
							</div>
				                
		<div class=clearfix></div>
        <div class="form-group  col-sm-3">
		<input type="text" id="city" name="city" class="form-control" placeholder="City" required>
		</div>
		<div class="form-group  col-sm-3">
			<input type="text" id="state" name="state" class="form-control"	placeholder="State" required>
		</div>
		
		<div class="form-group  col-sm-3">
           <select id="country" name="country" class="form-control">
              <option selected disabled >---Country---</option>
              
               <option value="USA">USA</option>
               <option value="UK">UK</option>
               <option value="UAE">UAE</option>
               <option value="INDIA">INDIA</option>
		</select>							
		</div>
        		<div class="form-group  col-sm-3">
			<input type="text" id="zip" name="zip" class="form-control"
					placeholder="Zip" required>
		
		</div>
        
							<div class=clearfix></div>
							
			<div class=" col-sm-12"><!-- <textarea class="tinymce" id="texteditor"></textarea> -->
			
			    <textarea class="tinymce" id="editor" rows="10" cols="80">
    </textarea>
			
			</div>				
					</div>
					<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal"	value="Cancel">
						<input type="submit" id="btn_add" class="btn btn-info" value="Add">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- ---------------------------------------ADD MODAL-------------------------------- -->!>
</body>
</html>