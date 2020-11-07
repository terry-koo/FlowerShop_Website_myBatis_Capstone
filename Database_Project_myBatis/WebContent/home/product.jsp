<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Jinju_Flower</title>

	<link href='https://fonts.googleapis.com/css?family=Raleway:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/icomoon.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<link rel="stylesheet" href="css/style.css">
	
	<link rel="shortcut icon" href="images/favicon.ico" />
	
		<style>
		  /* 표 기본 스타일 */
		  table {
		    width: 100%;
		    border-top: 1px solid #444444;
		    border-collapse: collapse;
		    color:black;
		  }
		  th, td {
		    border-bottom: 1px solid #444444;
		    padding: 10px;
		  }
		  /* 바탕색 설정하기 편하게 설정 */
		  html, body { height:100%; overflow:hidden }

		</style>
		
	</head>
	
	<body style="height:100%;">
	
	<div class="gtco-loader"></div>
	<div id="page" style="background-color:#C7DBD0; height:100%;">
	<nav class="gtco-nav" role="navigation">
		<div class="gtco-container">
			<div class="row">
				<div class="col-xs-2">
					<div id="gtco-logo"><a href="index.jsp">SeedShop</a></div>
				</div>
				<div class="col-xs-10 text-right menu-1">
					<ul>
						<li class="active"><a href="index.jsp">Home</a></li>
						<li><a href="about.html">About</a></li>
						<li class="has-dropdown">
							<a href="services.html">SHOP</a>
							<ul class="dropdown">
								<li><a href="#">SEED</a></li>
								<li><a href="#">PLANT</a></li>
							</ul>
						</li>
						<li class="has-dropdown">
							<a href="#">My</a>
							<ul class="dropdown">
								<li><a href="#">ORDERS</a></li>
								<li><a href="#">PROFILE</a></li>
							</ul>
						</li>
						<li class="has-dropdown">
							<a href="/seedshop/home/NewFile.jsp">Contact</a>
							<ul class="dropdown">
								<li><a href="#">LIVE CHAT</a></li>
								<li><a href="#">CALL</a></li>
							</ul>
						</li>
					
						<% if("true".equalsIgnoreCase((String)session.getAttribute("login"))){%>
						<li class="has-dropdown">
							<a href="/seedshop/home/Logout.jsp" style="color:red;">logout</a>
						</li>
						<%}else{ %>
						<li class="has-dropdown">
							<a href="/seedshop/templete/login.jsp" style="color:red;">login</a>
						</li>
						<%} %>
					</ul>
				</div>
			</div>
			
		</div>
	</nav>

	<header id="gtco-header" class="gtco-cover" role="banner" style="background-image:url(images/Sunflower_from_Silesia2.jpg); height:105px;">
		</header>
	
	
		
<div id="wrap" style="margin:auto;  padding:80px; height:100%;">

<!--@@@@@@@@@@@@@@@@@@@  양식 시작    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->	

<br><br><br>

<section id="uploadFormArea">
<form action="productUploadInsert.jsp" method="post" enctype="multipart/form-data">

<table border="1" width="700" >

 <tr>
  <td width="150">
  타입
  </td>
  <td width="350" align="left">
  <select name="productVarietyCode">
   <option value="1">화환</option>
   <option value="2">바구니</option>
   <option value="3">압화</option>
   <option value="4">화분식물</option>
  </select>
  </td>
 </tr>
 
 <tr>
  <td>제목 및 상품명</td>
  <td align="left"><input type="text" name="title" size="30"></td>
 </tr>
 
 <tr>
  <td>가격</td>
  <td align="left"><input type="text" name="price" size="10">원</td>
 </tr>
 
 
<tr>
  <td width="150">
  판매가능 여부(게시글 공개 여부)
  </td>
  <td width="350" align="left">
  <select name="available">
   <option value="T">가능</option>
   <option value="F">불가능</option>
  </select>
  </td>
 </tr>
 
 <tr>
  <td>이미지</td>
  <td align="left"><input type="file" name= "img"></td>
 </tr>
 
  <tr>
  <td>게시글 내용</td>
  <td align="left" >
  <textarea name="content" style="width:600px; height:200px; resize:none;"></textarea>
  </td>
 </tr>
 
 <tr>
  <td colspan="2"><input type="submit" value="상품등록">  <input type="reset" value="다시작성"></td>
 
 </tr>
 
</table>
</form>

</section>


<!--@@@@@@@@@@@@@@@@@@@  양식 끝    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->		     
</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.countTo.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<script src="js/main.js"></script>

	</body>
</html>