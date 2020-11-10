<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="
	mybatis.model.CustomerInfo
"%>
<!DOCTYPE html>
<html>
<%	
	String url = request.getContextPath();
	CustomerInfo customerInfoHeader = (CustomerInfo) session.getAttribute("session_customerInfo");
	
	request.setCharacterEncoding("UTF-8");
	
%>
<head>
	<link href='https://fonts.googleapis.com/css?family=Raleway:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="<%=url%>/home/css/animate.css">
	<link rel="stylesheet" href="<%=url%>/home/css/icomoon.css">
	<link rel="stylesheet" href="<%=url%>/home/css/bootstrap.css">
	<link rel="stylesheet" href="<%=url%>/home/css/magnific-popup.css">
	<link rel="stylesheet" href="<%=url%>/home/css/owl.carousel.min.css">
	<link rel="stylesheet" href="<%=url%>/home/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="<%=url%>/home/css/style.css">
	<link rel="shortcut icon" href="<%=url%>/home/images/favicon.ico" />
	<script src="<%=url%>/home/js/jquery.min.js"></script>
	<script src="<%=url%>/home/js/jquery.easing.1.3.js"></script>
	<script src="<%=url%>/home/js/bootstrap.min.js"></script>
	<script src="<%=url%>/home/js/jquery.waypoints.min.js"></script>
	<script src="<%=url%>/home/js/owl.carousel.min.js"></script>
	<script src="<%=url%>/home/js/jquery.countTo.js"></script>
	<script src="<%=url%>/home/js/jquery.magnific-popup.min.js"></script>
	<script src="<%=url%>/home/js/magnific-popup-options.js"></script>
	<script src="<%=url%>/home/js/main.js"></script>
	<script src="<%=url%>/home/js/modernizr-2.6.2.min.js"></script>
</head>


<nav class="gtco-nav" role="navigation">
		<div class="gtco-container" style="background-color:rgba(10,10,10,0.6);">
			<div class="row">
				<div class="col-xs-2" style="width:190px;">
					<div id="gtco-logo"><a href="<%=url%>/home/index.jsp">박사플로리스트</a></div>
				</div>
				<div class="col-xs-10 text-right menu-1">
					<ul>
						<li class="active"><a href="<%=url%>/home/index.jsp">홈으로</a></li>
						
						<li class="has-dropdown">
						<a>상품보기</a>
							<ul class="dropdown">
								<li><a href="#">꽃</a></li>
								<li><a href="#">정기 배송</a></li>
							</ul>
						</li>
						<li><a href="#">공지사항</a></li>
						
						<%
							if(customerInfoHeader != null){
						%>
						
						<li class="has-dropdown">
							<a href="#">내 정보</a>
							<ul class="dropdown">
								<li><a href="#">주문내역</a></li>
								<li><a href="#">프로필</a></li>
								<li><a href="#">장바구니</a></li>
								<li><a href="#">쿠폰</a></li>
								<li><a href="<%=url%>/login/doLogout.jsp">로그아웃</a></li>
							</ul>
						</li>
						<%
							}
							else{
						%>
							<li><a href="<%=url%>/login/login.jsp">로그인</a></li>
						<%
							}
						%>
						
					</ul>
				</div>
			</div>
			
		</div>
</nav>


</html>
<!--@@@@@@@@@@@@@@@@@@@  양식 시작    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->	