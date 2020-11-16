<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 업데이트</title>
</head>
<body>
<%
	
SqlSession sqlSession = AzureMySQLDB.openSession();
try{
	//change name
	String name = request.getParameter("name");
	if(!name.equals(customerInfoHeader.getName())){
		HashMap<String, String> nameParam = new HashMap<>();
		nameParam.put("name",name);
		nameParam.put("customer_id",customerInfoHeader.getCustomer_id());
		
		String updateNameUri = "mybatis.repository.mapper.customerMapper.updateCustomerBasicName";
		int nameResult = sqlSession.update(updateNameUri, nameParam);
		if(nameResult <= 0){
			throw new Exception("이름 수정 실패");
		}
	}
	
	//change password
	String password = request.getParameter("sec");
	if(!password.equals("")){
		HashMap<String, String> passwordParam = new HashMap<>();
		passwordParam.put("password",password);
		passwordParam.put("customer_id",customerInfoHeader.getCustomer_id());
		
		String updatePasswordUri = "mybatis.repository.mapper.customerMapper.updateCustomerBasicPassword";
		int passwordResult = sqlSession.update(updatePasswordUri, passwordParam);
		if(passwordResult <= 0){
			throw new Exception("비밀번호 수정 실패");
		}
	}
	
	String phone = request.getParameter("phone");
	String gender = request.getParameter("gender");
	String birthday = request.getParameter("birthday");
	String address = request.getParameter("address");

	HashMap<String, String> detail = new HashMap<>();
	detail.put("phone", phone);
	detail.put("gender", gender);
	detail.put("birthday", birthday);
	detail.put("address", address);
	detail.put("customer_id",customerInfoHeader.getCustomer_id());

	String updateDetailUri = "mybatis.repository.mapper.customerMapper.updateCustomerDetail";
	int detailResult = sqlSession.update(updateDetailUri, detail);
	if(detailResult <= 0){
		throw new Exception("회원정보 수정 실패");
	}
	sqlSession.commit();
	session.setAttribute("session_customerInfo", CustomerInfo.getCustomerInfoById(customerInfoHeader.getCustomer_id()));
	session.setAttribute("session_message", "수정 완료");
	response.sendRedirect("userInfo.jsp");
	
}
catch(Exception e){
	sqlSession.rollback();
	session.setAttribute("session_message", e.getMessage());
	if(e.getMessage().length() > 20){
		session.setAttribute("session_message", "오류 발생. 다시 확인 후, 시도 해주세요. ");
	}
	response.sendRedirect("userInfo.jsp");
}
finally{
	sqlSession.close();
}
	
%>
</body>
</html>