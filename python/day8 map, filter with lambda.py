# 정규표현식 ~ 웹프로그래밍
# 회문: 유전자 염기서열 분석할 때 쓰임
# 'n-gram': 언어패턴  (이름: --순 과 같은 패턴), (논문 표절 여부)


# map(함수, 자료)
#=======================================================================================
# 퀴즈1.
# 2*i를 출력하는 함수
# map, lambda 사용
def twoTimes(n):
    res =list(map(lambda x:x*2,n))
    return res
a=twoTimes([1,2,3])
print(a)

# list 컴프리헨션 사용
s=[1,2,3]
print([i*2 for i in s])
#=======================================================================================


# pow(,n) n제곱함수
print(pow(3,2))
print(3**2)

# round(3.141592,4), 반올림? 인데 6부터 올림... 5부터가 아님 주의
print(round(3.15,1))

# zip([],[]) : object라서 list로 빼내줘야함
print(list(zip([1,2,3,4,5],['a','b','c','d','e'])))


#=======================================================================================
# map & filter
# filter는 map과 비슷하지만 T/F로만 요소를 결정함
t=list(range(1,11))

# ex)범위에서 짝수만 return
# 1. filter 사용하기
def evenfilt(num):
    return num%2==0
print(list(filter(evenfilt,range(1,11))))

# 2. lambda & filter 사용
print(list(filter(lambda x:x%2==0,t)))

# 3. def를 정의해서 하기
def evendef(num):
    return True if num%2==0 else False
res=[]
for i in t:
    if evendef(i):
        res.append(i)
print(res)
# 4. list 컴프리헨션
print([i for i in t if i%2==0])

#=======================================================================================

# # 라이브러리: 유용한 함수들의 집합
# # os 모듈: 디렉토리, 파일의 경로 등 확인/제어
# import os
# print(os.environ)  # 내pc 속성 고급설정에 대한 정보
# print(os.getcwd()) # current working directory: 현재 작업 경로
# # os.mkdir("sample") # 폴더 생성
# # os.rmdir("sample") # 폴더 삭제
# # os.rename("test","hi.txt") # 이름 변경
# os.renames("hello.txt","hi.txt") # 이름 변경
#
# # 파일 복사
# import shutil
# shutil.copy("hi.txt",'hicopy.txt')

# 특정 폴더 내에 있는 폴더 또는 파일 목록 등을 조사
import glob
print(glob.glob("C:/Users/19178/TIL/python/hw*"))
print(glob.glob("C:/Users/19178/TIL/python/day*"))
print(glob.glob("C:/Users/19178/TIL/python/*"))
#=======================================================================================

