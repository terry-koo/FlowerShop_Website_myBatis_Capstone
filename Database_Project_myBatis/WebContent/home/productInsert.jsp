<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mybatis.model.Product" %>    
<%@ page import="mybatis.repository.session.SessionRepository" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
int variety = Integer.parseInt(request.getParameter("variety")); 
String name = request.getParameter("name");
int price = Integer.parseInt(request.getParameter("price"));
int quantity = Integer.parseInt(request.getParameter("quantity"));
String available = request.getParameter("available");
String imform = request.getParameter("imform");
String text = request.getParameter("text"); 



Product product = new Product();
product.setVariety(variety);
product.setIsAvailable(available);
product.setName(name);
product.setImform(imform);
product.setText(text);
product.setPrice(price);
product.setQuantity(quantity);

SessionRepository a = new SessionRepository();
Integer result = a.insertProduct(product);


%>


</body>
</html>