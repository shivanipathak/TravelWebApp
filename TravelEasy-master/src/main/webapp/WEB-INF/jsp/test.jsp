<html>
    <head>
<script>
    function callAwsLambdaFunction() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("myDiv").innerHTML = this.responseText;
            }
        };
        xhttp.open("GET", "https://ntfa40vdb2.execute-api.us-east-1.amazonaws.com/Dev/?custId=1543172268", true);
        xhttp.send();

    }
    </script>   
        <title>Hello World!</title>
    </head>
    <body>
        <h1>Hello world!</h1>
        <h1>How would you like to proceed?</h1>
        <h1><div id="myDiv"></div></h1>
        <button onclick="callAwsLambdaFunction()">Click me!</button><br>
    </body>
</html>