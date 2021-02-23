# 1. 변수 x에 1~10까지 값 할당, y에 3~1까지 값 할당
# - letters 상수벡터를 이용하여 x에 알파벳 소문자 이름 부여
# - x+y를 수행하고 결과를 설명
x<- 1:10
x
y<-seq(3,1,-1)
y

names(x)<-letters[1:10]
x

x+y # (y가 3,2,1,3,2,1,3,2,1,3 처럼 계속 반복되면서 길이를 맞춤)

# 2. 숫자 2,5,3을 원소로 갖는 벡터 생성한 후 rep함수를 이용하여 다음 벡터를 생성
# - 2,5,3,2,5,3,2,5,3,2,5,3,2,5,3
# - 2,5,3,2,5,3,2,5,3,2
# - 2,2,5,5,5,5,5,3,3,3

a<-c(2,5,3)
a
rep(a,times=5)
rep(a,length.out=10)
b<-rep(a,each=3)
b[c(3,7)]<-5
b[10]<-3
b
# 3. 주사위를 7번 던져서 나온 3,2,5,1,5,6,5의 값을 
# 1)여섯 개의 레벨을 갖는 팩터로 저장하시오.
# 2)각 레벨에 one, two, ... six로 이름 부여하시오.
# 3)레벨별 발생 빈도를 출력하시오.

res<-c(3,2,5,1,5,6,5)
res
res.factor<-factor(res,levels=c(1,2,3,4,5,6),labels = c('one','two','three','four','five','six'))
res.factor
table(res.factor)

# 4. 1~12까지의 숫자 벡터로 3*4행렬 생성하고 변수에 저장하시오.
# 알파벳 소문자 상수 벡터 letters를 이용하여 행과 열이름을 각각 지정하시오.
# a  b   c   d
# a  1  4
# b 2   5   ...
# c  3  6       12

nums<-1:12
mat<-matrix(nums,3,4,dimnames = list(letters[1:3],letters[1:4]))
mat

# 5. 4번에서 생성한 행렬로부터 1번째와 3번째 열을 추출하여 부분행렬을 생성하고,
# 2번째와 4번째 열을 추출하여 부분행렬을 생성하고,
# 이들을 열의 방향으로 결합한 새로운 행렬을 생성하시오.


submat1<-mat[,c(1,3)]
submat2<-mat[,c(2,4)]
newmat<-cbind(submat1,submat2)


# 6. 4번과 5번문제에서 생성한 두 행렬에 대해 +, -, *, /, %*% 연산을 수행하시오


addmat<-mat+newmat
addmat
subsmat<-mat-newmat
subsmat
mulmat<-mat*newmat
mulmat

matmulmat<-mat%*%t(newmat)
matmulmat
# 7. 1~9999까지 정수로 9개의 열을 갖는 행렬을 생성하시오.
# 마지막 세 개 행과 마지막 두 개 열로 구성된 3*2 부분행렬을 만드시오.


ele<-1:9999
elemat<-matrix(ele,ncol=9)
elemat
nrow(elemat)
subelemat<-elemat[1109:1111,8:9]
subelemat
