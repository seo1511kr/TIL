# 1. mtcars데이터 weight열 추가, 무게가 중위수보다 
# 큰 자동차는 heavy, 그렇지 않은 자동차는 light를 저장
# - 각 종류별 데이터 건수 출력, 비율
str(mtcars)
midwt<-median(mtcars$wt)
minwt<-min(mtcars$wt)
maxwt<-max(mtcars$wt)
isheavy<-cut(mtcars$wt,breaks = c(minwt,midwt,maxwt),labels = c('ligth','heavy'),include.lowest = T)
mtcars$weigth<-isheavy
str(mtcars)
table(isheavy)
proportions(table(isheavy))


# 2. mtcars 데이터셋 열들이 왼쪽에서 오른쪽으로 오름차순으로 배치되도록 작성
str(mtcars)
mtcars[do.call(order, mtcars),]

# 3. iris데이터에서 70% 데이터를 무작위 표본추출
data(iris)
str(iris)
head(iris)

set.seed(2021)
number<-count(iris)
number[[1]]
sample(1:number[[1]],number[[1]]*0.7,replace = F)

# 4. ggplot2 패키지에는 미국 동북중부 437개 지역의 인구통계 정보를
# 담은 midwest라는 데이터가 포함되어 있음. 
# midwest 데이터를 사용하여,
# 불러오기 : midwest<-as.data.frame(ggplot2::midwest)
midwest<-as.data.frame(ggplot2::midwest)
# - ggplot2 의 midwest 데이터를 데이터 프레임 형태로 불러와서 데이터의
# 특성을 파악
describe(midwest)
str(midwest)
library(Amelia)
missmap(midwest,col=c('red','grey'))
sum(duplicated(midwest))
sum(!complete.cases(midwest))

library(ggplot2)
library(GGally)
ggcorr(midwest,nbreaks=6,label = T,label_size = 1)
# - poptotal(전체 인구)을 total 로, popasian(아시아 인구)을 asian 으로 
#  변수명을 수정 rename

library(dplyr)
midwest<-rename(midwest,c(total=poptotal,asian=popasian))

# - total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생변수 생성
head(midwest$total)
head(midwest$asian)

propas<-round(midwest$asian/midwest$total*100)
midwest$propas<-propas
# - 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 "large"
#그 외에는 "small"을 부여하는 파생변수 생성

newpropas<-cut(midwest$propas,
    breaks = c(0,mean(midwest$propas),100),
    labels=c('small','large'),
    include.lowest = T)
midwest$newpropas<-newpropas

# - "large"와 "small"에 해당하는 지역이 얼마나 되는지 빈도수를 출력
table(midwest$newpropas)
# 5. 타이타닉 데이터 분석
# -타이타닉 데이터 불러오기
titanichw<-read.csv('data/train.csv',na.strings = '')
str(titanichw)
library(Amelia)
missmap(titanichw,col = c())
# - 생존자 수, 사망자 수 출력
table(titanichw$Survived)
# - pclass, embarked 별 승객수 출력(비율)
for (i in unique(titanichw$Pclass))
  print(c(i,sum(titanichw$Survived[titanichw$Pclass==i])/length(titanichw$Survived[titanichw$Pclass==i])))

for (i in na.omit(unique(titanichw$Embarked)))
  print(c(i,sum(titanichw$Survived[titanichw$Embarked==i],na.rm = T)))

# - Name에서 호칭 종류 출력, 호칭 종류 별 승객수 출력
name2<-unlist(lapply(strsplit(titanichw$Name,split='[,.]'),function(x){x[2]}))
table(name2)

# - 호칭을 아래와 같이 변경하여 name2열에 추가
# * "Mlle", "Ms", "Lady", "Dona" 는 "Miss"로 변경
# * "Mme"는  "Mrs"로 변경
# * "Capt", "Col", "Major", "Dr", "Rev", "Don",  "Sir", "the Countess", "Jonkheer"는 "Officer"로 변경
# * "Mr", "Mrs", "Miss"는 그대로
# * 나머지 호칭은 "Others"

name2<-gsub("(Mlle|Ms|Lady|Dona)",'Miss',name2)
name2<-gsub("(Capt|Col|Major|Dr|Rev|Don|Sir|the Countess|Jonkheer)",'officer',name2)
name2<-gsub("Mme",'Mrs',name2)
name2[-grep("Mr|Mrs|Miss|officer",name2)]<-"Others"
name2<-gsub(' ','',name2)
titanichw$name2<-name2
# -name2 열을 factor로(5가지 범주) 변환
titanichw$name2<-as.factor(titanichw$name2)
str(titanichw$name2)
# -name2열의 호칭별 인원수 출력
table(titanichw$name2)

# -호칭 정보를 바탕으로 나이(Age) 결측값 대체(호칭 별 나이의 평균값)
unique(titanichw$name2)
for (i in unique(titanichw$name2)){
  titanichw$Age[titanichw$name2==i&is.na(titanichw$Age)]<-mean(titanichw$Age[titanichw$name2==i],na.rm=T)
}

  
# -age열의 구간별 인원수 출력
# 10대 미만, 10대, 20대, 30대, 40대, 50대 이상

catage<-cut(titanichw$Age,breaks = c(0,10,20,30,40,50,max(titanichw$Age)),include.lowest = T,right=F)
str(catage)
table(catage)

# -cabin 컬럼의 1번째 글자 출력(NA는 제외)
substr(titanichw$Cabin[!is.na(titanichw$Cabin)],1,1)
# - fare열 값에 대해 최대/최소/평균/표준편차 출력
describe(titanichw$Fare)
mean(titanichw$Fare,na.rm = T)
max(titanichw$Fare,na.rm = T)
min(titanichw$Fare,na.rm = T)
sd(titanichw$Fare,na.rm = T)
# - sibsp + parch를 더하여 새롭게 family열에 저장
family<-titanichw$SibSp+titanichw$Parch
sum(is.na(family))
titanichw$family<-family

