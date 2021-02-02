# dfs와 거의 동일하지만 큐자료구조의 원리를 이용해야함
# list의 pop(0)을 활용하면 가능함
n=5
board=[[2,2,1,2,1],[2,2,1,2,1],[1,2,1,2,1],[2,3,1,2,1],[2,2,1,2,0]]

visited=[]
tovisit=[]
def dfs(start):
    tovisit.append(start)

    while tovisit:
        node=tovisit.pop(0)
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