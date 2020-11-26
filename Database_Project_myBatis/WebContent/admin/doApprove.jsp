<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>doApprove</title>
</head>
<body>
<%
	String[] orders_id = request.getParameterValues("order_id");
	String result_message = null;	

	String doApproveStmtURI = "mybatis.repository.mapper.orderMapper2.doApprove";
	SqlSession sqlSession = AzureMySQLDB.openSession();
	try{
		int result = 0; 
		for(String order_id : orders_id){
			result += sqlSession.update(doApproveStmtURI, order_id);
		}
		if(result>=orders_id.length){
			sqlSession.commit();
			result_message = "처리완료";
		}
	}
	catch(Exception e){
		System.out.println(e.getMessage());
		sqlSession.rollback();
		result_message = "처리실패";
	}
	finally{
		sqlSession.close();
		session.setAttribute("session_message", result_message);
		response.sendRedirect("orderManagement.jsp");
	}
	
%>
</body>
</html>