<%@page import="project.util.NowAsHashCode"%>
<%@page import="java.security.MessageDigest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="
	project.util.VProductManager,
	mybatis.repository.session.SessionRepository,
	mybatis.model.VProductArticlePictureLatest,
	mybatis.model.Order,
	mybatis.model.OrderInfoForAdmin,
	java.util.Date,
	java.util.List,
	java.util.ArrayList,
	java.util.stream.Collectors
"%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String opCode = request.getParameter("opCode");
	
	switch(opCode){
	case "showZMainProduct":
		out.println(showZMainProduct());
		break;
	case "showZMyOrders":
		//System.out.println(((CustomerInfo)session.getAttribute("session_customerInfo")).getCustomer_id());
		//out.println(showZMyOrders(((CustomerInfo)session.getAttribute("session_customerInfo")).getCustomer_id()));
		out.println(showZMyOrders("cb754336749"));
		System.out.println("Don't blame me, I did it");
		break;
	case "makeOrder":
		System.out.println(((CustomerInfo)session.getAttribute("session_customerInfo")).getCustomer_id());
		out.println(
				makeOrder(
				//((CustomerInfo)session.getAttribute("session_customerInfo")).getCustomer_id(),
				"cb754336749",
				request.getParameter("orderType"),
				request.getParameter("amount"),
				request.getParameter("name"),
				request.getParameter("phone"),
				request.getParameter("address"),
				request.getParameter("requestComment"),
				request.getParameter("productID"),
				request.getParameter("price")
				));
		break;
	}


%>



</body>
</html>

<%!
//상품보기
	public static String showZMainProduct(){
		List<VProductArticlePictureLatest> productList = VProductManager.getList();
		StringBuilder  result = new StringBuilder();
		result.append("|result=|");
		for(VProductArticlePictureLatest product : productList){
			result.append("product start|");
			result.append(product.getProduct_variety_code()+"|");
			result.append(product.getIs_available()+"|");
			result.append(product.getProduct_id()+"|");
			result.append(product.getPrice()+"|");
			result.append(product.getArticle_id()+"|");
			result.append(product.getCustomer_id()+"|");
			result.append(product.getTitle()+"|");
			result.append(product.getContent()+"|");
			result.append(product.getIs_linked_to_product()+"|");
			result.append(product.getIs_registered()+"|");
			result.append(product.getRegistration_date()+"|");
			result.append(product.getPicture_id()+"|");
			result.append(product.getPicture()+"|");
			result.append("product end|");
		}
		result.append("end|");
		return result.toString();
	}
%>

<%!
//주문
	public static String makeOrder(String customerID, String orderType, String amount, String name, String phone, String address, String requestComment, String productID, String price){
//System.out.println(customerID+"\n"+orderType+"\n"+amount+"\n"+name+"\n"+phone+"\n"+address+"\n"+requestComment+"\n"+productID+"\n"+price);

	Order order = new Order();
	order.setCustomer_id(customerID);
	order.setIn_cart("F");
	order.setIn_order("T");
	order.setIs_approved("F");
	order.setIs_delivered("F");
	order.setOrder_date(new Date());
	order.setOrder_id(NowAsHashCode.toString("O"));
	long longPrice =Integer.parseInt(price)*Integer.parseInt(amount); 
	order.setPrice(longPrice);
	order.setProduct_id(productID);
	order.setQuantity(Integer.parseInt(amount));
	order.setRequest_comment(requestComment);
	order.setType_code(Integer.parseInt(orderType));
	order.setRecipient_address(address);
	order.setRecipient_name(name);
	order.setRecipient_phone(phone);
	
	SessionRepository s = new SessionRepository();
	StringBuilder  result = new StringBuilder();
	result.append("|result=|");
	if(s.insertOrder(order).intValue() > 0){	//insert success
		result.append("success|");
	}
	else{
		result.append("fail|");
	}
	
	result.append("end|");
	return result.toString();
}
%>

<%!
//주문조회
	public static String showZMyOrders(String customerID){

	String orderStmtURI = "mybatis.repository.mapper.orderMapper2.selectMyOrder";
	SqlSession sqlSession = AzureMySQLDB.openSession();	
	ArrayList<OrderInfoForAdmin> orderInfo = null;
	try{
		List<Object> temp = sqlSession.selectList(orderStmtURI, customerID);
		orderInfo = (ArrayList<OrderInfoForAdmin>) temp.stream().map(obj->(OrderInfoForAdmin)obj).collect(Collectors.toList());
	}
	catch(Exception e){
		System.out.println(e.getMessage());
	}
	finally{
		sqlSession.close();
	}
	
	StringBuilder result = new StringBuilder();
	result.append("|result=|");
	for(OrderInfoForAdmin order : orderInfo){
		result.append("order start|");
		result.append(order.getOrder_id()+"|");
		result.append(order.getCustomer_id()+"|");
		result.append(order.getIs_delivered()+"|");
		result.append(order.getIs_approved()+"|");
		result.append(order.getIn_cart()+"|");
		result.append(order.getIn_order()+"|");
		result.append(order.getPrice()+"|");
		result.append(order.getQuantity()+"|");
		result.append(order.getRequest_comment()+"|");
		result.append(order.getOrder_date()+"|");
		result.append(order.getRecipient_name()+"|");
		result.append(order.getRecipient_address()+"|");
		result.append(order.getRecipient_phone()+"|");
		result.append(order.getProduct_variety_name()+"|");
		result.append(order.getTitle()+"|");
		result.append(order.getType_name()+"|");
		result.append("order end|");
	}
	result.append("end|");
	return result.toString();
}
%>