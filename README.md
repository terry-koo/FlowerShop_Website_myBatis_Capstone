# FlowerShop_Website_myBatis_Capstone
🌻소상공인 돕기 :: 웹 홈페이지 제작

## 1. 기술 
- Skill stack 
  - <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=MySQL&logoColor=white"/> 
  - <img src="https://img.shields.io/badge/Java(JDK 11.0.9)-007396?style=flat-square&logo=Java&logoColor=white"/>
  - <img src="https://img.shields.io/badge/JSP-007396?style=flat-square&logo=Java&logoColor=white"/>
  - <img src="https://img.shields.io/badge/Microsoft Azure-0078D4?style=flat-square&logo=Microsoft Azure&logoColor=white"/> 

 - Version
   - `DB` : Mybatis 3.5.5 + MySQL 5.7(Azure)
   - `Web Server` : Apache Tomcat 9.0(Azure)
   - `JRE SYSTEM LIBRARY` : JDK 11.0.9

## 2. 구현 기능
  - 로그인 및 회원정보 관련 기능
    - 로그인 -> 카카오 API 활용하여 로그인 또는 자체 서비스 로그인 가능
    - 회원가입 -> 카카오 API 활용하여 회원가입 또는 자체 서비스 회원가입 가능 
    - 사용자 정보 -> 사용자 로그인시 본인 정보 확인가능
    - 회원 정보 수정
  - 꽃 데이터 관련 기능
    - 꽃 전체보기 -> 관리자가 입력한 상품 데이터 사용자가 최신순으로 조회 가능
    - 꽃 리뷰 보기  -> 게시판에서 상품 리뷰 확인가능
  - 꽃 주문 관련 기능
    - 주문 장바구니
    - 꽃 주문
    - 배송 조회  
  - 관리자 전용 기능
    - 주문 상태
    - 판매 내역
    - 회원 리스트
    - 꽃 데이터 추가 및 수정  -> 관리자가 상품 추가 등록 가능
  - 이벤트 및 마케팅 관련 기능  
    - VIP고객
    - 사용자 활동성 보기( 방문자 수, 페이지 이동 경로 트랙킹 ) ->로그인시 사용자 실시간 페이지 이동경로가 데이터베이스에 저장됨
    - 상품 리뷰 -> 게시판에서 상품 리뷰 확인가능
    - 편지 문구 -> 상품 주문시 편지 문구 선택 가능
## 3. DB기술 명세서
1. 모든 테이블과 속성 명은 소문자이다. (SQL 에서 구분하지 않지만, word 에서 작성시
혼동을 방지하고자 미리 공지한다.) 따라서 word 문서내 표기와 상관없다. 
2. 테이블과 속성 명의 단어가 2 개 이상일 때는 _(underscore)로 구분한다.
3. Id 속성은 해당 테이블 약어(abbreviation)와 해쉬값으로 정한다.
Ex) article 테이블의 id 일 경우 A1321856189
단, customer_basic 은 Kakao api 를 사용할 경우 Kakao id 를 사용하고,
자체 로그인 시스템으로 가입시 cb22155123 를 사용한다.
4. Code 속성은 id 와 다른 개념으로, 단순 숫자로 구분된다.
5. T/F 값을 가지는 속성의 명은 is_ 접두사를 사용하나다. (in_cart 의 경우 in 사용)
CHAR(1) -> ‘T’ / ‘F’ 
6. SQL 작성시 SQL 단어는 대문자로 작성하고 테이블 및 속성 정보는 소문자로
작성한다.
(가독성 향상)
Ex) SELECT customer_id FROM customer_basic
7. 사진과 같은 대형 파일들은 웹서버의 메모리와 DB 접근 비용을 계산하여 효율적인
방법을 취하도록 노력해야 한다.
8. DB 입출력 시에 DB 에서 처리할 수 있는 내용들은 DB 에서 처리하게 하여 웹서버의
부담을 줄이도록 한다. 단, Manager 클래스와 같이 웹서버에서 재사용하는
데이터들은 다른 기능에서 활용할 수 있도록 원본을 유지하여 입출력한다.

![image](https://user-images.githubusercontent.com/67509011/147128063-16811d4b-6bcd-4cb2-83d6-8f7628da68af.png)
![image](https://user-images.githubusercontent.com/67509011/147128112-13c44444-7168-4c5a-9e51-3fe2206f7e4b.png)
![image](https://user-images.githubusercontent.com/67509011/147128138-d5a550cb-0d31-4917-8a3e-856b47562502.png)
![image](https://user-images.githubusercontent.com/67509011/147128179-7dcdff49-3c69-42ce-a0ae-a0c8365a5d92.png)
![image](https://user-images.githubusercontent.com/67509011/147128215-75fb8122-d6a6-4151-acfc-1553690ee4f9.png)
![image](https://user-images.githubusercontent.com/67509011/147128231-706f2f9e-056f-412b-af63-21c34ccfcfeb.png)
![image](https://user-images.githubusercontent.com/67509011/147128258-a154a746-ac4e-4273-bc22-64e2b7b4d705.png)
![image](https://user-images.githubusercontent.com/67509011/147128279-cf044854-cb02-4d2d-8f57-aca3e303db53.png)
![image](https://user-images.githubusercontent.com/67509011/147128310-c90082b0-84c4-4853-a023-32200167b05d.png)
![image](https://user-images.githubusercontent.com/67509011/147128343-840a7f55-396a-459d-8464-1de5805548a3.png)
![image](https://user-images.githubusercontent.com/67509011/147128409-9922a575-baf9-4cf1-8f73-e46518c2c7f2.png)
![image](https://user-images.githubusercontent.com/67509011/147128429-ee0100f7-1383-4d36-a426-1490ea66306d.png)
![image](https://user-images.githubusercontent.com/67509011/147128498-16864ee5-fd93-46e6-8220-d209eb15fd02.png)
![image](https://user-images.githubusercontent.com/67509011/147128546-53766128-9ad7-481f-bca4-907d565f042b.png)
![image](https://user-images.githubusercontent.com/67509011/147128573-2dc61199-3277-440b-9a60-5a9caca468fb.png)
![image](https://user-images.githubusercontent.com/67509011/147128597-f5016424-6af0-4969-a565-a9b0d7c23ec1.png)
![image](https://user-images.githubusercontent.com/67509011/147128618-91ce782e-4cdd-4d08-8dcc-872c9413a9d9.png)
![image](https://user-images.githubusercontent.com/67509011/147128648-4fe59990-0b87-4fd1-af2a-07de0757de67.png)
![image](https://user-images.githubusercontent.com/67509011/147128687-af73ec68-7aaf-4a9b-b176-3b08e71ab7ed.png)

## 4. 웹 서버
비즈니스 로직은 실제 구매 프로세스를 바탕으로 정해졌다. (아래 구매 로직맵 참고.)
현재까지는 크게 사용자, 게시판, 구매, 관리 기능이 있다. 이 기능들을 구현할 때 확장성을
고려하여 설계 했기 때문에 기능 확장시 작성된 내용을 참고하여야 한다.   
웹서버와 DB 서버는 Microsoft Azure 서비스를 이용하고 있다. 차이점은 웹서버는 한국남부에
위치하고, DB 서버는 미국 동부에 위치하고 있다. 이에 따라 DB 접근 시에 긴 지연이 발생하여
사용자에게 불편함을 줄 수 있다.   
이 서비스는 이점을 고려하여 Manager 라는 클래스를 웹서버에 두어 자주 사용되면서 파일이 큰 데이터들은 DB 서버가 아닌 웹서버에 요청한다.   
예를들어 게시판 같은 경우 하나의 게시글에 article, tag, review, picture, customer_baisc
5 개의 테이블이 연결되어 있다.   
매번 이 테이블들을 조인하여 들고 오는 것 것은 바람직한 방법이 아니며, 많은 비용과 서비스 지연 인한 사용자 불편함을 초래한다.   
그래서 articlePostManager 라는 클래스를 활용해 서버 최초 구동시에 모든 정보를 들고와서 관리한다.   
댓글 추가시나 다른 변동 사항이 있을 시에는 구현 코드에서 직접하지 않고 articlePostManager api 를 사용하여 articlePostManager 가 DB 서버와 작업을 처리하고 결과를 리턴한다.   
이때 절대 전체 업데이트를 사용하지 않고 해당 부분만을 업데이트 하도록한다.   
Manager 클래스의 장점은 속도와 비용의 장점 뿐만 아니라 구현에서도 장점을 가진다.   
데이터를 ArrayList 로 관리하기 때문에 stream 객체 이용이 가능하고 따라서 다양한 기능들을 사용할 수 있다. (map, filter 등)   
![image](https://user-images.githubusercontent.com/67509011/147129121-bcbfe700-53bb-4c5b-a7be-562c67d9de89.png)
![image](https://user-images.githubusercontent.com/67509011/147129144-b8043891-3bf9-40a4-9e0e-8622f47c2c02.png)
![image](https://user-images.githubusercontent.com/67509011/147129185-bf8d831d-98fe-48c0-b93f-b043513b52bc.png)

## 5. 구매 로직
![image](https://user-images.githubusercontent.com/67509011/147129215-8a811b69-d309-4230-bbf1-37a8fa73347d.png)

## 6. 웹 사이트 구현 모습
![image](https://user-images.githubusercontent.com/67509011/147129420-6eaaf243-2276-4eb6-b4d1-c6a8cab1e792.png)
![image](https://user-images.githubusercontent.com/67509011/147129463-9cd82935-cb76-43c4-8485-f98298e7df56.png)
![image](https://user-images.githubusercontent.com/67509011/147129493-c3b02d97-5023-43bd-b9cd-706a0ad8fb0e.png)
![image](https://user-images.githubusercontent.com/67509011/147129509-8708810c-712b-44b3-9caa-5d0a05b28ebe.png)
![image](https://user-images.githubusercontent.com/67509011/147129520-96a9b425-3d93-4af0-ae0f-936eb968f8b1.png)
![image](https://user-images.githubusercontent.com/67509011/147129541-66bb9944-510c-4648-bf4a-2dd99cc91833.png)
![image](https://user-images.githubusercontent.com/67509011/147129554-a4380f05-5e61-4030-9d38-a69f74358f79.png)
![image](https://user-images.githubusercontent.com/67509011/147129566-3e13a797-1af2-4f92-b40a-8fff0c9112cc.png)
![image](https://user-images.githubusercontent.com/67509011/147129577-e47ac18e-2e05-4b0f-ac03-6aa362a01e1d.png)
![image](https://user-images.githubusercontent.com/67509011/147129590-3c8071f5-5d03-478d-b05b-9291434dcd90.png)
![image](https://user-images.githubusercontent.com/67509011/147129610-e5060c86-1ae2-40c2-bf54-7710a477d9c3.png)
![image](https://user-images.githubusercontent.com/67509011/147129624-b1d8c931-d820-49ab-a1cb-04ab6ff6b822.png)
![image](https://user-images.githubusercontent.com/67509011/147129651-24508da7-1ade-4e87-b435-599340b0b85d.png)
![image](https://user-images.githubusercontent.com/67509011/147129673-a9ecd60e-bf93-4f32-a2dd-e4e089029d33.png)

## 7. 연동되어 있는 안드로이드 어플리케이션
[박사플로리스트 어플리케이션](https://github.com/terry-koo/FlowerShop_Android_Capstone)
