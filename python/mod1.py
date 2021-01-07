# def madd(a,b):
#     return a+b
# def msub(a,b):
#     return a-b
# if __name__=="__main__": #다른 파일에서 이 모듈의 함수만 불러오고 싶을 때
#                          #mod1에서는 실행이 됨
#     print("__name__ 값:", __name__)
#     print(madd(3,2))  #5
#     print(msub(10,3)) #7
# else:
#     print("__name__ 값:", __name__)
# # mod1.py를 실행시키면 __name__ 이라는 특별한 속성의 값으로 __main__ 이 저장됨.
# # 따라서 if __name__=="__main__": 조건식이 참이 됨
# # 다른 곳에서 mod1을 import하면
# # __name__ 값: mod1이 되기 때문에 실행 x