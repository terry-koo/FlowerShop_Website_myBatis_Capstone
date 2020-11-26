<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="
	mybatis.model.OrderInfoForAdmin,
	java.util.List,
	java.util.ArrayList,
	java.util.stream.Collectors
 "%>
 <%@ include file="checkAuthority.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 관리</title>
</head>
<link rel="stylesheet" href="orderManagement.css">
<body>
<%

	String session_message = (String) session.getAttribute("session_message");
	session.removeAttribute("session_message");

	if(session_message == "처리실패"){
		
%>
<div id="topMessageBox">
	<h3 style="margin-top:0px;">처리실패</h3>
</div>
<%} else if(session_message == "처리완료"){ %>
<div id="topMessageBox" style="background-color:#3aff3a;">
	<h3 style="margin-top:0px;">처리완료</h3>
</div>
<%} %>

<%
	HashMap<String, String> orderParam = new HashMap<>();
	orderParam.put("in_cart", "F");
	orderParam.put("in_order", "T");


	String orderStmtURI = "mybatis.repository.mapper.orderMapper2.selectOrderORCart";
	SqlSession sqlSession = AzureMySQLDB.openSession();	
	ArrayList<OrderInfoForAdmin> orderInfo = null;
	try{
		List<Object> temp = sqlSession.selectList(orderStmtURI, orderParam);
		orderInfo = (ArrayList<OrderInfoForAdmin>) temp.stream().map(obj->(OrderInfoForAdmin)obj).collect(Collectors.toList());
	}
	catch(Exception e){
		System.out.println(e.getMessage());
	}
	finally{
		sqlSession.close();
	}
	
%>

<% ArrayList<OrderInfoForAdmin> notApprovedList = 
(ArrayList<OrderInfoForAdmin>) orderInfo.stream().filter(obj->obj.getIs_approved()=='F'? true:false).collect(Collectors.toList());%>
<div id="mainBox">
<div style="width:1140px; background-color:yellow;">
	<h3 style="text-align:center;">새로운 주문</h3>
</div>
<form action="doApprove.jsp" method="post">
<table>
	<tr>
		<td rowspan="2" class="firstBlank"></td>
		<td class="secondBlank">주문번호<br>(주문일자)</td>
		<td class="thirdBlank">상품정보</td>
		<td class="fourthBlank">제품형태</td>
		<td class="fifthBlank">수량(가격)</td>
	</tr>
	<tr style="border-bottom:black solid 2px;">
		<td></td>
		<td class="secondBlank">주문자</td>
		<td class="thirdBlank">추가 요구사항</td>
		<td class="fourthBlank"></td>
		<td class="fifthBlank"></td>
	</tr>
	<%
	for(OrderInfoForAdmin eachOrder : notApprovedList){
	%>
	<tr>
		<td rowspan="2" class="firstBlank"><input type="checkbox" name="order_id" value="<%=eachOrder.getOrder_id() %>"></td>
		<td class="secondBlank"><%=eachOrder.getOrder_id() %><br>(<%=eachOrder.getOrder_date() %>)</td>
		<td class="thirdBlank"><%=eachOrder.getTitle() %></td>
		<td class="fourthBlank"><%=eachOrder.getProduct_variety_name() %></td>
		<td class="fifthBlank"><%=eachOrder.getQuantity() %>(<%=eachOrder.getPrice() %>)</td>
	</tr>
	<tr class="eachLine">
		<td></td>
		<td class="secondBlank"><%=eachOrder.getCustomer_id() %></td>
		<td class="thirdBlank"><%=eachOrder.getRequest_comment() %></td>
		<td class="fourthBlank"></td>
		<td class="fifthBlank"></td>
	</tr>
	
	<%} %>
</table>
<input type="submit" value="승인" style="background-color:yellow;">
</form>

<br>
<br>
<hr>
<br>
<br>

<% ArrayList<OrderInfoForAdmin> ApprovedList = 
(ArrayList<OrderInfoForAdmin>) orderInfo.stream().filter(obj->obj.getIs_approved()=='T' && obj.getIs_delivered()=='F').collect(Collectors.toList());%>
<div style="width:1140px; background-color:orange;">
	<h3 style="text-align:center;">처리중인 주문</h3>
</div>
<form action="doDeliver.jsp" method="post">
<table>
	<tr>
		<td rowspan="2" class="firstBlank"></td>
		<td class="secondBlank">주문번호<br>(주문일자)</td>
		<td class="thirdBlank">상품정보</td>
		<td class="fourthBlank">제품형태</td>
		<td class="fifthBlank">수량(가격)</td>
	</tr>
	<tr style="border-bottom:black solid 2px;">
		<td></td>
		<td class="secondBlank">주문자</td>
		<td class="thirdBlank">추가 요구사항</td>
		<td class="fourthBlank"></td>
		<td class="fifthBlank"></td>
	</tr>
	<%
	for(OrderInfoForAdmin eachOrder : ApprovedList){
	%>
	<tr>
		<td rowspan="2" class="firstBlank"><input type="checkbox" name="order_id" value="<%=eachOrder.getOrder_id() %>"></td>
		<td class="secondBlank"><%=eachOrder.getOrder_id() %><br>(<%=eachOrder.getOrder_date() %>)</td>
		<td class="thirdBlank"><%=eachOrder.getTitle() %></td>
		<td class="fourthBlank"><%=eachOrder.getProduct_variety_name() %></td>
		<td class="fifthBlank"><%=eachOrder.getQuantity() %>(<%=eachOrder.getPrice() %>)</td>
	</tr>
	<tr class="eachLine">
		<td></td>
		<td class="secondBlank"><%=eachOrder.getCustomer_id() %></td>
		<td class="thirdBlank"><%=eachOrder.getRequest_comment() %></td>
		<td class="fourthBlank"></td>
		<td class="fifthBlank"></td>
	</tr>
	
	<%} %>
</table>
<input type="submit" value="배달완료" style="background-color:#3aff3a;">
</form>

</div>

</body>
</html>