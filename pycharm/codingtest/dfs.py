#1 연결지점 파악해서 graph 만들기
# 백준 1890을 예시로 코딩해보기

# 스택
n=5
board=[[2,2,1,2,1],[2,2,1,2,1],[1,2,1,2,1],[2,3,1,2,1],[2,2,1,2,0]]
visited=[]
tovisit=[]
def dfs(start):
    tovisit.append(start)

    while tovisit:
        node=tovisit.pop()
        x, y = node[0], node[1]
        jump=board[x][y]

        if node not in visited:
            visited.append(node)
            if jump+x<=4:
                tovisit.append([jump+x,y])
            if jump + y <= 4:
                tovisit.append([x,jump +  y])

    return visited
print(dfs([0,0]))




# 재귀로 짜보기

N=7
board=[[1,2,2,1,2,4,3],[1,2,2,1,2,4,3],[1,2,2,1,2,4,3],[1,2,2,1,2,4,3],[1,2,2,1,2,4,3],[1,2,2,1,2,4,1],[1,2,2,1,2,1,0]]
import sys
N=int(input())
board=[sys.stdin.readline().strip().split() for i in range(N)]

dp=[[0]*N for i in range(N)]
visited=[]
def dfs(start):
    node=start
    x,y=node[0], node[1]
    if (x==N-1) and (y==N-1):
        return 1
    jump = int(board[x][y])
    if node not in visited:
        visited.append(node)
        if jump + x <= N-1:
            dp[x][y]+=dfs([jump + x, y])
        if jump + y <= N-1:
            dp[x][y]+=dfs([x, jump + y])
    return dp[x][y]
print(dfs([0,0]))