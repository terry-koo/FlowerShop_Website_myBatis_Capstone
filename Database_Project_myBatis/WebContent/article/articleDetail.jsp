<%@page import="project.util.ArticlePostManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="
	mybatis.model.ArticlePost,
	project.util.ArticlePostManager,
	mybatis.model.Review
"%>

<%
String article_id = request.getParameter("article_id");
if(article_id.equals("null")){
	%>
	<jsp:forward page="article.jsp"/>
	<%
}
ArticlePost article = ArticlePostManager.getArticlePostByArticle_id(article_id);
Review[] reviews = article.getReviews();
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=article.getTitle()%></title>
<%			
			StringBuilder a = new StringBuilder();
			String[] tags = article.getTags();
			for(int i = 0; i < tags.length-1; i++){
				a.append(tags[i]+",");
			}
			a.append(tags[tags.length-1]);
	
%>
<meta name="keywords" content="<%=a.toString()%>">

</head>
<link rel="stylesheet" href="articleDetail.css">
<body>


<table style="width:1140px;">
	<tr>
		<td colspan="3"><h2><%=article.getTitle() %></h2></td>
	</tr>
	<tr>
		<td style="text-align:right;" colspan="3"><%=article.getAuthor_name() %>
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
			tags = article.getTags();
			for(int i = 0; i < tags.length; i++){
		%>
			<a href="tagSearch.jsp?tag=<%=tags[i]%>">#<%=tags[i]%></a>,&nbsp; 
			
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
	
		
		<td><%=reviews[i].getAuthor_name() %></td>
		<td><%=reviews[i].getContent() %></td>
		<td style="text-algin:right;">평점:<%=reviews[i].getStars() %></td>
	</tr>
	<%
			}
	%>
	<tr>
	<%
		String reviewerName = "로그인 필요";
		if(customerInfoHeader != null){
			reviewerName = customerInfoHeader.getName();
		}
		
	%>
	
	<form action="doWriteReview.jsp" method="post">
		<td><%=reviewerName %></td>
		<td style="width:900px;">
		<textarea style="width:780px;" name="content" placeholder="<%=customerInfoHeader==null?reviewerName:' '%>"></textarea><br>
		평점
		<select name="stars" style="width:80px;">
   				<option value="5">5</option>
		    	<option value="4">4</option>
		    	<option value="3">3</option>
		    	<option value="2">2</option>
		    	<option value="1">1</option>
  		</select>
		<input type="text" name="article_id" value="<%=article.getArticle_id()%>" style="visibility:hidden;">
		</td>
		<td><input type="submit" value="작성"></td>
	</form>
	<tr>
	<tr style="height:150px;">
	</tr>
</table>


</body>
</html>