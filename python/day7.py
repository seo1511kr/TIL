#양도세 계산해주는 계산기 만들어보기
#취득세 계산해주는 계산기 만들어보기


# # 파이썬 라이브러리: 수 많은 파이썬 함수
# # abs()
# print(abs(-3.8))
#
# # 1. all(), any()
# print(all([1,2,3]))
# print(all([1,2,3,0]))
# print(any([0,0,0,1]))
#
# # 2. chr(), ord()
# # 아스키 코드표에 각 입력값에 대한 것들이 2진수 코드로 변환되어 컴퓨터에 저장됨
# print(chr(65)) # 아스키 코드 => 문자
# print(ord('A'))# 문자 => 아스키 코드
#
# # 3. enumerate(반복 가능한 자료형)=========================================================
# # 열거형 데이터를 표현하는 함수, for 문과 함께 사용,
# # 리스트, 튜플, 문자열등 (시퀀스 데이터) 입력 => 인덱스를 포함하는 enumerate 객체 생성
# for i in ['aaa','bbb','ccc']:
#     print(i)
# for idx,i in enumerate(['aaa','bbb','ccc']):
#     print(idx,i)
# print
# '''
# 0 aaa
# 1 bbb
# 2 ccc
# # '''
#========================================================================================
# # 4. eval("string")
# # 문자열로 구성된 수식 -> 입력 -> 문자열을 실행한 결과를 출력
# # 특히 stack이라는 자료구조 사용시 필요
# print("10+20")
# print(type("10+20"))
# print(eval("10+20"))
# print(type(eval("10+20")))
# print(eval("10+20*(3+10)"))
# print(eval("divmod(5,3)"))
#
# # 5. filter(함수이름, 1번째 인수에 있는 함수에 입력될 반복 가능한 자료형)==========================
# # 원하는 데이터를 걸러내는 함수
# # filter함수의 리턴값이 True(참)인 값들만 묶어서 돌려줌
# def pos(a):
#     res=[]
#     for i in range(len(a)):
#         if a[i] > 0:
#             res.append(a[i])
#     return res
# k=[1,3,-5,-7,9]
# # print(pos(k))
# # 주의: filter에 사용될 함수의 return 값은 bool형을 띄어야 함!
# def pos2(a):
#     return a>0  ## bool형이 return 되도록
# print(filter(pos2,k))       # 필터 객체가 나옴
# print(list(filter(pos2,k)))

# # filter + lambda: 한줄에 가능*********
# print(list(filter(lambda a:a>0,k)))
# #=========================================================================================
#
# # 6. hex(): 16진수로 변환
# print(hex(234))
# # 0xea= e*16+a*1= 14*16+10*1=234
# print(int('3'))
# print(float("3.4"))
# print(int('ea',16))
#
# # # 리스트 내포(컴프리헨션)=================================================================
# print([n for n in range(11)])
# print([n*2 for n in range(11)])

# # 일반적인 리스트 저장 표현
# num=[]
# for n in range(11):
#     num.append(n)
# print(num)

# evenNum=[]        # 변수명: 단어가 합성어일때 뒤에 문자 첫글자 대문자
# for i in range(11):
#     if i % 2 == 0:
#         evenNum.append(i)
# # 1~10까지 짝수만 저장(리스트 컴프리헨션)
# [i for i in range(1,11) if 1 % 2 == 0] # if 조건문은 for문 뒤에 옴
#
#
# # 다음과 같은 리스트 만들기
# [("쌈밥",'사과'),
#  ("쌈밥",'아이스크림'),
#  ("쌈밥",'커피'),
#  ("치킨",'사과'),
#  ("치킨",'아이스크림'),
#  ("치킨",'커피'),
#  ("피자",'사과'),
#  ("피자",'아이스크림'),
#  ("피자",'커피'),]
#
# 다중 for문, 다중 if문 list comprehension
# # ['쌈밥','치킨','피자']
# # ['사과','아이스크림','커피']
# print([x*2 for x in ['쌈밥','치킨','피자']])
# print([(x,y) for x in ['쌈밥','치킨','피자'] for y in ['사과','아이스크림','커피']])
# # 2중 for문 방식으로 생각하면 됨 x[0], y[0~2]

# print([(x,y,z) for x in ['쌈밥','치킨','피자'] for y in ['사과','아이스크림','커피']
#        for z in ['육표','초코파이','라면']])
# # 일반적인 표현
# li=[]
# for x in ['쌈밥','치킨','피자']:
#     for y in ['사과','아이스크림','커피']:
#         for z in ['육표','초코파이','라면']:
#             print((x, y))
#             li.append((x, y))
# print(li)
#
# # 0~9까지 수중에서 5부다 작으면서 2로 나누어 떨어지는 수를 리스트에 저장하시오
# # [0,2,4]
# # li=[]
# # for i in range(10):
# #     if i < 5:
# #         if i % 2==0:
# #             li.append(i)
# # print(li)
# print([i for i in range(10) if i < 5 if i % 2 == 0])
#
# # 셋{} 컴프리헨션=======================================================================
# # 중복이 제거됨
# print([i+j for i in range(10) for j in range(10)])  # 리스트
# print({i+j for i in range(10) for j in range(10)}) # 셋
#
# # 딕셔너러{} 컴프리헨션  {키:값, 키:값,...}==================================================
# print({i+j:"값" for i in range(10) for j in range(10)})
# print(type({i + j: "값" for i in range(10) for j in range(10)}))
#
#
# scores={'철수':50, '영희':70, '순신':100}
# print({name:score for name, score in scores.items() if name != '순신'})
#
# # value에 변화를 주면서 저장하고 싶을때
# print({name:str(bool(score >=60)).replace("True","pass").replace("False","fail") for name, score in scores.items()})
# print({name:"pass" if score>=60 else "fail"for name, score in scores.items()})
# # {'철수': 'fail', '영희': 'pass', '순신': 'pass'}
#==========================================================================================
# words=['Computer','Coke','Bread']
# print([i.lower() for i in words])
#
# a=[1,-5,4,2,-2,10]
# print([i if i>0 else 0 for i in a])
#
# a=[1,2,3,4,5]
# for i in a:
#     if i ==1:
#         print("pass")
#     elif i ==2:
#         print("fail")
#     else: print("no")
#
# # 조건이 3개 이상일 때는 일반 for문으로 작성하는 것이 더 효율적
# # 내포문에서는 elif를 쓰지 못하고 (else "입력어" if 조건)의 구조로 이뤄짐
# print(["pass" if i==1 else "fail" if i==2 else "no" for i in a])

# # 딕셔너리 응용===========================================================================
# x={'a':10,'b':20,'c':30}
# print(x)
# x['aa']=40
# print(x)
# x.setdefault('d') #키 d가 추가, 값이 None 저장
# print(x)
#
# # 기존에 키가 존재하면 변경, 없으면 추가
# x['a']=100
# print(x)
# x.update(a=10,b=200,c=300)
# print(x)
# x.update({"a" : 100, "b" : 20, "c" : 300})
#
# print(list(zip(['one','two'],[1,2])))
# print(dict(zip(['one','two'],[1,2])))
# x.update(zip(['aa','c'],[999,777]))
# print(x)
#
# x={'a':10,'b':20,'c':30,'d':40}
# print(x)
# print(x.pop('d'))  # 시퀀스 자료형이 아닌경우 .pop('키') 키를 반드시 적어줘야함
# print(x)
# # .pop() 디폴트 값 설정하기
# x={'a':10,'b':20,'c':30,'d':40}
# v=x.pop('b')
# # v=x.pop('z') # 없는 키를 설정하는 경우 error 발생
# v=x.pop('z',0) # 키가 없을 경우 0을 return
# print(v)
# # if x.pop('z',0) ==0: 로 키의 유무를 확인할 수 있음
# # else:
#
# x={'a':10,'b':20,'c':30,'d':40}
# del x['b']
# print(x)
#
# x.clear()
# print(x)
#
# # 리스트,튜플 -> 딕셔너리 생성============================================================
# li=['a','b','c']
# d=dict.fromkeys(li)
# print(d)
#
# d2=dict.fromkeys(li, 10)
# print(d2)
#
# # # 없는 키 값에 디폴트값을 설정하여 출력하기==================================================
# from collections import defaultdict #collections 모듈에서 defaultdict함수를 가져옴
# # print(d2['z']) 키가 없으므로 에러
# d2=defaultdict(int)
# print(d2['z'])
# print(d2)
# # ========================================================================================
#
# d3={'a':10,'b':20}
# for k,v in d3.items():
#     print(k,v)
# keys=['a','b','c','d']
# for key, value in dict.fromkeys(keys).items():   #dict.fromkeys(keys)는 이미 딕셔너리
#     print(key, value)
#
#
# # 딕셔너리 컴프리헨션=====================================================================
# d4={key:value for key, value in dict.fromkeys(keys).items()}
# print(d4)
# d4={key:None for key in dict.fromkeys(keys).keys()}
# print(d4)
#
# x = {'a': 10, 'b': 20, 'c': 30, 'd': 40}
# # newx는 x에 저장된 데이터에서 'b'를 뺀 나머지를 저장
# newx={key:value for key, value in x.items() if key!="b"}
# print(newx)
# newx={key:value for key, value in x.items() if value!=x["b"]}
# print(newx)
# newx={key:value for key, value in x.items() if value!=20}
# print(newx)
# #==========================================================================================

# # 제이슨?
# # 딕셔너리 속의 딕셔너리가 있는 파일형식
# # 딕셔너리={"키1":{'키1-1':값a,'키1-2':값b}, "키2":{'키2-1':값c, '키2-2':값d},......}
# 영화평점={"BTS":{'머큐리':4.5,'매트릭스':4.0}, "소녀시대":{'머큐리':3.5, '매트릭스':3.0}}
# print(영화평점['BTS']["머큐리"])
# 영화평점['BTS']["매트릭스"]=5
# print(영화평점['BTS']["매트릭스"])
# print("="*70)
#
# x={'a':0,'b':1}
# y=x #실제로는 딕셔너리가 1개 만들어짐
# print(x is y) #변수 이름만 다를뿐 x,y는 같은 객체
# x['a']=100
# print(y)      #x의 변경사항이 y도 반영됨
# print("="*70)
#
# y=x.copy() #완전히 다른 2개의 딕셔너리가 만들어짐
# x['a']=1111 #{'a': 1111, 'b': 1}
# print(x)    #{'a': 100, 'b': 1} y는 변동x
# print(y)
# print(x is y)
# print(x==y)
# print("="*70)
#
# x={'a':0,'b':1}
# y={'a':0,'b':1}
# print(x is y)
# print(x==y)
# print("="*70)
#
# # 중첩 딕셔너리 구조에서의 .copy()==================================================
# x={'a':{'python':'3.8'},'b':{'python':'2.7'}}
# y=x.copy()
# print(y)
# # 위와는 다르게 y의 변동사항이 x에도 적용됨
# y['a']['python']=2.7777
# print(y) #{'a': {'python': 2.7777}, 'b': {'python': '2.7'}}
# print(x) #{'a': {'python': 2.7777}, 'b': {'python': '2.7'}}
# print("="*70)

# # copy.deepcopy(dict)
# # 따라서 중첩 딕셔너리에서는 copy 메서드 대신 copy모듈의 deepcopy함수를 사용해야함
# x={'a':{'python':'3.8'},'b':{'python':'2.7'}}
# import copy
# y=copy.deepcopy(x)
# y['a']['python']=2.7777
# print(y) #{'a': {'python': 2.7777}, 'b': {'python': '2.7'}}
# print(x) #{'a': {'python': '3.8'}, 'b': {'python': '2.7'}}
# #================================================================================
