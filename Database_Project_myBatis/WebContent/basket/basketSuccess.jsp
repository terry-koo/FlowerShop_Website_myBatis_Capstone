<%@page import="mybatis.model.Basket"%>
<%@page import="java.util.*"%>
<%@page import="mybatis.repository.session.SessionRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>

<style>
  table, th, td {
    border: 1px solid #37a637;
    margin: auto;
  }
  table {
    width: 700px;
    color: black;
    
  }
</style>

<body>




<div style="height:170px;"></div>
<div style="border: 1px dashed #BDBDBD; background-color: #c2d0f2; margin:auto; padding: 5px; text-align: center;">

	<h1> 주문완료  </h1>
	<h3> 주문내역을 꼭 확인해주세요  </h3>
	<a href="../home/index.jsp">-> 주문내역 확인하기 <-</a>
	<a href="../home/index.jsp">-> 메인페이지로 돌아가기 <-</a>

</div>



</body>
</html>