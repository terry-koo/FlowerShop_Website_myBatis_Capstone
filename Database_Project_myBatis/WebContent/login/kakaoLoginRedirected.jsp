<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 로그인 세션 생성</title>
</head>
<body>


<p>Pop-up 차단을 해제 후 새로고침 해주세요.</p> 

<p id="token-result"></p>
<p id="user-info"></p>
<img id="ph" src="" />

</body>


<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

Kakao.init('939c6aeb4a224596f6dd2be2e061a4c2');
console.log("Kakao init : "+Kakao.isInitialized());

Kakao.Auth.login({
	success:function(authObj){
		  Kakao.API.request({
			  url:'/v2/user/me',
			  success:function(res){/*
				  console.log(res);
				  var id = res.id+"<br>";
				  var email = res.kakao_account.email+"<br>";
				  var name = res.properties.nickname+"<br>";
				  var gender = res.kakao_account.gender+"<br>";
				  var age_range = res.kakao_account.age_range+"<br>"
				  var birthday = res.kakao_account.birthday+"<br>"
				  var token = "token= "+authObj.access_token+"<br>";
				  var token_expire = "expires_in= "+authObj.expires_in+"<br>";
				  var html = id+email+name+gender+age_range+birthday+token+token_expire;*/
				  //document.getElementById('user-info').innerHTML = html;
				  //document.getElementById('ph').src = res.properties.profile_image;
				  var id = res.id;
				  window.location.href = "http://localhost:8080/Database_Project_myBatis/login/kakaoDoLogin.jsp?kakaoid="+id;
				  
			  }
			  
		  })
	},
	scope:"account_email, age_range, gender, birthday,"
})



</script>
</html>