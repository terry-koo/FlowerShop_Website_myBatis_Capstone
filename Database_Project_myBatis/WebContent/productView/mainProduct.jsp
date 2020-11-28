<%@page import="project.util.VProductManager"%>
<%@page import="mybatis.model.VProductArticlePictureLatest"%>
<%@page import="java.util.List"%>
<%@page import="mybatis.repository.session.SessionRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 메인 페이지</title>
</head>
<style>
	a{
		color:black;
	}
	
	table {
  border-spacing: 10px;
  border-collapse: separate;
}
</style>

<body>


<div style="height:170px; background-color: #e6f3fa;"></div>
<div style="border: 1px #BDBDBD; background-color: #e6f3fa; margin:auto; padding: 5px; text-align: center;">
<h1>< 판매중인 상품  ></h1>

<table style="margin:auto; width:1000px; table-layout:fixed;" border="1" frame=void >

		<tr>
<%
List<VProductArticlePictureLatest> list =  VProductManager.getList();
int size = list.size();
	for (int i = 0; i < size; i+=4) {
		out.print("<tr height=\"260px\">");
		for(int j=(0+i); j<(i+4); j++){
			if(j>=size){break;}
%>		
			<td ><a href="<%=contextPath %>/productView/productDetail.jsp?index=<%=j%>"><img src="<%=list.get(j).getPicture()%>" style="width: 235px; height: 300px; background-size:contain; ">	</a></td>
			<%} %>
		</tr>
		
		<tr height="50px">
			<%for(int k=(0+i); k<(i+4); k++){ 
				if(k>=size){break;}
			%>
				<td><a href="<%=contextPath %>/productView/productDetail.jsp?index=<%=k%>" >
				<b><%=list.get(k).getTitle()%></b></a></td>
			
			<%} %>
		</tr>
		
		<tr height="30px">
			<%for(int k=(0+i); k<(i+4); k++){ 
				if(k>=size){break;}
			%>
				<td><a href="<%=contextPath %>/productView/productDetail.jsp?index=<%=k%>" >
				<fmt:formatNumber value="<%=list.get(k).getPrice()%>" type="currency"/>원</a></td>
			
			<%} %>
		</tr>
		
		<tr height="30px" style="border:hidden;">
			<%for(int k=(0+i); k<(i+4); k++){ 
				if(k>=size){break;}
			  } 
			 %>
		</tr>
<%
	}
%>

</table>

</div>

</body>
</html>