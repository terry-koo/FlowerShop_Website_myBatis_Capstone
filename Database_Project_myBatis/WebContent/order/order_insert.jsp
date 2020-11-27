<%@page import="mybatis.model.Order"%>
<%@page import="project.util.NowAsHashCode"%>
<%@page import="mybatis.model.VProductArticlePictureLatest"%>
<%@page import="java.util.Date"%>
<%@page import="mybatis.repository.session.SessionRepository"%>
<%@page import="project.util.NowAsHashCode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
VProductArticlePictureLatest product = (VProductArticlePictureLatest)session.getAttribute("product");

long quantity = Long.parseLong(request.getParameter("quantity"));
String request_comment = request.getParameter("content");
Date order_date = new Date();
String recipient_name = request.getParameter("name");
String recipient_phone = request.getParameter("phone");
String recipient_address = request.getParameter("address");


String product_id = product.getProduct_id();
long price = product.getPrice();
String order_id = NowAsHashCode.toString("O");
String customer_id = customerInfoHeader.getCustomer_id();
long type_code = Long.parseLong(request.getParameter("type_code"));



	Order order = new Order();
	order.setCustomer_id(customer_id);
	order.setIn_cart("F");
	order.setIn_order("T");
	order.setIs_approved("F");
	order.setIs_delivered("F");
	order.setOrder_date(order_date);
	order.setOrder_id(order_id);
	order.setPrice(price);
	order.setProduct_id(product_id);
	order.setQuantity(quantity);
	order.setRequest_comment(request_comment);
	order.setType_code(type_code);
	order.setRecipient_address(recipient_address);
	order.setRecipient_name(recipient_name);
	order.setRecipient_phone(recipient_phone);
	
	SessionRepository s = new SessionRepository();
	s.insertOrder(order);

%>

<script>
var answer = confirm ("주문완료! 현재 주문상태 바로 확인하기");
if (answer){
window.location.href = "../basket/myOrder.jsp";
}
else{
	window.location.href = "../home/index.jsp";
}
</script>

</body>
</html>