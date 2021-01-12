# # 1. 문자열 바꾸기
# # 다음과 같은 문자열이 있다.
# # a:b:c:d
# # 문자열의 split와 join 함수를 사용하여 위 문자열을 다음과 같이 고치시오.
# # a#b#c#d
# s="a:b:c:d"
# s=s.split(":")
# print("#".join(s))
# print(",".join("1234"))
# print(" ".join("12345"))
# print(",".join(["1","2","3"]))
# print("12345".replace(""," "))
# print("1 2 3 4 5".split(" "))

# 2. 리스트 총합 구하기
# 다음은 A학급 학생의 점수를 나타내는 리스트이다. 다음 리스트에서 60점 이상 점수의 평균을 구하시오.

A = [20, 55, 67, 82, 45, 33, 90, 87, 100, 25]
newA=list(filter(lambda x:x>=60,A))
print(sum(newA)/len(newA))
# 3. 평균값 구하기
# 다음과 같이 총 10줄로 이루어진 sample.txt 파일이 있다. sample.txt 파일의 숫자 값을 모두 읽어 총합과 평균 값을 구한 후 평균 값을 result.txt 파일에 쓰는 프로그램을 작성하시오.
f=open("sample.txt","w")
f.write("""
70
60
55
75
95
90
80
80
85
100
""")
f.close()


with open("sample.txt","r") as r:
    line=r.read()
    num=len(line.split("\n"))-2
    print(line.replace("\n","+").strip("+"))
    sum=eval(line.replace("\n","+").strip("+"))
    mean=sum/num
    print(sum,mean)
with open("result.txt","w") as w:
    w.writelines("sum: {0}\nmean: {1}".format(sum,mean))

#
# # 4. 모스 부호 해독
# # 문자열 형식으로 입력받은 모스 부호(dot:. dash:-)를 해독하여 영어 문장으로 출력하는 프로그램을 작성하시오.
# #
# # 글자와 글자 사이는 공백 1개, 단어와 단어 사이는 공백 2개로 구분한다.
# # 예를 들어 다음 모스 부호는 "HE SLEEPS EARLY"로 해석해야 한다.
# # .... .  ... .-.. . . .--. ...  . .- .-. .-.. -.--
# # 모스부호 규칙 표
# s=".... .  ... .-.. . . .--. ...  . .- .-. .-.. -.--"
# l=s.split("  ")
# k=[]
# for i in range(len(l)):
#     k.append(l[i].split((" ")))
# decode= {'.-':'A','-...':'B','-.-.':'C','-..':'D','.':'E','..-.':'F',
#         '--.':'G','....':'H','..':'I','.---':'J','-.-':'K','.-..':'L',
#         '--':'M','-.':'N','---':'O','.--.':'P','--.-':'Q','.-.':'R',
#         '...':'S','-':'T','..-':'U','...-':'V','.--':'W','-..-':'X',
#         '-.--':'Y','--..':'Z'}
# print(decode.keys())
# print("해독 결과:",end='')
# for i in k:
#     for j in range(len(i)):
#         index=list(decode.keys()).index(i[j])
#         trans=list(decode.values())[index]
#         lower=trans.lower()
#         print(lower,end="")
#     print("",end=" ")
# print("")
#
#
#
#
# def decoding(k):
#     global decode
#     for i in range(len(decode.keys())):
#         list(decode.keys()).index(k)


# [i for i in k if ]

#
# # 5. ngram 기반 두 문장 유사도 구하기(n=2, 3)
# # ex) n=2
# # [오늘,늘 , 멀,멀티,티캠,......,부했,했다]=20개
# # [멀티,티캠,캠퍼,.............,쉬웠,웠다]=25개
# # 단 중복의 경우는 무시해줘야함
# # 유사도=두 리스트 사이의 겹치는 요소 개수/총 개수
#
# a="오늘 멀티캠퍼스에서 너무 쉬운 프로그래밍을 공부했다."
# "멀티캠퍼스에서 공부했던 오늘의 프로그래밍은 너무 쉬웠다."
#
# def simil(string,n):
#     global a
#     a=a.strip(".")
#     sa=set()
#     sstring=set()
#     for i in range(len(a)-1):
#         sa.add(a[i:i+n])
#     print(sa)
#     string=string.strip(".")
#     for i in range(len(string)-1):
#         sstring.add(string[i:i+n])
#     print(sstring)
#     print("공통:",[i for i in sa if i in sstring])
#     print("유사도:",len([i for i in sa if i in sstring])/len(sstring))
    # print(sstring.intersection(sa))
    # print(len(sstring.intersection(sa))/len(sstring))
# simil("멀티캠퍼스에서 공부했던 오늘의 프로그래밍은 너무 쉬웠다.",2)
#

# 클래스로 만들어보기==> 재사용성이 필요할 때만 만들면 됨========================================

class Ngram:
    def __init__(self):
        self.res=0
    def ngram(self, n):
        global a
        a = a.strip(".")
        sa = set()
        sstring = set()
        for i in range(len(a) - 1):
            sa.add(a[i:i + n])
        print(sa)
        string = string.strip(".")
        for i in range(len(string) - 1):
            sstring.add(string[i:i + n])
        print(sstring)
        print("공통:", [i for i in sa if i in sstring])
        self.res=len([i for i in sa if i in sstring]) / len(sstring)
        return self.res

        # print(sstring.intersection(sa))
        # print(len(sstring.intersection(sa))/len(sstring))

# # 강사님 풀이 4번=========================================================================
# dic = {
#     '.-':'A','-...':'B','-.-.':'C','-..':'D','.':'E','..-.':'F',
#     '--.':'G','....':'H','..':'I','.---':'J','-.-':'K','.-..':'L',
#     '--':'M','-.':'N','---':'O','.--.':'P','--.-':'Q','.-.':'R',
#     '...':'S','-':'T','..-':'U','...-':'V','.--':'W','-..-':'X',
#     '-.--':'Y','--..':'Z'
# }
#
# def morse(src):
#     res=[]
#     for word in src.split("  "): #입력된 문자에 저장된 단어 3개
#         for c in word.split(" "):
#             res.append(dic[c].lower())
#         res.append(" ")
#     return "".join(res)
#
# print(morse('.... .  ... .-.. . . .--. ...  . .- .-. .-.. -.--'))

# 5번 함수 속에 또 함수를 적용시키기==========================================================
# 관리가 용이하도록 기능별로 함수 단위를 구분하여 작성하면 편리함
# def 입력()
#     return 저장변수
# def 처리(저장변수)
#     return 결과
# def 출력(결과)
#     화면 출력

a="오늘 멀티캠퍼스에서 너무 쉬운 프로그래밍을 공부했다"
b="멀티캠퍼스에서 공부했던 오늘의 프로그래밍은 너무 쉬웠다"
n=3
def ngram(s,num): #ngram 기능만 따로 분리
    slen=len(s)-num+1
    res=[]
    for i in range(slen):
        ss=s[i:i+num]
        res.append(ss)
    return res
def diff_ngram(sa,sb,num): #위 ngram의 res변수를 diff_ngram에서도 사용하고 싶을때
    a=ngram(sa,num)        # return res를 작성해준 후 그 값을 다시 변수 a에 저장
    b=ngram(sb,num)
    cnt=0 # 일치한 단어의 개수를 저장하기 위한 변수
    r=[]  # 일치한 단어를 저장하기 위한 변수
    for i in a:
        for j in b:
            if i==j:
                cnt+=1
                r.append(i)
    return cnt/len(a), r
r,word= diff_ngram(a,b,n)
print("%d-gram"%n,r,word) #유사도, bigram으로  묶인 단어셋


# 중복 x, 길이가 긴 문장이 분모로가는 조건 추가
# ======================================================================================
def ngram(s,num): #ngram 기능만 따로 분리
    slen=len(s)-num+1
    res=set()
    for i in range(slen):
        ss=s[i:i+num]
        res.add(ss)
    return res
def diff_ngram(sa,sb,num): #위 ngram의 res변수를 diff_ngram에서도 사용하고 싶을때
    a=ngram(sa,num)        # return res를 작성해준 후 그 값을 다시 변수 a에 저장
    b=ngram(sb,num)
    if len(a)>=len(b):lengram=len(a)
    else: lengram=len(b)
    cnt=0 # 일치한 단어의 개수를 저장하기 위한 변수
    r=[]  # 일치한 단어를 저장하기 위한 변수
    for i in a:
        for j in b:
            if i==j:
                cnt+=1
                r.append(i)
    return cnt/lengram, r
n=2
r,word= diff_ngram(a,b,n)
print("%d-gram"%n,r,word) #유사도, bigram으로  묶인 단어셋
