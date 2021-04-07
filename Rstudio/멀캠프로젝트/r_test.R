# 1. mtcars 데이터를 불러온 후,
# - 전체 32개의 관측치 중 25개를 train, 7개를 test 데이터로 나누어 작업
# - mpg를 종속변수로 두고 다양한 회귀 모델 작성
data("mtcars")
mydata<-mtcars
str(mydata) #모두 수량뱐수

#결측치 확인: 없음
install.packages('Amelia')
library(Amelia)
missmap(mtcars,col=c('red','blue')) 

#상관관계 확인: mpg와의 상관관계(qsec 제외하고 모드 0.5이상)
#상관계수 상위 4개의 변수(cyl:0.9, wt:-0.9, disp:-0.8, hp:-0.8), 추가 고려 2개(drat:0.7, vs:0.7)
#그러나 변수들 간 상관계수가 너무 높음 => 다중공선성의 위험 인지
install.packages('GGally')
library(GGally)
ggcorr(mydata,nbreaks = 5, label=T)

#시각화
plot(mydata)


#================================================================================
install.packages('pacman')
pacman::p_load('tidyverse','tidymodels','twidlr','PerformanceAnalytics', 'car', 'QuantPsyc') 
install.packages('ggplot2')
library(ggplot2)
library(dplyr)

#================================================================================
# 상관계수 상위 4개의 변수(cyl:0.9, wt:-0.9, disp:-0.8, hp:-0.8)
#================================================================================
# feature별 단순선형회귀
#================================================================================
#================================================================================
#1. mpg~cyl
#선형성x ->추가 변수 고려의 필요성
#qqplot을 보면 정규성을 만족하지 않음.
lm_cyl<-lm(mpg~cyl,mydata)
dev.off()
par(mfrow=c(2,2))
plot(lm_cyl)
summary(lm_cyl) #R-squared:  0.7262 p-value: 6.113e-10
#================================================================================
#해결: mpg에 로그 취해주기=> 등분산성, 정규성 상당부분 개선
mydata$mpg_l<-log(mydata$mpg+1)
lm_log_cyl<-lm(mpg_l~cyl,mydata)
dev.off()
par(mfrow=c(2,2))
plot(lm_log_cyl) 
summary(lm_log_cyl) #R-squared:  0.7326 p-value: 4.259e-10
#================================================================================
#모델 시각화: cyl=4, 8일 때 정확도가 현저히 떨어짐. 추가적인 변수 필요
dev.off()
mydata%>%ggplot(aes(cyl,mpg_l))+
  geom_point()+
  geom_smooth(method = 'loess', level=.95)

#================================================================================
#================================================================================
#2.mpg~wt
#선형성 x ->추가 변수 고려의 필요성
#qqplot을 보면 정규성을 만족하지 않음.
lm_wt<-lm(mpg~wt,mydata)
dev.off()
par(mfrow=c(2,2))
plot(lm_wt)
summary(lm_wt) #R-squared:  0.7528 p-value: 1.294e-10
#================================================================================

#해결: mpg->1/mpg+1
lm_wt2<-lm(1/(mpg+1)~wt,mydata)
dev.off()
par(mfrow=c(2,2))
plot(lm_wt2) 
summary(lm_wt2) # F통계량 p-value: 7.617e-12
lm_wt2 %>% glance #R-squared:  0.795 p-value: 7.617e-12
#================================================================================
#모델 시각화: cyl=4, 8일 때 정확도가 현저히 떨어짐. 추가적인 변수 필요
dev.off()
mydata%>%ggplot(aes(wt,1/(mpg+1)))+
  geom_point()+
  geom_smooth(method = 'loess', level=.95)

#================================================================================
#================================================================================
#3.mpg~disp
#선형성 x ->추가 변수 고려의 필요성
#qqplot을 보면 정규성을 만족하지 않음.
lm_disp<-lm(mpg~disp,mydata)
dev.off()
par(mfrow=c(2,2))
plot(lm_disp)
summary(lm_disp) #R-squared:  0.7183 p-value: 9.38e-10
#================================================================================

#해결: mpg->1/mpg+1
lm_disp2<-lm(1/(mpg+1)~disp,mydata)
dev.off()
par(mfrow=c(2,2))
plot(lm_disp2) 
summary(lm_disp2)  #R-squared:  0.7777 p-value: 2.591e-11
#================================================================================
#모델 시각화: 
dev.off()
mydata%>%ggplot(aes(disp,1/(mpg+1)))+
  geom_point()+
  geom_smooth(method = 'loess', level=.95)

#================================================================================
#================================================================================
#4.mpg~hp
#선형성 x ->추가 변수 고려의 필요성
#qqplot을 보면 정규성을 만족하지 않음.
lm_hp<-lm(mpg~hp,mydata)
dev.off()
par(mfrow=c(2,2))
plot(lm_hp)
summary(lm_hp) #R-squared:  0.6024 p-value: 1.788e-07
#================================================================================

#해결: mpg->1/mpg+1
lm_hp2<-lm(1/(mpg+1)~hp,mydata)
dev.off()
par(mfrow=c(2,2))
plot(lm_hp2) 
summary(lm_hp2)  #R-squared:  0.5906 p-value: 2.801e-07
#================================================================================
#모델 시각화: cyl=4, 8일 때 정확도가 현저히 떨어짐. 추가적인 변수 필요
dev.off()
mydata%>%ggplot(aes(hp,1/(mpg+1)))+
  geom_point()+
  geom_smooth(method = 'loess', level=.95)


#================================================================================
#================================================================================
model1<-lm(1/(mpg+1)~cyl+wt+disp+hp,mydata)
dev.off()
par(mfrow=c(2,2))
plot(model1)
summary(model1) #Adjusted R-squared:  0.8364 p-value: 4.749e-11

#모델평가: AIC=-2ln(L) +2k, 낮을수록 좋음
# (L은 fitting정도, k는 feature개수), feature개수에 패널티 부여
model1 %>% glance #AIC:-231.

#다중공선성 확인
#Vif(k번째 feature)= 1/(1-R^2) (k번째 feature가 종속변수, k제외 나머지 독립변수들을 독립변수로 회귀했을 때의 R)
#보통 vif가 10보다 크면 다중공선성이 존재하는 변수로 취급

install.packages('car')
library(car)
vif(model1) #disp만 10 넘음 disp 빼고 다시 분석해보기

#================================================================================
model2<-lm(1/(mpg+1)~cyl+wt+hp,mydata)
dev.off()
par(mfrow=c(2,2))
plot(model2)
summary(model2) #Adjusted R-squared:0.8397 p-value: 7.151e-12
model2 %>% glance #AIC:-231. 조금 개선됨
vif(model2)

# outlier 살펴보기, 비슷한 특징 평균값으로 대체
mydata[c('Cadillac Fleetwood','Chrysler Imperial'),]# cyl:8, gear:3 carb:4
install.packages('dplyr')
library(dplyr)
mpg_out<-mydata %>% 
  filter(cyl==8,gear==3,carb==4) %>% 
  select(mpg)
mydata[c('Cadillac Fleetwood','Chrysler Imperial'),'mpg']<-mean(mpg_out[[1]])

model2<-lm(1/(mpg+1)~cyl+wt+hp,mydata)
dev.off()
par(mfrow=c(2,2))
plot(model2)
summary(model2) #Adjusted R-squared:0.8853  p-value: 4.108e-13
model2 %>% glance #AIC:-246.
vif(model2)
#================================================================================
# (그룹화 되어있는 변수인 cyl과 다른 feature들의 상호작용항 추가)
model3<-lm(1/(mpg+1)~cyl+wt+hp+cyl*wt+cyl*hp,mydata)
dev.off()
par(mfrow=c(2,2))
plot(model3)
summary(model3) #Adjusted R-squared:0.8846   p-value: 2.295e-12
model3 %>% glance #AIC:-244. 더 안좋아짐.
vif(model3) #상호작용항이 추가되어 vif가 높게 나옴


mtcars%>%select_at(vars(mpg,cyl, wt, hp, cyl:wt, cyl:hp))%>%
  chart.Correlation(histogram=TRUE, pch=20)
#================================================================================
#범주형 변수들 살펴보기(cyl, gear, carb)
unique(mydata$cyl)


with(mydata,aggregate(mpg,list(cyl,gear,carb),mean))

dev.off()
mydata %>% 
ggplot(aes(x=factor(cyl),y=mpg,group=factor(cyl),fill=factor(gear)))+
  geom_boxplot()+
  facet_grid(. ~ gear+carb)
#gear와 carb로 cyl을 거의 완벽하게 예측할 수 있음-> cyl대신 gear, carb 넣어주기
model4<-lm(1/(mpg+1)~gear+wt+hp+carb,mydata)
dev.off()
par(mfrow=c(2,2))
plot(model4)
summary(model4) #Adjusted R-squared:0.8877 p-value: 3.078e-13
model4 %>% glance #AIC:-246
vif(model4) #상호작용항이 추가되어 vif 모두 5 미만으로 양호

#================================================================================
# best model: 1/(mpg+1)~cyl+wt+hp,1/(mpg+1)~gear+carb+wt+hp 
#test, train 분리
set.seed(2021)
mydata
n=nrow(mydata)
sample_idx<-sample(1:n,7,replace = F)
train<-mydata[-sample_idx,]
test<-mydata[sample_idx,]

predict1<-1/predict(model1,test)-1
predict2<-1/predict(model4,test)-1

#RSS:0.3593043
sum(test$mpg-predict1)^2
#RSS:0.5056002
sum(test$mpg-predict2)^2

dev.off()
par(mfrow=c(2,1))
plot(x=predict1,y=test$mpg)
abline(0,1,col='red')
plot(x=predict2,y=test$mpg)
abline(0,1,col='red')

#================================================================================

#================================================================================
# 2. yahoo.finance.com에서 최근 1년 동안의(2020.3.18~2021.3.18) 삼성전자 주식 데이터를 
# 다운로드 후, 종가를 예측하는 모델을 만드시오. (위 기간을 다르게 설정해도 관계없습니다)
mydata<-read.csv('data/samsung200318_21.csv')
str(mydata)
View(mydata)
mydata$Date<-as.Date(mydata$Date)
mydata$Year<-format(mydata$Date,'%Y')
mydata$DOW<-format(mydata$Date,'%A')
mydata$YM<-format(mydata$Date,'%Y-%m')
mydata$Month<-format(mydata$Date,'%m')
mydata$Day<-format(mydata$Date,'%d')

# 분기나누기

mydata$quarter<-with(mydata,ifelse(Month %in% c('01','02','03'),1,
                                   ifelse(Month %in% c('04','05','06'),2,
                                          ifelse(Month %in% c('07','08','09'),3,4))))
#상승:1 , 하락,0
mydata$sign<-with(mydata,ifelse((Open-Close)<0,1,0))

#================================================================================
#데이터 분석 -> 이전까지 데이터로 다음날 종가예측
library(GGally)
dev.off()
ggcorr(sapply(mydata[c('Close','Month','Day','Volume','quarter')],as.numeric),
       nbreaks = 5,label=T) 



#1.데이터 요약
close_month<-mydata %>% 
  group_by(Year,Month) %>% 
  summarise(mc=mean(Close))
close_month

mysum1<-mydata %>% 
  group_by(Year,Month) %>% 
  summarise('최고종가'=max(Close),'최소종가'=min(Close),
            '최고시초종가상승률'=round(max((Open-Close)/Open)*100,2),
            '최고시초종가하락률'=round(min((Open-Close)/Open)*100,2),
            '일일변동률'=round(max((High-Low)/Open)*100,2),
            '최고거래량'=max(Volume),'최고거래량대비변동률'=max(abs((Open-Close)/Open)/Volume))
mysum1
#================================================================================
#2.데이터 시각화
# - 월/분기별 주가 변화 시각화
# - 전체 기간 중 최고/최저 주가
library(ggplot2)
install.packages('dplyr')
library(dplyr)
#================================================================================
#시계열 plot 전체적인 우상향
dev.off()
par(bg = "#EAEAEA")
plot(mydata$Date,mydata$Close,
     col=factor(mydata$Month),
     pch=20,
     type = 'b')
grid()
abline(h=close_month$mc,
       col=factor(close_month$Month),
       lty=2)
#================================================================================
#연월별 종가 boxplot: 2020-11, 2021-01이 종가 변동성이 큼
mydata %>% ggplot(aes(x=factor(YM),y=Close))+
  geom_boxplot(aes(fill=factor(YM)),alpha=I(0.4),outlier.color = 'red')+
  geom_jitter(aes(col=factor(YM)),alpha=I(0.4))+
  xlab('년-월')+
  ylab('종가')+ggtitle('연월별 boxplot')+labs(fill='년-월')
  
#================================================================================
#연월별 (시초가-종가)/시초가=> 월별 일일 수익률 변동성 boxplot
# 2020-3, 2020-11, 2021-01 이 수익률 변동성이 큼
mydata %>% ggplot(aes(x=factor(YM),y=((Open-Close)/Open)*100))+
  geom_boxplot(aes(fill=factor(YM)),alpha=I(0.4),outlier.color = 'red')+
  geom_jitter(aes(col=factor(YM)),alpha=I(0.4))+
  xlab('년-월')+
  ylab('종가변동률')+ggtitle('연월별 boxplot')+labs(fill='년-월')+
  geom_hline(yintercept = 0,col='red')+
  theme(axis.text.x=element_text(angle=45, hjust=1))
#================================================================================
# 거래량과 종가 변동률의 관계_ 요일별로 파악
# 거래량이 많으면 변동성 자체는 커지는 경향이 있음
#1. 금요일, 화요일의 거래량 증가는 수익률에 부정적
#2. 목요일의 거래량 증가는 수익률에 긍정적으로 보임
mydata %>% ggplot(aes(Volume,((Open-Close)/Open)*100))+
  geom_point(aes(shape=factor(DOW),col=factor(DOW)))+
  geom_smooth(aes(col=factor(DOW),fill=factor(DOW)),
              method=lm,level=0.5)+
  geom_hline(yintercept = 0,col='red',linetype=2)
#================================================================================
#분기별 시각화
str(mydata)
#쿼터별 종가 평균
mean_C<-mydata %>% 
  group_by(Year,quarter) %>% 
  summarise(mean(Close))

mean_R<-mydata %>% 
  group_by(Year,quarter) %>% 
  summarise(mean(((Open-Close)/Open)*100))

mean_H<-mydata %>% 
  group_by(Year,quarter) %>% 
  summarise(mean(((High-Low)/Open)*100))


mean_V<-mydata %>% 
  group_by(Year,quarter) %>% 
  summarise(mean(Volume))


#쿼터별 boxplot
#종가
mydata %>% 
  ggplot(aes(x=factor(quarter),y=Close))+
  geom_boxplot(aes(fill=factor(quarter)),alpha=I(0.4),outlier.color='black',outlier.size =5)+
  facet_grid(. ~ Year)+
  geom_jitter(aes(col=factor(quarter),fill=factor(quarter)))+
  geom_hline(yintercept = mean_C[[3]],col='red',linetype=2)
#종가 수익률
mydata %>% 
  ggplot(aes(x=factor(quarter),y=((Open-Close)/Open)*100))+
  geom_boxplot(aes(fill=factor(quarter)),alpha=I(0.4),outlier.color='black',outlier.size =5)+
  facet_grid(. ~ Year)+
  geom_jitter(aes(col=factor(quarter),fill=factor(quarter)))+
  geom_hline(yintercept = mean_R[[3]],col='red',linetype=2)
#거래량
mydata %>% 
  ggplot(aes(x=factor(quarter),y=Volume))+
  geom_boxplot(aes(fill=factor(quarter)),alpha=I(0.4),outlier.color='black',outlier.size =5)+
  facet_grid(. ~ Year)+
  geom_jitter(aes(col=factor(quarter),fill=factor(quarter)))+
  geom_hline(yintercept = mean_V[[3]],col='red',linetype=2)
#최고변동률
mydata %>% 
  ggplot(aes(x=factor(quarter),y=((High-Low)/Open)*100))+
  geom_boxplot(aes(fill=factor(quarter)),alpha=I(0.4),outlier.color='black',outlier.size =5)+
  facet_grid(. ~ Year)+
  geom_jitter(aes(col=factor(quarter),fill=factor(quarter)))+
  geom_hline(yintercept = mean_H[[3]],col='red',linetype=2)

#분기별 상승, 하락 비율
df <- mydata %>% 
  group_by(Year,quarter,sign) %>%
  summarize(counts = n()) %>%
  mutate(perc = (counts / sum(counts)) * 100) %>%
  arrange(desc(perc))

ggplot(df, aes('', counts)) +
  geom_col(
    position = 'fill',
    color = 'black',
    width = 1,
    aes(fill = factor(sign,labels = c('하락','상승')))
  ) +
  facet_wrap(~Year+quarter, labeller = "label_both") +
  geom_label(
    aes(label = paste0(round(perc), "%"), group = factor(sign)),
    position = position_fill(vjust = 0.5),
    color = 'black',
    size = 4,
    show.legend = FALSE
  ) +
  coord_polar(theta = "y")+
  theme(legend.title = element_blank(),
        legend.position = 'bottom')

#================================================================================
# - 월/분기별 최대/최소값 등 통계치
mysum1<-mydata %>% 
  group_by(Year,Month) %>% 
  summarise('최고종가'=max(Close),'최소종가'=min(Close),
            '최고시초종가상승률'=round(max((Open-Close)/Open)*100,2),
            '최고시초종가하락률'=round(min((Open-Close)/Open)*100,2),
            '일일변동률'=round(max((High-Low)/Open)*100,2),
            '최고거래량'=max(Volume),'최고거래량대비변동률'=max(abs((Open-Close)/Open)/Volume))
mysum1

mysum2<-mydata %>% 
  group_by(Year,quarter) %>% 
  summarise('최고종가'=max(Close),'최소종가'=min(Close),
            '최고시초종가상승률'=round(max((Open-Close)/Open)*100,2),
            '최고시초종가하락률'=round(min((Open-Close)/Open)*100,2),
            '일일변동률'=round(max((High-Low)/Open)*100,2),
            '최고거래량'=max(Volume),'최고거래량대비변동률'=max(abs((Open-Close)/Open)/Volume))
mysum2




#요일별 상승하락 비율
df <- mydata %>% 
  group_by(DOW,sign) %>%
  summarize(counts = n()) %>%
  mutate(perc = (counts / sum(counts)) * 100) %>%
  arrange(desc(perc))

ggplot(df, aes('', counts)) +
  geom_col(
    position = 'fill',
    color = 'black',
    width = 1,
    aes(fill = factor(sign,labels = c('하락','상승')))
  ) +
  facet_wrap(~DOW, labeller = "label_both") +
  geom_label(
    aes(label = paste0(round(perc), "%"), group = factor(sign)),
    position = position_fill(vjust = 0.5),
    color = 'black',
    size = 4,
    show.legend = FALSE
  ) +
  coord_polar(theta = "y")+
  theme(legend.title = element_blank(),
        legend.position = 'bottom')


  
#================================================================================

#3일 종가이동평균
mydata$mean3days<-c(mydata$Close[1],mean(mydata$Close[1:2]),(mydata[1:245,'Close']+mydata[2:246,'Close']+mydata[3:247,'Close'])/3)

plot(mydata$Date,mydata$mean3days,type='l')
lines(mydata$Date,mydata$Close,col='red')


#3일 거래량 이동평균
mydata$Volume3days<-c(mydata$Volume[1],mean(mydata$Volume[1:2]),(mydata[1:245,'Volume']+mydata[2:246,'Volume']+mydata[3:247,'Volume'])/3)

#전날 3일 종가, 거래량 이동평균
mydata$exmean3[2:247]<-mydata$mean3days[1:246]
mydata$exmean3[1]<-mydata$mean3days[1]

mydata$exVol3[2:247]<-mydata$Volume3days[1:246]
mydata$exVol3[1]<-mydata$Volume3days[1]


#전날 종가가 전날 이동평균보다 높으면1, 아니면0
mydata$uppermean3[2:247]<-ifelse(mydata$Close[1:246]>mydata$mean3days[1:246],1,0)
mydata$uppermean3[1]<-0
mydata$upperVolume3[2:247]<-ifelse(mydata$Volume[1:246]>mydata$Volume3days[1:246],1,0)#거래량
mydata$upperVolume3[1]<-0

#상승한 애들 전 날 데이터
exincrease<-mydata[which(mydata$sign==1)-1,]
with(exincrease,table(uppermean3))
with(exincrease,table(sign))
with(exincrease,table(upperVolume3))

#+=================================================================================
#+=================================================================================
#2. 종가예측, 상승하락 예측
#1. 다중선형회귀, 로지스틱회귀
#2. knn
#3. kmeans 2그룹 나누기



str(mydata)
mydata[c('Year','Month','Day')]<-sapply(mydata[c('Year','Month','Day')],as.numeric)
#+=================================================================================
# 전처리
# 1. 요일변수 원핫인코딩(더미)
words<-unique(t(mydata)['DOW',])
for(i in words){
  newcol<-paste('DOW',i,sep='')
  mydata[newcol]<-ifelse(t(mydata)['DOW',]==i,1,0)
}
#+=================================================================================
# 2. 데이터 분리
# train 데이터 : 2020년 3월 18일~2021년 2월 18일(11개월)
# test 데이터 : 2021년 2월 19일~3월 18일까지 (1개월)


train<-mydata[mydata$Date<='2021-02-18',]
test<-mydata[mydata$Date>'2021-02-18',]
#+=================================================================================
# 3 모델 작성 및 예측

#모델1: 날짜만 가지고 예측
#더미 변수 넣을 때 베이스 빼고 넣어줘야함, base=금요일,
#quarter와 month는 상관계수 1이라 둘 중 하나만 사용
#rss=739762713
str(train)
dev.off()
par(mfrow=c(2,2))
hist(train$Close)
hist(log(train$Close)) #얘로 선택
hist(1/train$Close)
hist(1/log(train$Close))

set.seed(1234)
sample_idx<-sample(1:nrow(train),nrow(train)*0.3)
train_train<-train[-sample_idx,]
train_test<-train[sample_idx,]

model1<-lm(Close~Year+Month+Day+DOW월요일+DOW화요일+DOW수요일+DOW목요일,train_train)
dev.off()
par(mfrow=c(2,2))
plot(model1)
summary(model1) #0.9345 p-value: < 2.2e-16


sum((train_test$Close-predict(model1,train_test))^2)#rss=625869479 (잔차 제곱의 합)
sqrt(sum((log(train_test$Close+1)-log(predict(model1,train_test)+1))^2)/nrow(train_test)) #rmsle=0.04753366 (잔차 제곱의 합의 평균)
dev.off()
plot(x=predict(model1,train_test),y=train_test$Close)
abline(0,1,col='red')



#test 예측=================================================================
sum((test$Close-predict(model1,test))^2)#rss=739762713 (잔차 제곱의 합)
sqrt(sum((log(test$Close+1)-log(predict(model1,test)+1))^2)/nrow(test)) #rmsle=0.07299263 (잔차 제곱의 합의 평균)
dev.off()
plot(x=predict(model1,test),y=test$Close)

dev.off()
plot(test$Close,type='b',col='red',ylim = c(70000,100000))
lines(predict(model1,test))

#================================================================================
#모델2:다중선형회귀
#(날짜+ 전일 종가3일평균 초과여부+ 전일 거래량 3일평균 초과여부 + 두 추가 변수의 상호작용항 추가)
#종가예측: rss:765314202
#상승하락예측: glm정확도:0.3684211
model2<-lm(Close~Year+Month+Day+DOW월요일+DOW화요일+DOW수요일+DOW목요일+uppermean3+upperVolume3+uppermean3*upperVolume3,train)
summary(model2) #Adjusted R-squared0.9373 p-value: < 2.2e-16
dev.off()
par(mfrow=c(2,2))
plot(model2)

#종가 예측
sum((test$Close-predict(model2,test))^2)#rss=765314202 (잔차 제곱의 합)
sqrt(sum((log(test$Close+1)-log(predict(model2,test)+1))^2)/nrow(test)) #rmsle=0.0741195 (잔차 제곱의 합의 평균)

dev.off()
plot(test$Close,type='b',col='red',ylim = c(70000,100000))
lines(predict(model2,test))

#상승하락 맞추기: 정확도 #[1] 0.3684211
model3<-glm(sign~Year+Month+Day+DOW월요일+DOW화요일+DOW수요일+DOW목요일+uppermean3+upperVolume3+uppermean3*upperVolume3,family=binomial,train)
summary(model3) #AIC=314.07
step3<-step(model3,direction='backward')
predicts_prob<-predict(step3,newdata=test,type='response')
predict_sign<-ifelse(predicts_prob>0.5,1,0)
sum(test$sign==predict_sign)/nrow(test) #[1] 0.3684211

install.packages('gmodels')
library(gmodels)
CrossTable(x=predict_sign,y=test$sign)
#결론: 주가 맞추는 건 너무 어렵다.

#=============================================================================
#모델3:knn으로 예측
#종가예측: rss:7159910000
#상승하락예측: glm정확도:0.5263158
library(class)
str(train)
features<-c('Year','Month','Day','DOW월요일','DOW화요일','DOW수요일','DOW목요일','uppermean3','upperVolume3')

minmax<-function(x){
  (x-min(x))/(max(x)-min(x))
}

mydata$upperinter<-mydata$uppermean3*mydata$upperVolume3
mydata4<-apply(mydata[,features],2,minmax)

knntrain<-as.data.frame(mydata4[mydata$Date<='2021-02-18',])
knntest<-as.data.frame(mydata4[mydata$Date>'2021-02-18',])

#종가 예측
knn_model1<-knn(knntrain,knntest,
                cl=train$Close,k=5)

sum((test$Close-as.numeric(as.character(knn_model1)))^2) #rss:7159910000

# 상승하락 예측
knn_model2<-knn(knntrain,knntest,
                cl=train$sign,k=5)
sum(test$sign==knn_model2)/nrow(test)  #0.5263158: 로지스틱 회귀보다 더 높음..

#=============================================================================
# 모델4
# kmeans로 train 군집화 -> knn으로 군집예측->군집 대표값(평균, 중앙값)으로 test예측
# 상승하락예측: 군집평균 정확도:0.4736842
# 상승하락예측: 군집중앙값 정확도:0.4210526

kmeanstrain<-knntrain
kmeanstrain$sign<-train$sign
kmeanstest<-knntest

clusters_sign<-kmeans(kmeanstrain,10)
kmeanstrain$cluster<-clusters_sign$cluster
str(kmeanstrain)
str(kmeanstest)

#test cluster예측
cluster_predict<-knn(kmeanstrain[,features],kmeanstest,
    cl=kmeanstrain$cluster,k=5)

#평균 혹은 중간값으로 예측
transMean<-with(kmeanstrain,tapply(sign,cluster,mean))
transMedian<-with(kmeanstrain,tapply(sign,cluster,median))

#둘다 정확도 0.5 미만...
sum(test$sign==round(transMean[cluster_predict],0))/nrow(test) #0.4736842
sum(test$sign==transMedian[cluster_predict])/nrow(test) #0.4210526
#=============================================================================