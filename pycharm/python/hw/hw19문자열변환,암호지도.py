#2진수 bin()
# v=10
# b=format(v,'b')
# print(b)
# b=format(v,'o')
# print(b)
# b=format(v,'x')
# print(b)


# 2진수 =>10진수 int

# 1.숫자를 입력받으면 그에해당하는 자릿수를 출력하는 코드를 작성하라.
# 입력 : 156 출력 : 100의자리수
# 입력 : 18961 출력 : 10000의자릿수

# num=input()
# print(10**(len(num)-1),"의 자리수")




# 2.
# 리스트에 있는 숫자들의 중앙값을 구하는 프로그램을 만들어라.
#
# [7, 9, 14] = 9
# [24, 31, 35, 49] = 33
# [17, 37, 37, 47, 57] = 37
#
# 중앙값 : 자료를 작은 값에서부터 크기순으로 나열할 때 중앙에 위치한 값
# ① 자료의 개수가 홀수이면 가운데 위치한 값이 중앙값이다.
# ② 자료의 개수가 짝수이면 가운데 위치한 두 값의 평균이 중앙값이다.
# li=[17, 37, 37, 38, 47, 57]
# median_index=len(li)//2
# if len(li)%2 == 0:
#     median=(li[median_index-1]+li[median_index])/2
# else:
#     median_index=len(li)//2
#     median=li[median_index]
# print(median)




# 3.
# 아래와 같은 결과를 출력하는 function을 구현하라
#
# bool OneEditApart(string s1, string s2)
#
# OneEditApart("cat", "dog") = false
# OneEditApart("cat", "cats") = true
# OneEditApart("cat", "cut") = true
# OneEditApart("cat", "cast") = true
# OneEditApart("cat", "at") = true
# OneEditApart("cat", "acts") = false
# 한개의 문자를 삽입, 제거, 변환을 했을때 s1, s2가 동일한지를 판별하는 OneEditApart 함수를 작성하시오.

# print(bool(OneEditApart("cats","acts")))

s1="cta"
s2="catt"

def OneEditApart(s1,s2):
    import re
    res=True
    lens1=len(s1)
    lens2=len(s2)
    if abs(lens1-lens2) >1:res=False
    elif len(s1)==len(s2):
        cnt=0
        for i in range(lens1):
            if s1[i]!=s2[i]:cnt+=1
            if cnt >1: res= False; break
    else:
        short=s1;long=s2
        if lens1 > lens2:
            short=s2;long=s1
        short=short.replace("",".?").lstrip(".?")
        res= re.search(short,long)
    return res
print(bool(OneEditApart(s1,s2)))




# def OneEditApart(s1,s2):
#     if len(s1) >= len(s2):
#         s2=s2.replace("","?")


# def OneEditApart(s1,s2):
#     res=True
#     ls1=len(s1)
#     ls2=len(s2)
#
#     if abs(ls1-ls2) > 1: #길이차이 1초과
#         res=False
#         return res
#
#     cnt=0
#     if ls1 == ls2:      #길이가 같을 때 다른 거 1개 초과
#         for i in range(ls1):
#             if short[i]!=long[i]:
#                 cnt+=1
#             if cnt>1:
#                 res=False
#                 return res
#
#     short=s1
#     long=s2
#     if ls1>ls2: short=s2;long=s1
#
#     lenshort=len(short)
#     for i in range(lenshort):   #길이 1개 차이
#         res= short[i]==long[i]
#         if not res:
#             res=short[i]==long[i+1]
#             if not res:break
#     return res
#
# print(OneEditApart(s1,s2))

# print(res)
# 4.


# def decoding(n,arr1,arr2):
#     map1=[]
#     map2=[]
#     for i in arr1:
#         map1.append(int(str(bin(i))[2:]))
#     for i in arr2:
#         map2.append(int(str(bin(i))[2:]))
#     com=[]
#     for i in range(n):
#         com.append(str(map1[i]+map2[i]))
#     for i in range(n):
#         com[i]=com[i].replace("0"," ").replace("1","#").replace("2","#")
#     return com
#
#
#
# n=5
# arr1=[9, 20, 28, 18, 11]
# arr2=[30, 1, 21, 17, 28]
# info_li=[n,arr1,arr2]
# print(decoding(n,arr1,arr2))
#
# n=6
# arr1=[46, 33, 33 ,22, 31, 50]
# arr2=[27 ,56, 19, 14, 14, 10]
# print(decoding(n,arr1,arr2))
