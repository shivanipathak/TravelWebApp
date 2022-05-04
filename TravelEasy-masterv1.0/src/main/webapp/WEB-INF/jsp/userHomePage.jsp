<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import ="com.traveleasy.model.Usertravelplan" %>
       <%@ page import ="java.util.ArrayList"%>
<!DOCTYPE html><html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="/resources/script.js"></script>
        
<title>Home Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="application/javascript">

</script>
<style>

table {
	width: 50% !important;	
}

#dashboardtable {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  margin-left: 300px;
  width: 50%;
  border: solid;
}

#dashboardtable td, #dashboardtable th {
  border: 1px solid #000;
  padding: 8px;
}

#dashboardtable tr:nth-child(even){background-color: #f2f2f2;}

#dashboardtable tr:hover {background-color: #ddd;}

#dashboardtable th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}

h3.thick {
  font-weight: bold;
  margin-left: 12px;
  font-style: italic;
}


/*.dashboardtable{
margin-left: 300px;
width: 50% !important;	
}
.dthead {
	text-align: left;
}
.dtr {
	background-color: #dccdc;
}*/
.lex {
float: right;
margin: 5% 10%;
background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    border: none;
    cursor: pointer;
    width: 5%;
    opacity: 0.9;
}
a {
text-decoration: none;
}

#bdy {
    /* The image used */
    background-image: url("https://img.freepik.com/free-photo/flat-lay-travel-planning-with-blank-space-travel-itinerary-planner-white-background_41775-495.jpg?w=1060");
    /*https://i.pinimg.com/originals/b4/4c/66/b44c665c88d2d14d1b4a6904bd133acb.gif*/
	
    /* Full height */
    height: 100%;
    background-size: cover;
    position: relative;
    
    

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    
}
</style>
</head>
<body id="bdy">
<h3 class="thick">Welcome ${loggedUser.getUserfirstname()}</h3>
<div class="previoustravelplans">
<% 
 if(session.getAttribute("usertravelplans") != null)
 {
	 System.out.println("not null");
	 ArrayList<Usertravelplan> a = (ArrayList<Usertravelplan>)session.getAttribute("usertravelplans"); 
 %>
 <table id="dashboardtable">
					<!--  <thead >-->
					<tr>
						<th>Plan name</th>
						<th>Country</th>
						<th>Month</th>
						<th>Budget</th>
						<th>Post Review</th>
									</tr>
					<!--  </thead >-->

<tbody class="dtr">
<% 
for(Usertravelplan u : a) 
{ %>
<tr>
	<td><%out.println(u.getPlan()); %></td>
	<td><%out.println(u.getCountry()); %></td>
	<td><%out.println(u.getMonth()); %></td>
	<td><%out.println(u.getBudget()); %></td>

<td><button><a href="postreviews?username=<%=u.getuserName()%>&plan=<%=u.getPlan()%>">Post reviews</a></button></td></tr>
<% } %>										
</tbody>

 
</table>
	 
 
 <% }
 else
 { %>
	 <div class="noplans">
	<%  out.println("Not travelled yet"); %>
	 </div>
 <%   } %>
  
 	</div>

<div>
<br /><br /><br />
<center><form method="GET"  action="/lex1" style="margin-right: 500px">
<button type="submit" class="button">Travel Chat</button> 
</form><center>

</div>
 </body>
 <style>
 .noplans {
 text-align: center;
 }
 .button {
  display: inline-block;
  padding: 15px 25px;
  font-size: 24px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
 </style>
 <script>
	var message = $("h2").text();
	 var audio = new Audio('audio?msg=' + message);
    audio.play();
 </script>
</html>
 