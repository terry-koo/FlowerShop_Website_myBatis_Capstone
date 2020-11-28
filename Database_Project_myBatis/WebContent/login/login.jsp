<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<style>
		input{
			width:100%;
		}
	</style>
</head>

<link rel="stylesheet" href="login.css">
<link rel="stylesheet" href="loginCommon.css">


<body id="bodySet">

<%

	String session_message = (String) session.getAttribute("session_message");
	session.removeAttribute("session_message");

	if(session_message == "loginFailed"){
		
%>
<div id="topMessageBox">
	<h3 style="margin-top:0px;">로그인 실패</h3>
</div>
<%
	}
%>
<%
	if(session_message == "joinFailed"){
		
%>
<div id="topMessageBox">
	<h3 style="margin-top:0px;">가입 실패</h3>
</div>
<%
	}
%>
<%
	if(session_message == "joinSuccess"){
		
%>
<div id="topMessageBox" style="background-color:#3aff3a;">
	<h3 style="margin-top:0px;">환영합니다. 가입 성공!</h3>
</div>
<%
	}
%>

<div id="loginBox">
<form action="doLogin.jsp" method="post">

  <div class="container" style="width:100%">
    <label for="uname"><b>이메일</b></label>
    <input type="text" placeholder="이메일" name="email" required>

    <label for="psw"><b>비밀번호</b></label>
    <input type="password" placeholder="비밀번호" name="psw" required>

    <button type="submit">로그인</button>
  </div>
<span class="psw">
	<a href="joinService.jsp">회원가입</a>
	/
	<a href="#">비밀번호 찾기</a>
</span>
<br>
<hr>
<a id="custom-login-btn" href="javascript:loginWithKakao()">
  <img 
  	class="formElements"
    src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
    width="100%"
  />
</a>
<br>

	
</form>


</div>

</body>


<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

Kakao.init('939c6aeb4a224596f6dd2be2e061a4c2');
console.log("Kakao init : "+Kakao.isInitialized());

  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8080/Database_Project_myBatis/login/kakaoLoginRedirected.jsp',
      //redirectUri: 'https://drflower.azurewebsites.net/Database_Project_myBatis/login/kakaoLoginRedirected.jsp',
      scope : "account_email, age_range, gender, birthday,"
    })
  }

</script>
</html>
