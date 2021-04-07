#연관규칙 분석(비지도)
#장바구니 분석

#아프리오리 알고리즘
#생성가능한 모든 조합의 개수 2의 n승
#서포트 컨피던스 리프트

# 상품 추천:
#1. 우사도 추천(유클리디안), 협업필터링 알고리즘
# 추천대상 고객과 가장 높은 상관계수에 해당되는 고객들을
# 찾아서 상품 추천
# 2. 연관규칙(장바구니 분석): 동시 구매 규칙을 도출
# 특정 항목 집합이 발생했을 때, 또 다른 항목 집합이 발생하는 규칙
# 연관규칙은 순서 고려 x  

#연관규칙 알고리즘
# 
# x,y를 항목집합 x -> y (x를 구매한 사람이 y도 구매)
# N은 전체 거리 건수 ex)n(x): x거래 건수
# #1.지지도
# 두항목 집합 x와 y의 지지도
# x와 y를 모두 포함한 거래/ 전체 거래 수
# s(X->Y)
# n(x 교 y)/N
# # 2.신뢰도
# 항목집합x를 포함하고 있는 거래 중, 항목집합 y도 포함하는 거래 비율
# n(x 교 y)/n(x)
# c(X->Y)
# #3. 향상도
# p(y|x)/p(y) >1 양의 연관성 o
# p(y|x)/p(y) =1 연관성 x
# p(y|x)/p(y) <1 음의 연관성 o
# 
# 1. 계란, 우유
# 2. 계란, 기저귀, 맥주, 사과
# 3. 우유, 기줘귀, 맥주, 콜라
# 4. 계란, 우유, 맥주, 기저귀
# 5. 계란, 우유, 맥주, 콜라
# 
# 총 거래 5건
# N=5 (현재 거래건수)
# 연관규칙 x(계란)->y(기저귀)
# 지지도: s(x->Y)= n(X 교 Y)/N= 2/5
# 신뢰도: c(x->Y)= n(X 교 Y)/n(x)= 2/4
# 향상도: lift(x->Y)= c(x->y)/s(y)= 0.5/0.6

# 항목1000개
# 2의 1000승의 부분집합 간의 모든 향상도를 다 구해야 함
# 시간적으로 불가능-> 지지도 선정 규칙 정하기(특정값 이상)
# 시간적으로 불가능-> 신뢰도 선정 규칙 정하기(특정값 이상)
# 중요한 것은 매출 혹은 이익과의 관계
# 실무자의 의견이 필수적

# 1. IS측도(interest support)=루트(향상도*지지도)
# 2. 교차지지도=최대지지도에 대한 최소지지도의 비율
# 항목집합x={i1,...im}에서 의미없는 연관규칙 찾아내기
# 교차지지도가 작을수록 항목집합x에서 생성되는 연관규칙은 의미없을 가능성이 높다.


#아프리올리 알고리즘
# 부분집합 2^k-1==>3^k-2^(k+1) +1
# 최소지지도 이상 항복집합
# 빈발 항목집합에 대해서만 연관규칙을 계산
# 한 항목집합이 비빈발 -> 관련 부분집합 모두 비빈발

#행마다 열의 길이가 다른경우
#첫번째 row에 맞춰서 column이 생성되어서 밑에 데이터들이 짤릴 수 있음
#각 행별로 실제 데이터 있는 셀만 저장: arules 패키지 이용
library(readxl)
df<-read.csv('data/groceries.csv',header = F,na.strings = '')
str(df,10)
head(df)

install.packages('arules')
library(arules)

#희소행렬 형태로 데이터 읽기
groceries<-read.transactions('data/groceries.csv',sep=',')
summary(groceries)
# 9835 rows (elements/itemsets/transactions) and
# 169 columns (items) and a density of 0.02609146 
# 밀도가 낮음: 대부분이 한,두개 만 거래함
# most frequent items: #최빈값들
#   whole milk other vegetables       rolls/buns             soda 
# 2513             1903             1809             1715 
# yogurt          (Other) 
# 1372            34055 

class(groceries)
inspect(groceries[1:10])
itemFrequency(groceries[,]) #지지도
itemFrequencyPlot(groceries,support=0.1)
itemFrequencyPlot(groceries,topN=25)
image(groceries[1:10])

image(sample(groceries,100))
groceryrules<-apriori(groceries,list(support=0.006,confidence=0.25,minlen=2))
groceryrules
apriori(groceries)

summary(groceryrules)
inspect(groceryrules[1:3])
inspect(sort(groceryrules[1:3],by='lift'))
inspect(sort(groceryrules,by='lift')[1:10])
berryrules<-subset(groceryrules,items %in% 'berries')
inspect(berryrules)


byrules<-subset(groceryrules,items %in% c('berries','yogurt'))
inspect(byrules)

# %pin% 을 활용한 부분매칭
fruitrules<-subset(groceryrules,items %pin% 'fruit')
inspect(fruitrules)

allbyrules<-subset(groceryrules,items %ain% c('berries','yogurt'))
inspect(allbyrules)

write(groceryrules, 'groceryrules.csv',sep=',',quote=F,row.names=FALSE)

#규칙-> 데이터프레임 변환
groceryrulesDf<-as(groceryrules,'data.frame')



help(Epub)
data(Epub)
summary(Epub)
inspect(Epub[1:10])


# 1. Epub데이터 연관규칙
# -support, confidence
# -minlen=2
# 2.정렬
# -lift,confidence,support
# 3.연관규칙 부분집합
# -support
# -in,piin,ain
# -ex)순서도 고려 items 위치에 lhs
# subset(rules,items %in% c('doc1','doc2'))
# subset(rules,lhs %in% c('doc1','doc2'))