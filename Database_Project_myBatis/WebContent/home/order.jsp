<%@page import="project.util.NowAsHashCode"%>
<%@page import="java.util.Date"%>
<%@page import="mybatis.model.VProductArticlePictureLatest"%>
<%@page import="mybatis.repository.session.SessionRepository"%>
<%@page import="project.util.NowAsHashCode"%>
<%@page import="java.util.List"%>

<%@page import="mybatis.model.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문</title>
</head>

<style>
  table, th, td {
    border: 1px solid #5555ff;
    margin: auto;
  }
  table {
    width: 700px;
    
  }
</style>


<body>

<%
	request.setCharacterEncoding("utf-8");
	VProductArticlePictureLatest product = (VProductArticlePictureLatest)session.getAttribute("product");
	String action = request.getParameter("action");
	
	
	String product_id = product.getProduct_id();
	long price = product.getPrice();
	String customer_id = customerInfoHeader.getCustomer_id();
	long type_code = Integer.parseInt(request.getParameter("type"));
	String order_id = NowAsHashCode.toString("O");
	long quantity = Long.parseLong(request.getParameter("quantity"));
	
	
%> 

<%
	if(action.equals("장바구니")){
		Order order = new Order();
		order.setCustomer_id(customer_id);
		order.setIn_cart("T");
		order.setIn_order("F");
		order.setIs_approved("F");
		order.setIs_delivered("F");
		order.setOrder_date(null);
		order.setOrder_id(order_id);
		order.setPrice(price);
		order.setProduct_id(product_id);
		order.setQuantity(quantity);
		order.setRequest_comment(null);
		order.setType_code(type_code);
		
		SessionRepository s = new SessionRepository();
		s.insertOrder(order);
		%>
		<script>
		alert('장바구니에 담겼습니다');
		history.go(-1);
		</script>
		
		<%
	}

%>


<div style="height:170px;"></div>
<div style="border: 1px dashed #BDBDBD; background-color: #D1B2FF; margin:auto; padding: 5px; text-align: center;">

<form action="order_insert.jsp" method="post">
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
	<td colspan="2"><h3>결제 정보</h3></td>
</tr>
<tr>
	<td>총상품 가격</td>
	<td><%= price %></td>
</tr>

<tr>
	<td colspan="2">
		<input type="submit" value="주문하기"/>
		<input type="hidden" name="type_code" value="<%= type_code%>"/>
		<input type="hidden" name="quantity" value="<%= quantity%>"/>
	</td>
</tr>


</table>
</form>

</div>




</body>
</html>