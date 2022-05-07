<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored = "false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import ="com.traveleasy.model.Reviews" %>
       <%@ page import ="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/javascript">
function removeSplChars(inStr) {
    <%System.out.println ("Hello");%>
                inStr = inStr.replace("[", "");
                inStr= inStr.replace("]","");
                 
                return inStr;
}
   
 function getreviews(plan) {
	 alert(plan);	
     System.out.println ("test");
	 $.get("retrievereviews",{plan:plan},function(data){
System.out.println(data);
     $("#displayreviews").html(data);
	 
     });
 }

</script>
    
<style>
body {
  font-family: Times New Roman, Times, serif;
  background-image: url("https://independenttravelcats.com/wp-content/uploads/2018/03/Travel-planning.jpg");
}

* {
    box-sizing: border-box;
}

/* Style inputs */
input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical;
}

input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

#h1 {
  font-size: 40px;
  font-style: italic;
  color: white;
}


/* Style the container/contact section */
.container {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 10px;
}

/* Create two columns that float next to eachother */
.column {
    float: centre;
    width: 100%;
    margin-top: 6px;
    margin-left: 60px
    padding: 50px;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}

</style>
</head>
<body>

	<div class="w3-container" style="margin-top: 40px; margin-right: 50px;">
	<form method="POST" action="/logout" style="float: right; padding-left: 1%;" >
	<p align="right">
    <input type="submit" class="w3-btn w3-black" value="Logout"></p>
	</form>
	<form method="GET" action="/userTravelPlans" style="float:right;">
	<p align="right">
    <input type="submit" class="w3-btn w3-black" value="Back"></p>
	</form>
	</div>

<div><h1 style="color:white;font-size: 40px;font-style: italic;border: solid;width: fit-content;">${message1}</h1></div>
<div class="container">
  <div style="text-align:center">

    <h2>Plan details </h2><br />
  
        <%System.out.println ("Hello 123");%>
        <h4>Plan Name:${SpecificTravelPlan.plan} </h4><br />
  
        <h4>Country:${SpecificTravelPlan.country} </h4><br />
       
       <h4> Month:${SpecificTravelPlan.month} </h4><br /> 
       
       <h4> Budget:${SpecificTravelPlan.budget} </h4><br /> 
      
       <a href="/selectPlan?travelPlan="+removeSplChars('${SpecificTravelPlan}')>Select This Plan</a>
      
    </div>
    
    
    <input type="hidden" id="plan" value="${SpecificTravelPlan.plan}">
    
    
<%-- <button type="submit" id="getreviews" class="getreviews" onClick="getreviews('${SpecificTravelPlan.plan}')" >Reviews</button>
<div id="displayreviews"></div> --%>

 <a href="/getReviews?plan=${SpecificTravelPlan.plan}"><h4><strong><font color= "black" style="align:center;" >Reviews</font></strong></h4></a>
    
     <% 
 if(session.getAttribute("planReview") != null)
 {
	 ArrayList<Reviews> a = (ArrayList<Reviews>)session.getAttribute("planReview"); 

	 System.out.println("Value is there");
	 for(Reviews u : a) 
	 { %>
	 
	 <a target="_blank" href="<%u.getImageUrl();%>">
    <img src="<%=u.getImageUrl()%>" alt="Cinque Terre" style="width:280px; height: 280px">
  </a>
  <div class="desc"><%u.getComment();%></div> 
	 
	 
	<%  out.println(u.getComment()); 
	 } 
 }
 %> 
    
    
 
   
</div>

<style>
.container {
clear: both;
width: 50%;
height: 100%;
margin-left: 375px;
}

</style>
</body>
</html>




