# # 1. 1차원 점들이 주어졌을 때, 그 중 가장 거리가 짧은 것의 쌍을 출력하는 함수를 작성하시오(Daum입사)
# # ex) S={1,3,4,8,13,17,20} => [(3,4)]
#
# num={1,3,4,8,13,17,20,21} # ==> [(3,4),(20,21)]
# def shortest(num):
#     distance=[]
#     num = list(num)
#     pair=list(zip(num[:-1],num[1:]))
#     for i in range(len(num)-1):
#         distance.append(abs(num[i]-num[i+1]))
#     res = min(distance)
#     newpair=list(zip(num[:-1], num[1:], distance))
#     print([i[:2] for i in newpair if i[2] == res]) # 거리가 최소인 쌍이 여러개 있어도 모두 출력
#
# shortest(num) # [(3,4),(20,21)]
#
#
#
# # 2. 회문(palindrome)?: 순서를 거꾸로 해서 읽어도 제대로 읽을때와 같은 단어 or 문장
# # ex) rotator, sos, "nurses run"(심화: 공백도 고려하여 만들어보기)
# # 임의의 단어(문장)을 입력받아 회문 여부를 출력하는 함수 만들기( True/False)
def selfpalindrome(string):
    splitstring=string.split(" ")
    leng=len(splitstring)
    nospace=""
    for i in range(leng):      ###공백을 없애는데 replace를 활용하면 훨씬 편함
        nospace+=splitstring[i]### str.maketrans(" "," ")는 바꿀 문자열끼리의 길이가 동일해야되어서
    reverse=nospace[-1::-1]    ### 사용이 불가능함
    if reverse == nospace:
        return reverse == nospace
    else:
        return reverse == nospace

print(selfpalindrome("sos"))
print(selfpalindrome("nurses run"))
print(selfpalindrome("hello"))


# .replace() 활용한 버전
def selfpalindrome(string):
    nospace=string.replace(" ","")
    reverse=nospace[::-1]
    if reverse == nospace:
        return reverse == nospace
    else:
        return reverse == nospace

print(selfpalindrome("sos"))
print(selfpalindrome("nurses run"))
print(selfpalindrome("hello"))




