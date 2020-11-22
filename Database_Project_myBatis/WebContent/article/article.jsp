<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import=" 
	java.util.ArrayList,
	mybatis.model.ArticlePost,
	project.util.ArticlePostManager
"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<link rel="stylesheet" href="article.css">

<style>
a{
	color:white;
}
</style>

<body> 

<div class="container">
<button type="button" onclick="location.href='writeArticle.jsp'" style="float:right;">글쓰기</button>
<table>
	<thead>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>날짜</th>
		<th>작성자</th>
	</tr>
	</thead>
	<tbody>

<%	
	ArrayList<ArticlePost> articlePostList = ArticlePostManager.getArticlePostList();
	ArticlePost article = null;
	
	for(int i = 0; i < articlePostList.size(); i++){
		article = articlePostList.get(i);
%>	

	
	<tr>
	
		<td><%=i%></td>
		<td><a href="articleDetail.jsp?articleNo=<%=i%>"><%=article.getTitle() %></a></td>
		<td><%=article.getRegistration_date() %></td>
		<td><%=CustomerInfo.getCustomerInfoById(article.getCustomer_id()).getName() %></td>

	</tr>	

	
<%		
	}
%>

</tbody>

</table>
</div>
</body>

</html>