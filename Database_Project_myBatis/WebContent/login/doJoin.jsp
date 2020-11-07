<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="
	mybatis.repository.session.AzureMySQLDB,
	org.apache.ibatis.session.SqlSession,
	java.util.HashMap
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


	HashMap<String, String> newUserInfoMap = new HashMap<>();

	newUserInfoMap.put("customer_id","temp33");
	newUserInfoMap.put("authority_code", "4");
	newUserInfoMap.put("password", request.getParameter("sec"));
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
	}
	finally{
		sqlSession.close();
	}
%>

</body>
</html>