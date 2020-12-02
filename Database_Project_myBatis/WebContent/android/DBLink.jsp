<%@page import="project.util.SHAEncoder"%>
<%@page import="project.util.NowAsHashCode"%>
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
			System.out.println("로그인 시도 : " +"아이디 = " + email + "/비밀번호= " + password + "/ip= " + request.getRemoteAddr());
			HashMap<String, String> parameter = new HashMap<>();
			parameter.put("email", email);
			parameter.put("password", SHAEncoder.doSHAEncode(password));
			
			String stmtURI = "mybatis.repository.mapper.customerMapper.selectCustomerInfoByEmailAndPW";
			SqlSession sqlSession = AzureMySQLDB.openSession();
			CustomerInfo customerInfo = null;
			try {
				customerInfo = sqlSession.selectOne(stmtURI, parameter);
				
				if(customerInfo != null){
					session.setAttribute("session_customerInfo", customerInfo);
					session.setAttribute("session_login", "LOGIN_SUCCESS");
					
					System.out.println(((CustomerInfo)session.getAttribute("session_customerInfo")).getCustomer_id());
				}else{
					session.setAttribute("session_login", "LOGIN_FAIL");
				}
				
			}
			catch(Exception e){
				session.setAttribute("session_message", "loginFailed");
				out.print("LOGIN_FAIL");
				
			}
			finally{
				sqlSession.close();
			}
			
			StringBuilder  result = new StringBuilder();
			result.append("result=>\n");
			
			/*CustomerInfo customer = (CustomerInfo)session.getAttribute("session_customerInfo");
			result.append(customer.getAddress()); *///
			
			result.append((String)session.getAttribute("session_login"));
			out.print(result.toString());
			break;
			
		//회원가입	
		case "register":
			StringBuilder  result2 = new StringBuilder();
			result2.append("result=>\n");
			
			String UserEmail = request.getParameter("id");
			String UserPwd = request.getParameter("password");
			String UserName = request.getParameter("name");
			String UserAddress = request.getParameter("address");
			String UserPhone = request.getParameter("phone");
			String customer_id = NowAsHashCode.toString("cb");
			Customer customer = new Customer();
			customer.setEmail(UserEmail);
			customer.setPassword(SHAEncoder.doSHAEncode(UserPwd));
			customer.setName(UserName);
			customer.setAddress(UserAddress);
			customer.setPhone(UserPhone);
			customer.setCustomer_id(customer_id);
			customer.setAuthority_code(4);
			
			System.out.println(UserEmail+"/"+UserPwd+"/"+UserName+"/"+UserAddress+"/"+UserPhone+"/"+customer_id+"/"+customer.birthday+"/"+customer.gender);
			
			String stmtURI_customer_basic = "mybatis.repository.mapper.androidCustomerMapper.insertCustomerBasic";
			String stmtURI_customer_detail = "mybatis.repository.mapper.androidCustomerMapper.insertCustomerDetail";
			SqlSession sqlSession2 = AzureMySQLDB.openSession();
			try{
				int re1 = sqlSession2.insert(stmtURI_customer_basic, customer);
				int re2 = sqlSession2.insert(stmtURI_customer_detail, customer);
				if(re1*re2>0){
					sqlSession2.commit();
					result2.append("REGISTER_SUCCESS");
					out.print(result2.toString());
				}
				else{
					sqlSession2.rollback();
					result2.append("REGISTER_FAIL");
					out.print(result2.toString());
					System.out.print(result2.toString());
				}
			}
			catch(Exception e){
				sqlSession2.rollback();
				result2.append("REGISTER_FAIL");
				out.print(result2.toString());
				System.out.print(result2.toString());
				System.out.print(e);
			}
			finally{
				sqlSession2.close();
			}
			
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