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
<body>
<%
 int index = Integer.parseInt(request.getParameter("index"));
List<VProductArticlePictureLatest> list =  VProductManager.getList();
%>

<div style="height:170px;"></div>
<div style="border: 1px dashed #BDBDBD; background-color: #D1B2FF; margin:auto; padding: 5px; text-align: center;">

<img src="<%=list.get(index).getPicture()%>"><br>
<%= list.get(index).getPicture() %><br>
<%= list.get(index).getProduct_variety_code() %><br>
<%= list.get(index).getIs_available() %><br>
<%= list.get(index).getProduct_id() %><br>
<%= list.get(index).getPrice() %><br>
<%= list.get(index).getArticle_id() %><br>
<%= list.get(index).getCustomer_id() %><br>
<%= list.get(index).getTitle() %><br>
<%= list.get(index).getContent() %><br>
<%= list.get(index).getIs_linked_to_product() %><br>
<%= list.get(index).getIs_registered() %><br>
<%= list.get(index).getRegistration_date() %><br>
<%= list.get(index).getPicture_id() %><br>




</div>
</body>
</html>