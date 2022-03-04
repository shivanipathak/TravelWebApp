<!DOCTYPE html>
<html lang="en">
<head>
<title>loginPage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
     content="19996480139-hbsng2ng7kfnl9cl4pil2a1m7ulr6pn9.apps.googleusercontent.com">


</head>

<style> 
#bdy {
    /* The image used */
    background-image: url("https://images.unsplash.com/uploads/141202616623001715bb7/c1b3b9b0?ixlib=rb-0.3.5&s=0ec689e4a4a33110315bd7846be5bb3e&auto=format&fit=crop&w=1094&q=80");
	
    /* Full height */
    height: 100%; 

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    
}

#container1{
  font-family: "Times New Roman", Times, serif;
  font-size: 20px;
  color: #eeebe6;
}

</style>



<body id="bdy"><center>
<script>
 function statusChangeCallback(response) {
 console.log('statusChangeCallback');
 console.log(response);
 if (response.status === 'connected') {
 testAPI();
 } else if (response.status === 'not_authorized') {
 document.getElementById('status').innerHTML = 'Login with Facebook ';
 } else {
 document.getElementById('status').innerHTML = 'Login with Facebook ';
 }
 }

 function checkLoginState() {
 FB.getLoginStatus(function(response) {
 statusChangeCallback(response);
 });
 }
 window.fbAsyncInit = function() {
 FB.init({ 
 appId : '1356918617772175',
 cookie : true, 
 
 xfbml : true,
 version : 'v3.2' 
 });

 FB.getLoginStatus(function(response) {
 statusChangeCallback(response);
 });
 };

 (function(d, s, id) {
 var js, fjs = d.getElementsByTagName(s)[0];
 if (d.getElementById(id)) return;
 js = d.createElement(s); js.id = id;
 js.src = "//connect.facebook.net/en_US/sdk.js";
 fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk')); 
 function testAPI() { 
 console.log('Welcome! Fetching your information.... ');
 FB.api('/me?fields=name,email', function(response) {
 console.log('Successful login for: ' + response.name); 
 
 document.getElementById("status").innerHTML = '<p>Welcome '+response.name+'! <a href=userHomePage?user_name='+ response.name.replace(" ", "_") +'&user_email='+ response.email +'>Continue with facebook login</a></p>'
 });
 } 
</script> 

<h1><font font-family="Gill Sans Extrabold", sans-serif >"Live life with no excuses, travel with no regret"-  Oscar Wilde. </font></h1></br>
<h1> Login Page </h1></br>

<div class="Login page" id="container1">
<h1><font color= "white">${message}</font></h1>
<form method="POST" class="form-horizontal" action="/customlogin">
<p><b>User Name &ensp;
<input type="text" id="username" placeholder="Enter User Enter your UserName" name="username"  required></p>
<p><b>Password &ensp;
<input type="password" id="pwd" placeholder="Enter password" name="pwd" required></p>
<p></p></br>
<p><b>Select User Type: &ensp;</b></p>
 <input type="radio" name="role" value="user" checked> user&ensp;&ensp;
  <input type="radio" name="role" value="company">Travel Company
  <p></p>
<input type="submit"  class="w3-btn w3-white" name="Login" value="Login">
<input type="submit" class="w3-btn w3-white" name="Cancle" value="Cancle"><br>

<a href="/userSignup"><h4><strong><font color= "#eeebe6">New User Register here</font></strong></h4></a>
<a href="/companySignup"><h4><strong><font color= "#eeebe6">New Company Register here</font></strong></h4></a>
</div>
<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>
<div id="status">
</div> 
<div><a><div class="g-signin2" data-onsuccess="onSignIn"></a></div></br>

<script>
	function onSignIn(googleUser) {
      var profile = googleUser.getBasicProfile();
      console.log('ID: ' + profile.getId());
      console.log('Name: ' + profile.getName());
      console.log('Image URL: ' + profile.getImageUrl());
      console.log('Email: ' + profile.getEmail());
      console.log('id_token: ' + googleUser.getAuthResponse().id_token);

   
      var redirectUrl = 'glogin';
      //using jquery to post data dynamically
      var form = $('<form action="' + redirectUrl + '" method="post">' +
                          '<input type="text" name="id_token" value="' +
                           googleUser.getAuthResponse().id_token + '" />' +
                                                                '</form>');
    $('body').append(form);
    form.submit();
    }

	</script>

</form>
</div>
</center>
</body>
</html>





