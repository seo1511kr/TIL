#1 연결지점 파악해서 graph 만들기
# 백준 1890을 예시로 코딩해보기
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