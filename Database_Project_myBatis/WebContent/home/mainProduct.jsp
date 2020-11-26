<%@page import="project.util.VProductManager"%>
<%@page import="mybatis.model.VProductArticlePictureLatest"%>
<%@page import="java.util.List"%>
<%@page import="mybatis.repository.session.SessionRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>

<body>


<div style="height:170px;"></div>
<div style="border: 1px dashed #BDBDBD; background-color: #c2d0f2; margin:auto; padding: 5px; text-align: center;">

<table style="margin:auto; width:1000px; table-layout:fixed;" border="1" >


<%
List<VProductArticlePictureLatest> list =  VProductManager.getList();
int size = list.size();
	for (int i = 0; i < size; i+=4) {
		out.print("<tr height=\"260px\">");
		for(int j=(0+i); j<(i+4); j++){
			if(j>=size){break;}
%>		
			<td ><a href="productDetail.jsp?index=<%=j%>"><img src="<%=list.get(j).getPicture()%>" style="width: 248px; height: 200px; background-size:contain; "></td>	</a>
			<%} %>
		</tr>
		<tr height="50px">
		<%for(int k=(0+i); k<(i+4); k++){ 
			if(k>=size){break;}
		%>
			<td><a href="productDetail.jsp?index=<%=k%>" >
			<%=list.get(k).getTitle()%></a></td>
		<%} %>
		</tr>
<%
	}
%>

</table>

</div>

</body>
</html>