# 1.
#
# 리스트에 있는 숫자들의 최빈값을 구하는 프로그램을 만들어라.
#
# [12, 17, 19, 17, 23] = 17
# [26, 37, 26, 37, 91] = 26, 37
# [28, 30, 32, 34, 144] = 없다
#
# 최빈값 : 자료의 값 중에서 가장 많이 나타난 값
# ① 자료의 값이 모두 같거나 모두 다르면 최빈값은 없다.
# ② 자료의 값이 모두 다를 때, 도수가 가장 큰 값이 1개 이상 있으면 그 값은 모두 최빈값이다.


# li=[26, 37, 26, 37, 91,26, 37, 37,]
# dictli=dict.fromkeys(li)
# condition=len(dictli.keys())
# if (condition==1) or (condition==len(li)):
#     print("최빈값은 없다")
# else:
#     solve={i:li.count(i) for i in dictli.keys()}
#     solve_sort=sorted(solve.items(),key=lambda x:x[1],reverse=True)
#     print([i[0] for i in solve_sort if i[1] >= solve_sort[0][1]])

#
# 2.
# 약수를 모두 찾는 수학 문제를 풀다가 지친 X는 컴퓨터의 도움을 받아 문제를 풀어 보기로 하였다. 하지만 계산기를 이용하자니 계산기로 하고 싶지만 찾기도 어려우며, 쉽게 찾아낼 수도 없었다.
#
# 풀이에 지친 그는 결국 약수들이 가지고 있는 특징을 찾아 결국 몇시간에 걸쳐 복잡한 수라도 약수를 찾아줄 수 있고 개수도 알려주는 프로그램을 짜게 된다.
#
# 다음은 약수를 얻기 위한 입력과 출력 예제들이다.
#


def getdivele(target):
    import math
    if target==1:
        return 1,[1]
    else:
        import math
        end = int(math.sqrt(target))
        answer=[]
        cnt=0
        for i in range(1,end+1):
            quot,remain=divmod(target,i)
            if remain==0:
              answer.extend(set([i,quot]))
              if i==end:
                  cnt+=1
              else:cnt+=2
        return cnt,sorted(answer)
print(getdivele(123456789))




# 24
# 출력 1
#
# { 1, 2, 3, 4, 6, 8, 12, 24}
# 약수의 개수는 8개 입니다.
# 입력 2
#
# 36
# 출력 2
#
# { 1, 2, 3, 4, 6, 9, 12, 18, 36 }
# 약수의 개수는 9개 입니다.
# 입력 3
#
# 2468013579
# 출력 3
#
# { 1, 3, 9, 61, 183, 549, 4495471, 13486413, 40459239, 274223731, 822671193, 2468013579 }
# 약수의 개수는 12개 입니다.
# 사용한 소스코드를 풀이에 넣어 입력과 출력이 나왔음을 보이고,
# 소스코드를 디버깅하여 123456789를 입력해 출력된 결과를 '{ a, b, ... } / 약수의 개수는 ~개 입니다' 형식으로 하시오.
#
#
#
# 3. 당신은 A 인터넷 카페 운영자이다.
#
# 당신의 인터넷 카페에는 휴대폰 번호 게시가 금지되어 있다.
#
# 하지만 일부 회원들이 편법을 동원하여 휴대폰 번호를 게시 후 불법 거래를 시도한다.
#
# 이를 체크하여 자동 삭제를 할 수 있도록 휴대폰 번호 검사 알고리즘을 작성하시오.
#
# (011~019 는 10자리여도 휴대폰 번호이다. 010은 11자리여야만 한다.)
#
# Input

# 영일영-구구칠8-일구팔사
# 0일영.칠칠칠팔.이삼사
# 영 일 칠 삼 칠 오 팔 이 팔 이
# 영일일 34구구 4 오 9 이
# Output
#
# 01099781984 true
# 0107778234 false
# 0173758282 true
# 01134994592 true
#

# import re
# def istel(target):
#     t = str.maketrans("영일이삼사오육칠팔구", "0123456789")
#     target="".join(re.findall("[영일이삼사오육칠팔구\d]+",target)).translate(t)
#     if (re.match("010\d{8}$",target)):
#         return target,True
#     elif (re.match("01[1-9]\d{7,8}$",target)):
#         return target,True
#     else:
#         return target,False
# print(list(map(istel,["영일영-구구칠8-일구팔사","0일영.칠칠칠팔.이삼사","영 일 칠 삼 칠 오 팔 이 팔 이","영일일 34구구 4 오 9 이"])))



# 4. 카프리카 수
# 카프리카 수란 인도의 수학자 D.R.카프리카의 의해 정의한 수이다.
#
# 어떤 수의 제곱수를 두 부분으로 나누어 더하였을 때 다시 원래의 수가 되는 수들을 의미한다.
#
# 예를 들어 45는 카프리카 수인데, 45² = 2025이고, 20+25 = 45이기 때문이다.
#
# 어떤 수를 입력 받고 그 수가 카프리카 수인지 아닌지를 출력하는 함수를 만드시오.
#
# 어떤 수를 입력 받고 자릿수가 그 수인 모든 카프리카 수를 출력하시오.
#
# 어떤 수를 입력 받고 어떤 수 이하의 모든 카프리카 수를 출력하시오.
#
# 이 셋중에서 원하는 유형 하나를 골라 푸시오.
#
# 입력 (유형 1)
#
# print(kaprekar_number(1))
# print(kaprekar_number(45))
# print(kaprekar_number(297))
# print(kaprekar_number(3213))
# 출력 (유형 1)


# def isKnum(target):
#     modi=str(target**2)
#     if len(modi)==len(str(target)):return False
#     lenm=len(modi)
#     mid=lenm//2
#     if lenm%2==0:
#         if int(modi[:mid])+int(modi[mid:])==target==target:
#             return True
#     if lenm%2!=0:
#         if (int(modi[:mid])+int(modi[mid:])==target) or (int(modi[:mid+1])+int(modi[mid+1:])==target):
#             return True
#     return False
# print(list(map(isKnum,[0,1,10])))
#
#
# def knum_list1(num):
#     return list(filter(isKnum,range(10**(num-1),10**num)))
# print(knum_list1(2))
#
#
# def knum_list2(num):
#     return list(filter(isKnum,range(num+1)))
# print(knum_list2(99))


# True
# True
# True
# False
# 카프리카 상수
# 카프리카 상수도 마찬가지로 인도의 수학자 카프리카가 발견한 상수이다.
#
# 이 상수의 생성법은 다음과 같다.
#
# 숫자 하나로만 이루어지지 않은 4자리 수를 정한다. (예: 1000은 인정하되, 1111은 인정하지 않는다.)
# 첫 자리에 0이 와도 무방하다.
# 이 숫자를 크기 순으로 배열하여 두 수를 만든다. 하나는 큰 순, 하나는 작은 순으로 배열한다.
# 큰 쪽에서 작은 쪽을 빼 준다. 이때 나온 0은 유지한다.
# 이 과정을 반복하면 7번 이내로 6174가 나온다.
# 어떤 수를 입력 받고 몇번이내로 6174가 완성 되었는지 출력하는 함수를 입력하시오
#
# 단, 입력값은 정수여야 한다.
#
# 입력
#
# print(kaprekar_constant(4371))
# print(kaprekar_constant(21))
# print(kaprekar_constant(1))
# print(kaprekar_constant(1111))
# 출력
#
# 7
# 3
# 5
# False


# def kaprekar_constant(target):
#     target=str(target).zfill(4)
#     if len(set(target))==1:return False
#     else:
#         cnt=1
#         while cnt <=7:
#             res=False
#             big = int("".join(sorted(target, reverse=True)))
#             small = int("".join(sorted(target)))
#             target=str(big-small).zfill(4)
#             if target=="6174":
#                 return cnt
#             cnt+=1
#     return False
# print(list(map(kaprekar_constant,[4371,21,1,1111])))


