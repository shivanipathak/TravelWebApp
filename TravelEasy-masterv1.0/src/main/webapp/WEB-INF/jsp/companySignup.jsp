<!DOCTYPE html>
<html lang="en">
<head>
<title>Company Signup</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body background="https://asinglewomantraveling.com/wp-content/uploads/2020/11/Website-Planning-Images.jpg"><center>

	<div class="container">
		<h1><b>Register Your Company here!</b></h1></br/><br/>
		
		<form method="POST" class="form-horizontal" action="/addCompany">
			<div class="form-group">
				<label class="control-label col-sm-2" for="email"><b>Email:</b></label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="email"
						placeholder="Enter email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd"><b>Password:</b></label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="pwd"
						placeholder="Enter password" name="pwd" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="cname"><b>Company
					Name:</b></label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="cname"
						placeholder="Enter Comapny Name" name="cname">
				</div>
			</div></br></br>
		
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					
					<button type="submit" class="btn btn-default">Submit</button>
					<button type="cancle" class="btn btn-default">Cancel</button>
				</div>
			</div>
		</form></center>
	</div>

</body>
</html>
