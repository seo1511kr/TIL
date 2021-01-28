#1463
# 정수 X에 사용할 수 있는 연산은 다음과 같이 세 가지 이다.
#
# X가 3으로 나누어 떨어지면, 3으로 나눈다.
# X가 2로 나누어 떨어지면, 2로 나눈다.
# 1을 뺀다.
# 정수 N이 주어졌을 때, 위와 같은 연산 세 개를 적절히 사용해서 1을 만들려고 한다.
# 연산을 사용하는 횟수의 최솟값을 출력하시오.


# N=int(input())
# def oper_cnt(N):
#     if N>=1:
#         df = list(range(3*N))
#         df[1]=0
#         for i in range(1,N):
#             df[i+1]=min(df[i]+1,df[i+1])
#             df[i*2]=min(df[i]+1,df[i*2])
#             df[i*3]=min(df[i]+1,df[i*3])
#         return df[N]
# print(oper_cnt(N))

# if df[N] < N - 1:를 써줘서 연산시간을 축소하려고 하였지만
# 10과 같이 값이 여러번 바뀌는 수는 오류가 남
# 현재 10의 값은 +1로만 가능한 값으로 최악의 경우인데
# 5를 만났을 때 5*2는 10이므로 5의 값인 3에 +1이 되어 4로 변함
# 하지만 10의 최소값은 (2의값을 지닌)9를 만났을때 +1이 되어 3임.

# 다 맞았다고 생각했는데 런타임에러(index) 발생: N은 정수라는 조건이 있으므로
# N이 1보다 작은 경우는 None이 출력되도록 if조건을 걸어줌


#1890번
# N×N 게임판에 수가 적혀져 있다.
# 이 게임의 목표는 가장 왼쪽 위 칸에서 가장 오른쪽 아래 칸으로 규칙에 맞게 점프를 해서 가는 것이다.
#
# 각 칸에 적혀있는 수는 현재 칸에서 갈 수 있는 거리를 의미한다.
# 반드시 오른쪽이나 아래쪽으로만 이동해야 한다. 0은 더 이상 진행을 막는 종착점이며,
# 항상 현재 칸에 적혀있는 수만큼 오른쪽이나 아래로 가야 한다. 한 번 점프를 할 때,
# 방향을 바꾸면 안 된다. 즉, 한 칸에서 오른쪽으로 점프를 하거나, 아래로 점프를 하는 두 경우만 존재한다.
#
# 가장 왼쪽 위 칸에서 가장 오른쪽 아래 칸으로 규칙에 맞게 이동할 수 있는 경로의 개수를 구하는 프로그램을 작성하시오.

# 5
# 1 2 4 9 2
# 8 7 6 2 3
# 8 7 5 7 0
# 2 1 4 8 2
# 8 6 7 5 0


n=int(input())
Board=[]
for i in range(n):
    Board.append(input().replace(" ",""))


def howmanyRoute(N,board):
    if board[0][0]=="0":return 0
    dp=[]
    for i in range(N):
        dp.append([int(i) for i in "".zfill(N)])

    jump_col=int(board[0][0])
    jump_row=int(board[0][0])


    total_starts=[[[0,0]]]
    dp[0][0]=1
    for start_list in total_starts:
        new_starts=[]
        for i in start_list:
            row=i[0]
            col=i[1]
            jump=int(board[row][col])
            if jump > 0:
                if col + jump <= N-1:
                    new_start1=[row,col+jump]
                    dp[new_start1[0]][new_start1[1]] += dp[row][col]
                    if new_start1 not in new_starts:
                        new_starts.append(new_start1)

                if row + jump <= N-1:
                    new_start2=[row+jump,col]
                    dp[new_start2[0]][new_start2[1]] += dp[row][col]
                    if new_start2 not in new_starts:
                        new_starts.append(new_start2)
        if [N-1,N-1] in new_starts:new_starts.remove([N-1,N-1])
        # 다 푼줄 알았을 때 오류 발생 경로에 도착한 애들이 다시 한 번 본인들 만큼의 횟수를 추가해서
        # 결과가 훨씬 크게 나왔음 그래서 이미 도착한 애들은 새로운 시작점 리스트에서 제외하는
        # if 조건문을 추가했음
        if len(new_starts)==0:break
        total_starts.append(new_starts)
    return dp[N-1][N-1]

print(howmanyRoute(n,Board))


## 해결책 try except?





# 1010
# 다리놓기
#무난하게 쉬운줄 알았지만 facotrial로 계산시 계산량이 어마무시
# combination 함수를 따로 만들어줘서 해결했음

# T=int(input())
# test_li=[]
# for i in range(T):
#     test_li.append(input().split(" "))
# def combi(west,east):
#     res=1
#     if west==east:return 1
#     for i in range(east-west,east):
#         res=(i+1)*res
#     return res/facto(west)
#
# def facto(numb):
#     res=1
#     for i in range(numb):
#         res*=(i+1)
#     return res
#
#
# for test in test_li:
#     a=int(test[1])
#     b=int(test[0])
#     res= combi(b,a)
#     print(int(res))