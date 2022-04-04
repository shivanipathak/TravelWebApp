<!DOCTYPE html>
<html>

<head>
<title>Amazon Lex for JavaScript - Sample Application (BookTrip)</title>
<script src="https://sdk.amazonaws.com/js/aws-sdk-2.41.0.min.js"></script>
<style language="text/css">
input#wisdom {
	padding: 4px;
	font-size: 1em;
	width: 400px
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
	background-color: #e7b6a3;
}

p.lexResponse {
	margin: 4px;
	padding: 4px 10px 4px 10px;
	border-radius: 4px;
	text-align: right;
	min-width: 50%;
	max-width: 85%;
	float: right;
	background-color: #a1c4df;
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

<body>
	<h1 style="margin-left: 550px">Amazon Lex - BookTrip</h1>
	<p style="width: 400px; margin-left: 550px" >
	<h2 style="margin-left: 550px">Welcome to TravelEasy!</h2>
	</p>
	<div  id="conversation"
		style="width: 400px; margin-left: 550px; height: 400px; border: 1px solid #ccc; background-color: #beefa4; padding: 4px; overflow: scroll"></div>
	<form id="chatform" align="center" style="margin-top: 10px"
		onsubmit="return pushChat();">
		<input type="text" id="wisdom" size="80" value=""
			placeholder="I need to see travel plans">
	</form><br/><br/>
	<button style="margin-left: 650px; background-color: #beefa4">Submit</button>
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
		var sessionAttributes = {};

		function pushChat() {

			// if there is text to be sent...
			var wisdomText = document.getElementById('wisdom');
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
					userId: lexUserId,
					sessionAttributes: sessionAttributes
				};
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
