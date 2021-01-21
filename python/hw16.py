# 1.
# 3개의 각으로 삼각형의 예각, 직각, 둔각을 구별하는 프로그램을 만들어라.
#
# [60, 60, 60] = 예각삼각형
# [30, 60, 90] = 직각삼각형
# [20, 40, 120] = 둔각삼각형
# [0, 90, 90] = 삼각형이 아니다
# [60, 70, 80] = 삼각형이 아니다
# [40, 40, 50, 50] = 삼각형이 아니다
#
# 예각삼각형 : 3개의 각이 모두 예각인 삼각형
# 직각삼각형 : 1개의 각이 직각인 삼각형
# 둔각삼각형 : 1개의 각이 둔각인 삼각형
# ① 각이 3개가 아닐 경우 삼각형이 아니다.
# ② 3개의 각의 합이 180°가 아닐 경우 삼각형이 아니다.

angle= [40, 40, 50, 50]

if len(angle) != 3 or sum(angle) != 180 or 0 in angle:
    print("삼각형이 아니다.")
elif angle[0] + angle[1] < 90:
    print("둔각삼각형")
elif angle[0] + angle[1] == 90:
    print("직각삼각형")
elif angle[0] + angle[1] < 90:
    print("예각삼각형")


# 2.
# 아래는 괄호를 이용한 연산식이다.
# (5+6)∗(7+8)/(4+3)
# 우리는 여는 괄호가 있으면 닫는 괄호가 반드시 있어야 한다는 것을 잘 알고 있다.
# 다음은 정상적인 괄호 사용의 예이다.
# (()()()())
# (((())))
# (()((())()))
# 다음은 비정상적인 괄호 사용의 예이다.
# ((((((())
# ()))
# (()()(()
# (()))(
# ())(()
# 괄호의 사용이 잘 되었는지 잘못 되었는지 판별 해 주는 프로그램을 작성하시오.
a="(()()(()"
def solve(a):
    res = "correct"
    times= a.count("(")-1
    compare = a + " "
    while compare != a:
        compare=a
        a=a.replace("()","")
    if len(a) != 0:res="wrong"
    return res

print(solve(a))

print(list(map(solve,["(()()()())","(((())))","(()((())()))"])))
print(list(map(solve,["((((((())","()))","(()()(()","(()))(","())(()"])))