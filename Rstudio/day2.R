a <- 1:20
a
a[c(1,2,5,6,21)] <- 99
a[24]<-99
a

# 중간에 빈 공간은 NA로 나옴
a[a<10]
a[c(TRUE,FALSE)]


#which():논리값 ->  TRUE위치 인덱스 추출 함수
#which.max(), min()함수도 있음

data <-c(100:110)
data
which(data>105)
which.max(data)
which.min(data)



#names()
traffic.death<-c(100,90,80,70,120,150,200) #월~일 사망자 수
traffic.death[6]
names(traffic.death)<-c('mon','tue','wed','thu','fri','sat','sun')
traffic.death['sat']


traffic.death>=100
traffic.death[traffic.death>=100]


#factor와 level
#factor 카테고리 구분 목적의 범주형 데이터
#level 범주값
#factor()
review<-c('good','good','bad','indiff','bad','good')
review


# 결과창에 곁따옴표가 없음, level 나옴
review.factor <- factor(review)


# 순서는 알파벳 순서
str(review.factor)
review.factor

# 팩터형 -> 숫자벡터로 변환
as.numeric(review.factor)
str(as.numeric(review.factor))


# 팩터함수를 이용할 때 주의: 보유한 데이터셋에 빠져있는 level이 없는지 확인하기
# 빠져있다면 levels를 따로 설정
everyday<-c('mon','mon','wed','fri')
everyday.factor<-factor(everyday, c('mon','tue','wed','thu','fri','sat','sun'))
levels(everyday.factor)


levels(review.factor)<-c('B','G','I')
review.factor

nlevels(review.factor)
length(levels(review.factor))


# 서열팩터(ordered factor): 순서가 있는 범주형 데이터, 부등호 기호로 서열 표시
# ordered=TRUE 옵션

eval<-c('Medium','Low','High','Medium','High')
eval.factor<-factor(eval)
eval.factor

eval.ordered <- factor(eval,levels=c('Low','Medium','High'), ordered=TRUE)
eval.ordered


#table():각 레벨별 빈도
eval.factor
table(eval.factor)
table(eval.ordered)


#label=c()옵션, 숫자형levels에 명칭 붙이기
sex <- c(2,1,2,2,1)
sex.factor<-factor(sex, levels=c(1,2), labels=c('Male','Female'))
sex.factor

# levels에 없는 값이 데이터에 존재할 경우, NA로 표시됨
sex <- c(2,1,2,2,1,0)
sex.factor<-factor(sex, levels=c(1,2), labels=c('Male','Female'))
sex.factor


#행렬
#1. 2차원 벡터, 벡터에 차원을 부여(dim 함수)
#2. matrix함수로도 행렬 생성가능
#3. 결합을 통한 행렬 생성(rbind, cbind)
v<-1:12
dim(v)<-c(3,4)
v
dim(v)


matrix(data=v, nrow=3,ncol=4) # 데이터 열방향
matrix(data=v, nrow=3,ncol=4,byrow=TRUE) # 데이터 행방향


#리스트
rnames<-c('r1','r2','r3')
cnames<-c('c1','c2','c3','c4')
matrix(v,3,4,byrow=TRUE, dimnames = list(rnames,cnames))

matrix(0,3,4)
matrix(NA,3,4)

mat <- matrix(v,ncol=4)
str(mat)
dim(mat)
dim(mat)[1]
nrow(mat)
dim(mat)[2]
ncol(mat)
length(mat)


#벡터가 결합을 통해 행렬생성
v1<- 1:5
v2<-6:10
rbind(v1,v2)
cbind(v1,v2)

#벡터와 행렬 결합
cbind(v1,v2,matrix(5:14,5,2))

#행렬과 행렬 결합
matrix(1:6,2,3)
matrix(7:12,2,3)
rbind(matrix(1:6,2,3),matrix(7:12,2,3))

v<- 1:12
mat<-matrix(v,3,4)
mat

# 벡터 참조시 차원이 축소됨
mat[1,]
mat[,3]

# drop=FALSE 옵션으로 차원 유지
mat[1,,drop=FALSE]
mat[,1:3]
mat[1:3,]
mat[,c(1,4)]
mat[,-c(2,3)]

mat[1,3]<-77
mat

mat[2,]<-c(22,55,22,55)
mat
mat[2,]<-c(22,55) #길이 알아서 맞춰줌
mat[2:3,3:4]<-c(1,2,3,4)
mat
mat[2:3,3:4]

cities<-c('seoul','busan',' daegu','gwangju','jeonju')
mat<-matrix(c(0,350,300,300,200,350,0,50,200,190,300,50,0,180,200,300,200,180,0,80,200,190,200,80,0),5,5,dimnames=list(cities,cities))
mat['seoul','busan']
mat[,'seoul']
mat[c('seoul','gwangju'),]


w<-c(1,2,3,4,5,6)
mtx<-matrix(w,2,3)
mtx


#벡터와는 달리 행렬간 연산에서는 반드시 두 행렬의 차원이 같아야 함
a<-matrix(1:6,2,3)
b<-matrix(1:6,2,3) 

c<-matrix(6:1,3,2)

a+b
a*b
# a+c  배열의 크기가 올바르지 않습니다!


#행렬의 곱셈: 앞의 행렬의 열과 뒤의 행렬의 행이 일치
a%*%c

#전치행렬
t(a)
t(t(a))

#행, 열 단위 연산
rowSums(a)
rowMeans(a)
colSums(a)
colMeans(a)
