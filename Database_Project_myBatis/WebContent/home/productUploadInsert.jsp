<%@page import="mybatis.model.Article"%>
<%@page import="oracle.net.aso.n"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>    
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>    
<%@ page import="java.util.*" %> 
<%@ page import="mybatis.model.*" %>    
<%@ page import="mybatis.repository.session.SessionRepository" %>
<%@ page import="
	mybatis.repository.session.AzureMySQLDB,
	org.apache.ibatis.session.SqlSession,
	java.util.HashMap,
	project.util.NowAsHashCode
" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Date date = new Date();
int dateToHashCode = date.toString().hashCode();


int productVarietyCode = Integer.parseInt(request.getParameter("productVarietyCode"));  
String title = request.getParameter("title");
int price = Integer.parseInt(request.getParameter("price"));
String available = request.getParameter("available");
String content = request.getParameter("content"); 
String pictureString = request.getParameter("pictureString");


SessionRepository a = new SessionRepository();


//article insert
Article article = new Article();
article.setArticleId("A"+dateToHashCode);
article.setContent(content);
//article.setCustomerId(customerInfoHeader.getCustomer_id()); 로그인시 사용자 id 불러와 저장
article.setCustomerId("adminID");
article.setisLinkedToProduct("T");
article.setIsRegistered("T");
article.setRegistrationDate(date);
article.setTitle(title);

Integer result1 = a.insertArticle(article);


//product insert
Product product = new Product();
product.setProductId("P"+dateToHashCode);
product.setProductVarietyCode(productVarietyCode);
product.setIsAvailable(available);
product.setPrice(price); 
product.setArticleId("A"+dateToHashCode);


Integer result2 = a.insertProduct(product);


//picture insert
String picture_id = NowAsHashCode.toString("p");

HashMap<String, String> pictureParam = new HashMap<>();
pictureParam.put("picture_id", picture_id);
pictureParam.put("article_id", "A"+dateToHashCode);
pictureParam.put("picture", pictureString);
	

String pictureMapperUri = "mybatis.repository.mapper.pictureMapper.insertPicture";

SqlSession sqlSession = AzureMySQLDB.openSession();
try{
	int state = sqlSession.insert(pictureMapperUri, pictureParam);
	
	if(state>0){
		sqlSession.commit();
	}
	else{

	}
}
finally{
	sqlSession.close();
}

%>

<script>
alert("insert success")
history.go(-1);
</script>


</body>
</html>