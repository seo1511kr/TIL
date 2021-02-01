# 백준1463
# 정수 X에 사용할 수 있는 연산은 다음과 같이 세 가지 이다.
#
# X가 3으로 나누어 떨어지면, 3으로 나눈다.
# X가 2로 나누어 떨어지면, 2로 나눈다.
# 1을 뺀다.
# 정수 N이 주어졌을 때, 위와 같은 연산 세 개를 적절히 사용해서 1을 만들려고 한다.
# 연산을 사용하는 횟수의 최솟값을 출력하시오.


# N=int(input())
# def oper_cnt(N):
#     if N>=1:
#         df = list(range(3*N))
#         df[1]=0
#         for i in range(1,N):
#             df[i+1]=min(df[i]+1,df[i+1])
#             df[i*2]=min(df[i]+1,df[i*2])
#             df[i*3]=min(df[i]+1,df[i*3])
#         return df[N]
# print(oper_cnt(N))

# if df[N] < N - 1:를 써줘서 연산시간을 축소하려고 하였지만
# 10과 같이 값이 여러번 바뀌는 수는 오류가 남
# 현재 10의 값은 +1로만 가능한 값으로 최악의 경우인데
# 5를 만났을 때 5*2는 10이므로 5의 값인 3에 +1이 되어 4로 변함
# 하지만 10의 최소값은 (2의값을 지닌)9를 만났을때 +1이 되어 3임.

# 다 맞았다고 생각했는데 런타임에러(index) 발생: N은 정수라는 조건이 있으므로
# N이 1보다 작은 경우는 None이 출력되도록 if조건을 걸어줌



# 1010
# 다리놓기
#무난하게 쉬운줄 알았지만 facotrial로 계산시 계산량이 어마무시

#==>1. combination 함수를 따로 만들어줘서 해결했음

# T=int(input())
# test_li=[]
# for i in range(T):
#     test_li.append(input().split(" "))
# def combi(west,east):
#     res=1
#     if west==east:return 1
#     for i in range(east-west,east):
#         res=(i+1)*res
#     return res/facto(west)
#
# def facto(numb):
#     res=1
#     for i in range(numb):
#         res*=(i+1)
#     return res
#
#
# for test in test_li:
#     a=int(test[1])
#     b=int(test[0])
#     res= combi(b,a)
#     print(int(res))




# 연습. 동적프로그래밍, 메모이제이션 활용과 재귀호출로 팩토리얼 만들기
# import sys
# sys.setrecursionlimit(10**6)
# def facto(num):
#     num=[1,num]
#     def multiex(num):
#         if num[1]==1: return num[0]
#         else:
#             num[0]*=num[1]
#             num[1]-=1
#         return multiex(num)
#     return multiex(num)
# print(facto(5))









