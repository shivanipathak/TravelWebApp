<!DOCTYPE html>
<html lang="en">
<head>
<title>userSignup</title>
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
<form method="POST" class="form-horizontal" action="/adduser">

<div class="User Signup page">
<h1>Sign up for user</h1></br></br>

<p><b>First Name	&ensp;
<input type="text"  id="fname" placeholder="Enter first name" name="fname" ></p></br>

  <p><b>Username	&ensp;
<input type="text"  id="username" placeholder="Enter username max 8" name="username" pattern="[A-Za-z 0-9]{1,8}"  required></p><br>


<p>EmailID &ensp;
<input type="text"  id="email" placeholder="abc@example.com" name="email"  required></p></br>
<p>Password &ensp;
<input type="password" id="pwd" placeholder="Enter password" name="pwd" required></p>
<p></p>

</br>
<input type="submit" value="Cancle">
<input type="submit" value="Submit">

</div>
</form>
</center>
</body>
</html>