# 1. iris 데이터에 대해 knn 적용하여 분류 모델 작성
# -set.seed(1234)로 통일할 것
# -iris 데이터를 7:3의 비율로 나눈다(sample함수 적용)
# -트레인 데이터로 knn 모델 생성
# -테스트 데이터로 테스트(타깃 컬럼 : species)
data(iris)
str(iris)
set.seed(1234)
#표준화
iris_n<-as.data.frame(scale(iris[-5]))
sample_idx<-sample(1:nrow(iris),nrow(iris)*0.2)
iris_train<-iris_n[-sample_idx,]
iris_test<-iris_n[sample_idx,]

train_labels<-iris[-sample_idx,5]
test_labels<-iris[sample_idx,5]

library(class)

scores<-c()
for(i in seq(1,25,2)){
test_predict<-knn(train=iris_train,test = iris_test,
                  cl=train_labels,k=i)
scores=c(scores,sum(test_predict==test_labels)/length(test_labels))
}
max(scores)
seq(1,25,2)[which.max(scores)]

# 2. 타이타닉 문제에 다양한 조건식 적용(오전)
# #연습문제 마지막 문제
# #생존 조건식 : 성별, 나이(구간별), 승선항구, 운임
# 
# #생존여부판단 조건식: w1*성별+w2*운임+w3*나이+w4*항구=결과값 >임계치=>생존, 아니면 사망


train<-read.csv('data/train.csv',na.string='')
test<-read.csv('data/test.csv',na.string='')

str(train)
str(test)

#결측치
#cabin, age, embarked, Fare 결측, cabin은 결측이 너무 많으니 버림
library(Amelia)
missmap(train,col=c('red','blue')) 
missmap(test,col=c('red','blue'))

library(ggplot2)
library(GGally)

#상관관계 살펴보기
# 성별 수량변수로 변화
train$Sex<-ifelse(train$Sex=='female',1,0)
test$Sex<-ifelse(test$Sex=='female',1,0)


#feature engineering

#결측값 예측
ggcorr(train,nbreaks=5,label = T) # Age<- Pclass,SibSp
sum(is.na(train$Pclass))
sum(is.na(train$SibSp))
sum(is.na(train$Fare))

sum(is.na(test$Pclass))
sum(is.na(test$SibSp))
sum(is.na(test$Fare))

#test$Fare -> Pclass,성별 별 평균 fare로 대체
keys<-test[is.na(test$Fare),c('Pclass','Sex')]
P<-keys[[1]]
S<-as.character(keys[[2]])
test$Fare[is.na(test$Fare)]<-as.data.frame(with(test,tapply(Fare,list(Pclass,Sex),mean,na.rm=T)))[P,S]

str(test)
#동승자 여부 범주화
train$family<-train$Parch+train$SibSp
test$family<-test$Parch+test$SibSp

train$family<-ifelse(train$family==0,0,1)
test$family<-test$Parch+test$SibSp

#Age=> 범주화 pclass,성별,fare별 평균
train$Age<-ifelse(train$Age<13,0,1)
test$Age<-ifelse(test$Age<13,0,1)

with(train,tapply(Age,list(Pclass,Sex,family),mean,na.rm=T))

normalize<-function(x){
  return((x-min(x,na.rm=T))/(max(x,na.rm=T)-min(x,na.rm=T)))
}

str(train)
train_n<-as.data.frame(sapply(train[c('Pclass','Sex','Age','Fare','family')],normalize))
test_n<-as.data.frame(sapply(test[c('Pclass','Sex','Age','Fare','family')],normalize))
str(test)


set.seed(1234)
train_age_model=train_n[!is.na(train_n$Age),]
sample_idx<-sample(1:nrow(train_age_model),nrow(train_age_model)*0.2)

train_train_age=train_age_model[-sample_idx,-3]
train_test_age=train_age_model[sample_idx,-3]

train_age_label=train_age_model[-sample_idx,3]
test_age_label=train_age_model[sample_idx,3]

train_age_predict<-knn(train=train_train_age,test = train_test_age,
                       cl=train_age_label,k=5)
sum(train_age_predict==test_age_label)/length(test_age_label)
# [1] 0.8802817: 범주형 age predict score


#범주형age 예측======================================================================
total_n=rbind(train_n,test_n)
str(total_n)


train_age<-total_n[!is.na(total_n$Age),-3]
str(train_age)
test_age<-total_n[is.na(total_n$Age),-3]
str(test_age)

train_age_label<-total_n[!is.na(total_n$Age),3]
str(train_age_label)

age_predict<-knn(train = train_age,test=test_age,
                 cl=train_age_label,k=5)

total_n[is.na(total_n$Age),]<-age_predict

newtrain<-total_n[1:nrow(train),]


newtest<-total_n[892:nrow(total_n),]
newtest$family<-ifelse(newtest$family==0,0,1)
newtrain<-as.data.frame(sapply(newtrain,as.numeric))
newtest<-as.data.frame(sapply(newtest,as.numeric))
str(newtrain)
str(newtest)

#train set분리=================================================================
set.seed(1234)
sample_idx<-sample(1:nrow(train),nrow(train)*0.2)
train_train<-newtrain[-sample_idx,]
train_test<-newtrain[sample_idx,]

train_train_labels<-train$Survived[-sample_idx]
train_test_labels<-train$Survived[sample_idx]

#=============================================================================
#범주형 특성 별 생존률 차이 살펴보기
str(newtrain)
str(newtest)
newtrain$Survived<-train$Survived
with(newtrain,tapply(Survived,list(Sex,Age),mean))#남자중에 가족이 있고 어린 남자는 살 확률이 높음
with(newtrain,tapply(Survived,list(Sex,family),mean))
with(newtrain,tapply(Survived,list(Sex,Pclass),mean)) #3등칸에 탄 여자는 죽었을 확률이 높음

#===============================================================================
#Sex 
train_predict<-with(train_test,ifelse(Sex==1,1,0))
sum(train_predict==train_test_labels)/length(train_test_labels)

#Sex Pclass만 고려
train_predict<-with(train_test,ifelse(Sex==1,ifelse(Pclass==3,0,1),0))
sum(train_predict==train_test_labels)/length(train_test_labels)

#Sex, Pclass, family,age고려
train_predict<-with(train_test,ifelse(Sex==1,ifelse(Pclass==3,0,1),ifelse(family==1&Age==0,1,0)))
sum(train_predict==train_test_labels)/length(train_test_labels)


#=============================================================================
#test파일 예측
str(test)
#Sex   0.76555
test_predict<-with(test,ifelse(Sex==1,1,0))
submis<-data.frame(PassengerID=test$PassengerId,Survived=test_predict)
write.csv(submis,'data/Sex.csv',row.names = F)

#Sex Pclass만 고려 0.77511
test_predict<-with(test,ifelse(Sex==1,ifelse(Pclass==3,0,1),0))
submis<-data.frame(PassengerID=test$PassengerId,Survived=test_predict)
write.csv(submis,'data/SexPclass.csv',row.names = F)

#Sex, Pclass, family,age고려 0.76794
test_predict<-with(test,ifelse(Sex==1,ifelse(Pclass==3,0,1),ifelse(family==1&Age==0,1,0)))
submis<-data.frame(PassengerID=test$PassengerId,Survived=test_predict)
write.csv(submis,'data/SexPclassFamilyAge.csv',row.names = F)


# 3. 타이타닉 문제에 대해 knn 적용
set.seed(1234)
sample_idx<-sample(1:nrow(train),nrow(train)*0.2)
train_train<-newtrain[-sample_idx,]
train_test<-newtrain[sample_idx,]
str(train_train)
str(train_test)

train_train_labels<-newtrain$Survived[-sample_idx]
train_test_labels<-newtrain$Survived[sample_idx]

train_predict<-knn(train = train_train[-6],test=train_test[-6],
                   cl=train_train_labels,k=5)

sum(train_predict==train_test_labels)/length(train_test_labels)
#[1] 0.758427


str(newtrain)
str(newtest)

str(newtrain[-6])
train_labels=newtrain[,'Survived']

PassengerId<-read.csv('data/test.csv',na.string='')
PassengerId<-PassengerId$PassengerId
test_predict<-knn(train = newtrain[-6],test = newtest,
                  cl=train_labels,k=5)
submis<-data.frame(PassengerId,Survived=test_predict)
write.csv(submis,'data/KNNSexPclassFamilyAge.csv',row.names = F)



