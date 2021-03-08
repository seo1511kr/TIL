# 스크립트: 특정 기능을 수행하기 위한 명령어 집합
# transLength.R에 저장된 스크립트 일부를 변경할 때
# 매번 해당 스크립트를 열어 수정해줘야 하는 불편함이 있음.


# 1. 야드를 미터로 변환하는 스크립트 작성해서 사용
x<-c(30,50,90)
tLength<-x*0.9144
tLength<-round(tLength,1)

result<-paste(tLength,'m',sep='')
print(result)

# 2. transLength.R에 저장된 스크립트를 가져와서 사용하기
# source()
source('transLength.R')



#===============================================================

# 함수: 스크립트의 단점 보완
# 함수명<-function(인수){기능}  => 메모리(Ram)에 적재
# ls():메모리에 적재된 변수, 함수 등의 이름이 목록(list)로 출력
transLength<-function(x){
  tLength<-round(x*0.9144,1)
  result<-paste(tLength,'m',sep='')
  return(result)
}

transLength(10)
y<-c(100,150,200)
transLength(y)

# 함수명을 재할당하여 사용도 가능
trans2<-transLength
trans2(y)
trans2('abc') # x가 numeric이 아니라 에러 발생

# if(){}와 is.numeric, return활용하기
transLength<-function(x){
  if (!is.numeric(x)){
    return("not a number")
  }
  tLength<-round(x*0.9144,1)
  result<-paste(tLength,'m',sep='')
  return(result)
}

trans2<-transLength
trans2('abc')

# 함수에서 실행할 문장이 1개인 경우에는 중괄호 생략이 가능
f1<-function(x,y)x+y
f1(1,2)



#quiz1
#피트(feet),인치(inch 변환이 가능한 함수)
#1야드=3피트, 1야드=36인치
# transLength(y,inc)
# 함수 디폴트값 설정.
transLength<-function(x,mult=0.9144,mode='m'){
    result<-paste(round(x*mult,digit=1),mode,sep='')
    return(result)
}

y<-c(100,150,200)
transLength(y,36,'inch')
transLength(y,3,'ft')
transLength(y)

# ... 의 역할, 함수 내부의 함수의 인수들도 사용 가능
transLength<-function(x,mult=0.9144,mode='m',...){
  result<-paste(round(x*mult,...),mode,sep='')
  return(result)
}
transLength(y,digits=3)
transLength(y) # digits의 디폴트인 0 으로 출력

transLength<-function(x,mult=0.9144,mode='m',digits=1){
  result<-paste(round(x*mult,digits=digits),mode,sep='')
  return(result)
}
transLength(y)

#함수 자체를 인수처럼 취급할 수 있음
transLength<-function(x,mult=0.9144,mode='m',FUN=round,...){
  result<-paste(FUN(x*mult,...),mode,sep='')
  return(result)
}
transLength(y,FUN=floor)
transLength(y,FUN=ceiling)
transLength(y,FUN=signif)
transLength(y,FUN=signif,digits=5)



#==============================================================
# 조건문 활용하기(if, ifelse, switch)

#1.if
x<-pi
y<-3

if(x>y)x
if(x>y){
  print(x)
}
if(x<y)x else y

# 조건문은 벡터 연산을 할 수 없다.
# 만약 사용한다면, 첫번째 원소만 적용됨
y<-1:5
if(x<y)x else y

#2.ifelse(조건,참,거짓)활용하여 벡터에 조건문 적용하기
t<-c(T,F,T,F,T)
y<-1:5
n<-0
ifelse(t, y, n)

x<-pi
y<-1:5
ifelse(x>y,x,y)

#mean:평균, median:중앙값

#3.switch함수: 첫번째 인수로 주어진 값에 따라
#두번째 이후의 인수에 지정된 코드가 실행됨
center<-function(x,type){
  switch(type,
        mean=mean(x),
        median=median(x),
        trimmed=mean(x,trim=0.1),
        'choose one of mean, median, and trimmed')
}
x<-c(1:8,100,-200)
center(x,'mean')
center(x,'median')
center(x,'trimmed') #절사평균
center(x,'other')
#절사평균:산술평균(mean)이 outlier(이상치)에 민감하게 반응
#trim=0.1이란 상위 10% 하위 10%을 빼고 처리한다는 뜻.


#===============================================================
# 반복문(repeat,while,for)
# 1.repeaet{if(탈출조건)break else{반복문}}
i<-5
repeat{if(i>25)break
  else{
    print(i)
    i<-i+5
  }
  }

# 2.while(조건){반복문}
i<-5
while(i<=25){
    print(i)
    i<-i+5
}

# 3.for(변수 in 리스트) 반복문
for(i in seq(from=5,to=25,by=5))
  print(i)


# 반복문 주의사항
# 1. 실행 결과는 루프 안에서는 출력되지 않는다.
for(i in seq(from=5,to=25,by=5))
  i #출력안됨

# 2. for 문이 종료된 이후에도 변수는 사라지지 않는다.
i<-1
for(i in seq(from=5,to=25,by=5))i
print(i) #가장 마지막에 i에 할당된 25가 저장되어 있음
d<-data.frame(1:20)
d
for(i in 1:nrow(d)){
  d$copy[i]<-i
}

d
#====================================================================
#데이터 전처리
#수집한 데이터를 R에서 어떤 자료구조로 표현할까?
#자료구조:벡터(하나의 차원)
# 행렬(배열), 리스트, 데이터프레임 등: 두개 이상의 차원

# 행렬/배열: 동일한 데이터 유형으로 구성(numeric, character..)
# 리스트/데이터프레임: 숫자, 문자가 섞여있는 유형

# mode: 데이터 유형(숫자, 문자, 논리, 리스트, 함수)
mode(3.14)
mode(c(3.14,1.5))
mode('Batman')
mode(c('Batman','Superman','Somun'))

mode(factor('High','Med','Low')) #numeric으로 나옴
mode(as.Date('2021-03-02'))#numeric으로 나옴

mode(5>2) #logical
mode(list(1.2,'apple',c(3,4))) #list
mode(mean) #function


d<-as.Date('2021-03-02')
d+1
as.integer(d)  #18666(일), 1970.1.1일을 기준으로 현재까지 경과한 날
length(d)

as.numeric(1.618)
mode(1.618)
as.integer(1.618)
as.character(1.618)
as.numeric('1.234')
mode(as.numeric('1.234'))
as.numeric('test') #변환이 불가능한 경우에는 NA가 출력
as.numeric(c('1.234','test'))

c('-1','1.5','3.14')
mode(10:20)
as.character(10:20)

#논리값도 숫자로 변경 가능
as.numeric(TRUE) #1
as.numeric(F) #0
sum(c(T,F,T))
sum(c(1,3,5,7,9)>4)

# as.타입 , is.타입
#리스트 -> 분석 모델에서 요구하는 타입이 데이터프레임일 때
#r에서는 as.변환하고자 하는 타입()를 이용하여 데이터 변환
x<-list(1,2,3,4,5)
as.data.frame(x)
as.list(x)

vec<-1:6
vec
length(vec)

# 둘의 차이 구분하기
as.list(vec) #벡터의 각 원소가 하나의 리스트로 변환
list(vec) #벡터 전체를 하나의 원소로 갖는 리스트로 변환

#벡터를 행렬로 변환: cbind(),as.matrix(),rbind()
cbind(vec) #열 이름 vec
as.matrix(vec)#열 이름 없음
rbind(vec) #행 이름 : vec
matrix(vec,2,3)

as.data.frame(vec)
as.data.frame(rbind(vec))
rbind(vec) #vector -> matrix ->df
class(rbind(vec))

#행렬을 벡터, 리스트, 데이터프레임

mat<-matrix(1:6,3,2)
as.vector(mat)
as.list(mat)
list(mat)
as.data.frame(mat)

lst<-list(odd=c(1,3,5),even=c(2,4,6))
lst
unlist(lst)
#as.vector함수로 작성해도 아무 변화 없음
as.vector(lst)
identical(lst,as.vector(lst))

lst2<-list(odd=c(1,3,5),even=c('two','four','six'))
lst2
unlist(lst2)

#리스트->행렬: unlist ->벡터를 행렬로 변환
matrix(lst,2,3) #

lstvec<-unlist(lst)
matrix(lstvec,3,2)

#dimnames인수 활용
matrix(lstvec,3,2,dimnames = list(NULL,names(lst)))

#as.dataframe함수: 리스트 -> 데이터프레임으로 변환
#숫자와 문자가 섞여 있으면, 숫자-> 숫자벡타, 문자->문자벡터
lst<-list(odd=c(1,3,5),even=c('two','four','six'))
lstdf<-as.data.frame(lst)
str(lstdf)

#데이터프레임 -> 다른 구조로 변환
#데이터프레임 인덱싱: 열로부터 벡터를 생성
#데이터프레임 행 -> 데이터프레임으로 출력

df1<-data.frame(odd=c(1,3,5),even=c(2,4,6))
df1
str(df1[1,])#행은 데이터프레임으로
str(df1[,1]) #열은 벡터로

str(df1[1])  #데이터프레임으로 열 추출
str(df1[[1]])#벡터로 열 추출

#데이터프레임이 하나의 행 또는 하나의 열로 구성된 경우
#데이터프레임 전체를 벡터로 변환
#데이터프레임 -> 행렬 ->as.vector사용하여 벡터로 변환
df2<-data.frame(odd=c(1,3,5),even=c(2,4,6))
df2
as.vector(df2)

as.vector(as.matrix(df2))

#타입이 다른 데이터 열 as.matrix
df3<-data.frame(odd=c(1,3,5),even=c('two','four','six'))
as.matrix(df3)
as.vector(as.matrix(df3))

#데이터프레임 -> 리스트 :(이전버전에서는)숫자는 그대로, 문자는 팩터로
as.list(df3)
str(as.list(df3))
list(df3)

#데이터프레임->행렬 as.matrix()
#문자, 숫자 섞여있으면 모두 문자로 변환됨
df3
as.matrix(df3)
