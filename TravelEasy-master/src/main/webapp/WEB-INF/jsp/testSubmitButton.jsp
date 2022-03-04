<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
 	$("#getReq").click(function(){
 		$.get("https://ntfa40vdb2.execute-api.us-east-1.amazonaws.com/Dev/?custId=1543172268", function(data, status){
 		// alert("Data: " + data + "\nStatus: " + status);
 		$("#result").text(JSON.stringify(data) );
 		var result = $("#result").text(JSON.stringify(data) );
 		var country = data.country;
 		var month = data.month;
 		console.log("Country of the user is: "+country);
 		console.log("Month of the Trip is: "+month);
 		});
 	});
 });
</script>
</head>
<body>

	<div class="container">

		<button type="button" id="getReq"
			style="margin-left: 550px; margin-top: 400px" class="btn btn-success">Success</button>

	</div>

	<div id="result">Result</div>

</body>
</html>
