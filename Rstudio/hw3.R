# 1. 다음 리스틍서 A를 a로 변경하시오
# list(c(3,5,7),c("A","B","C))
lst<-list(c(3,5,7),c("A","B","C"))
lst[[2]][1]<-"a"
lst


# 2. 다음 리스트는 중간고사 및 기말고사 점수이다. 
# 중간고사 평균, 기말고사 평균, 전체 평균을 계산하시오
# list(math=list(95,90),eng=list(80,90),kor=list(85,80))
lst<-list(math=list(95,90),eng=list(80,90),kor=list(85,80))
lst<-unlist(lst)
totalmean<-mean(lst)
midmean<-mean(lst[c(1,3,5)])
finalmean<-mean(lst[c(2,4,6)])
midmean
finalmean
totalmean



# 3. 다음은 1월~12월까지 월평균 기온이다.
# -2.4, 0.4, 5.7 12.5, 17.8, 22.2, 24.9, 25.7, 21.2, 14.8, 7.2, 0.4

# 1) 월 이름(Jan~Dec)을 지지정한 리스트를 만드시오.
lst<-list(month.name)
lst
# 2) 0도 미만인 월을 추출하시오
temp<-c(-2.4, 0.4, 5.7, 12.5, 17.8, 22.2, 24.9, 25.7, 21.2, 14.8, 7.2, 0.4)
which(temp<0)
lst[[1]][which(temp<0)]
      
# 3) 연평균 기온보다 작은 월을 추출하시오.
under<-c(which(mean(temp)>temp))
under
lst[[1]][under]
# 4) 연평균 기온보다 큰 월을 리스트에서 제거하시오.
over<-c(which(mean(temp)<temp))
over
lst[[1]]<-lst[[1]][-over]
lst[[1]]




# 4. 리스트 list(a=1, b=2)와 벡터 pi를 결합하여 새로운 리스트를 생성하고,
# 생성한 리스트에서 pi를 추출하시오.


lst<-list(a=1, b=2)
lst
lst[['pi']]<-pi
lst$pi



# 5. 1. 행렬 X가 다음과 같이 정의되도록 R로 작성하라.
#    c1 c2 c3
# r1  1  4  7
# r2  2  5  8
# r3  3  6  9
# ① matrix() 함수를 이용하라.
cnames<-c('c1','c2','c3')
rnames<-c('r1','r2','r3')

mat<-matrix(1:9,ncol=3,dimnames = list(rnames,cnames))
mat
# ② cbind()와 rbind() 함수를 이용하라.
c1<-1:3
c2<-4:6
c3<-7:9

r1<-seq(1,7,3)
r2<-seq(2,8,3)
r3<-seq(3,9,3)

mat<-cbind(c1,c2,c3)
rownames(mat)<-list("r1","r2","r3")
mat

mat<-rbind(r1,r2,r3)
colnames(mat)<-list("c1","c2","c3")
mat


# ③ dim() 함수를 이용하라.

data<-1:9
dim(data)<-c(3,3)
dimnames(data)<-list(c('r1','r2','r3'),c('c1','c2','c3'))
data


# 6. 앞 문제의 행렬 X에 대해 다음을 알아내는 방법을 R로 답하라.
# ① 행과 열의 개수.
x<-mat
x
ncol(x)
nrow(x)
#② 행벡터 및 열벡터의 이름.
colnames(x)
rownames(x)
#③ 원소의 개수
length(x)



# 7. 다음 두 행렬 A, B에 대해 물음에 답하라.
#         A=matrix(c(1,4,1,0,1,2), 2, byrow=T),    B=rbind(c(1,0,1),c(-1,1,-1))
# ① A+B, A-B, B*A, B/A
A<-matrix(c(1,4,1,0,1,2), 2, byrow=T)
B<-rbind(c(1,0,1),c(-1,1,-1))
A
B
A+B
A-B
B*A
B/A


# ② 행렬 A의 2행 벡터를 c(1,2,1)로 치환하라.

A[2,]<-c(1,2,1)
A
# ③ 행렬 B의 1열 벡터와 2열 벡터를 교환하라.
ch1<-B[,1]
ch2<-B[,2]
B[,1]<-ch2
B[,2]<-ch1
B
# ④ 행렬 A의 2행을 제거하라.
A<-A[-2,]
A
# ⑤ 행렬 B에서 1보다 작은 원소를 0으로 치환하라.
B[B<1]<-0
B


# 8. 행렬과 배열(array)의 차이점을 말하고, 3×2×3 배열의 예를 하나 만들어보아라.

# 배열은 벡터의 일반화 된 형태
# 1차원 벡터: 벡터, 2차원 벡터: 행렬,... N차원 벡터
arr<-array(1:18,c(3,2,3))
arr


# 9. 다음과 같은 번호(ID), 성명(name), 성적(score)를 성분으로 하는 리스트가 있다. 물음에 답하라.
# L=list(ID=c(1,2,3), 
#       name=c('Kim', 'Lee', 'Park'),
#       score=c(80, 95, 75))
L=list(ID=c(1,2,3),
      name=c('Kim', 'Lee', 'Park'),
      score=c(80, 95, 75))
L
# ① length(L)은 얼마이며, 이것은 무엇을 의미하는가?
length(L) #:리스트의 개수

# ② 이름 성적 75을 80으로 수정하라.
L$score[3]<-80
L
# ③ L$name=='Park'의 결과를 쓰고, 무엇을 의미하는지 설명하라.
L$name=='Park'
#[1] FALSE FALSE  TRUE 
#:L이라는 리스트 속 name이라는 원소의 벡터안에 원소값이 'Park'라는 값과 같은지

# ④ L$score[L$name=='Park']의 결과를 쓰고, 문장이 무엇을 의미하는지 설명하라.
L$score[L$name=='Park']
# 80
# L리스트 score벡터의 원소값을 name벡터 원소값을 활용하여 indexing

# ⑤ 1번 학생의 이름과 성적을 알아내는 문장을 만들어 보아라.
L
L$name[L$ID==1]
L$score[L$ID==1]




# 10. 다음의 표를 데이터프레임으로 작성해 보아라.
# 
# id	age	sex 	height	weight
# 1	21	'남'	175	80
# 2	22	'여'	165	55
# 3	31	'여'	155	45
# 4	40	'여'	160	50


id<-c(1,2,3,4)
age<-c(21,22,31,40)
sex<-c('남','여','여','여')
height<-c(175,165,155,160)
weight<-c(80,55,45,50)
?data.frame<-''
df<-data.frame(id,age,sex,height,weight)

# 11. 다음 데이터를(자료구조는 자유선택) 저장한 후, 유클리디안 거리를 활용하여 
# 손흥민과 가장 유사하게 평점을 준(거리가 가까운) 사람의 이름과 거리를 
# 출력하시오.
# 
# critics={
# 'BTS':{'밀정':5, '경이로운소문':4, '국제시장':1.5},
# '손흥민':{'밀정':4,'경이로운소문':5, '국제시장':2},
# '레드벨벳':{'밀정':2.5, '경이로운소문':2, '국제시장':1},
# '트와이스':{'밀정':3.5, '경이로운소문':4, '국제시장':5}
# }

cities<-list()
cate<-c('밀정','경이로운소문','국제시장')
cate
BTS<-c(5,4,1.5)
손흥민<-c(4,5,2)
레드벨벳<-c(2.5,2,1)
트와이스<-c(3.5,4,5)
eval<-data.frame(BTS,손흥민,레드벨벳,트와이스)
rownames(eval)<-cate
Udist손흥민<-colSums((eval-손흥민)^2)

mindist<-min(Udist손흥민[-2])
which(Udist손흥민[-2]==mindist)
