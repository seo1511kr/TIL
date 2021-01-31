# 문제
# 상근이는 박스 N개를 로봇을 이용해서 정렬하려고 한다.
# 박스에는 1부터 N까지 숫자가 겹치지 않게 쓰여 있고, 이 수가 오름차순을 이루도록 박스를 정렬하려고 한다.
#
# 상근이가 가지고 있는 로봇에 수열을 입력하면, 위치에 해당하는 박스를 교환하게 된다
# . 수열에는 같은 위치가 두 번 이상 주어지면 안 된다.
#
# 예를 들어, 박스가 지금 [4, 1, 5, 2, 3] 순서로 놓여져 있고, 로봇에 [2, 1, 3] 명령을 내렸다고 해보자
# . 그럼 두 번째 위치에 있는 박스를 위치 1로 옮기고, 첫 번째 박스는 위치 3으로,
# 세 번째 박스는 위치 2로 이동하게 된다. 박스의 순서는 [1, 5, 4, 2, 3]이 된다.
# 명령을 가장 적게 이용해서 박스를 정렬하는 프로그램을 작성하시오.


# 첫째 줄에 박스의 수 N이 주어진다. (2 ≤ N ≤ 1000)
# 다음 줄에는 박스에 붙어있는 숫자가 순서대로 주어진다. 같은 숫자가 두 번 이상 주어지지 않는다.


# n=int(input())
from collections import deque
# dq=deque(map(int,input().split()))
# print(dq)
#
# def q_sort(dq):
unsortdq=deque([4,1,2,9,3,5,20,30,21,33,7,16])
print(unsortdq)

def q_sort(unsortdq):
    if len(unsortdq) <=1: return unsortdq
    else:
        pivot=unsortdq[len(unsortdq)//2]
        left=deque()
        right=deque()
        for i in unsortdq:
            if pivot > i:
                left.append(i)
            elif pivot < i:
                right.append(i)
        return q_sort(left)+deque([pivot])+q_sort(right)

sortdq=q_sort(unsortdq)
print(sortdq)
n=len(sortdq)
visited=[]
for i in range(n):

    start=sortdq[i]

    target=unsortdq.index(start)
    print(target)
    print(unsortdq[target])
    print(unsortdq[i])
    print(sortdq[i])
    if unsortdq[i]==sortdq[i]:
        visited=[]
    visited.append(start)
    print(visited)

    unsortdq[i],unsortdq[target]=unsortdq[target],unsortdq[i]
    print(unsortdq)

