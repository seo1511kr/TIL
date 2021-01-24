# # id를 이용한 다양한 데이터 참조의 방법
# # 파이참 하단 Terminal 클릭후 pip 명령어로 설치하는 방법도 있음
from bs4 import BeautifulSoup
# fp=open("lang.html","r").read()
# # 파일로 저장된 html 문서를 beautifulsoap 객체로 저장하기 위해서는
# # 뒤에 read를 붙이지 않고
# fp=open("lang.html","r")
# soup=BeautifulSoup(fp,"html.parser")
# print(soup)
# print("="*50)
# print(soup.select("ul > li"))
# print(soup.select_one("ul > li"))
# print(soup.select_one("ul > li#py"))
# print(soup.select_one("li#py")) ## <li id="py">가 유일하기 때문에
# print(soup.select_one("#py"))
# print(soup.select_one("ul#language > li#py"))
# print(soup.select_one("#language > li#py"))
# print(soup.select_one("#language > #py"))
# print(soup.select_one("li[id='py']"))
# print(soup.select_one("li:nth-of-type(3)"))
# print(soup.select("li")[2].string)
# print(soup.find_all("li")[2])


# # 네이버 환율정보 스크래핑
# url="https://finance.naver.com/marketindex/?tabSel=exchange#tab_section"
# import urllib.request as req
# res=req.urlopen(url).read().decode('euc-kr') # 한글 깨질때 사용 .read().decode('euc-kr')
# print(res)
# soup=BeautifulSoup(res,'html.parser')
# # print(soup)
# exchange=soup.select("a.head.usd > div> span.value")
# print(exchange)
# exchange=soup.select_one("a.head.usd > div> span.value")
# print(exchange)
# exchange=soup.select_one("a.head.usd > div> span.value").string
# print("달러당",exchange+"원")
#
# #위의 비효율적 방법 no
# # 크롬 >> 더보기>> 도구>> 개발자도구(ctrl shift i) >>왼쪽상단>>우클릭 copy selector
# #exchangeList > li.on > a.head.usd > div > span.value
# print("달러당",soup.select("#exchangeList > li.on > a.head.usd > div > span.value")[0].string+"원")
# #oilGoldList > li.on > a.head.wti > div > span.value
# print("유가",soup.select("#oilGoldList > li.on > a.head.wti > div > span.value")[0].string+"$")
# #content > div.section_news > div > ul > li:nth-child(1) > p > a
# print("뉴스",soup.select_one("#content > div.section_news > div > ul > li:nth-child(1) > p > a"))


#wekipedia
# ko.wikisource.org
#mw-content-text > div.mw-parser-output > ul:nth-child(6) > li > b > a
#mw-content-text > div.mw-parser-output > ul:nth-child(6) > li > a
url="https://ko.wikisource.org/wiki/%EC%A0%80%EC%9E%90:%EC%9C%A4%EB%8F%99%EC%A3%BC"
import urllib.request as req
# res=req.urlopen(url)
# read=BeautifulSoup(res,"html.parser")
# print(read.select_one("#mw-content-text > div.mw-parser-output > ul:nth-child(6) > li > b > a").string)
# print(read.select_one("#mw-content-text > div.mw-parser-output > ul:nth-child(6) > li > a").string)
#
# # 시 목록 전체 스크래핑, 개발자도구 영역설정 주의하기
# # 원하는 영역을 잘 찾아서 클릭하는 것이 중요함
# #mw-content-text > div.mw-parser-output > ul:nth-child(6) > li
# # print(read.select("#mw-content-text > div.mw-parser-output > ul:nth-child(6) > li"))
# # print(read.select("#mw-content-text > div.mw-parser-output > ul:nth-child(6) > li > ul"))
# mylist=read.select("#mw-content-text > div.mw-parser-output > ul:nth-child(6) > li > ul > li")
# print(len(mylist))
# for li in mylist:
#     print(li.string)


fp=open("fruits-vegetables.html","r",encoding="utf-8")
soup=BeautifulSoup(fp,"html.parser")
# print(soup.select("div > ul"))
# print(len(soup.select("div > ul")))
# print(soup.select("div > ul")[0])
# print(soup.select("div > ul")[1])
# print(soup.select("div > ul")[1])
# print(soup.select("div > ul#fr-list"))
# print(soup.select("ul#fr-list"))
# print(soup.select("div > ul#fr-list"))
# print(soup.select("div > ul#ve-list"))
# print(soup.select("li"))
# print(soup.select("li.black")) #li태그에서 class가 블랙
# print(soup.select("li.black")[0].string)
# print(soup.select("li.black")[1].string)
# print(soup.select("#ve-list > li:nth-of-type(4)")[0].string)
# print(soup.select("li:nth-of-type(4)")[0].string)
# print(soup.select("li:nth-of-type(5)")[0].string)
# print(soup.select_one("#fr-list > li:nth-of-type(3)").string)
# print(soup.select_one("#ve-list > li:nth-of-type(5)").string)
# print(soup.select_one("#ve-list > li:nth-of-type(4)").string)
# print(soup.select("#ve-list > li[data-lo='us']"))
# print(soup.select("#ve-list > li[data-lo='us']")[1].string)


# # find와 딕셔너리 사용
# dic={"data-lo":"us"}  #{"속성명":"속성값}
# print(soup.findAll("li",dic))
# print(soup.find("li",dic))
# dic={"data-lo":"us","class":"black"}  #{"속성명":"속성값}
# print(soup.find("li",dic).string)
# print(soup.find)
# print(soup.find(id="ve-list").find("li",dic))

#
# pip install selenium
# 크롬설정 정보확인, 버전확인 버전 87.0.4280.141(공식 빌드) (64비트)
# https://sites.google.com/a/chromium.org/chromedriver/downloads
# 크롬 버전에 맞춰서 드라이브 다운로드 win32 압축해제

# c드라이브/scrap폴더생성/chromedriver이동
# chromedriver는 크롬 웹브라우저를 제어하는 프로그램
# from selenium import webdriver
# driver=webdriver.Chrome("C:/scrap/chromedriver.exe")
# # url='https://www.naver.com'
# driver.get(url)
# html=driver.page_source
# print(html)

# #멜론 실시간 인기 차트 곡 수집
# url="https://www.melon.com/chart/index.htm"
# driver.get(url)
# html=driver.page_source
# # print(html)
# soup=BeautifulSoup(html,"html.parser")
# # print(soup)
# #<tr> 테이블의 줄
# #<td> 줄 안의 칸
# songs=soup.select("tr")[1:]
# # print(len(songs))
# song=songs[2] #세번째 곡
# title=song.select('a') #첫번째 곡의 a태그 확인
# print(title)
# print('='*50)
# print(song.select('span > a'))           # 리스트로 추출
# print(song.select('span > a')[0].string) #첫번쨰 element string요소만
# # div.ellipsis.rank01 > span > a
# for song in songs:
#     print("곡 명:",song.select('div.ellipsis.rank01 > span > a')[0].string)  # 첫번쨰 element string요소만
#     print("가수명:",song.select('div.ellipsis.rank02 > span > a')[0].string)  # 첫번쨰 element string요소만
#     print("="*50)


# # 네이버 -> 강아지 -> 이미지 탭 주소
# https://search.naver.com/search.naver?where=image&sm=tab_jum&query=%EA%B0%95%EC%95%84%EC%A7%80
# # 네이버 -> 고양이 -> 이미지 탭 주소
# https://search.naver.com/search.naver?where=image&sm=tab_jum&query=%EA%B3%A0%EC%96%91%EC%9D%B4
baseUrl="https://search.naver.com/search.naver?where=image&sm=tab_jum&query="
from urllib.request import urlopen
from urllib.parse import quote_plus
word=input("검색어를 입력하세요:")
num=int(input("개수 입력 : "))
url=baseUrl+quote_plus(word)
print(url)
html=urlopen(url)
soup=BeautifulSoup(html,"html.parser")
print(soup)

# img=soup.find(class_="_ing")
# print(len(img))