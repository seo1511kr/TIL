# # 1. 다나와 무선청소기(페이지가 계속 변동해서 오류)
# ==> 로딩이 되기전에 긁어와서 오류가 생기는것
# 강제로 시간을 지연시키는 코드를 추가해줘야함



# # url = "http://search.danawa.com/dsearch.php?query=무선청소기&tab=main"
# from bs4 import BeautifulSoup
# from selenium import webdriver
# driver=webdriver.Chrome('c:/scrap/chromedriver.exe')
# url="http://search.danawa.com/dsearch.php?query=무선청소기&tab=main"
# driver.get(url)
#
# html = driver.page_source
# soup = BeautifulSoup(html,'html.parser')
#
# prod_item=soup.select("li.prod_item")
# print(len(prod_item))
# name_list=[]
# for i in range(len(prod_item)):
#     info=prod_item[i].select("div.prod_info")
#     name=info[0].select("a")[0].string
#     name_list.append(name)
# print(name_list)
#
# # 2) 인치
#
# spec_list=list(range(0,len(prod_item)))
# for i in range(len(prod_item)):
#     info=prod_item[i].select("div.prod_info")
#     spec=info[0].select("div.spec_list > a")
#     spec_list[i]=[]
#     for j in spec:
#         spec_list[i].append(j.string)
# print(spec_list)
#
# # 3) 등록월====오류====================================
# Date_list=list(range(0,len(prod_item)))
# for i in range(len(prod_item)):
#     Date=prod_item[i].select("div.prod_info > div.prod_sub_info > div > dl.meta_item.mt_date > dd")
#     print(Date[0].string)
# # 4) 평점, 평점을 매긴 건수
# point_list=[]
# for i in range(len(prod_item)):
#     point=prod_item[i].select("div.prod_info > div.prod_sub_info > div > dl.meta_item.mt_comment > dd > div.cnt_star > div.point_num > strong")
#     print(point)
#     point_list.append(point.string)
# print(point_list)
# evalnum_list=[]
# for i in range(len(prod_item)):
#     evalnum=prod_item[i].select("div.prod_info > div.prod_sub_info > div > dl.meta_item.mt_comment > dd > div.cnt_opinion > a > strong")
#     evalnum_list.append(evalnum.string)
# print(evalnum_list)===============================================
#

# 2. 1번 문제를 다 해결했다면,
# 보배드림으로 시작
from bs4 import BeautifulSoup
from selenium import webdriver
import re

driver=webdriver.Chrome("c:/scrap/chromedriver.exe")
for j in range(1,10000):
    url="https://www.bobaedream.co.kr/mycar/mycar_list.php?gubun=K&page={0}&order=S11&view_size=20".format(j)
    driver.get(url)
    html=driver.page_source
    soup=BeautifulSoup(html,"html.parser")
    km=soup.select("div[class='mode-cell km'] > span")
    km_list=[]
    for i in km:
        a=re.findall("\d+[가-힣]+[a-z]+",str(i))
        km_list.append(a)
    old=soup.select("div[class='mode-cell year'] > span")
    old_list=[]
    for i in old:
        a=":".join(re.findall("\d+[/]*\d+[가-힣]*",str(i)))
        old_list.append(a)
    fuel=soup.select("div[class='mode-cell fuel'] > span")
    fuel_list=[]
    for i in fuel:
        a=i.string
        fuel_list.append(a)
    price=soup.select("div[class='mode-cell price'] > b > em")
    price_list=[]
    for i in price:
        a=i.string+"만원"
        price_list.append(a)
    info=list(zip(km_list,old_list,fuel_list,price_list))
    dic=dict(zip([str(i+1)+"번째 품목" for i in range(len(info))],info))
    print(dic)







# # 3. 보배드림 -> 차량정보추출
# # https://www.bobaedream.co.kr/mycar/mycar_list.php?gubun=K
# url="https://www.bobaedream.co.kr/mycar/mycar_list.php?gubun=K"
#
# driver.get(url)
# html=driver.page_source
# soup=BeautifulSoup(html,"html.parser")
#
# km=soup.select("div[class='mode-cell km'] > span")
# km_list=[]
# for i in km:
#     a=re.findall("\d+[가-힣]+[a-z]+",str(i))
#     km_list.append(a)
# print(km_list)
# # 1)연식
# old=soup.select("div[class='mode-cell year'] > span")
# old_list=[]
# for i in old:
#     a=":".join(re.findall("\d+[/]*\d+[가-힣]*",str(i)))
#     print(a)
#     print(type(a))
#     old_list.append(a)
# print(old_list)
# # 2)연료
# fuel=soup.select("div[class='mode-cell fuel'] > span")
# fuel_list=[]
# for i in fuel:
#     a=i.string
#     fuel_list.append(a)
# print(fuel_list)
# # 3)가격
# price=soup.select("div[class='mode-cell price'] > b > em")
# price_list=[]
# for i in price:
#     a=i.string+"만원"
#     price_list.append(a)
# print(price_list)
#     # print("연식:",re.findall("\d+[/]*\d+[가-힣]*",str(i)))
#
# info=list(zip(km_list,old_list,fuel_list,price_list))
# print(info)
# dic=dict(zip([str(i+1)+"번째 품목" for i in range(len(info))],info))
# print(dic)
#
# # 4. https://www.rottentomatoes.com/ => popular streaming movies
# # 순위와 함께 영화 제목 추출
#
# from bs4 import BeautifulSoup
# import urllib.request as req
# import re
# from selenium import webdriver
# driver=webdriver.Chrome('c:/scrap/chromedriver.exe')
# url="https://www.rottentomatoes.com/"
# driver.get(url)
# html=driver.page_source
# soup=BeautifulSoup(html,"html.parser")
# # print(soup)
# print(len(soup.select("#media-lists > div.layout.media-lists > div > div.js-scores-lists-wrapper.ordered-layout__scores-wrap > div:nth-child(1) > section > text-list > ul > li")))
# len=len(soup.select("#media-lists > div.layout.media-lists > div > div.js-scores-lists-wrapper.ordered-layout__scores-wrap > div:nth-child(1) > section > text-list > ul > li"))
#
# title_list=[]
# score_list=[]
# for i in range(1,len+1):
#     title="순위: %d."%i+ soup.select("#media-lists > div.layout.media-lists > div > div.js-scores-lists-wrapper.ordered-layout__scores-wrap > div:nth-child(1) > section > text-list > ul > li:nth-child(%d) > a:nth-child(1) > span"%i)[0].string
#     title_list.append(title)
#     score=re.findall("\d+%",soup.select("#media-lists > div.layout.media-lists > div > div.js-scores-lists-wrapper.ordered-layout__scores-wrap > div:nth-child(1) > section > text-list > ul > li:nth-child(%d) > a.dynamic-text-list__tomatometer-group > span.b--medium"%i)[0].string)[0]
#     score_list.append(score)
# movie_dic=dict(zip(title_list,score_list))
print(movie_dic)


# 질문:
# 활성형 홈페이지? 자꾸 변동해서 그런지 다나와에서 scrapping 할 때는
# 시도할 때마다 결과가 변동해서 자꾸 error가 남
# 어떻게 해결할까?