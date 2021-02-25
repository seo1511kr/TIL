# 정렬 : sort(), order()
# sort(): 데이터가 정렬된 결과
# order(): 데이터 크기의 색인을 출력

v1 <- c(20,10,50,40,30)
v2<-c(300,200,100,700,600)
v3<-c('a','b','b','a','b')
df<-data.frame(v1,v2,v3)
df

v1
sort(v1) #오름차순
sort(v1,decreasing = T) #내림차순

v1
order(v1) #오름차순 정렬했을때, 색인 값을 추출
order(-v2) #내림차순

# dataframe 정렬 시 order(기준열)을 활용가능
df[order(v1),]
df[order(v3,v1),] #v3기준 정렬 후 v3값이 동일한 대상은 v1기준 정렬

#plyr 패키지 arrange()이용하기
install.packages('plyr')
library(plyr)
arrange(df,v3,v1)



# apply활용 2차원 (행,열)에 함수적용
library(MASS)
cats
apply(cats[2:3],2,mean)
apply(cats[2:3],2,sd)

#표준화, 정규화 apply 활용
apply(iris[1:4],2,mean)
apply(iris[1:4],2,sd)


#scale함수 활용
head(scale(iris[,1])) #matrix
iris[,1]
mean(iris[,1])
sd(iris[,1])
head((iris[,1]-mean(iris[,1]))/sd(iris[,1])) #vector

#apply, scale 
apply(iris[1:4],2,scale)
apply(iris[1:4],2,function(x){(x-mean(x,na.rm=T))/sd(x,na.rm=T)})
#정규화
apply(iris[1:4],2,function(x){(x-min(x,na.rm=T))/(max(x,na.rm=T)-min(x,na.rm=T))})

?function

#cbind 활용
cbind(iris, scale=scale(iris[,-5]))


 sd(iris[,-5]) #-> 벡터단위라 에러, apply적용
 mean(iris[,-5])#-> 벡터단위라 에러, apply적용
 var(iris[,-5])

 
 
#텍스트 마이닝 -> 베이지안 필터 이메일분류기(햄/스팸, 성능 별로 ...)
#조건부 확률 활용(베이즈 이론)

#텍스트 마이닝 
x='we have a dream' 


#문자열 길이nchar, length
nchar(x) #공백 문자도 하나의 문자로 취급
length(x) #문자 벡터의 길이
length(c('we','have','a','dream'))
y=c('we','have','a','dream')
y[4]
nchar(y)

#대문자, 소문자
tolower(x)
toupper(x)


#문자열 분리 strsplit(data,split='')
#리스트로 저장
#하나의 문자열을 하나의 벡터로 취급-> 리스트 적용
strsplit(x,split=' ')

strsplit(x,split=' ')[[1]]
unlist(strsplit(x,split=' '))


x1='we have a dream'
x2='How are you' 
x3='I am fine' 

myword=c(x1,x2,x3)
length(myword)
myword

strsplit(myword,' ')
strsplit(myword,' ')[[3]]

#대소문자 구분되는 것 주의 what != What

# 단어 통일 시키기: korea=KOREA=Korea=한국=조선...
said<-'WHAT IS ESSENTIAL is invisible to the Eye'
said.word<-strsplit(said," ")
said.word

unique(said.word[[1]]) # 인수는 vector 형태여야 함

tolower(said.word[[1]]) #Is , is가 둘 다 is로
unique(tolower(said.word[[1]]))#한 개가 줄어듦


# 자연어 ->sql
# 우리 회사에서 직급이 대리인 사람의 이름을 모두 출력해라
# => SELECT name FROM company WHERE 직급='대리'


#paste()
#sep='' 옵션으로 연결자 선택 가능 default는 띄어쓰기
#문자열 벡터 결합 함수 -> 하나의 문자열로 생성
#여러개의 벡터가 인수인 경우, 요소간 결합
#벡터간 길이 불일치: 재사용 규칙 적용
paste('Everybody','wants','to','fly')
paste(c('Everybody','wants','to','fly'))

said<-'WHAT IS ESSENTIAL is invisible to the Eye'
res<-strsplit(said,' ')[[1]]
res
paste(res)


#paste 기본적으로 공백문자, sep옵션
paste('Everybody','wants','to','fly')
paste('Everybody','wants','to','fly',sep='-')
paste('Everybody','wants','to','fly',sep='')


#문자열이 아닌 경우 자동 변환
paste(pi,sqrt(pi))

#여러개의 벡터가 인수인 경우, 요소간 결합
heros<-c('Batman','Captain America','Hulk')
color<-c('Black','Blue','Green')
paste(heros,color)

#벡터간 길이 불일치: 재사용 규칙 적용
paste('type',1:5)

paste(heros,'wants','to')

#collapse=''옵션
paste(c('Everybody','wants','to','fly'),collapse=' ')


#ex.1
heros<-c('Batman','Captain America','Hulk')

paste(heros,'wants','to','fly',sep='-',collapse=';')


#outer(a,b,함수)함수: 두 집합에 대해 모든 순서쌍에 함수 적용
# default:곱(카티전 곱)
# FUN=,함수의 옵션(sep='')
outer(c(1,2,3),c(3,2,1))

asia.countires<-c('Korea','China','India')
info<-c('GDP','Population','Area')
out<-outer(asia.countires,info,FUN=paste,sep='-')
class(outer(asia.countires,info,FUN=paste,sep='-'))

as.vector(out)

res<-outer(asia.countires,asia.countires,paste,sep='-')


#하삼각, 상삼각 행렬
lower.tri(res)
!lower.tri(res)
res[lower.tri(res)]
res[!lower.tri(res)]


#substr:텍스트의 특정 부분 문자열 추출
substr('Data Analytics',1,4)
substr('Data Analytics',6,14)

#substring():마지막 위치 생략 가능
substring('Data Analytics',6,14)
substring('Data Analytics',6)

myclass<-c('Data Analytics','Data Mining','Data Visualization')
substr(myclass,1,4) #벡터별 1~4위치 무자열 추출
substr(myclass,nchar(myclass)-5,nchar(myclass))


islands
str(islands)
landmasses<-names(islands)

#grep(pattern='') 특정 문자열을 포함한 문자열의 인덱스
#value=T 옵션으로 바로 출력도 가능
grep(pattern='New',x=landmasses)
landmasses[grep(pattern='New',x=landmasses)]

grep(pattern='New',x=landmasses,value=T)


#ex1,두개 이상으로 된 것 출력
grep(pattern=' ',x=landmasses,value=T)

landlst<-strsplit(landmasses,' ')
lengthland<-lapply(landlst,length)

lapply(landlst[lengthland>1],paste,collapse=' ')


#sub():pattern 첫번째,gsub():pattern모두
txt<-  'Data Anal is useful. Data Anal is interesting'
sub(patter='Data',replacement = 'Business',txt)
gsub(patter='Data',replacement = 'Business',txt)


x<-c('input.csv','data.csv','big.csv')
gsub(patter='.csv',replacement='',x)


#finance.yahoo.com->samsung ->historical data->download

?read.csv
# read.csv(file, header = TRUE(열이름), sep = ",", quote = "\"",
#          dec = ".", fill = TRUE, comment.char = "", ...)

df<-read.csv('samsung.csv',header=T,sep=',')
df

#default :header=T,sep=','
df2<-read.csv('samsung.csv')
df2

df3<-read.csv('samsung.csv',header=F)
df3
