#1
with open("test.txt","w") as f:
    f.write("big data")
with open("test.txt","r") as r:
    l=r.read()
    print(l)


#2
a='''
park 010-9999-9988
kim 010-9909-7789
lee 010-8789-7768
'''
import re
pat=re.compile("(\d{3}[-]\d{4})[-](\d{4})")
print(pat.sub("\g<1>-****",a))



#3.
<meta charset="UTF-8">

#4.
from selenium import webdriver
from bs4 import BeautifulSoup
import re
import time
driver=webdriver.Chrome("c:/scrap/chromedriver.exe")
url="https://news.naver.com/"
driver.get(url)
driver.implicitly_wait(10)
driver.find_element_by_css_selector("#lnb > ul > li:nth-child(4) > a > span").click()
driver.implicitly_wait(10)
driver.find_element_by_css_selector("#main_content > div > div._persist > div:nth-child(1) > div:nth-child(1) > div.cluster_body > ul > li:nth-child(1) > div.cluster_text > a").click()

driver.implicitly_wait(10)
html=driver.page_source
soup=BeautifulSoup(html,"html.parser")
title=soup.select_one("#articleTitle").text
print("제목",title)
# body=soup.select_one("#articleBody > strong")
body=soup.select_one("#articleBodyContents").text
for i in body.split(". "):
    print(i)


