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
	if(customerInfoHeader != null){
		if(customerInfoHeader.getAuthority_code() >= 3){
		%>
		<jsp:forward page="adminDenied.jsp"/>
<%		}
	}
	else{
		%>
		<jsp:forward page="adminDenied.jsp"/>
		<%
	}
%>
</body>
</html>