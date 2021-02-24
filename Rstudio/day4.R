#유클리디안 거리(추천 시스템)
#주의점: 각 피처값을 정규화 시켜줘야 함
# ex)영화평점, 밀정:0~100, 국제시장0~10 이면 밀정에 의해 유사도가 결정됨

# 표준화: (평점-평균)/표준편차
# 극단치 데이터(outlier)들이 다수 포함되면 평균과 표준편차의 기능이 약화됨

# 정규화: 0<=(각각의 평점 - 최소값)/(최대값-최소값) <=1
# 이진분류시 많이 함




id<-c('a1','a2','a3')
name<-c('x','y','z')
price<-c(1000,2000,3000)
product<-data.frame(id,name,price)
product
str(product)
?data.frame
product<-rbind(product,c('a4','x',4000))
product

# 두 개 이상의 행, 열 추가: dataframe 만든 후 추가
new.rows<-data.frame(id=c('a5','a6'),name=c('i','j'),
           price=c(5000,6000))
new.rows
# 열 이름이 기존 data.frame과 동일해야함
product<-rbind(product,new.rows)

# 벡터 길이가 기존 data.frame과 동일해야함
product<-cbind(product,madein=c('kor','chi','chi','kor','kor','usa'))
product


# 두 개 이상의 행, 열 추가: dataframe 만든 후 추가
# 열 name의 중복을 주의해야 함
new.cols<-data.frame(menu=c('aa','bb','aa','cc','aa','bb'),
                     quantity=c(10,20,30,20,10,25))
new.cols
product<-cbind(product,new.cols)
product

#연도별 파일 불러온 후 dataframe 결합


df1<-data.frame(sex='f',months=1,weight=3.5)
df2<-data.frame(sex='m',months=3,weight=4.5)
df3<-data.frame(sex='m',months=4,weight=5.5)
df4<-data.frame(sex='f',months=7,weight=6.5)
df5<-data.frame(sex='f',months=8,weight=7.5)


lst<-list(df1,df2,df3,df4,df5)
lst
class(lst[1])
class(lst[[1]])

str(lst[1])
str(lst[[1]])

rbind(lst[[1]],lst[[2]])

  
# do.call() 리스트 내의 여러 개 데이터 프레임을 합치는 함수
do.call(rbind,lst)
str(do.call(rbind,lst))



# 리스트 속 데이터들도 모두 리스트일 때
# lapply + do.call 로 dataframe 만들기

lst1<-list(sex='f',months=1,weight=3.5)
lst2<-list(sex='m',months=3,weight=4.5)
lst3<-list(sex='m',months=4,weight=5.5)
lst4<-list(sex='f',months=7,weight=6.5)
lst5<-list(sex='f',months=8,weight=7.5)


lst<-list(lst1,lst2,lst3,lst4,lst5)
lst

do.call(rbind,lst)
class(do.call(rbind,lst))#array로 합쳐짐

#lapply(arg1,arg2): 첫번째 인수에는 리스트의 원소
# 두번째 인수에는 적용하고자 하는 함수
lst<-lapply(lst,as.data.frame)
do.call(rbind,lst)


#merge함수 이용하기
state.x77
class(state.x77)
str(state.x77)
states<-data.frame(state.x77)
states
str(states)
row.names(states)
states$name<-row.names(states)
str(states)

#행 이름 없애기
row.names(states)<-NULL
head(states)
tail(states)

states[c(states$Income>5000),]
class(states[c(states$Income>5000),])


rich.states<-states[c(states$Income>5000),c('name','Income')]
large.states<-states[c(states$Area>100000),c('name','Area')]

# merge(df1,df2) 
# 디폴트=> 모든 feature를 다 갖고 있는 데이터 행만 출력
rich.states
large.states
merge(rich.states,large.states)
#all=TRUE 옵션 없는 feature은 NA로
merge(rich.states,large.states,all = TRUE)

#subset():행과 열을 선택
#subset(행 조건), select(열 선택) 옵션
subset(states,Income>5000)
subset(states,Income>5000 & Area>50000)
subset(states,subset=(Income>5000 & Area>50000))
subset(states,name=='Alaska')

subset(states,subset=(Income>5000 & Area>50000), select=c(Murder,Illiteracy))


# 예제1
# 옵션명을 생략할려면 순서를 잘 지켜야 함.
mtcars
mtcars[mtcars$mpg>30,]
subset(mtcars,subset=mpg>30)
subset(mtcars,subset=mpg>30,select = mpg)
subset(mtcars,subset=(cyl==4 & am ==0),select = c(mpg,hp,wt))
subset(mtcars,subset=(mpg>mean(mpg)),select = c(mpg,hp,wt))


str(iris)
subset(iris,select=c(Sepal.Width,Petal.Length))
# sepal length와 width 비율
# feature engineering
iris$Sepal.Length/iris$Sepal.Width

#with() 활용하기
with(iris, Sepal.Length/Sepal.Width)


with(iris,{
  print(summary(Sepal.Length))
  plot(Sepal.Length,Sepal.Width)
 })

# with은 함수라 함수 안에서 만들어진
#stats라는 변수는 함수 밖에서 사용 불가
#밖에서 사용하려면  <<- 화살표2개
with(iris,{
  stats<-summary(Sepal.Length)
  stats
})

with(iris,{
  stats<<-summary(Sepal.Length)
  stats
})
stats 


#with 과 within은 거의 동일
#차이점:within은 데이터 수정이 가능함
iris<-within(iris, Sepal.Ratio <- Sepal.Length/Sepal.Width)

within(iris,{
  Sepal.Ratio=ifelse(is.na(Sepal.Ratio),median(Sepal.Ratio,na.rm=T),Sepal.Ratio)
})
#ifelse(조건,참 값, 이외의 값)
str(iris)

#sqldf 패키지:SQL명령문을 사용할 수 있음
#SQL(Structured Query Language):
#데이터베이스에 데이터를 검색, 수정, 삭제, 추가하는 작업
#수행할 수 있도록 해주는, 사전에 약속된 데이터베이스 표준 질의어
#검색(select),수정(update),삭제(delete),추가(insert into)
install.packages('sqldf')
library(sqldf)
mtcars
sqldf('select*from mtcars')
#mtcars에 저장되어 있는 모든(*) 데이터를 추출하시오.
#검색 =selecct 추출컬럼1,....,추출컬럼n from 테이블명
sqldf("select cyl from mtcars")
sqldf("select * from mtcars", row.names=TRUE)
sqldf("select * from mtcars where mpg>30", row.names=TRUE)
sqldf("select * from mtcars where mpg>30 order by hp", row.names=TRUE)
sqldf("select avg(mpg) as avg_mpg from mtcars where mpg>30 order by hp", row.names=TRUE)


#예제2.
state.x77
st<-state.x77
class(st)

st<-data.frame(st)
class(st)

colnames(st)
dim(st) # 관찰값50, 피처8
rowSums(st)
rowMeans(st)

#생쥐데이터
library(MASS)
head(cats)
