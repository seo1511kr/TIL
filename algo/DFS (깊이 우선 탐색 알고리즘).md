## DFS (깊이 우선 탐색 알고리즘)

https://www.fun-coding.org/Chapter18-bfs-live.html

여기 참고하고 bfs도 따로 작성하기

#### 개념

```
깊이 우선 그래프 탐색: 정점의 자식들을 먼저 탐색하는 방식
==> 한 경로를 끝까지 탐색후 이전 노드로 돌아가서 다시 끝까지 탐색
```

#### 예제(https://www.fun-coding.org/Chapter18-bfs-live.html)

![image-20210201202318074](DFS (깊이 우선 탐색 알고리즘).assets/image-20210201202318074.png)

#### 특징

```
1. 재귀 호출을 이용하는 순환구조
2. 노드들의 방문 여부를 반드시 확인해야함 -> 무한루프의 위험성
3. 트리순회? 는 모두 DFS의 한 종류이다 
4. stack 자료구조를 활용
```



#### 1. 메모이제이션을 활용

dp 판 위에 목적을 달성한 경로에 표시를 해두고 해당 경로를 다시 사용할 일이 있으면

그 값을 바로 입력받음.

#### 2. 방문한 경로는 반드시 표시할 것!

순환이 발생하여 무한루프를 돌 수 있음.

(A=>B=>C=>A=>B=>C)

#### 3. 이동가능한 이동함수? 좌표를 모두 고려할 것

아래 백준 문제에서는 jump로만 이동할 수 있기 때문에

        jump=board[x][y] 로 이동가능한 case를 만들어 놓음
        dx=[0,jump]
        dy=[jump,0]


#### 백준1890 격자 경로탐색 문제

```
n=5
board=[[2,2,1,2,1],[2,2,1,2,1],[1,2,1,2,1],[2,3,1,2,1],[2,2,1,2,0]]
print(board)

dp=[[-1]*n for i in range(n)]
print(dp)
start=[0,0]
def dfs(start):
    x = start[0]
    y = start[1]
    if x ==n-1 and y==n-1: #재귀호출 탈출
        return 1
    if dp[x][y] ==-1:  #필요없다고 생각해서 뺐는데 반드시 필요한 구문이었음
        dp[x][y]=0		# 방문을 했을 때 0이 되면서 활성화 되는 것		
        print(x)		# 처음에는 비활성 0 활성1로 했는데 그러면 방문만 해도 dp[0][0]의
        print(y)		# 횟수가 +1 되서 오류가 발생함
        print("="*50)
        jump=board[x][y]
        dx=[0,jump]
        dy=[jump,0]
        col_move=[x+dx[1],y+dy[1]]
        row_move=[x+dx[0],y+dy[0]]
        if col_move[0] < n and col_move[1] < n:#벽에 막힐때까지 x축이동만 죽어라 함
            dp[x][y]+=dfs(col_move) # 재귀호출 구문

        if row_move[0] < n and row_move[1] < n:#그 이후 y축 이동
            dp[x][y]+=dfs(row_move) # 재귀호출 구문
    return dp[x][y] #===>메모이제이션 활용... 

print(dfs(start))
print(dp)
```



```
# 그래프 방싱 while문으로 짜봄, 메모제이션 활용하지 않아서
# 경로 개수 구하는 건 메모리초과, 시간초과

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


# 수정 dp판을 만들어서 메모제이션 활용해줌
# 처음에 참고했던 코드는 dp판에 -1과 0으로 visit표시를 해줬지만
# 이번에는 visited array를 따로 만들어서 방문 check를 해줬음
# 메모리 활용도적인 측면에서 이미 존재하는 dp판을 활용하는게 더 효율적이지만
# 처음에 봤을때 이해하기 힘들었음

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
```





#### **3. 깊이 우선 탐색(DFS)과 너비 우선 탐색(BFS) 활용한 문제 유형/응용**

DFS, BFS은 특징에 따라 사용에 더 적합한 문제 유형들이 있습니다.



1) 그래프의 **모든 정점을 방문**하는 것이 주요한 문제

단순히 모든 정점을 방문하는 것이 중요한 문제의 경우 DFS, BFS 두 가지 방법 중 어느 것을 사용하셔도 상관없습니다.

둘 중 편한 것을 사용하시면 됩니다.



2) **경로의 특징**을 저장해둬야 하는 문제

예를 들면 각 정점에 숫자가 적혀있고 a부터 b까지 가는 경로를 구하는데 경로에 같은 숫자가 있으면 안 된다는 문제 등, 각각의 경로마다 특징을 저장해둬야 할 때는 DFS를 사용합니다. (BFS는 경로의 특징을 가지지 못합니다)

 

3) **최단거리** 구해야 하는 문제

미로 찾기 등 최단거리를 구해야 할 경우, BFS가 유리합니다.

왜냐하면 깊이 우선 탐색으로 경로를 검색할 경우 *처음으로 발견되는 해답이 최단거리가 아닐 수 있지만,* 
너비 우선 탐색으로 현재 노드에서 가까운 곳부터 찾기 때문에경로를 탐색 시 먼저 찾아지는 해답이 곧 최단거리기 때문입니다.

 

이밖에도 

\- 검색 대상 그래프가 정말 크다면 DFS를 고려
\- 검색대상의 규모가 크지 않고, 검색 시작 지점으로부터 원하는 대상이 별로 멀지 않다면 BFS



출처: https://devuna.tistory.com/32 [튜나 개발일기📚]