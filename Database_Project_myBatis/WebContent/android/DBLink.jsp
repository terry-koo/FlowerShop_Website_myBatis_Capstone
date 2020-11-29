<%@page import="java.util.ArrayList"%>
<%@page import="android.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%	
	request.setCharacterEncoding("UTF-8");
	String dataType = request.getParameter("dataType");
	
	switch(dataType){
	
		//로그인
		case "login":
	
			String email = request.getParameter("id");
			String password = request.getParameter("password");
			HashMap<String, String> parameter = new HashMap<>();
			parameter.put("email", email);
			parameter.put("password", password);
			
			String stmtURI = "mybatis.repository.mapper.customerMapper.selectCustomerInfoByEmailAndPW";
			SqlSession sqlSession = AzureMySQLDB.openSession();
			CustomerInfo customerInfo = null;
			try {
				customerInfo = sqlSession.selectOne(stmtURI, parameter);
				session.setAttribute("session_customerInfo", customerInfo);
			}
			catch(Exception e){
				session.setAttribute("session_message", "loginFailed");
				response.sendRedirect("login.jsp");
			}
			finally{
				sqlSession.close();
			}
			
			StringBuilder  result = new StringBuilder();
			result.append("|result=|\n");
			CustomerInfo customer = (CustomerInfo)session.getAttribute("session_customerInfo");
			result.append(customer.getAddress());
			out.print(result.toString());
			break;
			
		//dataType 불일치	
		default:
			System.out.println("데이터 송수신 실패");//
			break;
	}	

/* 
   if (num1 == null) {
	   
	  System.out.println("타입이 null 입니다");
      return;
      
   }else if (num1.equals("type1")) {
	   
	   String num2 = request.getParameter("num3");
	   String num3 = request.getParameter("num3");
       System.out.println("수신한 데이터 type1= "+ num2 + " : " + num3);
       
   }else if (num1.equals("type2")) {
	   
	   String age = request.getParameter("age");
	   String sex = request.getParameter("sex");
	   System.out.println("수신한 데이터 type2= "+ age + " : " + sex); 
	   
   }else{
      System.out.println("데이터 수신 실패");
   } */
%>