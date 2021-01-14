# 1.다음과 같은 문자열이 있을 때 이를 대문자 BTC_KRW로 변경하세요.
# ticker = "btc_krw"
ticker = "btc_krw"
print(ticker.upper())

# 2.다음과 같은 문자열이 있을 때 이를 소문자 btc_krw로 변경하세요.
# ticker = "BTC_KRW"
ticker = "btc_krw"
print(ticker.lower())
# 3.다음과 같은 문자열이 있을 때 공백을 기준으로 문자열을 나눠보세요.
# a = "hello world"
a = "hello world"
print(a.split(" "))

# 4.다음과 같이 문자열이 있을 때 btc와 krw로 나눠보세요.
# ticker = "btc_krw"
ticker = "btc_krw"
print(ticker.split("_"))

# 5.다음과 같이 날짜를 표현하는 문자열이 있을 때 연도, 월, 일로 나눠보세요.
# date = "2020-12-30"
date = "2020-12-30"
date_s = date.split("-")
print(date_s[0]+"년",date_s[1]+"월",date_s[2]+"일")

# 6.문자열의 오른쪽에 공백이 있을 때 이를 제거해보세요.
# data = "039490     "
data = "039490     "
print(data.rstrip(" "))

# 7.
# 변수에 다음과 같이 문자열과 정수가 바인딩되어 있을 때 % formatting을 사용해서 다음과 같이 출력해보세요.
# name1 = "김민수"
# age1 = 10
# name2 = "이철희"
# age2 = 13
# 이름: 김민수 나이: 10
# 이름: 이철희 나이: 13
name1 = "김민수"
age1 = 10
name2 = "이철희"
age2 = 13

name=(name1,name2)
age =(age1, age2)
print("이름: %s 나이: %d" %(name1,age1))
print("이름: %s 나이: %d" %(name2,age2))
# for i in range(0,len(name)):
#     print("이름: %s 나이: %d" %(name[i],age[i]))

# 8. 문자열의 format( ) 메서드를 사용해서 7번 문제를 다시 풀어보세요.
print("이름: {0} 나이: {1}" .format(name1,age1))
print("이름: {0} 나이: {1}" .format(name2,age2))
# for i in range(0,len(name)):
#     print("이름: {0} 나이: {1}" .format(name[i],age[i]))


# 9. 컴마를 제거한 후 이를 정수 타입으로 변환해보세요.
# price = "5,969,782,550"
price = "5,969,782,550"
print(price.replace(",",""))
print_int = int(price.replace(",",""))
print(type(print_int))

# 10. 다음과 같은 문자열에서 '2020/12'만 출력하세요.
# 분기 = "2020/12(E) (IFRS연결)"
분기 = "2020/12(E) (IFRS연결)"
print(len(분기))
print(분기[:7])
# print(분기[:-12])

# 11. 아래 문자열에서 소문자 'a'를 대문자 'A'로 변경하세요.
# string = 'abcdfe2a354a32a'
string = 'abcdfe2a354a32a'
print(string.replace("a","A"))

# 12.
# 주민등록번호 뒷자리의 맨 첫 번째 숫자는 성별을 나타낸다. 주민등록번호에서 성별을 나타내는 숫자를 출력해 보자.
# pin = "881120-1068234"
pin = "881120-1068234"
pin2=pin.split("-")
num=int(pin2[1][0])

if num == 1:
    print("성별을 나타내는 수: ", pin2[1][0],"남자")
else:
    print("성별을 나타내는 수: ", pin2[1][0],"여자")

# 13.다음과 같은 문자열 a:b:c:d가 있다. a#b#c#d로 바꿔서 출력해 보자.
# a = "a:b:c:d"
a = "a:b:c:d"
t= str.maketrans(":","#")
answer= a.translate(t)
print(answer)

# 14. ['Life', 'is', 'too', 'short'] 리스트를 Life is too short 문자열로 만들어 출력해 보자.
# (join 활용)
l= ['Life', 'is', 'too', 'short']
print(" ".join(l))

