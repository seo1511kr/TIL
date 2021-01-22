# 1. 숫자 및 문자열 분리 (파이썬)
# 문자와 숫자가 섞인 문자열을 입력받은 후, 숫자와 문자를 분리하시오.
# input:
# "c910m6ia 1ho"
#
# output:
# str : cmia ho
# int : 91061


# def seperate():
#     import re
#     text=input("분리대상을 입력하세요.")
#     pat=re.compile("\d+")
#     number="".join(pat.findall(text))
#     pat=re.compile("[a-zA-Z가-힣 ]+")
#     word="".join(pat.findall(text))
#     print("str: ",word)
#     print("int: ",number)
# seperate()

# 2. 가위바위보(파이썬)
# 사용자 입력과 random함수를 사용하여, 사용자와 컴퓨터가 대결하는 가위 바위 보 게임을 만들어보자.
#
# 입력: [문자열] "가위", "바위" 혹은 "보" 출력: [문자열] 결과 반환

# def whowin():
#     import random
#     comp=random.choice(["가위","바위","보"])
#     human=input("[가위, 바위, 보] 중 택1:")
#     def result(human):
#         if human==comp:print("컴퓨터:",comp,"비겼습니다.")
#         else:
#             if human == "가위":
#                 if comp == "보": print("컴퓨터:",comp,". 당신이 이겼습니다.")
#                 else:print("컴퓨터:",comp,". 당신이 졌습니다.")
#             if human == "바위":
#                 if comp == "가위": print("컴퓨터:",comp,". 당신이 이겼습니다.")
#                 else:print("컴퓨터:",comp,". 당신이 졌습니다.")
#             if human == "보":
#                 if comp == "바위": print("컴퓨터:",comp,". 당신이 이겼습니다.")
#                 else:print("컴퓨터:",comp,". 당신이 졌습니다.")
#     return result(human)
# whowin()


# 3.로또(파이썬)
# 렌덤으로 1부터 45 까지의 무작위로 섞인 6개의 숫자와 1개의 보너스 숫자를 당첨 번호로 생성해 저장한 뒤
# 로또를 몇 개 살지 입력받고 입력된 번호의 수에 따라 렌덤으로 뽑힌 번호를 당첨 번호와 비교한다.
# 만약 당첨이 되면 당첨된 번호와 당첨금을 출력해주자
#
# #1회차
# 예시 : 로또를 몇개 구매하시겠습니까? : 5
# 현재 당첨번호는 43,2,35,16,4,6입니다.
#
# 구매하신 추첨번호는 43,2,41,18,19,21 입니다.
# 구매하신 추첨번호는 28,20,1,4,32,5 보너스번호는 8입니다
# 구매하신 추첨번호는 11,4,35,2,43,16 2등입니다
# ...
#
#
# #2회차
# ...
# #10회차
#
# 1 등 : 6개 일치(10억원)
# 2 등 : 5개 일치(2백만원)
# 3 등 : 4개 일치(5만원)
# 4 등 : 3개 일치(5천원)
def lottomachine(n):
    import random
    lotto_num=random.sample(range(1,46),7)
    how_many=int(input("구매하실 로또 개수를 입력하세요."))
    print("{0}회차 당첨번호는".format(n),lotto_num[:6],"입니다. 보너스번호는",lotto_num[6],"입니다")
    num_li=[]
    while len(num_li) < how_many:
        new_num=random.sample(range(1,46),6)
        if new_num not in num_li:
            num_li.append(new_num)
    for i in num_li:
        count=0
        for j in lotto_num:
            if j in i:count+=1
        if count == 6:
            print("구매하신 추첨번호는:",i,"!!경축:1등(10억원)입니다.!!")
        elif count == 5:
            print("구매하신 추첨번호는:",i,"!!경축:2등(2백만원)입니다.!!")
        elif count == 4:
            print("구매하신 추첨번호는:",i,"!!경축:3등(5만원)입니다.!!")
        elif count == 3:
            print("구매하신 추첨번호는:",i,"!!경축:4등(5천원)입니다.!!")
        else:print("구매하신 추첨번호는:",i,"꽝~ 입니다 ㅠㅠ")

def nthlotto(k):
    print(list(map(lottomachine,list(range(1,k+1)))))
nthlotto(10)























