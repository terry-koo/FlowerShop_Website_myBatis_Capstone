<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="
	mybatis.repository.session.AzureMySQLDB,
	org.apache.ibatis.session.SqlSession,
	java.util.HashMap,
	mybatis.model.CustomerInfo
"%>
<!DOCTYPE html>
<html>
<%	
	String contextPath = request.getContextPath();
	CustomerInfo customerInfoHeader = (CustomerInfo) session.getAttribute("session_customerInfo");
	String requestedURL = request.getRequestURL().toString();
	request.setCharacterEncoding("UTF-8");
	
%>
<head>
	<link href='https://fonts.googleapis.com/css?family=Raleway:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="<%=contextPath%>/home/css/animate.css">
	<link rel="stylesheet" href="<%=contextPath%>/home/css/icomoon.css">
	<link rel="stylesheet" href="<%=contextPath%>/home/css/bootstrap.css">
	<link rel="stylesheet" href="<%=contextPath%>/home/css/magnific-popup.css">
	<link rel="stylesheet" href="<%=contextPath%>/home/css/owl.carousel.min.css">
	<link rel="stylesheet" href="<%=contextPath%>/home/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="<%=contextPath%>/home/css/style.css">
	<link rel="shortcut icon" href="<%=contextPath%>/home/images/favicon.ico" />
	<script src="<%=contextPath%>/home/js/jquery.min.js"></script>
	<script src="<%=contextPath%>/home/js/jquery.easing.1.3.js"></script>
	<script src="<%=contextPath%>/home/js/bootstrap.min.js"></script>
	<script src="<%=contextPath%>/home/js/jquery.waypoints.min.js"></script>
	<script src="<%=contextPath%>/home/js/owl.carousel.min.js"></script>
	<script src="<%=contextPath%>/home/js/jquery.countTo.js"></script>
	<script src="<%=contextPath%>/home/js/jquery.magnific-popup.min.js"></script>
	<script src="<%=contextPath%>/home/js/magnific-popup-options.js"></script>
	<script src="<%=contextPath%>/home/js/main.js"></script>
	<script src="<%=contextPath%>/home/js/modernizr-2.6.2.min.js"></script>
</head>


<nav class="gtco-nav" role="navigation">
		<div class="gtco-container" style="background-color:rgba(10,10,10,0.6);">
			<div class="row">
				<div class="col-xs-2" style="width:190px;">
					<div id="gtco-logo"><a href="<%=contextPath%>/home/index.jsp">박사플로리스트</a></div>
				</div>
				<div class="col-xs-10 text-right menu-1">
					<ul>
						<li class="active"><a href="<%=contextPath%>/home/index.jsp">홈으로</a></li>
						
						<li class="has-dropdown">
						<a>상품보기</a>
							<ul class="dropdown">
								<li><a href="<%=contextPath%>/home/mainProduct.jsp">꽃</a></li>
								<li><a href="#">정기 배송</a></li>
							</ul>
						</li>
						<li><a href="../article/article.jsp">게시판</a></li>
						
						<%
							if(customerInfoHeader != null){
						%>
						
						<li class="has-dropdown">
							<a href="#">내 정보</a>
							<ul class="dropdown">
								<li><b><%=customerInfoHeader.getName() %></b> 님!</li>
								<hr>
								<li><a href="#">주문내역</a></li>
								<li><a href="../userInfo/userInfo.jsp">프로필</a></li>
								<li><a href="../basket/basket.jsp">장바구니</a></li>
								<li><a href="#">쿠폰</a></li>
								<li><a href="<%=contextPath%>/login/doLogout.jsp">로그아웃</a></li>
							</ul>
						</li>
						<%
							}
							else{
						%>
							<li><a href="<%=contextPath%>/login/login.jsp">로그인</a></li>
						<%
							}
						%>
						
					</ul>
				</div>
			</div>
			
		</div>
</nav>

<%
	String customer_id_HEAD = "adminID";
	if(customerInfoHeader != null){
		customer_id_HEAD = customerInfoHeader.getCustomer_id();
	}
	
	HashMap<String, String> trackingInfoMap = new HashMap<>();
	trackingInfoMap.put("customer_id", customer_id_HEAD);
	trackingInfoMap.put("ipv6_address", request.getRemoteAddr());
	trackingInfoMap.put("visit_page", requestedURL);
	

	new Thread(
			()->{
				String stmtURI_user_tracking_log = "mybatis.repository.mapper.userTrackingLogMapper.insertUserTrackingLog";
				SqlSession sqlSessionHeader = AzureMySQLDB.openSession();
				try{
					int recorded = sqlSessionHeader.insert(stmtURI_user_tracking_log, trackingInfoMap);
					if(recorded>0){
						sqlSessionHeader.commit();
					}
				}
				catch(Exception e){
					
				}
				finally{
					sqlSessionHeader.close();
				}
			}
			
			).start();
	
	
	
%>
</html>
<!--====================================Header.jsp 끝========================================-->	