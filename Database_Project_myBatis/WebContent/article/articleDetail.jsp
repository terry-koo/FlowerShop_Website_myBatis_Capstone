<%@page import="project.util.ArticleManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="
	mybatis.model.ArticlePost,
	project.util.ArticleManager
	
"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>articleDetail title here</title>
</head>
<body>
<%
	String articleUri = "mybatis.repository.mapper.articleMapper.selectArticlePostOne";
	String article_id = "A508144283";
	SqlSession sqlSession = AzureMySQLDB.openSession();
	ArticlePost article = null;
	try {
		article = (ArticlePost) sqlSession.selectOne(articleUri, article_id);
	}
	catch(Exception e){
		out.println(e.getMessage());
	}
	finally{
		sqlSession.close();
	}
	
	out.println(ArticleManager.getArticleByIndex(0).getContent());
	
%>


</body>
</html>