<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>

<link rel="stylesheet" href="login.css">
<link rel="stylesheet" href="loginCommon.css">

<body id="bodySet">

<%
	if(request.getParameter("loginFailed") != null){
		
%>
<div id="loginFailedBox">
	<h3 style="margin-top:0px;">로그인 실패</h3>
</div>
<%
	}
%>


<div id="loginBox">
<form action="doLogin.jsp" method="post">

  <div class="container">
    <label for="uname"><b>이메일</b></label>
    <input type="text" placeholder="이메일" name="email" required>

    <label for="psw"><b>비밀번호</b></label>
    <input type="password" placeholder="비밀번호" name="psw" required>

    <button type="submit">로그인</button>
    <label>
      <input type="checkbox" checked="checked" name="remember"> 자동로그인
    </label>
  </div>


<br>
	
<a id="custom-login-btn" href="javascript:loginWithKakao()">
  <img 
  	class="formElements"
    src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
    width="100%"
  />
</a><br>
    <span class="psw"><a href="#">비밀번호 찾기</a></span>
	
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
      scope : "account_email, age_range, gender, birthday,"
    })
  }

</script>
</html>
