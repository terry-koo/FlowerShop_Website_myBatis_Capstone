<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필</title>
</head>

<link rel="stylesheet" href="userInfo.css">

<body>

<%
	
	String gender = null;
	switch (customerInfoHeader.getGender()){
		case 'M':
			gender = "남성";
			break;
		case 'W':
			gender = "여성";
			break;
		case 'N':
			gender = "무응답";
			break;
	}
	
	String rank = null;
	switch (customerInfoHeader.getAuthority_code()){
	case 1:
		rank = "관리자";
		break;
	case 2:
		rank = "스텝";
		break;
	case 3:
		rank = "VIP";
		break;
	case 4:
		rank = "일반고객";
		break;
}
%>
<div id="wrapForm">
<form action="" method="post">
	<p><%=rank%></p><br>
	<p>이메일  :<%=customerInfoHeader.getEmail()%></p><br>
	<p>새 비밀번호 <br><input type="password" name="sec"></p><br>
	<p>이름 <br><input type="text" name="name" value="<%=customerInfoHeader.getName()%>"></p><br>
	<p>휴대폰 <br><input type="text" name="phone" value="<%=customerInfoHeader.getPhone()%>"></p><br>
	<p>성별 <%=gender %></p><br>
	<p>생일 <br><input type="text" name="birthday" value="<%=customerInfoHeader.getBirthday()%>"></p><br>
	<p>주소 <br><input type="text" name="address" value="<%=customerInfoHeader.getAddress()%>"></p><br>
	<input type="submit" value="저장">
</form>
</div>
</body>
</html>