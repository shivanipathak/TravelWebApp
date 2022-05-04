<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored = "false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
#bdy {
    /* The image used */
    background-image: url("https://img.freepik.com/free-photo/male-hand-holding-plane-airplane-icon-blue-background-banner-nline-ticket-purchase-travel-icons-about-travel-planning-transportation-hotel-flight-passport-flight-ticket-booking-concept_150455-9915.jpg?w=1380");
	
    /* Full height */
    height: 100%; 

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    
}

div.gallery {
    
    /*border: 1px solid #ccc;*/
    float: left;
    width: 285px;
    border: solid;
}

/*div.gallery:hover {
    border: 1px solid #777;
}*/

div.gallery img {
    width: 100%;
    height: auto;
    border: solid;
  
    object-fit: cover;
   
    
}

div.desc {
    padding: 15px;
    text-align: center;
    font-weight: bold;
  
}

#thick {
  
  
  
}


</style>
</head>
<body id="bdy">

<div class="w3-container" style="margin-top: 20px; margin-right: 50px;">
	<form method="POST" action="/logout" >
	<p align="right">
    <input type="submit" class="w3-btn w3-black" value="Logout"></p>
	</form>
	</div>


  <c:forEach items="${Travelplans}" var="item">
	<div class="gallery">
  <a target="_blank" href="${item.planimageurl}">
    <img src="${item.planimageurl}" alt="Cinque Terre" style="width:280px; height: 280px">
    
  </a>
  <div class="desc">${item.plan}</div>
  <div class="desc"><a href="/getTravelPlanByName?planName=${item.plan}"><button> View</button></a>                 
  <a href="/downloadTravelPlanItinerary?itinerary=${item.itineraryimageurl}&companyname=${item.companyusername}&plan=${item.plan}"><button>Download</button></a></div>
  </div>

   </c:forEach>

</body>
</html>