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
	
	for(int i = articlePostList.size()-1; i >= 0 ; i--){
		article = articlePostList.get(i);
%>	

	
	<tr>
	
		<td><%=i%></td>
		<td style="width:425px;"><a href="articleDetail.jsp?article_id=<%=article.getArticle_id()%>"><%=article.getTitle() %></a></td>
		<td><%=article.getRegistration_date() %></td>
		<td><%=article.getAuthor_name() %></td>

	</tr>	

	
<%		
	}
%>

</tbody>

</table>
</div>
</body>

</html>