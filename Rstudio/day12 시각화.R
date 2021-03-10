train <- read.csv("train.csv")
test <- read.csv("test.csv")
str(train)
names(train)

# Name, Ticket, Cabin 컬럼 제거
train <- train[,-c(4,9,11)]
names(train)

test <- test[,-c(3,8,10)]

# 성별 0,1로 변환
train$Sex <- sapply(train$Sex, switch, 'male'=0, 'female'=1)
test$Sex <- sapply(test$Sex, switch, 'male'=0, 'female'=1)

# 승선 항구 C=0, Q=1, S=2 로 변환
train$Embarked <- sapply(train$Embarked, switch, 'C'=0, 'Q'=1, 'S'=2)
test$Embarked <- sapply(test$Embarked, switch, 'C'=0, 'Q'=1, 'S'=2)

# 나이와 운임 열에 대해 na제거
train_age <- na.omit(train$Age)
train_age_avg <- mean(train_age) # na제외한 나머지 나이 평균
train$Age[is.na(train$Age)] <- train_age_avg  # na값만 추출 후 avg로 변경

test_age <- na.omit(test$Age)
test_age_avg <- mean(test_age) # na제외한 나머지 나이 평균
test$Age[is.na(test$Age)] <- test_age_avg  # na값만 추출 후 avg로 변경

test_fare <- na.omit(test$Fare)
test_fare_avg <- mean(test_fare) # na제외한 나머지 운임 평균
test$Fare[is.na(test$Fare)] <- test_fare_avg


# 나이와 생존여부 관계 그래프(시각화)
# 성별과 생존여부 관계 그래프(시각화)
# ...


# 나이가 10세 이상이면 0, 아니면 1로 치환
train$Age <- ifelse(train$Age < 18, 1, 0)
test$Age <- ifelse(test$Age < 18, 1, 0)

# 정규화(운임, 등실)
normalize <- function(x){
  num <- x-min(x)
  denom <- max(x)-min(x)
  return(num/denom)
}

train$Pclass <- normalize(train$Pclass)
test$Pclass <- normalize(test$Pclass)

test_length <- length(test$Fare)
fare <- normalize((c(train$Fare, test$Fare)))  # train, test data를 합쳐서 정규화시킴
train$Fare <- fare[1:(length(fare)-test_length)]  # train data의 운임만 추출
test$Fare <- fare[(length(fare)-test_length+1):length(fare)]
train$Fare


# 결측값 : 딥러닝 예측, 회귀모델, ... 머신러닝

install.packages("ggvis")
library(ggvis)
library(dplyr)


#그래프 그리기
iris %>% 
  ggvis(~Petal.Length, ~Petal.Width, fill=~factor(Species)) %>% layer_points()



mmn<-function(x){
  num<-x-min(x)
  denom<-max(x)-min(x)
  return (num/denom)
}

iris_n<-as.data.frame(lapply(iris[1:4],mmn))
summary(iris_n)

#67%:33%로 나누기
table(iris$Species)
set.seed(1234)
rs<-sample(2,nrow(iris),replace=T,prob=c(0.67,0.33))
train<-iris[rs==1,1:4] #train(67%)
test<-iris[rs==2,1:4] #test(33%)

train.label<-iris[rs==1,5]
test.label<-iris[rs==2,5]

library(class)
pred<-knn(train=train,test=test,
    cl=train.label,k=3)
length(pred)
sum(pred==test.label)/length(pred)

library(gmodels)
CrossTable(x=test.label,y=pred)


#plot 속성 탐색
#main, sub: 제목
#las: 축 label 값 스타일
#bty:그래프 외곽선 스타일
#pch 표시자 스타일 변경
#lty 선 스타일 변경(시계열)
plot(faithful,
     main='main title',
     sub='sub title',
     xlab='eruption time(min)',
     ylab='waiting time to next eruption')

plot(faithful)
plot(faithful,las=0)
plot(faithful,las=1)
plot(faithful,las=2)
plot(faithful,las=3)

#외곽선 모양 변경
plot(faithful)
plot(faithful,bty='o')
plot(faithful,bty='n')
plot(faithful,bty='l')
plot(faithful,bty=']')

#pch 표시자 스타일 변경
plot(faithful,pch=3)
plot(faithful,pch=3)
?points

#시계열
str(LakeHuron)
plot(LakeHuron)
plot(LakeHuron,lty='solid')
plot(LakeHuron,lty='dashed')
plot(LakeHuron,lty='dotted')
plot(LakeHuron,lty='twodash')


#type
#기온,기압 데이터셋
pressure
plot(pressure)
plot(pressure,type='p')#point
plot(pressure,type='l')#line
plot(pressure,type='b')#both
plot(pressure,type='o')
plot(pressure,type='h')#히스토그램
plot(pressure,type='s')#step

#사용자 정의 형식 그래프
# type='n':틀만 만들기
x<-1:10
y1<-exp(x)
y2<-exp(10:1)

plot(x,y1,type='n',ylab='y')
lines(x,y1,type='o',col='red')
lines(x,y2,type='o',col='blue')


#grid():격자모형 출력
plot(faithful,type='n')
grid()
points(faithful,pch=19,col='blue')

dev.off()
plot(faithful,pch=19,col='blue')
grid()

colors()
head(colors(),10)
grep('purple',colors(),value=T)

#기본 색상 파레트
palette('default')
palette()
pie(rep(1,12),col=1:12)

palette(rainbow(6))
palette()
pie(rep(1,12),col=1:12)

#그라데이션 만들기
pie(rep(1,12),col=gray(level=seq(0,1,length=12)))
pie(rep(1,12),col=rainbow(12,alpha=seq(0,1,length=12)))

pie(rep(1,12),col=heat.colors(12))
pie(rep(1,12),col=terrain.colors(12))
pie(rep(1,12),col=cm.colors(12)) #help활용하여 색 참조


install.packages('mlbench')
library(mlbench)
data("Ozone")
plot(Ozone$V8,Ozone$V9)
plot(Ozone$V8,Ozone$V9,xlab='Sandburg',ylab='El Monte')
plot(Ozone$V8,Ozone$V9,xlab='Sandburg',ylab='El Monte',las=1,
     main='Ozone',pch='*')
#구글 검색어:r pch symbols 검색


#cex : 표시자 크기
plot(Ozone$V8,Ozone$V9,xlab='Sandburg',ylab='El Monte',
    cex=0.5)
plot(Ozone$V8,Ozone$V9,xlab='Sandburg',ylab='El Monte',
     cex=1)
plot(Ozone$V8,Ozone$V9,xlab='Sandburg',ylab='El Monte',
     cex=1,col='red')
plot(Ozone$V8,Ozone$V9,xlab='Sandburg',ylab='El Monte',
     cex=1,col='#ff0000')

#x,y축 범위 설정
plot(Ozone$V8,Ozone$V9,
     pch='+',cex=1,col='#ff0000',
     xlab='Sandburg',ylab='El Monte',
     xlim=c(0,150),ylim=c(0,100),las=1,
     main='Ozone'
     )

#하나의 x값에 두개 이상의 y가 있는 경우: 대표값 설정
cars
plot(cars,type='l')
plot(cars,type='o',cex=0.5) 
names(table(cars$speed))

#group_by사용
library(dplyr)
cars %>% 
  group_by(speed) %>% 
  summarise(mean.dist=mean(dist))

#tapply사용
tapply(1:10,1:10%%2==1,sum)
with(iris,tapply(Sepal.Length, Species, mean))
data<-with(cars,tapply(dist,speed,mean))
plot(data,type='o',xlab='speed',ylab='distance',cex=0.7)

new<-data.frame(speed=as.numeric(row.names(data)),mean.dist=with(cars,tapply(dist,speed,mean)))
left_join(cars,new,by='speed')

#여러개의 그래프 그리기
#창을 2칸으로 나누어 시각화
p12<-par(mfrow=c(1,2))
plot(Ozone$V8,Ozone$V9,xlab='Sandburg',ylab='El Monte',
     main='Ozone')
plot(Ozone$V8,Ozone$V9,xlab='Sandburg',ylab='El Monte',
     main='Ozone2')

p21<-par(mfrow=c(2,1))
plot(Ozone$V8,Ozone$V9,xlab='Sandburg',ylab='El Monte',
     main='Ozone')
plot(Ozone$V8,Ozone$V9,xlab='Sandburg',ylab='El Monte',
     main='Ozone2')

p22<-par(mfcol=c(2,2))
plot(Ozone$V8,Ozone$V9,xlab='Sandburg',ylab='El Monte',
     main='Ozone')
plot(Ozone$V8,Ozone$V9,xlab='Sandburg',ylab='El Monte',
     main='Ozone2')
plot(Ozone$V8,Ozone$V9,xlab='Sandburg',ylab='El Monte',
     main='Ozone')
plot(Ozone$V8,Ozone$V9,xlab='Sandburg',ylab='El Monte',
     main='Ozone2')

p22<-par(mfrow=c(2,2))
plot(Ozone$V8,Ozone$V9,xlab='Sandburg',ylab='El Monte',
     main='Ozone')
plot(Ozone$V8,Ozone$V9,xlab='Sandburg',ylab='El Monte',
     main='Ozone2')
plot(Ozone$V8,Ozone$V9,xlab='Sandburg',ylab='El Monte',
     main='Ozone')
plot(Ozone$V8,Ozone$V9,xlab='Sandburg',ylab='El Monte',
     main='Ozone2')
#맥주-> 땅콩
#물건1->물건2....,물건n
#함꼐 구매되는 경향이 높은 상품 집합 생성 알고리즘
#상품 배치(진열)할 때 함께 구매되는 경향이 있는
#상품들을 진열=> 매출액 상승
#손님 맞춤형 세트메뉴

#이메일 : 조건부 확률->베이즈이론
#베이지안 필터기->광고메일/일반메일 분류

#클러스터링(sns데이터)=> 암환자

#텍스트 분석

