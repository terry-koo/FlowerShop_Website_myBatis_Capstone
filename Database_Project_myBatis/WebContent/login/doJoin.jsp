<%@page import="project.util.SHAEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="
	project.util.NowAsHashCode,
	project.util.SHAEncoder
" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
String strBirthday = request.getParameter("birthyyyy");
strBirthday += "-"+request.getParameter("birthmm");
strBirthday += "-"+request.getParameter("birthdd");
String address = request.getParameter("address");
address += " "+request.getParameter("address_detail");
String customer_id = NowAsHashCode.toString("cb");
if(request.getParameter("kakaoID")!= null){
	customer_id = request.getParameter("kakaoID");
}
else{
	session.setAttribute("session_message", "joinFailed");
}

	HashMap<String, String> newUserInfoMap = new HashMap<>();
	
	newUserInfoMap.put("customer_id",customer_id);
	newUserInfoMap.put("authority_code", "4");
	newUserInfoMap.put("password", SHAEncoder.doSHAEncode(request.getParameter("sec")) );
	newUserInfoMap.put("name", request.getParameter("name"));
	newUserInfoMap.put("email", request.getParameter("email"));
	newUserInfoMap.put("birthday", strBirthday);
	newUserInfoMap.put("gender", request.getParameter("gender"));
	newUserInfoMap.put("phone", request.getParameter("phone"));
	newUserInfoMap.put("address",address);
	
	
	
	String stmtURI_customer_basic = "mybatis.repository.mapper.customerMapper.insertCustomerBasic";
	String stmtURI_customer_detail = "mybatis.repository.mapper.customerMapper.insertCustomerDetail";
	SqlSession sqlSession = AzureMySQLDB.openSession();
	try{
		int result1 = sqlSession.insert(stmtURI_customer_basic, newUserInfoMap);
		int result2 = sqlSession.insert(stmtURI_customer_detail, newUserInfoMap);
		if(result1*result2>0){
			sqlSession.commit();
			out.println(result1*result2);
		}
		else{
			sqlSession.rollback();
			session.setAttribute("session_message", "joinFailed");
			response.sendRedirect("login.jsp");
		}
	}
	catch(Exception e){
		sqlSession.rollback();
		session.setAttribute("session_message", "joinFailed");
		response.sendRedirect("login.jsp");
	}
	finally{
		sqlSession.close();
	}
	
	
	session.setAttribute("session_message", "joinSuccess");
	response.sendRedirect("login.jsp");
	
	
%>

</body>
</html>