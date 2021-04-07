#데이터 전처리(S-A-C)패키지: dplyr
#데이터 분할(S) -> 분할 자료에 함수적용(A)->결과를 취합(C)
# arrange(정렬), filter(행추출), select(열추출)
# mutate(열 추가),summarise(요약)
library(dplyr)
head(airquality)

#==========================================================
#행추출 3가지 방법
airquality[airquality$Month==6,]
subset(airquality,subset=(Month==6),select = c(Month))
filter(airquality,Month==6)

air<-filter(airquality,Month==6)
head(air)


#==========================================================
#filter()  and 연결 2가지
#1. ,이용
air<-filter(airquality,Month==6,Temp>90)
head(air)
#2. & 기호를 사용
air<-filter(airquality,Month==6 & Temp>90)
head(air)

#==========================================================
#filter()  or 연결
air<-filter(airquality,Month==6 | Ozone>90)
head(air)

#==========================================================
#slice(): 단순히 특정 위치의 행 데이터 추출
slice(airquality,6:10)

#==========================================================
#arrange():데이터프레임을 정렬(지정한 열을 기준으로.)
arrange(airquality,Temp) #오름차순 디폴트
arrange(airquality,desc(Temp))# 내림차순

#quiz1
with(airquality,airquality[order(-Temp,Month,Day),])


#==========================================================
#select(): 열 추출(, 여러개 각각 지명, :연속 지명, - 제외)
air<-select(airquality,Month,Day,Temp)
head(air)

air<-select(airquality,Temp:Day)
head(air)

air<-select(airquality,-(Ozone:Wind))
head(air)

#열 이름도 변경 가능
head(select(airquality,Solar=Solar.R,Wind:Day,Ozone))

#select + distinct 함수 조합
distinct(select(airquality,Month))
unique(airquality$Month)
#==========================================================
#rename(): 열 이름 변경
head(airquality)
air<-rename(airquality,Solar=Solar.R)
head(air)
#==========================================================
#mutate(,변수명=식): 새로운 열(파생변수) 추가
airquality$Temp #화씨 온도
head(mutate(airquality,Temp.c=(Temp-32)/1.8)) #섭씨로 변환한 변수 추가

#함수내에서 정의한 새로운 변수를 함수 안에서 바로 사용 가능
head(mutate(airquality,Temp.c=(Temp-32)/1.8,Diff=Temp.c-mean(Temp.c))) 

#transform에서는 불가능: error나옴
# transform(airquality,Temp.c=(Temp-32)/1.8,Diff=Temp.c-mean(Temp.c)) 

#==========================================================
#summarise()
str(airquality)
summarise(airquality,mean(Temp))
summarise(airquality,
           Min=min(Temp,na.rm = T),
           Median=median(Temp,na.rm = T),
           Mean=mean(Temp,na.rm = T),
           Sd=sd(Temp,na.rm = T),
           Max=max(Temp,na.rm = T),
           N=n(),
           Distinct.Month=n_distinct(Month),
           First.Month=first(Month),
           Last.Month=last(Month),
           )

#==========================================================
#sample_n():표본 추출(개수)
#sample_frac:표본 추출(비율)
#옵션: replace=TRUE(복원추출)
sample_n(airquality,5)
sample_frac(airquality,0.1)

#==========================================================
#group_by(): 그룹별로 분할, 그룹 단위 함수 적용
air.group<-group_by(airquality,Month)

#월별 통계량 구하기
summarise(air.group,
          Mean_Temp=mean(Temp, na.rm=TRUE)
          )

air.group.Temp<-summarise(group_by(airquality,Month),
          Mean_Temp=mean(Temp, na.rm=TRUE)
)

air.group.Temp


#==========================================================
#파이프 연산자: %>%, 한 함수로부터 연산 결과가
#다음 함수의 인수가 되도록 전달
# ctrl +shift +M 단축키
iris
head(iris)
iris %>% head
1:10 %>% mean
1:10 %>%  mean %>% sqrt

#
a1<-select(airquality,Ozone,Temp,Month)
a2<-group_by(a1,Month)
a3<-summarise(a2,
          Mean.Ozone=mean(Ozone,na.rm=T),
          Mean.Temp=mean(Temp,na.rm=T),
          )
a4<-filter(a3,Mean.Ozone>40|Mean.Temp>80)
#파이프 연산자로 한 번에
air<-airquality %>% 
  select(Ozone,Temp,Month) %>% 
  group_by(Month) %>% 
  summarise(Mean.Ozone=mean(Ozone,na.rm=T),
            Mean.Temp=mean(Temp,na.rm=T)
            ) %>% 
  filter(Mean.Ozone>40|Mean.Temp>80)
air
air_df<-as.data.frame(air)
air_df
as_tibble(air_df)
#=========================================================
#1870년부터 150년동안 야구선수들 타율관련 데이터
install.packages('Lahman')
library(Lahman)
str(Batting)
Batting.tbl<-tbl_df(Batting)
Batting.tbl #티블은  변수가 많아도 생략하여 다음 줄까지 안넘어감
#데이터 변환
#데이터의 외형상 특징: 와이드형, 롱형

#와이드형: 흔히 아는 데이터 프레임
#롱형
# subject     var     value
# aaaa01     teamID     1
# aaaa01     yearID   1871
# aaaa01     ...      ...

#=========================================================
#reshape2패키지 설치
#melt함수: 와이드형 ->롱 형 변환,
#dcast함수: 롱형->와이드 형 변환
install.packages('reshape2')
library(reshape2)

smiths#reshape2에 포함된 데이터
str(smiths)
#subject라는 변수가 팩터로 되어 있으므로
#자동으로 subject변수를 식별자로 사용하게 됨
#id.vars를 활용하여 직접 명시도 가능
smiths.long<-melt(data=smiths)
smiths.long
smiths.long<-melt(data=smiths,id.vars = 'subject')
smiths.long

# dcast: 롱포맷 -> 와이드포맷
#변수 배치는 formula로 지정
#x~y: x에는 식별자 변수, y에는 측정 변수, 변수 여러개 +로 연결
smiths.long
smiths.wide<-dcast(smiths.long,formula =subject~variable)
smiths.wide

#=========================================================
#airquality:wide형 자료
head(airquality)
str(airquality)
aq.long<-melt(airquality)
str(aq.long)
aq.long<-melt(airquality,id.vars=c('Month','Day'))
head(aq.long)
tail(aq.long)

aq.wide<-dcast(aq.long,formula = Month+Day~variable)
head(aq.wide)

air.summary.by.month<-airquality %>%
  select(Temp,Ozone,Solar=Solar.R,Month) %>% 
  group_by(Month) %>% 
  summarise(Temp.mean=mean(Temp,na.rm=T),
            Ozone.mean=mean(Ozone,na.rm=T),
            Solar.mean=mean(Solar,na.rm=T),
            )
melt(air.summary.by.month,id.vars = 'Month')

#=========================================================
#left_join():열 데이터 합치기
#bind_rows():행 데이터 합치기
exam<-read.csv('data/csv_exam.csv',na.strings = '')
exam

exam %>% 
  filter(class==1)

exam %>% 
  filter(class!=1)

exam %>% 
  filter(math>50)

exam %>% 
  filter(math>50, class==1)

exam %>% 
  filter(math>=90|english>=90)

exam %>% 
  filter(class %in% c(1,2,3))

class1<-exam %>% 
  filter(class==1)
class2<-exam %>% 
  filter(class==2)

mean(class1$math)
mean(class2$math)

exam %>% 
  filter(class==1) %>% 
  select(english)

exam %>% 
  select(id, math) %>% 
  head(10)

exam %>% 
  arrange(math)

#수학, 영어, 과학점수를 모두 더하여 total변수 추가 및 출력
exam %>% 
  mutate(total=math+english+science,mn=total/3)

exam %>% 
  mutate(test=ifelse(science>=60,"pass","fail"))

exam %>% 
  mutate(total=math+english+science) %>% 
  arrange(total) %>% 
  group_by(class) %>% 
  summarise(Math.mean=mean(math,na.rm=T),
            Math.sum=sum(math,na.rm=T),
            Math.median=median(math,na.rm=T),
            Math.N=n())
#==========================================================
#drv: 4륜, 전륜, 후륜
mpg
mpg %>% 
  group_by(manufacturer,drv) %>% 
  summarise(Mean_City=mean(cty))

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=='suv') %>% 
  mutate(tot=(cty+hwy)/2) %>% 
  summarise(mean.tot=mean(tot)) %>% 
  arrange(desc(mean.tot)) %>% 
  head(5)


#==========================================================
#dplyr
#left_join(), bind_rows()
# 중간고사 데이터 생성
test1 <- data.frame(id = c(1, 2, 3, 4, 5),
                    midterm = c(60, 80, 70, 90, 85))
# 기말고사 데이터 생성
test2 <- data.frame(id = c(1, 2, 3, 4, 3),
                    final = c(70, 83, 65, 95, 80),
                    grade=c('a','b','c','d','d'))
name <- data.frame(class = c(1, 2, 3, 4, 3),
                   teacher = c("kim", "lee", "park", "choi", "jung"),
                   grade=c('a','b','c','d','d'))

total<-left_join(test2,name,by=c('id'='class','grade'))
total


?left_join
exam
name
examNew<-left_join(exam,name,by='class')
examNew


# 학생 1~5 번 시험 데이터 생성
group_a <- data.frame(id = c(1, 2, 3, 4, 5),
                      test = c(60, 80, 70, 90, 85))
# 학생 6~10 번 시험 데이터 생성
group_b <- data.frame(id = c(6, 7, 8, 9, 10),
                      test = c(70, 83, 65, 95, 80))

group_all<-bind_rows(group_a,group_b)
group_all
