# 1. : 연산자 활용 벡터 생성
# 
# 1~10
# 
# 10~1
# 
# 1~10~1

x<-seq(1,10)
seq(10,1,-1)
c(x,seq(9,1,-1))


# 
# 2. 3.141592에 대해 반올림 관련 함수를 다양한 방식으로 확인해보시오
# 
# ex) siginif(pi, digits=3)
# 
signif(pi, digit=3)
round(pi, digit=2)
round(pi,digit=-1)
round(pi)
floor(pi)
floor(-pi)
ceiling(pi)
ceiling(-pi)
trunc(pi)
trunc(-pi)

# 3. 
# 
# 키: 180, 160, 165, 185, 155
# 
# 몸무게:75, 70, 60, 100, 65
# 
# BMI를 구하시오. BMI=몸무게(KG)/키(m)제곱
# 
# bmi가 25보다 큰 사람의 몸무게를 출력하시오.
# 
height<-c(180,160,165,185,155)/100
weight<-c(75,70,60,100,65)

BMI<-weight/height^2
BMI[BMI>25]


# 4.
# 
# sum함수와 논리연산을 이용하여 1~100까지 정수 가운데 7의 배수인 정수 개수를 구하시오.
# 

sum(1:100%%7==0)

# 
# 5. 변수 x에 1~10까지 값을 할당하고 이 값들을 평균0과 표준편차1로 표준화하시오.
# 
x<-1:10
(x-mean(x))/sd(x)

# 6. 개인별 데이터 분석 주제를 찾아보세요(case study)



