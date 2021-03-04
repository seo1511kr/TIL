# 1. Survived 열 요약
# - 생존자/사망자 전체 비율
# - 성별에 따른 생존자/사망자

train<-read.csv('data/train.csv',na.strings = "")
str(train)
summary(train)
head(train)

# 2. Pclass 열 요약
# - 등실 비율
table(train$Pclass)/nrow(train)

with(train,tapply(Pclass, Pclass, function(x)length(x)/nrow(train)))

aggregate(train$Pclass,list(train$Pclass),function(x) length(x)/nrow(train))
# - 등실에 따른 생존자/사망자 비율
proportions(with(train,tapply(Pclass, list(Pclass,Survived), length)),1)


# 3. Age 열
# - 나이대를 구분한 후, 각 나이대별 생존율

train$catAge<-with(train,cut(Age,breaks = c(0,10,20,30,40,50,60,max(train$Age,na.rm = T)),include.lowest = T))
proportions(with(train,tapply(Survived,list(catAge,Survived),length)),1)

# 4. Fare 열
# - 운임을 전체 5개 구간으로 분리한 후,
# 각 구간별 생존율
catFare<-with(train,cut(Fare,5,include.lowest=T))
train$catFare<-catFare

proportions(with(train,table(Survived,catFare)),2)

# 5. Name 열 
# - 호칭을 제외한 이름에서 자음과 모음의 비율

name2<-tolower(gsub(', .*[.]','',train$Name))
name2<-lapply(strsplit(name2,''),grep,pattern='[[:alpha:]]',value=T)
name3<-lapply(name2,function(x){
  a=table(ifelse(x %in% c('a','e','i','o','u'),'M','S'))
  as.vector(a)
}
)
name4<-as.data.frame(do.call(rbind,name3))
colnames(name4)<-c('Mnum','Snum')
train<-cbind(train,name4)
str(train)
train$Sex
proportions(apply(train[c('Mnum','Snum')],2,sum))

# - 성별에 따른 자음과 모음의 비율

name2<-tolower(gsub(', .*[.]','',train$Name))
name2<-lapply(strsplit(name2,''),grep,pattern='[[:alpha:]]',value=T)
name3<-lapply(name2,function(x){
  a=table(ifelse(x %in% c('a','e','i','o','u'),'M','S'))
  as.vector(a)
}
)
name4<-as.data.frame(do.call(rbind,name3))
colnames(name4)<-c('Mnum','Snum')
train<-cbind(train,name4)
str(train)
train$Sex
aggregate(train[c('Mnum','Snum')],list(train$Sex),sum)
name5<-aggregate(train[c('Mnum','Snum')],list(train$Sex),sum)
rownames(name5)<-name5$Group.1
name5$Group.1<-NULL
apply(name5,1,function(x) x/sum(x))
# 6. Embarked 열
# - 각 승선 항구별 생존율
apply(with(train,tapply(Survived,list(Embarked,Survived),length)),1,function(x) x/sum(x))


# 7. 캐글 가입
