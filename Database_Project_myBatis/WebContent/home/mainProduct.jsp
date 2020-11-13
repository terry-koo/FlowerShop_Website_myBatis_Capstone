<%@page import="java.util.List"%>
<%@page import="mybatis.repository.session.SessionRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 메인 페이지</title>
</head>
<body>

<%
/* SessionRepository a = new SessionRepository(); 
List<Object> t = a.selectVProductArticlePictureLatest();
int size = t.size();
 */


%>
<div style="height:170px;"></div>
<div style="border: 1px dashed #BDBDBD; background-color: #D1B2FF; margin:auto; padding: 5px; text-align: center;">

<table style="margin:auto; width:1000px; table-layout:fixed;" border="1" >

<tr height="300px">
	<td ></td>
	<td>셀안의 데이터가 한글인 경우 지정한 셀의 크기에 따라서 자연스럽게 줄바꿈이 일어납니다셀안의 데이터가 한글인 경우 지정한 셀의 크기에 따라서 자연스럽게 줄바꿈이 일어납니다셀안의 데이터가 한글인 경우 지정한 셀의 크기에 따라서 자연스럽게 줄바꿈이 일어납니다</td>
	<td>3</td>
	<td>4</td>
</tr>

<tr height="50px">
	<td>셀안의 데이터가 한글인 경우 지정한 셀의 크기에 따라서 자연안의 데이터가 한글인 경우 지정한 셀의 크기에 따라서 자연스럽게 줄바꿈이 일어납니다</td>
	<td>22</td>
	<td>33</td>
	<td>44</td>
</tr>



</table>

</div>

</body>
</html>