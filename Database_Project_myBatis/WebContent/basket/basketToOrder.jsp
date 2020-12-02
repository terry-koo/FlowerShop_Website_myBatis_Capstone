<%@page import="mybatis.model.Basket"%>
<%@page import="java.util.*"%>
<%@page import="mybatis.repository.session.SessionRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매하기</title>
</head>

<style>
  table, th, td {
    border: 1px solid #5555ff;
    margin: auto;
  }
  table {
    width: 700px;
    color: black;
    
  }
</style>


<body>

<%
	request.setCharacterEncoding("utf8");
	String[] order_id = request.getParameterValues("order_id");
	session.setAttribute("order_id", order_id);
	
	int priceSum = 0;
	for(int i = 0; i<order_id.length; i++){
		priceSum += SessionRepository.selectOrder(order_id[i]).getPrice()*SessionRepository.selectOrder(order_id[i]).getQuantity();
	}


%>


<div style="height:170px;"></div>
<div style="border: 1px dashed #BDBDBD; background-color: #c2d0f2; margin:auto; padding: 5px; text-align: center;">

<form action="basketUpdateToOrder.jsp" method="post">
<table>

<tr>
	<td colspan="2"><h3>주문자 정보</h3></td>
</tr>
<tr>
	<td>이름</td>
	<td><%= customerInfoHeader.getName() %></td>
</tr>

<tr>
	<td>이메일</td>
	<td><%= customerInfoHeader.getEmail() %></td>
</tr>

<tr>
	<td>휴대폰 번호</td>
	<td><%= customerInfoHeader.getPhone() %></td>
</tr>



<tr>
	<td colspan="2"><h3>받는사람 정보</h3></td>
</tr>
<tr>
	<td>이름</td>
	<td><input type="text" size="10" name="name"/></td>
</tr>

<tr>
	<td>배송지</td>
	<td><input type="text" size="40" name="address"/></td>
</tr>

<tr>
	<td>연락처</td>
	<td><input type="text" size="20" name="phone"/></td>
</tr>

<tr>
	<td>요청사항</td>
	<td><textarea name="content" style="width:400px; height:100px; resize:none;"></textarea></td>
</tr>

<tr>
	<td>문구 선택</td>
	<td>
		<select name="letter" >
	      <option value="">편지문구 필요없음</option>
	      <option value="1" >졸업 축하합니다</option>
	      <option value="2" >생신 축하드립니다</option>
	      <option value="3" >축하합니다</option>
	      <option value="4" >부모님 감사합니다</option>
	      <option value="5" >사랑합니다</option>
	    </select>
    </td>
</tr>


<tr>
	<td colspan="2"><h3>선택 상품명</h3></td>
<tr>
<%

for(int i = 0; i<order_id.length; i++){
	Basket basket = SessionRepository.selectBasketWithOrderId(order_id[i]);
%>

<tr>
	<td><%= basket.getQuantity() %> 개</td>
	<td><%= basket.getTitle() %></td>
</tr>

<%	
}
%>

<tr>
	<td colspan="2"><h3>결제 정보</h3></td>
</tr>
<tr>
	<td>총상품 가격 </td>
	<td><%= priceSum %> 원</td>
</tr>



<tr>
	<td colspan="2">
		<input type="submit" value="주문하기"/>
	</td>
</tr>


</table>
</form>

</div>

</body>
</html>