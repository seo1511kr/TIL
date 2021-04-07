# knn vs kmeans(머신러닝)
# kmeans는 특정 수의 그룹을 만드는 것
# 그룹에대한 해석은 분석가의 몫
# 성별별 friends값 특성 찾아보기
# 성별별 단어 언급수 순위 5~10위 살펴보기
# 성별을 예측하는 건 knn으로 
# 문서의 유사성을 찾을 때 knn은
# 방향이나 순서를 고려하지 않음-> 코사인 유사도

#curve(함수 또느 표현식, 시작점,끝점)
curve(sin,0,2*pi)


#cars 선형회귀 -> 신뢰구간 출력
# lm(포뮬러,데이터)
# 포뮬러: 종속~독립

m
abline(m)

dev.off()
m<-lm(dist~speed,cars)
plot(cars)
abline(m)
#======================================================
#predict 함수로 예측하기, 신뢰구간도 출력
#interval = 'confidence'
p<-predict(m, interval = 'confidence')
p
# fit        lwr       upr
# -1.849460 -12.329543  8.630624

#======================================================
#polygon 활용하여 신뢰구간 표시
#y<-c(하좌,하우,상우,상좌)의 방향으로 데이터 입력
x<-c(cars$speed,tail(cars$speed,1),rev(cars$speed),cars$speed[1])
y<-c(p[,'lwr'],tail(p[,'upr'],1),rev(p[,'upr']),p[,'lwr'][1])
polygon(x,y,col=rgb(.7,.7,.7,.5))

#======================================================
#text( pos=) 로 좌표마다 번호인덱스 표시하기
#pos=0,1,2,3
dev.off()
plot(cars,cex=0.5)
text(cars$speed,cars$dist,pos=3,cex=.5)

dev.off()
plot(cars,cex=0.5)
identify(cars$speed,cars$dist)

#legend===============================================
plot(iris$Sepal.Width,iris$Sepal.Length,cex=.5,pch=20,xlab='width',ylab='length')
points(iris$Sepal.Width,iris$Sepal.Length,cex=.5,pch='+',col='red')
?legend
legend('topright',legend=c('Sepal',"Petal"),pch=c(20,43),
       cex=.8,col=c('black','red'),bg='gray')

#boxplot===============================================
boxstats<-boxplot(iris$Sepal.Width,horizontal = T)
boxstats
boxstats$stats#lowerwhisker, Q1, median, Q3, upperwhisker
boxstats$out #극단치

#=========================================================
#histogram
#breaks='Sturges' (lon2(n)+1, n은 자료의 개수)
#freq=T(y:개수),F(y:비율)
dev.off()
hist(iris$Sepal.Length,breaks = 'Sturges')
hist(iris$Sepal.Length,breaks = 6)
hist(iris$Sepal.Length,breaks = 'Sturges',freq=F)
?hist
#======================================================
#density 그리기
dev.off()
plot(density(iris$Sepal.Width))
#hist위에 density그리기
hist(iris$Sepal.Width,freq=F)
lines(density(iris$Sepal.Width))

#====================================================
#barplot그리기
barplot(tapply(iris$Sepal.Width,iris$Species,mean))
?barplot
#====================================================
#pie그래프 그리기(데이터의 비율)
cut(1:10,c(0,5,10))
cut(1:10,breaks=3)
table(cut(iris$Sepal.Width,breaks=10))
pie(table(cut(iris$Sepal.Width,breaks=10)),cex=.7)

#=====================================================
#ggplot2
#3층 구조((배경),(그래프:막대,선,점등),(특성:범위,색상 등))
library(ggplot2)
#data는 dataframe이어야 함
str(iris)
ggplot(data=iris,aes(x=Sepal.Length,y=Sepal.Width,col=Species))+
  geom_point()+
  labs(title='Iris',
       x='Sepal.Length',y='Sepal.Width')
?ggplot


#=====================================================
class(mtcars$gear)
mtcars$gear<-factor(mtcars$gear,levels=sort(unique(mtcars$gear)),
                    labels=c('3 gears','4 gears','5 gears'))
mtcars$cyl<-factor(mtcars$cyl,levels=sort(unique(mtcars$cyl)),
                    labels=c('3 cyl','4 cyl','5 cyl'))
str(mtcars)

ggplot(data=mtcars,aes(x=mpg))+
  geom_histogram()+
  facet_grid(cyl~.)+ #group_by와 비슷한 개념
  labs(title='cyl vs mpg')

ggplot(data=mtcars,aes(x=cyl,y=mpg))+
  geom_boxplot()+
  labs(x='cyl',y='mpg')

ggplot(data=mtcars,aes(x=mpg,fill=cyl))+
  geom_density()+
  labs(x='mpg',y='density')


#=====================================================
#Kmeans
#데이터 입력, 랜덤으로 중심점 선택, 그룹화
#그룹속 중심점 선택(그룹내 좌표 평균)
#다시 그룹화(유클리디안 거리), 그룹내 중심점 선택, 다시 그룹화
#처음 중심점을 선택할 때 랜덤 선택이라 시행마다 결과가
#다를 수 있음
#초기 중심점을 잡는 여러가지 방법으로 단점 보완
#k는 
#1.사전 지식-> 그룹의 개수 결정
#2.시각화-> 그룹의 개수 결정
#3.sqrt(n/2)이하로 k 값을 변화시키면서
#나누어진 그룹에대한 평가 진행, 최적의 k
#평가 방법: 그룹내 이질성, 그룹간 동질성
#중심점부터 각 점까지의 거리
teens<-read.csv('data/snsdata.csv')
str(teens)
names(teens)[1:4]# 
names(teens)[5:40] #단어

table(teens$gender,useNA='ifany')#여성의 sns 이용자 비율이 높음

#age: NA,3살 106살 전처리
summary(teens$age)
teens$age<-ifelse(teens$age>=13 & teens$age<20,teens$age,NA)
summary(teens$age)

#성별Na처리?
#Na를 하나의 카테고리로 봐도 됨

teens$female<-ifelse(teens$gender=='F'&
                       !is.na(teens$gender),1,0)
teens$nogender<-ifelse(is.na(teens$gender),1,0)
table(teens$gender,useNA='ifany')
table(teens$female,useNA='ifany')
table(teens$nogender,useNA='ifany')

#quiz1
#졸업연도별 나이 평균 출력하기
str(teens)
#1.array
with(teens,tapply(age,gradyear,mean,na.rm=T))
#2.tibble
library(dplyr)
teens %>% 
  group_by(gradyear) %>% 
  summarize(age.mean=mean(age,na.rm=T))
#3.dataframe
with(teens,aggregate(age,list(gradyear),mean,na.rm=T))

#4.ave(data,group,func)
ave_age<-ave(teens$age,teens$gradyear,FUN=
               function(x) mean(x,na.rm=T))

#결측값 대체
#teens$age<-ifelse(is.na(teens$age),함수호출,teens$age)
teens$age<-ifelse(is.na(teens$age),ave_age,teens$age)
summary(teens$age)


#====================================================
#표준화vs정규화 어떤 상황??
interests<-teens[5:40]
interests_z<-as.data.frame(lapply(interests,scale))
interests_z

set.seed(2345)
teen_clusters<-kmeans(interests_z, 5)
teen_clusters
teen_clusters$size
teen_clusters$centers
teen_clusters$cluster

#각 클러스터 내의 데이터간 거리 제곱의 합
#그룹내의 동질성을 파악할 수 있음, 작을 수록 좋음
teen_clusters$withinss 
teen_clusters$tot.withinss

#그룹 간 중심의 거리 제곱합
#그룹간의 이질성 파악, 클수록 좋음
teen_clusters$betweenss

#K-means clustering with 5 clusters of sizes
# 21001, 947, 2232, 3900, 1920
# 인원이 적은 그룹이 특성이 강력할 확률이 있다.
# Cluster means 해석
# 모든 열을 표준화를 했기 때문에 평균이 0임
# mean이 0이 넘으면 그 그룹은 전체 평균보다 
# 특정 열을 많이 언급했다고 해석할 수 있음
# 이 경우에는 해석 차원에서 표준화가 더 유리함


teens$cluster<-teen_clusters$cluster

#클러스터 나이의 평균
aggregate(data=teens,age ~ cluster,mean)
aggregate(data=teens,female ~ cluster,mean)
aggregate(data=teens,friends ~ cluster,mean)

