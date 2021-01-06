# 1. a 리스트에서 중복 숫자를 제거해 보자.
a = [1, 1, 1, 2, 2, 3, 3, 3, 4, 4, 5]
set(a)
print(tuple(set(a)))

# 2. while문을 사용해 1부터 1000까지의 자연수 중 3의 배수이면서 7의 배수인
# 수의 합을 구해 보자.
i=0
sum=0
while i <1001:
   i+=1
   if i%3==0 & i%7==0: sum+=i
print(sum)


# 3. while문을 사용하여 다음과 같이 별(*)을 표시하는 프로그램을 작성해 보자.
# 1)
# *
# **
# ***
# ****
# *****
i=1
while i <6:
    s="*"*i
    print(s)
    i += 1


# 2)
#      *
#     **
#    ***
#   ****
#  *****
i=1
while i <6:
    s="*"*i
    print(s.rjust(5))
    i += 1
# 3)adv
#      *
#     ***
#    *****
#   *******
#  *********
i=1
while i <6:
    k=2*i-1
    s="*"*k
    print(s.center(9))
    i += 1

######### for문으로 해보기
# for i in range(5): # 줄의 개수
#     for j in range():#*의 개수
#     for k in range():# 공백의 개수



#
# 4.
# for문을 사용해 1부터 100까지의 숫자를 출력해 보자.
for i in range(1,101):
    if i<100:
        print(i,end=" ")
    else:
        print(i)


# 4-1.(adv)==========================================================================
# for문을 사용해 2부터 100까지의 숫자 중에서 소수를(prime number) 출력해 보자.
# *소수란? 1과 자기 자신으로만 나누어 떨어지는 수(ex. 2, 3, 5, 7, 11, 13,...)


for j in range(2,101):
    l = []
    for i in range(1, j+1):
        if j % i == 0:
            l = l + [i]
        else:
            pass
    key = len(l)
    if key == 2:
        if j < 97:
            print(j,end=" ")
        else:
            print(j)
    else:
        pass
######### 최적화 문제를 고려해야함
##### 1. 중간에 이미 소수가 아니라면 더이상 나눠줄 필요가 없음
for num in range(2,101):
    for i in range(2, num+1):
        if num == i:
            print(num,end=" ")
        elif num % i ==0:
            break
##### 2. 제곱근을 활용하기
##### 12의 소인수는 1,2,3,4,6,12
##### 이 중 3까지만 나눠주면 됨
##### 3으로 나눠지면 몫이 4이기 때문에 4로도 나눠지는 것이 되므로
##### 연산의 숫자를 최소화함



#=====================================================================================

# 5.
# A 학급에 총 10명의 학생이 있다. 이 학생들의 중간고사 점수는 다음과 같다.
A=[70, 60, 55, 75, 95, 90, 80, 80, 85, 100]
# for문을 사용하여 A 학급의 평균 점수를 구해 보자.

sum=0
for i in A:
    sum=sum+i
print(sum/len(A))

# 6. 로또 당첨 번호 제작(adv)============================================================
# *주의:중복된 수 나오면 안됨
# 이번 주 로또 당첨 번호 :  3 7 13 22 25 29
import random
lotto=[]
while len(lotto)<6:
    num=random.randrange(1,46)
    if num in lotto:pass
    else: lotto=lotto+[num]
print(lotto)

## 계산 효율성 높이기
lotto=set()
while len(lotto)<6:
    num=random.randrange(1,46)
    lotto.add(num)
print(lotto)

# sample함수 사용하기
import random
random.sample(range(1,46),6)

# random.random()  #0<=~<1 의 난수 발생
# randint(10,20)
# randrange(10,20,1)
# 빅데이터 기반의 로또 추첨기
# 1) 각 번호가 뽑힌 횟수
# 2) 외부 환경 요인(변수)
# ex) 오늘의 날씨와 가장 유사한 과거의 날씨를 검색 or 뉴스 등...
# 종속/ 독립..
#=====================================================================================

# 7. 자판기(pro, 커피 한 잔에 300원이라 가정, 초기 커피는 10개)
# 돈을 넣어 주세요: 500
# 거스름돈 200를 주고 커피를 줍니다.
# 돈을 넣어 주세요: 300
# 커피를 줍니다.
# 돈을 넣어 주세요: 100
# 돈을 다시 돌려주고 커피를 주지 않습니다.
# 남은 커피의 양은 8개입니다.
# 돈을 넣어 주세요: 0
# 종료합니다

#
# coffee=10
# coin=int(input("돈을 넣어 주세요:"))
#
# while coffee>0:
#     if coin >= 300:
#         coffee-=1
#         change= coin-300
#         print("거스름돈 %d 원을 주고 커피를 줍니다." % change)
#         print("남은 커피 수량: %d 잔" % coffee)
#         if coffee == 0:
#             print("감사합니다. 커피가 모두 소진되었습니다. 종료합니다.")
#             break
#         coin = int(input("돈을 넣어 주세요:"))
#
#     else:
#         if coin > 0:
#             shortage=300-coin
#             print("%d 원이 더 필요합니다." % shortage)
#             print("%d 원을 다시 돌려주고 커피를 주지 않습니다." % coin)
#             coin = int(input("돈을 넣어 주세요:"))
#         else:
#             print("종료합니다.")
#             break
