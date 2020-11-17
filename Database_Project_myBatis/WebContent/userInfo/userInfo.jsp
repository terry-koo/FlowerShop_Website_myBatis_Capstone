<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../login/loginIsRequired.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필</title>
</head>

<link rel="stylesheet" href="userInfo.css">

<body>
<%

	String session_message = (String) session.getAttribute("session_message");
	session.removeAttribute("session_message");

	if(session_message != null){
%>
<div id="topMessageBox" <%=(session_message.equals("수정 완료"))? 
			"style=\"background-color:#3aff3a;\"":"" %>>
	<h3 style="margin-top:0px;" ><%=session_message%></h3>
</div>
<%
	}
	
	

	
	String gender = String.valueOf(customerInfoHeader.getGender());
	
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
<form action="updateUserInfo.jsp" method="post">
	<p><b><%=rank%></b></p><br>
	<p>이메일  :<%=customerInfoHeader.getEmail()%></p><br>
	<p>새 비밀번호 <br><input type="password" name="sec" placeholder="변경시에만 작성"></p><br>
	<p>이름 <br><input type="text" name="name" value="<%=customerInfoHeader.getName()%>"></p><br>
	<p>휴대폰 <br><input type="text" name="phone" value="<%=customerInfoHeader.getPhone()%>"></p><br>
	<input type="radio" name="gender" value="M" <%=(gender.equals("M")?"checked":"") %>>남성
	<input type="radio" name="gender" value="W" <%=(gender.equals("W")?"checked":"") %>>여성
	<input type="radio" name="gender" value="N" <%=(gender.equals("N")?"checked":"") %>>무응답
	<br>
	<br>
	<p>생일 <br><input type="text" name="birthday" value="<%=customerInfoHeader.getBirthday()%>"></p>
	<p style="color:grey;">*변경시 yyyy-mm-dd 형식으로 작성해주세요.</p><br><br> 
	<p>주소 <br><input type="text" name="address" value="<%=customerInfoHeader.getAddress()%>"></p><br>
	<input type="submit" value="저장">
</form>
</div>
</body>
</html>