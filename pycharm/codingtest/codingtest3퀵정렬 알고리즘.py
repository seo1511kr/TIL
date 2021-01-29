








# P[0], P[1], ...., P[N-1]은 0부터 N-1까지(포함)의 수를 한 번씩 포함하고 있는 수열이다
# . 수열 P를 길이가 N인 배열 A에 적용하면 길이가 N인 배열 B가 된다.
# 적용하는 방법은 B[P[i]] = A[i]이다
#
#
# 배열 A가 주어졌을 때, 수열 P를 적용한 결과가 비내림차순이 되는 수열을 찾는 프로그램을 작성하시오.
# 비내림차순이란, 각각의 원소가 바로 앞에 있는 원소보다 크거나 같을 경우를 말한다. 만약 그러한 수열이
# 여러개라면 사전순으로 앞서는 것을 출력한다.
#
# 첫째 줄에 배열 A의 크기 N이 주어진다. 둘째 줄에는 배열 A의 원소가 0번부터 차례대로 주어진다.
# N은 50보다 작거나 같은 자연수이고, 배열의 원소는 1,000보다 작거나 같은 자연수이다.
#
# 첫째 줄에 비내림차순으로 만드는 수열 P를 출력한다
#
# 3
# 2 3 1
#
# 1 2 0
# N=int(input())
# arr1=input().split(" ")
# import copy
# for i in range(N):
#     arr1[i]=int(arr1[i])
# arr2=copy.copy(arr1)
# arr1.sort()
# ans=[]
# for i in arr2:
#     ans.append(str(arr1.index(i)))
#     arr1[arr1.index(i)]="a"
# print(" ".join(ans))

#1차시도 오류 => arr1 데이터 타입을 str으로 둬서 배열속 값이 9를 넘어가버리면 잘못 정렬됨
# 문제 조건 잘 지키기:: import를 N 앞에 넣어줘서 첫째줄 N이 주어진다는 조건을 어김
# 출력 형식이 str형식인데 list형식으로 출력함 그래서 계속 틀림



#4333
# 대학생 새내기들의 90%는 자신이 반에서 평균은 넘는다고 생각한다.
# 당신은 그들에게 슬픈 진실을 알려줘야 한다.
# 첫째 줄에는 테스트 케이스의 개수 C가 주어진다.
#
# 둘째 줄부터 각 테스트 케이스마다 학생의 수 N(1 ≤ N ≤ 1000, N은 정수)이
# 첫 수로 주어지고, 이어서 N명의 점수가 주어진다. 점수는 0보다 크거나 같고,
# 100보다 작거나 같은 정수이다.
#
# 각 케이스마다 한 줄씩 평균을 넘는 학생들의 비율을 반올림하여 소수점 셋째 자리까지 출력한다.
#
# 5
# 5 50 50 70 80 100
# 7 100 95 90 80 70 60 50
# 3 70 90 80
# 3 70 90 81
# 9 100 99 98 97 96 95 94 93 91
#
#
# 40.000%
# 57.143%
# 33.333%
# 66.667%
# 55.556%

# test_num=int(input())
# info=[]
# for i in range(test_num):
#     info.append(input().split(" "))
# for test in info:
#     students=int(test[0])
#     sum="+".join(test[1:])
#     mean=eval(sum)/students
#     cnt=0
#     for student in range(1,students+1):
#         if mean < int(test[student]):
#             cnt+=1
#     print("%0.3f%%"%((cnt/students)*100))

# 소수점 포매팅 방법 익혀두기 round는 반올림이 사사오입이라 원하는 결과 안나올 수 있음


# N개의 수가 주어졌을 때, 이를 오름차순으로 정렬하는 프로그램을 작성하시오.
#
# 입력
# 첫째 줄에 수의 개수 N(1 ≤ N ≤ 1,000,000)이 주어진다. 둘째 줄부터 N개의
# 줄에는 숫자가 주어진다. 이 수는 절댓값이 1,000,000보다 작거나 같은 정수이다. 수는 중복되지 않는다.




# N=int(input())
# numb_li=[]
#
# for i in range(N):
#     numbs=int(input())
#     numb_li.append(numbs)
# starts=min(numb_li)
# ends=max(numb_li)+1
# if N > (ends - starts + 1) / 2:
#     set_num = set(numb_li)
#     starts = min(set_num)
#     ends = max(set_num) + 1
#     set_total = set(range(starts, ends))
#     print(list(set_total.difference(set_num)).sorted)
# else:
#     li_total=[i for i in range(starts,ends)]
#
#     for i in range(N):
#         li_total[li_total.index(numb_li[i])]="0"
#     for i in range(N):
#         ans=li_total.index("0")
#         print(ans+starts)
#         li_total[ans]=""


# N=int(input())
# numb_set=set()
#
# for i in range(N):
#     numbs=int(input())
#     numb_set.add(numbs)
# starts=min(numb_set)
# ends=max(numb_set)+1
# if N > (ends-starts+1)/2:
#     starts = min(numb_set)
#     ends = max(numb_set) + 1
#     set_total = set(range(starts, ends))
#     print(sorted(set_total.difference(set_total.difference(numb_set))))
# else:
#     print(sorted(numb_set))








## 2751번
# N=int(input())
#
# q_sort=[]
# for i in range(N):
#     q_sort.append(int(input()))
#
#
# q_sort=[q_sort]
# while q_sort!=[]:
#     sort_ele = []
#     for i in q_sort:
#         if len(i) ==1:
#                 if sort_ele==[]:
#                     print(i[0])
#                 else:sort_ele.append(i)
#         elif len(i) >1:
#             if [j for j in i if j < i[0]]==[]:
#                 sort_ele.append([i[0]])
#                 sort_ele.append([j for j in i if j > i[0]])
#             elif [j for j in i if j > i[0]]==[]:
#                 sort_ele.append([j for j in i if j < i[0]])
#                 sort_ele.append([i[0]])
#             else:
#                 sort_ele.append([j for j in i if j < i[0]])
#                 sort_ele.append([i[0]])
#                 sort_ele.append([j for j in i if j > i[0]])
#     q_sort=sort_ele

N=int(input())
target=[]
for i in range(N):
    target.append(int(input()))

def q_sort(list):
    if len(list) <=1: return list
    pivot=list[len(list)//2]
    left=[]
    right=[]
    for i in range(0,len(list)):
        if list[i] < pivot:
            left.append(list[i])
        elif list[i] > pivot:
            right.append(list[i])

    return q_sort(left)+[pivot]+q_sort(right)
ans=q_sort(target)
print("\n".join(ans))










# 괄호 짝 맞추기
# N=int(input())
# info_li=[]
# for i in range(N):
#     info_li.append(input())
#
# def check(arr):
#     ln=len(arr)/2
#     i=1
#     while i>0:
#         newarr=arr.replace("()","")
#         if newarr==arr:break
#         arr=newarr
#     if newarr != "":return "NO"
#     else:return  "YES"
#
# for j in info_li:
#     print(check(j))