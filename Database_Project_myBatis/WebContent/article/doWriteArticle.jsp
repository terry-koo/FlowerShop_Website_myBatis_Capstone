<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="
	mybatis.repository.session.AzureMySQLDB,
	org.apache.ibatis.session.SqlSession,
	java.util.HashMap,
	project.util.NowAsHashCode
" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>doWriteArticle</title>
</head>
<body>

<% 
	

	String article_id = NowAsHashCode.toString("A");
	String title = request.getParameter("title");
	String available = request.getParameter("available");
	String pictureString = request.getParameter("pictureString");
	String content = request.getParameter("content");
	String tag = request.getParameter("tag");

	
	//insert article
	HashMap<String, String> articleParam = new HashMap<>();
	articleParam.put("article_id", article_id);
	articleParam.put("customer_id", "adminID");
	//articleParam.put("customer_id", customerInfoHeader.getCustomer_id());
	articleParam.put("title", title);
	articleParam.put("content", content);
	articleParam.put("is_linked_to_product", "F");
	articleParam.put("is_registered", available);
	
	
	//insert picutre
	HashMap<String, String> pictureParam = new HashMap<>();
	pictureParam.put("picture_id", NowAsHashCode.toString("P"));
	pictureParam.put("article_id", article_id);
	pictureParam.put("picture", pictureString);
	
	
	//insert tag
	String[] tags = tag.split(",");
	HashMap<String, String> tagParam = new HashMap<>();
	tagParam.put("article_id", article_id);
	
	
	String articleMapperUri = "mybatis.repository.mapper.articleMapper.insertArticle";
	String pictureMapperUri = "mybatis.repository.mapper.pictureMapper.insertPicture";
	String tagMapperUri = "mybatis.repository.mapper.tagMapper.insertTag";

	SqlSession sqlSession = AzureMySQLDB.openSession();
	try{
		int articleState = sqlSession.insert(articleMapperUri, articleParam);
		int pictureState = sqlSession.insert(pictureMapperUri, pictureParam);
		int tagState = 0;
		for(int i = 0; i < tags.length; i++){
			tagParam.put("tag_name", tags[i]);
			tagState += sqlSession.insert(tagMapperUri, tagParam);
		}
		
		if(articleState > 0 && pictureState>0 && tagState == tags.length){
			sqlSession.commit();
		}
			response.sendRedirect("articleDetail.jsp");
	}
	finally{
		sqlSession.close();
	}
%>

</body>
</html>