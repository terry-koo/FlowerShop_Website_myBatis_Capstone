<%@page import="mybatis.model.Member"%>
<%@page import="java.util.*"%>
<%@page import="mybatis.repository.session.SessionRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>

<style>
  table, th, td {
    border: 1px solid #5555ff;
    margin: auto;
  }
  table {
    width: 1400px;
    color: black;
    
  }
</style>

</head>
<body>


<%

List<Object> member = SessionRepository.selectAllMember();
int size = member.size();
List<Member> memberArray = new ArrayList<>();

for(int i=0; i<size; i++) {
	memberArray.add((Member)member.get(i));
}
%>
<div style="height:170px;"></div>
<div style="border: 1px dashed #BDBDBD; background-color: #c2d0f2; margin:auto; padding: 5px; text-align: center;">
<h1>회원 리스트</h1>
<table>

<tr>
	<td>식별넘버</td>
	<td>이름</td>
	<td>성별</td>
	<td>생일</td>
	<td>전화번호</td>
	<td>주소</td>
	<td>이메일</td>
	<td>등급</td>
</tr>

<%
for(int i=0; i<size; i++){
%>
<tr>
	<td><%= memberArray.get(i).getCustomer_id()%></td>
	<td><%= memberArray.get(i).getName()%></td>
	<td><%= memberArray.get(i).getGender()%></td>
	<td><%= memberArray.get(i).getBirthday()%></td>
	<td><%= memberArray.get(i).getPhone()%></td>
	<td><%= memberArray.get(i).getAddress()%></td>
	<td><%= memberArray.get(i).getEmail()%></td>
	<td><%= memberArray.get(i).getAuthority_code()%></td>
</tr>
<%
}
%>
</table>
</div>

</body>
</html>