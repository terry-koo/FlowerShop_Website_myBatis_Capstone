<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String kakaoid = request.getParameter("kakaoid");
	session.setAttribute("session_customer_id", kakaoid);
%>

<%=kakaoid %>

</body>

</html>