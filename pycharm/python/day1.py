# 파이썬의 특징
#
# 성능은 조금 느리지만 생산성이 높음(c언어에 비해 개발기간이 짧음)
# 플랫폼에 독립적이어서 어느 운영체제에서나 사용가능, 웹에 유리함(이기종간 통신)
# 인터프리터 방식으로 동작하는 스크립트 언어 <-> 컴파일 언어
# 실무에 필요한 고급 라이브러리 대거 포함(배터리 포함 철학)
# 객체지향적, 클래스를 지원
# C 언어와의 접착성이 좋아 혼합 프로그l래밍이 가능함
# (고성능 엔진은 C로 만들고 자주 바뀌는 부분만 파이썬으로 작성)
#
# 파이썬의 활용
# GOOD:유틸리티 제작, 웹 프로그래밍, 임베디드(Iot 초소형 컴퓨터 프로그래밍), DB
# BAD: 시스템 프로그래밍, 고성능 응용(게임...), GUI, 모바일

## ctrl + / -> 블록 전체가 주석(참고문)으로 간주됨
##  ctrl shift f10, alt f10, shift f10

## 자료구조
## list tuple dictionary set
## 대괄호 [] 는 list : “”로 자료들을 구분하여 저장 [“”, “”, “”]
## 소괄호 () 는 tuple
## 중괄호 {} 는 dictionary, set

## 변수 = 데이터 ==> 데이터를 변수에 저장
# a =1 # 같다라는 의미 x, assign( 할당, 왼쪽의 변수에 오른쪽의 값을 할달해라)

languages = ('python', 'perl','c', 'java')
for lang in languages:
    if lang in ['python', 'perl']:
        print("%6s need interpreter" % lang)
    elif lang in ['c', 'java']:
        print("%6s need compiler" % lang)
    else:
        print("should not reach here")

## 코드블록: 들여쓰기가 동일한 코드 집합
a = 3
if a==3:
    print('3');
    print("three");
    print("3과 같아요")
if a==4:
    print('4');
    print("four");
print("4와 같아요") #코드블록 밖

##연산자
print(6//3)     # //: 몫만 보여짐, 소수점 이하는 버림
print(6//3.0)   # 2.0, 정수로 나누는지 실수로 나누는지에 따라 다름
print(7%4)      # %:나머지 연산자
print(2**2)     # **: 거듭제곱연산
print(2**10000) #2의 10000승

print(divmod(9,4)) #9를 4로 나눈 몫과 나머지
res1, res2 = divmod(9,4)
print("1번째 요소 :",res1)
print("2번째 요소 :",res2)
# 함수(인수1, 인수2) divmod는 함수, 인수: 함수 안에 기술된 수
# 인수는 있을수도 없을수도 있다
# divmod 함수는 2개의 인수가 필요하다
# 인수1은 피잿수 인수2는 잿수
# 결과가 (2, 1) 소괄호로 묶여있음. 즉, 자료구조가 tuple
# 요소(element): (2,1) 튜플에서 2와 1은 각각 요소

# print(type(10)) #int :정수, 숫자
# print(type("10")) #str : 문자
# print(type(10.4)) #float: 실수

## \n, \n\n, \t
# print("안녕!")
# print("반가워요")
# print("잘있어요")
# print("안녕!\n반가워요\n잘있어요") # \n: new line
# print("안녕!\n반가워요\n\n잘있어요") # \n\n: 2줄 바꿈
# print("안녕!\t반가워요\t\t잘있어요") # \t: tap

## 구분자,연결자 활용하기
## naver$kakao$samsung처럼 출력할 때
print("naver","kakao","samsung", sep = "$") # sep 옵션
print("안녕",end="");print("하세요")  #안녕하세요 end 옵션
print("안녕",end=" ");print("하세요") #안녕 하세요
print("안녕",end="^_^");print("하세요") #안녕^_^하세요

## 변수 여러개 동시에 설정
# a,b,c = 1,2,3 #변수와 숫자의 개수 맞춰주기
# print(a,b,c)
# a,b,c,d,e = 1,2,3,4 #not enough values to unpack
# a,b,c = 1,2,3,4 #too many values to unpack
# a=b=c=d=1
# print(a,b,c,d)

## 변수 값 교환
# x,y=1,2
# a=y
# y=x
# x=a
# print(x,y)

## 파이썬에서만 가능한 방법
# x,y =y,x
# print(x,y)

## accumulate
# x=10
# x+=10 # x=x+10과 동일한 표현 컴퓨터 입장에서는 조금 더 빠름
# print(x)
# x-=5
# print(x)
# x*=5
# print(x)
# x/=5
# print(x)

# a=1 # 메모리에 a라는 공간을 만들고 1을 저장해라
# print(a)
# del a # 메모리에 있는 a라는 공간을 제거해라
# print(a) # NameError: name 'a' is not defined

## 값이 지정되지 않은 변수 만들기
# b = None #사과바구니 자체가 없음
# print(b)
# b = '' # None과는 다름, 사과바구니는 있는데 아무것도 안들어있음.

## .split 옵션으로 str 분리하기
# print("안 녕 하 세 요".split())
# 숫자 두개 입력 : 1 2 (엔터)
# x,y=input("숫자 두 개 입력:").split()
## 주의: int 함수는 인수가 1개라서 int(1,2)는 error가 나옴
# print(int(x)+int(y))
## ,로 split하기
# x1,x2 = map(int, input("숫자 두 개 입력 : ").split(","))
# print(x1+x2)

## 따옴표 3개를 사용하는 용도
## 여러 줄에 걸친 문자열을 입력할 때
# x = "인생은\n짧다\n그래서\n파이썬이\n필요하다"
# print(x)
# x = """인생은
# 짧다
# 그래서
# 파이썬이
# 필요하다
# """
# print(x)

## 슬라이싱, 인덱싱
# 범위지정 슬라이싱을 할 때 [시작위치, 끝위치 +1]을 해야함
# 인덱싱 : 변수에 저장된 문자열에 대해 위치를 지정하여 참조하는 행위
# 인덱싱은 음수도 가능함 >> 뒤에서부터 -1, -2,...

# x = "pithon"
# print(x)
# x[1]="y" # 문법적 에러 : 문자 / 문자열을 구분해야함
## 문자열의 요소값은 변경이 안됨
# print(x[0]+"y"+x[2:])

## 포매팅
# print("I eat 5 eggs")
# print("I eat %d eggs" % 10) # 문자열 포매팅, %d(decimal)
# x=2
# print("I eat %d eggs" % x)
# x= "two"
# print("I eat %s eggs" % x) # %s(string), %f(float)

# %를 문자로 입력하고 싶을때는 %를 두개 붙여주기
# x=2
# y ="two"
# per = 30
# print("I eat %s eggs. so I was sick for %d days. %d%%" % (y,x,per))
# k = ()
# print(type(k))
# i = ("파")
# print(type(i)) #type 이 str
# i =("파",)
# print(type(i))


#hw201229 3번
# s = ("파이썬"*3)
# a=""
# for i in s:
#     if i == "파":
#         a=a+i
#     else:
#         a =a
# print(a)

# print("파"*a)
#
# c =""+"파"
# print(c)



# x1,x2 = map(int, input("숫자 두 개 입력 : ").split())
# print(x1)
# print(x1+x2)
# print(input("숫자 두 개 입력:").split())
# ['1', '2']로 출력이 됨

# map 은 list 나 set 형태로 표현할 수 있음

