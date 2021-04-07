# 1.mpg 데이터를 이용해서 분석 문제를 해결해 보세요.
# mpg 데이터 원본에는결측치가 없습니다. 우선 mpg 데이터를 불러와 몇 개의 값을 결측치로 만들겠습니다. 
# 아래 코드를 실행하면 다섯 행의 hwy 변수에 NA가 할당됩니다.
mpg <- as.data.frame(ggplot2::mpg) # mpg 데이터 불러오기
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA # NA 할당하기

# Q1. drv(구동방식)별로 hwy(고속도로 연비) 평균이 어떻게 다른지 알아보려고 합니다. 분석을 하기 전에
# 우선 두 변수에 결측치가 있는지 확인해야 합니다. drv 변수와 hwy 변수에 결측치가 몇 개 있는지
# 알아보세요.
mpg[!complete.cases(mpg),]
summary(mpg[c('drv','hwy')]) #hwy에만 5개
# Q2. filter()를 이용해 hwy 변수의 결측치를 제외하고, 어떤 구동방식의 hwy 평균이 높은지 알아보세요. 
# 하나의 dplyr 구문으로 만들어야 합니다.
library(dplyr)
mpg %>% 
  filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(hwy.mean=mean(hwy)) %>% 
  arrange(-hwy.mean)

# 2. mpg 데이터를 이용해서 분석 문제를 해결해 보세요.
# 우선 mpg 데이터를 불러와서 일부러 이상치를 만들겠습니다. drv(구동방식) 변수의 값은 4(사륜구동), 
# f(전륜구동), r(후륜구동) 세 종류로 되어있습니다. 몇 개의 행에 존재할 수 없는 값 k를 할당하겠습니다. 
# cty(도시 연비) 변수도 몇 개의 행에 극단적으로 크거나 작은 값을 할당하겠습니다.
mpg <- as.data.frame(ggplot2::mpg) # mpg 데이터 불러오기
mpg[c(10, 14, 58, 93), "drv"] <- "k" # drv 이상치 할당
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42) # cty 이상치 할당

# 이상치가 들어있는 mpg 데이터를 활용해서 문제를 해결해보세요.
# 구동방식별로 도시 연비가 다른지 알아보려고 합니다. 분석을 하려면 우선 두 변수에 이상치가 있는지
# 확인하려고 합니다.
# ??? Q1. drv 에 이상치가 있는지 확인하세요. 이상치를 결측 처리한 다음 이상치가 사라졌는지 확인하세요. 결측
# 처리 할 때는 %in% 기호를 활용하세요.
#1.
str(mpg)
outlier<-names(table(mpg$drv)/length(mpg$drv))[table(mpg$drv)/length(mpg$drv)<0.05] #이상치 전체 중 5프로가 안되는 비율 값
mpg$drv<-ifelse(mpg$drv %in% outlier,NA,mpg$drv) #결측처리
which(mpg$drv==outlier)

# ??? Q2. 상자 그림을 이용해서 cty 에 이상치가 있는지 확인하세요. 상자 그림의 통계치를 이용해 정상 범위를
# 벗어난 값을 결측 처리한 후 다시 상자 그림을 만들어 이상치가 사라졌는지 확인하세요.
library(ggplot2)
cty_box<-ggplot(mpg,aes(x=cty))+
  geom_boxplot()
str(cty_box)

cty_box2<-boxplot(mpg$cty)
str(cty_box2)
cty_box2$stats
outlier<-cty_box2$out
mpg$cty<-ifelse(mpg$cty %in% outlier,NA,mpg$cty)
sum(mpg$cty %in% outlier)

# ??? Q3. 두 변수의 이상치를 결측처리 했으니 이제 분석할 차례입니다. 이상치를 제외한 다음 drv 별로 cty
# 평균이 어떻게 다른지 알아보세요. 하나의 dplyr 구문으로 만들어야 합니다.

mpg %>% 
  filter(!is.na(drv),!is.na(cty)) %>% 
  group_by(drv) %>% 
  summarise(mean.cty=mean(cty))
  
# 3. kmeans를 이용하여 iris 데이터를 3개 그룹으로 나누어보세요
str(iris)
summary(iris)

# 표준화
iris[1:4]<-as.data.frame(sapply(iris[1:4],scale))
#클러스터링(kmeans)
set.seed(1234)
iris_cluster<-kmeans(iris[-5],3)

#클러스터링 평가
iris_cluster$tot.withinss
iris_cluster$betweenss

iris$cluster<-iris_cluster$cluster

#결과 해석
#1번 그룹 setosa일 확률이 높음, 2번 그룹은 versicolor, 3번 그룹은 virginica
with(iris,tapply(Species,cluster,table)) 

with(iris,tapply(Sepal.Length,cluster,summary))
with(iris,tapply(Sepal.Width,cluster,summary))
with(iris,tapply(Petal.Length,cluster,summary))
with(iris,tapply(Petal.Width,cluster,summary))


#+===============================================================================================
# 4. snsdata의 결측값을 적절하게 대체하여 kmeans를 적용해보세요

snsdata<-read.csv('data/snsdata.csv')
str(snsdata)

#결측치 살펴보기(age,gender)
library(Amelia)
dev.off()
missmap(snsdata,col=c('red','blue')) 

sum(is.na(snsdata$age)) #5086
sum(is.na(snsdata$gender)) #2724

#이상치 다루기 age
summary(snsdata[1:4])

dev.off()
par(mfrow=c(3,1))
plot(density(snsdata$age[!is.na(snsdata$age)]))
plot(density(snsdata$friends)) #긴 꼬리, 왼쪽으로 치우쳐짐,로그 취해보기
plot(density(log(snsdata$friends+1)))


dev.off()
par(mfrow=c(2,1))
age_box<-boxplot(snsdata$age)
friends_box<-boxplot(log(snsdata$friends+1))

age_box$stats
age_outlier<-age_box$out

friends_box$stats
friends_box$out #없음

#gradyear 원핫인코딩
for(i in unique(snsdata$gradyear)){
  newcol=paste('grad',as.character(i),sep='')
  snsdata[newcol]<-ifelse(snsdata$gradyear==i,1,0)
}


#age 이상치 na로 바꿔주기
snsdata$age<-ifelse(snsdata$age %in% age_outlier,NA,snsdata$age)

#gender
# 결측값이 있는 gender와 age를 제외하고 clustering
snsdata[4:40]<-as.data.frame(sapply(snsdata[4:40],scale))
str(snsdata[4:40])




#추측한 성별로 성별 결측치 채우기
#gender 수량화 여자:1 남자:0
snsdata$gender<-ifelse(snsdata$gender=='F',1,ifelse(snsdata$gender=='M',0,NA))

#+===============================================================================================
#1. knn으로 정확도:# 0.8018332
library(class)
str(snsdata)
gender_data<-snsdata[c(2,4:45)]
train<-gender_data[!is.na(gender_data$gender),]
test<-gender_data[is.na(gender_data$gender),]

#train, test set 분리
set.seed(1234)
end<-nrow(train)
sample_idx<-sample(1:end,end*0.2)
train_train<-train[-sample_idx,-1]
train_test<-train[sample_idx,-1]

train_train_labels<-train[-sample_idx,1]
train_test_labels<-train[sample_idx,1]

gender_predict<-knn(train_train,train_test,
                    cl=train_train_labels,k=5)

sum(gender_predict==train_test_labels)/length(gender_predict)# 0.8071494
#+===============================================================================================
#2.kmeans로 나눈 후 집단과 성별을 추가하여 세분화한 집단별 age 평균값
gender_data<-snsdata[c(1,2,5:40)]
str(gender_data)
set.seed(1234)
sns_cluster<-kmeans(gender_data[-c(1,2)],7)
gender_data$cluster1<-sns_cluster$cluster

sns_cluster$size
sns_cluster$tot.withinss #[1] 937288.7
sns_cluster$betweenss #[1] 172674.3

train<-gender_data[!is.na(gender_data$gender),]
test<-gender_data[is.na(gender_data$gender),]

set.seed(1234)
end<-nrow(train)
sample_idx<-sample(1:end,end*0.2)
train_train<-train[-sample_idx,]
train_test<-train[sample_idx,-2]

train_train_labels<-train[-sample_idx,2]
train_test_labels<-train[sample_idx,2]

#cluster & gradyear별 성별 비율로 성별 추측
#4번그룹만 남자의 비율이 높음
with(train_train,tapply(gender,list(cluster1,gradyear),mean,na.rm=T))
group4<-sns_cluster$centers[4,] #4번 집단이 특성 살펴보기
names(group4[group4>0]) #언급 평균 이상
names(group4[group4<=0]) #언급 평균 이하
trans<-round(with(train_train,tapply(gender,list(cluster1,gradyear),mean,na.rm=T)))


library(reshape2)
long_trans<-melt(trans)
colnames(long_trans)<-c('cluster1','gradyear','gender')

train_test<-left_join(train_test,long_trans,by=c('cluster1','gradyear'))
str(train_test)

# 0.8137489로 knn보다 0.01더 높게나옴
sum(train_test$gender==train_test_labels)/length(train_test_labels)


#kmeans & gradyear별 성별 비율로 결측값 채우기
str(test)
test<-left_join(test,long_trans,by=c('cluster1','gradyear'))
snsdata$gender[is.na(snsdata$gender)]<-test$gender.y
#+===============================================================================================
#age 값 대체(cluster,gender,gradyear 별 평균 age)
str(snsdata)
aggregate(data=snsdata,age ~ cluster1+gender+gradyear,length)
trans_age<-aggregate(data=snsdata,age ~ cluster1+gender+gradyear,mean)
snsdata<-left_join(snsdata,trans_age,by=c('cluster1','gender','gradyear'))
snsdata$age.x[is.na(snsdata$age.x)]<-snsdata$age.y[is.na(snsdata$age.x)]
snsdata$age.y<-NULL


# age 표준화
snsdata$age.x<-scale(snsdata$age.x)
sns_cluster2<-kmeans(snsdata[2:40],7)
sns_cluster2$tot.withinss#975818.7
sns_cluster2$betweenss#168471.9
sns_cluster2$size
sns_cluster2
snsdata$cluster2<-sns_cluster2$cluster

dev.off()
par(mfrow=c(2,2))
ggplot(snsdata,aes(cluster1,friends,col=factor(cluster1)))+
  geom_boxplot()+
  geom_abline(intercept = 0,slope = 0)
    
ggplot(snsdata,aes(cluster2,friends,col=factor(cluster2)))+
  geom_boxplot()+
  geom_abline(intercept = 0,slope = 0)

with(snsdata,tapply(friends,cluster1,mean))

str(snsdata)

install.packages("gridExtra")
library(gridExtra)
a<-ggplot(snsdata,aes(cluster1,fill=factor(gender)))+
  geom_bar()
b<-ggplot(snsdata,aes(cluster2,fill=factor(gender)))+
  geom_bar()

c<-ggplot(snsdata,aes(cluster1,fill=factor(gradyear)))+
  geom_bar()
d<-ggplot(snsdata,aes(cluster2,fill=factor(gradyear)))+
  geom_bar()
e<-ggplot(snsdata,aes(cluster2,fill=factor(cluster2)))+
  geom_bar()
grid.arrange(a,b,c,d,nrow=2,ncol=2)


