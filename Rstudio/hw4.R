# 1.다음 물음의 답을 R 언어로 나타내시오.
# 
# ① 자료 -0.2, 1, 2, 1.5, 2.2를 자료벡터로 x로 저장하라.
# ② "Kim", "Lee", "Park", "Lim"을 자료벡터 name으로 저장하라. 
# ③ 2부터 9까지의 정수벡터를 생성하라.
# ④ 0부터 10까지 0.5씩 증가하는 실수 벡터를 생성하라.
# ⑤ 정수 1,2,3이 3번 반복하는 벡터를 생성하라.

x<-c(-0.2, 1, 2, 1.5, 2.2)
name<-c("Kim", "Lee", "Park", "Lim")
a<-2:9
b<-seq(0,10,0.5)
c<-rep(c(1,2,3),each=3)
c
c<-rep(c(1,2,3),times=3)
c
# 2.x=c(2, -1, 3, 7, 0.5, 8)가 실행되었다 하자. 다음 물음을 R 언어로 답하시오.

x<-c(2, -1, 3, 7, 0.5, 8)
# ① 5번째 원소는?
x[5]

#   ② 첫 번째부터 3번째까지의 원소는?

x[1:3]
#   ③ 6, 2, 4번째 원소를 동시에 찾아라.
x[c(6,2,4)]
# ④ 3번째 원소를 제외한 나머지 원소는?
x[-3]
#   ⑤ x의 원소 중 0보다 큰 값을 찾아라.
x[x>0]
# ⑥ 짝수 원소들을 찾아라.
x[x%%2==0]
# ⑦ x에서 홀수원소를 찾아 제거하라.
x<-x[x%%2==0]
x
# 3.패키지에 내장된 데이터 cats는 다음 3개의 변수로 구성되어 있다.
# library(MASS) # MASS패키지를 로드
library(MASS)
# head(cats)    # cats데이터프레임의 앞 줄 보기
head(cats)
# -생쥐 자료(cats)의 자료의 수를 구하시오
str(cats)
nrow(cats)
ncol(cats)
dim(cats)
# -생쥐의 몸무게와 심장의 무게(Bwt와 Hwt)의 평균과 표준편차를 구하라.
colMeans(cats[2:3],na.rm = TRUE)
sd(cats$Bwt)
sd(cats$Hwt)
# -생쥐의 암수별 몸무게와 심장의 무게의 평균과 표준편차를 각각 구하라.
mcat<-cats[cats$Sex=="M",]
mean(mcat$Bwt)
sd(mcat$Bwt)
mean(mcat$Hwt)
sd(mcat$Hwt)

fcat<-cats[cats$Sex=="F",]
mean(fcat$Bwt)
sd(fcat$Bwt)

mean(fcat$Hwt)
sd(fcat$Hwt)


 
# 
# 4. 벡터 d1, d2가 다음과 같을 때 각 문제를 수행하기 위한 코드를 작성하고 답을 구하시오.
d1 <- 1:50
d2 <- 51:100
# d1, d2의 값을 출력하시오.
print(d1)
print(d2)
# d2의 길이(원소의 개수)를 보이시오.
length(d2)

# d1+d2, d2-d1, d1*d2, d2/d1의 각각의 결과를 출력하시오.
data.frame(d1+d2, d2-d1, d1*d2, d2/d1)

# d1, d2의 값들의 합을 각각 출력하시오.
sum(d1)
sum(d2)
# d1, d2에 있는 모든 값들의 합을 출력하시오.
sum(c(d1,d2))

# d2에서 가장 큰 값과 가장 작은 값을 출력하시오.
max(d2)
min(d2)
# d2와 d1의 값들의 평균값을 각각 구하고 두 평균의 차이를 출력하시오.
m1<-mean(d1)
m2<-mean(d2)
m2-m1


 
# 5.다음과 같이 벡터 v1을 생성한 다음 각 문제를 수행하기 위한 코드를 작성하고 답을 구하시오
# (문제를 풀다 보면 v1의 내용이 변경되기도 하는데, 모든 문제는 최초의 v1을 대상으로 하여 해결 할 것).
# v1<- 30:100 벡터 생성 후,
v1<- 30:100
# v1에서 60보다 작은 수를 모두 출력하시오.
v1[v1<60]
# v1에서 70보다 작은 수가 몇 개인지 출력하시오.
length(v1[v1<70])
# v1에서 65보다 큰 수들의 합을 출력하시오.
sum(v1[v1>65])

# v1에서 60보다 크고 73보다 작은 수를 모두 출력하시오.
subset(v1,subset=(v1>60 & v1 <73))
# v1에서 65보다 작거나 80보다 큰 수를 모두 출력하시오.
subset(v1,subset=(v1<65 | v1 >80))

# v1에서 7로 나누었을 때 나머지가 3인 수를 모두 출력하시오.
v1[v1%%7==3]

# v1에서 7의 배수들은 값을 0으로 변경하시오.
v1[v1%%7==0]<-0
v1
# v1에서 짝수를 모두 합한 값을 출력하시오.
v1[v1%%2==0]
sum(v1[v1%%2==0])

# v1에서 홀수이거나 80보다 큰 수를 모두 출력하시오.
v1[v1%%2!=0 | v1>80]

# v1에서 3과 5의 공배수를 출력하시오.
v2<-v1[v1%%3==0 & v1%%5==0]
v2[v2>0]
# v1에서 짝수에 대해서만 2를 곱하여 저장하시오.
v1[v1%%2==0]<-v1[v1%%2==0]*2
v1
# v1에서 7의 배수들을 제거한 후 v1의 내용을 출력하시오.
v1<-v1[v1!=0]
v1
# 6. iris데이터에서
iris
target<-c(4.0, 3.0, 1.5, 0.15)
new<-rbind(iris,target)
tail(new)
msl<-mean(new$Sepal.Length)
msw<-mean(new$Sepal.Width)
mpl<-mean(new$Petal.Length)
mpw<-mean(new$Petal.Width)

ssl<-sd(new$Sepal.Length)
ssw<-sd(new$Sepal.Width)
spl<-sd(new$Petal.Length)
spw<-sd(new$Petal.Width)



# Sepal.Length Sepal.Width Petal.Length Petal.Width 값이 각각 
# (4.0, 3.0, 1.5, 0.15)일때 예상되는 종(setosa, verisicolor, virginica)을 출력하시오
# (4.0, 3.0, 1.5, 0.15)와 가장 유클리디안 거리가 가까운 데이터를 9개 찾아낸다
# 9개의 데이터에 대한 종별 빈도수를 기반으로 유추
# ex) setosa:6, veri:2, vir:1 => setosa 예상
# 
dim(t(new[1:4]))
infomat<-t(new[1:4])
# 열단위로 계산하기 위해서 transpose


infomat
#표준화
# infomat<-(infomat-c(msl,msw,mpl,mpw))/c(ssl,ssw,spl,spw)
# infomat

dist<-(infomat-infomat[,151])^2
dist<-sqrt(colSums(dist))
dist
data.frame(dist)
new<-cbind(new,dist)
new
tail(new)
sort(new$dist)[1:10]

key<-sort(new$dist)[10]
key
new$Species[new$dist<=key]
new[new$dist<=key,]


summary(new$Species[new$dist<=key])


