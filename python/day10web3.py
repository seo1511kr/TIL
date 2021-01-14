# 입력 예시: 0123456789 01234 01234567890 6789012345 012322456789
# 출력 예시: True False False True False


# # sub함수
# import re
# # 대한민국,한국,코리아...=> 대한민국
# print(re.sub("apple|orange","fruite", "apple tree banana orange"))
#
# "1 2 apple 3 banana 4 7 9 30 tree"
# print(re.sub("[0-9]+","num","1 2 apple 3 banana 4 7 9 30 tree"))
# print(re.sub("\d+","num","1 2 apple 3 banana 4 7 9 30 tree",1))
# print(re.sub("\d+","num","1 2 apple 3 banana 4 7 9 30 tree",2))
# print(re.sub("\d+","num","1 2 apple 3 banana 4 7 9 30 tree",count=3))
#
# pat=re.compile("\d+")
# print(pat.sub("num","1 2 apple 3 banana 4 7 9 30 tree",4))

import urllib.request
# url="https://www.multicampus.com/img/saas/main/logo/CUS0001/pc_main.png"
# urllib.request.urlretrieve(url,'test.png')
# print("저장되었습니다")


# url="https://www.multicampus.com/img/saas/main/logo/CUS0001/pc_main.png"
# mem=urllib.request.urlopen(url).read()  # urlopen().read():url 열고 파일을 파이썬 변수에 저장
# with open("test2.png",'wb') as f:       # (write binary: 바이너리 파일에 출력할 때)
#     f.write(mem)
#     print('저장되었습니다')



# XML문서 이해하기=========================================================================
# 우클릭 소스보기, 우클릭 이미지링크
# http://www.weather.go.kr/weather/forecast/mid-term-rss3.jsp
# -1. 클라이언트(페이지 요청,웹브라우저에 www.naver.com)
# -2. 웹서버 -> 메인페이지 제공(index.html):홈페이지
# -3. 웹브라우저(크롬,사파리,웨일 등)가 html 파일을 해석해서 출력함
# (웹브라우저마다 조금씩 차이가 있기 때문에 웹브라우저에 따라 최적화된 문서를 제작하면 좋음)

# 클라이언트(날씨 클릭)->웹서버(날씨 페이지 생성(동적,jsp))->생성된 페이지를 html문서로 만들어 제공
# ->웹브라우저 해석->결과를 화면에 출력
# 출력 : 오늘의 날씨는 맑습니다. 기온은 섭씨 영하 2도입니다.
# 동적 페이지: 요청할 때마다 내용의 변화 jsp, asp, php 등
# 정적 페이지: 내용 불변 HTML, XML
# 동적 페이지는 웹 브라우저가 해석하지 못함, 웹서버가 해석하여 html 문서로 바꿔서 제공

# 웹에서 사용하는 언어
# -서버와 클라이언트 간에 데이터를 주고 받을 때 사용하는 언어(HTML)
#
# HTML: HyperText Markup Language
# -현재 페이지와 다른 페이지를 연결해주는 매개체(Hyper)로 문자(Text)를 사용한다.
# -비구조적 문서: 문서 내용을 기계가 해석하지 못함
# -정적 페이지
#
# XML: Extensible Markup Language(확장가능 마크업 언어)
# -구조화된 문서: 문서 내용의 의미를 이해할 수 있도록 작성
# -정적 페이지

# 비구조화된 문서: 웹페이지 내용에 대해 기계가 해석하지 못하는 문서, 검색어를 기반으로 검색
# EX) BTS가 서울 강남구에서 공연을 했습니다.
#
# 구조화된 문서 : 웹페이지 내용에 대해 기계가 해석 가능한 문서, 의미를 기반으로 검색
# => 검색 폭 넓음, 검색 결과에 대한 정확도 높음
#
# ex) BTS를 검색하고 싶은데 검색어가 생각 안날떄
# BTS가 서울 강남구에서 공연을 했습니다.
# <가수>                        #상위태그
#     <그룹명>BTS</그룹명>       #하위태그
#     <도시이름>서울</도시이름>    #하위태그
#     <구이름>강남구</구이름>      #하위태그
# </가수>



#====================================================================================
# # 맥 유저는 import ssl 이후 context 설정 해줘야함
# import urllib.parse as parse
# import urllib.request as request
# addr='http://www.weather.go.kr/weather/forecast/mid-term-rss3.jsp'
# values={'stdId':'109'}
# # print(parse.urlencode(values)) #stdId=109
# params=parse.urlencode(values)
# url=addr+"?"+params
# print(url)
# data=request.urlopen(url).read()
# # print(data)
# data=data.decode('utf=8')
# <?xml version="1.0" encoding="utf-8" ?> #utf-8로 이뤄짐 decode('utf-8')필요
# print(data)
import re
# 정규표현식으로는 한계 ==> BeautifulSoup패키지 이용
# 제주시의 1월 16일 자정 온도
# print(re.findall("제주.*기온|온도",data,re.DOTALL))

# 웹스크래핑: BeautifulSoup패키지=========================================================
# 파일메뉴>settings>>Project:pythonBasic>>Python Interpreter>>하단왼쪽+버튼
from bs4 import BeautifulSoup

html="""
<html>
<body>
<h1>scraping</h1>
<p>웹 페이지 분석</p>
<p>원하는 부분 출력</p>
</body>
</html>
"""
# soup=BeautifulSoup(html,"html.parser")
# #클래스
# print(soup.html.body.h1)#<h1>scraping</h1>
# print(soup.html.body.p)# <p>웹 페이지 분석</p>
# print(soup.html.body.h1.string)#scraping
# print(soup.html.body.p.string)#웹 페이지 분석
# # <p>웹 페이지 분석</p>
# # <p>원하는 부분 출력</p>
# # 모두 부모가 <body>로 동일하고 태그명이 p로 같음
# # 이런 경우 위의 방법은 위에있는 웹페이지 분석만 출력하게 됨
#
# # next_sibling: 동일태그 추출시 사용
# p1=soup.html.body.p
# p2=p1.next_sibling
# print(p1.next_sibling)# 웹페이지분석 옆 눈에 보이지 않는 줄바꿈 문자
# print(p2.next_sibling)# <p>원하는 부분 출력</p>
# print(p2.next_sibling.string)# 원하는 부분 출력
# # 한 방에
# p2=p1.next_sibling.next_sibling.string
# print(p2)
# #붕어빵객체=붕어빵기게(크림,10센티)

# html2="""
# <html>
# <body>
# <h1 id='title'>scraping</h1>
# <p id='body'>웹 페이지 분석</p>
# <p>원하는 부분 출력</p>
# </body>
# </html>
# """
# # 계층관계를 고려
# soup=BeautifulSoup(html2,'html.parser')
# print(soup.html.body.h1.string)
# print(soup.html.body.h1.string)
# print(soup.html)
# print(soup.html.body)
#
# # 계층관계를 고려하지 id 값으로 한번에 찾기
# # .find(id='')
# print(soup.find(id='title'))
# print(soup.find(id='title').string)
# print(soup.find(id='body').string)


# #헤드(불필요시 생략)>>바디(내용)
# html3="""
# <html>
# <body>
# <ul>
# <Li><a href="http://www.naver.com">naver</a></li>
# <Li><a href="http://www.daum.com">daum</a></li>
# </ul>
# </body>
# </html>
# """
# # 태그명, 속성명을 통해 원하는 데이터 추출
# # <태그명 속성명=속성값 속성명=속성값....>
# soup=BeautifulSoup(html3,"html.parser")
# # print(html3) #raw test: 문자열을 저장하고 있는 변수
# print(soup)  #문자열 ->html파서로 분석할 수 있는 객체로 변환
# # print(html3.find_all("a")) : 오류 발생, 객체가 아닌 단순 문자열이기 때문
# links=soup.find_all("a") # 리스트 구조로 저장됨
# print(soup.find_all("a"))
# for i in links:
#     href=i.attrs['href']  #i.attrs[]:리스트 내에서 속성만 출력할 때
#     na=i.string
#     print(na,"-->",href)

# #=================================================================
# html4="""
# <p><a href="aaa.html" name="kkk">aaa page</a></p>
# """
# soup=BeautifulSoup(html4,"html.parser")
# print(soup)
# print(soup.p)
#
# print(soup.p.a)  #a태그가 다양한 태그 속에 들어가 있을 때는 반드시
# print(soup.p.a.string)#상위 태그인 p.a로 작성해야함
# print(soup.a)
# print(soup.a.string)
# print(soup.a.attrs)  # 딕셔너리 구조:{'href': 'aaa.html', 'name': 'kkk'}
#
# mydict=soup.a.attrs
# print(mydict.keys())
# print(mydict.values())
# print(mydict.items())
# print('href' in mydict)
# print('hreff' in mydict)
#
# print(soup.p.find_all("a"))
# print(soup.a)
#
# for i in soup.find_all("a"):
#     href=i.attrs["href"]
#     name=i.attrs["name"]
#     print(i.string,"-->","href:",href,"name:",name)



#==================================================================
# # 웹 스크래핑
# import urllib.request as req
# url="http://www.weather.go.kr/weather/forecast/mid-term-rss3.jsp"
# res=req.urlopen(url) #서버에 정보를 요청함
# # 정상응답==> 200:ok
# # 문서를 찾지 못한경우 => 40x 에러 메시지, 주소가 잘못됐거나, 주소가 바뀐경우
# # 서버 자체 오류 ==> 50x
# print(res) #정보가 포장되어 객체에 담겨있음
# # <http.client.HTTPResponse object at 0x000002194891B190>
# soup=BeautifulSoup(res,"html.parser")
# print(type(soup))
# print(soup)
# # print("문서 제목:",soup.title.string)
# # print(soup.find("title").string)
# # print(soup.find_all("title"))
# # print(soup.find_all("title")[0].string)
# print(soup.find("wf").string)
# print(len(soup.find_all("wf"))) #534개
# # 크롬 개발자 도구를 활용하여 태그 추출하기

# .select("tag > tag") .select_one("tag > tag")
from bs4 import BeautifulSoup

html4 = """
<html><body>
<div id="lang">
    <h1>programming</h1>
    <ul class="items">
        <li>python</li>
        <li>java</li>
        <li>cpp</li>
    </ul>
</div>
</body></html>
"""
soup=BeautifulSoup(html4,"html.parser")
# print(type(soup.select("div")))
# print(soup)
# print(type(soup))
# print(soup.select("div"))
# print(soup.select("div")[0])
# print(soup[0])


# print(soup.select("div"))
# print(soup.select("div#lang")) # lang이라는 id를 갖은 div 태그만 추출
# print(soup.select("div#lang > h1"))
# # .select(): 리스트 자료구조, 여러개 모두 추출할 때
print(soup.select("div#lang > h1")[0].string)
#
# print(soup.select_one("div#lang > h1")) #문자열 자료구조
# # .select_one(): 한 개를 추출
#
# print(soup.select("div#lang > ul"))
# print(soup.select_one("div#lang > ul"))
#
# #<ul class="items"> 클래스명 설정 ul.items
# print(soup.select("div#lang > ul.items > li"))
# print(soup.select_one("div#lang > ul.items > li"))
#
mylist=soup.select("div#lang > ul.items > li")
for i in mylist:
    print(i.string)


