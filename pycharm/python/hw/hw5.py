# # 1. 리스트에서 20 보다 작은 3의 배수를 출력하라
# #
# l = [13, 21, 12, 14, 30, 18]
#
# for i in l:
#     if i < 20 and i%3==0:
#         print(i)
#
# # 12
# # 18
# #
# # 2. 리스트에서 세 글자 이상의 문자를 화면에 출력하라
# #
# l2 = ["I", "study", "python", "language", "!"]
# for i in l2:
#     if len(i) >= 3:
#         print(i)
# # study
# # python
# # language
# #
# #
# # 3. 파일 이름이 저장된 리스트에서 확장자를 제거하고 파일 이름만 화면에 출력하라.
# l3 = ['hello.py', 'ex01.py', 'intro.hwp']
#
# for i in l3:
#     res=i.split(".")
#     res1=res[0]
#     print(res1)
#
# # hello
# # ex01
# # intro
# #
# # 4. my_list를 아래와 같이 출력하라.
# my_list = ["가", "나", "다", "라"]
#
# for i in range(len(my_list)-1):
#     res= my_list[i:i+2]
#     print(" ".join(res))
#
#
# # 가 나
# # 나 다
# # 다 라
# #
# # 5. 반복문과 range 함수를 사용해서 my_list를 아래와 같이 출력하라.
# my_list = ["가", "나", "다", "라"]
# for i in range(len(my_list)-1): # 0,1,2  (3,-3),(2,-4),(1,-5)
#     j=3-i
#     k=-3-i
#     res= my_list[j:k:-1]
#     print(" ".join(res))
# # 라 다
# # 다 나
# # 나 가
# #
# # 6.리스트에 5일간의 저가, 고가 정보가 저장돼 있다. 고가와 저가의 차를 변동폭이라고 정의할 때, low, high 두 개의 리스트를 사용해서 5일간의 변동폭을 volatility 리스트에 저장하라.
# #
# low_prices  = [100, 200, 400, 800, 1000]
# high_prices = [150, 300, 430, 880, 1000]
# volatility=[]
# for i in range(len(low_prices)):
#     j=[high_prices[i]-low_prices[i]]
#     volatility.extend(j)
# print(volatility)
# # 7.리스트에 저장된 데이터를 아래와 같이 출력하라.
# #
# apart = [ [101, 102], [201, 202], [301, 302] ]
#
# for i in apart:
#     for j in range(len(apart[0])):
#         print(i[j], "호")
#     print("-"*5)
# 101 호
# 102 호
# -----
# 201 호
# 202 호
# -----
# 301 호
# 302 호
# -----



# # 8. 구글 입사 test
# #=================================================================================
# k=314412321347813749813748913481238128132793712372183781739127
# m=9
# k=str(k)
# num=0
# len=len(k)
# for i in range(len):
#     if int(k[i]) > m:
#         num=num+int(k[i])*10**(len-2-i)*(len-1-i)+10**(len-1-i)
#     elif int(k[i]) == m:
#         num=num+int(k[i])*10**(len-2-i)*(len-1-i)
#         if i+1!=len:
#           num+=int(k[i + 1:]) + 1
#         else: num+=1
#     else :num=num+int(k[i])*10**(len-2-i)*(len-1-i)
# print(num)
# # #=================================================================================
#
# # 1부터 10,000까지 8이라는 숫자가 총 몇번 나오는가?
# num=0
# for i in range(1,10001):
#     stri="{0}".format(i)
#     num+=stri.count("9")
# print(num)


# 8이 포함되어 있는 숫자의 갯수를 카운팅 하는 것이 아니라 8이라는 숫자를 모두 카운팅 해야 한다.
# (※ 예를들어 8808은 3, 8888은 4로 카운팅 해야 함)



# count = 0
#
# for i in range(1, 314414781374981374891348123812):
#
#     count += str(i).count("9")
#
# print(count)


# range(1,10001)을 한방에 전체 str로 변경하는 법
# list로 먼저 range를 감싼 후에 str적용
# str(list(range())).count
# count_8 = str(list(range(1, 314414781374981374891348123812))).count('9')
#
# print(count_8)


#_+=========================================================


#count 함수 만들기
num=0
k=102321232
j=2

def mycount(what,where):
    strwhat="%d"%what
    strwhere="{0}".format(where)
    for i in strwhere:
        if strwhat == i:
            global num
            num+=1
        else:pass
    return num

print(mycount(j,k))