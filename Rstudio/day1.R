print('hello')
print(
  "hello"
)
print('hello')
print('hello')
print('hello')
print('hello')
print(
"hello"
)
print('hello')
print(
"hello"
)

# ?�Լ� helpâ�� ������ ����
?print
?apply

# ���� ���� <-
a<-3
a
print(a)

# ��Į��, ����, ��� ������������, ����Ʈ, �ټ�
# ����: �����ͺм����� �ڷ��� �⺻��(�������� ���ڰ� Ư���� ������ ���ִ� ��)
# ��Į��:���̰� 1�� ����
# �ټ�: ũ�Ⱑ ���� ����� ������


# ����
# 4���� ����: (Ű,������,�÷�,����) �̷��� ������ ������ �־����.
# ���ʹ� �ϳ��� �������� ǥ����. ������ ������, ������ ������
# N���� ����: N=>���͸� �̷�� �������� ����
# �̹��� ������(100*100 �ȼ�) => 10000���� ������
# ex) (250,225,0,0,...,210,255) 10000���� ����
num <- c(1,2,3)# concatenate
cha <- c('x','y','z')
c(num,cha) #�ϳ��� �������� ���ϵ�.

a<-c(1,2,3)
odd<-c(1,3,5)
even<-c(2,4,6)
c(odd,even)

# ���ӵǴ� ����
3:9
5:-1

# seq (from, to, by, length.out)����ġ ���� ����
seq(from=3, to=9)
seq(from=3, to=9, by=0.5)
seq(from=9, to=3, by=-0.5)

?seq
seq(from=0, to=100, length.out=5)

# rep(data,times, each, length.out)
rep(7,times=3)
rep(c(1,2,3),times=3) #1 2 3 1 2 3 1 2 3

rep(c(1,2,3),each=3) # 1 1 1 2 2 2 3 3 3

rep(c(1,2,3),length.out=8)# 1 2 3 1 2 3 1 2


# str: ������ ���� �� ���� Ȯ��
str(c(1,2,3,'d')) # ���� chr�� ����
str(num)
str(cha) # ������ ����:3, 3���� ���Ҹ� ���� 1���� ����

length(num) #���̸� �� ��



#�������
LETTERS
letters
month.abb
month.name
pi

# ��������: 1���� ����
month <- c(12,9,3,5,1)
month[1]
month.name[2]
month.name[c(2,3)] # ������ ����

# ex �ֽ� ������ ����(�ð�, ����, �ŷ���=> feature)
# feature�� ������ �����̶�� ��������

# ����ȭ(vectorized) ���� => �ӵ��� ������
# ����ȭ ������ ��Ģ: ���ͳ��� ���̰� ���ƾ� ��. 
x<-c(1:3)
x
y<-c(4:9)
y
x+y #���̰� ª�� ������ ���̸� ���̰� �� ���͸�ŭ �ø�

c(1,2,3)+c(2,3,4)
c(1,2,3)*c(2,2,3)
c(2,4,6)/c(2,2,3)
2^10
c(10,11,12)%%c(3,3,2) # ������
c(10,11,12)%/%c(3,3,2)# ���

x<-c(seq(1,6,2))
x+10
x<-c(seq(1,6,2))
x+c(10,20) #����� �������� ����� ����

# ���� ������
# (==, !=, < , > , <=, >=, !x, x|y, x&y)

v<-pi
w<-10/3
v==w
v!=w
v>w
!(v>w)
(v==w)|(v<w)
(v==w)&(v<w)
isTRUE((v==w)&(v<w))
isTRUE((v==w)|(v<w))

x<-c(1,3,5)
y<-c(3,3,3)
x==y
x==3

# true =1, false =0
as.numeric(TRUE)
as.numeric(FALSE)
TRUE+FALSE
TRUE*FALSE

x <-c(0,25,50,75,100)
x>50

sum(1:5)
sum(1:2,3)
sum(1:2,3:5)
sum(TRUE,FALSE,TRUE)

sum(x>50)
any(x>50)
all(x>50)

# 2�� �������� ������ 2�� �ȳ���, �ε��Ҽ����� ����
sqrt(2)^2==2
sqrt(2)^2-2

# ��ġ �񱳽� ���е� ���� �ذ�
all.equal(sqrt(2)^2,2)

# ���ڿ� �ٷ�� paste():���ں��� ����
fruits<-c('Apple','Banana','Strawberry','Mango')
food<-c('Pie','Juice','Cake')
# fruits+food error
paste(fruits,food) #���� �˾Ƽ� ����
paste(fruits,'Juice')

# abs(): ���밪
x<- -3:3
abs(x)
# log(,base=) or log2(), log10()...
log(abs(x)) #����Ʈ�� �ڿ��α�
log(abs(x),base=2) #log(data, base=2)
log2(abs(x))
log10(1:10)

#exp: �ؼ��� e�� ������
y<-exp(1:5)
y
log(y)

#factorial , combination
factorial(1:5)
choose(5,2) # nCr= n!/(n-r)!*r!


#sqrt(), �⺻ ��ȿ�ڸ��� 7�ڸ�
sqrt(1:5)

# signif()��ȿ�ڸ��� Ȯ��, round()�ݿø�
options('digits')
signif(456.789, digits=2)
signif(456.789, digits=3)
signif(456.789, digits=4)
signif(456.7891, digits=6)

round(456.789,digits=1)
round(456.789,digits=2)
round(456.789,digits=-1)
round(456.789,digits=-2)
round(456.785,digits=2)

# �ݿø� ���ڰ� 5�� ��쿡 ����� ¦���� �ݿø�
round(12.5)

# quiz 1~10���� ���� ���� ������ �������� ���Ѵ���
# �Ҽ����� 2�ڸ����� ���
x<-1:10
round(sqrt(x),digits=2)

# floor, ceiling, trunc 0�� ������ ��������(���, ����)
floor(456.78)
floor(-456.78)

ceiling(456.78)
ceiling(-456.78)

trunc(456.78)
trunc(-456.78)


# infinity �ٷ��
# 1.8*10�� 308�±��� ǥ��
3/0
5-Inf
Inf*Inf
Inf*(-Inf)
10^306

# is.infinite
is.infinite(10^(306:310))

# NaN(Not a Number: ���ڰ� �ƴ�, ��� ����� ������ �� ����.)
Inf/Inf
Inf*0
log(-2)
NaN+3
is.nan(sqrt(-2))
is.nan(Inf/Inf)

# NA(Not Available, ������)
k<- NA
k+2
sqrt(NA)

# �پ��� ���
z<-1:6
z
sum(z)
prod(z)
min(z)
max(Z)
mean(z)
median(z)
var(z)
sd(z)
range(z) #���� �ּ�,�ִ�

# �������� �����ϰ� ����ϱ�
# na.rm=TRUE, na.omit(z) 
z<-c(z,NA)
z

sum(z, na.rm=TRUE)

na.omit(z)
sum(na.omit(z))

# cumsum�Լ�: ������
traffic.death <- c(10,20,30,20)
cumsum(traffic.death)


traffic.death <- c(10,20,NA,20,30) # NA���ĺ��� ���峲
cumsum(traffic.death)

traffic.death <- c(10,20,30,20) # �ڿ��� ���� ��
diff(traffic.death)

traffic.death <- c(10,20,NA,20,10)
diff(traffic.death)

diff(1:10, lag=3) # 4-1, 5-2, ..10-7

p<-1:10
q<-6:15
union(p,q)
intersect(p,q)
setdiff(p,q)
setequal(p,q)

# ù ��° �μ��� ���� ���� �ι�° ������ �������� �׽�Ʈ
# is.element()
is.element(3,1:5)
is.element(6,1:5)
is.element(4:7,1:5)


# ���� indexing
num<-0:30
num[5]
num[5:10]
num[c(2,4,5,10)]


prime<-c(1:10)
idx<-c(1,3,5)
prime[idx]
prime[3:5]
prime[-3] # 3�� �ε��� ���� ��
prime[-2:-4] #2~4�� �ε��� ����
prime[-(2:4)]


prime<-c(2,3,5,7,11,13)
length(prime)
prime[1:(length(prime)-2)]
prime[-length(prime)]

#���Һ���
prime[2]<-30 
prime[c(3,4)]<-c(30,40)
prime