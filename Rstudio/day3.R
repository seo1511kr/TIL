# 배열? 행렬의 일반화된 데이터 형식, 차원을 속성으로 갖음.
# 벡터, 행렬 모두 배열이라고 할 수 있음.

#dim()활용
a<-1:24
dim(a)<-c(3,4,2)
a

#array()활용
ary<-array(1:24,c(3,4,2))
ary[1,3,2]
ary[1,,]
ary[,1,]


#drop=FALSE활용
ary[,,2]
ary[,1,2,drop=FALSE]


#리스트는 다양한 데이터 타입을 저장할 수 있음
#벡터와 행렬은 원소의 데이터 타입이 모두 같아야 함
lst<-list(0.6,0.9,0.5)
lst
#[[1]]은 원소의 위치(인덱스)를 의미
#[1] 0.6은 원소의 값

#리스트에는 스칼라, 벡터(숫자/문자), 행렬, 함수 저장가능
lst<-list(1.5,'apple',c(2,3,4),matrix(1:6,ncol=3),mean)
lst


lst<-list()
lst[[1]]<-1.5
lst[[2]]<-'apple'
lst[[3]]<-c(2,3,4)
lst[[4]]<-matrix(1:6,ncol=3)
lst[[5]]<-mean
lst


#리스트 index에 이름 부여
lst<-list(0.6,0.9,0.5)
lst
names(lst)<-c('n1','n2','n3')
lst

#참조 방법이 바뀜
lst$n1
lst
names(lst)
length(lst)

#[[n]], [n]차이
# lst[[n]]: n번째 원소가 선택, 원소의 저장 형식을 그대로 출력
# lst[n]: 원소가 리스트 형식으로 출력 => 연산이 안됨

product<-list('a001','mouse',30000)
product[[1]]
product[1]

class(product[1])
class(product[[1]])

product[[3]]*3
product[3]*3 #Error  이항연산자에 수치가 아닌 인수입니다

product[c(1,2)]
product[1:2]
product[c(TRUE,FALSE,TRUE)]
product[-1]


product<-list(id='a001',name='mouse',price=30000)
product

#원소
product$name
product[['name']]

#리스트
product['name']
product[c('name','id')]

#null과 error
product[['nn']] #null없는 이름
product[[4]] #error 없는 인덱스


lst<-list(one=1,two=2,three=list(a=3.1,b=3.2))
lst
lst[['three']]
lst$three
lst['three']

lst[['three']]$a
lst$three$a
lst[['three']][['a']]


#원소값 변경, 추가
product<-list(id='a001',name='mouse',price=30000)
product$price<-50000
product[['price']]

# 값을 1개만 할당할 때는 [[]] 나 []나 차이가 없음
class(product[3])
product[3]<-50000
product

# 값을 여러 개 할당할 때 
# [[]]는 할당 데이터가 벡터 형식
# []는 할당 데이터가 리스트 형식

product[[3]]<-c(40000,50000)
product

product[3]<-list(c(40000,50000))

# 두 개 이상의 원소 값들을 동시 변경
product[c(1,2,3)]<-list('a02','monitor',99999)
product
product[[4]]<-c('domestic','export')
product$madein<-c('korea','india')
product
product[['pdate']]<-c(20120202,20200202)
product

product['madein3']<-list(c('usa','cda'))

#원 데이터의 타입이 일정하지 않으면 반드시 리스트로 저장하기
product[8:10]<-c(0.2,0.1,'z')
product #문자열로 바뀌어 저장됨

product[8:10]<-list(0.2,0.1,'z')
product


# 리스트의 이름과 값을 한 번에 지정하기
n<-c('one','two','three')
v<-c(100,200,300)
mylist<-list()
mylist[n]<-v
mylist


#리스트에서 원소 제거는 NULL을 할당
mylist[['two']]<-NULL
mylist

mylist[1:2]<-NULL
mylist

#조건에 따른 원소 제거
mylist[mylist<200]<-NULL
mylist


#리스트 결합

w1<-list('a','b','c')
w2<-list('d','e','f')
c(w1,w2)


#r의 수치연산 관련 함수 대부분은 벡터 자료구조를 사용
#리스트 자료구조를 벡터화 시켜야함
mydata<-list(1.5,2.0,3.5,4.5)
mydata
?mean
mean(mydata)

mean(unlist(mydata))


#데이터프레임: 행과 열로 구성, 2차원 구조
#행렬은 모든 데이터 타입이 일치
#데이터프레임은 서로 다른 데이터 타입을 가질 수 있음
#데이터프레임은 2차원구조, 리스트는 1차원 구조
#동일한 길이의 벡터로 이루어진 리스트를 구성요소로 하는 2차원 데이터

#data.frame()
v1<-c('a1','a2','a3')
v2<-c(10,20,30)
c3<-c('x','y')
data.frame(v1,v2)

data.frame(v1,v2,v3) #길이가 다른 벡터 불가능

v3<-c('x','y','z')
df<-data.frame(v1,v2,v3)

str(df)
# 'data.frame':	3 obs. of  3 variables:
#   $ v1: chr  "a1" "a2" "a3"
# $ v2: num  10 20 30
# $ v3: chr  "x" "y" "z"

#3 obs(instance, object) 관측치(샘플)
#3 variables(features)
# ex 이미지 데이터 feature 10000개 (100*100)
# 각각의 이미지가 10000차원 공간에 점으로 표시됨
# 점들 사이의 거리를 구할 수 있음
# 유클리디안 거리 또는 코사인 유사도 등 알고리즘으로 유사한 데이터를 찾을 수 있음.



#유클리디안 거리
#피처값 차이의 제곱의 합

data.frame(row.names = v1,v2,v3)
p<-data.frame(id=v1,name=v2,price=v3)
str(p)

v1<-c("a1","a2","a3")
v2<-c(10,20,30)
v3<-c("x","y","z")
df<-data.frame(v1,v2,v3)
p<-data.frame(id=v1, price=v2, name=v3)
p
str(p)

#데이터프레임 생성할 때 문자열 데이터를 팩터로 지정
# stringAsFactors=TRUE
p<-data.frame(id=v1, price=v2, namne=v3,stringsAsFactors = TRUE)
p
str(p)

#as.data.frame
mat<-matrix(c(1,2,3,4,5,6),ncol=2)
num<-as.data.frame(mat)
colnames(num)<-c('1st','2nd')
num

v1<-c("a1","a2","a3")
v2<-c(10,20,30)
v3<-c("x","y","z")
lst<-list(v1,v2,v3)
p<-as.data.frame(lst)
p
colnames(p)<-c('1st','2nd','3rd')

#length(), 행렬에서는 데이터 개수, df에서는 열의 개수
length(mat)
length(p)
ncol(p)
nrow(p)


#datasets패키지
#https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html

str(state.abb)
str(state.name)
str(state.region)
str(state.area)

us.state<-data.frame(state.abb,state.name,state.region,state.area)
us.state
str(us.state)

#[]: dataframe구조,[[]] :벡터구조
us.state['state.name']
us.state[['state.name']]

us.state[2]
us.state[[2]]

# 다수의 열 추출=> [] 대괄호 한 개만
us.state[1:4]
us.state[c(1,2,3)]

#행렬 인덱싱 사용 가능,벡터로 출력됨
us.state[,2]
us.state[,2,drop=FALSE]
us.state[,c(2,4),drop=FALSE]
us.state$state.abb
us.state[c('state.name','state.area')]#리스트 인덱싱
us.state[,c('state.name','state.area')] #행렬인덱싱



id<-c('a1','a2','a3')
price<-c(10,20,30)
name<-c('x','y','z')
product<-data.frame(id,name,price)
product
str(product)

product<-rbind(product,c("a4",'k',40))
product

#데이터 삭제
product<-product[-4,]
product

#여러 행 추가
new.rows<-data.frame(id=c('a5','a6'),
                     name=c('a','b'),
                     price=c(50,60))
new.rows
product<-rbind(product,new.rows)
product

product$price<-as.numeric(product$price)
str(product)
