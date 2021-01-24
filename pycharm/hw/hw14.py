# 1.
# A씨는 두 개의 버전을 비교하는 프로그램을 작성해야 한다.
# 버전은 다음처럼 "." 으로 구분된 문자열이다.
# 버전 예) 1.0.0, 1.0.23, 1.1
# 두 개의 버전을 비교하는 프로그램을 작성하시오.
# 다음은 버전 비교의 예이다.
#
# 0.0.2 > 0.0.1
# 1.0.10 > 1.0.3
# 1.2.0 > 1.1.99
# 1.1 > 1.0.1
#
# def version():
#     a,b = input("비교 대상을 입력해 주세요 ex:1.0.0 1.0.23:").split(" ")
#     a_list=a.split(".")
#     b_list=b.split(".")
#     for i in range(3):
#         if int(a_list[i]) > int(b_list[i]):
#             res=(a,"버전이 최신입니다.")
#             break
#         elif int(a_list[i]) < int(b_list[i]):
#             res=(b,"버전이 최신입니다.")
#             break
#         elif int(a_list[i]) == int(b_list[i]):
#             res=("서로 동일한 버전입니다.")
#             pass
#     print(res)
#
# version()




# 2.요세푸스 문제
#  2,000년 전에는 전쟁에서 병사들이 적들에 의해 동굴에 갇히게 되는 경우가 종종 있었다고 한다.
# 그들은 포로가 되는것을 방지하기 위해 동그랗게 서서 마지막 한 사람이 남을 때 까지 순서대로 돌아가며 세번째에 해당되는 사람을 죽여 나갔다고 한다.
# 마지막으로 남게되는 사람은 자살하기로 약속되어 있었지만 보통 적들에게 항복을 하는 경우가 많았다고 한다.
# 여러분이 풀어야 할 문제는 총 인원수(N)와 간격(K)이 주어졌을 때 가장 마지막에 살아남는 병사의 위치(the safe position)를 알아내는 것이다.
# 예를 들어 병사수가 총 10명이고 돌아가며 세번째에 해당되는 병사를 제거하는 경우는 다음과 같다:
# N = 10, K = 3
# 위의 경우 다음과 같은 순서로 병사들이 제거된다. (괄호는 제거되는 병사를 의미한다)
# 1st round: 1 2 (3) 4 5 (6) 7 8 (9) 10
# 2nd round:                            1 (2) 4 5 (7) 8 10
# 3rd round:                                                (1) 4 5 (8) 10
# 4th round:                                                               4 (5) 10
# 5th round:                                                                        4 (10)
# 위 예에서 끝가지 살아남는 병사는 4, 즉 4번째 병사이다.
# 입력 데이터는 총 병사수 N과 간격 K이다.
# 출력 데이터는 마지막까지 살아남는 병사의 위치이다.
# (단, 최초 시작은 1번 병사부터이다.)
# 입출력 예는 다음과 같다:
# initial data:
# answer:4
#
# def safe_position(x):
#     x_ls = x.split(" ")
#     n, k = int(x_ls[0]), int(x_ls[1])
#     total = list(range(1,n+1))                  #[1,2,3,...,10]
#     ran = 0
#     while len(total)>1:
#         kill = total[(k-1-ran)::k]              #죽일 애들 리스트; ran: 이전에 돌고 남은 숫자 처리
#         a = kill[-1]
#         ran = len(total) - total.index(a) -1    #ex) 1st round: 10 - 8(9의 index) -1 = 1 (마지막 죽은 애 뒤에 한명 남음)
#         for i in kill:
#             total.remove(i)
#     print(total[0])
#
# safe_position('10 3')   #4
# safe_position('10 2')   #5
# safe_position('11 4')   #9
#
# safe_position("9 3")
# safe_position("4 11")
# safe_position("12 5")


# def survive(n,k):

# def survive(n,k):
#     people=list(range(1,n+1))
#     while n != 1:
#         if n >= k:
#             death= people[k-1::k]
#             death_num,left_num = divmod(n,k)
#             for i in range(len(death)):
#                 del people[people.index(death[i])]
#         else:# n이 k보다 작은경우
#             death_num = 1
#             if k % n != 0:
#                 left_num = n - (k % n)
#                 death = people[(k%n)-1]
#             else:
#                 left_num = 0
#                 death = people[-1]
#             del people[people.index(death)]
#         if left_num != 0:
#             link=people[-left_num:]
#             link.extend(people[:-left_num])
#             people=link
#         else:
#             pass
#         n-=death_num
#     return people
#
# print(survive(3,9))




# survive(10,3)

# # 3.
# # 텍스트가 입력으로 주어질 때, 단어의 개수를 세는 프로그램을 작성한다.
# # "문자 세기"와 "단어 세기"는 프로그래밍 입문에 성공했는지를 가늠하는 문제라고 할 수 있습니다.
# #
# # 입력
# # 아래 내용을 가진 텍스트파일을 미리 만들어 두고, 프로그램을 실행하면 파일 내용을 읽어들인다(출처: Wikipedia).
# # As the country became embroiled in a domestic crisis, the first government was dislodged and succeeded by several different administrations. Bolikango served as Deputy Prime Minister in one of the new governments before a partial state of stability was reestablished in 1961. He mediated between warring factions in the Congo and briefly served once again as Deputy Prime Minister in 1962 before returning to the parliamentary opposition. After Joseph-Desire Mobutu took power in 1965, Bolikango became a minister in his government. Mobutu soon dismissed him but appointed him to the political bureau of the Mouvement Populaire de la Revolution. Bolikango left the bureau in 1970. He left Parliament in 1975 and died seven years later. His grandson created the Jean Bolikango Foundation in his memory to promote social progress. The President of the Congo posthumously awarded Bolikango a medal in 2005 for his long career in public service.
# #
# # 출력
# # 구분자(Separator)는 마침표 '.', 쉼표 ',', 공백 ' ' 이다.
# # 가장 많이 나온 순서대로 단어 10개와 그 단어의 빈도를 출력한다.
# # 빈도가 같은 단어들 사이의 순서는 무시한다.
# "As the country became embroiled in a domestic crisis, the first government was dislodged and succeeded by several different administrations. Bolikango served as Deputy Prime Minister in one of the new governments before a partial state of stability was reestablished in 1961. He mediated between warring factions in the Congo and briefly served once again as Deputy Prime Minister in 1962 before returning to the parliamentary opposition. After Joseph-Desire Mobutu took power in 1965, Bolikango became a minister in his government. Mobutu soon dismissed him but appointed him to the political bureau of the Mouvement Populaire de la Revolution. Bolikango left the bureau in 1970. He left Parliament in 1975 and died seven years later. His grandson created the Jean Bolikango Foundation in his memory to promote social progress. The President of the Congo posthumously awarded Bolikango a medal in 2005 for his long career in public service."
# with open("wiki.txt","w") as f:
#     f.write("As the country became embroiled in a domestic crisis, the first government was dislodged and succeeded by several different administrations. Bolikango served as Deputy Prime Minister in one of the new governments before a partial state of stability was reestablished in 1961. He mediated between warring factions in the Congo and briefly served once again as Deputy Prime Minister in 1962 before returning to the parliamentary opposition. After Joseph-Desire Mobutu took power in 1965, Bolikango became a minister in his government. Mobutu soon dismissed him but appointed him to the political bureau of the Mouvement Populaire de la Revolution. Bolikango left the bureau in 1970. He left Parliament in 1975 and died seven years later. His grandson created the Jean Bolikango Foundation in his memory to promote social progress. The President of the Congo posthumously awarded Bolikango a medal in 2005 for his long career in public service.")
#
with open("wiki.txt","r") as p:
    L=p.readline()
    print(L)
import re
pat=re.compile("[^., ]+")
print(pat.findall(L))
words=pat.findall(L)
words=sorted(list(set(words)))
count_list=[]
solve={}
for i in words:
    count=pat.findall(L).count(i)
    solve[i]=count
print(sorted(solve.items(), key=lambda x : x[1],reverse=True)[:10])



#
# in 12
# the 10
# Bolikango 5
# a 4
# of 4
# and 3
# to 3
# his 3
# became 2
# government 2
#



# # 4. 테이블문제 1
# <head>
#     <meta charset="UTF-8">
#     <style>
#         h1{
#         margin-top:200px;
#         }
#         body{
#         text-align:center;
#         background-color: #f55742;
#         }
#         table{
#         margin:auto;
#         margin-top:100px;
#         width:700px;
#         height:300px;
#         border-collapse:collapse;
#         }
#         th{
#         background-color:skyblue;
#         border: 3px solid blue;
#         text-align:center;
#         }
#         td{
#         background-color:pink;
#         border: 2px solid blue;
#         }
#
#     </style>
# # 5. 테이블문제 2
# </head>
# <body>
#     <h1>24회 전국 정보과학창의성대회</h1>
#     <table>
#         <tr><th>부문</th><td>웹프로그래밍</td><td rowspan="3" align="center" style="width:250px;">사진</td></tr>
#         <tr><th>수험번호</th><td>1234</td></tr>
#         <tr><th>성명</th><td>홍길동</td></tr>
#         <tr><th>좌우명</th><td colspan="2" align="center">화이팅</td></tr>
#     </table>
# </body>
#
#
# <head>
#     <meta charset="UTF-8">
#     <style>
#         table{
#         border-collapse: collapse;
#         border: 1px outset gray;
#         width: 500px;
#         height: 100px;
#         margin: auto;
#         }
#         tr,td{
#         border: 1px solid #b3afaf;
#         text-align:center;
#         }
#     </style>
# </head>
# <body>
#     <table>
#         <tr><th colspan="2">제목</th></tr>
#         <tr><td>1행 1열</td><td>1행 2열</td></tr>
#         <tr><td>1행 1열</td><td>1행 2열</td></tr>
#         <tr><td>1행 1열</td><td>1행 2열</td></tr>
#     </table>
# </body>
#
#
#



# 2번 comment
# q 자료구조 이용
# 000000000을 만든 후
# 죽인애들 1로 바꾸고 1은 건너뛰면서 계속 도는 무한루프
# n=10
# k=3
# people=list("0"*n)
# i=0;j=0;die=0
# while die < n-1 :
#     if people[i] =="1":
#         i+=1
#     else:
#         if str((j+1) % k) == "0":
#             people[i] = "1" # 죽임
#             die+=1 # 죽은사람 +1
#         else:pass
#         j+=1   #j는 생존자 중 k번째 사람 찾는 count
#         i+=1   #i는 people 리스트의 인덱스라 죽이건 말건 계속 +1
#     if i==n:i=0 # i가 끝으로 돌아가면 다시 돌아가서 시작
# print(people.index("0")+1)




# def sol(n,k): #강사님 풀이
#     a=list(range(1,n+1))  # a=(1,2,3,4,5,6,7,8,9,10)
#     j=k-1  #j=3-1=2
#     b=0
#     # a(1,2,3,4,5,6,7,8,9,10)
#     while(len(a)>1):
#         b=(len(a)+b) % k  # (10+0)%3 =>나머지=1 b=1
#         del a[j::k]     #  (1,2, ,4,5, ,7,8, ,10) a[2::3]
#         j=k-b-1 #j=3-1-1=1
# print(sol(10,3))

# z=[1,2]
# print(z[::3])

#3번 코멘트
# from collections import Counter
# with open("wiki.txt","r",encoding="utf-8") as f:
#     words=[w.strip(".,") for w in f.read().split()]
# for w,c in Counter(words).most_common(10):
#     print(w,c)


#======================================================================
# del은 list내의 여러 인덱스를 제거가능
# slicing을 할 때 리스트의 길이보다 간격이 더 길어도 알아서 회귀해서 간격별로 추출가능
# sorted(대상,key=lambda x:x[1],reverse=Ture)
# Counter 함수 사용
# from collections import Counter
# Counter(words).most_common(10):