<%@page import="oracle.net.aso.n"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>    
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>    
<%@ page import="java.util.*" %> 
<%@ page import="mybatis.model.Product" %>    
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


int variety = Integer.parseInt(multi.getParameter("variety"));  
String name = multi.getParameter("name");
int price = Integer.parseInt(multi.getParameter("price"));
String available = multi.getParameter("available");
String imform = multi.getParameter("imform");
String text = multi.getParameter("text"); 


Product product = new Product();
product.setVariety(variety);
product.setIsAvailable(available);
product.setName(name);
product.setImform(imform);
product.setText(text);
product.setPrice(price); 


SessionRepository a = new SessionRepository();
Integer result = a.insertProduct(product);


%>

<script>
history.go(-1);
</script>


</body>
</html>