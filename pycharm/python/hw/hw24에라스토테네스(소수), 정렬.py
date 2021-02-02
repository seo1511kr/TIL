# 1.

#
# target=int(input())
# times=int(input())
# res=[int(i) for i in input().split()]
# target=10000
# times=4
# res=[10,-10,5,-5]
#
# profit_per=1
# for per in res:
#     profit_per*=(1+per/100)
# final=target*profit_per
# profit=round(final-target,0)
# evalu="same"
# if profit>0:evalu="good"
# elif profit<0:evalu="bad"
# print(profit,"\n",evalu)



# 2.
# 골드바흐의 추측(Goldbach's conjecture)은 오래전부터 알려진 정수론의 미해결 문제로,
# 2보다 큰 모든 짝수는 두 개의 소수(Prime number)의 합으로 표시할 수 있다는 것이다.
# 이때 하나의 소수를 두 번 사용하는 것은 허용한다.
#
# 2보다 큰 짝수 n을 입력 받으면, n=p1+p2 를 만족하는 소수 p1,p2의 페어를 모두 출력하는 프로그램을 작성하시오.
#
# 입력예1: n=26
#
# 출력예1: [[3, 23], [7, 19], [13, 13]]
#
# 입력예2: n=48
#
# 출력예2 [[5, 43], [7, 41], [11, 37], [17, 31], [19, 29]]
# import math
# print(math.sqrt(5))
#





# 수가 굉장히 커졌을 때도 작동할 수 있도록 작성해보았습니다.(N에 100만을 넣어도 2초내로 답이 나옴)

# N//2까지만 소수를 전부 찾아서 N에서 뺐을 때 남은 수가 소수라면 그 쌍을 답 list에 추가하였습니다.
# N에서 가장 작은 소수인 2를 뺐을때 남은 N-2가 소수인지 판단하기 위해서는 (N-2)**0.5까지의 소수가 필요합니다.
# 하지만 N이 5이상이면  N//2 > (N-2)**0.5 의 관계가 성립하여 N//2까지만의 소수를 구하면 됩니다.
#  그리고 에라스토테네스의 체를 이용한다면 (2부터 (N//2)**0.5 중) 소수의 개수만큼만 반복하면 됩니다.

N=int(input()) #N은 4부터 짝수
n=N//2 # N//2 까지의 소수를 찾는 것으로 범위를 좁힘
if N==4:print([2,2]) #예외처리
else:
    def sieve(n): #n=N//2 까지의 소수를 모두 찾아주는 함수
        limit=int(n**0.5)
        prime=[]
        key=list(range(2,n+1))                  #key는 2부터 n까지 소수가 될 수있는 모든 후보
        while key[0]<=limit:                    #(N//2)**0.5 까지의 소수만큼 반복 (N이 20000이어도 25번만 반복하면 됨)
            prime.append(key[0])                # 에라스토테네스의 체를 이용하면 key의 첫번째 원소는 항상 소수임
            key=[i for i in key if i%key[0] !=0] #소수 후보에서 소수의 배수들은 전부 삭제
        return prime+key #삭제하는데 사용했던 원소들과 삭제되지 않고 남아있는 후보들을 합치면 모든 소수가 구해짐

    candi=sieve(n) #[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]
    checkers=[i for i in candi if i<=N**0.5] #[2, 3, 5, 7]

    def isprime(num): # 특정 수가 소수인지 확인해주는 함수(위의 체 함수 결과를 그대로 이용)
        res=True
        for checker in checkers: #[2, 3, 5, 7]로 11의 제곱인 121 전까지는 4번만에 소수인지 확인할 수 있음.
            if num%checker==0:
                res=False
                break
        return res
    answer=[[i,N-i] for i in candi if isprime(N-i)] #candi중 N에서 뺀 나머지도 소수인 수들
    print(answer)









# 3.
# 아마존 면접문제
#
# 다음과 같은 형태의 배열을
#
# [a1,a2,a3...,an,b1,b2...bn]
#
# 다음과 같은 형태로 바꾸시오
#
# [a1,b1,a2,b2.....an,bn]


# #풀이: 수열을 뒤집어서 숫자가 앞에 오도록했음 그리고 문자열 상태의 숫자를 number로 변환하여 숫자가 우선되게 정렬함
# target=["a1","a2","a11","b1","b2"]
# import re
# target="".join(target)[::-1]                                  #2b1b11a2a1a
# target=re.findall("\d+[ab]",target)                                #['2b', '1b', '11a', '2a', '1a']
# answer=sorted(list(map(lambda x:[int(x[:-1]),x[-1]],target)))             #[[1, 'a'], [1, 'b'], [2, 'a'], [2, 'b'], [11, 'a']]
# print(list(map(lambda x:x[1]+str(x[0]),answer)))              #['a1', 'b1', 'a2', 'b2', 'a11']





