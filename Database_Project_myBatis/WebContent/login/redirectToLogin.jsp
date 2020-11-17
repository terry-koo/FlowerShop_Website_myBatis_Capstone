<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>redirect to login.jsp</title>
</head>
<body>
<%
	
	response.sendRedirect(contextPath+"/login/login.jsp");
%>

</body>
</html>