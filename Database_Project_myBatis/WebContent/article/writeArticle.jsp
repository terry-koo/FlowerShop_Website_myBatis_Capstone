<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항 작성</title>
</head>

<style>
#customWrap{
	margin:auto;
	margin-top:200px;
 }
 #saveBTN {
  background-color: #4CAF50;
  color: white;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 80px;
}
input{
	width:1140px;
}

</style>

<body>
<div id="customWrap">
<form action="doWriteArticle.jsp" style="margin:auto; width:1140px;" method="post">
	<table>
		<tr>
			<td>제목</td>
		</tr>
		<tr>
			<td><input type="text" name="title"></td>
		</tr>
			
		<tr style="border-bottom:1px grey dashed;">
			<td>
			게시여부:
			<select name="available" style="width:80px;">
   				<option value="T">게시</option>
		    	<option value="F">보류</option>
  			</select>
  			</td>
		</tr>
		
				<tr style="border-bottom:1px grey dashed;"><!-- 이미지 업로드 부분 시작-->
				  <td align="left">
				  <div class="container">
				      <!-- Input Markup -->
				      <input type="file" id="default-file" style="visibility:hidden;"/>
				
				      
				
				      <!-- Choose File TEXT Markup -->
				      <span id="custom-space"> <strong> No</strong> File, Selected!😭</span>
				  </div>
				   <div class="preview_holder">
				      <div id="preview">
				        <img src="" id="preview_img" class="preview_img"  style="width:192px;height:108px;">
				        <span id="preview_text" class="preview_text">Image Preview</span>
				      </div>
				    </div>
				    <!-- Button Markup -->
				      <button id="custom-btn" type="button" class="btn">
				        CHOOSE FILE
				      </button>
				    <input type="text" id="picture" name="pictureString" style="visibility:hidden;">
				  </td>
				 </tr>
				  <!-- 이미지 업로드 부분 끝 -->
		<br>
		<tr>
			<td>내용</td>
		</tr>		  
		<tr>
			<td><textarea name="content" style="width:1140px; height:200px; resize:none;"></textarea></td>
		</tr>
		<tr>
			<td>태그 : 콤마(,)를 사용해서 태그를 구분해 주세요.</td>
			
		</tr>
		<tr>
			<td><input type="text" name="tag"></td>
		</tr>
		<tr>
			<td><input id="saveBTN" type="submit" value="저장" ></td>
		</tr>
	</table>
</form>
</div>
</body>
<script src="../home/js/imageScript.js"></script> <!-- 사진 불러오는 js -->
</html>