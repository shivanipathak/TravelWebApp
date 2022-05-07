 <%@ page import ="java.util.ArrayList"%>
     <%@ page import ="com.traveleasy.model.Travelplan" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
<title>Company Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
table {
	width: 100% !important;	
}

.dashboardtable{
width: 100% !important;	
	
}
.dthead {
	text-align: left;
}
.dtr {
	background-color: #dccdc;
}
.tripdata {
display: block;
margin-left: 38%;
}
input[type=text], select {
    display: block;
}
.company-container {
    margin: auto;
    width: 30%;
    padding: 10px;
    text-align: center;
    
}
label {
  display: inline-block;
  width: 140px;
  text-align: right;
  float: left;
}
.companytravelplans {
margin-left: 4%;
}

#displayreviews {
width: 100%;
margin: 4%;
}

div.gallery {
    margin: 5px;
    border: 1px solid #ccc;
    float: left;
    width: 280px;
}

div.gallery:hover {
    border: 1px solid #777;
}

div.gallery img {
    width: 100%;
    height: auto;
}

div.desc {
    padding: 15px;
    text-align: center;
}

</style>	
</head>
	<body background="https://img.freepik.com/free-photo/male-hand-holding-plane-airplane-icon-blue-background-banner-nline-ticket-purchase-travel-icons-about-travel-planning-transportation-hotel-flight-passport-flight-ticket-booking-concept_150455-9915.jpg?w=1380">
	<h2><b>Welcome ${companyname}</b></h2>
<div class="w3-container" style="margin-top: 20px; margin-right: 50px;">
	<form method="POST" action="/logout" >
	<p align="right">
    <input type="submit" class="w3-btn w3-black" value="Logout"></p>
	</form>
	</div>
	<h3> ${companymessage}</h3>
	<div class="company-container">
	
		<form method="POST" class="form-horizontal" action="/traveldata"  enctype="multipart/form-data">
			
	<input type="hidden" name="companyname" value="${companyname}">
	<input type="hidden" name="companyusername" value="${companyusername}">
				<label for="file">Upload Itinerary:</label>
				<div class="tripdata">
					<input type="file" name="itinerary" required><br />
					</div>
				<label for="file">Upload Image:</label>
				<div class="tripdata">	<input type="file" name="planimage" required><br />
				</div>
				<label for="country">Country:</label>
				<div class="tripdata">
               <input type="text" name="country" placeholder="enter destination" required><br />
			   </div>
			   <label>Month:</label>
			   <div class="tripdata">
				 <select name="month" required>
                <option value="January">January</option>
                <option value="February">February</option>
                <option value="March">March</option>
                <option value="April">April</option>
                <option value="May">May</option>
                <option value="June">June</option>
                <option value="July">July</option>
                <option value="August">August</option>
                <option value="September">September</option>
                <option value="October">October</option>
                <option value="November">November</option>
                <option value="December">December</option>                   
                 </select> <br />
                 </div>
				<label>Plan name:</label>
				<div class="tripdata">
				 <input type="text" name="plan" placeholder="enter unique plan name" required><br />
				</div>
				<label>Budget:</label>
				<div class="tripdata">
				 <input type="text" name="budget" placeholder="enter budget" onkeypress="return isNumberKey(event)" required><br />
				</div>
				<button type="submit">Submit</button>
		</form>		
	</div>

	<div class="companytravelplans">
			<form method="POST" action="/companytravelplans">
		<input type="hidden" name="companyname" value="${companyname}">
		<input type="hidden" name="companyusername" value="${companyusername}">
		<button type="submit">See your plans</button>
		</form>
	 <% 
 if(session.getAttribute("travelplan") != null)
 {
 ArrayList<Travelplan> a = (ArrayList<Travelplan>)request.getAttribute("travelplan"); 
 System.out.println("hi"); 
 %>
 <table class="dashboardtable">
					<thead class="dthead">
					<tr>
						<th>Plan</th>
						<th>Country</th>
						<th>Month</th>
						<th>Budget</th>
						<th>Itinerary Image</th>
						<th>Plan Image</th>
						<th>Delete</th>
						<th>View Reviews</th>
						</tr>
					</thead>
<tbody class="dtr">


<c:forEach items="${travelplan}" var="item">
 <tr>
	<td>${item.plan} </td>
	<td>${item.country}</td>
<td>${item.month}</td>
	<td>$${item.budget}</td>
<td><a href="${item.itineraryimageurl}">Itinerary image</a></td>
<td><a href="${item.planimageurl}">Itinerary image</a></td>
	<td><form method="post" action="/travelplandelete">
	<input type="hidden" name="companyname" value="${companyname}">
		<input type="hidden" name="companyusername" value="${companyusername}">
		<input type="hidden" name="travelplanid" value="${item.travelPlanId}">
	<button><span class="glyphicon glyphicon-trash"></span></button>
	</form></td>
<td><input type="hidden" id="plan" value="${item.plan}">

<button type="submit" id="getreviews" value="${item.plan}" class="getreviews" onClick="getreviews('${item.plan}')" >Reviews</button> </td>

</tr>										
 </c:forEach>
</tbody>
</table>
 <% }
 %>
  </div>
   
 
  
  
  <div id="displayreviews"></div>
	</body>
	<script>
	function isNumberKey(evt){
	    var charCode = (evt.which) ? evt.which : event.keyCode
	    if (charCode > 31 && (charCode < 48 || charCode > 57))
	        return false;
	    return true;
	}
	function editalert(){
		alert("Please upload the plan with same name to update!!!")
	}
	 function getreviews(plan) {
		 $.get("retrievereviews",{plan:plan},function(data){

	     $("#displayreviews").html(data);
		 
	     });
	 } 
	var message = $("h3").text();
	 var audio = new Audio('audio?msg=' + message);
     audio.play();
	
	</script>
	
</html>
