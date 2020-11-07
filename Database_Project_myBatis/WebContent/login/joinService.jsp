<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>회원 가입</title>

   <link href='https://fonts.googleapis.com/css?family=Raleway:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
   <link rel="stylesheet" href="../home/css/animate.css">
   <link rel="stylesheet" href="../home/css/icomoon.css">
   <link rel="stylesheet" href="../home/css/bootstrap.css">
   <link rel="stylesheet" href="../home/css/magnific-popup.css">
   <link rel="stylesheet" href="../home/css/owl.carousel.min.css">
   <link rel="stylesheet" href="../home/css/owl.theme.default.min.css">
   <link rel="stylesheet" href="../home/css/style.css">
   
   <script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if(document.getElementById("email").value == ""){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(document.getElementById("sec").value == ""){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            if(document.getElementById("name").value == ""){
                alert("이름을 입력하세요.");
                return false;
            }
            
            if(document.getElementById("phone").value == ""){
                alert("전화번호를 입력하세요.");
                return false;
            }
            
            if(document.getElementById("address_detail").value == ""){
                alert("상세주소를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
        }
        
       
    </script>
   <link rel="shortcut icon" href="../home/images/favicon.ico" />
   
   </head>
   <body>
  
      
      
<div id="wrap" style="margin:auto; background-color:white; padding:80px">
        <br><br>
        <div style="text-align:center;"><b><font size="6" color="gray">회원가입</font></b></div>
        <div style="text-align:center;"><b><font size="2" color="gray">[박사플로리스트]</font></b></div>     
        
        <br><br>
        <div style="text-align:center"><b><font size="2" style="color:red;"><b>* 표시 필수입력 사항</b></font></b></div>     


  
        <form method="post" action="doJoin.jsp" name="userInfo" onsubmit="return checkValue()">
            <table style="margin:auto;">
                <tr>
                    <td id="title">아이디(이메일)<font style="color:red;"><b>*</b></font></td>
                    <td>
                        <input type="text" id="email" name="email" maxlength="50"  >                     
                    </td>
                </tr>
                
                <tr style="height:5pt"><td></td></tr>
                
                        
                <tr>
                    <td id="title">비밀번호<font style="color:red;"><b>*</b></font></td>
                    <td>
                        <input type="password" id="sec" name="sec" maxlength="50" >
                    </td>
                </tr>
                
               <tr style="height:5pt"><td></td></tr>
                
                <tr>
                    <td id="title">비밀번호 확인<font style="color:red;"><b>*</b></font></td>
                    <td>
                        <input type="password" name="sce" maxlength="50">
                    </td>
                </tr>
                
                <tr style="height:5pt"><td></td></tr>
                                 
                <tr>
                    <td id="title">이름<font style="color:red;"><b>*</b></font></td>
                    <td>
                        <input type="text" id="name" name="name" maxlength="50">
                    </td>
                </tr>
                
                <tr style="height:5pt"><td></td></tr>
                
                 <tr>
                    <td id="title">생일</td>
                    <td>
                        <input type="text" name="birthyyyy" maxlength="4" placeholder="년(4자)" size="6" >
                        <select name="birthmm" style="height:24pt;">
                            <option value="">월</option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
                         <select name="birthdd" style="height:24pt;">
                            <option value="">일</option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                            <option value="13" >13</option>
                            <option value="14" >14</option>
                            <option value="15" >15</option>
                            <option value="16" >16</option>
                            <option value="17" >17</option>
                            <option value="18" >18</option>
                            <option value="19" >19</option>
                            <option value="20" >20</option>
                            <option value="21" >21</option>
                            <option value="22" >22</option>
                            <option value="23" >23</option>
                            <option value="24" >24</option>
                            <option value="25" >25</option>
                            <option value="26" >26</option>
                            <option value="27" >27</option>
                            <option value="28" >28</option>
                            <option value="29" >29</option>
                            <option value="30" >30</option>
                            <option value="31" >31</option>
                        </select>
                    </td>
                </tr>   
                
                <tr style="height:5pt"><td></td></tr>
                 
                <tr>
                    <td id="title">성별</td>
                    <td>
                        <input type="radio" name="gender" value="M" checked>남성
                        <input type="radio" name="gender" value="W" checked>여성
                        <input type="radio" name="gender" value="N" checked>무성
                    </td>
                </tr>
                
                <tr style="height:5pt"><td></td></tr>
                
                <tr style="height:5pt"><td></td></tr>
                    
                <tr>
                    <td id="title">휴대전화<font style="color:red;"><b>*</b></font></td>
                    <td>
                        <input type="text" id="phone" name="phone" />
                    </td>
                </tr>
                
                <tr style="height:5pt"><td></td></tr>
                
                <tr>
                    <td id="title">주소<font style="color:red;"><b>*</b></font></td>
                    <td>
                        <select name="state">
                            <option value="서울특별시">서울특별시</option>
                            <option value="인천광역시">인천광역시</option>
                            <option value="부산광역시">부산광역시</option> 
                            <option value="대전광역시">대전광역시</option>
                            <option value="대구광역시">대구광역시</option>
                            <option value="울산광역시">울산광역시</option>
                            <option value="광주광역시">광주광역시</option>
                            <option value="경기도">경기도</option>
                            <option value="강원도">강원도</option>   
                            <option value="충청북도">충청북도</option>
                            <option value="충청남도">충청남도</option>
                            <option value="전라북도">전라북도</option>  
                            <option value="전라남도">전라남도</option>
                            <option value="경상북도">경상북도</option>    
                            <option value="경상남도">경상남도</option>   
                            <option value="세종특벽자치시">세종특별자치시</option>
                            <option value="제주특별자치도">제주특별자치도</option>  
                        </select>
                    </td>
                </tr>
                
                <tr style="height:5pt"><td></td></tr>
                
                <tr>
                   <td id="title">상세주소<font style="color:red;"><b>*</b></font></td>
                    <td>
                        <input type="text" size="50" id="address_detail" name="address_detail"/>
                    </td>
                </tr>
              
            </table>
            <br>
            
            <div style="text-align:center;">
            
            <textarea style="width:750px;height:100px;">
            	
            </textarea>
            <br>
            
            <input type="submit" value="동의 및 가입"/>  
          
            </div>
            
        </form>
    </div>
    
    
     
    
    


   <script src="../home/js/jquery.min.js"></script>
   <script src="../home/js/jquery.easing.1.3.js"></script>
   <script src="../home/js/bootstrap.min.js"></script>
   <script src="../home/js/jquery.waypoints.min.js"></script>
   <script src="../home/js/owl.carousel.min.js"></script>
   <script src="../home/js/jquery.countTo.js"></script>
   <script src="../home/js/jquery.magnific-popup.min.js"></script>
   <script src="../home/js/magnific-popup-options.js"></script>
   <script src="../home/js/main.js"></script>

   </body>
</html>