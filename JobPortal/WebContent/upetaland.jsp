<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href=" https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.12.0/css/mdb.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.12.0/js/mdb.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	var ctxP = document.getElementById("labelChart").getContext('2d');
	var myPieChart = new Chart(ctxP, {
	  plugins: [ChartDataLabels],
	  type: 'pie',
	  data: {
		  labels: ["JobPortal", "MemberManagement", "Learning", "Job Submittion","Network"],
	    datasets: [{
	      data: [210, 130, 120, 160, 120],
	      backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],
	      hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]
	    }]
	  },
	  options: {
	    responsive: true,
	    legend: {
	      position: 'right',
	      labels: {
	        padding: 20,
	        boxWidth: 10
	      }
	    },
	    plugins: {
	      datalabels: {
	        formatter: (value, ctx) => {
	          let sum = 0;
	          let dataArr = ctx.chart.data.datasets[0].data;
	          dataArr.map(data => {
	            sum += data;
	          });
	          let percentage = (value * 100 / sum).toFixed(2) + "%";
	          return percentage;
	        },
	        color: 'white',
	        labels: {
	          title: {
	            font: {
	              size: '16'
	            }
	          }
	        }
	      }
	    }
	  }
	});

var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
type: 'bar',
data: {
labels: ["JobPortal", "MemberManagement", "Learning", "Job Submittion", "Purple", "Orange"],
datasets: [{
label: '# of Votes',
data: [12, 19, 3, 5, 2, 3],
backgroundColor: [
'rgba(255, 99, 132, 0.2)',
'rgba(54, 162, 235, 0.2)',
'rgba(255, 206, 86, 0.2)',
'rgba(75, 192, 192, 0.2)',
'rgba(153, 102, 255, 0.2)',
'rgba(255, 159, 64, 0.2)'
],
borderColor: [
'rgba(255,99,132,1)',
'rgba(54, 162, 235, 1)',
'rgba(255, 206, 86, 1)',
'rgba(75, 192, 192, 1)',
'rgba(153, 102, 255, 1)',
'rgba(255, 159, 64, 1)'
],
borderWidth: 1
}]
},
options: {
scales: {
yAxes: [{
ticks: {
beginAtZero: true
}
}]
}
}
});});

</script>
<meta charset="ISO-8859-1"> 
<title>UPETA DashBoard</title>

</head>
<body>
<div class="container row ">
 
  <div class="row">
  
 	<div class="form-group col-sm-6" >
 	<h4>Application Usage</h4>
 	
		 <canvas id="myChart" style="max-width: 700px;"></canvas>
 
	</div>
	  <div class="form-group col-sm-6">
<h4>Database Allocation</h4>

    <hr class="my-4">

    <div>
      <canvas id="labelChart" style="max-width: 400px;"></canvas>
    </div>

  </div>
	
</div>
</div>
</body>
</html>