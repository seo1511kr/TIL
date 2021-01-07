# 1. 주어진 자연수가 홀수인지 짝수인지 판별해 주는 함수(is_odd)를 작성해 보자.
def is_odd(num):
    if num%2==0:
        return False
    else:
        return True
print(is_odd(2))
print(is_odd(3))

#2. 다음은 "test.txt"라는 파일에 "Life is too short" 문자열을 저장한 후 다시 그 파일을 읽어서 출력하는 프로그램이다.
# 사용자의 입력을 파일(test.txt)에 저장하는 프로그램을 작성해 보자. (단 프로그램을 다시 실행하더라도 기존에 작성한 내용을 유지하고 새로 입력한 내용을 추가해야 한다.)
def writereadfile(filename):
    f = open(filename, "a")
    f.write(input("입력어를 작성하세요:"))
    f.write("\n")
    f.close()
    with open("test.txt", "r") as f:
        line = None
        while line != "":
            line = f.readline()
            print(line.strip("\n"))
writereadfile("test.txt")


# 3. 다음과 같은 내용을 지닌 파일 test.txt가 있다. 이 파일의 내용 중 "java"라는 문자열을 "python"으로 바꾸어서 저장해 보자.
# Life is too short
# you need java

f=open("test.txt","r")
l=f.read()
l=l.replace("java","python")
f.close()
with open("test.txt","w") as f:
    f.write(l)
with open("test.txt","r") as f:
    line = None
    while line != "":
        line = f.readline()
        print(line.strip("\n"))





# 4. "비트코인" 문자열을 화면에 출력하는 print_coin() 함수를 정의하라.
def print_coin():
    print("비트코인")
# 5. 4에서 정의한 함수를 호출하라.
print_coin()

# 6. 4에서 정의한 print_coin 함수를 100번호출하라.
for i in range(1,101):
    print_coin()
i=1
while i<101:
    i=i+1
    print_coin()

# 7. "비트코인" 문자열을 100번 화면에 출력하는 print_coins() 함수를 정의하라.
def print_coins():
    for i in range(1, 101):
        print_coin()
print_coins()


# 8. 하나의 문자를 입력받아 문자열 끝에 ":D" 스마일 문자열을 이어 붙여 출력하는 print_with_smile 함수를 정의하라.
def print_with_smile(write):
    print("{0}:D".format(write),)
print_with_smile("h")

# 9. 현재 가격을 입력 받아 상한가 (30%)를 출력하는 print_upper_price 함수를 정의하라.
def print_upper_price(num):
    print(num*1.3)
print_upper_price(100)





# 10. 하나의 리스트를 입력받아 짝수만 화면에 출력하는 print_even 함수를 정의하라.
def print_even(*num):
    res=[]
    for i in num:
        if i%2 ==0:
            res.append(i)
    print(res)
print_even(2,3,4,5,6,7,8)
# 11. 하나의 딕셔너리를 입력받아 딕셔너리의 key 값을 화면에 출력하는 print_keys 함수를 정의하라.
def print_keys(dic):
    print(list(dic.keys()))
a=dict(안녕하세요=12345,반갑습니다=2323)
print_keys(a)



#12. 문자열과 한줄에 출력될 글자 수를 입력을 받아 한 줄에 입력된 글자 수만큼 출력하는 print_mxn(string) 함수를 작성하라.

def print_mxn(string,num):
    leng=len(string)
    res1,res2=divmod(leng,num)
    if res2 != 0:
        for i in range(res1):
            print(string[i * num:num * (i + 1)])
        print(string[-res2:])
    else:
        for i in range(res1):
            print(string[i * num:num * (i + 1)])
print_mxn("hellohowareyou",5)


# 13. 연봉을 입력받아 월급을 계산하는 calc_monthly_salary(annual_salary) 함수를 정의하라. 회사는 연봉을 12개월로 나누어 분할 지급하며, 이 때 1원 미만은 버림한다.
# calc_monthly_salary(12000000)
# 1000000
def calc_monthly_salary(annual_salary):
    monthly=annual_salary/12
    print("{0:.0f}".format(monthly))
calc_monthly_salary(12000000)

# 14. 문자열 하나를 입력받아 인터넷 주소를 반환하는 make_url 함수를 정의하라.
# make_url("naver")
# www.naver.com
def make_url(adr):
    print("www."+adr+".com")
make_url("naver")

#
# 15. 문자열을 입력받아 각 문자들로 구성된 리스트로 반환하는 make_list 함수를 정의하라.
# make_list("abcd")
# ['a', 'b', 'c', 'd']
def make_list(string):
    print(list(string))
make_list("abcd")





# 16. 게임 기업 입사문제
# 어떤 자연수 n이 있을 때, d(n)을 n의 각 자릿수 숫자들과 n 자신을 더한 숫자라고 정의하자.
#
# 예를 들어
# d(91) = 9 + 1 + 91 = 101
# 이 때, n을 d(n)의 제네레이터(generator)라고 한다. 위의 예에서 91은 101의 제네레이터이다.
# 어떤 숫자들은 하나 이상의 제네레이터를 가지고 있는데, 101의 제네레이터는 91 뿐 아니라 100도 있다. 그런데 반대로, 제네레이터가 없는 숫자들도 있으며, 이런 숫자를 인도의 수학자 Kaprekar가 셀프 넘버(self-number)라 이름 붙였다. 예를 들어 1,3,5,7,9,20,31 은 셀프 넘버 들이다.
# 1 이상이고 5000 보다 작은 모든 셀프 넘버들의 합을 구하라.
# n<d(n)
list_num=list(range(1,5001))
set_res=set()
for i in list_num:
    str_num=str(i)
    res=i
    for j in range(len(str_num)):#(0,1,2,3)
        res+=int(str_num[j])
    set_res.add(res)  #set_res: 셀프넘버가 아닌 수들
set_num=set(range(1,5001))

sol=set_num-set_res
tuple_sol=tuple(sol)
# print(set_res)
# print(set_num)
print("셀프넘버:",sorted(tuple_sol))
print("정답:",sum(tuple_sol))


# 17. 최대낙차 (삼성 기출)
box=[7,4,2,0,0,6,0,7,0]
num=0
lres=[]
for j in range(len(box)):
    for i in box:
        if box[j] <= i:
            num+=1
    res = len(box)-j-num
    lres.append(res)
print(max(lres))


# 출력 => 최대낙차:7