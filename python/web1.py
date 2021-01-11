# ==========================================================================================
# 정규표현식: 복잡한 문자열 처리(퇴근시간을 대폭 단축)
# 목표: 박경리의 토지 원고 전처리 해보기
# 네이버, 다음 포털에 방문해서 날씨 텍스트 데이터 뽑아오기(스크래핑)
# jumin="""
# park 850b01-1234567
# kim 950202-2345678
# """
# print(jumin)

#quiz:jumin데이터의 뒷부분을 모두*로 변환하여 출력
# print(len(jumin))
# print(jumin.index("-"))
# for line in jumin.split('\n'):
#     word=line.split(' ')
#     print(word)
#     for j in word:
#         j=j.split("-")
#         print(j)

# for line in jumin.split('\n'):
#     for word in line.split(" "):
#         if len(word)==14 and word[:6].isdigit() and word[7:].isdigit():
#             word=word[:6]+"-"+"*"*7
#             print(word)
# d='12s34'
# print(d.isdigit())
# d='1234'
# print(d.isdigit())
#
# # ==========================================================================================
# # 정규 표현식
# import re #regular expression(정규 표현식 모듈)
# p=re.compile("(\d{6})[-]\d{7}") #정규식 작성
# # (): 그룹을 나타냄: 소괄호 2개 ((g1)g2)
# # [기호], {문자개수}
# print(p.sub('\g<1>-*******',jumin))
# # re.complie("문자열 구조")로 문자열을 object화 시킨 후
# # p.sub(대체할 패턴,대체 대상 문자열)
# # 정상적인 주민번호에 대한 일반적인 규칙을 정의 숫자6자리-숫자7
#
# re.match("패턴","문자열") # 문자열이 패턴에 부합되나요?
# # 질문: 맨 앞에만 적용되는가?
# # "hello, world"에 hello 문자열이 있는지 판단
# # 존재할 때(매치됨): <re.Match object; span=(0, 5), match='hello'>
# print(re.match("hello","hello, world"))
# print(re.match("hello","hello, hello"))
#
# # 매치객체로 리턴됨 span(0,5): 대상 문자열 index[0,5]에 위치함
#
# # 존재하지 않을때(매치안됨): None, None은 False
# print(re.match("my","hello, my world")) # 매치는 문자열 왼쪽에서부터 주어진 패턴으로 출발해야함
#
#
# # 활용하기
# if re.match("hello","hello, world"):
#     print("매치가 됐습니다")
# else:
#     print("매치되지 않았습니다")
#
# if re.match("hi","hello, world"):
#     print("매치가 됐습니다")
# else:
#     print("매치되지 않았습니다")
#
#
# print("hello, world".find("hello"))
#
#
# # hello 또는 world가 포함되어 있는지?
# print(re.match("hello|world","hello"))
# print(re.match("hello|world","world"))
# print(re.match("hello|hi","world"))
# # ==========================================================================================
# #정규표현식 메타문자(메타:정보의 정보, 데이터(전화번호부)의 데이터(색인),...)
# # 메타문자의 종류: () {} [] \ | ? + *  $ ^ ...
# '''
# [] 메타문자:
# 대괄호 안에는 어떤 문자도 올 수 있음
# ex) [abcdef] 의미? a,b,...,f중에서 어떤 한개!!!의 문자와 매치
# 'a' 문자는 정규표현식에 매치됨
# '''
# import re
# print(re.match("[abcdef]","a")) #매치 o
# print(re.match("[abcdef]","c")) #매치 o
# print(re.match("[abcdef]","g")) #매치 x
# print(re.match("[abcdef]","abc"))#매치 o 한개의 문자만 판단
#
# print(re.search("my", "hello, my world"))
# # 매치 o: <re.Match object; span=(7, 9), match='my'>
#
# # [from-to]
# # [a-d] 정규식 의미: [abcd], [a-f]==[abcdef]
# # [0-5]==[012345]
# print(re.match("[0-9]","1234")) # 0~9중 앞에서부터 1개의 문자
# # <re.Match object; span=(0, 1), match='1'>
# print(re.match("[0-9]*","1234")) # *은 문자(숫자)가 0개 이상 있는지 확인
# # <re.Match object; span=(0, 4), match='1234'>
# print(re.match("[0-9]*","a1234")) # *은 문자(숫자)가 0개 이상 있는지 확인
# # <re.Match object; span=(0, 0), match=''>
# # 0개 이상이라 매치x라도 None이 아니게 나옴
#
# print(re.match("[0-9]+","a12a34"))# +은 문자(숫자)가 1개 이상 있는지 확인
# print(re.match("[0-9]+","1234"))
# print(re.match("[0-9]+","12a34")) # <re.Match object; span=(0, 2), match='12'>
# # a가 나오는 순간 매치가 깨져버림
# print(re.match("[0-9]+","1234a"))
#
#
# print(re.match("[a-zA-z]+","a1234a"))
# # [a-z],[A-Z],[a-zA-z]
# # [^0-9]: 0-9를 제외한 숫자, not의 의미
#
# # re.search()
# # 특정 문자열이 맨 앞/뒤 오는지 판단
# # 문자열 맨 앞에 ^를 붙이면 맨 앞에 오는지 판단
# # 문자열 맨 끝에 $를 붙이면 맨 끝에 오는지 판단
#
# print(re.search("^hello", "hello, world"))
# print(re.search("world$", "hello, world"))
# print(re.search("^hi","hello, hi"))
# print(re.search("hi","hello, hi bro"))
# print(re.search("hi$","hello, hi bro"))
# print(re.search("hi","hello, hi bro"))
# print(re.search("hi|bro","hello, hi bro"))
#
# print(re.match("[0-9]","012a3bcd")) #match='0'
# print(re.match("[0-9]*","012a3bcd")) #match='012'
#
# print(re.match("[0-9]+","a12a3bcd")) #None
# print(re.match("[0-9]*","a12a3bcd")) #match=''
#
# print(re.match("[a-z]*","aabb12a3"))
#
# print(re.match("ab",'abbcba'))
# print(re.match("ba",'abbcba'))
# print(re.search("ab",'abbcba'))
# print(re.search("ba",'abbcba'))
#
# print(re.match("a*","b"))
# print(re.match("a*","aaaab"))
# print(re.match("b*","b"))
#
# # a가 0개 이상 그 뒤 b
# print(re.match("a*b","b"))
# print(re.match("a*b","bb"))
# print(re.match("a*b","ab"))
# print(re.match("a*b","aaaab"))


# a가 1개 이상 그 뒤 b
import re
print(re.match("a+b","b"))
print(re.match("a+b","bb"))
print(re.match("a+b","ab"))
print(re.match("a+b","aaaab"))

print(re.match("a+b+","aaaabbbb"))
print(re.match("a+b+c","aaaacccc"))
print(re.match("a+b*c","aaaacccc"))
print(re.match("a+b*c*","aaaacccc"))
print(re.match("a+cb*","aaaacbbbbbbb"))

print(re.match("a+b*","aaaaabbbbbbbbc"))
print(re.match("a+b*k","aaaaabbbbbbbbc")) #b뒤에 반드시 k가 나와야함
print(re.match("a+b*k*","aaaaabbbbbbbbc"))
print(re.match("[abc]*","bcaada"))


print(re.match("대한+민국","우리 나라는 대한한한한한한민국"))
print(re.search("대한+민국","우리 나라는 대한한한한한한민국"))


#
# print(re.match("a*","aaaabaaa"))
# print(re.search("a*","aaaabaaa"))



# ==========================================================================================
