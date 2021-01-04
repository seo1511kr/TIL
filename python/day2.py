# #offset
# s = "파이썬파이썬파이썬"
# s[::3]
# print(s[0::3])
# #offset: 몇 칸을 건너뛸것인지, 양수(좌->우), 음수(우->좌)
# print(s[::1])
# s= 'python'
# print(s[::-1])  # 뒤에서부터 nohtyp
#
#
#
# #replace함수 : 문자(열) 치환
# #데이터수짐 ->전처리->분석->...
# tel="010-1234-5678"
# # tel. # ctrl + spacebar
# # tel.replace(from, to) # 2개의 인수가 필요
# result=tel.replace("-","") # 아예 붙이고 싶을때는 공백주의
# print(result)
# # 동질의 의미를 갖는 단어들을 동일한 단어로 치환 해야함
# # 대한민국, 한국, 코리아, Korea, KOREA, SouthKorea,RebofKorea
# # 고려, 조선
# # 기업은행 챗봇 개발 프로젝트 실시할 때 힘들었던 점
# # 상담 데이터의 부족(20만건정도)
#
# # 구분자
# print(1,2,3, sep="%")
#
# # bull 연산자
# #비교 연산
# # 비교 연산자의 수행 결과는 bull 형태(T/F 로 나옴)
# print(type(3>2))
# print(type(3==2))
# print(2==2)
# print(2!=2)
# print('python'=='Python') # 대문자와 소문자의 비교
# # a==b #==는 두 값이 같은지를 비교
# # a is b #is 는 두 객체를 비교 값, 타입 모두 동일한가
# a= 3
# b=map(int,"3")
# print(a ==b)
# print( a is b)
# b =3.0
# print(a ==b)
# print(a is b)
#
# #논리 연산
# #T/F 같은 논리 값들에 대한 연산
# # And, Or, Not
# print(1==1 and 2!=1) # T and T => T
# print(3>1 or 1<2)   # F and F => F
# print(not 1>2)      # F => T, T => F
# # 0:False, 1:True, 0이 아닌 모든 수가 True
# print(bool(1))
# print(bool(0))
# print(bool(0.5))
# print(bool('test')) # 문자열도 True
# print(bool('')) # 빈 문자열은 False
# print(bool(0 or 'test'))
# print(bool(0 or ''))
#
# # 포매팅
# # print("I eat {0} apples" .format(num))
# num= 3
# s="two"
# day="three"
# print("I eat %d apples" % num) # type에 따라 매번 바꿔줘야 함
# print("I eat %s apples" % s)
# print("I eat {0} apples" .format(num)) #type에 관계없이 사용 가능
# print("I eat {0} apples" .format(s))
# # 출력값이 2개 이상일 때
# print("I ate {0} apples for {1} days." .format(num,day))
# # 직접 값을 대입
# print("I ate {num} apples for {day} days." .format(num=5,day=3))
#
# # 정렬
# # %
# print('hi')
# print('             hi')
# print('hi              ')
# print('%10s' % 'hi') # 오른쪽 정렬
# print('hello%10s' % 'hi')
# print('%-10s' % 'hi') #
# print('%-10shello' % 'hi') # 왼쪽정렬
# print("{0}".format("hi"))
# print("{0:<10}".format("hi")) #왼쪽정렬
# print("{0:>10}".format("hi")) #오른쪽 정렬
# print("{0:^10}".format("hi")) #가운데 정렬
# print("{0:-^10}".format("hi")) # 기호 앞에 문자 => 빈자리를 채워줌
# # 소수점 자리수
# print("{0:.4f}".format(3.141592)) # 소수점 4째
# print("{0:10.4f}".format(3.141592)) # 10자리 확보후 소수점 4째
# print("%.4f" % 3.141592) # 소수 이하 4째 자리까지 표현
# print("%10.4f" % 3.141592) # 10자리를 확보한 다음 출력(우측 맞춤)

# print('python'.ljust(10)) # 10자리 확보 후 좌측 정렬
# print('python'.rjust(10)) # 10자리 확보 후 우츨 정렬
# print('python'.center(10))

# # count
# a = ("hello")
# print(a.count("l"))

# 위치 확인(find, index)
# print(a.find("l")) # 0부터 시작임, 여러개 있는 경우에는 맨 처음 위치
# print(a.find("x")) # 문자가 없는 경우는 -1이 나옴
# print(a.index('l'))
# # find와 index의 차이
# print(a.index('x')) # 문자가 없는 경우 error

# 문자열 삽입
# print(",".join("abcd"))
# # 리스트에 저장되어 있는 각각의 컴마(,)와 결합하여 하나의 문자열이 됨
# print(["a","b","c","d"])
# print(",".join(['a','b','c','d']))
# print("".join(['a','b','c','d']))

# # 대소문자 일괄적으로 통일하기
# a='hi'
# print(a.upper())
# print(a)
# a= a.upper()
# print(a)
# a= a.lower()
# print(a)
#
# # 공백문자 통일하기 (.lstrip,.rstrip,strip)
# # "  대한민국", "대한민국   ", "대한민국",...
# # 컴퓨터는 다 다르다고 인식함
# n1 ="  대한민국"
# n2 ="대한민국  "
# n3 ="   대한민국   "
# print(n1.lstrip())
# print(n2.rstrip())
# print(n3.strip())
# 단, 사이에 있는 공백은 제거할 수 없음, 직접 함수 만들어야 함

# s="Life is too short"
# print(s.replace("Life", "Your leg"))
# print(s.replace("life", "Your leg"))
# # 소문자 life는 없으니 그대로 출력
# print(s.split()) # list로 출력됨
# print(type(s.split()))
# s=s.replace(" ","$")  # s= Life$is$too$short
# print(s.split('$'))
# print(s.split('s')) #ctrl + space => 앞에 m이라고 표시됨
# # m = method를 의미함, 함수랑 사실상 같은 의미
#
# t=str.maketrans('aeiou','12345')
# #str.maketrans('바꿀문자','새문자') 작성하여 변환테이블(t) 생성
# print('apple'.translate(t))
# # apple 문자열을 t 변환테이블을 참조하여 변환하세요
# # 연습
# s="Life is too short"
# k=str.maketrans(' ',"$")
# s=s.translate(k)
# print(s) # s= Life$is$too$short

# #정규표현식 : 문자열 전처리
# str=", python,."
# print(str.lstrip(","))
# print(str.lstrip(" "))
# print(str.lstrip(" ,")) # 2개 이상의 문자 모두 제거가능
# print(str.lstrip(", ")) # 순서는 상관없이 제거대상 나열하면 됨
# print(str.lstrip(" ,."))
# print(str.rstrip(",."))
# print(str.rstrip(",")) # 오른쪽 끝부터 다가오니까 제거를 멈춤
# # 중간에 있는 공백은 제거가 안되는 것과 같은 이치임
# print(str.rstrip("."))
# print(str.strip(" ,."))
#
# import string # 패키지: 모듈들의 묶음 (외장함수)
# print 같은 함수와는 다르게 별도로 적재해야함
# print(string.punctuation)
# # puctuation (구두점) : !"#$%&'()*+,-./:;<=>?@[\]^_`{|}~
# print(str.strip(string.punctuation))
# print(str.strip(string.punctuation+" "))
# import random
# print(random.random()) # 모듈명. 함수명
# print(random.randint(1,10))


# # method(함수) 체이닝(chaining)
#
# print('python'.rjust(10))
# s ='python'.rjust(10)
# print(s.upper())
# print('python'.rjust(10).upper().split("Y"))
#
# # 패딩(padding: 특정 값으로 빈자리를 채우는 것)
# print("hello".zfill(10))
# print("345".zfill(10))
#
# print("apple pineapple".find('p'))
# print("apple pineapple".find('pp'))
# print("apple pineapple".find('pl'))
#
# #  오른쪽부터 찾음, index는 앞에서부터
# print("apple pineapple".rfind('p'))
# print("apple pineapple".rfind('pp'))
# print("apple pineapple".rfind('ip')) # 못찾으면 -1
# print("apple pineapple".rindex('ip')) # error

# # 리스트: 여러개의 변수를 저장하는 자료구조
# x = [10,20,30]
# print(x)
# # x리스트의 0번 index 요소값 = 10
# print(x[0])
# print(x[2])
# y=['life','is','too','short']
# print(y[0])
# z=[1,2,'life','is','too','short',3.14,1==2]
# # 리스트는 여러가지 자료형을 저장할 수 있음
# print(z[1])
# print(z)
#
# a=[1,2,['life','is']]
# print(a[2])
# a=[1,2,('life','is')]
# print(a[2])
# # a의 요소는 3개 (0~2번까지의 인덱스)
# # list에는 list를 요소값으로 할 수 있음, tuple도 가능
# print(a[2][0])
# print(a[2][1])
# a=[1,2,['life','is',["too","short"]]]
# print(a[2][2][0])
#
# b=[] # 빈 리스트 생성
# b= list()
#
# b=[1,2,3,4,5,6,7,8,9]
# print(b[0]+b[2])
# print(b[::-2])
# a=[1,2,['life','is',["too","short"]]]
# print(a[2])
# print(a[::-1][0][-1][-2])
#
# #슬라이싱
# x=[1,2,5,9,5]
# print(x[1:4]) # 1~3번 인덱스 출력
# print(x[1:])
# print(x[:4])
# print(x[::-1])
#
# s="abcdefg"
# print(len(s))
# print(s[2:5]) # 2~4번 인덱스
#
# a=[1,2,3,['x','y','z'],4,5]
# print(a[3][:2])
# print(a[3][:-1])
#
# range(5) # 0~ 5-1까지 숫자를 생성
# print(range(5)) # range(0, 5)
# print(list(range(5))) # [0, 1, 2, 3, 4]
# print(list(range(3,10,2))) # 시작점, 끝점-1, 간격
# print(list(range(10,0,-1)))
#
# a=[1,2]
# b=["ab","cd"]
# print(len(a))
# print(a+b)
# print((a+b)*3)
# print(type(a[0]))
# print(type(b[0]))
# # print(a[0]+b[0]) # type이 서로 다르기 때문에 연산 error
# print("1"+"ab")
# print(str(a[0])+b[0]) # type을 str로 맞춰줌
#
# # 리스트 요소 값 변경
# a=[1,2,4]
# a[2]=6  # 일반 문자열은 error
# print(a)
# # 리스트 요소 값 삭제
# a= list(range(1,13,3))
# print(a)
# del a[:3] # 0~2번 index까지 삭제
# print(a)
# # print(a+ 4)  # Typeerror: a는 list고 4는 int라서
# print(a+[4])
# print(a)
# a.append([4,7,8]) # 요소 값이 list로 추가됨 저장까지 완료
# print(a)
# a.append(4)
# print(a)
# a.extend([5,6,7]) # 확장: a= a+[5,6,7]
# print(a)
#
# # 정렬:정해진 순서(내림/오름차순(0=>9, ㄱ=>ㅎ, a=>z))로 데이터를 나열
# a=[3,6,4,2,9]
# a.sort() # 오름차순 정렬 후 a에 저장까지 완료
# a.reverse() # 내림차순: 오름차순 정렬 결과를 반대로 뒤집음
# print(a)
#
# a=[3,6,4,2,9]
# print(a.sort())
# # None이 나오는 이유: a.sort()는 일종의 상자같은 느낌
# # 속의 내용을 볼 수 없음, 값을 보고싶으면 a를 출력해야함
#
# a=['b','k','d']
# a.sort()
# a.reverse()
# print(a)
#
# # 리스트의 특정 위치에 데이터 추가: insert
# a=[7,8,9]
# a.insert(1,4)  # 위치(7과 8 사이), 추가할 숫자
# print(a)
# a.insert(0,2)
# print(a)
#
# 예약어 vs 함수
# # 리스트의 요소를 제거: del, remove, pop
# # del : 특정 위치에 저장된 값을 제거
# a=[10,20,30]
# del a[1]
# print(a)
#
# # remove: 특정 값을 제거
# a=[10,20,30,10,20,30]
# a.remove(30) # 단, 해당 요소값이 다수일 때 첫번째 30만 제거
# a.remove(30)
# print(a)
#
# # pop: 가장 마지막 위치에 있는 데이터를 제거
# a=[10,20,30]
# a.pop()
# a.pop()
# a.pop()
# print(a)
#
# # 연습
# a =list(range(0,13,3))+list(range(23,3,-1))
# a.sort()
# a.reverse()
# print(a)


# 튜플과 리스트의 차이
# 튜플은 값을 변경할 수 없음

# 파이썬, 판다스, 넌파이를 잘 다룰줄 알아야함
# 탐색적 데이터 분석 과정
# 데이터를 시각화한 후에(시각화 툴 다루기)
# 데이터의 전체적인 경향과 특징을 파악

