<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="
	mybatis.model.CustomerInfo,
	mybatis.repository.session.AzureMySQLDB,
	org.apache.ibatis.session.SqlSession,
	java.util.HashMap
"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 동작</title>
</head>
<body>

<%

	String email = request.getParameter("email");
	String password = request.getParameter("psw");
	HashMap<String, String> parameter = new HashMap<>();
	parameter.put("email", email);
	parameter.put("password", password);
	String stmtURI = "mybatis.repository.mapper.selectCustomerInfoByEmailAndPW";

	
	SqlSession sqlSession = AzureMySQLDB.openSession();
	CustomerInfo customerInfo;
	try {
		customerInfo = sqlSession.selectOne(stmtURI, parameter);
	}finally{
		sqlSession.close();
	}
	
	

	String redirect = (String)session.getAttribute("session_redirect");
	if(customerInfo != null){
		session.setAttribute("session_customerInfo", customerInfo);
		if( redirect != null){
			response.sendRedirect(redirect);
		}
		else{
			response.sendRedirect("../home/index.jsp");
		}
	}
	else{
		response.sendRedirect("login.jsp?loginFailed=true");
	}

%>	
</body>
</html>