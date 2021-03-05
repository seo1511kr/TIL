# 1.train.csv와 test.csv 불러오기
# 2.train.csv 전처리
# 
# 모델링
# 1. 조건문 기반으로(rule based) 예측 모델 생성
# ex1) if Sex==male then 사망
#     else then 생존

train<-read.csv('data/train.csv',na.strings = '')
test<-read.csv('data/test.csv',na.strings = '')

str(train)



#테스트 셋 쪼개기
set.seed(2022)
train_idx<-sample(1:nrow(train),nrow(train)*0.7)
train_train=train[train_idx,]
train_test=train[-train_idx,]



predict<-with(train_test,ifelse(Sex=='female',1,0))
predict

#=============================================================
#성별모델
#정확도
1-sum((train_test$Survived-predict)^2)/length(predict)

test<-read.csv('data/test.csv',na.strings = '')
str(test)

#예측
predict<-with(test,ifelse(Sex=='female',1,0))
submis<-test[c('PassengerId')]
submis$Survived<-predict
#submission
write.csv(submis,'data/gender_sub.csv',row.names = F)


#==============================================================
#유클리디안 거리 활용(정규화 필수)

train<-read.csv('data/train.csv',na.strings = '')
test<-read.csv('data/test.csv',na.strings = '')

str(train)
#결측치 찾기
library(Amelia)
missmap(train,col=c('red','blue'))
# Cabin, Age, Embarked
# Embarked는 큰 영향이 없을 것 같음
with(train,tapply(Survived,Embarked,mean))
with(train,tapply(Survived,Cabin,mean))

#중복값 x
sum(duplicated(train))


head(train)

#성별 변수 수량화
train<-within(train,Sex<-ifelse(Sex=='female',1,0))
test<-within(test,Sex<-ifelse(Sex=='female',1,0))

#변수별 상관관계 파악
library(ggplot2)
library(GGally)
ggcorr(train,nbreaks=5,label = T)

# ============================================================
#모델2.
# features=c('Age','Sex'), 유클리디안 거리
# score: 0.54


# 결측값 제거, 정규화
features=c('Age','Sex')
labelY=c('Survived')
model2<-train[c(labelY,features)]

#age 결측치 제거
model2<-model2[complete.cases(model2),]

str(model2)

#test파일 feature 결측값 확인 및 예측
str(test)
test[!complete.cases(test[features]),c('Age','Sex','Pclass','SibSp')]

#Pclass, Fare 가 age랑 상관관계가 높음
# 저 두 변수로 예측
ggcorr(test,nbreaks = 5,label = T)

#Fare값 범주화 quartile로 4등분
summary(test$Fare)[-c(4,7)]
Farecut<-with(test,cut(Fare,breaks=summary(test$Fare)[-c(4,7)],include.lowest=T,labels=c(1,2,3,4)))
test$Farecut<-Farecut
table(Farecut)

# 총 12개의 집단이 생김
# 각 집단별 age 평균값 구하기
with(test,tapply(Age,list(Pclass,Farecut),mean,na.rm=T))
age_pred=with(test,tapply(Age,list(Pclass,Farecut),mean,na.rm=T))
ageNA=test[is.na(test$Age),]


#age 결측치 집단별 평균치로 채워넣기
for(i in 1:sum(is.na(test$Age))){
  ageNA$Age[i]=age_pred[ageNA$Pclass[i],ageNA$Farecut[i]]
}
test$Age[is.na(test$Age)]<-ageNA$Age


sub_test<-test[features]


#age,정규화
min<-min(model2$Age)
max<-max(model2$Age)
summary(model2$Age)
model2$Age<-(model2$Age-min)/(max-min)

min<-min(sub_test$Age)
max<-max(sub_test$Age)
summary(sub_test$Age)


$Age<-(sub_test$Age-min)/(max-min)

#test,train 분리
splitTest<-function(model){
set.seed(20)
train_idx<-sample(1:nrow(model),nrow(model)*0.7)
train_model<<-model[train_idx,]
test_model<<-model[-train_idx,]
}
splitTest(model2)
nrow(model2)
nrow(test_model)
nrow(train_model)

#예측 함수 만들기

prediction<-function(x,y,features,ylabel){

  predict_test=c()
  for(i in 1:nrow(x)){
    Utop5_idx<-order(colSums((t(y[features])-t(x[features])[i])^2))[1:5]
    print(y[Utop5_idx,ylabel])
    predict_test=c(predict_test,round(mean(y[Utop5_idx,ylabel])))
      
  }
  return(predict_test)
}

test_model$predict<-prediction(test_model,train_model,features,'Survived')
#score함수 만들기
score<-function(testset){
  sum(testset$Survived==testset$predict)/nrow(testset)
}

#정확도 파악하기
score(test_model)
cscore=as.character(score(test_model))


#submission파일 만들기
prediction(sub_test,model2[c(labelY,features)],features,'Survived')
submis=data.frame(test$PassengerId,prediction(sub_test,model2[c(labelY,features)],features,'Survived'))
str(train)
colnames(submis)<-c('PassengerId','Survived')
str(submis)
write.csv(submis,paste('data/',cscore,'.csv',sep=''),row.names = F)

#=============================================

#모델3. features=c('Age','Sex','Pclass','Fare','SibSp','Parch')
#score:o.61


#feature 결측치 확인
sum(is.na(test$Sex))
sum(is.na(test$Age))
sum(is.na(test$Pclass))
sum(is.na(test$Fare)) #결측값 1개 대체
sum(is.na(test$SibSp))
sum(is.na(test$Parch))

str(test)

features=c('Age','Sex','Pclass','Fare','SibSp','Parch')
y=c('Survived')
std<-function(x){
  min=min(x,na.rm=T)
  max=max(x,na.rm=T)
  return((x-min)/(max-min))
}

for(i in features){
  test[i]<-std(test[i])
}

head(test[features])


#train features 정규화

for(i in features){
  train[i]<-std(train[i])
}

model3<-train[c(features,y)]
model3[complete.cases(model3),]
splitTest(model3)
test_model$predict<-prediction(test_model,train_model,features,'Survived')
test_model
score(test_model)
cscore=as.character(score(test_model))


#testset feature 결측치 예측========================
#1. age
# Pclass, Fare 가 age랑 상관관계가 높음
# 저 두 변수로 예측
ggcorr(test,nbreaks = 5,label = T)

#Fare값 범주화 quartile로 4등분
summary(test$Fare)[-c(4,7)]
Farecut<-with(test,cut(Fare,breaks=summary(test$Fare)[-c(4,7)],include.lowest=T,labels=c(1,2,3,4)))
test$Farecut<-Farecut
table(Farecut)

# 총 12개의 집단이 생김
# 각 집단별 age 평균값 구하기
with(test,tapply(Age,list(Pclass,Farecut),mean,na.rm=T))
age_pred=with(test,tapply(Age,list(Pclass,Farecut),mean,na.rm=T))
ageNA=test[is.na(test$Age),]


#age 결측치 집단별 평균치로 채워넣기
for(i in 1:sum(is.na(test$Age))){
  ageNA$Age[i]=age_pred[ageNA$Pclass[i],ageNA$Farecut[i]]
}
test$Age[is.na(test$Age)]<-ageNA$Age



#2. Fare
test[!complete.cases(test[features]),features]
features[4]
features[-4]
naTest<-test[!complete.cases(test[features]),features[-4]]
naTrain<-test[complete.cases(test[features]),features]
test[!complete.cases(test[features]),features[4]]<-prediction(naTest,naTrain,features[-4],'Fare')

#testset 예측
submis=data.frame(test$PassengerId,prediction(test[features],model3[c(y,features)],features,y))


#submission파일 만들기
colnames(submis)<-c('PassengerId','Survived')
str(submis)
write.csv(submis,paste('data/',cscore,'.csv',sep=''),row.names = F)


# =================================================================
# 모델4: 

train<-read.csv('data/train.csv',na.strings = '')
test<-read.csv('data/test.csv',na.strings = '')

train<-within(train,Sex<-ifelse(Sex=='female',1,0))
test<-within(test,Sex<-ifelse(Sex=='female',1,0))
str(train)
str(test)
# 데이터 구조 파악


library(Amelia)
missmap(train,col=c('red','blue'))
missmap(test,col=c('red','blue'))


# 탐색적 데이터 분석
library(ggplot2)
library(GGally)
ggcorr(train,label = T, nbreaks = 5)


#cabin 앞자리 알파벳으로 변화
cabin_idx<-!is.na(train$Cabin)
train$Cabin[cabin_idx]
train$Cabin[cabin_idx]<-substr(train$Cabin[cabin_idx],1,1)

cabin_idx<-!is.na(test$Cabin)
test$Cabin[cabin_idx]
test$Cabin[cabin_idx]<-substr(test$Cabin[cabin_idx],1,1)

#
with(train,tapply(Survived,Cabin,mean))
with(train,tapply(Pclass,Cabin,mean))

# 선실별 생존률/선실별 평균 등급 =>
# 평균 등급에  비해 높은 생존률을 보이는 선실이 유리하다고 생각함.
sort(with(train,tapply(Survived,Cabin,mean))/with(train,tapply(Pclass,Cabin,mean)))
levelCabin=names(sort(with(train,tapply(Survived,Cabin,mean))/with(train,tapply(Pclass,Cabin,mean))))
?as.factor
train$Cabin<-as.numeric(factor(train$Cabin,ordered=T,levels =levelCabin,labels = 1:8) )
test$Cabin<-as.numeric(factor(test$Cabin,ordered=T,levels =levelCabin,labels = 1:8) )
str(train)



# 별 상관관계를 못찾겠음
total=rbind(train[-2],test)
total[!is.na(total$Cabin),c('Cabin','Ticket','Fare','Embarked')]


#Age, Fare 범주화
summary(total$Age)[c(-4,-7)]
Agecut<-with(total,cut(Age,breaks=summary(total$Age)[c(-4,-7)],labels=c(1,2,3,4),include.lowest=T))
total$Agecut<-as.numeric(Agecut)


summary(total$Fare)[c(-4,-7)]
Farecut<-with(total,cut(Fare,breaks=summary(total$Fare)[c(-4,-7)],labels=c(1,2,3,4),include.lowest=T))
total$Farecut<-as.numeric(Farecut)


# Age먼저 예측하고 Pclass 예측하기

sum(is.na(total$Age))
sum(is.na(total$Cabin))


sum(is.na(total$Fare))
sum(is.na(total$Pclass))
sum(is.na(total$Parch))
sum(is.na(total$SibSp))

#Farecut예측========================================================
x=c('Pclass','Parch','SibSp')
y=c('Farecut')
data=total[c(x,y)]

# features 정규화
for(i in x){
  data[i]<-std(data[i])
}


data_train=data[!is.na(total$Farecut),]
data_test=data[is.na(total$Farecut),x]

total$Farecut[is.na(total$Farecut)]<-prediction(data_test,data_train,x,y)




#Agecut예측==================================================================
x=c('Fare','Pclass','Parch','SibSp')
y=c('Agecut')
data=total[c(x,y)]

# features 정규화
for(i in x){
  data[i]<-std(data[i])
}


data_train=data[!is.na(total$Agecut),]
data_test=data[is.na(total$Agecut),x]

total$Agecut[is.na(total$Agecut)]<-prediction(data_test,data_train,x,y)


#Cabin예측==================================================================
x=c('Fare','Pclass','Parch','SibSp','Age')
y=c('Cabin')
data=total[c(x,y)]

# features 정규화
for(i in x){
  data[i]<-std(data[i])
}


data_train=data[!is.na(total$Cabin),]
data_test=data[is.na(total$Cabin),x]

total$Cabin[is.na(total$Cabin)]<-prediction(data_test,data_train,x,y)

#========================================================
str(total)


#Survived예측
x=c('Farecut','Pclass','Agecut','Cabin','Sex','Parch')
y=c('Survived')
ntr=nrow(train)

train4=cbind(total[1:ntr,],train$Survived)
str(train4)
library(dplyr)
train4=rename(train4,'Survived'='train$Survived')
test4=total[-(1:ntr),]
str(test4)


with(train4,tapply(Survived ,list(Sex,Cabin,Pclass),mean))
with(train4,tapply(Survived ,list(Sex,Cabin,Pclass),length))

data=train4[c(x,y)]
summary(data)


test4$predict<-ifelse(test4$Sex==1,1,0)
test4$predict<-ifelse(test4$Sex==1&test4$Pclass==3&test4$Cabin==5,0,1)

# features 정규화

splitTest(data)
test_model
train_model

test_model$predict<-ifelse(test_model$Sex==1,1,0)

score(test_model) #[1] 0.5530726
cscore<-as.character(score(test_model))
#========================================================================================
#testset 예측
test4$Survived<-prediction(test4,train4,x,y)
str(test4)


#submission
submis=test4[c('PassengerId','Survived')]
str(submis)
write.csv(submis,paste('data/',cscore,'.csv',sep=''),row.names = F)




# 재난메시지-> 단어 단위로 분할-> 표에 작성->

