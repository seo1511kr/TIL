# 코사인 유사도:
# 유클리디안 거리:
# tf-idf: 문서에 최적화된 코사인 유사도
# (단어의 희소성 대비 사용 횟수를 통해 가중치를 부여)

#========================================================
#회귀분석
1. 분산, 공분산, 상관계수


mydata<-read.csv('data/examscore.csv')
hist(mydata$midterm,
     xlab='중간고사 성적',
     ylab='빈도',
     main='중간고사 성적분포')
abline(v=mean(mydata$midterm),col='red')
abline(v=median(mydata$midterm),col='blue')


#100점 값을 2개 부여하니 median이 mean 왼쪽으로 감
mydata$midterm[20]<-100
mydata$midterm[22]<-100

hist(mydata$midterm,
     xlab='중간고사 성적',
     ylab='빈도',
     main='중간고사 성적분포')
abline(v=mean(mydata$midterm),col='red')
abline(v=median(mydata$midterm),col='blue')


quantile(mydata$midterm)

#1. 분산: 데이터가 퍼져있는 정도
#예측값의 분산이 작을수록 좋은 예측치
#모분산과 표본분산, n으로 나누냐, n-1로 나누냐(자유도의 차이)

#표본평균
set.seed(1234)
x<-sample(1:10,6)
x

xBar<-mean(x)

#표본분산
sampleVar<-sum((x-xBar)^2)/(length(x)-1)
var(x)

sqrt(sampleVar)
sd(x)


#최빈수
x<-sample(1:100,40,replace = T)
names(sort(-table(x))[1])


#변수간 상관관계
# 공분산:(부호만 중요함)
# 시각화 한 후 각 변수의 평균값과 관측값이 이루는 직사각형의
# 면적을 구하기, 문제점: 단위에 따라 값의 크기 차이

#상관관계: 표준화된 공분산
#각 변수를 표준화 한 후 공분산 구하기
mydata<-read.csv('data/examscore.csv')
mycorr<-cor(mydata$midterm,mydata$final)
mycorr
n<-length(mydata$midterm)
xBar<-mean(mydata$midterm)
yBar<-mean(mydata$final)
sx<-sd(mydata$midterm)
sy<-sd(mydata$final)
x<-mydata$midterm
y<-mydata$final
zx<-(x-xBar)/sx
zy<-(y-yBar)/sy
zxy<-sum(zx*zy)/(n-1)
zxy



dev.off()
plot(x,y,xlab = '중간',ylab='기말',
     main='시험점수')
title(sub=paste('상관계수:',round(mycorr,4)),adj=1)
abline(v=xBar,h=yBar)


#색 설정
zx
zy
sign(zx*zy) #양수=1, 음수=-1
as.factor(sign(zx*zy))
c('blue','red')[as.factor(sign(zx*zy))]

#크기 설정
abs(zx*zy)



dev.off()
plot(zx,zy,xlab = '중간',ylab='기말',
     main='시험점수',
     col=c('blue','red')[as.factor(sign(zx*zy))],
     cex=abs(zx*zy)+1
)
abline(v=0,h=0,col='red')
abline(lm(zy~zx))

install.packages('datarium')
library(datarium)
?marketing
# data(marketing)
# res.lm <- lm(sales ~ youtube*facebook, data = marketing)
# summary(res.lm)
data("marketing")
summary(marketing)


dev.off()
plot(zx,zy,xlab = '중간',ylab='기말',
     main='시험점수',
     col=c('blue','red')[as.factor(sign(zx*zy))],
     cex=abs(zx*zy)+1
)
abline(1,2) #y=2x+1

#회귀직선 그리기(rss:잔차제곱의 합 최소화하는 직선)
rss<-function(data,lineinfo){
  x<-data[,1]
  y<-data[,2]
  intercept<-lineinfo[1]
  slope<-lineinfo[2]
  predict<-intercept+slope*x
  res<-sum((y-predict)^2)
  return(res)
}
str(mydata)
rss(mydata[3:4],c(5,1))


#최적화 함수: optim(par = )
dev.off()
plot(x,y,xlab = '중간',ylab='기말',
     main='시험점수')
abline(5,1)
abline(-10,1.5,col='red')
result<-optim(par=c(1,1),fn=rss,data=mydata[3:4])
result$par  #[1] 13.8833436  0.8967623
result$value #[1] 5712.789
abline(result$par,col='blue')

#
lm(final~midterm, mydata)


#
#기울기= 상관계수*표준편차(y)/표준편차(x)
b<-cor(x,y)*sd(y)/sd(x)
a<-mean(y)-b*mean(x)


result<-lm(final~midterm,mydata)
attributes(result)
result$coefficients

dev.off()
plot(x,y,
     xlab='중간',
     ylab='기말',
     main='시험점수수')
abline(result$coefficients)
summary(result)
#예측값
result$fitted.values
#잔차
mydata$final-result$fitted.values

dev.off()
par(mfrow=c(2,2))
plot(result)


dev.off()

plot(x,y,
     col=c('red','blue')[as.factor(mydata$gender)],
     pch=c(16,17)[as.factor(mydata$gender)],
     xlab='중간',
     ylab='기말',
     main = '시험점수')
legend(20,80,legend = c('여자','남자'),
       col=c('red','blue'),
       pch=c(16,17))


# 남 여 회귀선 구분하기==========================
library(dplyr)
dataFemale<-mydata %>% 
  filter(gender=='F')
  
dataMale<-mydata %>% 
  filter(gender=='M')


model1<-lm(final~midterm,dataFemale)
model2<-lm(final~midterm,dataMale)


dev.off()
plot(x,y,
     col=c('red','blue')[as.factor(mydata$gender)],
     pch=c(16,17)[as.factor(mydata$gender)],
     xlab='중간',
     ylab='기말',
     main = '시험점수')
legend(20,80,legend = c('여자','남자'),
       col=c('red','blue'),
       pch=c(16,17))
abline(model1$coefficients,col='red')
abline(model2$coefficients,col='blue')

#=========================================
predict(model1, data.frame(midterm=50))

param<-as.numeric(model1$coefficients)
param[1]+50*param[2]


#다중회귀분석
model3<-lm(final~midterm+gender,mydata)
model3
model3$fitted.values
predict(model3,mydata)
predict(model3,data.frame(midterm=80,gender='M'))
model3$coefficients
