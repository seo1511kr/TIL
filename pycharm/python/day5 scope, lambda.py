# # 함수==========================================================================
# # 입력(외부의 자극) -> 함수(뇌) -> 출력
# # 입력,출력이 반드시 있어야 하는건 아님
# # 함수를 사용하는 이유:
# # 똑같은 내용 반복적으로 사용할 때
#
# # def 함수명(매개변수 0개 이상):  함수명은 함수의 기능과 연관지어 정하기
# #     문장1
# #     문장2
# # 함수 정의 구문
#
# #사용자 함수
# def add(a,b): #매개변수
#     sum=a+b
#     print('add함수')
#     return sum
# print('호출전')
# res=add(1,2) #parameter(인수)
# # add를 호출한 순간 위의 구문을 실행하게 되는 것
# print('호출후')
# print(res)
# # 수행순서
# # 함수는 스스로 수해하지 않는다. 호출해야만 수행
# # 1) add(1,2) 호출
# # 2) add함수 수행 -> sum 리턴
# # 3) sum이 res에 저장
#
# #입력값이 없는 함수 만들기
# def say():
#     return "안녕"
# s=say()
# print(s)
#
# #출력값이 없는 함수
# def add(a,b):
#     print("두 수의 합은:", a+b)
#     # return 생략
# res=add(3,4)
# print(res)
# add(4,5)
#
# # #매개변수의 초기값을 설정하여 함수 호출
# def add(a,b):
#     print(b)
#     print(a)
#     return a+b
# res=add(a=2,b=3) #파이썬에서는 가능, R에서는 불가능
# print(res)

# def add(a,b=3):  # 외부에서 전달되는 값이 있으면 저장, 없으면 기본값 3이 저장
#     print(b)
#     print(a)
#     return a+b
# res=add(2)
# print(res)
# res=add(2,5)
# print(res)
# # res=add(2,4,5)==> 매개변수 개수 맞춰야함

# # 함수로 전달되는 인수의 개수가 정해져 있지 않은 경우
# # 파이썬에서는 가능
# def add(*arg): #매개변수(arguments) 명 앞에 *을 붙이면 튜플로 인식
#     print(arg)
#     res=0
#     for i in arg:
#         res+=i
#     return res
# r=add(1,2,3,4,5)
# print(r)
#
# def mul(*arg):
#     res=1
#     for i in arg:
#         res*=i
#     return res
# r=mul(1,2,3,4,5,8)
# print(r)
#
# def addmul(type, *arg):
#     if type == "add":
#         res=0
#         for i in arg:
#             res+=i
#         return res
#
#     elif type =="mul":
#         res=1
#         for i in arg:
#             res*=i
#         return res
#
# r=addmul("mul",1,2,3,4,5,8)
# r=addmul("add",1,2,3,4,5,8)
# print(r)

# # 변수를 각각 따로 저장
# def am(a,b):
#     return a+b, a*b
# res=am(3,4)
# r1=res[0]
# r2=res[1]
# print(r1)
# print(r2)
#
# r1,r2=am(3,4)
# print(r1)
# print(r2)

# #return 문은 1개만 작성해야함
# #return 하는 순간 함수는 끝남
# def am(a,b):
#     return a+b
#     return a*b
# res=am(3,4)
# print(res)

# def prn():
#     print('안녕')
#     return # 호출문으로 복귀함, 특정한 경우 이외에는 생략 가능
# prn()
# print("하세요")

# # 함수의 중간 부분에 return이 오게될 경우
# def prn(a):
#     if a=="안녕":
#         return
#     print("반가워")
#
# prn("안녕")   # print를 수행하기 전에 복귀
# prn("잘 있었니?")

# def say(name,age,gender=True): # default가 있는 매개변수는 항상 뒤에 위치해야함
#     if gender==True:
#         gender="남"
#     else:
#         gender="여"
#     print("내 이름은",name)
#     print("내 나이는",age)
#     print("내 성별은", gender)
#
# say('홍길동',25)
# say('김말숙',26,False)



# #변수의 scope================================================================================
# #  함수 안에서 사용한 함수를 함수 밖에서도 사용할 때
# a=1#함수 밖에 있는 a
# def mytest(a):  #매개변수 a는 함수 안에서만 사용되는 변수임, 함수 밖에 있는 a와는 다른 a
#     a=a+1
# mytest(10) #함수 속 a=11이지만
# print(a)  #함수 밖 여전히 a =1임

# a=5
# def mytest2(a):
#     a=a+1
#     print(a)
# print(a)
#
# #함수 안에서 밖에있는 변수를 증가하고 싶다면?
# # 1. return 사용하기
# a=5
# def mytest2_1(a):
#     a=a+1
#     return a
# a=mytest2_1(a)
# print(a)
#
# # 2. global 명령어 사용하기
# a=5
# def mytest2_2():
#     global a   #함수 밖 변수 a를 사용하겠다는 뜻.
#     a=a+1
# mytest2_2()
# print(a)
# #=======================================================================================


# #========================================================================================
# #lambda:def와 동일한 기능 수행하는 예약어
# # def를 사용하지 못하거나 복잡할 때는 lambda가 유용함
# def myadd(a,b):
#     return a+b
# res=myadd(2,3)
# print(res)
# # 람다를 사용한 함수
# 함수명=lambda 매개변수1, 매개변수2,..:매개변수를 이용한 계산식
# myadd2=lambda a,b:a+b
# res=myadd2(2,3)
# print(res)
# #========================================================================================


# # 연습문제(함수 만들기)
# def mymax(*arg):
#     m=0
#     for i in range(len(arg)):
#        if m<arg[i]:
#            m=arg[i]
#     return m
# print(mymax(1,29,3,4,59,2))

# def mymax(*arg):
#     res=max(arg)
#     return res
# print(mymax(1,20,3,19))


# # 람다 표현식 응용
# def pt(x):
#     return x+10
# print(pt(1))
#
# pt2=lambda x:x+10
# print(pt2(1))

# # 람다 자체를 바로 호출
# # (lambda 매개변수들:수식)(인수들)
# print((lambda x:x+10)(1))
# print((lambda x,y:x+y)(1,2))
# # print((lambda x:y=3;x+y)(1)) # 문법적 오류, 람다 함수 내에서는 따로 변수를 설정하 수 없음
# print((lambda x,y=3:x+y)(1))
# y=2
# print((lambda x:x+y)(1)

# # 함수의 인수 부분에 간단한 함수를 적용하고자 하는 경우
# # 람다 함수 자체를 인수로 사용
# # map함수와 함꼐 자주 쓰임
# def pt(x):
#     return x+10
# print(list(map(pt,[1,2,3])))
# # print(pt([1,2,3]))
# # 오류: [1,2,3](리스트) + 10(int)은 불가능 연산 단위가 안맞음
# print(list(map(lambda x:x+10,[1,2,3])))  # 가장 일반적인 람다식 사용
# # 매개변수가 없는 람다함수
# print((lambda :1)())
# x=2
# print((lambda :x)())

# # 연습문제
# fl=['test.c','test2.h','sample.py','sample2.c']
# def show(*arg):
#     for i in fl:
#         res = i.split(".")
#         if res[1] == "c" or res[1] == "h":
#             print(i)
# show(fl)