#종교 유무와 이혼
#각 특성과 월급의 관계
#연령별 이혼
#연령별 선호 거주지

install.packages("foreign") # foreign 패키지 설치
library(foreign) # SPSS 파일 로드
library(dplyr) # 전처리
library(ggplot2) # 시각화
install.packages("readxl")
library(readxl) # 엑셀 파일 불러오기

#==============================================================================
#spss 파일 로드, to.data.frame=T 
welfare<-read.spss(file = "data/Koweps_hpc10_2015_beta1.sav"
          ,to.data.frame = T)
raw_welfare<-welfare
head(raw_welfare)
str(raw_welfare)

#==============================================================================
#엑셀파일 불러오기(sheet 여러개->excel_sheets()활용)
#한국복지패널 공공데이터

path<-'data/Koweps_Codebook.xlsx'
excel_sheets(path)# [1] "조사 설계서"          "직종 코드"            "가구주와의 관계 코드"
codeset<-lapply(excel_sheets(path),read_excel,path=path)
codeset

#==============================================================================
#참조코드 정리
use_features<-as.data.frame(codeset[[1]])
features_code<-use_features[[1]]
features_name<-use_features[[2]]
features_desc<-use_features[[3]]
job_code<-as.data.frame(codeset[[2]])

#==============================================================================
#사용 데이터 뽑아오기, colname 변경, 범주형 features 파악
raw_welfare<-raw_welfare %>% 
  select(features_code)
features_name
names(raw_welfare)<-c('sex','birth','marriage','religion',
                      'job','wage_m','residence')

features_descr
str(raw_welfare)
head(raw_welfare)
#범주형(sex,marriage,religion,residence)
cat<-c('sex','marriage','religion','residence')

#수치형(birth,wage_m)
nums<-c('birth','wage_m')

# job은 범주형으로 나누기에는 너무 다양(145개) 분석 목적에 따라 변화해주기!
length(unique(raw_welfare$job))#145,NA제외
#==============================================================================
#Na있는 features 파악하기 : wage_m, job
library(Amelia)
missmap(raw_welfare,col = c('red','blue'))

#job 유츄하기에는 features가 부족해보임 -> 결측치 제외
job_na<-raw_welfare[is.na(raw_welfare$job),]
raw_welfare<-raw_welfare[!is.na(raw_welfare$job),]
#상관관계 살펴보기
library(GGally)
ggcorr(raw_welfare,nbreaks = 5,label = T)
#wage_m은 job과 sex와 상관관계를 보임
#==============================================================================
# birth를 통해서 age feature 만들기, 2015년 자료라서 2015년 기준 나이
age<-2015-raw_welfare$birth+1
raw_welfare$age<-age
#==============================================================================
#job_code 결합하기

raw_welfare<-left_join(raw_welfare,job_code,by=c('job'='code_job'))

#marriage 코드 설명 결합
trans_marriage<-data.frame(code=c(0:6),marriage=c('비해당','유배우',
                                                  '사별','이혼',
#residence 코드 설명 결합
trans_residence<-data.frame(code=c(1:7),
                            residence=c('서울','경인','부울경남','대구경북',
                                        '대전충남','강원충북','광전제주'))
raw_welfare<-left_join(raw_welfare,trans_marriage,by=c('marriage'='code')) %>% 
                      left_join(trans_residence,by=c('residence'='code'))

#==============================================================================
#수치형 데이터 이상치 찾기(wage_m ,age)
str(raw_welfare)
#1.wage_m
dev.off()
par(mfrow=c(2,2))
boxplot(raw_welfare$wage_m)
plot(density(raw_welfare$wage_m[!is.na(raw_welfare$wage_m)])) #왼쪽으로 치우침, 오른쪽 꼬리가 김
plot(density(log(raw_welfare$wage_m[!is.na(raw_welfare$wage_m)]+1)))#log로 정규화
box_lwage<-boxplot(log(raw_welfare$wage_m+1))#로그화 후 boxplot 그려보기
#로그화 기준으로 이상치 찾아낸 후 NA로 바꾸기
lowerout_wage<-raw_welfare %>% 
  filter(log(wage_m+1)<=3.4)

upperout_wage<-raw_welfare%>% 
  filter(log(wage_m+1)>=7.132)

round(as.vector(box_lwage$stats)[c(1,5)],3) #log_wage(min,max)
target<-raw_welfare$wage_m[!is.na(raw_welfare$wage_m)]
raw_welfare$wage_m[!is.na(raw_welfare$wage_m)]<-ifelse(log(target+1)<=3.4,NA,
                                                       ifelse(log(target+1)>=7.132,NA,target))
raw_welfare$log_wage<-log(raw_welfare$wage_m+1) #log_wage 변수 생성

#2.age: 이상치 없음
dev.off()
par(mfrow=c(2,1))
box_age<-boxplot(raw_welfare$age)
plot(density(raw_welfare$age))

box_age$out

#==============================================================================
#범주형 자료 시각화
install.packages('gridExtra')
library(gridExtra)

str(raw_welfare)
dev.off()
a<-ggplot(raw_welfare,aes(as.factor(job.y)))+
  geom_bar()
b<-ggplot(raw_welfare,aes(as.factor(marriage.y)))+
  geom_bar()

c<-ggplot(raw_welfare,aes(as.factor(sex)))+
  geom_bar()
d<-ggplot(raw_welfare,aes(as.factor(religion)))+
  geom_bar()
e<-ggplot(raw_welfare,aes(as.factor(residence.y)))+
  geom_bar()
grid.arrange(a,b,c,d,e, nrow=3,ncol=2)
#job은 압도적으로 많은 직군이 1개 있음(code 611(작물재배종사자): 1320명)
#marriage는 1이(배우자 있음.) 압도적, 직업이 na를 뺐더니 18세 미만은 자동으로 0명

temp<-raw_welfare %>% 
  group_by(job.y) %>% 
  summarise(mean.wage_m=mean(wage_m,na.rm=T),N=n()) %>% 
  arrange(-N,mean.wage_m)
head(temp,3)
temp %>%  #직종별 임금 살펴보기:(top3:고위공무원,임원,보험 및 금융, 의료)
  arrange(-mean.wage_m) %>% 
  head(3)


#성별, 거주지 별 평균 임금
dev.off()
aggregate(data=raw_welfare,wage_m~residence.y+sex,
          FUN=function(x) mean(x,na.rm=T)) %>% 
  ggplot(aes(residence.y,wage_m,fill=as.factor(sex)))+
  geom_bar(stat='identity')+
  facet_grid(sex ~ .)
#남성의 임금이 평균적으로 높음
#남녀 모두 (대전,충남)의 평균 임금이 가장 높음, 서울이 아니라 의외.
#남녀 모두 (강원 충북)의 평균 임금이 가장 낮음(맞는 듯 함)
#상위 극단치들이 서울에 많이 있어서 그럴까?
str(upperout_wage)
upperout_wage %>% 
  group_by(residence.y)
str(lowerout_wage)

#지역별 평균임금, 인원
temp1<-raw_welfare %>% 
  group_by(residence.y) %>% 
  summarise(N=n(),mean.wage_m=mean(wage_m,na.rm=T)) %>% 
  as.data.frame()

#지역별 극빈층 평균임금, 인원, 전체인원대비 비율
temp2<-lowerout_wage %>% 
  group_by(residence.y) %>% 
  summarise(N=n(),mean.wage_m=mean(wage_m)) %>% 
  as.data.frame()
temp2 %>% 
  mutate(prop_lower=(N/temp1[[2]])*100) %>% 
  arrange(prop_lower)

dev.off()
raw_welfare %>% 
  ggplot(aes(residence,wage_m,group=residence))+
  geom_boxplot()+
  facet_grid(sex ~ .)

#==============================================================================
# wage_m 결측값 예측하기
sum(is.na(raw_welfare$wage_m))#3095개
sum(is.na(raw_welfare$wage_m))/nrow(raw_welfare) #NA비율 0.4110772 거의 절반

# 직종, 성별이 wage_m과 높은 상관관계를 보임
library(GGally)
ggcorr(raw_welfare,nbreaks = 5,label = T)

#1. knn으로 예측하기==================================================
str(raw_welfare)
model1<-raw_welfare
features<-c('sex','marriage','religion','job','residence','age')
features_cat<-features[-6]
label<-c('wage_m')

#cat변수 onehotencoding
head(model1[features_cat])
for(i in features_cat){
  iter<-unique(model1[[i]])
  for(value in iter){
    newcol<-paste(i,value,sep='')
    model1[newcol]<-ifelse(model1[i]==value,1,0)
  }
}
str(model1)


#age 표준화
origin_age<-model1$age
model1$age<-scale(model1$age)

data<-model1[-c(1:5,7,9,10,11)]

train<-data[!is.na(data$wage_m),]
test<-data[is.na(data$wage_m),]

set.seed(1234)
len<-nrow(train)
sample_idx<-sample(1:len,len*0.3)
train_train<-train[-sample_idx,-c(1,3)]
train_test<-train[sample_idx,-c(1,3)]

train_train_labels<-train[-sample_idx,c(1,3)]
train_test_labels<-train[sample_idx,c(1,3)]

library(class)
#score는 rmsle를 사용(log(predict/real)^2의평균의 루트
scores<-c()
for(i in seq(1,25,2)){
predict_wage_m<-as.numeric(knn(train_train,train_test,
                    cl=train_train_labels[[1]],k=i))
scores<-c(scores,sqrt(mean((log(predict_wage_m+1)-log(train_test_labels[[1]]+1))^2)))
}
min(scores)
seq(1,25,2)[which.min(scores)] 
#k:21일때 rmsle 1.086938 낮을수록 좋음, 아주 안좋은 모델


#knn2(job,age,sex)==================================================
model2<-raw_welfare
features<-c('sex','job','age')
features_cat<-features[-3]
label<-c('wage_m','log_wage')

#cat변수 onehotencoding
head(model2[features_cat])
for(i in features_cat){
  iter<-unique(model2[[i]])
  for(value in iter){
    newcol<-paste(i,value,sep='')
    model2[newcol]<-ifelse(model2[i]==value,1,0)
  }
}
str(model2)


#age 표준화
model2$age<-scale(model2$age)
features
names(model2)
data<-model2[-c(1:5,7,9:11)]
str(data)

train<-data[!is.na(data$wage_m),]
test<-data[is.na(data$wage_m),]

set.seed(1234)
len<-nrow(train)
sample_idx<-sample(1:len,len*0.3)
train_train<-train[-sample_idx,-c(1,3)]
train_test<-train[sample_idx,-c(1,3)]

train_train_labels<-train[-sample_idx,c(1,3)]
train_test_labels<-train[sample_idx,c(1,3)]

library(class)
#score는 rmsle를 사용(log(predict/real)^2의평균의 루트
scores<-c()
for(i in seq(1,25,2)){
  predict_wage_m<-as.numeric(knn(train_train,train_test,
                                 cl=train_train_labels[[1]],k=i))
  scores<-c(scores,sqrt(mean((log(predict_wage_m+1)-log(train_test_labels[[1]]+1))^2)))
}
min(scores)
seq(1,25,2)[which.min(scores)] 
#k:15일때 rmsle 1.01495 낮을수록 좋음, 아주 안좋은 모델

#==================================================================
#model3 kmeasn 후 그룹 평균값으로
str(raw_welfare)
model3<-raw_welfare
features<-c('sex','marriage','religion','job','residence','age')
features_cat<-features[-6]
label<-c('wage_m')

#cat변수 onehotencoding
head(model3[features_cat])
for(i in features_cat){
  iter<-unique(model3[[i]])
  for(value in iter){
    newcol<-paste(i,value,sep='')
    model3[newcol]<-ifelse(model3[i]==value,1,0)
  }
}
str(model3)


#age 표준화
model3$age<-scale(model3$age)

data<-model3[-c(1:5,7,9,10,11)]






sqrt(nrow(raw_welfare))
wiss<-c()
set.seed(1234)
for(i in 1:100) wiss[i]<-kmeans(data[-c(1,3)],i)$tot.withinss
plot(1:100,wiss,xlab='centers_N',ylab='tot.withinss',
     main = 'elbow_K',type='o')
#k:17~23정도가 적절해보임
names(data)
cluster_welfare<-kmeans(data[-c(1,3)],21)
data$cluster1<-cluster_welfare$cluster

train<-data[!is.na(data$wage_m),]
test<-data[is.na(data$wage_m),]

set.seed(1234)
len<-nrow(train)
sample_idx<-sample(1:len,len*0.3)

train_train<-train[-sample_idx,]
train_test<-train[sample_idx,]


train_train_labels<-train[-sample_idx,c(1,3)]
train_test_labels<-train[sample_idx,c(1,3)]

train %>% 
  ggplot(aes(y=wage_m,group=cluster1,fill=as.factor(cluster1)))+
  geom_boxplot(outlier.shape=16, outlier.colour="red",)+
  ggtitle('클러스터별 임금 분포')

predict_wage<-aggregate(data=train_train,wage_m ~ cluster1,
          FUN=function(x) mean(x,na.rm=T))
temp<-left_join(train_test,predict_wage,by='cluster1')

#rmsle: 0.5435283 knn() 보다 훨씬 좋음
sqrt(sum((log(temp['wage_m.y']+1)-log(temp['wage_m.x']+1))^2)/nrow(temp))

#test 예측==============================================
names(test)
predict_wage<-aggregate(data=train,wage_m ~ cluster1,
                        FUN=function(x) mean(x,na.rm=T))

temp<-left_join(test,predict_wage,by='cluster1')
temp$wage_m.x<-temp$wage_m.y
temp$wage_m.y<-NULL

raw_welfare$wage_m[is.na(raw_welfare$wage_m)]<-temp$wage_m.x

# 분석시작
#===============================================================================
#model1: 모든 cat변수 onehot인코딩, age는 표준화
model1$wage_m[is.na(model1$wage_m)]<-temp$wage_m.x

#1. 성별에 따른 월급차이
# $`1`(남자)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 30.0   152.2   255.4   285.8   373.1  1250.0 
# 
# $`2`(여자)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 29.0   103.8   139.1   154.4   189.8  1000.0 
with(model1,tapply(wage_m,sex,summary))
model1 %>% 
  group_by(sex) %>% 
  ggplot(aes(y=wage_m,group=as.factor(sex),fill=as.factor(sex)))+
  geom_boxplot()
#=============================================================================
#2. 나이+성별에 따른 월급
#남자는 40중반에서 50초반
#여자는 30중반이 피크
model1$origin_age<-origin_age
model1 %>% 
  group_by(sex) %>% 
  ggplot(aes(y=wage_m,x=origin_age,col=as.factor(sex)))+
  geom_point()+
  stat_smooth()

cuts<-with(model1,tapply(origin_age,sex,summary))[[1]][-4]
model1$agecat<-with(model1,cut(origin_age,breaks =c(18,30,40,50,60,100),include.lowest = T ))


aggregate(data=model1,wage_m~agecat+sex,mean) %>% 
  arrange(sex,-wage_m)
#     agecat sex   wage_m  남자는 40~50이 최고
# 1   (40,50]   1 370.3013
# 2   (50,60]   1 339.2704
# 3   (30,40]   1 313.9060
# 4   [18,30]   1 190.4619
# 5  (60,100]   1 170.1396

# 6   (30,40]   2 202.8838 여자는 30~40이 최고
# 7   (40,50]   2 188.7750
# 8   [18,30]   2 172.6190
# 9   (50,60]   2 158.4980
# 10 (60,100]   2 102.2563

temp<-aggregate(data=model1,wage_m~agecat+sex,mean) %>% 
  arrange(sex,-wage_m)
temp1<-temp[temp$sex==1,] %>% 
  arrange(agecat)
temp2<-temp[temp$sex==2,] %>% 
  arrange(agecat)
temp4<-temp1[3]-temp2[3]
# wage_m(연령대별 성별 평균 임금 차이)
#20대가 가장 적고 40,50대가 가장 많음
# 1  17.84289
# 2 111.02224
# 3 181.52632
# 4 180.77243
# 5  67.88332
#=============================================================================
#3. 월급 평균 상위 5개 직군
aggregate(data=model1,wage_m~job.y,mean) %>% 
  arrange(-wage_m) %>% 
  head(5)
#                       job.y             wage_m
# 1  의회의원 고위공무원 및 공공단체임원 750.0000
# 2                  보험 및 금융 관리자 677.4196
# 3                     제관원 및 판금원 572.4067
# 4 문화 예술 디자인 및 영상 관련 관리자 557.4667
# 5       석유 및 화학물 가공장치 조작원 531.6600

#=============================================================================
#4. 종교와 임금
#종교가 없는 쪽이 평균 임금이 더 높음
model1 %>% 
  ggplot(aes(y=wage_m,group=religion,fill=as.factor(religion)))+
  geom_boxplot()
#=============================================================================
#5. 혼인과 임금(미혼 vs 유배우)
#미혼의 중간값 임금이 상대적으로 높지만
#유배우의 윗꼬리가 훨씬 김
model1 %>% 
  ggplot(aes(y=wage_m,group=marriage.y,fill=as.factor(marriage.y)))+
  geom_boxplot()

#상위 극단치들이 유배우에 많이 포진.
#평균은 유배우>미혼
aggregate(data=model1,wage_m~marriage.y,mean) %>% 
  arrange(-wage_m)
# marriage.y   wage_m
# 1     유배우 243.2363
# 2     비해당 210.4228
# 3       미혼 205.3636
# 4       이혼 205.1285
# 5       별거 155.7439
# 6       기타 119.5977
# 7       사별 106.0018

#중간값은 미혼>유배우
aggregate(data=model1,wage_m~marriage.y,median) %>% 
  arrange(-wage_m)

# marriage.y    wage_m
# 1     비해당 210.42279
# 2       미혼 198.30625
# 3     유배우 189.81541
# 4       이혼 160.00000
# 5       별거 139.07941
# 6       기타 119.59770
# 7       사별  83.42027

#=============================================================================
#6.권역별 월급: 결측치 채우기 전에는 대전 충남이 1등
# 지금은 평균, 중간값 모두 서울이 1등, 경인이 2등
# 꼴찌는 강원충북
model1 %>% 
  ggplot(aes(y=wage_m,group=residence.y,fill=as.factor(residence.y)))+
  geom_boxplot()

#평균은 유배우>미혼
aggregate(data=model1,wage_m~residence.y,mean) %>% 
  arrange(-wage_m)
# residence.y   wage_m
# 1        서울 247.5801
# 2        경인 237.1495
# 3    부울경남 232.1448
# 4    대전충남 229.0542
# 5    광전제주 210.0819
# 6    대구경북 205.3886
# 7    강원충북 190.4213
#중간값은 미혼>유배우
aggregate(data=model1,wage_m~residence.y,median) %>% 
  arrange(-wage_m)
# residence.y   wage_m
# 1        서울 201.6800
# 2        경인 197.6309
# 3    대전충남 189.8154
# 4    부울경남 187.5000
# 5    대구경북 160.0000
# 6    광전제주 149.5000
# 7    강원충북 139.0794
#=============================================================================
# 7. 종교 유무/ 결혼여부: 종교 x가 미세하게 높음
library(gridExtra)
install.packages('reshape2')
library(reshape2)
install.packages('ggrepel')
library(ggrepel)

temp1<-lapply(with(model1,tapply(marriage.y,religion,table)),prop.table)[[1]]
temp2<-lapply(with(model1,tapply(marriage.y,religion,table)),prop.table)[[2]]
dev.off()
rel1<-ggplot(melt(temp1),aes('',value,fill=as.factor(Var1)))+
  geom_bar(stat = 'identity')+
  theme_void()+
  coord_polar('y',start=0)+
  geom_text_repel(aes(label=paste0(round(value,2),'%')),
            position=position_stack(vjust = 0.5)
            )+
  scale_fill_viridis_d(option='inferno',alpha = 0.6)+
  ggtitle('종교o')
  
rel2<-ggplot(melt(temp2),aes('',value,fill=as.factor(Var1)))+
  geom_bar(stat = 'identity')+
  theme_void()+
  coord_polar('y',start=0)+
  geom_text_repel(aes(label=paste0(round(value,2),'%')),
            position=position_stack(vjust = 0.5))+
  scale_fill_viridis_d(option='inferno',alpha = 0.6)+
  ggtitle('종교x')

grid.arrange(rel1,rel2,nrow=1,ncol=2)


#cluster2 소득과 나이만으로 clustering 후 residence, job 등의 특징 찾아보기
str(model1)
model1$wage_m_scale<-scale(model1$wage_m)
names(model1)
cluster2<-kmeans(model1[c(13:176,179)],10)

model1$cluster2<-cluster2$cluster
plot(table(model1$cluster2,model1$residence.y))
cluster2$centers
cluster2$size



# 군집별로 특별한 특색이 보이지는 않음
library(gmodels)
a<-model1 %>% 
  filter(marriage.y=='유배우'|marriage.y=='이혼')
dev.off()

plot(table(a$cluster2,a$marriage.y))


CrossTable(a$marriage.y,a$cluster2,expected = T,
           chisq = T)

library(dplyr)


# 많은 관측 카운트가 0이라서 결과값이 이상하게 나옴
# Pearson's Chi-squared test 
# ------------------------------------------------------------

# 경고메시지(들): 
# In chisq.test(t, correct = FALSE, ...) :
#   Chi-squared approximation may be incorrect

#h
