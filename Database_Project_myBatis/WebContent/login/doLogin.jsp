<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		session.setAttribute("session_message", "loginFailed");
		response.sendRedirect("login.jsp");
	}

%>	
</body>
</html>