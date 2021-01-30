# 재귀호출(최대깊이1000)
# 종료조건을 만들기
# 종료조건은 매개변수를 위주로 설정(ex.매개변수의 길이)

# 병합정렬 알고리즘
# 분할정복 알고리즘

# 이분 검색 문제(분할정복)
# 정렬되지 않은 리스트: 순차탐색
# 정렬된 리스트: 이분검색
# iterative, recursive


#import sys
# input은 시간복잡도가 느린 함수임 주의할 것
# N = int(input())
# nums=[]
# for i in range(N):
#     nums.append(int(sys.stdin.readline().rstrip()))



import random
nums=random.sample(range(-100,100),5)
print(nums) # [57, 61, -18, -89, 77]
def merge_sort(nums): #재귀호출 분할: 매개변수 nums
    if len(nums) <2: return nums #재귀호출 탈출조건: 매개변수의 길이
    else:
        mid=len(nums)//2
        left=nums[:mid]
        print(left)  #[57, 61]  [57]
        right=nums[mid:]
        print(right)  #[-18, -89, 77]  [61]
        leftele=merge_sort(left) #재귀호출
        rigele=merge_sort(right)
    return merge(leftele,rigele)
def merge(lef,rig):  #정복하면서 병합
      #새로운 res배열을 만들어 값을 정렬시키므로 nums에 해당하는 메모리가 추가적으로 더 필요
    res = []

    i = j = 0
    print("합병 대상",lef)  # [57]
    print("합병 대상",rig) #  [61]

    while len(lef)>i and len(rig) >j:
        if lef[i] <= rig[j]:
            res.append(lef[i])
            i+=1
        else:
            res.append(rig[j])
            j+=1
    if len(lef) > i:
        res.extend(lef[i:]) # 계속 비교해서 한쪽이 먼저 소진되어 버리면 남은 한쪽은 남은 걸 뒤에 붙여야함
    elif len(rig) > j:
        res.extend(rig[j:])
    print("합병 이후",res)  #[57, 61]
    return res

print(merge_sort(nums))



