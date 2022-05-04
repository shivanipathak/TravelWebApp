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
     content="447092261765-n2ubsh2g8arusbkdctul4r0a3bo50ff0.apps.googleusercontent.com">


</head>

<style> 
#bdy {
    /* The image used */
    background-image: url("https://asinglewomantraveling.com/wp-content/uploads/2020/11/Website-Planning-Images.jpg");
    /*https://i.pinimg.com/originals/b4/4c/66/b44c665c88d2d14d1b4a6904bd133acb.gif*/
	
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

h1.thick {
  font-weight: bold;
}

#style{
font-family: "Times New Roman", Times, serif;
  font-size: 20px;
  color: #000000;
  border: solid;
  margin-left: 550px;
  margin-right:550px;
}



#styletext{
font-family: "Times New Roman", Times, serif;
  font-size: 20px;
  color: #000000;

}


</style>



<body id="bdy"><center>
<script>
 function statusChangeCallback(response) {
 console.log('statusChangeCallback');
 console.log(response);
 if (response.status === 'connected') {
 testAPI();
 } //else if (response.status === 'not_authorized') {
 //document.getElementById('status').innerHTML = 'Login with Facebook ';
 //} else {
 //document.getElementById('status').innerHTML = 'Login with Facebook ';
 //}
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

<h1 class="thick"> Login Page </h1></br>

<div class="Login page" id="container1">
<h1><font type="hidden" color= "white">${message}</font></h1>
<form method="POST" class="form-horizontal" action="/customlogin">
<p id="style"><b>User Name &ensp;
<input type="text" id="username" placeholder="Enter UserName" name="username"  required></p>
<p id="style"><b color = black>Password &ensp;
<input type="password" id="pwd" placeholder="Enter password" name="pwd" required></p>
<p></p></br>
<p id="styletext"><b>Select User Type: &ensp;</b></p>
 <input id="styletext"  type="radio" name="role" value="user" checked> <font id="styletext" color= "#000000">User</font>&ensp;&ensp;
  <input id="styletext" type="radio" name="role" value="company"><font id="styletext" color= "#000000">Travel Company</font>
  <p></p>
<input id="styletext" type="submit"  class="w3-btn w3-white" name="Login" value="Login">
<input id="styletext" type="submit" class="w3-btn w3-white" name="Cancel" value="Cancel"><br>

<a id="styletext" href="/userSignup"><h4><strong><font color= "#000000">New User Register here</font></strong></h4></a>
<a id="styletext" href="/companySignup"><h4><strong><font color= "#000000">New Company Register here</font></strong></h4></a>
</div>
<!--  <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>-->
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





