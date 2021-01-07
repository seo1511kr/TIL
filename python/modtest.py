# # 모듈에서 함수만 가져오고 싶을 때

# # 해당 모듈로 가서 무시할 동작 위에 다음과 같이 작성
# # if __name__=="__main__": #다른 파일에서 이 모듈의 함수만 불러오고 싶을 때
# #     print(madd(3,2))  #5
# #     print(msub(10,3)) #7


import mod1 # 5,7이 print 되어버림
# print(mod1.madd(3,5))
# __name__ 값: mod1이 되기 때문에 실행 x

