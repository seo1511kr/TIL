# 데이터분석시 DB에서 중요한 것
# CRUD
# quarry 질의
# mong DB 3장
# maria DB ch6

#프로그램 실행 중 발생하는 동적 event는
# java script의 영역임

# 웹 페이지 -> 웹 사이트 -> 웹 앱(어플리케이션)
# 과정: 페이지 기획 -> 코딩(구현) -> 웹 브라우저가 해석 -> 화면출력
#  도메인(주소): 1) 고정 ip, 2) 자동 ip
# editor: 메모장(윈도우), 텍스트편집기(맥), gedit(리눅스)
# html 에디터: 아톰, 파이참, 에디트플러스,....

# html 기본 구조
# 태그! <head>, <body>
# <h1~6>,<strong>,<u>
# h와 strong은 둘 다 굵은 글씨지만, 구조의 관점에서 차이가 생김
# 웹페이지 베포시 검색엔진에게 h태그는 제목이라는 사실을 인지시킴
# <!DOCTYPE html>
# <html lang="en">
# <head>
#     <meta charset="UTF-8">
#     <title>Title</title>
# </head>
# <body>
#
# </body>
# </html>



# <?xml version="1.0" encoding="UTF-8"?>
# <note>
# 	<to>Tom</to>
# 	<from>Amy</from>
# 	<heading>Reminder</heading>
# 	<body>Don't forget me this weekend!</body>
# </note>
# < !--to
# 태그로
# 묶인
# 값: Tom <= > to = Tom
# html
# 주석기호 -->


# <!DOCTYPE html>
# <html lang="en">
# <head>
#   <meta charset="UTF-8">
#   <title>Title</title>
# </head>
# <body>
# <h1>day13</h1>
# <h2>DB 개요</h2>
# <h2>웹프로그래밍 html</h2>
# 태그의 종류: head, body, h1~6, strong, u, style
# meta(사이트 정보), div, a(anchor), script(javascript), img, p(문단), br(줄)
# li(목록), ul/ol, form(회원가입 양식), input(id, pw 박스), table(표), tr(표의 줄), td(표의 칸)
# advancedwebranking.com
# <h4>this is heading 1</h4>
# <h5>this is heading 1</h5>
# <h6>this is heading 1 여기까지만 유효</h6>
# <strong>this is heading 1</strong>
# <br>
# <h7>this is heading 1</h7>
# <h8>this is heading 1</h8>
#
# html<strong>문서</strong>를 <u>작성</u>합니다
# </body>
# </html>
# 
#
#  xml문서: 구조적 문서, 태그 이름이 정해져 있음
# html 비구조적 문서, 태그 이름을 사용자가 지정할 수 있음
#
#
#
#
# <?xml version="1.0" encoding="UTF-8"?>
# <note class="">
# 	<to>Tom</to>
# 	<from>Amy</from>
# 	<heading>Reminder</heading>
# 	<body>Don't forget me this weekend!</body>
# </note>
#
#
# 웹 통신 과정
# 1. 사용자가 주소 입력(www.naver.com)
# 2. www.naver.com ->13.15.230.221 주소로 변환(DNS)
# 3. 브라우저는 13.15.230.221에 웹(홈)페이지를 요청
# 4. 웹서버는 요청을 받고 실행함 -> HTML, CSS ,JS 문서 전송
# 5. 사용자 웹브라우저는 전달 받은 문서를 해석 -> 화면에 출력
# 6. 브라우저에는 네이버 홈페이지가 출력
#
# 프론트엔드(HTML, CSS, JS)로 만든 페이지
# 서버를 구축하지 않고 보여지는 페이지
# <html>
# 	<head>
# 		<title>My Homepage</title>
# 	</head>
# 	<body>
# <!-- 주로 body태그 안에 실제 내용을 작성-->
# 		Welcome to</br> my homepage!
# 	</body>
# </html>
#
#
# <meta charset="UTF-8">
# <aa>
# 	<bb>내용</aa>
# </bb>
# <aa>
# 	<bb>내용1</cc>
# 	<cc>내용2</bb>
# </aa>
# <!--위의 예시처럼 짝을 잘못맞추면 기능을 못함-->
# <!--태그는 반드시 짝을 지어야 함-->
# <!--단독 태그: <br>,<img>,<hr>,<input>,<link>-->
# <!--</br> 처럼 형식을 맞춰줘 표현하기도 함-->
#
# <html>
# <head>
# 	<link type="text/css" href="my_style.css">
# </head>
# <body>
# 	<font color="red" face="Dotum">Hello</font>
# 	<font color="yellow">World</font>
# </body>
# </html>
#
#
# <div id="my-box1"></div>
# <div id="my-box2" class="boxes"></div>
# <div id="my-box3" class="boxes"></div>
# <div class="boxes"></div>
# <!--모든 태그에는 id, class 속성 부여가능 => CSS, JS에서 태그를
# 쉽게 다룰 수 있음
# => 하나의 id당 하나의 태그만 적용 가능
# => 하나의 클래스를 여러 태그에 적용 가능
# -->
#
# <!--style 속성 : 태그의 스타일 지정. 출력되는 형식을 지정-->
# <div style="width:500px; height:300px; border: 1px solid red">hi</div>
# <div style="height:40px; border: 1px solid green">mybox</div>
#
#
# <!-- 줄바꿈은 <br>태그를 사용-->
# <meta charset="UTF-8">
# <div>첫번째줄<br>두번째줄</div>
# <html>
# 	<body>
# 	<pre>
# <!--<pre>띄어쓰기 tap 줄바꿈을 입력값 그대로 출력하는 태그-->
# 	<p>the</p>
# 		first
# 		real
# 		line<br>
# 		the second line
# 	</pre>
# 	</body>
# </html>
#
# <!--ctrl+/와 ctrl+shift+/-->
# <!--p tag: paragraph-->
# <html>
# 	<body>
# 		<p>first paragraph</p>
# 		<p>second paragraph</p>
# 		<p>
# 			new line<br>
# 			third paragraph
# 		</p>
# 	</body>
# </html>
#
# <!--글자 강조할 때 <b> 보다는 <strong> 태그 사용 권장
# css에서는 font-weight 값을 bold로 설정-->
# <b>안내</b>홈페이지를 닫습니다
# <b><i><u>이탤릭체</u></i></b>입니다
#
#
# <html>
# <body>
# 	<h2>웹 교육을 위한 서비스 기획안</h2>
# 	<h3>개요</h3>
# 	<p>
# 		웹 개발은 모바일이 중심이 된 IT시장에서도 여전히 중요한 위치에 있다.
# 	</p>
#
#
# 	<h3>개발</h3>
# 	<p>
# 		웹 개발은 주로 클라이언트와 백엔드 둘로 나눈다.
# 	</p>
#
# 	<h5>클라이언트 언어</h5>
# 	<ul>
# 		<li>HTML</li>
# 		<li>CSS</li>
# 		<li>JavaScript</li>
# 	</ul>
#
# 	<h5>백엔드 언어</h5>
# 	<ol>
# 		<li>PHP</li>
# 		<li>ASP</li>
# 		<li>Java</li>
# 		<li>Python</li>
# 	</ol>
# </body>
# </html>
#
# a태그: 하이퍼링크를 설정하는 태그
# 속성:
# -href:이동 할 링크
# -target: 링크를 여는 방법
# 새탭, 현재 화면, iframe:부모페이지,...
#
# <a href="https://www.naver.com">네이버</a>
# <!--현재페이지가 네이버로 변경-->
# <a href="https://www.daum.net" target="_blank">다음</a>
# <a href="https://www.google.com" target="_self">구글</a>
# <img src="google.png" width="300" height="200">
# <img src="google2.png" width="300" height="200">
#
# <a href="https://www.daum.net" target="_parent">다음</a>
# <a href="https://www.daum.net" target="_top">다음</a>
#
# <a href="https://www.google.com" target="_blank"><img src="google.png" width="300" height="200"></a>


