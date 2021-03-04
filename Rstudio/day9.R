# 숙제 리뷰============================================
# 데이터 불러오고 구조 파악하기
# str(), summary(),head(),tail(),View(),dim()
# dplyr, rename(데이터, 변화 후=변화 전)

# do.call(함수,대상) vs lapply(대상,함수)
lst1<-list(sex='f',months=1,weight=3.5)
lst2<-list(sex='m',months=3,weight=4.5)
lst3<-list(sex='m',months=4,weight=5.5)
lst4<-list(sex='f',months=7,weight=6.5)
lst5<-list(sex='f',months=8,weight=7.5)
lst<-list(lst1,lst2,lst3,lst4,lst5)
lst

lst<-lapply(lst,as.data.frame) #출력 결과도 리스트트
lst
do.call(rbind,lst)#출력 결과 array

df<-data.frame(do.call(rbind,lst))
str(df)

do.call(rbind,df)

# prop.table(data, margin)로 비율 구하기
# sprintf('',벡터) #문자+ 연속되는 숫자 결합
mydata<-matrix(sample(100,15),ncol=3)
colnames(mydata)<-LETTERS[seq(1,3)]
mydata
rownames(mydata)<-sprintf('s-%d',seq(5))
prop.table(mydata)
sum(prop.table(mydata))

prop.table(mydata,1) #행기준
rowSums(prop.table(mydata,1))
prop.table(mydata,1) %>% rowSums

prop.table(mydata,2) #열기준
colSums(prop.table(mydata,2))

# 파이프라인 %>% 활용하기
library(dplyr)
prop.table(mydata) %>% sum

#=============================================================
# 데이터 전처리

data(iris)
iris.copy<-iris
class(as.character(iris.copy$Species))
iris.copy$Sepal.Ratio<-iris.copy$Sepal.Length/iris.copy$Sepal.Width
head(iris.copy)

#transform():변수(피쳐)를 변환 한번에 작성
iris.copy<-iris
iris.trans<-transform(iris.copy,
          Species=as.character(Species),
          SepalRatio=Sepal.Length/Sepal.Width
          )
iris.trans
str(iris.trans)

#apply family: apply(), lapply(), sapply()
#apply(data, margin, function)
#적용하고자 하는 데이터가 array 일 때 (행렬도 포함)
#결과도 array로 나옴(벡터, 행렬, 그 이상)
x<-1:20
dim(x)<-c(4,5)
x
apply(x,1,max)

x<-1:24
dim(x)<-c(4,3,2)
x
class(apply(x,1,paste,collapse=','))
apply(x,2,paste,collapse=',')
apply(x,3,paste,collapse=',') #면 단위

#행과 열이 교차하는 원소에 함수가 적용->4*3행렬
class(apply(x,c(1,2),paste,collapse=','))

#타이타닉, 4차원 데이터 형식으로 저장
str(Titanic)
apply(Titanic,1,sum)
apply(Titanic,2,sum)
apply(Titanic,3,sum)
apply(Titanic,4,sum)

#승객 등급별 생존자 통계를 알고 싶다면?
#원하는 차원을 벡터로 묶어서 넣어주기
apply(Titanic,c(1,4),sum)
apply(Titanic,c(2,4),sum)


#lapply(데이터,함수):데이터가 리스트 혹은 벡터일 때 사용
#결과유형: 항상 리스트 형식으로 반환

# sapply(데이터,함수)
# 결과 유형(벡터,행렬, 리스트)
# 벡터 또는 행렬로 단순화해서 반환, 길이가 2 이상이면서
# 서로 다른 경우에는 리스트로 출력

exams<-list(s1=c(80,70,60,50,100),
     s2=c(80,40,60,50),
     s3=c(30,70,60,50,100,90),
     s4=c(80,60,60,50,100)
     ) 
exams

sapply(exams,min)#길이가 같음: 벡터
lapply(exams,min)
sapply(exams,range)#길이가 같음, 2개 이상 값 반환: 행렬
lapply(exams,range)

sapply(exams,sort)#길이가 다름: 리스트 출력결과

str(iris)
lapply(iris, class)
sapply(iris, class)
sapply(iris, function(x){
  ifelse(is.numeric(x),mean(x),NA)
})

#mapply:적용하고자 하는 함수가 벡터연산을 지원하지 않을 때
mapply(rep,1:4,4:1)
list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))

#집단 요약
#우선 벡터를 집단별로 분할(split, unstack)
car<-mtcars
str(car)
car<-within(car,
       am<-factor(am,levels=c(0,1),labels=c('Auto','Manual'))
       )
str(car)


#split함수로 데이터 나누기
#리스트 자료구조
str(car)
g<-split(car$mpg,car$am)
str(g) 

mean(g[[1]])
mean(g[[2]])
sapply(g, mean)

#unstack(나눌 대상, 나누는 기준) 으로 나누기
u1<-data.frame(car$mpg,car$am)
u1<-unstack(u1) #리스트: 길이가 다르면 리스트

data(iris)
u2<-data.frame(iris$Sepal.Length,iris$Species)
u2<-unstack(u2)
str(u2) #dataframe: 길이가 같으면 데이터 프레임

summary(u1)
summary(u2)


#그룹 분할 작업-> 그룹별 연산 작업을 동시에 진행
#tapply(), aggregate(),by()
#tapply(vector, index(그룹기준), function) :모든 그룹에 공통함수
tapply(iris$Sepal.Length,iris$Species,mean)
tapply(iris$Sepal.Length,iris$Species,length)

#요약표 만들기
str(car)
with(car,tapply(mpg,list(cyl,am),mean))


# aggregate(벡터,집단,함수), 데이터프레임도 가능,포뮬러 사용 가능
with(car,aggregate(mpg,list(cyl,am),mean))
with(car,aggregate(mpg,list(Cylinder=cyl,Transmission=am),mean))

car[1:6]
aggregate(car[c(1:6)],list(car$cyl,car$am),mean)

#포뮬러mpg~cyl+am
aggregate(mpg~cyl+am,car,mean)

#아이리스 꽃 종류별 측정 변수별 요약
aggregate(iris[1:4],list(iris$Species),mean)


#by함수: 데이터프레임을 그룹별로 처리
by(iris, iris$Species,summary)
by(iris, iris$Species,function(x) mean(x$Sepal.Length))

rowsum(iris[-5],iris$Species)


table(car$gear)
table(car$gear,car$gear)

# xtabs함수: table함수와 동일한 기능, 포뮬러 사용
xtabs(~am,car)
xtabs(~am+gear,car)

#분할(S)-적용(A)-결합(C)작업을 수월하게 할 수 있도록 도움
#dplyr 라이브러리
#메인함수:mutate(), select(), filter(),summarize(), arrange()
str(airquality)
library(dplyr)

#filter(data,조건):조건을 만족하는 행 추출
air6<-filter(airquality,Month==6)
head(air6)
?subset
#다중조건
filter(airquality,Month==6,Temp>90)
filter(airquality,Month==6&Temp>90)
filter(airquality,Month==6|Temp>90)

subset(airquality,subset=(Month==6))
