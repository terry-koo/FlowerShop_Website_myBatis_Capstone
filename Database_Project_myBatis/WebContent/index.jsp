<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Main Page</title>
</head>
<body>
<a href="loginManagement/">로그인</a><br>

<a id="custom-login-btn" href="javascript:loginWithKakao()">
  <img
    src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
    width="222"
  />
</a>
<p id="token-result"></p>
<img id="ph" src="" />
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

Kakao.init('102de34d8dd205870a81dbfbe3b16643');
console.log("Kakao init : "+Kakao.isInitialized());

  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8080/kakao_login_testP/index.jsp'
    })
  }
  // 아래는 데모를 위한 UI 코드입니다.
  getToken()
  function getToken() {
    const token = getCookie('authorize-access-token')
    if(token) {
      Kakao.Auth.setAccessToken(token)
      document.getElementById('token-result').innerText = 'login success. token: ' + Kakao.Auth.getAccessToken()
    }
  }
  function getCookie(name) {
    const value = "; " + document.cookie;
    const parts = value.split("; " + name + "=");
    if (parts.length === 2) return parts.pop().split(";").shift();
  }
  

		  Kakao.API.request({
			  url:'/v2/user/me',
			  success:function(res){
				  alert(JSON.stringify(res))
				  console.log(res);
				  var id = res.id;
				  var email = res.kakao_account.email;
				  var name = res.properties.nickname;
				  var html = '<br>'+email+'<br>'+name;
				  document.getElementById('token-result').innerText = html;
				  document.getElementById('ph').src = res.properties.profile_image;
			  }
		  })

  
  
  
</script>

</body>
</html>