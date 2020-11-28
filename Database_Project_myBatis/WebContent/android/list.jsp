<%@page import="java.util.ArrayList"%>
<%@page import="android.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   

   String num1 = request.getParameter("dataType");

%>
<%
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
	   System.out.println("수신한 데이터 type2= "+ age + " : " + sex); //////
	   
   }else{
      System.out.println("데이터 수신 실패");
   }
%>