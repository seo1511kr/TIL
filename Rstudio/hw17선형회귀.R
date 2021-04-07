
#1 cars
data(cars)
cars
dev.off()
plot(dist~speed,cars) #약간 비선형적으로 보임
lines(supsmu(cars$speed,cars$dist))


model1<-lm(dist~speed,cars)
dev.off()
par(mfrow=c(2,2))
plot(model1)
#residual 분포가 2차 함수

#정규성은 일치
#outlier도 없음
summary(model1) 

# Multiple R-squared:  0.6511
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept) -17.5791     6.7584  -2.601   0.0123 *  
#   speed         3.9324     0.4155   9.464 1.49e-12 ***

# RSS구하기
rss1<-sum((cars$dist-model1$fitted.values)^2)
rss1 #[1] 11353.52
#===================================================
cars$speed2<-(cars$speed)^2

dev.off()
plot(dist~speed2,cars)

model2<-lm(dist~speed2,cars)
dev.off()
par(mfrow=c(2,2))
plot(model2)
summary(model2)  #Multiple R-squared:  0.6659

rss2<-sum((cars$dist-model2$fitted.values)^2)
rss2  #[1] 10871.14 정확도 상승

#===================================================
#2 marketing
library(datarium)
data("marketing")
head(marketing)

str(marketing)
library(GGally)
ggcorr(marketing,label = T)
#신문과 페이스북 상관관계 0.4 -> 둘 중 하나만 넣기

#훈련, 테스트 분리
len<-nrow(marketing)
sample_idx<-sample(1:len,len*0.3,replace=FALSE)
train<-marketing[-sample_idx,]
test<-marketing[sample_idx,]

plot(marketing,type)
# 신문은 선형이라기에 좀 애매해 보임

model1<-lm(sales~youtube,train)
dev.off()
par(mfrow=c(2,2))
plot(model1)# fitted 클수록 잔차 큼-> 잘못된 모델
summary(model1) #Multiple R-squared:  0.6226

rss1<-sum((train$sales-model1$fitted.values)^2)
rss1 #[1] 2037.769

params1<-as.numeric(model1$coefficients)
test$predict<-predict(model1,test)

dev.off()
plot(sales~youtube,test)
points(x=test$youtube,y=test$predict,col='red')
lines(supsmu(test$youtube,test$sales))
abline(model1,col='red')

dev.off()
par(mfrow=c(2,1))
plot(sales~youtube,test)
points(x=test$youtube,y=test$predict,col='red')
lines(supsmu(test$youtube,test$sales))
abline(model1,col='red')

plot(sales~predict,test)
abline(a=0,b=1,col='red')

#===================================================
model2<-lm(sales~youtube+facebook,train)
summary(model2) #Multiple R-squared:  0.9167
test$predict2<-predict(model2,test)

dev.off()
plot(sales~predict2,test)
abline(a=0,b=1,col='red')
#===================================================
model3<-lm(sales~youtube+facebook+newspaper,train)
summary(model3) #Multiple R-squared:  0.9182
#newspaper 유의확률:0.113-> 기각 
test$predict3<-predict(model3,test)

dev.off()
plot(sales~predict3,test)
abline(a=0,b=1,col='red')

#===================================================
#model4 : 유튜브 광고효과 증가폭 감소할 것
#log취해주기
train$youtube2<-log(train$youtube+1)
test$youtube2<-log(test$youtube+1)

model4<-lm(sales~youtube2+facebook,train)
summary(model4) #Multiple R-squared:  0.9191

test$predict4<-predict(model4,test)

dev.off()
plot(sales~predict4,test)
abline(a=0,b=1,col='red')

#===================================================
#model5: 유튜브*페이스북 파생변수 넣어주기
#유튜브에 나오고 페이스북에도 나오면 광고효과 증가
#혹은, 너무 질려서 감소 어쨋든 영향이 있을듯

train$youface<-train$youtube*train$facebook
test$youface<-test$youtube*test$facebook

model5<-lm(sales~youtube+facebook+youface,train)
summary(model5) #Multiple R-squared:  0.9746

test$predict5<-predict(model5,test)

dev.off()
plot(sales~predict5,test)
abline(a=0,b=1,col='red') 
#===================================================

train$facebook2<-log(train$facebook+1)
test$facebook2<-log(test$facebook+1)

model6<-lm(sales~youtube2+facebook2,train)
summary(model6) #Multiple R-squared:  0.8505

test$predict6<-predict(model6,test)

dev.off()
plot(sales~predict6,test)
abline(a=0,b=1,col='red') 
#===================================================
#log(youtube+1), facebook, youtube*facebook 사용
#매우 우수한 성능

#모델
model7<-lm(sales~youtube2+facebook+youface,train)
summary(model7) #Multiple R-squared:  0.9963

#예측
test$predict7<-predict(model7,test)

dev.off()
plot(sales~predict7,test)
abline(a=0,b=1,col='red') 

sum((test$sales-test$predict7)^2)
