# # 정규표현식 복습
# # [from-to]
# # [a-d], [a-f], [a-zA-Z], [가-힣], [0-9], [0-9a-zA-Z]
#
# # *(0개 이상 반복), +(1개 이상 반복), {2}(2회 반복),{1,9}(1부터 9까지 반복)
# # .(\n제외하고 아무런 문자나 가능)
#
# # re.search("패턴","대상"), re.match("패턴","대상")
#

#
# # 축약형
# # \d : 숫자([0-9])와 같음
# # \D : not\d 의미, [^0-9]과 같음
# #
# # \s : 공백문자, 탭문자(\t), 엔터문자(\n) 등
# # \S : not 공백문자, 탭문자(\t), 엔터문자(\n) 등
# #
# # \w : 문자 + 숫자를 의미, [a-zA-z0-9_]과 같음
# # \W : not 문자 + 숫자를 의미, [^a-zA-z0-9_]과 같음
# #

# # _? 또는 . : 문자가 1개만 있는지 판단
# # _?={0,1} 앞 문자가 0개 또는 1개있으면 매치
# # .= \w가 1개 있는지 판단
import re
# print(re.match("h?","h"))
# print(re.match("h?",""))     # h가 있어도 없어도 됨
# print(re.match("sh?e","se")) # s뒤에 h가 있어도 없어도 됨
# print(re.match("ab?c","ac")) # a뒤에 b가 있어도 없어도 됨
# print(re.match("ab?c","abbc"))
# print(re.match("ab+c","abbc"))
#
# print(re.match("h.","h"))    # h 뒤에 아무런 문자가 있어야 매치
# print(re.match("h.","he"))   # h 뒤에 아무런 문자가 있어야 매치
# print(re.match("h\w","he"))
# print(re.match("h.","hee"))
# print(re.match("h\w","hee"))
# print(re.match("h\w*","hee"))
# print(re.match("h\w{1,2}","hee"))
# print(re.match("h\w?","h"))
# print(re.match("h.?","h"))

# print(re.match('a.b','aab'))
# print(re.match('a.b','a0b'))
# print(re.match('a.b','ab'))
# print(re.match('a.b','abb'))
# print(re.match('a[.]b','abb')) # 대괄호 안의 기호는 특수문자[마침표]로 인식됨
# print(re.match('a[.]b','a.b'))
#
# # [123]
# print(re.match("[123]","1234567"))
# print(re.match("[123]","3214657"))
# print(re.match("[123]+","3214657"))
# print(re.match("[1-7]+","3214657"))
# print(re.match("\d","3214657"))
# print(re.match("\d?","3214657"))
# print(re.match("\d.","3214657"))
# print(re.match("\d+","3214657"))

# 빅데이터(파일)
# abc.txt #[a-zA-z0-9]+[.]+[a-zA-z]
# abc.exe
# abc.cfg
# 파일명.확장자
# ...
# asdwokro
# dofieoi.we$pod
print(re.match("[a-zA-z0-9]+[.]+[a-zA-z]{3}","dofieoi.wepod"))
print(re.match("[a-zA-z]{3}","dofieoi.wepod"))
print(re.match("[a-zA-z]{3}","do"))

flist=["abc.txt","abc.exe","abc.cfg","asdwokro","dofieoi.wepod"]
for i in flist:
    res=re.match("[a-zA-z0-9]+[.][a-zA-z]",i)
    if res:
        print("정상적인 파일명",i)
    else:
        print("잘못된 파일명")
## 이미 매치된 이후 뒤에 이상한게 있더라도 매치가 되기 때문에 "dofieoi.wepod"역시 정상으로 출력됨


# print(re.match("do+g","dg")) #o가 1번 이상 반복
# print(re.match("do*g","dg")) #o가 0번 이상 반복
# print(re.match("do*g","dog"))#o가 0번 이상 반복
# print(re.match("do*g","doooooooooooooooooog"))#o가 0번 이상 반복
# print(re.match("do+g","dooooooooooooooog")) #o가 1번 이상 반복
# print(re.match("do*g","dooooooooooooooooookg")) #None
# print(re.match("do+g","doooooooooooooookg")) #o가 1번 이상 반복
#
# print(re.match("do{2}}g","dooooooooooooooog")) #o None, 가 2번만 반복
# print(re.match("do{2,5}}g","dooooooooooooooog")) # None, o가 2번이상 5번이하 반복
# print(re.match("do{2,}g","dooooooooooooooog")) #o가 2번이상 반복
#
# print(re.match("d[a-z]{2,5}g","doooooooooooooooog")) # None, o가 2번이상 5번이하 반복
#

# Q 마지막 문자열 처리 어떻게 하나..
phone_list=["010-1234-5678","abc-1234-5678","01c-1234-5678",'010-12345-5678','012345678','01012345678','010-2323-30301']
for i in range(len(phone_list)):
    if re.match("\d{3}[-]\d{4}[-]\d{4}",phone_list[i]):
        print("올바른 전화번호",phone_list[i])
    else:
        print("잘못된 전화번호")

print(re.match("(^01)\d{3}[-]\d{4}[-]\d{4}","010-1212-3434"))


# match, search
# findall: 정규식과 매치되는 모든 문자열을 리스트로 return
# finditer: 정규식과 매치되는 모든 문자열을 반복가능한 객체로 return


# 정석 과정
pat=re.compile("[a-z]+")  #정의한 패턴을 pat에 저장
print(pat.match("python"))#패턴객체(pat)가 가지고 있는 match함수를 이용하여 주어진
                          # 문자열이 패턴에 매치되는지 확인

print(re.match("[a-z]+","7python"))
print(re.search("[a-z]+","7python"))
print(re.search("[a-z]+","7python8java9cpp"))
print(re.search("[a-z]+","7python8java9cpp"))
print(re.findall("[a-z]+","7python8java9cpp"))

pat=re.compile("[a-z]+")
res=pat.findall("7python8java9cpp")
print(res)
pat=re.compile("[0-9]+")
res=pat.findall("7python8java9cpp")
print(res)

res=re.finditer("[a-z]+","7python8java9cpp") # 반복 가능한 객체로 리턴
for i in res:
    print(i)
    print(i.start())
    print(i.end())
    print(i.span())
    print(i.group())

# .: 점(.) 메타문자는 모든 문자 1개와 매치(예외: "\n")
print(re.match("a.b","a0b"))
print(re.match("a.b","a\nb"))
print(re.match("a.b","a\nb",re.DOTALL))

pat=re.compile("a.b",re.DOTALL)
print(pat.match("a\nb"))

# 대소문자 무시
pat=re.compile("[a-z]+",re.I) #ignorecase
print(pat.match("PYTHON"))


# \문자 \ 그 자체로 매치하기
print(re.search("\section",'jwejjroijisdfie dfi er \section sdfki'))
# \s가 \section이 아닌 메타문자로 해석됨
print(re.search("\section",'jwejjroijisdfie dfi er ection sdfki'))
print(re.search("\\\section",'jwejjroijisdfie dfi er \section sdfki'))
print(re.search(r"\\section",'jwejjroijisdfie dfi er \section sdfki'))
# r"\\section => \section

print(re.match("ab[0-9]?","abc"))
print(re.match("ab[0-9]?c","ab9c"))
print(re.match("ab.c","ab9c"))
print(re.match("h{3}","hhhiii"))
print(re.match("h{3}","hihihihelloworld"))

# () :grouping
print(re.match("hi{3}","hihihihelloworld"))
print(re.match("(hi){3}","hihihihelloworld"))
print(re.match("(hi){3,5}","hihihihelloworld"))
print(re.match("[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}","042-1234-5678"))

print(re.match('[ㄱ-ㅎ]+','ㅋㅋㅋㅋㅋㅋㅋ캬캬캬ㅎㅎㅎㅎ'))
print(re.match('[ㄱ-ㅎ가-힣]+','ㅋㅋㅋㅋㅋㅋㅋ캬캬캬ㅎㅎㅎㅎ'))
print(re.match('[ㄱ-ㅎ가-힣]+','ㅋㅋㅋasdㅋㅋㅋㅋ캬캬캬ㅎㅎ$%#ㅎㅎ'))
print(re.search('[^ㄱ-ㅎ가-힣]+','ㅋㅋㅋasdㅋㅋㅋㅋ캬캬캬ㅎㅎ$%#ㅎㅎ'))
print(re.findall('[^ㄱ-ㅎ가-힣]+','ㅋㅋㅋasdㅋㅋㅋㅋ캬캬캬ㅎㅎ$%#ㅎㅎ'))
print(re.findall('[ㄱ-ㅎ가-힣]+','ㅋㅋㅋasdㅋㅋㅋㅋ캬캬캬ㅎㅎ$%#ㅎㅎ'))


news="""
(서울=연합뉴스) 신선미 기자 = 국내 신종 코로나바이러스 감염증(코로나19) '3차 대유행'이 완만한 감소세로 접어든 가운데 이번 주 신규 확진자 발생 추이가 주목된다.

신규 확진자 감소세 지속이냐 재확산이냐의 흐름을 가늠해 볼 수 있기 때문이다.

지난달 말까지만 해도 연일 1천명 안팎으로 발생하던 신규 확진자는 새해 들어 600명대로 줄었다가 11일 400명대 중반까지 더 떨어진 뒤 12일에는 500명대로 소폭 증가한 상태다.

큰 틀의 통계만 보면 확실한 감소 내지 안정국면으로 접어드는 것 아니냐는 관측이 나온다.

하지만 신규 확진자가 400명∼500명대까지 낮아진 데는 주말과 휴일 검사건수 감소 영향도 있어 아직 상황을 낙관하기에는 이르다는 게 감염병 전문가들의 공통된 의견이다.

방역당국 역시 긴장의 끈을 풀기에는 위험 요인이 너무 많다며 국민 개개인의 지속적인 방역 협조를 당부하고 있다.
"""

pat=re.compile("[ㄱ-ㅎ가-힣]+")
res=pat.findall(news)
print(res)
pat=re.compile("[^ㄱ-ㅎ가-힣]+")
res=pat.findall(news)
print(res)

pat=re.compile("[ㄱ-ㅎ가-힣]*[0-9]+")
res=pat.findall(news)
print(res)

pat=re.compile("[0-9]+[ㄱ-ㅎ가-힣]+")
res=pat.findall(news)
print(res)

pat=re.compile("[0-9]+[명|천]+")
res=pat.findall(news)
print(res)

print(re.match("[^A-Z]+",'Hello'))
print(re.match("[^A-Z]+",'heLlo'))
print(re.match("[0-9]+",'heLlo119'))
print(re.search("[0-9]+$",'heLlo119'))
print(re.search("[0-9]+$",'heLlo119o'))

print(re.search('[*]',"3*5"))
print(re.search('\*',"3*5"))
print(re.search('[*]+',"3**5"))
print(re.search('[*]*',"3**5")) # 왼쪽부터 찾는거라 0개 반복이 매치되어 버림
print(re.search('\*+',"3**5"))

print(re.search("\$\([a-z]+\)","$(document)"))
print(re.search("[$()a-z]+","$(document)"))

# data.go.kr 공공데이터 포털

# 그룹핑 ()
s='abcabcabc ok'
print(re.search("abc",s))
print(re.search("(abc)*",s))
print(re.search("(abc)*",s))
print(re.search("\w+\s+\d+[-]\d+[-]\d+","kim 010-1234-1234"))
print(re.search("\w+","kim 010-1234-1234"))

print(re.search("(\w+)\s+\d+[-]\d+[-]\d+","kim 010-1234-1234"))
res=re.search("(\w+)\s+(\d+)[-]\d+[-]\d+","kim 010-1234-1234") # 이름에 그룹 지정
print(res)
print(res.group(0)) #전체
print(res.group(1)) #첫번째 소괄호 :이름
print(res.group(2)) #두번째 소괄호 :지역번호

# 그룹에 이름 부여가능
res=re.search("(?P<name>\w+)\s+(?P<number>\d+[-]\d+[-]\d+)","kim 010-1234-1234")
# 작성형식: (?P<그룹명>)
print(res.group("name")) #첫번째 소괄호 :이름
print(res.group("number")) #두번째 소괄호 :이름
print(re.findall("hello|hi","hello how are you bye hi hi"))


# res=re.search("\w+\s+\d+[-]\d+[-]\d+","kim 010-1234-1234")
# print(type(res.group()))
# print(res.group())
# print(res.group().split()[0])