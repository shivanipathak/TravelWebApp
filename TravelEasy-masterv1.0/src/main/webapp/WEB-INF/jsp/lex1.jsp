<!DOCTYPE html>
<html>

<head>
<title>Amazon Lex for JavaScript - Sample Application (BookTrip)</title>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script src="https://sdk.amazonaws.com/js/aws-sdk-2.41.0.min.js"></script>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<style language="text/css">
input#wisdom {
	padding: 4px;
	font-size: 1em;
	width: 400px
}

#bdy {
    /* The image used */


    background-image: url("https://thumbs.dreamstime.com/z/world-map-compass-passport-shells-concept-travel-planning-top-view-white-wooden-desk-151491123.jpg");
	/*https://www.linguise.com/wp-content/uploads/2021/01/translate-travel-agency-website.png*/
    /* Full height */
    height: 100%; 

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    
}

input::placeholder {
	color: #ccc;
	font-style: italic;
}

p.userRequest {
	margin: 4px;
	padding: 4px 10px 4px 10px;
	border-radius: 4px;
	min-width: 50%;
	max-width: 85%;
	float: left;
	background-color: #11aec3;
}

p.lexResponse {
	margin: 4px;
	padding: 4px 10px 4px 10px;
	border-radius: 4px;
	text-align: right;
	min-width: 50%;
	max-width: 85%;
	float: right;
	background-color: #c7db57;
	font-style: italic;
}

p.lexError {
	margin: 4px;
	padding: 4px 10px 4px 10px;
	border-radius: 4px;
	text-align: right;
	min-width: 50%;
	max-width: 85%;
	float: right;
	background-color: #f77;
}

h1.thick {
  font-weight: bold;
  margin-left: 550px;
  margin-right: 575px;
  border-top-style: hidden;
  border-right-style: hidden;
  border-left-style: hidden;
  border-bottom-style: groove;
  background-color: #eee;
  border: solid;
  padding: 5px 5px;
  
  
}

.button {
  display: inline-block;
  padding: 5px;
  margin-left: 470px;
  font-size: 10px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #B3A285;
  width: 150px;
  height: 50px;
  background-color: #B3A285;
  border: none;
  border-radius: 15px;
}

.button:hover {background-color: #B3A285}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

.form-submit-button {
background: #0066A2;
color: red;
margin-left: 550px;
border-style: outset;
border-color: #0066A2;
height: 50px;
width: 100px;
font: bold15px arial,sans-serif;
text-shadow: none;
}



</style>
</head>

<body id ="bdy">

	<div class="w3-container" style="margin-top: 40px; margin-right: 50px;">
	<form method="POST" action="/logout" >
	<p align="right">
    <input type="submit" class="w3-btn w3-black" value="Logout"></p>
	</form>
	</div>


	<p style="width: 400px; margin-left: 550px">
	<h1 class="thick">Travel Planning System</h1>
	</p>
	<div id="conversation"
		style="width: 400px; margin-left: 550px; height: 400px; border: 1px solid #ccc; background-color: #F5F5DC; padding: 4px; overflow: scroll"></div>
	<form id="chatform" align="center" style="margin-top: 10px"
		onsubmit="return pushChat();">
		<input type="text" id="wisdom" style="margin-right: 10px" value=""
			 placeholder="I need to see travel plans"> <input
			type="hidden" id="userID"
			value="<%=session.getAttribute("DynamoUser") %>">

	</form>
	<br />





	<div class="container">

		<!-- <button type="button" id="getReq" style="margin-left: 500px"
			class="btn btn-success">Submit</button> -->
	
	<a class = "button" href="/getData"><h4><strong><font color= "white" style="margin-left: 5px" >Submit</font></strong></h4></a>

	</div>

	<!--  <div id="result">Result</div> -->




	<script type="text/javascript">
		// set the focus to the input box
		document.getElementById("wisdom").focus();

		// Initialize the Amazon Cognito credentials provider
		AWS.config.region = 'us-east-1'; // Region
		AWS.config.credentials = new AWS.CognitoIdentityCredentials({
		 //Provide your Pool Id here
			IdentityPoolId: 'us-east-1:5264d0c0-7775-4287-a987-6135e9db41f7',
		});

		var lexruntime = new AWS.LexRuntime();
		var lexUserId = 'chatbot-demo' + Date.now();
		
		var userName = $('#userID').val();
		console.log(userName);
		
		var sessionAttributes = {};

		function pushChat() {

			// if there is text to be sent...
			var wisdomText = document.getElementById('wisdom');
			
			//var userId = document.getElementById('userID');
			//var userName = $('#userID').val();
			//console.log(userName);
			if (wisdomText && wisdomText.value && wisdomText.value.trim().length > 0) {

				// disable input to show we're sending it
				var wisdom = wisdomText.value.trim();
				wisdomText.value = '...';
				wisdomText.locked = true;

				// send it to the Lex runtime
				var params = {
					botAlias: '$LATEST',
					botName: 'tarveleasyDemo', //Added by Shivani
					inputText: wisdom,
					userId: userName,
					sessionAttributes: sessionAttributes
				};
				
				console.log("params:::::::::::: "+params.userId)
				showRequest(wisdom);
				//lexruntime.postText --> Sends user input (text-only) to Amazon Lex.
				lexruntime.postText(params, function(err, data) {
					if (err) {
						console.log(err, err.stack);
						showError('Error:  ' + err.message + ' (see console for details)')
					}
					if (data) {
						// capture the sessionAttributes for the next cycle
						sessionAttributes = data.sessionAttributes;
						// show response and/or error/dialog status
						showResponse(data);
					}
					// re-enable input
					wisdomText.value = '';
					wisdomText.locked = false;
				});
			}
			// we always cancel form submission
			return false;
		}

		function showRequest(daText) {

			var conversationDiv = document.getElementById('conversation');
			var requestPara = document.createElement("P");
			requestPara.className = 'userRequest';
			requestPara.appendChild(document.createTextNode(daText));
			conversationDiv.appendChild(requestPara);
			conversationDiv.scrollTop = conversationDiv.scrollHeight;
		}

		function showError(daText) {

			var conversationDiv = document.getElementById('conversation');
			var errorPara = document.createElement("P");
			errorPara.className = 'lexError';
			errorPara.appendChild(document.createTextNode(daText));
			conversationDiv.appendChild(errorPara);
			conversationDiv.scrollTop = conversationDiv.scrollHeight;
		}

		function showResponse(lexResponse) {

			var conversationDiv = document.getElementById('conversation');
			var responsePara = document.createElement("P");
			responsePara.className = 'lexResponse';
			if (lexResponse.message) {
				console.log(lexResponse);
				//console.log(lexResponse.message);
				//console.log(lexResponse.dialogState);
				responsePara.appendChild(document.createTextNode(lexResponse.message));
				responsePara.appendChild(document.createElement('br'));
			}
			if (lexResponse.dialogState === 'ReadyForFulfillment') {
				responsePara.appendChild(document.createTextNode(
					'Ready for fulfillment'));
				// TODO:  show slot values
			} else {
				//console.log('hey are you here?');
				//responsePara.appendChild(document.createTextNode(
				//'(' + lexResponse.dialogState + ')'));
			}
			conversationDiv.appendChild(responsePara);
			conversationDiv.scrollTop = conversationDiv.scrollHeight;
		}


	

 



	</script>
</body>

</html>
