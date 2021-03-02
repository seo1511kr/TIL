
# 1. for문으로 다음과 같이 월 이름을 출력
# The month of January
# ...
# The month of December
month
for (i in month)print(paste('The month of',i))
paste('The month of',month)
# 2. 짝수이면 TRUE, 홀수이면 FALSE를 출력하는 함수 작성.
# 다음 벡터로 테스트하시오.
# c(-5:5)
iseven<-function(x){
  ifelse(x%%2==0,TRUE,FALSE)
}
iseven(1:6)

# 3. 짝수 개수를 세는 함수 작성.
# 다음 벡터로 테스트하시오.
# c(-5:5)

counteven<-function(x){
  sum(ifelse(x%%2==0,TRUE,FALSE))
}
counteven(1:8)

# 
# 4. 주어진 숫자가 원주율보다 크면 TRUE, 아니면 FALSE를 출력하는 함수 작성.
# 3과 1:5 벡터에 대해 테스트하시오
bigpi<-function(x){
  ifelse(x>pi,TRUE,FALSE)
}
bigpi(3)
bigpi(1:5)


# 5. 주어진 그림과 같은 데이터프레임을 생성하여
# df_midterm에 저장하시오
# - 각 과목별 평균을 구하시오.
# - 각 번호별 평균을 구하시오.

english<-c(90,80,60,70)
math<-c(50,60,100,20)
class<-c(1,1,2,2)
df_midterm<-data.frame(english,math,class)
df_midterm
colMeans(df_midterm[-3])
rowMeans(df_midterm[-3])


# 6. 2~99까지 수에 대해
# - 3의 배수에 해당하는 수의 합계를 구하시오.
# - 3의 배수에 해당하는 수의 개수를 구하시오.
# 
# 7. 임의의 수 n을 전달받아, n!을 출력하는 함수를 완성하시오. (n>=2, 5!=5*4*3*2*1)
fact<-function(x){
  res=1
  for(i in 1:x)res=res*i
  return(res)
}
# 8. 반복문을 이용하여 구구단을 출력하시오
dan<-1:9
mul<-1:9
for(i in dan)print(paste(c(i,"단",i*mul),collapse=' '))
# 9. 반복문을 활용하여 출력하시오
# *
#   ***
#   *****
#   *******
i=1
while(i<=4){
  vec<-as.character(1:(2*i-1))
  print(paste(gsub('\\d','*',vec),collapse=''))
  i=i+1
}




#   10.  타이타닉 데이터 전처리
# - train.csv 파일 읽을 때 "" 는 na로 처리하시오.
titanichw<-read.csv('data/train.csv',na.strings = "")
titanichw

# - Surived 컬럼의 타입을 확인하시오.
str(titanichw)
class(titanichw$Survived)
mode(titanichw$Survived)
typeof(titanichw$Survived)

# - Survived 컬럼의 타입을 factor 타입으로 바꾸어 저장하시오
titanichw$Survived<-factor(titanichw$Survived)
is.factor(titanichw$Survived)
class(titanichw$Survived)
str(titanichw)

# write.csv(titanichw,'data/SFtitanic.csv')
# write해버리면 다시 integer로 바뀜









