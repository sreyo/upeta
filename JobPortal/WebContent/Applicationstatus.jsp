<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SMART JobBoard</title>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css">
<script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js
"></script>
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
        "ajax": "${pageContext.request.contextPath}/ApplicantsrchServlet",
        "aoColumnDefs": [
            { "sClass": "details-control", "aTargets": [ 0 ] ,
            "orderable":      false,
            "data":           null,
            "defaultContent": ""
            },
            { "sClass": "", "aTargets": [ 5 ] ,
                "orderable":      false,
                "data":           null,
                "defaultContent": "<button class='btn btn-info'>Shortlist</button>"
                },

          ],

        "aoColumns": [
            { "mData": "" },
            { "mData": "applicantid" },
            { "mData": "jobcode" },
/*             { "mData": "resumename" },
 */            { "mData": "appliedon" },
            { "mData": "status" },
            { "mData": "" }
             
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
<div ="row">
<form action="">
    <table id="example" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
               <th></th>
               <th >Applicant ID</th>
               <th>Job Code</th>
<!--                <th>Resume </th>
 -->               <th>Applied On</th>
               <th>Status</th>
               <th>Action</th>
            </tr>
        </thead>       
    </table>
    </td></tr></table>
</form>
</div>
</body>
</html>