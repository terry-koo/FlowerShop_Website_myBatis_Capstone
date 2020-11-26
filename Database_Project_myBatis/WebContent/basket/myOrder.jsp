<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="
	mybatis.model.OrderInfoForAdmin,
	java.util.List,
	java.util.ArrayList,
	java.util.stream.Collectors
 "%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
</head>
<link rel="stylesheet" href="myOrder.css">
<body>
<%

	String customer_id = customerInfoHeader.getCustomer_id();


	String orderStmtURI = "mybatis.repository.mapper.orderMapper2.selectMyOrder";
	SqlSession sqlSession = AzureMySQLDB.openSession();	
	ArrayList<OrderInfoForAdmin> orderInfo = null;
	try{
		List<Object> temp = sqlSession.selectList(orderStmtURI, customer_id);
		orderInfo = (ArrayList<OrderInfoForAdmin>) temp.stream().map(obj->(OrderInfoForAdmin)obj).collect(Collectors.toList());
	}
	catch(Exception e){
		System.out.println(e.getMessage());
	}
	finally{
		sqlSession.close();
	}
%>


<div id="mainBox">
<div style="width:1140px; background-color:yellow;">
	<h3 style="text-align:center;">주문내역</h3>
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
		<td class="secondBlank"></td>
		<td class="thirdBlank">추가 요구사항</td>
		<td class="fourthBlank"></td>
		<td class="fifthBlank">주문상태</td>
	</tr>
	<%
	for(OrderInfoForAdmin eachOrder : orderInfo){
	%>
	<tr>
		<%String checked = eachOrder.getIs_delivered()=='T'? "checked":""; %>
		<td rowspan="2" class="firstBlank"><input type="checkbox" name="order_id" value="<%=eachOrder.getOrder_id() %>" <%=checked %>></td>
		<td class="secondBlank"><%=eachOrder.getOrder_id() %><br>(<%=eachOrder.getOrder_date() %>)</td>
		<td class="thirdBlank"><%=eachOrder.getTitle() %></td>
		<td class="fourthBlank"><%=eachOrder.getProduct_variety_name() %></td>
		<td class="fifthBlank"><%=eachOrder.getQuantity() %>(<%=eachOrder.getPrice() %>)</td>
	</tr>
	<tr class="eachLine">
		<td></td>
		<td class="secondBlank"></td>
		<td class="thirdBlank"><%=eachOrder.getRequest_comment() %></td>
		<td class="fourthBlank"></td>
		<%if(eachOrder.getIs_delivered()=='T'){ %><td class="fifthBlank" style="background-color:#3aff3a;">배달완료</td><%} 
		else if(eachOrder.getIs_approved()=='F'){ %><td class="fifthBlank"  style="background-color:#yellow;">확인중</td><%} 
		else if(eachOrder.getIs_approved()=='T'){ %><td class="fifthBlank"  style="background-color:orange;">주문승인</td><%}
		else{%> <td class="fifthBlank">주문상태 확인불가</td><%} %>
		
		
	</tr>
	
	<%} %>
</table>
</form>
</div>
</body>
</html>