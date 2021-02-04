# 1. 임의의 두 수를 입력 받은 후 최소공배수/최대공약수 출력
# 유클리드 호제법 사용
# num1=20
# num2=35
# import copy
# def getc_mm(small,big):
#     if small>big:small,big=big,small
#     if big%small==0: return small,num1*(num2/small)
#     res=divmod(big,small)[1]
#     big=copy.copy(small)
#     small=res
#     return getc_mm(small,big)
#
# print(getc_mm(20,35))

# 재귀호출의 목적은 dfs문제에서 적용하는데 적절하다
# (전체의 모든 해를 다 탐색해서 최적의 해를 찾아야 하는 경우에만 사용)
# 이런 경우에는 굳이 쓸 필요가 없음=>메모리가 과다하게 사용됨.
# 트리 자료구조에서 주로 사용하면됨.







# num1=20
# num2=35
# import copy
# def getc_mm(small,big):
#     if small>big:small,big=big,small
#     for i in range(small):
#         res = big % small
#         if res==0:return small,num1*(num2/small)
#         big=copy.copy(small)
#         small=res
# print(getc_mm(20,35))


# 2.
#  1~1000에서 각 숫자의 개수 구하기
#
# 예로 10 ~ 15 까지의 각 숫자의 개수를 구해보자
#
# 10 = 1, 0
# 11 = 1, 1
# 12 = 1, 2
# 13 = 1, 3
# 14 = 1, 4
# 15 = 1, 5
#
# 그러므로 이 경우의 답은 0:1개, 1:7개, 2:1개, 3:1개, 4:1개, 5:1개


# #강사님 코드
# cnt = {x:0 for x in range(0,10)}
# # 1~1000까지
# for x in range(1,1001):
#     for i in str(x):
#         cnt[int(i)]+=1
# print(cnt)




# 1000을 1~999까지와 1000으로 나누어서 계산
# N=input()
# unit=len(N)-1
# answer={}
# for i in range(0,10):
#     answer[i]=unit*(10**(unit-1))  # 각 자릿수 별로 (0~9), (0~9), (0~9)의 수가 올 수 있음
# answer[0]+=unit  #1000부분을 고려해줌
# answer[1]+=1
# for i in range(unit):
#     answer[0] -= 10**i  #각 자리수의 맨 앞이 0인 경우 차감 ex) 091, 01, 0
# print(answer)
# #
#
#
# from collections import Counter
# num = []
# for i in range(1,int(N)+1):
#     num+=list(str(i))
# print(Counter(''.join(num)))
# 3.
# 시저 암호는, 고대 로마의 황제 줄리어스 시저가 만들어 낸 암호인데,
# 예를 들어 알파벳 A를 입력했을 때, 그 알파벳의 n개 뒤에 오는
# (여기서는 예를 들 때 3으로 지정하였다)알파벳이 출력되는 것이다.
# 예를 들어 바꾸려는 단어가 'CAT"고, n을 5로 지정하였을 때 "HFY"가 되는 것이다.
#
# 어떠한 암호를 만들 문장과 n을 입력했을 때 암호를 만들어 출력하는 프로그램을
# 작성해라.


# # n이 26을 넘어가는 경우도 생각해서 n%26으로 하자
# def caeser(sen,n):
#     sen="CAAT"
#     alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
#     t=str.maketrans(alpha,alpha[n%26:]+alpha[:n%26])
#     return sen.translate(t)
# print(caeser("CAT",50))


# 4. 절대값의 합 구하기 (수업 시간에 설명)
# N=int(input())
# board=[list(map(int,input().strip().split())) for i in range(N)]
# dp=[[-1]*N for i in range(N)]


# N=5
# board=[[5, 2, 3, 4, 32], [4, 4, 5, 8, 5], [3, 45, 6, 6, 7], [4, 4, 5, 8, 5], [3, 45, 6, 6, 7]]
# dp=[[-1, -1, -1, -1, -1], [-1, -1, -1, -1, -1], [-1, -1, -1, -1, -1], [-1, -1, -1, -1, -1], [-1, -1, -1, -1, -1]]
#
# print(board)
# print(dp)
# start=[0,0]
# sum=0
# for x in range(N):
#     for y in range(N):
#         if x-1>0:sum+=abs(board[x][y]-board[x-1][y])
#         if x+1<=N-1:sum+=abs(board[x][y]-board[x+1][y])
#         if y-1>0:sum+=abs(board[x][y]-board[x][y-1])
#         if y+1<=N-1:sum+=abs(board[x][y]-board[x][y+1])
# print(sum)