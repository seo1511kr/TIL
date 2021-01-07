# 입,출력 (입.출력 방식은 모두 동일함)
# 1. 표준 출력
# 2. 네트워크 입출력
# 3. 파일
'''
-open() : 파일 열기 -> 파일 입력(read)/출력(write) -> 파일 닫기(close)
램이란, 현재 실행중인 메모리들을 커버할 수 있는 capa
램을 full로 사용할 때, 다른 동작을 입력하면 실행 불가
IOT 환경에서는 모든 사물들이 메모리를 소유하고 있음,
이러한 상황에서 메모리 관리가 제대로 안되면, 본질적인 기능들을
수행하는 것에 오류가 생길 수 있음.
파일들을 실행하고 꼭 닫는 습관을 기르자!
'''

# #파일에 문자열 출력(쓰기)
# #open(파일명.확장자, 모드)
# f=open("hello.txt","w") #파일을 쓰기 용도로 열기
# # 프로그램 상에서는 쓰기 모드로 열려있는 hello.txt파일이 f라는 이름으로 사용됨
# f.write('hello world')
# f.close()
#
# # 파일로부터 문자열 입력(읽기)
# f=open("hello.txt","r")
# s=f.read() # 쓰기와는 다르게 읽은 내용을 저장하는것이 일반적임
# print(s)
# f.close()
#
# # with ~ as 구문은 파일을 사용한 뒤에 자동으로 파일을 닫아줌
# # with open(파일이름,모드) as 파일변수:
# #     코드
# with open('hello.txt',"r") as f:
#      s=f.read()
#      print(s)

# # 파일에 여러 줄 출력
# # w 모드로 열게되면 기존에 작성되어 있던 내용은 사라짐
# with open('hello.txt',"w") as f:
#     for i in range(1,11):
#         f.write('hello world %d ! \n' %i)
# # 인코딩 에러 해결법
# # file - settings - editor - file encodings - project encoding = UTF-8

# 리스트의 내용을 파일에 출력
# write()의 arg는 only str만 가능
# list를 출력하기 위해서는 .writelines() 사용해야함
# lines=['hello\n','nicetomeetyou\n','bye\n']
# with open("hello.txt","w") as f:
#     f.writelines(lines)

# # .read()
# # .read 함수는 1글자씩 읽음
# with open('hello.txt',"r") as f:
#      s=f.read()
#      print(s)
#      print("-"*30)

# # .readline()
# #문장이 여러줄일때 속도가 더 빠름
# with open('hello.txt', "r") as f:
#     line=None
#     while line != "":
#         line = f.readline()  # .readline 함수는 1줄씩 읽음
#         # print(line) #2줄이 바뀜
#         print(line.strip("\n")) #\n을 삭제

# # .readlines()
# with open('hello.txt', "r") as f:
#     line=f.readlines() # 한 줄로 다 읽어짐, list 구조로 읽어짐
#     print(line)
#     for i in line:
#         print(i.strip("\n"))

# 피클(pickle):파이썬 객체를 파일로 저장하고자 하는 경우에 사용되는 모듈
# 피클링 : 객체 -> 파일
# 언피클링 : 파일 -> 객체

# 문자열: 단순 문자열, 구조의 의미가 없음
# hello
# nicetomeetyou
# bye

# 문자열 객체: 구조(template)가 있는 문자열
# 틀 속에서 내용을 변경하여 객체를 생성할 수 있음
# 객체를 단순 문자열로 저장시, 구조의 의미가 사라짐
# kim(이름)
# 서울시 강남구(주소)
# 23(나이)
# 컴퓨터(전공)
#
# lee
# 서울시 강북구
# 33
# 국어

# # 객체를 파일로 저장(피클링)
# import pickle
# 내용물="단팥"
# 색상 ='파랑'
# 너비='20센티'
# 높이='10센티'
# 가족명단={"잉어":30,"꽃게":10, "상어":40}
# with open("myfish.pcl","wb") as f: #객체 저장할때는 wb 모드로 파일 열기
#     pickle.dump(내용물, f)
#     pickle.dump(색상, f)
#     pickle.dump(너비, f)
#     pickle.dump(높이, f)
#     pickle.dump(가족명단, f)
#
#
# with open("myfish.pcl","rb") as f: #객체 읽을때는 rb 모드로 파일 열기
#     내용물=pickle.load(f)
#     색상=pickle.load(f)
#     너비=pickle.load(f)
#     높이=pickle.load(f)
#     가족명단=pickle.load(f)
#     print(내용물)
#     print(색상)
#     print(너비)
#     print(높이)
#     print(가족명단)
#
# # 엑셀 작업 -> 객체 저장(xls, binary) -> 반드시 저장시 확장자로만 열 수 있음

# # "a" 모드로 열면 덮어쓰는 것이 아니라 기존 파일에 이어서 편집
# f=open("hello.txt","a",encoding='utf-8') # 한글 텍스트는 ,encoding='utf-8'필요
# for i in range(3):
#     f.write("%d번째 줄 추가\n" % (i+1))
# f.close()