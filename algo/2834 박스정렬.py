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
N=int(input())
boxes=list(map(int,input().strip().split()))


def merge_sort(boxes):
    if len(boxes)<2:return boxes
    mid=len(boxes)//2
    left=boxes[:mid]
    right=boxes[mid:]
    leflef=merge_sort(left)
    rigrig=merge_sort(right)
    return merge(leflef,rigrig)


def merge(l,r):
    res=[]
    i=j =0
    while len(l) > i and len(r) > j:
        if l[i] < r[j]:
            res.append(l[i])
            i+=1
        else:
            res.append(r[j])
            j+=1
    if len(l) > i:
        res.extend(l[i:])
    elif len(r) > j:
        res.extend(r[j:])
    return res




sorted_boxes=merge_sort(boxes)
change=[]
for i in range(N):
    key=sorted_boxes[i]
    value=boxes[i]
    answer = []

    if key!=value:
        newi=boxes.index(key)
        answer.append(boxes.index(key)+1)
        answer.append(i+1)
        boxes[i]=key
        boxes[newi]=value
        key = sorted_boxes[newi]
        value = boxes[newi]
        while key!=value:
            newii = boxes.index(key)
            answer.append(boxes.index(key) + 1)
            boxes[newi]=key
            boxes[newii]=value
            key = sorted_boxes[newii]
            value = boxes[newii]
            newi=newii
    if answer!=[]:
        change.append(answer)
print(len(change))
for i in change:
    print(str(len(i))+":",' '.join(list(map(str,i))))


# for i in range(N):
#     change=[]
#     if boxes[i]!=i+1:
#         newi=boxes[i]-1
#         change.append(boxes.index(i+1)+1)
#         change.append(i+1)
#         boxes[boxes.index(i + 1)] = boxes[i]
#         boxes[i]=i+1
#         while boxes[newi]!=newi+1:
#             change.append(newi+1)
#             newii = boxes[newi] - 1
#             boxes[boxes.index(newi + 1)] = boxes[newi]
#             boxes[newi] = newi + 1
#             newi=newii
#
#     if change!=[]:
#         answer.append(change)
# times=len(answer)
# print(times)
#
#
# for i in range(times):
#     changes=len(answer[i])
#     print(str(changes)+":",end=' ')
#     for j in answer[i]:
#         print(str(j),end=' ')
#     print("")

# for i in answer:
#     print(str(len(i))+':'+ )