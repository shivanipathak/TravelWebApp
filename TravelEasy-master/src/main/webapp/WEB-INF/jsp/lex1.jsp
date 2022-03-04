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
    background-image: url("https://images.unsplash.com/uploads/141202616623001715bb7/c1b3b9b0?ixlib=rb-0.3.5&s=0ec689e4a4a33110315bd7846be5bb3e&auto=format&fit=crop&w=1094&q=80");
	
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
	<h1 style="margin-left: 550px">Welcome to TravelEzy!</h1>
	</p>
	<div id="conversation"
		style="width: 400px; margin-left: 550px; height: 400px; border: 1px solid #ccc; background-color: #a9d3d7; padding: 4px; overflow: scroll"></div>
	<form id="chatform" align="center" style="margin-top: 10px"
		onsubmit="return pushChat();">
		<input type="text" id="wisdom" style="margin-right: 10px" value=""
			 placeholder="I need to see travel plans"> <input
			type="hidden" id="userID"
			value="<%=session.getAttribute("DynamoUser") %>">

	</form>
	<br />
	<br />




	<div class="container">

		<!-- <button type="button" id="getReq" style="margin-left: 500px"
			class="btn btn-success">Submit</button> -->
	
	<a href="/getData"><h4><strong><font color= "white" style="margin-left: 500px" >Submit</font></strong></h4></a>

	</div>

	<!--  <div id="result">Result</div> -->




	<script type="text/javascript">
		// set the focus to the input box
		document.getElementById("wisdom").focus();

		// Initialize the Amazon Cognito credentials provider
		AWS.config.region = 'us-east-1'; // Region
		AWS.config.credentials = new AWS.CognitoIdentityCredentials({
		// Provide your Pool Id here
			IdentityPoolId: 'us-east-1:971c9c21-e466-4d96-9d6a-4db8440c7241',
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
					botName: 'TravelEasyBot',
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
