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
# 맥 유저는 import ssl 이후 context 설정 해줘야함
import urllib.parse as parse
import urllib.request as request
addr='http://www.weather.go.kr/weather/forecast/mid-term-rss3.jsp'
values={'stdId':'109'}
# print(parse.urlencode(values)) #stdId=109
params=parse.urlencode(values)
url=addr+"?"+params
print(url)
data=request.urlopen(url).read()
# print(data)
data=data.decode('utf=8')
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
<html><body>
<h1>스크래핑</h1>
<p>웹 페이지 분석</p>
<p>원하는 부분 추출</p>
</body></html>
"""
