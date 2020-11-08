<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>박사플로시트</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
</head>


	
<%-- 						
						<!-- 로그인여부에 따라 보이는 항목이 다름 -->
						<% if("true".equalsIgnoreCase((String)session.getAttribute("login"))||"true".equalsIgnoreCase((String)session.getAttribute("staff"))||"true".equalsIgnoreCase((String)session.getAttribute("master"))){%>
						<li class="has-dropdown">
							<a href="/seedshop/home/Logout.jsp" style="color:red;">logout</a>
						</li>
						<%}else{ %>
						<li class="has-dropdown">
							<a href="/seedshop/templete/login.jsp" style="color:red;">login</a>
						</li>
						<%} %>
						
						<!-- 직원 아이디로 로그인시 보이는 메뉴 -->
						<% if("true".equalsIgnoreCase((String)session.getAttribute("staff"))){%>
						<li class="has-dropdown">
							<a style="color:green;">Manage</a>
							<ul class="dropdown">
								<li><a href="SeedManageForm.jsp">SEED/PLANT</a></li>
								<li><a href="OrdersManagement.jsp">ORDERS</a></li>
								<li><a href="CustomerManagement.jsp">CUSTOMERS</a></li>
							</ul>
						</li>
						<%} %>
						
						
						<!-- 마스터 아이디로 로그인시 보이는 메뉴 -->
						<% if("true".equalsIgnoreCase((String)session.getAttribute("master"))){%>
						<li class="has-dropdown">
							<a href="/seedshop/home/NewFile.jsp" style="color:cyan; font-size:20px;"><b>MASTER</b></a>
							<ul class="dropdown">
								<li><a href="StaffList.jsp" style="color:red;">직원 </a></li>
								<li><a href="BestCustomer.jsp" style="color:red;">고객</a></li>
								<li><a href="Benefit.jsp" style="color:red;">총 매출</a></li>
							</ul>
						</li>
						<%} %>
						
						 --%>

<body>
	<header id="gtco-header" class="gtco-cover" role="banner" style="height:100%; background-image:url(images/tulips-2068692_1920.jpg);">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-center">
					<div class="display-t">
					<!-- 
					<%-- if("true".equalsIgnoreCase((String)session.getAttribute("login"))){%>
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>"<%= session.getAttribute("name") %>"님 환영합니다!</h1>
							<h2 style="margin:auto; color:white; background-color: rgba( 0, 0, 0, 0.5 ); width:330px;">[ &nbsp온라인에서 &nbsp 편하게  &nbsp주문하세요 &nbsp]</h2>
								<br>
							<p>
								<a href="/seedshop/home/Logout.jsp" class="btn btn-primary btn-lg">로그아웃</a> 
							</p>
						</div>
						
					<%}else if("true".equalsIgnoreCase((String)session.getAttribute("staff"))){%> 
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
								<h1>"<%= session.getAttribute("name") %>"님 환영합니다!</h1>
								<h2 style="margin:auto; color:green; background-color: rgba( 0, 0, 0, 0.5 ); width:330px;"><b>[ 관리자 모드가 활성화 되었습니다 ]</b></h2>
									<br>
								<p>
									<a href="/seedshop/home/Logout.jsp" class="btn btn-primary btn-lg">로그아웃</a> 
								</p>
							</div>
							
					<%}else if("true".equalsIgnoreCase((String)session.getAttribute("master"))){%> 
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
								<h1 style="margin:auto;  width:1000px; color:white; background-color: rgba( 255, 0, 0, 0.6 );">[주의! 최종 관리자 계정 접속중 ]</h1>
									<br>
								<p>
									<a href="/seedshop/home/Logout.jsp" class="btn btn-primary btn-lg">로그아웃</a> 
								</p>
							</div>		
							
					<%}--%>-->
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1 >박사플로리스트 꽃꽃이</h1>
								<h2 style="margin:auto; color:white; background-color: rgba( 0, 0, 0, 0.5 ); width:280px;">[ 문의 : 055-746-2606 ]</h2>
								<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	


	</body>
</html>
