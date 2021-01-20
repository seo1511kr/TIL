# hw3 리뷰 ============================================================
# # 최대, 최소, 합, 평균
# # max()/min()/sum()/len()
# num=[5,1,4,3,2]
# print(max(num))
# print(min(num))
# print(sum(num))
# print(len(num))
# mean=sum(num)/len(num)
# print(mean)
#

#
#
#
#
# # 불 자료형: 참(True) or 거짓(False)============================================
# # 참: "test", [1,2], 1, ...
# # 거짓: "", None, 0, [], (), {}
# a=[1,2,3]
# print(a.pop())
# print(a)
# print(a.pop())
# print(a)
# print(a.pop())
# print(a)
# # print(a.pop()): 아무것도 없어서 에러발생
#
# #======================================================================
# # while 조건: #조건이 참인 동안에 문장 수행을 반복하세요( 조건이 거짓이 될 때 까지)
#       # 문장1
#       # 문장2
#       # ..
# a=[1,2,3]
# while a: #True : a 리스트에 pop 대상 데이터가 남아있는 경우
#     print(a.pop())
# print("반복문을 종료합니다")
#
# #========================================================================
# # if 조건:
# #     문장1
# #     문장2
# # else:
# #     문장1
# #     문장2
# if []: #if 조건 만약에 조건을 만족하면(조건이 참이면)
#     print("참")
# else:  #만족하지 않으면(조건이 거짓이면)
#     print("거짓")
# #===========================================================================
# # 참, 거짓 기억 안날때는 bool() 활용
# print(bool([]))
# print(bool(["dsdgef"]))
# print(bool(0))
# #===========================================================================
# # 변수=리스트? 리스트(객체)는 메모리에 생성되고, 변수 a는 리스트가 저장된 메모리상의 주소를 가지게 됨
# # 변수1 is 변수2: 두 변수가 가리키는 메모리상의 대상이 동일한 지 확인
# print("="*70)
# a=[1,2,3]
# b=[1,2,3]
# print(a==b)  # 같은 값을 불러오지만
# print(a is b)# 서로 다른 객체의 주소를 갖음
# print(id(a))
# print(id(b))
#
#
# #a가 가지고 있는 값은 엄밀히 얘기하자면 [1,2,3]이 저장되어 있는 "주소값"
# a=[1,2,3]
# b=a  # a의 주소를 b에 복사한다는 느낌
# print(id(a))
# print(id(b)) # 두 값이 같음 (= a가 가지고 있는 주소값이 b에 복사(저장))
# print(a==b)  # 같은 값을 불러오지만
# print(a is b)# 서로 다른 객체의 주소를 갖음
# # 하나의 [1,2,3] 객체 주소를 저장소 a 와 b에 연동
# a[1]=5  # [1,2,3] 객체를 변경
# print(a)
# print(b)# a 와 b는 같은 객체로 이동하기 때문에 변동사항이 b에도 적용됨
#
# #========================================================================================
# # a와 주소를 공유하는 것이 아니라
# # b에 a와 동일한 값의 새로운 주소를 부여하고 싶을 때
#
# # 1번 방법
# # b=a[:]
# a=[1,2,3]
# b=a[:]      # b=a는 동일한 주소
# print(id(a))
# print(id(b))
# print(a)
# print(b)
# print(a is b)
# print(a == b)
# a[1]=10     #  a만 변동됨
# print(a)
# print(b)
#
# # 2번 방법
# # copy모듈에 있는 copy함수를 사용
# # from 모듈명 import 함수명
# a=[1,2]
# from copy import copy
# b=copy(a)
# print(id(a))
# print(id(b))
# print(a is b)


#=============================================================================
# # if 조건문:
# #     코드
# # 들여쓰기 정도 맞춰주기
# x=1
# if x==1:
#     print("x는 1이다")    #pass 코드를 수행하지 않고 넘어감
#     print("x는 홀수이다")
# else:
#     print("x는 1이 아니다")
# print("이상입니다")       # if 문과는 별개의 문장
#
# x=5
# if x>=1:
#     print(('1이상'))
#     if x>=5:
#         print('5이상')
#     if x==10:
#         print("10")
# print('출력')


# # or, and, not: 여러 조건을 표현
# money=1000
# card=True
#
# # or(|)
# if money>=5000 or card:
#     print("택시")
# else:
#     print("버스")
#
# # &(and)
# if money >= 5000 and card:
#     print("택시")
# else:
#     print("버스")
#
# # !(not)
# if card != False:
#     print("택시")
# else:
#     print("버스")
# money=1000
# if not money <=5000:
#     print("택시")
# else:
#     print("버스")

# # in/ not in
# print(4 in [1,2,3])
# print(4 not in [1,2,3])
# print("a"in('a','b'))
# print("h"in'hello')

# if/elif/else
# if 조건:
#     문장
# elif 조건:
#     문장
# elif 조건:
#     문장
# else:
#     문장
# money=1000
# card=True
# if money > 3000:
#     print("택시")
# elif card: #3000원 이하의 돈을 가지고 있지만, 카드를 가지고 있다면
#     print("버스")
# else:      #돈이 3000원 이하면서 카드도 없는 경우
#     print("도보")
#
# # 자율주행차 동작의 일부를 if 구문으로 작성한다면, if가 몇개 필요할까? 무한대
# # if 조건
# #     확률계산
# #     if 확률 >0.5:
# #         멈춰
#
# s=60
# if s>60:
#     msg="pass"
# else:
#     msg="fail"
# print(msg)
# # ********************퇴근을 5초 당겨주는 궁극의 코드**********************
# msg='pass' if s>60 else "fail"
# #만약에 s가 60이상이면 "pass"를 msg에 대입하고, 아니면 "fail"을 msg에 대입
# # 조건문이 참인 경우 if 조건 else 거짓인 경우
# print(msg)
# #**********************************************************************


# # while을 이용한 반복문================================================================

# i=0
# while i<10: #"i 변수 값이 10보다 작다" 라는 조건을 만족하는 동안에, 문장을 반복하세요
#     i=i+1
#     print(i,"번째 반복 수행")
# # 무한루프: 정지하고 싶으면 터미널 창 왼쪽에 ㅁ 정지버튼
# # while True:
# #     i=i+1
# #     print(i,"번째 반복 수행")
# #     if i > 10:
# #         break # 반복문을 빠져나가라

# prompt="""
# 1.추가
# 2.삭제
# 3.종료
# 번호 입력:"""
# # print(prompt)
# num=0
# while num !=3:
#     print(prompt)
#     num=int(input())


# # continue, break 사용하기***************************************
# a=0
# while a<10:
#     a+=1
#     if a%2==0: continue #continue는 while의 시작위치로 이동
#     print(a)
# while a<10:
#     a+=1
#     if a%2==0: break #break는 반복문을 벗어나게 됨
#     print(a)
# #***************************************************************

# # 연습문제
# # while문을 이용하여 1~100 사이의 자연수 중 4의 배수의 합을 출력
# # 1번 풀이
# i=0
# sum=0
# while i<=100:
#     i=i+1
#     if i%4!=0: continue
#     sum=sum+i
# print(sum)
# # 2번 풀이
# i=0
# sum=0
# while i<=100:
#     i=i+1
#     if i%4==0:  sum=sum+i
# print(sum)
# # 3번 풀이 i= 1부터 시작
# i=1
# sum=0
# while i<=100:
#     if i%4==0:  sum=sum+i
#     i=i+1
# print(sum)
#
# # for문
# # for 변수 in 리스트(튜플,문자열):
# #     문장1
# #     문장2
# mylist=[1,2,3]
# for i in mylist:
#     print(i)
# mylist=["하나","둘","셋"]
# for i in mylist:
#     print(i)
# mylist="bigdata"
# for i in mylist:
#     print(i)
# for i in [(1,2),(3,4),(5,6)]:
#     print(i)
# for i in (1,2,3):
#     print(i)
# for i,j in [(1,2),(3,4),(5,6)]:
#     print(i,j)
# for i in range(5,16,3):
#     print(i)
# a=[5,6,7,8]
# for i in range(len(a)):
#     print(i)

# 2중 for 문으로 구구단 만들기
# for j in range(2,10): #단 2to 9
#     for i in range(1, 10): #i=1 to 9
#         print(j*i, end=" ")
#     print("")  #줄 바꿈


# import random
# print(random.randrange(1,46))
# print(random.randint(1,46))
# print(random.randrange(1,46,2)) # 홀수만 나옴
