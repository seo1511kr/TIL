# 1.0~9의 문자로 된 숫자를 입력받았을 때, 이 입력값이 0~9의 모든 숫자를 각각 한 번씩만 사용한 것인지 확인하는 함수를 작성하시오.
#
# 입력 예시: 0123456789 01234 01234567890 6789012345 012322456789
# 출력 예시: True False False True False
stnum=list(range(10))

def checkTFnumber():
    stnum = list(range(10))
    import re
    s=input("please input number:")
    pat=re.compile("\d+")
    s=pat.findall(s)
    def oncenum(num):
        num=str(num)
        if len(num)==len(range(10)):
            for i in num:
                if int(i) in stnum:
                    stnum.remove(int(i))
                else: break
            if len(stnum) == 0:
                return True
            else:return False
        else:return False
    return list(zip(map(oncenum, s),s))

print(checkTFnumber())


# 2.
emails = ['python@mail.example.com', 'python+kr@example.com',              # 올바른 형식
          'python-dojang@example.co.kr', 'python_10@example.info',         # 올바른 형식
          'python.dojang@e-xample.com',                                    # 올바른 형식
          '@example.com', 'python@example', 'python@example-com']          # 잘못된 형식

import re

p=re.compile('[\w\\-+_.]+[@][a-z\\-]+[.][a-z]+')
print(p.match("python@example-com"))
for i in emails:
    if p.match(i):
        print("올바른 형식",p.findall(i))
    else:
        print("잘못된 형식")
#
#
# # 3.
import re
new="""

연합뉴스TV
[날씨] 추위 대신 미세먼지 말썽…밤까지 중부 중심 눈
기사입력 2021.01.12. 오후 1:40 기사원문 스크랩 본문듣기  설정
화나요 후속기사원해요 좋아요 평가하기9 댓글9
글자 크기 변경하기
 인쇄하기
보내기
동영상 뉴스
[앵커]

오늘은 추위가 풀리는 대신 서쪽 지역의 공기 질이 나쁘겠습니다.

중부지방을 중심으로 눈도 내리겠습니다.

기상캐스터 연결해서 날씨 정보 더 자세히 알아보겠습니다.

김민지 캐스터.

[캐스터]

네, 추위가 한층 풀렸습니다.

어제보다 옷차림을 조금 더 가볍게 하고 나왔는데도 크게 춥지 않습니다.

내륙에 내려졌던 한파특보는 모두 해제가 됐고요.

오늘 한낮에 전국에 영상권으로 올라서겠습니다.

한낮에 서울은 1도, 대전 3도, 대구 5도 등 어제보다 5도 정도 기온이 높겠습니다.

따뜻한 서풍이 불어오면서 추위의 힘이 약해지는 건데요.

이 서풍을 타고 또 미세먼지가 들어오겠습니다.

대기 정체로 먼지가 쌓이면서 오늘은 서쪽 지역을 중심으로 미세먼지 농도 나쁨 수준 보이겠고요.

밤에 중국발 오염물질까지 들어와서 내일은 전국적으로 공기 질 상황이 나쁘겠습니다.

오늘 전국에 구름이 많습니다.

차츰 중부를 중심으로 눈이 내리겠습니다.

수도권과 충남, 전북에 1~3cm, 강원 영서와 충북, 경북과 제주 산지에 최고 5cm의 눈이 내려 쌓이겠습니다.

대부분 오늘 밤이면 그칠 텐데요.

강원 영서 지역은 내일 새벽까지 눈이 이어지겠습니다.

지금은 눈발 정도만 날리고 있습니다.

눈이 쌓이면서 퇴근길 무렵에는 길이 많이 미끄럽겠습니다.

조심히 이동하시기 바랍니다.

날씨 전해 드렸습니다.
"""
# #
# 1)[캐스터]가 캐스팅한 내용만 추출하시오
p=re.compile('\\[캐스터.+',re.DOTALL)
print(p.findall(new))  #p.findall()은 list로 출력됨
print(p.findall(new)[0].replace("\n"," ")) #replace는 string에서 사용가능

# # 2)달린 댓글의 개수를 출력하시오
print(re.findall("댓글.{,10}",new,re.DOTALL))
print("댓글수:",re.findall("댓글.{,10}",new)[0][2])

# # 3)대전의 온도를 출력하시오
print(re.findall("대전.{,10}",new,re.DOTALL))
print("대전의 온도:",re.findall("대전.{,10}",new,re.DOTALL)[0][3])

# # 4)가장 많이 등장한 단어가 무엇인가요?
p=re.compile('[가-힣]+')
res=p.findall(new)
print(p.findall(new))
print(res.count("눈이"))
print(type(res))
l = dict.fromkeys(res,0)
for i in res:
    for j in res:
        if i==j:
            l[i]=l[i]+1
print(i for i in list(l.keys()))
print(l)
print(max(l.values()))
maxnum=max(l.values())
print({i:j for i,j in l.items() if j >= maxnum})

# # 5)가장 많이 등장한 글자는 무엇이며, 총 몇 번 등장했나요?
import re
p=re.compile("\w+")
print(p.findall(new))
l=p.findall(new)
char=dict()
for j in l:
    for i in j:
        if i in char.keys():
            char[i]+=1
        else:char[i]=1
print(char)
maxnum=max(char.values())
print({i:j for i,j in char.items() if j >= maxnum})

