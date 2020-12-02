<%@page import="mybatis.model.ArticlePost"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../login/loginIsRequired.jsp" %>
<%@ page import="
	mybatis.repository.session.AzureMySQLDB,
	org.apache.ibatis.session.SqlSession,
	java.util.HashMap,
	project.util.ArticlePostManager,
	project.util.NowAsHashCode
"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성중</title>
</head>
<body>
<%
	String content = request.getParameter("content");
	String stars = request.getParameter("stars");
	String article_id = request.getParameter("article_id");
	
	HashMap<String, String> reviewParam = new HashMap<>();
	reviewParam.put("review_id", NowAsHashCode.toString("R"));
	reviewParam.put("customer_id", customerInfoHeader.getCustomer_id());
	reviewParam.put("article_id", article_id);
	reviewParam.put("is_registered", "T");
	reviewParam.put("content", content);
	reviewParam.put("stars",stars);
	
	
	String reviewMapperUri = "mybatis.repository.mapper.reviewMapper.insertReview";
	SqlSession sqlSession = AzureMySQLDB.openSession();
	try{
		int result = sqlSession.insert(reviewMapperUri, reviewParam);
		if(result > 0){
			sqlSession.commit();
			ArticlePostManager.updateArticleReview(article_id);
			response.sendRedirect("articleDetail.jsp?article_id="+article_id);
		}
		else{
			sqlSession.rollback();
			response.sendRedirect("articleDetail.jsp?article_id="+article_id);
		}
	}
	catch(Exception e){
		sqlSession.rollback();
		response.sendRedirect("articleDetail.jsp?article_id="+article_id);
	}
	finally{
		sqlSession.close();
	}
	
	

%>

</body>
</html>