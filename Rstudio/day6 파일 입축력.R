#코퍼스: 특정 도메인에 관련된 단어 집합(말뭉치)
# ex.)의료 코퍼스, 법률 코퍼스 등..
#언어 모델은 코퍼스로부터 생성된 모델(분류,예측)
#코퍼스의 질과 양이 중요함.
#bert:요즘 뜨는 알고리즘

# 1. 분류: 손흥민 선수가 골을 넣었습니다 -> 긍정/부정
# 2. 유가가 급등하였습니다. -> 오늘/내일 주가 예측


#정규표현식, grep()함수
#fixed 옵션으로 정규표현식 or 단순문자열 선택가능
landmasses
index<-grep(pattern = 'New',landmasses,value = T) #정규표현식
index
index<-grep(pattern = 'New',landmasses,value = T,fixed = T) #단순 문자열 검색
index


words<-c('at','bat','cat','cheap','check','cheese','chick','hat','chase')
grep('che',words,value=T)
grep('at',words,value=T)

grep('c|h',words,value=T)
grep('[ch]',words,value=T)

grep('ch|at',words,value = T)

#ch + e 또는 i + ck
grep('ch(e|i)ck',words,value = T)

# ?(0 or 1),*(0 or 1이상),+(1이상) 활용
words<-c(words,'chaenomeles','chasse','chae')
grep('chas?e',words,value = T)
grep('chas*e',words,value = T)
grep('chas+e',words,value = T)


#chase,cheese
grep('ch(a|(ee))se',words,value = T)
grep('ch(a|e)+se',words,value = T)
grep('ch(a*|e*)+se',words,value = T)
grep('ch(a+|e+)+se',words,value = T)

# ^(시작)와 $(끝) 활용
grep('^c',words,value = T)
grep('t$',words,value = T)

#c로 시작 t로 끝남
#메타문자 . => 모든 문자 의미
grep('^c.*t$',words,value = T)
grep('^(at)|^[hc]',words,value = T)

# at 앞에 c or h or 아무것도 없는 경우
grep('^[hc]?at',words,value = T)

# [[:alnum:]], \\w 알파벳, 숫자
# [[:alpha:]] 알파벳
# [[:digit:]] 숫자
# [[:punct:]] 문장부호, 특수문자
# [[:space:]] 공백
words2<-c("12 Dec", "OK", "http://", "<TITLE>Time?</TITLE>","12345", "Hi there")
grep('[[:alnum:]]',words2,value = T)
grep('\\w',words2,value = T)

grep('[[:alpha:]]',words2,value = T)

grep('[[:digit:]]',words2,value = T)
grep('\\d',words2,value = T)


grep('[[:punct:]]',words2,value = T)

grep('[[:space:]]',words2,value = T)
grep('\\s',words2,value = T)



#날짜와 시간을 다루는 함수 Sys.Date() ,  Sys.time()
Sys.Date()
date()
Sys.time()

# 데이터 클래스를 Date로
class(Sys.Date())
class("2021-02-26")
class(as.Date("2021-02-26")) 

#기본형식:연도, 월, 일 format필요없음
as.Date("2021-02-26") 
# 기본형식이 아닌경우 format 옵션 필요
as.Date("02-26-2021", format='%m-%d-%y') 
as.Date("02/26/2021", format='%m/%d/%y')

# format(date,format='')으로 날짜 데이터 원하는 방식으로 표현
d<-as.Date('2021-02-26')
class(d)
format(d,format='%m/%d/%y')
class(format(d,format='%m/%d/%y'))

today<-Sys.Date()
today
format(today,format='%Y/%m/%d %A')

weekdays(as.Date('2021-02-27'))
weekdays(as.Date('2021/02/27'))

#날짜 데이터 생성(벡터연산으로)
d<-as.Date('2021/02/27')
d-1
d+1:10

weekdays(d)
weekdays(d+1:10)

#날짜 데이터 생성 seq()함수 활용
s<-as.Date('2021-02-26')
e<-as.Date('2021-04-1')
seq(from=s,to=e,by=1)

seq(s,by=1,length.out=10)
seq(s,by=7,length.out=9)
seq(s,by='7 days',length.out=9)
seq(s,by='week',length.out=9)
seq(s,by='month',length.out=9)
seq(s,by='2 months',length.out=9)
seq(s,by='year',length.out=9)
seq(s,by='2 years',length.out=9)

#2월은 별도의 처리가 필요함
seq(from=as.Date('2021-01-30'),by='month',length.out=5)

#month(), quarters() 함수
s<-as.Date('2021-02-26')
qrt<-seq(from=s,by='3 months', length.out=4)
qrt
months(qrt)
quarters(qrt)

#edit(),fix(product)을 활용한 간단한 데이터 생성
product<-data.frame()
product
product<-edit(product)

fix(product)
product

str(product)

#write.csv
write.csv(product,file='myproduct.csv')
product
#앞에 인덱스 지우기
write.csv(product,file='myproduct.csv',row.names=F)
product

#csv 파일에서 ctrl c로 복사한 데이터 가져오기
#[1] "id\tname\tprice"       "A001\tmouse\t10000"   
#[3] "A002\tKeyboard\t20000" "A003\tUSB\t30000" 
#처럼 출력됨 => read.table로 해결
p<-readClipboard()
p 

read.table(file='clipboard', sep='\t',header=TRUE)

read.csv('data/product.csv') #hearder=T가 디폴트값
read.csv('data/product-with-no-header.csv')

p<-read.csv('data/product.csv')
str(p)
p<-read.csv('data/product.csv',stringsAsFactors = T)
str(p)
#as.is=T는 stringAsFactor=F랑 똑같음
p<-read.csv('data/product.csv', as.is = T)
str(p)


# read.table(), txt파일
# read.table은 디폴트가 헤더가 F
p<-read.table('data/product.txt')
p
p<-read.table('data/product.txt',header=T)
p
str(p)

#연결자 설정하기 sep=''옵션
read.table('data/product-colon.txt',sep=':',header=T)


#누락된 데이터 NA로 출략 : na.strings=''옵션
read.table('data/product-missing.txt',header=T)

read.table('data/product-missing.txt',header=T,na.strings='.')
read.table('data/product-missing.txt',header=T,na.strings='누락')
read.table('data/product-missing.txt',header=T,na.strings=c('누락','몰라'))

# 문자열에서는 <NA> 꺽쇠로 나옴, 문자열 NA와 구분하기 위해

# 주석문 무시
read.table('data/product-comment.txt',header=T)

# csv를 read.table로 불러올 때 sep=','사용해야함
read.table('data/brand-eval.csv',header=T)
read.table('data/brand-eval.csv',header=T,sep=',')

brand.eval<-read.table('data/brand-eval.csv',header=T,sep=',',row.names = 'id')
brand.eval #after.service처럼 공백이 .으로 원래 바뀜
str(brand.eval)

#colClasses=c('') 활용하여 컬럼 타입 지정해주기
brand.eval<-read.table('data/brand-eval.csv',header=T,sep=',',row.names = 'id',colClasses = c('character','character','numeric','numeric','numeric'))
brand.eval

#xlsx(엑셀)파일 열기
install.packages('openxlsx')
library(openxlsx)
read.xlsx('data/product.xlsx',sheet=1)

# 온라인으로 데이터 불러오기
# https://archive.ics.uci.edu/ml/datasets.php(캘리포니아 오픈 데이터)

#1.url로 데이터 바로 불러오기
#데이터 url링크주소 복사 후
url<-"https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
iris.uci<-read.csv(url,header=F)
iris.uci

#2.local에 저장하기
download.file(url=url,destfile = 'data/myIris.csv')

#zip파일 압축해제, unzip(file,저장이름)함수
url<-"http://seanlahman.com/files/database/baseballdatabank-master_2016-03-02.zip"
local.copy<-'baseball.zip'
download.file(url,local.copy)
bs<-read.csv(unzip(zipfile=local.copy,'baseballdatabank-master/core/Salaries.csv'))
head(bs)
