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
<p id="user-info"></p>
<img id="ph" src="" />
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

Kakao.init('939c6aeb4a224596f6dd2be2e061a4c2');
console.log("Kakao init : "+Kakao.isInitialized());

  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost:8080/Database_Project_myBatis/index.jsp',
      /* scope:"account_email, age_range, gender, birthday,profile" */
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
  
Kakao.Auth.login({
	success:function(authObj){
		  Kakao.API.request({
			  url:'/v2/user/me',
			  success:function(res){
				  alert(JSON.stringify(res))
				  console.log(res);
				  var id = res.id;
				  var email = res.kakao_account.email+"<br>";
				  var name = res.properties.nickname+"<br>";  
				  var gender = res.kakao_account.gender+"<br>";
				  var age_range = res.kakao_account.age_range+"<br>"
				  var birthday = res.kakao_account.birthday+"<br>"
				  var html = email+gender+age_range+birthday +name;
				  document.getElementById('user-info').innerHTML = html;
				  document.getElementById('ph').src = res.properties.profile_image;
			  }
			  
		  })
	},
	 scope:"account_email, age_range, gender, birthday,profile" 
})

  
  
  
</script>

</body>
</html>