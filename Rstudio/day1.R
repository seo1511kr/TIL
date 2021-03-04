print('hello')
print(
  "hello"
)
print('hello')
print('hello')
print('hello')
print('hello')
print(
"hello"
)
print('hello')
print(
"hello"
)

# ?함수 help창에 설명이 나옴
?print
?apply

# 변수 저장 <-
a<-3
a
print(a)

# 스칼라, 벡터, 행렬 데이터프레임, 리스트, 텐서
# 벡터: 데이터분석에서 자료의 기본형(여러개의 숫자가 특정한 순서로 모여있는 것)
# 스칼라:길이가 1인 벡터
# 텐서: 크기가 같은 행렬이 여러개


# 벡터
# 4차원 벡터: (키,몸무게,시력,나이) 이렇게 데이터 순서가 있어야함.
# 벡터는 하나의 유형으로 표현됨. 숫자형 데이터, 문자형 데이터
# N차원 벡터: N=>벡터를 이루는 데이터의 개수
# 이미지 데이터(100*100 픽셀) => 10000개의 데이터
# ex) (250,225,0,0,...,210,255) 10000차원 벡터
num <- c(1,2,3)# concatenate
cha <- c('x','y','z')
c(num,cha) #하나의 유형으로 통일됨.

a<-c(1,2,3)
odd<-c(1,3,5)
even<-c(2,4,6)
c(odd,even)

# 연속되는 수열
3:9
5:-1

# seq (from, to, by, length.out)증감치 설정 수열
seq(from=3, to=9)
seq(from=3, to=9, by=0.5)
seq(from=9, to=3, by=-0.5)

?seq
seq(from=0, to=100, length.out=5)

# rep(data,times, each, length.out)
rep(7,times=3)
rep(c(1,2,3),times=3) #1 2 3 1 2 3 1 2 3

rep(c(1,2,3),each=3) # 1 1 1 2 2 2 3 3 3

rep(c(1,2,3),length.out=8)# 1 2 3 1 2 3 1 2


# str: 벡터의 유형 및 구조 확인
str(c(1,2,3,'d')) # 전부 chr로 변형
str(num)
str(cha) # 벡터의 길이:3, 3개의 원소를 갖는 1차원 벡터

length(num) #길이만 볼 때



#상수벡터
LETTERS
letters
month.abb
month.name
pi

# 벡터참조: 1부터 시작
month <- c(12,9,3,5,1)
month[1]
month.name[2]
month.name[c(2,3)] # 여러개 참조

# ex 주식 데이터 벡터(시가, 종가, 거래량=> feature)
# feature의 개수를 차원이라고 생각하자

# 벡터화(vectorized) 연산 => 속도가 빠르다
# 벡터화 연산의 규칙: 벡터끼리 길이가 같아야 함. 
x<-c(1:3)
x
y<-c(4:9)
y
x+y #길이가 짧은 벡터의 길이를 길이가 긴 벡터만큼 늘림

c(1,2,3)+c(2,3,4)
c(1,2,3)*c(2,2,3)
c(2,4,6)/c(2,2,3)
2^10
c(10,11,12)%%c(3,3,2) # 나머지
c(10,11,12)%/%c(3,3,2)# 몫몫

x<-c(seq(1,6,2))
x+10
x<-c(seq(1,6,2))
x+c(10,20) #경고는 나오지만 결과는 나옴

# 논리 연산자
# (==, !=, < , > , <=, >=, !x, x|y, x&y)

v<-pi
w<-10/3
v==w
v!=w
v>w
!(v>w)
(v==w)|(v<w)
(v==w)&(v<w)
isTRUE((v==w)&(v<w))
isTRUE((v==w)|(v<w))

x<-c(1,3,5)
y<-c(3,3,3)
x==y
x==3

# true =1, false =0
as.numeric(TRUE)
as.numeric(FALSE)
TRUE+FALSE
TRUE*FALSE

x <-c(0,25,50,75,100)
x>50

sum(1:5)
sum(1:2,3)
sum(1:2,3:5)
sum(TRUE,FALSE,TRUE)

sum(x>50)
any(x>50)
all(x>50)

# 2의 제곱근의 제곱은 2가 안나옴, 부동소수점수 연산
sqrt(2)^2==2
sqrt(2)^2-2

# 수치 비교시 정밀도 문제 해결
all.equal(sqrt(2)^2,2)

# 문자열 다루기 paste():문자벡터 결합
fruits<-c('Apple','Banana','Strawberry','Mango')
food<-c('Pie','Juice','Cake')
# fruits+food error
paste(fruits,food) #길이 알아서 맞춤
paste(fruits,'Juice')

# abs(): 절대값
x<- -3:3
abs(x)
# log(,base=) or log2(), log10()...
log(abs(x)) #디폴트는 자연로그
log(abs(x),base=2) #log(data, base=2)
log2(abs(x))
log10(1:10)

#exp: 밑수가 e인 지수값
y<-exp(1:5)
y
log(y)

#factorial , combination
factorial(1:5)
choose(5,2) # nCr= n!/(n-r)!*r!


#sqrt(), 기본 유효자릿수 7자리
sqrt(1:5)

# signif()유효자릿수 확인, round()반올림
options('digits')
signif(456.789, digits=2)
signif(456.789, digits=3)
signif(456.789, digits=4)
signif(456.7891, digits=6)

round(456.789,digits=1)
round(456.789,digits=2)
round(456.789,digits=-1)
round(456.789,digits=-2)
round(456.785,digits=2)

# 반올림 숫자가 5인 경우에 가까운 짝수로 반올림
round(12.5)

# quiz 1~10까지 수에 대한 각각의 제곱근을 구한다음
# 소수이하 2자리까지 출력
x<-1:10
round(sqrt(x),digits=2)

# floor, ceiling, trunc 0에 근접한 방향으로(양수, 음수)
floor(456.78)
floor(-456.78)

ceiling(456.78)
ceiling(-456.78)

trunc(456.78)
trunc(-456.78)


# infinity 다루기
# 1.8*10의 308승까지 표현
3/0
5-Inf
Inf*Inf
Inf*(-Inf)
10^306

# is.infinite
is.infinite(10^(306:310))

# NaN(Not a Number: 숫자가 아님, 계산 결과를 정의할 수 없다.)
Inf/Inf
Inf*0
log(-2)
NaN+3
is.nan(sqrt(-2))
is.nan(Inf/Inf)

# NA(Not Available, 결측값)
k<- NA
k+2
sqrt(NA)

# 다양한 계산
z<-1:6
z
sum(z)
prod(z)
min(z)
max(Z)
mean(z)
median(z)
var(z)
sd(z)
range(z) #범위 최소,최대

# 결측값을 제외하고 계산하기
# na.rm=TRUE, na.omit(z) 
z<-c(z,NA)
z

sum(z, na.rm=TRUE)

na.omit(z)
sum(na.omit(z))

# cumsum함수: 누적합
traffic.death <- c(10,20,30,20)
cumsum(traffic.death)


traffic.death <- c(10,20,NA,20,30) # NA이후부터 고장남
cumsum(traffic.death)

traffic.death <- c(10,20,30,20) # 뒤에서 앞을 뺌
diff(traffic.death)

traffic.death <- c(10,20,NA,20,10)
diff(traffic.death)

diff(1:10, lag=3) # 4-1, 5-2, ..10-7


#집합================================================================
p<-1:10
q<-6:15
union(p,q)
intersect(p,q)
setdiff(p,q)
setequal(p,q)

# 첫 번째 인수에 오는 값이 두번째 벡터의 원소인지 테스트
# is.element()
is.element(3,1:5)
is.element(6,1:5)
is.element(4:7,1:5)


# 벡터 indexing
num<-0:30
num[5]
num[5:10]
num[c(2,4,5,10)]


prime<-c(1:10)
idx<-c(1,3,5)
prime[idx]
prime[3:5]
prime[-3] # 3번 인덱스 빼고 다
prime[-2:-4] #2~4번 인덱스 제외
prime[-(2:4)]


prime<-c(2,3,5,7,11,13)
length(prime)
prime[1:(length(prime)-2)]
prime[-length(prime)]

#원소변경
prime[2]<-30 
prime[c(3,4)]<-c(30,40)
prime
