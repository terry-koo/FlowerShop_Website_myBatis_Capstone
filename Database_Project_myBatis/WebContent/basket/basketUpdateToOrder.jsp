<%@page import="java.util.Date"%>
<%@page import="mybatis.repository.session.SessionRepository"%>
<%@page import="mybatis.model.Order"%>
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
	SessionRepository a = new SessionRepository();
	request.setCharacterEncoding("utf8");
	int result = 0;

	String[] order_id = (String[])session.getAttribute("order_id");
	for(int i = 0; i<order_id.length; i++){
		String recipient_name = request.getParameter("name");
		String recipient_address = request.getParameter("address");
		String recipient_phone = request.getParameter("phone");
		String request_comment = request.getParameter("content");
		String in_cart = "F";
		String in_order = "T";
		
		Order order = new Order();
		order.setRecipient_address(recipient_address);
		order.setRecipient_name(recipient_name);
		order.setRecipient_phone(recipient_phone);
		order.setRequest_comment(request_comment);
		order.setIn_cart(in_cart);
		order.setIn_order(in_order);
		order.setOrder_id(order_id[i]);
		order.setOrder_date(new Date());
		
		result += a.updateOrder(order);
	}
	
	if(result>0){
%>
	<jsp:forward page="basketSuccess.jsp"/>
<%
	}else{
%>
	<script type="text/javascript">
	alert('주문실패');
	history.go(-1);
	</script>
<%	} %>
</body>
</html>