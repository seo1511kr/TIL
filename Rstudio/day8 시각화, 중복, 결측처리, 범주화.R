df<-read.csv('data/train.csv',na.strings = "")
str(df)
View(df)


# 기술통계 패키지
install.packages('psych')
library(psych)

# 결측맵 함수가 포함된 패키지
install.packages('Amelia')
library(Amelia)
missmap(df,col=c('red','grey'))

#feature(열)선택하기 전에 상관분석을 우선적으로 실시
library(dplyr)
df<-select(df,Survived,Pclass,Age,Sex,Age,SibSp,Parch)
str(df)
missmap(df,col=c('red','grey'))

#na 제거
df<-na.omit(df)
missmap(df,col=c('red','grey'))


#범주형 factor화, order가 있냐 없냐?
df$Survived<-factor(df$Survived)
df$Pclass<-factor(df$Pclass,order=T, levels=c(3,2,1))
str(df)


#시각화 패키지
install.packages('ggplot2')
library(ggplot2)
 install.packages('GGally')
library(GGally) 

 df<-read.csv('data/train.csv', na.string='')
 ggcorr(df) #상관관계
 ggcorr(df,nbreaks=6) #구간 나누기
 ggcorr(df,nbreaks=6, label=T, label_size = 3) # 칸마다 수치 표시
 ggcorr(df,nbreaks=6, label=T, label_size = 3,color='grey50')
 
 
#match함수를 이용한 데이터셋 결합
 a=c(1,2,3,4,5)
 b=c(2,5,7,8,9)
 match(a,b) #[1] NA  1 NA NA  2
 match(a,b,nomatch = 0)# [1] 0 1 0 0 2

 
str(mtcars)  
car<-mtcars
row.names(car)
car$name<-row.names(car)
head(car)
row.names(car)<-NULL
head(car)

#145마력이 넘는 힘 쏀 자동차 모델로만 데이터프레임을 구성
highhp.car <- car[car$hp>145,]
highhp.car
#car에서 무게가 3200파운드 미만
light.car<-car[car$wt<3.2,]
light.car

#match로 교집합 찾기
car[car$wt<3.2 & car$hp>145 ,]
index<-match(highhp.car$name,light.car$name) #특정 컬럼 지정하기
index<-index[!is.na(index)]

light.car[index,]
light.car[na.omit(index),]

#%in% 연산자(: T/F 출력)로 교집합 찾기
vec<-10:1
vec
7 %in% vec
c(20,15,11,9,8,3,1,0)%in% vec
!is.na(match(c(20,15,11,9,8,3,1,0),vec))

light.car[highhp.car$name %in% light.car$name,]

#subset
# $, [[]], [] 차이 구분하기
str(mtcars)
mtcars$mpg#벡터
mtcars[[1]]#벡터
mtcars[1] #데이터프레임
mtcars[c(1,4)]
mtcars[-c(1,4)] #-연산 활용
mtcars[-c(1:9)]
#주의:음수 양수 동시 활용은 불가능
mtcars[c(-1,2)] 
mtcars[c('mpg','hp')]
#주의: 이름 인덱싱에는 -연산 안먹음
mtcars[-c('mpg','hp')]

#ex. iris
data(iris)
str(iris)
# 1~4번 열 추출
iris[1:4]
iris[c(1,2,3,4)]
iris[-5]

iris[,c('Sepal.Length','Sepal.Width')]
class(iris[,'Sepal.Length']) #벡터

class(iris['Sepal.Length']) #데이터프레임
class(iris[,'Sepal.Length',drop=F])#데이터프레임

iris[1:5]
iris[1:5,c('Sepal.Length')]
iris[1:5,1:3]

#quiz2: Sepal.Lengtgh가 7을 초과한 데이터 전체를 추출
iris[iris$Sepal.Length>7,]

#subset(data,subset=조건,select=타겟 열)
subset(iris,
       subset=(Sepal.Length>7),
       select=c('Sepal.Length','Sepal.Width')
       )


#분석과정
#데이터 무작위 표본 추출
#데이터 -> 모델 -> 예측/분류
# 모델링 과정?
#   1) 데이터를 훈련용(70%)/ 테스트용(30%)으로 분할
#   2) 오직 훈련용 데이터만으로 모델(예측/분류)을 생성
#   3) 과적합(오버피팅, overfitting): 훈련 데이터로 평가 결과
#   4) 테스트 데이터 평가
#   5) 원인: 데이터가 부족-> 보충, 변수가 너무 많음(고차원)-> 차원축소(저차원)

#sample(data,size,replace(복원추출),prob)
#size는 디폴트가 전체 데이터 개수
#replace는 디폴트가 비복원추출
sample(iris$Sepal.Length,2)
sample(1:10,5,replace=F)
sample(1:10) 

set.seed(20210303)
sample(1:10)# 훈련데이터라고 가정 -> 모델 -> 평가(3,8,10)
# 평가를 했을 때 이전 모델과의 비교를 위해서는
# 매번 테스트마다 평가 데이터가 동일해야함
# set.seed()로 동일한 난수를 발생시켜야 함

set.seed(1)
sample(1:10,5,replace=T)

#sample , 데이터프레임
sample(iris,3) #무작위로 열 3개

set.seed(1) #열에서 sample 뽑기
index<-sample(1:nrow(iris),5)
iris[index,]

#중복 데이터 제거하기
#1. duplicated를 활용한 중복값 제거
duplicated(c(1,2,3,1,1,4,3))

id<-c('a001','a002','a003')
name<-c('mouse','keyboard','usb')
price<-c(3000,9000,5000)
product<-data.frame(id,name,price)
product
product<-rbind(product,c('a001','mouse',3000))
product[!duplicated(product),]

#2. duplicated, which를 활용한 중복값 제거
product[-which(duplicated(product)),] #TRUE에 해당하는 인덱스 추출

#3. unique() 함수 이용하기, 중복원소 파악 x
unique(product)

#결측값 제거하기or 결측값 예측하기(knn 등)
#1.na.omit
na.omit(airquality)
#2. complete.cases() 결측값 제거, 행단위 T/F
str(airquality)
complete.cases(airquality)#해당 행에 하나 이상의 na
str(airquality[complete.cases(airquality),])

#cut함수: 데이터를 구간에 따라 그룹별로 나눔
#수치데이터의 범주화
?cut
#cut(x=데이터, breaks=구간)
#개구간()초과미만, 폐구간[]이상이하
iris.cut1<-cut(x=iris$Sepal.Width,breaks=c(0,1,2,3,4,5)) #(,]
cut(x=iris$Sepal.Width,breaks=c(0,1,2,3,4,5),right=F)#[,)
#table, summary와 함께 사용
table(iris.cut1)
summary(iris.cut1)

#labels 옵션으로 이름 붙이기
iris.cut2<-cut(x=iris$Sepal.Width,breaks=c(0,1,2,3,4,5),
               labels=c('Smaller','Small','Medium','Big','Bigger'))
table(iris.cut2)

#구간을 자동으로 나누기
cut(x=iris$Sepal.Width,breaks=5)
table(cut(x=iris$Sepal.Width,breaks=5))
#include.lowest 옵션 최솟값 포함 여부
cut(x=iris$Sepal.Width,breaks=5,include.lowest=T)
cut(x=iris$Sepal.Width,breaks=5,include.lowest=F)


iris.cut3<-cut(x=iris$Sepal.Width,breaks=5,
               labels=c('Smaller','Small','Medium','Big','Bigger'),
               include.lowest = T)
iris.cut3

#정렬 sort,order
x<-c(3,7,5,1,2,5)
sort(x)
sort(x,decreasing=T)
length(x)<-7
x
# na.last
sort(x) #na포함 x
sort(x,decreasing=T,na.last = T)
sort(x,decreasing=T,na.last = F)

# dataframe 정렬시 order 자주 사용
y<-c(11,22,33,55,44)
order(y)
y[order(y)]


z<-c('ss','bb','ii','aa','pp')
df<-data.frame(y,z)
df
df[order(df$y),]
df[order(df$y,decreasing = T),]

w<-c('c','c','n','n','n')
df<-data.frame(y,z,w)
df
df[order(df$w),]
df[order(df$w,df$y),] #1차기준 2차기준

#xtfrm():동일하지 않은 정렬 방법을 적용
df$w
xtfrm(df$w)
# w열 기준 내림차순, y열 기준 오름차순
index<-order(-xtfrm(df$y),df$y)
df[index,]

#quiz3
index<-order(-xtfrm(iris$Species),iris$Sepal.Length)
iris[index,]

#패키지 안의 데이터 셋 가져오기
ggplot2::midwest
