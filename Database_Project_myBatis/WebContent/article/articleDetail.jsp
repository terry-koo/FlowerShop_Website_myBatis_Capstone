<%@page import="project.util.ArticlePostManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="
	mybatis.model.ArticlePost,
	project.util.ArticlePostManager,
	mybatis.model.Review
"%>

<%
String articleNo = request.getParameter("articleNo");
ArticlePost article = ArticlePostManager.getArticlePostByIndex(articleNo);


CustomerInfo author = CustomerInfo.getCustomerInfoById(article.getCustomer_id());
Review[] reviews = article.getReviews();
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=article.getTitle()%></title>
</head>
<link rel="stylesheet" href="articleDetail.css">
<body>


<table style="width:1140px;">
	<tr>
		<td colspan="3"><h2><%=article.getTitle() %><h2></td>
	</tr>
	<tr>
		<td style="text-align:right;" colspan="3"><%=author.getName() %>
		<br>등록일: <%=article.getRegistration_date() %><br><hr></td>
	</tr>
	
	<tr>
	<%if(article.getPicture().length() > 20){ %>
		<td colspan="3"><img style="width:100%;height:100%" src="<%=article.getPicture()%>"><br><br></td>
	<%} %>
	</tr>
	<tr>
		<td colspan="3"><p id="content"><%=article.getContent() %></p><br><hr></td>
	</tr>
	
	<tr>
		<td colspan="3">태그: &nbsp;
		<%
			String[] tags = article.getTags();
			for(int i = 0; i < tags.length; i++){
		%>
			<a href="#"><%=tags[i]%></a>,&nbsp; 
			
		<%
			}
		%>
		<br><hr>
		</td>
	</tr>
	
	<!-- reviews -->
	<tr>
		<td>리뷰:</td>
	</tr>
	<tr style="height:50px;">
	</tr>
		<%
			for(int i = 0; i < reviews.length; i++){
		%>
	<tr>
	
		
		<td><%=CustomerInfo.getCustomerInfoById(reviews[i].getCustomer_id()).getName() %></td>
		<td><%=reviews[i].getContent() %></td>
		<td style="text-algin:right;">평점:<%=reviews[i].getStars() %></td>
	</tr>
	<%
			}
	%>
	<tr style="height:150px;">
	</tr>
</table>


</body>
</html>