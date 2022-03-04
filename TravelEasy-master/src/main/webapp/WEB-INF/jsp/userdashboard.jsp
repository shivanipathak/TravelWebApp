<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="/resources/script.js"></script>
        
<title>Reviews</title>
<script type="application/javascript">
 function getreviews() {
	 var planname = $("#planname").val(); 
	 alert("hi");
	
	 $.get("retrievereviews",{planname:planname},function(data){

     $("#displayreviews").html(data);
	 
     });
 }

</script>
</head>
<body>
<input type="button" value="Creazione Nuovo Corso" name="CreateCourse" 
onclick="document.forms[0].action = 'index'; return true;" />
<% String useremailid ="user1";
String companyname ="company1";
String plan ="plan1"; %>
<a href="postreviews?useremailid=<%=useremailid%>&companyname=<%=companyname%>&plan=<%=plan%>">Postreview</a>
<input type="hidden" id="planname" value="ab">
<button type="submit" id="getreviews" class="getreviews" onClick="getreviews()" >Reviews</button>
<div id="displayreviews"></div>
 </body>
 
</html>
 