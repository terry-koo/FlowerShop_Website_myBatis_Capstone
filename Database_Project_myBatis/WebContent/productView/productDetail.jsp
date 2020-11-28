<%@page import="mybatis.model.VProductArticlePictureLatest"%>
<%@page import="java.util.List"%>
<%@page import="project.util.VProductManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 세부 페이지</title>
</head>

<style>
  table, th, td {
    border: 1px solid #5555ff;
    margin: auto;
  }
  table {
    width: 60%;
    height: 800px;
    color: black;
  }
  
</style>

<body>
<%
 int index = Integer.parseInt(request.getParameter("index"));
 List<VProductArticlePictureLatest> list =  VProductManager.getList();
 session.setAttribute("product",list.get(index));

%>

<div style="height:170px;"></div>
<div style="border: 1px dashed #BDBDBD; background-color: #c2d0f2; margin:auto; padding: 5px; text-align: center;">

<form action="../order/order.jsp" method="post">
<table>
<tr>
<td height="400px" width="70%" rowspan="6"><img src="<%=list.get(index).getPicture()%>" style="width:920px;height:610px;"></td>
<td> 상품명 : <%= list.get(index).getTitle() %> </td>
</tr>

<tr>
	<td>가격 :<fmt:formatNumber value="<%= list.get(index).getPrice() %>" type="currency"/> 원</td>
</tr>

<tr>
	<td>수량 : <input type="number"  name="quantity" max="20" placeholder="주문 수량">개</td>
</tr>

<tr>
	<td>
		<b>타입 :</b> <input type="radio" name="type" value="1">축하
		<input type="radio" name="type" value="2">결혼<br>
		<input type="radio" name="type" value="3">입학
		<input type="radio" name="type" value="4">장례
		<input type="radio" name="type" value="5">이벤트
	</td>
</tr>

<tr>
	<td><input type="submit" name="action" value="구매하기" /> <input type="submit" name="action" value="장바구니" /></td>
</tr>

<tr>
	<td><input type="button" value="좋아요" onClick='alert("인기도 상승")'/></td>
</tr>



<tr>
<td colspan="2"><%= list.get(index).getContent() %><br></td>
</tr>
</table>
</form>

</div>
</body>
</html>