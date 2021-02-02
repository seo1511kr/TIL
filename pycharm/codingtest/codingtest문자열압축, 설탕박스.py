

## 설탕문제: 백준
# N=int(input())
# a=3
# b=5
# def solve(N,a,b):
#     small=min([a,b])
#     big=max([a,b])
#     bignum= N//big
#     res=-1
#     while bignum >= 0:
#         leftsugar=N-big*bignum
#         smnum,end=divmod(leftsugar,small)
#         if end == 0: res=bignum+smnum;break
#         else: bignum-=1
#     return res
#
# print(solve(N,box1,box2))



# 문자열 압축 문제 :카카오 코테
# def solution(s):
#     effectlist = [0]
#     k = 1
#     while k <= len(s) // 2:
#         zipeffect = 0
#         j = 0
#         while j < len(s) // k - 1:  # 0,1,2,3,4,5
#             cnt = 1
##             if len(s) - max(effectlist) < len(str(divmod(len(s[k * j:]), k)[0])) + k + divmod(len(s[k * j:]), k)[1]: break #문자열 길이가 길 떄 넣어주면 좋음
#             for i in range(j+1, (len(s)//k)+1):
#                 if s[k * j:k * (j + 1)] == s[k * (i ):k * (i + 1)]:
#                     cnt += 1
#                     if k == 1:
#                         if cnt == 10 or cnt == 100 or cnt == 1000:pass
#                         elif cnt >= 3:
#                             zipeffect += 1
#                     else:
#                         if cnt == 2:
#                             zipeffect += k - 1
#                         elif cnt == 10 or cnt == 100:
#                             zipeffect += k - 1
#                         elif cnt > 2:
#                             zipeffect += k
#
#                 else:
#                     break
#             j += cnt
#
#         effectlist.append(zipeffect)
#         k += 1
#     answer = len(s) - max(effectlist)
#     return answer
# print(solution(s))


def push(x):
    stack=[]
    stack.append(x)

