# 1992
# 흑백 영상을 압축하여 표현하는 데이터 구조로 쿼드 트리(Quad Tree)라는 방법이 있다.
# 흰 점을 나타내는 0과 검은 점을 나타내는 1로만 이루어진 영상(2차원 배열)에서 같은
# 숫자의 점들이 한 곳에 많이 몰려있으면, 쿼드 트리에서는 이를 압축하여 간단히 표현할 수 있다.
#
# 주어진 영상이 모두 0으로만 되어 있으면 압축 결과는 "0"이 되고, 모두 1로만 되어 있으면
# 압축 결과는 "1"이 된다. 만약 0과 1이 섞여 있으면 전체를 한 번에 나타내지를 못하고,
# 왼쪽 위, 오른쪽 위, 왼쪽 아래, 오른쪽 아래, 이렇게 4개의 영상으로 나누어 압축하게 되며,
# 이 4개의 영역을 압축한 결과를 차례대로 괄호 안에 묶어서 표현한다
#
#
#
# 위 그림에서 왼쪽의 영상은 오른쪽의 배열과 같이 숫자로 주어지며,
# 이 영상을 쿼드 트리 구조를 이용하여 압축하면 "(0(0011)(0(0111)01)1)"로 표현된다.
# N ×N 크기의 영상이 주어질 때, 이 영상을 압축한 결과를 출력하는 프로그램을 작성하시오.

#분할정복=> 문제를 분할하여 해결하는 과정
# 하나의 압축은 최소 4개칸의 단위로 이뤄짐
# 보드판을 4개 단위로 분할후 압축이 되는지 확인 후 정복(합쳐올림)
# 합쳐올려진 보드판을 또 4개단위로 쪼갠후 압축하여 합침

#1. 분할

a='''
11110000
11110000
00011100
00011100
11110000
11110000
11110011
11110011
'''
import math
# import sys
# N=int(input())
# board=[sys.stdin.readline().strip().split() for j in range(N)]
N=8
board=a.a.strip().split('\n')
for i in range(N):
print(a.strip().split('\n'))

groups=N/2
for i in range(groups):
    x,y=2*i
    start=board[x][y]
def zip(board):
    dx=[1,0,-1]
    dy=[0,1,0]
    new_board=[]
    for i in range(groups):
        for j in range(3):
            board[2*i][2*i]