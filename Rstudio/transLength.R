# 스크립트: 특정 기능을 수행하기 위한 명령어 집합

# ex1. 야드를 미터로 변환하는 스크립트
x<-c(30,50,90)
tLength<-x*0.9144
tLength<-round(tLength,1)

result<-paste(tLength,'m',sep='')
print(result)

