# 1.���� ������ ���� R ���� ��Ÿ���ÿ�.
# 
# �� �ڷ� -0.2, 1, 2, 1.5, 2.2�� �ڷẤ�ͷ� x�� �����϶�.
# �� "Kim", "Lee", "Park", "Lim"�� �ڷẤ�� name���� �����϶�. 
# �� 2���� 9������ �������͸� �����϶�.
# �� 0���� 10���� 0.5�� �����ϴ� �Ǽ� ���͸� �����϶�.
# �� ���� 1,2,3�� 3�� �ݺ��ϴ� ���͸� �����϶�.

x<-c(-0.2, 1, 2, 1.5, 2.2)
name<-c("Kim", "Lee", "Park", "Lim")
a<-2:9
b<-seq(0,10,0.5)
c<-rep(c(1,2,3),each=3)
c
c<-rep(c(1,2,3),times=3)
c
# 2.x=c(2, -1, 3, 7, 0.5, 8)�� ����Ǿ��� ����. ���� ������ R ���� ���Ͻÿ�.

x<-c(2, -1, 3, 7, 0.5, 8)
# �� 5��° ���Ҵ�?
x[5]

#   �� ù ��°���� 3��°������ ���Ҵ�?

x[1:3]
#   �� 6, 2, 4��° ���Ҹ� ���ÿ� ã�ƶ�.
x[c(6,2,4)]
# �� 3��° ���Ҹ� ������ ������ ���Ҵ�?
x[-3]
#   �� x�� ���� �� 0���� ū ���� ã�ƶ�.
x[x>0]
# �� ¦�� ���ҵ��� ã�ƶ�.
x[x%%2==0]
# �� x���� Ȧ�����Ҹ� ã�� �����϶�.
x<-x[x%%2==0]
x
# 3.��Ű���� ����� ������ cats�� ���� 3���� ������ �����Ǿ� �ִ�.
# library(MASS) # MASS��Ű���� �ε�
library(MASS)
# head(cats)    # cats�������������� �� �� ����
head(cats)
# -���� �ڷ�(cats)�� �ڷ��� ���� ���Ͻÿ�
str(cats)
nrow(cats)
ncol(cats)
dim(cats)
# -������ �����Կ� ������ ����(Bwt�� Hwt)�� ��հ� ǥ�������� ���϶�.
colMeans(cats[2:3],na.rm = TRUE)
sd(cats$Bwt)
sd(cats$Hwt)
# -������ �ϼ��� �����Կ� ������ ������ ��հ� ǥ�������� ���� ���϶�.
mcat<-cats[cats$Sex=="M",]
mean(mcat$Bwt)
sd(mcat$Bwt)
mean(mcat$Hwt)
sd(mcat$Hwt)

fcat<-cats[cats$Sex=="F",]
mean(fcat$Bwt)
sd(fcat$Bwt)

mean(fcat$Hwt)
sd(fcat$Hwt)


 
# 
# 4. ���� d1, d2�� ������ ���� �� �� ������ �����ϱ� ���� �ڵ带 �ۼ��ϰ� ���� ���Ͻÿ�.
d1 <- 1:50
d2 <- 51:100
# d1, d2�� ���� ����Ͻÿ�.
print(d1)
print(d2)
# d2�� ����(������ ����)�� ���̽ÿ�.
length(d2)

# d1+d2, d2-d1, d1*d2, d2/d1�� ������ ����� ����Ͻÿ�.
data.frame(d1+d2, d2-d1, d1*d2, d2/d1)

# d1, d2�� ������ ���� ���� ����Ͻÿ�.
sum(d1)
sum(d2)
# d1, d2�� �ִ� ��� ������ ���� ����Ͻÿ�.
sum(c(d1,d2))

# d2���� ���� ū ���� ���� ���� ���� ����Ͻÿ�.
max(d2)
min(d2)
# d2�� d1�� ������ ��հ��� ���� ���ϰ� �� ����� ���̸� ����Ͻÿ�.
m1<-mean(d1)
m2<-mean(d2)
m2-m1


 
# 5.������ ���� ���� v1�� ������ ���� �� ������ �����ϱ� ���� �ڵ带 �ۼ��ϰ� ���� ���Ͻÿ�
# (������ Ǯ�� ���� v1�� ������ ����Ǳ⵵ �ϴµ�, ��� ������ ������ v1�� ������� �Ͽ� �ذ� �� ��).
# v1<- 30:100 ���� ���� ��,
v1<- 30:100
# v1���� 60���� ���� ���� ��� ����Ͻÿ�.
v1[v1<60]
# v1���� 70���� ���� ���� �� ������ ����Ͻÿ�.
length(v1[v1<70])
# v1���� 65���� ū ������ ���� ����Ͻÿ�.
sum(v1[v1>65])

# v1���� 60���� ũ�� 73���� ���� ���� ��� ����Ͻÿ�.
subset(v1,subset=(v1>60 & v1 <73))
# v1���� 65���� �۰ų� 80���� ū ���� ��� ����Ͻÿ�.
subset(v1,subset=(v1<65 | v1 >80))

# v1���� 7�� �������� �� �������� 3�� ���� ��� ����Ͻÿ�.
v1[v1%%7==3]

# v1���� 7�� ������� ���� 0���� �����Ͻÿ�.
v1[v1%%7==0]<-0
v1
# v1���� ¦���� ��� ���� ���� ����Ͻÿ�.
v1[v1%%2==0]
sum(v1[v1%%2==0])

# v1���� Ȧ���̰ų� 80���� ū ���� ��� ����Ͻÿ�.
v1[v1%%2!=0 | v1>80]

# v1���� 3�� 5�� ������� ����Ͻÿ�.
v2<-v1[v1%%3==0 & v1%%5==0]
v2[v2>0]
# v1���� ¦���� ���ؼ��� 2�� ���Ͽ� �����Ͻÿ�.
v1[v1%%2==0]<-v1[v1%%2==0]*2
v1
# v1���� 7�� ������� ������ �� v1�� ������ ����Ͻÿ�.
v1<-v1[v1!=0]
v1
# 6. iris�����Ϳ���
iris
target<-c(4.0, 3.0, 1.5, 0.15)
new<-rbind(iris,target)
tail(new)
msl<-mean(new$Sepal.Length)
msw<-mean(new$Sepal.Width)
mpl<-mean(new$Petal.Length)
mpw<-mean(new$Petal.Width)

ssl<-sd(new$Sepal.Length)
ssw<-sd(new$Sepal.Width)
spl<-sd(new$Petal.Length)
spw<-sd(new$Petal.Width)



# Sepal.Length Sepal.Width Petal.Length Petal.Width ���� ���� 
# (4.0, 3.0, 1.5, 0.15)�϶� ����Ǵ� ��(setosa, verisicolor, virginica)�� ����Ͻÿ�
# (4.0, 3.0, 1.5, 0.15)�� ���� ��Ŭ����� �Ÿ��� ����� �����͸� 9�� ã�Ƴ���
# 9���� �����Ϳ� ���� ���� �󵵼��� ������� ����
# ex) setosa:6, veri:2, vir:1 => setosa ����
# 
dim(t(new[1:4]))
infomat<-t(new[1:4])
# �������� ����ϱ� ���ؼ� transpose


infomat
#ǥ��ȭ
# infomat<-(infomat-c(msl,msw,mpl,mpw))/c(ssl,ssw,spl,spw)
# infomat

dist<-(infomat-infomat[,151])^2
dist<-sqrt(colSums(dist))
dist
data.frame(dist)
new<-cbind(new,dist)
new
tail(new)
sort(new$dist)[1:10]

key<-sort(new$dist)[10]
key
new$Species[new$dist<=key]
new[new$dist<=key,]


summary(new$Species[new$dist<=key])

