
# 백준1890번
# N×N 게임판에 수가 적혀져 있다.
# 이 게임의 목표는 가장 왼쪽 위 칸에서 가장 오른쪽 아래 칸으로 규칙에 맞게 점프를 해서 가는 것이다.
#
# 각 칸에 적혀있는 수는 현재 칸에서 갈 수 있는 거리를 의미한다.
# 반드시 오른쪽이나 아래쪽으로만 이동해야 한다. 0은 더 이상 진행을 막는 종착점이며,
# 항상 현재 칸에 적혀있는 수만큼 오른쪽이나 아래로 가야 한다. 한 번 점프를 할 때,
# 방향을 바꾸면 안 된다. 즉, 한 칸에서 오른쪽으로 점프를 하거나, 아래로 점프를 하는 두 경우만 존재한다.
#
# 가장 왼쪽 위 칸에서 가장 오른쪽 아래 칸으로 규칙에 맞게 이동할 수 있는 경로의 개수를 구하는 프로그램을 작성하시오.


'''
4
2 3 3 1
1 2 1 3
1 2 3 1
3 1 1 0
'''

import sys
N=int(input())
board=[sys.stdin.readline().strip().split() for i in range(N)]

dp=[[-1]*N for i in range(N)]
def dfs(x,y):
    global dp
    global N
    global board

    if (x==N-1) and (y==N-1):
        return 1
    elif dp[x][y] != -1:pass
    elif dp[x][y] != -1:
        dp[x][y]=0
        jump = int(board[x][y])
        if jump+x<=N-1:
            newx,newy= x+jump,y
            dp[x][y]+=dfs(newx,newy)
        if jump+y<=N-1:
            newx,newy= x,y+jump
            dp[x][y]+=dfs(newx,newy)
    return dp[x][y]

print(dfs(0,0))





# 1. 참고풀이
# import sys
# input = sys.stdin.readline
# def dfs1(x, y):
#     if x == n - 1 and y == n - 1:
#         return 1
#     if dp[x][y] == -1:
#         dp[x][y] = 0
#         jump=s[x][y]
#         x1, y1 = x + jump, y
#         x2, y2 = x, y + jump
#         if x1 < n and y1 < n: dp[x][y] += dfs1(x1, y1)
#         if x2 < n and y2 < n: dp[x][y] += dfs1(x2, y2)
#     return dp[x][y]
# n=5
# s=[[2,2,1,2,1],[2,2,1,2,1],[1,2,1,2,1],[2,3,1,2,1],[2,2,1,2,0]]
# dp = [[-1] * n for i in range(n)]
# print(dfs1(0, 0))















# 2. 직접풀이
# # import sys
# # input=sys.stdin.readline
# # n=int(input())
# # board=[list(map(int,input().split())) for i in range(n)]
#
# n=5
# board=[[2,2,1,2,1],[2,2,1,2,1],[1,2,1,2,1],[2,3,1,2,1],[2,2,1,2,0]]
# print(board)
#
# dp=[[-1]*n for i in range(n)]
# print(dp)
# start=[0,0]
# def dfs(start):
#     x = start[0]
#     y = start[1]
#     if x ==n-1 and y==n-1:
#         return 1
#     if dp[x][y] ==-1:
#         dp[x][y]=0
#         print(x)
#         print(y)
#         print("="*50)
#         jump=board[x][y]
#         dx=[0,jump]
#         dy=[jump,0]
#         col_move=[x+dx[1],y+dy[1]]
#         row_move=[x+dx[0],y+dy[0]]
#         if col_move[0] < n and col_move[1] < n:
#             dp[x][y]+=dfs(col_move)
#
#         if row_move[0] < n and row_move[1] < n:
#             dp[x][y]+=dfs(row_move)
#     return dp[x][y]
#
# print(dfs(start))
# print(dp)