# ifelse 중첩으로 2개 이상의 집단 표현하기
# ifelse(조건,참,ifelse(조건,참,거짓))

# graphics패키지: 고수준 그래픽 함수, 저수준 그래픽 함수
# 고수준 그래픽 함수: 완전한 하나의 그래프 생성
# plot, boxplot, hist, crve,...
# 저수준 그래픽 함수: 독자적으로 그래프 생성 불가능
# 완성된 그래프에 요소를 첨가하는 역할
# points(),lines(),abline(),text(),polygon(),...

str(faithful)
#분출시간과 대기시간의 양의 상관관계가 보임
plot(faithful)

#클러스터:집단
#Quiz1.
library(dplyr)
# eruptions.long<-분출시간이 3분 초과한 데이터 저장
eruptions.long<-faithful %>% 
  filter(eruptions>3)

plot(faithful)
#point(,col,pch)
points(eruptions.long,col='red',pch=19)

#그래프 창 닫기
dev.off()
# plot닫은 다음에 실행하면 error
# points(eruptions.long,col='red',pch=19)

#선형회귀모델 lm
#연속형 변수 예측
#lm(종속~독립,data)
faithful.lm<-lm(waiting~eruptions,data=faithful)
faithful.lm 
# Coefficients:
#   (Intercept)절편 eruptions(기울기)
#      33.47           10.73 

#fitted:회귀모델에서 예측값 추출
plot(faithful)
points(eruptions.long,col='red',pch=19)
faithful.lm<-lm(waiting~eruptions,data=faithful)
fitted(faithful.lm)
lines(x=faithful$eruptions,y=fitted(faithful.lm),col='blue')
#데이터가 방대해지면 행렬 연산으로 회귀선을 찾을 수 없음

#abline으로 선 그리기
abline(v=3,col='purple')
abline(h=mean(faithful$waiting),col='green')

#회귀선 표현하기
#1.abline(a=절편,b=기울기)
abline(a=coef(faithful.lm)[1],b=coef(faithful.lm)[2],col='blue',)
#2.abline(reg=model)
abline(reg=faithful.lm,col='blue')

#x:벡터, 데이터프레임, 팩터, 시계열, 테이블, 선형회귀모델...

#1. 벡터
cars
str(cars)
cars$speed
cars$dist
plot(cars$speed,cars$dist)
plot(cars)

str(ToothGrowth)
?ToothGrowth
#2. 팩터
#plot(x=factor,y=), 첫번째 인수가 팩터: boxplot
with(ToothGrowth,plot(supp,len))
plot(ToothGrowth)

#boxplot
# min:Q1-1.5IQR > outlier
# max:Q3+1.5IQR < outlier
#IQR: Q3-Q1

#변수2개 이상일 경우 산점도 행렬
#선형 관계가 강력한 것을 찾아내기 좋음
plot(iris[,1:4])

#3. 시계열
nhtemp
str(nhtemp)
plot(nhtemp)

#4. 테이플
# 모자이크 도표
UCBAdmissions
str(UCBAdmissions)
plot(UCBAdmissions)

#도표 저장
#gui 활용 or 명령어
?png

png('myplot.png',width=800,height=400)
plot(faithful)


# 창 따로 띄어서 확인, 저장
windows()
plot(faithful)
savePlot('imgplot.pdf',type='pdf')

windows()
png('imgplot2.png', width=600, height=400)
plot(faithful)
dev.off() #창을 꼭 닫아줘야 실행됨


#KNN알고리즘
#분류나 회귀에 사용되는 비모스 방식
#k개의 최근접 이웃 사이에서 가장 공통적인
#항목에 해당되는 것을 값으로 예측
#k는 보통 홀수로 함=> 최빈값이 설정될 수 있도록
#표준화, 정규화, k값 설정, 변수 지정 등 설계를 잘 해야함.
# 사례: 컴퓨터 비전, 추천시스템(영화, 음악)
# 장점:쉽고, 훈련이 빠르고, 분포 가정이 필요가 없음
# 단점: k값 지정 기준이 추상적, 분류 작업이 느리다, 결과 설명이 불가능.
# https://archive.ics.uci.edu/ml/datasets.php 유방암 데이터
# 암 분류기 KNN
wbcd<-read.csv('data/wisc_bc_data.csv')
str(wbcd)
wbcd<-wbcd[-1] #id 열 제외
table(wbcd$diagnosis)
wbcd$diagnosis<-factor(wbcd$diagnosis,levels=c('B','M'),labels =c('Benign','Malignant') )
str(wbcd)
round(prop.table(table(wbcd$diagnosis))*100,1)

#기술통계를 활용하기
summary(wbcd['radius_mean'])
summary(wbcd[c('radius_mean','area_mean','smoothness_mean')])

#정규화===================================================
normalize<-function(x){
  return((x-min(x))/(max(x)-min(x)))
}
str(wbcd)
wbcd_n<-as.data.frame(sapply(wbcd[2:31],normalize))

nrow(wbcd)*0.8
nrow(wbcd_n)
sample_idx<-sample(1:nrow(wbcd),nrow(wbcd)*0.2)

wbcd_train<-wbcd_n[-sample_idx,]
wbcd_test<-wbcd_n[sample_idx,]
str(wbcd_train)
str(wbcd_test)

wbcd_train_labels<-wbcd[-sample_idx,1]
wbcd_test_labels<-wbcd[sample_idx,1]

#모델 생성
library(class)
wbcd_test_pred<-knn(train=wbcd_train,test=wbcd_test,
    cl=wbcd_train_labels, k=21)

wbcd_test_pred
wbcd_test_labels
#crowss table
# TP,TN,FP,FN
install.packages("gmodels")
library(gmodels)
CrossTable(x=wbcd_test_labels, y=wbcd_test_pred)


# 표준화=============================================
str(scale(wbcd[-1]))
wbcd_z<-as.data.frame(scale(wbcd[-1]))
summary(wbcd_z$area_mean)

sample_idx<-sample(1:nrow(wbcd),nrow(wbcd)*0.2)
wbcd_train<-wbcd_z[-sample_idx,]
wbcd_test<-wbcd_z[sample_idx,]

wbcd_train_labels<-wbcd[-sample_idx,1]
wbcd_test_labels<-wbcd[sample_idx,1]

wbcd_test_pred<-knn(train=wbcd_train,test=wbcd_test,
                    cl=wbcd_train_labels,k=21)
CrossTable(x=wbcd_test_labels,y=wbcd_test_pred)


#가장 score가 높은 k값 찾기
scores<-c()
for(i in seq(1,25,2)){
wbcd_test_pred<-knn(train=wbcd_train,test=wbcd_test,cl=wbcd_train_labels,
      k=i)
scores=c(scores,sum(wbcd_test_labels==wbcd_test_pred)/length(wbcd_test_pred))
}
scores
seq(1,25,2)[which.max(scores)]
