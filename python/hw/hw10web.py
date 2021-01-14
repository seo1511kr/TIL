# # 1. IT기업 코딩 테스트문제
# # 주어진 문자열(공백 없이 쉼표로 구분되어 있음)을 가지고 아래 문제에 대한 프로그램을 작성하세요.
# import re
#
# names="이유덕,이재영,권종표,이재영,박민호,강상희,이재영,김지완,최승혁,이성연,박영서,박민호,전경헌,송정환,김재성,이유덕,전경헌"
# # 김씨와 이씨는 각각 몇 명 인가요?
# print("김씨:",len(re.findall("김[가-힣]+",names)))
# print(re.findall("김[가-힣]+",names))
# print("이씨:",len(re.findall("이[가-힣]+",names)))
# print(re.findall("이[가-힣]+",names))
#
# # "이재영"이란 이름이 몇 번 반복되나요?
# print(re.findall("이재영",names))
# print("답:",len(re.findall("이재영",names)))
#
# # 중복을 제거한 이름을 출력하세요.
# name_list=names.split(",")
# name_set=set(name_list)
# print(name_set)
# # 중복을 제거한 이름을 오름차순으로 정렬하여 출력하세요.
# name_list=list(name_set)
# name_list.sort()
# print(name_list)
# 2. 토지 원고 데이터
import re
from bs4 import BeautifulSoup
with open("toji.txt","r",encoding='utf-16') as f:
    line=f.readlines()
    newline=""
    for i in line:
        newline=newline+i.strip("\n")
# # 1) 저자명 추출
data=BeautifulSoup(newline,"html.parser")
# print(data.select_one("author").string)
# # 2) 제목 추출
# print(data.select("title")[1].string)
#
# # 3) 출판사명 추출
# print(data.select("publicationStmt > distributor")[0].string)

# 4) 인용부호(큰 따옴표)로 묶여있는 내용을 모두 추출하여 리스트에 저장
print(len(data.body.select("text")))
# print(data.body.select("text")[0])
text=data.select("body")
print(len(text))
text=data.select("body > text")
text_string=""
for i in text:
    for j in i.select("p"):
        text_string=text_string+j.string
# print(text_string)
# quatation=re.findall('\\"[^\\"]+',text_string,re.DOTALL)



# # 5) 토지 원고 전체에서 한글에 해당되는 내용만 추출하여 저장, 가장 많이 사용된 단어
# # 100개를 출력
# print(data)
word=re.findall("[가-힣]+",text_string)
print(len(word))
from collections import defaultdict
wordcount={}
print(wordcount)
for i in word:
    if i in list(wordcount.keys()):
        wordcount[i]=wordcount[i]+1
    else:
        wordcount[i]=1
num=list(wordcount.values())
num.sort()
num.reverse()

print({i:j for i,j in wordcount.items() if j >= num[99]})

# # 6) 각 장의 제목 저장 및 출력 #head
# print(data.body.select("head"))
# title=data.body.select("head")
#
# title_string=""
# for i in title:
#     title_string=title_string+i.string
# print(title_string)
# list_pyeon=re.findall("\d+[편][^\d]+",title_string)
# list_jang=re.findall("\d+[장][^\d]+",title_string)
# bigtitle=[]
# smalltitle=[]
# for i in list_pyeon:
#     bigtitle.append(i)
# for j in list_jang:
#     smalltitle.append(j)
# print(bigtitle)
# print(smalltitle)