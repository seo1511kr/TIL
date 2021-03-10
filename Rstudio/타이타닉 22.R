train<-read.csv('data/train.csv',na.strings = '')
test<-read.csv('data/test.csv',na.strings='')
str(train)
head(train)
#전처리===========================================================
# 결측치 (Cabin, Age, Embarked)
library(Amelia)
missmap(train,col = c('red','blue'))
missmap(test,col = c('red','blue'))

library(ggplot2)
library(GGally)
ggcorr(train,nbreaks = 5,label = T)
ggcorr(test,nbreaks = 5,label = T)


# [1] "PassengerId" "Survived"    "Pclass"      "Name"        "Sex"         "Age"         "SibSp"       "Parch"       "Ticket"      "Fare"       
#[11] "Cabin"       "Embarked"   
names(train)


ggcorr(train,nbreaks = 5,label = T) #Sex, Pclass, Fare가 상관관계가 높게 나옴

# 성별 1,0으로 변환
train$Sex<-ifelse(train$Sex=='female',1,0)
test$Sex<-ifelse(test$Sex=='female',1,0)

# Fare 범주화(quartile별로 1,2,3,4)
splits<-summary(train$Fare)
train$Farecat<-as.numeric(with(train,cut(Fare,breaks=splits[-3],include.lowest=T,labels=c(1,2,3,4))))
splits<-summary(test$Fare)
test$Farecat<-as.numeric(with(test,cut(Fare,breaks=splits[-c(3,7)],include.lowest=T,labels=c(1,2,3,4))))


# feature별 생존률 차이 살펴보기
with(train,tapply(Survived,Sex,mean))
for (i in c('Sex','Pclass','Farecat')){
  print(tapply(train[['Survived']],train[[i]],mean))
}
# 0         1  (성별)
# 0.1889081 0.7420382 
# 1         2         3 (Pclass)
# 0.6296296 0.4728261 0.2423625 
# 1         2         3         4 (Fare(범주형))
# 0.1973094 0.3789238 0.2727273 0.5971564 





#Fare, Pclass 정규화
makenormal<-function(target){
  min<-min(target,na.rm=T)
  max<-max(target,na.rm=T)
  return((target-min)/(max-min))
  
}


train$Fare<-makenormal(train$Fare)
train$Pclass<-makenormal(train$Pclass)
test$Fare<-makenormal(test$Fare)
test$Pclass<-makenormal(test$Pclass)

# case1: 유클리디안 거리 (Sex, Pclass, Fare)
features=c('Sex','Pclass','Fare')
y=c('Survived')
train_xy<-train[c(features,y)]

#사전 정확도 검증을 위해 train, test 셋 분리(7대3)
testsplit<-function(x){
num_data<-nrow(x)
train_idx<-sample(1:num_data,num_data*0.7)
test_xy<<-x[-train_idx,]
train_xy<<-x[train_idx,]
}
testsplit(train_xy)
str(test_xy)
str(train_xy)


#각 샘플별 유클리디안 거리가 유사한 top N개의 데이터의 y의 평균(반올림)값을 뽑아내는 함수
Udist_Nth<-function(test,train,features,y,N){
  predict<<-c()
  for(i in 1:nrow(test[features])){
    idx<-order(colSums((t(train[features])-t(test[features])[,i])^2))[1:N]
    predict<<-c(predict,round(mean(train[idx,y])))
  }
  return(predict)
}

test_xy$Predict<-Udist_Nth(test_xy,train_xy,features,y,5)
sum(test_xy$Survived==test_xy$Predict)/length(test_xy$Survived==test_xy$Predict)


#무작위 샘플 20회로 테스트 해보기
for(sampleset in 1:20){
  features=c('Sex','Pclass','Fare')
  y=c('Survived')
  train_xy<-train[c(features,y)]
  testsplit(train_xy)
 
  predict<-c()
  for(i in 1:nrow(test_xy[features])){
    idx<-order(colSums((t(train_xy[features])-t(test_xy[features])[,i])^2))[1:5]
    predict<-c(predict,round(mean(train_xy[idx,y])))
  }
  test_xy$Predict<-predict
  
  scores<-c()
  scores<-c(scores,sum(test_xy$Survived==test_xy$Predict)/length(test_xy$Survived==test_xy$Predict))
}

mean_20scores<-mean(scores)
mean_20scores#[1] 0.7873134


#test파일 예측하기
test$Survived<-Udist_Nth(test,train,features,y,5)
str(test)

submission<-test[c('PassengerId','Survived')]
View(submission)

#submission파일 만들기
write.csv(submission,paste('data/',as.character(mean_20scores),'.csv',sep=''),row.names = F)



# case2.각 범주형feature 값으로 해당 값을 갖는 그룹의 평균 생존률을 넣어서 구해보기

features=c('Sex','Pclass','Fare')
y=c('Survived')
train_xy<-train[c(features,y)]


with(train_xy,tapply(Survived,Sex,mean))['0']
with(train_xy,tapply(Survived,Pclass,mean))['0.0']
with(train,tapply(Survived,Farecat,mean))
for(i in unique(train_xy$Sex)){
  train_xy$Sex[train_xy$Sex==i]<-with(train_xy,tapply(Survived,Sex,mean))[as.character(i)]
}

unique(train_xy$Pclass)
for(i in c(0,0.5,1)){
  train_xy$Pclass[train_xy$Pclass==i]<-with(train_xy,tapply(Survived,Sex,mean))[as.character(i)]
}
for(i in unique(train$Farecat)){
  train_xy$Farecat[train$Farecat==i]<-with(train,tapply(Survived,Sex,mean))[as.character(i)]
}
str(train_xy)
testsplit(train_xy)
features=c('Sex','Pclass','Farecat')
test_xy$Predict<-Udist_Nth(test_xy,train_xy,features,y,5)
sum(test_xy$Survived==test_xy$Predict)/length(test_xy$Survived==test_xy$Predict)


#sampling20회 검증
for(sampleset in 1:20){
  features=c('Sex','Pclass','Fare')
  y=c('Survived')
  train_xy<-train[c(features,y)]
  
  
  with(train_xy,tapply(Survived,Sex,mean))['0']
  with(train_xy,tapply(Survived,Pclass,mean))['0.0']
  with(train,tapply(Survived,Farecat,mean))
  for(i in unique(train_xy$Sex)){
    train_xy$Sex[train_xy$Sex==i]<-with(train_xy,tapply(Survived,Sex,mean))[as.character(i)]
  }
  
  unique(train_xy$Pclass)
  for(i in c(0,0.5,1)){
    train_xy$Pclass[train_xy$Pclass==i]<-with(train_xy,tapply(Survived,Sex,mean))[as.character(i)]
  }
  for(i in unique(train$Farecat)){
    train_xy$Farecat[train$Farecat==i]<-with(train,tapply(Survived,Sex,mean))[as.character(i)]
  }
  
  testsplit(train_xy)
  features=c('Sex','Pclass','Farecat')
  test_xy$Predict<-Udist_Nth(test_xy,train_xy,features,y,5)
  scores<-c()
  scores<-c(scores,sum(test_xy$Survived==test_xy$Predict)/length(test_xy$Survived==test_xy$Predict))
}
mean_20scores<-mean(scores)
mean_20scores#[1] 0.630597

# =================================================================
#case3 Age 추가( Age 예측 <- Fare, Pclass)
str(train)
str(test)

features=c('Sex','Pclass','Fare')
y=c('Survived')
train_xy<-train[c(features,y)]

#1.Age 살펴보기
splits<-summary(train$Age)
train$Agecat<-with(train,cut(Age,breaks=c(0,14,80),labels=c(1,2),include.lowest=T))
with(train,tapply(Survived,Agecat,mean))

test[is.na(test$Age),]
nrow(test[is.na(test$Age),]) #Age 결측값
ggcorr(test,nbreaks = 5,label = T) #Age 예측 Pclass, Fare

missmap(test,col=c('red','blue')) 
#fare 결측값1개 먼저 예측(Pclass별 평균)
test$Fare[is.na(test$Fare)]<-mean(test$Fare[test$Pclass==test$Pclass[is.na(test$Fare)]],na.rm=T)

# Age 예측
features=c('Pclass','Fare')
y=c('Age')

trainAge<-train[!is.na(train$Age),]
testAge<-train[is.na(train$Age),]

AgePredict<-Udist_Nth(testAge,trainAge,features,y,5)
train$Age[is.na(train$Age)]<-AgePredict


features=c('Sex','Pclass','Fare','Age')
y=c('Survived')
train_xy<-train[c(features,y)]




trainAge<-test[!is.na(test$Age),]
testAge<-test[is.na(test$Age),]

AgePredict<-Udist_Nth(testAge,trainAge,features,y,5)
test$Age[is.na(test$Age)]<-AgePredict




for(sampleset in 1:20){
  features=c('Sex','Pclass','Fare','Age')
  y=c('Survived')
  train_xy<-train[c(features,y)]
  testsplit(train_xy)
  

  test_xy$Predict<-Udist_Nth(test_xy,train_xy,features,y,5)
  
  scores<-c()
  scores<-c(scores,sum(test_xy$Survived==test_xy$Predict)/length(test_xy$Survived==test_xy$Predict))
}
mean_20scores<-mean(scores)
mean_20scores#0.7537313


#case4. cabin 활용
train$Cabin[!is.na(train$Cabin)]<-substr(train$Cabin[!is.na(train$Cabin)],1,1)
train$Cabin


test$Cabin[!is.na(test$Cabin)]<-substr(test$Cabin[!is.na(test$Cabin)],1,1)
test$Cabin

# cabin 예측(Pclass,Fare,SibSp+Parch)
features<-c('Pclass','Fare','Age','Sex')
y<-c('Cabin')
total<-rbind(train[c(features,y)],test[c(features,y)])
str(total)
head(total)
sum(!complete.cases(total))

with(train,tapply(Survived,Cabin,mean))
with(train,tapply(Survived,Cabin,length))
with(total,tapply(Pclass,Cabin,length))

sort(with(total,tapply(Pclass,Cabin,mean)),decreasing = T)
sort(with(total,tapply(Fare,Cabin,mean)))

with(test,tapply(Pclass,Cabin,mean))

Udist_Nth_mode<-function(test,train,features,y,N){
  predict<<-c()
  for(i in 1:nrow(test[features])){
    idx<-order(colSums((t(train[features])-t(test[features])[,i])^2))[1:N]
    predict<<-c(predict,names(table(train[idx,y]))[order(table(train[idx,y]),decreasing = T)][[1]])
  }
  return(predict)
}


testCabin<-total[is.na(total$Cabin),]
trainCabin<-total[!is.na(total$Cabin),]


CabinPredict<-Udist_Nth_mode(testCabin,trainCabin,features,y,5)
total$Cabin[is.na(total$Cabin)]<-CabinPredict

train$Cabin<-total$Cabin[1:nrow(train)]
test$Cabin<-total$Cabin[-c(1:nrow(train))]


with(train,tapply(Survived,Cabin,mean))
with(train,tapply(Pclass,Cabin,mean))
with(train,tapply(Survived,Cabin,length))
#평균Pclass 대비 평균 생존률을 cabin값 대체
t=with(train,tapply(Survived,Cabin,mean))/with(train,tapply(Pclass,Cabin,mean))
t[['T']]=0

for(i in unique(train$Cabin)){
  train$Cabin[train$Cabin==i]<-t[[i]]
}
for(i in unique(test$Cabin)){
  test$Cabin[test$Cabin==i]<-t[[i]]
}
test$Cabin<-as.numeric(test$Cabin)
train$Cabin<-as.numeric(train$Cabin)
#Cabin 값 정규화
train$Cabin<-makenormal(train$Cabin)
test$Cabin<-makenormal(test$Cabin)

#sampling20번 검증
for(sampleset in 1:20){
  features=c('Sex','Pclass','Fare','Age','Cabin')
  y=c('Survived')
  train_xy<-train[c(features,y)]
  testsplit(train_xy)
  
  
  test_xy$Predict<-Udist_Nth(test_xy,train_xy,features,y,5)
  
  scores<-c()
  scores<-c(scores,sum(test_xy$Survived==test_xy$Predict)/length(test_xy$Survived==test_xy$Predict))
}
mean_20scores<-mean(scores)
mean_20scores #0.7947761

#test파일 예측하기
features=c('Sex','Pclass','Fare','Age','Cabin')
y=c('Survived')
test$Survived<-Udist_Nth(test,train,features,y,5)
submission<-test[c('PassengerId','Survived')]
View(submission)
#submission파일 만들기
write.csv(submission,paste('data/',as.character(mean_20scores),'.csv',sep=''),row.names = F)


str(train)


#결론: test파일에 결측치가 많은 feature는 활용하지 않는 것이 좋아보임.


