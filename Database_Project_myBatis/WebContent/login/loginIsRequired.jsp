<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	if(customerInfoHeader == null){
		session.setAttribute("session_redirectURL", request.getRequestURL().toString());
		%>
		<jsp:forward page="/login/redirectToLogin.jsp"/>
<%
	}
%>
</body>
</html>