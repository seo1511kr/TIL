# 1. 유클리드 호제법으로 구현(뺄셈, 나눗셈)
# 나눗셈


# num1,num2=list(map(int,input().split()))
# import copy
# def getc_mm(small,big):
#     if small>big:small,big=big,small
#     while big%small!=0:
#         res = big % small
#         big=copy.copy(small)
#         small=res
#     return small
# print(getc_mm(num1,num2))
#
#
#
# num1,num2=list(map(int,input().split()))
# import copy
# def getc_mm(small,big):
#     while big-small!=0:
#         if small > big: small, big = big, small
#         res = big - small
#         big=copy.copy(small)
#         small=res
#     return small
# print(getc_mm(num1,num2))



# 2.
# 정보통신처에서는 2016년 6월 4일 인하 광장에서 이벤트를 진행하려고 한다.
# 정보통신처에서 인하 광장에 올린 게시글에 N번째로 댓글을 단 모든 학생에게 상품을 지급하기로 하였다.
# 단, N은 약수의 개수가 홀수여야 한다. 인하 광장을 즐겨보는 찬미는 이 이벤트에 참가하기로 하였다.
# 찬미는 댓글을 작성한 후 자신이 상품을 받을 확률이 얼마나 되는지 궁금해졌다. 찬미가 댓글을 작성하기 전의
# 총 댓글 수가 a개이고, 댓글을 작성 후의 총 댓글 수가 b개일 때 찬미의 댓글은 a보다 크고 b보다 작거나 같은
# 범위 안에 존재한다고 한다. 예를 들어 a가 1이고, b가 4인 경우 [2, 3, 4] 중 한 곳에 댓글이 존재한다.
# 이 중 약수의 개수가 홀수인 숫자는 4, 한 개이므로 상품을 받을 확률은 1/3이다. 찬미를 도와 찬미가
# 상품을 받을 확률을 구하는 프로그램을 작성하라.

# 입력
# 입력의 첫 줄에는 정수 a와 b가 주어진다. (1 ≤ a, b ≤ 2^60) b는 a보다 항상 크다
# 출력
# 찬미가 상품을 지급받을 확률을 기약분수 형태로 출력한다. 만약 확률이 0인 경우 0을 출력한다.

# 예제 입력
# 1 4
# 예제 출력
# 1/3
# a,b=list(map(int,input().split()))
# total=b-a
# i=int(a**(1/2))+1
# cnt=0
# while i**2 <= b: # 당첨 개수구하기, a+1부터 b까지 특정수의 제곱이 되는 수를 구하기
#     cnt+=1      #약수의 개수가 홀수일려면 특정 수의 제곱인 경우 뿐
#     i+=1
# #기약분수 만들기
# import copy
# def getG(small,big):#유클리드 호제법 나눗셈을 활용해서 최대공약수 찾음
#     if small>big:small,big=big,small
#     while big%small!=0:
#         res = big % small
#         big=copy.copy(small)
#         small=res
#     return small
# G=getG(cnt,total)
# print(str(int(cnt/G))+"/"+str(int(total/G)))


# 3.
# John과 Mary는 "J&M 출판사"를 설립하고 낡은 프린터 2대를 구입하였다.
#
# 그들이 첫번째로 성사시킨 거래는 N개의 페이지로 구성된 문서를 출력하는 일이었다.
#
# 그들이 구입한 두 대의 프린터는 각기 다른 속도록 문서를 출력하고 있다고 한다.
# 하나는 한 페이지를 출력하는 데 X초가 걸리고 다른 하나는 Y초가 소요된다고 한다.
#
# John과 Mary는 두 대의 프린터를 이용하여 전체 문서를 출력하는 데 드는 최소한의 시간이 알고 싶어졌다.
#
# 입력과 출력
#
# 입력데이터의 첫번 째 라인은 테스트케이스의 갯수를 뜻하고 그 갯수만큼의 라인이 추가로 입력된다.
# 추가되는 각 라인은 세 개의 정수값 X Y N 으로 구성된다. X는 첫번째 프린터가 한 페이지를 출력하는 데
# 드는 소요시간, Y는 두번째 프린터가 한 페이지를 출력하는 데 드는 소요시간을 뜻하고 N은 출력할 문서의
# 총 페이지 수를 의미한다. (단, 출력할 문서의 총 페이지 수는 1,000,000,000개를 초과하지 않는다.)
#
# 출력은 프린팅에 드는 최소한의 시간을 테스트케이스의 갯수만큼 공백으로 구분하여 출력하도록 한다.
#
# 입출력의 예는 다음과 같다:
#
# input data:
# 2
# 1 1 5
# 3 5 4
#
# answer:
# 3 9

# 단위시간당 작업량
# 1/3 ,1/5=> 더하면 최소공배수활용 8/15

# print(4*15/8)
# print(7.5/3) =>3개
# print((7.5/5))=>1개
#


# test_n=int(input())
# tests=[list(map(int,input().split())) for num in range(test_n)]
# for test in tests:
#     i,j,N=test[0],test[1],test[2]
#     print(i,j,N)
#     cnt,time=0,0
#     while cnt <N:
#         time+=1
#         if time%i==0:
#             cnt+=1
#         if time%j==0:
#             cnt+=1
#     print(time,end=' ')


test_n=int(input())
tests=[list(map(int,input().split())) for num in range(test_n)]
for test in tests:
    i,j,N=test[0],test[1],test[2]
    k=N*i*j//(i+j)
    print(i,j,N,k)
    while (k//i+k//j)<N:
        k+=1
    print(k,end=' ')

