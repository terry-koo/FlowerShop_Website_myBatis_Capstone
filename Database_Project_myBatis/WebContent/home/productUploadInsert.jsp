<%@page import="mybatis.model.Article"%>
<%@page import="oracle.net.aso.n"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>    
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>    
<%@ page import="java.util.*" %> 
<%@ page import="mybatis.model.*" %>    
<%@ page import="mybatis.repository.session.SessionRepository" %>    
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
String tempPrimaryKey = date.toString();

String uploadPath = application.getRealPath("//home//upload");
int size= 10*1024*1024;
String filename1="";
String origfilename1="";


MultipartRequest multi = new MultipartRequest(
request,//봄에서 전달된 파라미터값을
uploadPath,//업로드될 화일의 위치
size,//한번에 업로드된 화일 크기
"UTF-8",//한글
new DefaultFileRenamePolicy());
	

Enumeration files = multi.getFileNames();
String file1 = (String)files.nextElement();
filename1 = multi.getFilesystemName(file1);
origfilename1 = multi.getOriginalFileName(file1);


int productVarietyCode = Integer.parseInt(multi.getParameter("productVarietyCode"));  
String title = multi.getParameter("title");
int price = Integer.parseInt(multi.getParameter("price"));
String available = multi.getParameter("available");
String content = multi.getParameter("content"); 


SessionRepository a = new SessionRepository();


//article insert
Article article = new Article();
article.setArticleId(tempPrimaryKey);
article.setContent(content);
article.setCustomerId("adminID");
article.setisLinkedToProduct("T");
article.setIsRegistered("T");
article.setRegistrationDate(date);
article.setTitle(title);

Integer result1 = a.insertArticle(article);


//product insert
Product product = new Product();
product.setProductId(tempPrimaryKey);
product.setProductVarietyCode(productVarietyCode);
product.setIsAvailable(available);
product.setPrice(price); 
product.setArticleId(tempPrimaryKey);


Integer result2 = a.insertProduct(product);


//picture insert
//추후에 서버에 올리고 나서 picturePath는 하드코딩되지 않게 경로에 맞춰서 수정해야함
String picturePath = "http://localhost:8080/Database_Project_myBatis/home/upload/" + filename1;
Picture picture = new Picture();
picture.setArticleId(tempPrimaryKey);
picture.setPictureId(tempPrimaryKey);
picture.setPicturePath(picturePath);

Integer result3 = a.insertPicture(picture);

%>

<script>
history.go(-1);
</script>


</body>
</html>