<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="
	mybatis.repository.session.SessionRepository,
	mybatis.model.CustomerInfo,
	mybatis.repository.session.AzureMySQLDB,
	org.apache.ibatis.session.SqlSession,
	java.util.HashMap
"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String kakaoid = request.getParameter("kakaoid");
	HashMap<String, String> parameter = new HashMap<>();
	parameter.put("id", kakaoid);
	String stmtURI = "mybatis.repository.mapper.customerMapper.selectCustomerInfoByID";
	
	
	
	SqlSession sqlSession = AzureMySQLDB.openSession();
	CustomerInfo customerInfo;
	try {
		customerInfo = sqlSession.selectOne(stmtURI, parameter);
	}finally{
		sqlSession.close();
	}

	
	
	String redirect = (String)session.getAttribute("session_redirectURL");
	session.removeAttribute("session_redirectURL");
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
		response.sendRedirect("kakaoJoinService.jsp");
	}
%>


</body>

</html>