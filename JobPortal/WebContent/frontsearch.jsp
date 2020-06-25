<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>


<!-- Bootstrap core JavaScript-->

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
        

        	        "serverSide": false,
        	        "processing":false,
        	        "sort": "position",

                    "ajax": {
                        "url": "${pageContext.request.contextPath}/SearchServlet", /*Data source*/
                        "type":"GET"
                     },
                     "columnDefs": [{
                        "sClass": "", "aTargets": [ 5 ] ,
                         "orderable":      false,
                         "data":           null,
                         "defaultContent": "<button class='btn btn-info'>Apply!!</button>"
                         }

                   
                       ],
                     "aoColumns": [
                         { "mData": "jobcode" },
                         { "mData": "jobtitle" },
                         { "mData": "jobtype" },
                         { "mData": "jobstatus" },
                         { "mData": "remotejob" },
                          
                     ],


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
    });
</script>

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
			
			<th width="10%">Remote Job</th>
			<th width="10%">Job Details</th>
			
            </tr>
        </thead>
        <tfoot>
            <tr>
            <th width="10%">Job Code</th>
			<th width="10%">Job Title</th>
			<th width="10%">Job Type</th>
			<th width="10%">Remote Job</th>
			<th width="10%">Job Details</th>
			
            </tr>
        </tfoot>
    </table>
    

</body>
</html>