<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="
	mybatis.model.CustomerInfo
"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 로그인 정보 조회</title>
</head>
<body>

<%
	String session_customer_info = ((CustomerInfo) session.getAttribute("session_customerInfo")).toStringByHTML();
%>

<%= session_customer_info%>

</body>
</html>