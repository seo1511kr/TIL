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
# # 3. enumerate(반복 가능한 자료형)
# # 열거형 데이터를 표현하는 함수, for 문과 함께 사용,
# # 리스트, 튜플, 문자열등 (시퀀스 데이터) 입력 => 인덱스를 포함하는 enumerate 객체 생성
# for i in ['aaa','bbb','ccc']:
#     print(i)
# for idx,i in enumerate(['aaa','bbb','ccc']):
#     print(idx,i)
# '''
# 0 aaa
# 1 bbb
# 2 ccc
# '''
#
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
# print(pos(k))
# # 주의: filter에 사용될 함수의 return 값은 bool형을 띄어야 함!
# def pos2(a):
#     return a>0  ## bool형이 return 되도록
# print(filter(pos2,k))       # 필터 객체가 나옴
# print(list(filter(pos2,k)))
#
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
# # 리스트
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
#
# ['쌈밥','치킨','피자']
# ['사과','아이스크림','커피']
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
# # 셋{} 컴프리헨션
# # 중복이 제거됨
# print([i+j for i in range(10) for j in range(10)])  # 리스트
# print({i+j for i in range(10) for j in range(10)}) # 셋
#
# # 딕셔너러{} 컴프리헨션  {키:값, 키:값,...}
print({i+j:"값" for i in range(10) for j in range(10)})
print(type({i + j: "값" for i in range(10) for j in range(10)}))


scores={'철수':50, '영희':70, '순신':100}
print({name:score for name, score in scores.items() if name != '순신'})

# value에 변화를 주면서 저장하고 싶을때
print({name:str(bool(score >=60)).replace("True","pass").replace("False","fail") for name, score in scores.items()})
print({name:"pass" if score>=60 else "fail"for name, score in scores.items()})


