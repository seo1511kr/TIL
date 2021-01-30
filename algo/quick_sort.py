
# pivot을 맨 앞자리 사용했을 경우
import random
s=list(range(10000))
print(s)
def quick_sort(s):
    if len(s) <2: return s
    else:
        pivot=s[0]
        left=[]
        right=[]
        for i in s:
            if i<pivot:
                left.append(i)
            elif i>pivot:
                right.append(i)
    return quick_sort(left)+[pivot]+quick_sort(right)
print(quick_sort(s))


# pivot을 가운데꺼 사용했을 경우
import random
s=list(range(10000))
print(s)
def quick_sort(s):
    if len(s) <2: return s
    else:
        pivot=s[len(s)//2]
        left=[]
        right=[]
        for i in s:
            if i<pivot:
                left.append(i)
            elif i>pivot:
                right.append(i)
    return quick_sort(left)+[pivot]+quick_sort(right)
print(quick_sort(s))