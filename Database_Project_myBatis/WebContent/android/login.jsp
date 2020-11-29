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
	request.setCharacterEncoding("utf8");


	String email = request.getParameter("email");
	String password = request.getParameter("psw");
	HashMap<String, String> parameter = new HashMap<>();
	parameter.put("email", email);
	parameter.put("password", password);
	
	
	String stmtURI = "mybatis.repository.mapper.customerMapper.selectCustomerInfoByEmailAndPW";
	SqlSession sqlSession = AzureMySQLDB.openSession();
	CustomerInfo customerInfo = null;
	try {
		customerInfo = sqlSession.selectOne(stmtURI, parameter);
	}
	catch(Exception e){
		session.setAttribute("session_message", "loginFailed");
		response.sendRedirect("login.jsp");
	}
	finally{
		sqlSession.close();
	}


%>



</body>
</html>