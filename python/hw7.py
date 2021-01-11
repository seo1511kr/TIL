# # 1. 1차원 점들이 주어졌을 때, 그 중 가장 거리가 짧은 것의 쌍을 출력하는 함수를 작성하시오(Daum입사)
# # ex) S={1,3,4,8,13,17,20} => [(3,4)]
#
# num={1,3,4,8,13,17,20,21} # ==> [(3,4),(20,21)]
# def shortest(num):
#     distance=[]
#     num = list(num)
#     pair=list(zip(num[:-1],num[1:]))
#     for i in range(len(num)-1):
#         distance.append(abs(num[i]-num[i+1]))
#     res = min(distance)
#     newpair=list(zip(num[:-1], num[1:], distance))
#     print([i[:2] for i in newpair if i[2] == res]) # 거리가 최소인 쌍이 여러개 있어도 모두 출력
#
# shortest(num) # [(3,4),(20,21)]
#
#
#
#
#
#
#
#
#
# # 2. 회문(palindrome)?: 순서를 거꾸로 해서 읽어도 제대로 읽을때와 같은 단어 or 문장
# # ex) rotator, sos, "nurses run"(심화: 공백도 고려하여 만들어보기)
# # 임의의 단어(문장)을 입력받아 회문 여부를 출력하는 함수 만들기( True/False)
# def selfpalindrome(string):
#     splitstring=string.split(" ")
#     leng=len(splitstring)
#     nospace=""
#     for i in range(leng):      ###공백을 없애는데 replace를 활용하면 훨씬 편함
#         nospace+=splitstring[i]### str.maketrans(" "," ")는 바꿀 문자열끼리의 길이가 동일해야되어서
#     reverse=nospace[-1::-1]    ### 사용이 불가능함
#     if reverse == nospace:
#         return reverse == nospace
#     else:
#         return reverse == nospace
#
# print(selfpalindrome("sos"))
# print(selfpalindrome("nurses run"))
# print(selfpalindrome("hello"))
#

# .replace() 활용한 버전
# def selfpalindrome(string):
#     nospace=string.replace(" ","")
#     reverse=nospace[::-1]
#         if reverse == nospace:
#             return reverse == nospace
#         else:
#             return reverse == nospace
#
# print(selfpalindrome("sos"))
# print(selfpalindrome("nurses run"))
# print(selfpalindrome("hello"))

# 더 효율적인 코딩
# 회문임을 판단할 때 index 0과 끝을 먼저 비교,
# 만약 처음부터 틀리면 그 이후 과정을 더 진행할 필요가 없이 코딩하기
# def selfpalindrome():
#     string = input("단어 입력:")
#     nospace=string.replace(" ","")
#     res=True
#     for i in range(len(nospace)//2):
#         if nospace[i] != nospace[-i-1]:
#             res=False
#             break
#     print(res)
# selfpalindrome()
# reversed 함수 사용하기
# reversed 는 object라서 list로 빼내줘야함
# w="level"
# print(type(w))
# print(reversed(w))
# print(list(reversed(w)))
# print(list(w)==list((reversed(w))))


# join 사용하기
# w="level"
# print(w==''.join(reversed(w)))


# 소수 구하기==========================================================================

# 1. 가장 비효율적인 방법(10000이 소수인지 알기 위해 1~9999까지 10000을 나눔
# for num in range(2,100000):
#     for i in range(2, num+1):
#         if num == i:
#             print(num,end=" ")
#         elif num % i ==0:
#             break# for num in range(2,100000):

# # 2. 중간 방법(10000이 소수인지 알기 위해서는 10000의 제곱근인 100까지만 나눠보면 됨)
# # 10000의 약수들은 (100,100)처럼 순서쌍을 이루기 때문에 모든 순서쌍은 어차피 100 이하의 수
# def isprime(num):
#     res = True
#     for i in range(2,int(num**.5)+1):
#         if num%(i)==0:
#             res=False
#             break
#     return res
# s=range(2,10000000)
# print(list(filter(isprime,s)))
# print(len(list(filter(isprime,s))))
# print([i for i in range(2,1001) if isprime(i)==True])

# # 1부터 num이라는 숫자까지의 소수를 찾는 함수
# # 에라토스테네스의 체를 구현하기
# def isprime(num):  # 1~num까지에서 소수를 구하기
#     prime=[2]      # prime 리스트를 만들어서 prime을 누적저장
#     for i in range(2,num+1): # (2~num까지의 수가 소수인지 판단하는 roop)
#         j = 0
#         res=True
#         while prime[j] <= int(i ** .5): #판단의 대상이 되는 수의 제곱근보다 작거나 같은 소수만 나눠보면 됨
#             if i % prime[j] != 0:       #소인수 분해를 응용한다고 생각
#                 j += 1                  # ex)4나 6으로는 나눠볼 필요가 없음
#                 res = True              # 왜냐하면 4나 6은 어차피 2나 3의 배수임
#             else:
#                 res = False
#                 break
#         if res == True:
#                 prime.append(i)
#     del prime[0]
#     return (prime)
# print(len(isprime(10000000)))



# # 에라토스테네스의 체: 가장 빠름
# def prime_list(n):
#     # 에라토스테네스의 체 초기화: n개 요소에 True 설정(소수로 간주)
#     sieve = [True] * n
#
#     # n의 최대 약수가 sqrt(n) 이하이므로 i=sqrt(n)까지 검사
#     m = int(n ** 0.5)
#     for i in range(2, m + 1):
#         if sieve[i] == True:           # i가 소수인 경우
#             for j in range(i+i, n, i): # i이후 i의 배수들을 False 판정
#                 sieve[j] = False
#
#     # 소수 목록 산출
#     return [i for i in range(2, n) if sieve[i] == True]
#
# print(prime_list(100000000))