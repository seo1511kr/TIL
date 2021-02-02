# # 1번 수정.
# num = [9, 552, 30, 55, 4,5532,3,57,55,30]
# def maxcom(x):
#     num_list = []
#     for i in x:  #[9, 552, 30, 55, 4,5532,3,57,55,30]
#         num = str(i)
#         num_list.append(num)
#     len_li= list(map(len,num_list))
#     print(len_li) # [1, 3, 2, 2, 1, 4, 1, 2, 2, 2]
#     addlen=list(map(lambda x:max(len_li)-x,len_li))
#     print(addlen)
#     info_num=list(zip(num_list, addlen))
# # [('9', 3), ('552', 1), ('30', 2), ('55', 2), ('4', 3), ('5532', 0), ('3', 3), ('57', 2), ('55', 2), ('30', 2)]
#     final=[]
#     for num,q in info_num:
#         num = num+num[0]*q+str(q)
#         final.append(num)
#     print(final)
# # 제일 길이가 긴 수에 맞춰 첫째자리를 뒤에 이어붙여서 길이를 맞춰줌
# # "9"=> "9" + "9" *3   + 3 => "99993"
# # "552" => "552" + "5"*1 + 1 =>"55251"
# # ['99993', '55251', '30332', '55552', '44443', '55320', '33333', '57552', '55552', '30332']
#     print("="*60)
#     final.sort()
#     final.reverse()
# # ['99993', '57552', '55552', '55552', '55320', '55251', '44443', '33333', '30332', '30332']
# # 내림차순 정렬
#     final=list(map(lambda x: x[:-int(x[-1]) - 1], final))
# # 바뀐수 원상복귀
# # "99993" => "99993"[:-3-1] =>  "9"
# # "57552" => "57552"[:-2-1] =>  "57"
#     print(final)
# # ['9', '57', '55', '55', '5532', '552', '4', '3', '30', '30']
#     print("="*60)
#     solve="".join(final)
#     print(solve)
# # 95755555532552433030
# maxcom(num)
#
#
# # # 1. a = [1, 3, 5, 7, 9, 0, 2, 4, 6, 8]
# a = [1, 3, 5, 7, 9, 0, 2, 4, 6, 8]
# # # 앞쪽 절반을 출력해 보세요.
# len_a=len(a)
# half=int(len_a/2)
# print(half)
# print(a[:-half])
# # # 뒤쪽 절반을 출력해 보세요.
# print(a[half:])
# # # 거꾸로 출력해 보세요.
# reverse_a=a[::-1]
# print(reverse_a)
# # # 거꾸로 짝수 번째만 출력해 보세요.
# print(reverse_a[1::2])
# # # 거꾸로 홀수 번째만 출력해 보세요.
# print(reverse_a[::2])
#
#
#
# # 2.
# # 피보나치 수열 구하기
# # 13
# # 피보나치 수열이란, 첫 번째 항의 값이 0이고 두 번째 항의 값이 1일 때, 이후의 항들은 이전의 두 항을 더한 값으로 이루어지는 수열을 말한다.
# # 예) 0, 1, 1, 2, 3, 5, 8, 13
# # 인풋을 정수 n으로 받았을때, n 이하까지의 피보나치 수열을 출력하는 프로그램을 작성하세요
# fibo=[0,1]
# max=int(input("input num: "))
# while fibo[-1] < max:
#     fibo.append(fibo[-1]+fibo[-2])
# print(fibo[:-1])
#
#
#
# #
# # 3.
# # 문자열 압축하기
# # 19
# # 문자열을 입력받아서, 같은 문자가 연속적으로 반복되는 경우에 그 반복 횟수를 표시하여 문자열을 압축하기.
# a="aaabbcccccca"
# import re
# def zip_string(a):
#     i=0
#     total_count=0
#     final=""
#     while total_count != len(a):
#         add=0
#         if a[i] in final:
#             add=final.count(a[i])
#         count=0
#         group=re.findall(a[i]+"+",a)[0+add]
#         count=len(group)
#         total_count+=count
#         i+=count
#         comp=group[0]+str(count)
#         final+=comp
#     return final
# print(zip_string(a))
# # 출력 예시: a3b2c6a1
#
#
#
#
#
# # 4.
# # 10~1000까지 각 숫자 분해하여 곱하기의 전체 합 구하기
# # 예로, 10~15까지의 각 숫자 분해하여 곱하기의 전체 합은 다음과 같다.
# #
# # 10 = 1 * 0 = 0
# # 11 = 1 * 1 = 1
# # 12 = 1 * 2 = 2
# # 13 = 1 * 3 = 3
# # 14 = 1 * 4 = 4
# # 15 = 1 * 5 = 5
#
# sum_ten=sum(range(1,10)) #10-19까지
# sum_hundred=sum_ten**2 #10-99까지
# print(sum_hundred)
# sum_thousand=sum_hundred*sum_ten # 100-999까지
#
# solve=sum_hundred+sum_thousand
# print(solve)
#
#
#
# # 그러므로, 이 경우의 답은 0+1+2+3+4+5 = 15
# #
# #
# # 5.
# # 애니팡
# # 타일판은 5 × 5
# # 타일 종류는 1 ~ 4의 네 가지
# # 가로나 세로로 3개 이상 같은 타일이 연속될 경우 펑! 사라지고, 그 자리에는 위쪽의 타일들이 내려와서 메꿉니다.
# # 내려오면서 비게 된 자리는 0으로 채워집니다.
# # 위의 규칙대로 동작하는 프로그램을 작성해주세요.
# #
# # 입력 형식
# # 아래 예와 같은 5 × 5 숫자 배열을 리스트에 저장한 뒤 문제 해결하세요
#
#
#
#
# a='''
# 2 4 1 2 1
# 3 4 2 3 3
# 2 4 1 2 2
# 4 4 4 1 2
# 4 2 3 3 2
# '''
#
#
#
# #
# # 출력형식
# # 같은 타일들을 모두 처리한 후의 최종 5 × 5 숫자 배열
# #
#
#
# import re
# print(a)
# a=a.replace("\n"," ").replace(" ","")
# b=[]
# for i in range(5):
#     b.append(a[i*5:(i+1)*5])
# c=b[::-1]
# c_col=[]
# for a in range(5):
#     c_col.append("".join([c[i][a] for i in range(len(c))]))
# q=1
# while q>0:
#     for i in range(len(c)):
#         for j in range(3):
#             if c_col[i][j] != "0":
#                 if re.findall(c_col[i][j] + "{3,5}", c_col[i]):
#                     index_col=re.search(c_col[i][j]+"{3,5}",c_col[i]).span()
#                     pang_num=c_col[i][index_col[0]:index_col[1]]
#                     c_col[i]=c_col[i].replace(pang_num,"팡"*len(pang_num))
#                     break
#         for k in range(3):
#             if c[i][k] != "0":
#                 if re.findall(c[i][k]+"{3,5}",c[i]):
#                     index=re.search(c[i][k]+"{3,5}",c[i]).span()
#                     pang_num=c[i][index[0]:index[1]]
#                     c[i]=c[i].replace(pang_num,"팡"*len(pang_num))
#                     for a in range(index[0],index[1]):
#                         c_col[a]=c_col[a].replace(c_col[a],c_col[a][:i]+"팡"+c_col[a][i+1:])
#                     break
#
#     if list(filter(lambda x:"팡" in x,c_col)):pass
#     else: break
#
#     new_col=[]
#     for i in range(len(c_col)):
#         new=c_col[i].replace("팡","")+"0"*c_col[i].count("팡")
#         new_col.append(new)
#     c=[]
#     for j in range(len(new_col)):
#         c_el=""
#         for i in new_col:
#             c_el+=i[j]
#         c.append(c_el)
#     c_col = new_col
# for i in c[::-1]:
#     print(i)
#
# '''
# 0 0 0 0 0
# 2 0 0 0 0
# 3 0 0 0 0
# 2 0 0 2 0
# 4 0 1 3 0
# '''


#### comments
# 연산의 퍼포먼스(메모리) 측면에서
# 함수를 1000번 반복하는 것보다
# for 문을 작성해서 함수안에 넣어 함수를 1번 실행하는 것이 좋다



#### 디버깅 하는법
# break point 설정한 후 run메뉴에서 debug클릭
# F7 누를 때마다 1스텝씩 진행되며 변수의 변화를 보여줌
#
# lis = []
# # for i in range(5):
# #     lis.append(list(map(int, input().split())))
#
# lis = [[2, 4, 1, 2, 1], [3, 4, 2, 3, 3], [2, 4, 1, 2, 2], [4, 4, 4, 1, 2], [4, 2, 3, 3, 2]]
#
#
# #1. 3개이상 만나면 팡되는 코드
#
# pang = 0
# for i in range ( 5 ):
#     for j in range ( 2, 5 ):
#         if lis[i][j] == lis[i][j - 1] == lis[i][j - 2]:   #가로줄 팡
#             lis[i][j - 2] = 0
#             lis[i][j - 1] = 0
#             lis[i][j] = 0
#
#         elif lis[j][i] == lis[j - 1][i] == lis[j - 2][i]:  # 세로줄 팡
#             lis[j][i] = 0
#             lis[j - 1][i] = 0
#             lis[j - 2][i] = 0
#
#
# # 2. 0이 되면 내려가는 코드
#
# res = True
# while res:
#     for i in range ( 4, -1, -1 ):
#         for j in range ( 4, -1, -1 ):
#             if lis[i][j] == 0:   #5번째줄부터 0이 있다면
#                 if i == 0:     #첫번째줄이라면
#                     lis[i][j] == 0   #0
#                 else:           #첫번째줄 아니면
#                     for k in range ( i, 0, -1 ):   #한칸씩 내려오기
#                         lis[k][j] = lis[k - 1][j]
#                     lis[0][j] = 0
#     #더 내려올 것이 없는지 확인
#     for i in range ( 4 ):
#         for j in range ( 5 ):
#             if lis[4][j] == 0 and lis[i - 1][j] != 0:   # 마지막줄이 0인데 그 위가 0이 아닌 숫자라면
#                 res = True   # 과정 다시 반복
#             else:
#                 res = False   #그렇지 않다면 while문 빠져나오기
