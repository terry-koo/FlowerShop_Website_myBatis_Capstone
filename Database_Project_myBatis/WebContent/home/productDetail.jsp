<%@page import="mybatis.model.VProductArticlePictureLatest"%>
<%@page import="java.util.List"%>
<%@page import="project.util.VProductManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  }
</style>

<body>
<%
 int index = Integer.parseInt(request.getParameter("index"));
 List<VProductArticlePictureLatest> list =  VProductManager.getList();
 request.setAttribute("product_id",list.get(index).getProduct_id());
%>

<div style="height:170px;"></div>
<div style="border: 1px dashed #BDBDBD; background-color: #D1B2FF; margin:auto; padding: 5px; text-align: center;">

<form action="buy.jsp" method="post">
<table>
<tr>
<td height="500px" width="70%" rowspan="5"><img src="<%=list.get(index).getPicture()%>"></td>
<td>상품명 : <%= list.get(index).getTitle() %></td>
</tr>

<tr>
	<td>가격 : <%= list.get(index).getPrice() %></td>
</tr>

<tr>
	<td>수량 : <input type="number" name="quantity" size="10">개</td>
</tr>

<tr>
	<td><input type="submit" value="구매하기" /> <input type="submit" value="장바구니" /></td>
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