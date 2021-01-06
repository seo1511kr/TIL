# # 문자열 삽입
# print(",".join("abcd"))
# # 리스트에 저장되어 있는 각각의 컴마(,)와 결합하여 하나의 문자열이 됨
# print(["a","b","c","d"])
# print(",".join(['a','b','c','d']))
# print("".join(['a','b','c','d']))

# a=[10,20,30]
# a.pop()
# a.pop()
# a.pop()
# print(a)  # 빈 리스트 출력




# # # 자료구조(list[], tuple(), set{}, dictionary{})

# # ---------------------튜플--------------------------
# # 튜플은 직접 만들어 사용하는 경우는 거의 없고
# # 만들어진 함수의 결과값이 튜플로 저장되는 경우가 있음
# # 튜플은 리스트와 거의 동일하다
# # 차이점: 튜플은 값을 변경(생성, 삭제, 수정) 할 수 없음, ()사용
# # 요소값을 변경해야하는 실무에서는 주로 list를 사용함

# t1=(1,2,3)
# print(t1)
# print(type(t1))
# # 값을 변경하려고 하면 오류가 나옴
# # t1[1]=2
# # del t1[1]
# # 따라서 튜플은 자료를 온전히 저장할 때에 사용함

# # 튜플 슬라이싱 & 연산
# print(t1[2])
# print(t1[:2])
# t2=('a',3,4)
# print(t1+t2)
# t3=(5,6)
# print(t3*5)
# print(len(t3))

# # 여러 타입의 데이터를 혼합하여 저장가능
# person=('kim',20,60.5,True)

# # 빈 튜플
# t4=()
# print(t4)
# print(type(t4))

# # 요소가 하나인 튜플은 저절로 int
# t4=(7)
# print(type(t4))

# # 요소가 하나인 튜플을 튜플로 저장하기
# t4 =(7,)
# print(type(t4))

# # 괄호를 안써도 되지만 되도록이면 묶어서 표현할 것
# t5 = 5,8
# t5 = (5,8)
# print(t5)
# print(type(t5))

# # 이중 튜플 & range 이용하기
# t6=(1,2,(3,4))
# print(t6)
# t7 =tuple(range(1,13,2))
# print(t7)

# # 튜플 => 리스트, 리스트 => 튜플
# x=tuple(range(1,10))
# print(type(x))
# x=list(x)
# print(type(x))
# y=[1,2,4,5]
# tempy=tuple(y)
# print(tempy)
#
# # x에 저장된 5 => 50으로 변경하고 싶은 경우
# # x[4] = 50 => error
# # 튜플 => 리스트 => 요소값 변경
# x=tuple(range(1,10))
# x=list(x)
# x[4]= 50
# print(x)
#
# # 문자열을 쪼개서 저장할 때
# s='hello'
# print(list(s))
# print(tuple(s))
# print("".join(list(s)))

# # assign 하기
# a,b,c=1,2,3
# print(a)
# print((type(a)))
#
# a,b,c=[1,2,3]
# print(a)
# print((type(a)))
#
# a,b,c=(1,2,3)
# print(a)
# print((type(a)))
# k=(1,2,3)
# a,b,c=k
# print(a)
# print((type(a)))



# # -----------------시퀀스 자료형-------------------
# # 리스트, 튜플, 문자열, range, bytes, bytearray 값이 연속적으로 저장됨.
# # ex) [1,2,3] (1,2,3) "hello" range(3)

# # 데이터 조재 유무 확인 (in/ not in)
# # 작성방법 : 찾고자하는값 in 시퀀스객체
# print("5가 있나요?", 5 in (1,2,3,4,5)) # tuple
# print("5가 있나요?", 5 in (1,2,3,4,6))
# print("h가 있나요?", "h" in "hello")   # 문자열
# print(1 in range(1,13,3))            # range
# a=list(range(0,91,10))               #  list
# print(a)
# print(30 in a)
# print(45 in a)
# print(30 not in a)
# print(45 not in a)

# # 시퀀스 객체를 연결하는 법(단,range는 불가능)
# a=[1,2]  #list
# b=[3,4]
# print(a+b)
# a=(1,2)  #tuple
# b=(3,4)
# print(a+b)
# a="hello"  #string
# b=" new world"
# print((a+b))
# # range는 list or tuple로 변경한 후에 연결하기
# # a=range(0,3)
# # b=range(4,7)
# # print(a+b)   # error 나옴
# a=list(range(0,3))
# b=list(range(4,7))
# print(a+b)

# # 문자열과 숫자를 결합
# # 일반적인 + 연산은 error
# # 숫자를 문자열로 먼저 변경 후에 결합
# # ex) "hi" + 100
# print(str(100.11) + "hi")

# # 시퀀스 반복(*) 단, range는 불가능
# print([1,2,3]*5)
# print(5*[1,2,3])
# # print(range(0,5)*3) # error 발생
# print(list(range(0,5))*5)

# # len(시퀀스객체) : 시퀀스 데이터(요소) 개수
# a=[10,20,30,40]
# print(len(a))
# b=(1,2,3,4)
# print(len(b))
# c="hello"
# print(len(c))
# c="hello "    # 공백문자, 기호('," 등)도 길이에 포함됨
# print(len(c))
# d= range(1,10,2)
# print(len(d))

# # 파이썬 2.7 버전에서는 바이트 수가 나옴
# # 따라서, 한글의 len은 영어와 다르게 표현됨
# # 실무에서 2.7 버전 환경에서 작업시 주의!

# # 문자열 바이트 수 구하기 encode
# c='안녕하세요'  # 한글도 기본적으로는 같지만 bytes는 문자마다 다름
# print(len(c)) # 'utf-8'에서는 한글 한 글자가 3byte, 3*5 = 15 바이트
# print(len(c.encode('utf-8')))
# print((c.encode('utf-8')))

# # 삭제
# # del 시퀀스객체[인덱스]:
# # 주의: tuple, range, 문자열은 삭제 불가
# b=[10,20,30,40]
# del b[3]
# print(b)

# # 참조(indexing)
# # 시퀀스 객체는 대괄호[] 기호로 참조
# a=[5,6,7,8,9]
# print(a[3])
# print(a[-2])
# b=(4,3,4,6,7,7)
# print(b[-1])
# c=range(1,34,5)
# print(c[4])
# print(c[-1])
# d="lunch time"
# print(d[3])

# # 슬리이싱
# # 시퀀스객체[시작인덱스:끝인덱스]
a=[10,20,30,40]
print(a[:2])
print(a[0:0])
print(a[0:-2])
print(a[0:-1:1]) # 증가 혹은 감소폭
print(a[0:-1:2])
print(a[3:-5:-1])
# # len응용하기
# print(a[0:len(a)]) # a[0:4] = a[0]~a[3]
# print(a[:3:2])     # a[0]~a[2], 2칸씩 건너뛰기
# # range응용하기
# r=range(20)
# print(r[3:8])
# print(r[:15:3])
# print(list(r[:15:3]))
# # 문자열
# s='hello python'
# print(s[:10:2])
# # slice 객체 이용하여 슬라이싱
# print(range(20)[slice(3,9,2)])
# # range(20): range(20)객체[]
# print(list(range(5,20)[slice(3,9,2)])) #[5,6,7,8,...,19]

# # 데이터 assign
# a=list(range(10))
# print(a)
# a[1:4]=['a']
# print(a)
# a[1:4]=['a','b','c']
# print(a)
# # [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
# # [0, 'a', 4, 5, 6, 7, 8, 9]
# # [0, 'a', 'b', 'c', 6, 7, 8, 9]
# a=list(range(10))
# a[2:7:2]=('x','y','z')
# print(a)
# a=list(range(10))
# a[2:7:2]=('x','y','z')
# print(a)

# # error
# # 저장되어야 할 요소의 개수와 실제 데이터의 개수는 일치해야함
# # a=list(range(10))
# # a[2:7:2]=('x','y')
# # print(a)
# # a=list(range(10))
# # a[2:7:2]=('x','y','z','k')
# # print(a)

# # 슬라이스를 활용한 삭제
# a=list(range(10))
# print(a)
# del a[2:9:2]
# print(a)

# # IT(프로그램 개발자) 직무 유형: SI(시스템통합), SM(시스템유지보수)
# # SI: 처음부터 끝까지 새로 만듦
# # SM: 이미 만들어져 있는 시스템을 개선, 업그레이드..
# # SM 직군이 대부분인데 이 경우 다양한 코드를 해석하는 능력이 중요

# #--------------------딕셔너리{}--------------------------
# # 자료구조: 자료를 저장하고 관리하는 구조
# # 딕셔너리(사전): 단어-의미 구조와 유사하게 이름(키)=홍길동(값) 형식으로 표현
# # 키와 값의 쌍으로 표현되는 자료구조
# # {키:값, 키:값, ...} 중괄호 사용
# # 키는 변하지 않는 값(상수), 값에는 변하는 값을 표현
# # 상수: 문자상수(따옴표로 묶어서), 숫자상수(1,2,3,4,....)
# # but 숫자상수는 되도록 사용x
# # 딕셔너리 시퀀스 객체가 아님. 데이터 참조 방법이 시퀀스 객체와는 다름

# d={"name":'kim',"addr":'seoul',"age":25}
# print(d)
# # 값에 또다른 자료구조가 올 수 있음
# # 반면, 키에는 자료구조가 올 수 없음
# d={"name":'kim',"addr":'seoul',"age":25, "nn":['별명1','별명2']}
# print(d)
# # 변수는 변할 수 있음, 때문에 키가 될 수 없음
# myname='lee'
# myname='park'
# print(myname)
# # 숫자상수 사용 가능하지만, 사용하지 말 것
# d2={1:'hi'}
# print(d2)
# # [1,10,15,20,30,70] 데이터들 사이에 연관 관계가 없음
# # 리스트(튜플) 구조로 연관 관계가 있는 데이터를 표현하기가(이해하기도) 어려움

# # ex) 게임 캐릭터 리스트로 표현
# l=['홍길동', 10, 100, 20, 200, 50]
# print(l)
# # 각 요소값이 무엇을 의미하는지 알기 어려움
#
# # ex) 게임 캐릭터 딕셔너리로 표현
# dic= {"아이디": '홍길동', "레벨": 10, "체력": 100, "마나": 20, "공격력": 200, "방어력": 50}
# print(dic)
# # 키가 중복될 때는 마지막에 저장된 값이 출력(아이디: 홍길동 => 임꺽정)
# dic= {"아이디": '홍길동', "레벨": 10, "체력": 100, "마나": 20, "공격력": 200, "아이디": '임꺽정'}
# print(dic)
# # 한 키에 여러 값을 저장할 때
# dic= {"아이디": ['홍길동','이순신','임꺽정'], "레벨": 10, "체력": 100, "마나": 20, "공격력": 200, "방어력": 50}
# print(dic)
#
# # 빈 딕셔너리 생성
# a={}
# print(a)
# b=dict()
# print(b)

# # dict() 로 딕셔너리 만들기

# # 0. {"키":값}
# # 1. dict(키=값): 키에 따옴표가 없어짐! 주의
# a= {"아이디": '홍길동', "레벨": 10, "체력": 100, "마나": 20, "공격력": 200, "방어력": 50}
# b= dict(아이디='홍길동', 레벨= 10, 체력= 100, 마나= 20, 공격력= 200, 방어력= 50)
# print(a)
# print(b)
# # 2. dict(zip(["키1","키2",..],[값1,값2,..]))
# # zip(["키1","키2",..],[값1,값2,..])
# # dict(zip(["키1","키2",..],[값1,값2,..])) => zip 객체를 dict로 변환
# c=zip(["아이디","레벨","체력","마나","공격력","방어력"],["홍길동",10,100,20,200,50])
# print(c)
# print(dict(c))
#
#
# # 3. list, tuple 활용하기
# # dict([(튜플1),(튜플2),....])
# d=dict([("아이디",'홍길동'), ("레벨", 10), ("체력", 100), ("마나", 20), ("공격력", 200), ("방어력", 50)])
# print(d)
#
# # 4. 중괄호 사용하기
# e=dict({"아이디": '홍길동', "레벨": 10, "체력": 100, "마나": 20, "공격력": 200, "방어력": 50})
# print(e)
#
# # 딕셔너리 데이터 추가/삭제
# a={'nn':'bear'}
# print(a)
# a['addr']='seoul' #딕셔너리[키이름]=값
# a['hobby']=['netflix','lol','climbing']
# print(a)
# del a['addr'] # 시퀀스와는 달리 [키], (숫자 인덱스 x)
# del a['hobby']
# print(a)

# 딕셔너리 활용 => json 파일 포맷(웹)
# 파일이 가벼워짐, 전송 속도가 빠르고, 메모리 효율적 사용

# # 다양한 함수들
# dic={'아이디':'홍길동', '레벨':10, '체력':100, '마나':20, '공격력':200, '방어력':50}
# print(dic)
# # .keys() :키만 추출
# print(dic.keys())
# # .values() :값만 추출
# print(dic.values())
# # .items() :키와 값이 쌍으로 묶여 추출
# print(dic.items())

# # 메모리 관리 관점에서 하나로 묶어서 저장하는게 효율적
# mykey=dic.keys()
# print(mykey)
# # error: print(mykey[0]) 숫자인덱스가 아닌 키를 넣어줘야함
# # list로 묶어서 해야함
# lmykey=list(mykey)
# print(lmykey)
# print(lmykey[0])

# dic={'아이디':'홍길동', '레벨':10, '체력':100, '마나':20, '공격력':200, '방어력':50}
# dic['저항력']=100
# print(dic)
# print(dic['마나'])
# # 없는 키를 참조할 때 => KeyError: '민첩성'
# # ex) print(dic['민첩성'])
#
# # 딕셔너리에 키가 있는지 확인? => in을 활용하기
# print('민첩성'in dic)
# print('민첩성' not in dic)
# print('마나'in dic)
#
# # len 함수 적용하기: 딕셔너리에 저장된 요소의 개수
# print(dic)
# print(len(dic))

