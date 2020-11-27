<%@page import="mybatis.model.Basket"%>
<%@page import="java.util.*"%>
<%@page import="mybatis.repository.session.SessionRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>

<style>
  table, th, td {
    border: 1px solid #37a637;
    margin: auto;
  }
  table {
    width: 700px;
    color: black;
    
  }
</style>

<body style="background-color: #e6f3fa;">

<%
	List<Basket> basketList = null; 
	String customer_id = customerInfoHeader.getCustomer_id();

	List<Object> list = SessionRepository.selectBasket(customer_id);
	int size = list.size();
	
	if(size>0){
		basketList = new ArrayList<>();
		for(int i=0; i<size; i++){
			basketList.add((Basket)list.get(i)); 
		}
	}
	
	
	int priceSum = 0;

	
	
%>


<div style="height:170px; background-color: #e6f3fa;"></div>
<div style="border: 1px #BDBDBD; background-color: #e6f3fa; margin:auto; padding: 5px; text-align: center;">
<h1>내 장바구니</h1>

<form action="basketToOrder.jsp" method="post">
<table>

<%	
	if(basketList != null){
		for(int i=0; i<basketList.size(); i++){
%>

			<tr>
				<td>상품명</td>
				<td><%= basketList.get(i).getTitle() %></td>
				<td rowspan="3"> <input type="checkbox" name="order_id" value="<%= basketList.get(i).getOrder_id() %>"/></td>
			</tr>
			
			<tr>
				<td>개수</td>
				<td><%= basketList.get(i).getQuantity() %></td>
			</tr>
			
			<tr>
				<td>총 가격</td>
				<td><%= basketList.get(i).getQuantity()*basketList.get(i).getPrice() %> 원</td>
			</tr>
			
			<tr>
				<td colspan="3" height="10px"></td>
			</tr>

<%
			priceSum += basketList.get(i).getQuantity()*basketList.get(i).getPrice();
		}
%>
			<tr>
				<td colspan="3">
					<input type="submit" value="구매하기"/>
				</td>
			</tr>
<%		

	}else{
%>
	<tr>
		<td>장바구니가 비었습니다</td>
	</tr>
<%		
		
	}

	session.setAttribute("priceSum", priceSum);
%>
			
</table>
</form>

</div>



</body>
</html>