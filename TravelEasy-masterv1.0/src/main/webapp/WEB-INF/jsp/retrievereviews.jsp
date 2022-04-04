<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   String q = request.getParameter("plan");
System.out.println(q);
   try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://travelapp1.c7m1brswcf1h.us-east-1.rds.amazonaws.com:3306/travelapp", "travelapp1", "root1234");
        Statement smt = con.createStatement(); //Create Statement to interact
        ResultSet r = smt.executeQuery("select * from reviews where(plan='" + q + "');");
        int count = 0;
        while (r.next()) { 
        	String name = r.getString("userName"); %>
    <div class="dynamicreviews" style="width: 30%; float: left;">
   
     <img src="<%=r.getString("imageurl")%>" alt="" height="300" width="300" />   
       <p>Username:  <%=r.getString("userName")%> </p> 
     <p>Comment:  <%=r.getString("comment")%> </p> 
     </div> 
     <% count = count+1;
          
        } 
       
			if (count == 0)
			{ %>
				<p style="text-align: center;">No reviews </p>
			<% }
       con.close();  
   } catch (Exception e) {
        e.printStackTrace();
   }
%>

</body>
</html>