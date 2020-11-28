<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="
	project.util.VProductManager,
	mybatis.model.VProductArticlePictureLatest,
	java.util.List
"%>
<%!
	public static String showZMainProduct(){
		List<VProductArticlePictureLatest> productList = VProductManager.getList();
		StringBuilder  result = new StringBuilder();
		result.append(",result=,");
		for(VProductArticlePictureLatest product : productList){
			result.append("product start,");
			result.append(product.getProduct_variety_code()+",");
			result.append(product.getIs_available()+"");
			result.append(product.getProduct_id()+",");
			result.append(product.getPrice()+",");
			result.append(product.getArticle_id()+",");
			result.append(product.getCustomer_id()+",");
			result.append(product.getTitle()+",");
			result.append(product.getContent()+",");
			result.append(product.getIs_linked_to_product()+",");
			result.append(product.getIs_registered()+",");
			result.append(product.getRegistration_date()+",");
			result.append(product.getPicture_id()+",");
			result.append(product.getPicture()+",");
			result.append("product end,");
		}
		result.append("end,");
		return result.toString();
	}
%>



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
		System.out.println("don't blame me. I did it.");
		break;
	}


%>


</body>
</html>