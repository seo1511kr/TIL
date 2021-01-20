from selenium import webdriver
from bs4 import BeautifulSoup
driver=webdriver.Chrome('c:/scrap/chromedriver.exe')
url="http://search.danawa.com/dsearch.php?query=무선청소기&tab=main"
driver.implicitly_wait(3) #웹 페이지의 모든 요소(이미지, 텍스트 등)을 모두 읽을때까지 3초 대기
driver.get(url)
print(driver.current_url)
html=driver.page_source
soup=BeautifulSoup(html,"html.parser")
prod_items=soup.select("li.prod_item")
print(prod_items[1])
print("="*50)


# from selenium import webdriver
# driver=webdriver.Chrome("c:/scrap/chromedriver.exe") #드라이버를 로드
# url="http://search.danawa.com/dsearch.php?query=무선청소기&tab=main"
# #url로 접속
# driver.get(url) #해당 url을 브라우저에 띄움
#
# #print(driver.current_url)
# #driver.implicitly_wait(3) #웹 페이지의 모든 요소(이미지, 텍스트 등)를 모두 읽을때까지 3초 대기
#
# from bs4 import BeautifulSoup
# html=driver.page_source
# soup=BeautifulSoup(html, "html.parser")
#
# prod_items=soup.select("li.prod_item")
# print(prod_items[1])
# print("="*50)
# print(len(prod_items))

