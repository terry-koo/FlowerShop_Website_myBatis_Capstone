<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>회원 가입</title>


   <link rel="stylesheet" href="login.css">
   
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
            if(document.userInfo.sec.value != document.userInfo.secCheck.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
        }
        
       
    </script>
   <link rel="shortcut icon" href="../home/images/favicon.ico" />
   
   </head>
   <body style="background-color:#aaaaaa;">
  
      
<div id="wrap" style="margin:auto; background-color:white; padding:80px">
        <br><br>
        <div style="text-align:center;"><b><font size="6" color="gray">회원가입</font></b></div>
        <div style="text-align:center;"><b><font size="2" color="gray">[박사플로리스트]</font></b></div>     
        <div style="text-align:center"><b><font size="2" style="color:red;"><b>* 표시 필수입력 사항</b></font></b></div>     


  <div class="form-style-5">
        <form method="post" action="doJoin.jsp" name="userInfo" onsubmit="return checkValue()">
            <table style="margin:auto;">
                <tr>
                    <td id="title"><font style="color:red;"><b>*</b></font></td>
                    <td>
                        <input type="text" id="email" name="email" maxlength="50" placeholder="Email" readonly>                     
                    </td>
                </tr>
                
                <tr style="height:5pt"><td></td></tr>
                                 
                <tr>
                    <td id="title"><font style="color:red;"><b>*</b></font></td>
                    <td>
                        <input type="text" id="name" name="name" maxlength="50" placeholder="이름">
                    </td>
                </tr>
                
                <tr style="height:5pt"><td></td></tr>
                
                 <tr>
                    <td id="title">생일</td>
                    <td>
                        <input type="text" name="birthyyyy" maxlength="4" placeholder="년도 Ex) 2020" size="6" >
                        <select name="birthmm" style="height:40px;">
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
                         <select name="birthdd" style="height:40px;">
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
                    <td id="title"></td>
                    <td>
                        <input type="radio" name="gender" value="M" checked>남성
                        <input type="radio" name="gender" value="W" checked>여성
                        <input type="radio" name="gender" value="N" checked>무응답
                    </td>
                </tr>
                
                <tr style="height:5pt"><td></td></tr>
                
                <tr style="height:5pt"><td></td></tr>
                    
                <tr>
                    <td id="title"><font style="color:red;"><b>*</b></font></td>
                    <td>
                        <input type="text" id="phone" name="phone"  placeholder="연락처"/>
                    </td>
                </tr>
                
                <tr style="height:5pt"><td></td></tr>
                
                <tr>
                    <td id="title"><font style="color:red;"><b>*</b></font></td>
                    <td>
                        <select name="address">
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
                   <td id="title"><font style="color:red;"><b>*</b></font></td>
                    <td>
                        <input type="text" size="50" id="address_detail" name="address_detail" placeholder="상세주소"/>
                    </td>
                </tr>
              
            </table>
            <br>
            
            <div style="text-align:center;">
            
            <textarea style="width:100%;height:100px;">플랫폼 이용 전에 본 이용약관을 주의깊게 읽으시기 바랍니다. 플랫폼을 이용함으로써 사용자는 본 이용약관에 동의를 표하게 됩니다. 본 이용약관에 동의하지 않는 사용자는 플랫폼을 계속 이용할 수 없습니다. 

플랫폼에서 제공하는 당사의 서비스

본 이용약관에 따라 당사는 플랫폼을 통해 통합 멤버십 서비스(전세계적 보증 연장 프로그램인 닥터플로리스트 케어 프로그램(Cartier Care Program, “CCP”)을 포함), 각종 제안 및 컨텐츠를 제공합니다.

당사의 멤버십 서비스에 따라, 귀하는 웹사이트나 모바일 애플리케이션, 당사의 온라인 및 오프라인 부띠끄* 또는 닥터플로리스트 컨택센터 중 어떤 경로로 닥터플로리스트에 등록하더라도 온라인 및 오프라인 부띠끄와 컨택센터에서 제공하는 서비스에 접근할 수 있습니다. 예를 들어, 온라인 계정을 생성한 고객은 온라인과 오프라인 모두에서 서비스를 제공받을 수 있게 됩니다.

* 당사의 멤버십 서비스에는 당사 또는 당사와 관련된 회사가 운영하는 전세계 모든 오프라인 부띠끄가 참여합니다. 또한, 웹사이트나 모바일 애플리케이션을 통하여온라인 부띠끄도 이용할 수 있습니다.

당사의 멤버십 서비스 고객으로서, 귀하는 당사가 제공하는 독점적인 서비스 및 제안에 접근할 수 있습니다:

-          빠르고 안전한 주문 가능: My Cartier 계정으로 주문하시는 모든 주문정보는 귀하의 계정에 저장되어 한번 저장 후 추가 정보입력 없이 편리한 주문이 가능하며, 주문내역 관리가 가능합니다.

-          관심상품 및 위시리스트 저장: My Cartier 계정을 통해 관심상품을 등록하실 수 있습니다. 저장 및 등록한 관심상품은 언제든 편집하고 관리하실 수 있습니다.

-          부띠끄 수선 서비스 및 수선 진행상황 체크: My Cartier 계정 내에서 수선 및 수리 내역에 대한 추적이 가능합니다.

-          CCP(보증 연장을 위해서는 별도 등록 필요): 귀하가 CCP에 가입하는 경우, 당사는 귀하에게 개인맞춤형 제품 정보, 조언, 서비스, 멤버십 서비스 및 귀하의 전세계 한정된 보증을 연장을 신청할 수 있는 권리를 제공합니다. CCP의 완전한 혜택을 누리기 위하여 귀하는 마케팅 정보를 포함한 닥터플로리스트의 제품이나 서비스에 대한 연락 수신에 동의하여야 합니다. 귀하가 CCP에 가입하는 경우에도, 귀하는 당사의 멤버십 서비스를 받을 수 있습니다.

-          그 외 회원의 요청에 따라 제공되는 서비스

귀하가 신청서를 작성, 서명하고 당사가 귀하의 신청을 수락함으로써 귀하는 플랫폼을 통한 당사의 멤버십 서비스에 등록할 수 있습니다. 당사의 멤버십 서비스 가입은 무료입니다.

당사는 귀하에게 제공하거나 향후 유상으로 제공할 서비스의 범위나 세부사항을 변경하거나 중단할 수 있는 권리를 가집니다. 그 과정에서 당사는 고객의 정당한 이익을 고려하여 이메일, 문자 또는 가장 최근 사용된 주소지로 서면을 송부함으로써 고객에게 변경사항을 사전 통지할 것입니다.

이용약관 업데이트

당사는 본 이용약관을 수시로 변경하는 바, 업데이트된 사항을 정기적으로 확인하시기 바랍니다. 본 이용약관의 최신 버전은 언제나 플랫폼에서 제공받을 수 있습니다. 본 이용약관의 신규 버전은 게시 일자에 즉시 효력이 발생하며 플랫폼 이용 및 사용자와 당사와의 관계에 적용됩니다. 플랫폼을 계속 이용함으로써 사용자는 업데이트 및 개정된 약관의 적용에 동의합니다.

당사 호스팅 서비스

웹사이트 호스팅 서비스는 Chemin de la Chênaie 50, CP30, 1293 Bellevue, Geneva, Switzerland에 소재한 Richemont International SA에 의해 제공됩니다.

모바일 애플리케이션의 경우 당사나 다른 회사가 호스팅할 수 있으며 귀하는 이에 해당하는 기타 회사의 관련 조건을 참고하여야 합니다.

당사 개인정보 처리방침

플랫폼에서의 정보수집 관행(당사가 플랫폼 방문자에 관해 수집하는 정보의 종류와 해당 정보를 이용하는 방식 등)에는 당사의 개인정보 처리방침이 적용됩니다.

닥터플로리스트온라인 부띠끄 판매약관

온라인이나 닥터플로리스트컨택센터를 통해 전화상으로 제품을 구매하는 고객은 해당 구매의 조건에 적용되는 판매약관을 확인하여야 합니다. 이하 “책임의 제한” 규정은 전화를 통한 온라인 제품 판매에는 적용되지 않으므로 관련 제외규정 및 책임제한에 대해서는 위 판매조건을 참고하시기 바랍니다.

플랫폼 상의 자료 이용

닥터플로리스트는 사용자가 활용할 수 있도록 자사 및 제품에 관한 정보를 제공하는 플랫폼을 제작하였습니다. 플랫폼에 표시된 닥터플로리스트 제품의 시각적 표현이 원제품의 색상, 디자인 및 스타일 등을 있는 그대로 구현하도록 하기 위해 상당한 노력을 기울였으나, 원제품에 비해 다소의 변형, 왜곡 및/또는 차이가 있는 것으로 비춰질 수 있습니다. 이러한 문제는 예컨대 사용자의 브라우저 또는 컴퓨터 설정과 같은 기술적 문제로 인한 것일 수 있습니다. 따라서 닥터플로리스트는 플랫폼에 구현된 제품 이미지와 원제품 사이의 외관상 차이에 대해서는 일체 책임을 질 수 없습니다. 당사는 사용자가 당사 부띠끄 또는 공인 소매 매장을 방문한 후에 온라인이나 전화로 구매할 것을 적극 권장합니다.

사용자는 재산권 고지, 특히 저작권©, 상표™ 등 지적 재산권 고지가 온전하게 보존되고, 수정, 삭제 또는 변경되지 않음을 전제로 사용자의 비상업적, 교육적, 개인적 또는 가정용으로만 컴퓨터 사본 1부를 다운로드하거나 플랫폼을 통해 사용자에게 제공된 자료의 사본을 1부 출력하거나, 사용자의 모바일 장치에 애플리케이션을 다운로드할 수 있습니다. 달리 명시하지 않은 한, 사용자는 사용자가 플랫폼에서 보거나 읽는 모든 것(이미지, 사진(사진에 표시된 인물 포함), 일러스트레이션, 아이콘, 텍스트, 비디오 클립, 음악, 글 및 기타 자료 등(“닥터플로리스트 자료”)이 저작권법, 디자인법, 상표법 등의 법률, 국제조약의 규정 및 전 세계 국가의 국내법에 따라 보호되는 것이라고 간주하여야 합니다.

사용자는 공공적 또는 상업적 목적 등을 위하여 닥터플로리스트 자료를 판매, 복제, 유통, 전달, 수정, 게시, 공연, 보도하거나, 동 자료에 기반하여 파생 저작물 또는 이차 저작물을 준비하거나, 여하한 방식으로 동 자료를 사용할 권한이 없습니다. 또한, 닥터플로리스트 자료는 어떤 목적으로든 다른 플랫폼, 네트워크에 연결된 컴퓨터 환경 또는 기타 디지털 플랫폼 상에서 게시되거나 전달될 수 없습니다. 본 이용약관을 위반할 경우, 사용자의 닥터플로리스트 자료 이용 허가는 자동으로 해지되며 닥터플로리스트 자료로 제작된 모든 사본은 즉시 폐기되어야 합니다. 닥터플로리스트 자료의 무단 사용은 저작권법, 상표법, 개인정보 보호 및 퍼블리시티 법, 통신 규정 및 법령을 침해할 수 있습니다.

사용자 제출물 및 원치 않는 의사연락

본 조항은 닥터플로리스트에 전송된 의사연락에 관한 것입니다. 전화 또는 플랫폼을 통한 고객 문의, 서비스 이용 또는 제품 구매와 관련하여 닥터플로리스트에 전달된 개인정보와는 무관합니다. 후자에 대해서는 개인정보 처리방침에 명시된 규정이 적용됩니다.

사용자가 플랫폼이나 소셜 미디어, 전자우편 등을 통해 닥터플로리스트에 전송하는 모든 원치 않은 의사연락 또는 자료(데이터, 질의나 답변, 의견, 제안 등을 포함하나 이에 한정되지 않음)는 닥터플로리스트 에서 기밀사항이나 재산권적 정보로 취급되지 않습니다. 닥터플로리스트에 의사연락을 송부할 때 사용자는 해당 의사연락을 (현재 알려져 있거나 향후 개발될) 여하한 형식, 매체 또는 기술로 단독 또는 다른 저작물의 일부로 사용, 복제, 수정, 출판, 편집, 번역, 유통, 공연 및 게재할 수 있는 전세계적이고, 로열티가 부과되지 않으며, 영구적이고, 불가역적인, 비전속적 라이선스(재라이선스권 포함)를 자동적으로 닥터플로리스트에 부여하게 됩니다. 사용자가 전송하는 모든 내용은 닥터플로리스트와 그 계열사가 복제, 공개, 전송, 출판, 방송 및 게재, 또는 이를 이용한 제품 개발, 제조 및 마케팅 등 여하한 목적으로 사용할 수 있습니다.

또한, 닥터플로리스트는 보석, 시계, 가죽제품 및 기타 고급 액세서리 등 고품질 럭셔리 제품의 디자인과 제조에 있어 세계적인 명성을 누리고 있습니다. 닥터플로리스트는 내부에 창의력의 원천을 두고 있으며, 특히 닥터플로리스트의 창작물을 기획, 완성하는 고도로 숙련된 디자이너팀이 존재합니다. 따라서, 닥터플로리스트는 원치 않는 협업 제안에 동의하거나 수인할 수 없습니다. 실제로 닥터플로리스트가 이미 유사한 아이디어 및/또는 창작물에 대해 이미 작업을 진행 중이라고 보아도 무방합니다. 결론적으로, 닥터플로리스트는 창작물에 관한 사용자의 아이디어나 기타 제안에 관심이 없다는 점을 알려드립니다.

책임의 제한

본 조항은 플랫폼에 적용되며, 당사의 현지 또는 지역 시장에서, 온라인 또는 전화로 판매되는 제품에는 적용되지 않습니다.

닥터플로리스트는 제공된 정보의 정확성과 완전성을 기하고자 하나, 닥터플로리스트 자료의 정확성, 무오성, 신뢰성 또는 닥터플로리스트 자료 사용이 제3자 권리를 침해하지 않음을 보증하거나 진술하지는 않습니다.

닥터플로리스트는 플랫폼이나 닥터플로리스트 자료가 기능적 및/또는 기술적 측면에서 오류가 없다거나 플랫폼, 닥터플로리스트 자료 또는 이를 제공하는 서버에 바이러스나 기타 유해한 요소가 없다고 보증하지 않습니다. 플랫폼 또는 닥터플로리스트 자료의 이용으로 재산, 자료, 장비, 데이터 또는 기타 요소의 서비스나 교체가 필요하게 될 경우, 닥터플로리스트는 해당 비용을 부담하지 않습니다. 상기 내용을 제한하지 않음을 전제로, 플랫폼 상의 모든 내용은 사용자에게 “있는 그대로” 및 “이용 가능한 상태로”, 관련법에서 허용하는 최대한 범위에서 제공되나, 이에 대한 명시적 또는 묵시적 보증(상품성, 품질 만족, 특정 목적 부합성, 합리적인 관리와 기술, 또는 침해의 부존재에 대한 암묵적 보증을 포함하나 이에 한정되지 않음)은 존재하지 않습니다. 닥터플로리스트와 그 공급업체는 닥터플로리스트 자료, 소프트웨어, 텍스트, 다운로드, 그래픽 및 링크 또는 플랫폼 사용으로 얻게 될 결과에 대하여 일체의 보증을 하지 않습니다.

관련법에서 허용하는 최대한 범위에서, 닥터플로리스트는 플랫폼에서 제공되는 정보의 이용으로 인해 또는 이와 관련하여 발생하는 일체의 간접적, 우발적, 특별 또는 결과적 손해, 또는 사용이익 상실, 영업 정지, 일실 이익 또는 데이터 유실에 대하여, 행위의 형식(계약, 불법행위(과실 포함) 등의 여부)을 불문하고 책임을 지지 않으며, 이는 닥터플로리스트가 해당 손해의 가능성을 고지 받았는지의 여부와 무관합니다.

일부 관할지의 소비자 보호에 관한 법률이 특정 보증 또는 책임의 제외 및 제한을 허용하지 않을 수 있어 상기 제외 및 제한 조항 중 일부가 적용되지 않을 수 있습니다.

상표 고지

일반적으로, 플랫폼에 표시된 모든 상표, 로고 및 서비스표(총칭하여 “상표”)는 등록되거나, 등록되지 않았거나, 달리 보호를 받는 닥터플로리스트의 상표이거나, 또는 닥터플로리스트가 제3자로부터 사용에 관한 라이선스를 받은 상표입니다. 다른 상표들은 재산권적 상표이며 각각의 소유자에게 등록되어 있습니다. 플랫폼에 포함된 어떤 내용도 묵시 등에 의해 닥터플로리스트 또는 상표를 소유한 제3자의 사전 서면 허가 없이 상표를 사용할 수 있는 라이선스 또는 권리를 허여하는 것으로 해석될 수 없습니다. 본 약관에 명시된 경우를 제외하고, 플랫폼에 표시된 상표, 또는 플랫폼 상의 기타 컨텐츠를 오용하는 것은 엄격하게 금지됩니다.

저작권 고지

플랫폼 상의 모든 컨텐츠(닥터플로리스트 자료 포함)는 닥터플로리스트의 저작권 © 이거나 닥터플로리스트가 라이선스를 취득한 것으로 모든 권리는 닥터플로리스트에 귀속합니다. 상기의 “플랫폼 상의 자료 이용” 조항을 참고하시기 바랍니다.

링크 및 연동

플랫폼에는 닥터플로리스트와 무관한 제3자의 플랫폼으로 연결되는 링크가 포함될 수 있습니다. 이러한 링크가 삽입되어 있더라도 이는 닥터플로리스트가 해당 사이트를 보증한다는 의미는 아닙니다. 닥터플로리스트는 연결된 사이트에 포함된 컨텐츠를 모두 검토하지 않았으며 외부 사이트 페이지 또는 플랫폼에 연동된 기타 모든 사이트의 컨텐츠나 그 정확성에 대한 책임을 지지 않습니다. 사용자가 외부 사이트 페이지 또는 제3자 사이트로 연동되는 링크를 클릭할 때 그와 관련된 위험은 전적으로 사용자가 감수해야 합니다. 명시적 사전 서면 허가가 없는 경우, 닥터플로리스트의 플랫폼을 제3자 플랫폼에 연동하는 것은 허용되지 않습니다.

해지와 중단

사용자는, 사용자가 본 이용약관의 규정이나 취지를 위반하거나 그에 반하여 행동하거나, 닥터플로리스트, 그 계열사 또는 제3자의 권리를 침해하였다는 닥터플로리스트의 합리적인 판단이 있는 경우, 사용자에게 통지하였는지 여부와 무관하게 닥터플로리스트가 사용자의 플랫폼 접속과 이용을 해지하거나 중지시킬 수 있음에 동의합니다. 사용자는 닥터플로리스트가 통지 여부와 무관하게 플랫폼을 수정하거나 플랫폼 제공을 중단할 수 있음에 동의합니다. 사용자는 이러한 수정 또는 중단으로 인해 닥터플로리스트가 사용자나 제3자에 대한 책임을 부담하지 않음에 동의합니다. “책임의 제한” 및 “일반 조항”이라는 제하의 규정은 본 이용약관이 해지된 이후에도 존속합니다.

일반 조항

달리 명시된 경우를 제외하고, 플랫폼에 제시된 정보와닥터플로리스트 자료는 닥터플로리스트의 제품과 서비스에 대한 홍보 목적 그리고 일정한 경우 다양한 수단을 통한 판매 목적으로만 제시된 것입니다. 닥터플로리스트는 닥터플로리스트 자료가 전세계 모든 국가에서 사용에 적합하거나 사용이 가능하다고 보장하지 않습니다. 사용자는 특정 인에 의한 또는 특정 국가에서의 닥터플로리스트 자료 접속이 불법일 수 있음에 유념하고 현지 법률을 준수해야 할 책임이 있습니다. 당사의 제품은 세계 각지에서 구입할 수 있습니다. 다만, 플랫폼은 전세계적으로 제공되지 않은 제품을 표시할 수 있습니다.

본 이용약관의 특정 조항 또는 그 일부가 불법, 무효 또는 집행 불가능하다고 판단되는 경우, 해당 조항 또는 그 일부는 본 이용약관에 포함되지 않는 것으로 간주되며, 관련 법률에 의해 달리 요구되지 않는 한, 본 이용약관의 나머지 조항들의 적법성, 효력 또는 집행 가능성은 이에 영향을 받지 않습니다.

본 이용약관은 플랫폼 이용과 관련하여 사용자와 당사 사이의 완전한 계약을 구성하며, 본 이용약관에서 규율하는 사항과 관련하여 구두 또는 서면으로 체결된 당사자들의 모든 이전 합의, 계약서 초안, 약정, 확약, 또는 부수적인 계약을 대체합니다.

닥터플로리스트가 본 이용약관의 특정 조항의 위반에 대해 권리 집행을 포기한다고 해서 다른 또는 이후의 모든 위에 대해 포기하는 것은 아닙니다.

준거법 및 관할

본 이용약관은 법률 조항의 상충과 무관하게 스위스 법률에 따라 규율되고 그에 따라 해석됩니다. 본 이용약관으로 인하여 또는 이와 관련하여 발생하는 일체의 분쟁, 논란 또는 청구(본 이용약관의 효력, 무효, 위반 또는 해지 포함)는 본 이용약관의 규정에 따라 판결하거나 중재되어야 합니다. 스위스 법률이 사용자 국가의 소비자 관련 강행법규와 상이할 경우, 당사는 사용자에게 유사한 보호 조치를 제공할 수 있습니다.

당사 연락

본 이용약관이나 전반적인 사항에 관한 질의나 의견이 있으면 아래 기재된 주소로 연락 바랍니다. 당사가 보유하고 있는 귀하의 개인정보의 사본을 신청하고자 할 경우에도 동 주소를 사용할 수 있습니다.
            	
            </textarea>
            <br>
            
            <input type="submit" value="동의 및 가입"/>  
          
            </div>
            <input type="text" id="kakaoID" name="kakaoID" style="visibility:hidden" value="nokakao" />
        </form>
        </div>
    </div>
    
    
     
    

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
			  success:function(res){
				  /*
				  console.log(res);
				  var id = res.id+"<br>";
				  var email = res.kakao_account.email+"<br>";
				  var name = res.properties.nickname+"<br>";
				  var gender = res.kakao_account.gender+"<br>";
				  var age_range = res.kakao_account.age_range+"<br>"
				  var birthday = res.kakao_account.birthday+"<br>"
				  var token = "token= "+authObj.access_token+"<br>";
				  var token_expire = "expires_in= "+authObj.expires_in+"<br>";
				  var html = id+email+name+gender+age_range+birthday+token+token_expire;
				  document.getElementById('user-info').innerHTML = html;
				  document.getElementById('ph').src = res.properties.profile_image;
				  */
				  document.getElementById('kakaoID').value = res.id;
				  document.getElementById('email').value = res.kakao_account.email;
				  document.getElementById('name').value = res.properties.nickname;

			  }
			  
		  })
	},
	scope:"account_email, age_range, gender, birthday,"
})
</script>
</html>