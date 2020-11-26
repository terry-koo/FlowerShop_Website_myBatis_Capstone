<%@page import="project.util.VProductManager"%>
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
		
		//데이터 실시간으로 들어가게
		if(result1>0 && result2>0){
			VProductArticlePictureLatest v = new VProductArticlePictureLatest();
			v.setArticle_id("A"+dateToHashCode);
			v.setContent(content);
			v.setCustomer_id("adminID");
			v.setIs_available(available);
			v.setIs_linked_to_product("T");
			v.setIs_registered("T");
			v.setPicture(pictureString);
			v.setPicture_id("A"+dateToHashCode);
			v.setPrice(price);
			v.setProduct_id("P"+dateToHashCode);
			v.setProduct_variety_code(productVarietyCode);
			v.setRegistration_date(date);
			v.setTitle(title);
			
			VProductManager.addElement(v);
			
		}
		%>
<script>
var answer = confirm ("등록완료");
if (answer){
	window.location.href = "mainProduct.jsp";
}
else{
	window.location.href = "mainProduct.jsp";
}
</script>
		<%
	}
	else{
	}
}
catch(Exception e){
	sqlSession.rollback();
	%>
<script>
var answer = confirm ("등록실패..");
if (answer){
	window.location.href = "mainProduct.jsp";
}
else{
	window.location.href = "mainProduct.jsp";
}
</script>
	<%
}
finally{
	sqlSession.close();
}

%>





</body>
</html>