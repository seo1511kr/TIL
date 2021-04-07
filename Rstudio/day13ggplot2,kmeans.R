# knn vs kmeans(�ӽŷ���)
# kmeans�� Ư�� ���� �׷��� ����� ��
# �׷쿡���� �ؼ��� �м����� ��
# ������ friends�� Ư�� ã�ƺ���
# ������ �ܾ� ��޼� ���� 5~10�� ���캸��
# ������ �����ϴ� �� knn���� 
# ������ ���缺�� ã�� �� knn��
# �����̳� ������ �������� ����-> �ڻ��� ���絵

#curve(�Լ� �Ǵ� ǥ����, ������,����)
curve(sin,0,2*pi)


#cars ����ȸ�� -> �ŷڱ��� ���
# lm(���ķ�,������)
# ���ķ�: ����~����

m
abline(m)

dev.off()
m<-lm(dist~speed,cars)
plot(cars)
abline(m)
#======================================================
#predict �Լ��� �����ϱ�, �ŷڱ����� ���
#interval = 'confidence'
p<-predict(m, interval = 'confidence')
p
# fit        lwr       upr
# -1.849460 -12.329543  8.630624

#======================================================
#polygon Ȱ���Ͽ� �ŷڱ��� ǥ��
#y<-c(����,�Ͽ�,���,����)�� �������� ������ �Է�
x<-c(cars$speed,tail(cars$speed,1),rev(cars$speed),cars$speed[1])
y<-c(p[,'lwr'],tail(p[,'upr'],1),rev(p[,'upr']),p[,'lwr'][1])
polygon(x,y,col=rgb(.7,.7,.7,.5))

#======================================================
#text( pos=) �� ��ǥ���� ��ȣ�ε��� ǥ���ϱ�
#pos=0,1,2,3
dev.off()
plot(cars,cex=0.5)
text(cars$speed,cars$dist,pos=3,cex=.5)

dev.off()
plot(cars,cex=0.5)
identify(cars$speed,cars$dist)

#legend===============================================
plot(iris$Sepal.Width,iris$Sepal.Length,cex=.5,pch=20,xlab='width',ylab='length')
points(iris$Sepal.Width,iris$Sepal.Length,cex=.5,pch='+',col='red')
?legend
legend('topright',legend=c('Sepal',"Petal"),pch=c(20,43),
       cex=.8,col=c('black','red'),bg='gray')

#boxplot===============================================
boxstats<-boxplot(iris$Sepal.Width,horizontal = T)
boxstats
boxstats$stats#lowerwhisker, Q1, median, Q3, upperwhisker
boxstats$out #�ش�ġ

#=========================================================
#histogram
#breaks='Sturges' (lon2(n)+1, n�� �ڷ��� ����)
#freq=T(y:����),F(y:����)
dev.off()
hist(iris$Sepal.Length,breaks = 'Sturges')
hist(iris$Sepal.Length,breaks = 6)
hist(iris$Sepal.Length,breaks = 'Sturges',freq=F)
?hist
#======================================================
#density �׸���
dev.off()
plot(density(iris$Sepal.Width))
#hist���� density�׸���
hist(iris$Sepal.Width,freq=F)
lines(density(iris$Sepal.Width))

#====================================================
#barplot�׸���
barplot(tapply(iris$Sepal.Width,iris$Species,mean))
?barplot
#====================================================
#pie�׷��� �׸���(�������� ����)
cut(1:10,c(0,5,10))
cut(1:10,breaks=3)
table(cut(iris$Sepal.Width,breaks=10))
pie(table(cut(iris$Sepal.Width,breaks=10)),cex=.7)

#=====================================================
#ggplot2
#3�� ����((���),(�׷���:����,��,����),(Ư��:����,���� ��))
library(ggplot2)
#data�� dataframe�̾�� ��
str(iris)
ggplot(data=iris,aes(x=Sepal.Length,y=Sepal.Width,col=Species))+
  geom_point()+
  labs(title='Iris',
       x='Sepal.Length',y='Sepal.Width')
?ggplot


#=====================================================
class(mtcars$gear)
mtcars$gear<-factor(mtcars$gear,levels=sort(unique(mtcars$gear)),
                    labels=c('3 gears','4 gears','5 gears'))
mtcars$cyl<-factor(mtcars$cyl,levels=sort(unique(mtcars$cyl)),
                    labels=c('3 cyl','4 cyl','5 cyl'))
str(mtcars)

ggplot(data=mtcars,aes(x=mpg))+
  geom_histogram()+
  facet_grid(cyl~.)+ #group_by�� ����� ����
  labs(title='cyl vs mpg')

ggplot(data=mtcars,aes(x=cyl,y=mpg))+
  geom_boxplot()+
  labs(x='cyl',y='mpg')

ggplot(data=mtcars,aes(x=mpg,fill=cyl))+
  geom_density()+
  labs(x='mpg',y='density')


#=====================================================
#Kmeans
#������ �Է�, �������� �߽��� ����, �׷�ȭ
#�׷�� �߽��� ����(�׷쳻 ��ǥ ���)
#�ٽ� �׷�ȭ(��Ŭ����� �Ÿ�), �׷쳻 �߽��� ����, �ٽ� �׷�ȭ
#ó�� �߽����� ������ �� ���� �����̶� ���ึ�� �����
#�ٸ� �� ����
#�ʱ� �߽����� ��� �������� ������� ���� ����
#k�� 
#1.���� ����-> �׷��� ���� ����
#2.�ð�ȭ-> �׷��� ���� ����
#3.sqrt(n/2)���Ϸ� k ���� ��ȭ��Ű�鼭
#�������� �׷쿡���� �� ����, ������ k
#�� ���: �׷쳻 ������, �׷찣 ������
#�߽������� �� �������� �Ÿ�
teens<-read.csv('data/snsdata.csv')
str(teens)
names(teens)[1:4]# 
names(teens)[5:40] #�ܾ�

table(teens$gender,useNA='ifany')#������ sns �̿��� ������ ����

#age: NA,3�� 106�� ��ó��
summary(teens$age)
teens$age<-ifelse(teens$age>=13 & teens$age<20,teens$age,NA)
summary(teens$age)

#����Naó��?
#Na�� �ϳ��� ī�װ����� ���� ��

teens$female<-ifelse(teens$gender=='F'&
                       !is.na(teens$gender),1,0)
teens$nogender<-ifelse(is.na(teens$gender),1,0)
table(teens$gender,useNA='ifany')
table(teens$female,useNA='ifany')
table(teens$nogender,useNA='ifany')

#quiz1
#���������� ���� ��� ����ϱ�
str(teens)
#1.array
with(teens,tapply(age,gradyear,mean,na.rm=T))
#2.tibble
library(dplyr)
teens %>% 
  group_by(gradyear) %>% 
  summarize(age.mean=mean(age,na.rm=T))
#3.dataframe
with(teens,aggregate(age,list(gradyear),mean,na.rm=T))

#4.ave(data,group,func)
ave_age<-ave(teens$age,teens$gradyear,FUN=
               function(x) mean(x,na.rm=T))

#������ ��ü
#teens$age<-ifelse(is.na(teens$age),�Լ�ȣ��,teens$age)
teens$age<-ifelse(is.na(teens$age),ave_age,teens$age)
summary(teens$age)


#====================================================
#ǥ��ȭvs����ȭ � ��Ȳ??
interests<-teens[5:40]
interests_z<-as.data.frame(lapply(interests,scale))
interests_z

set.seed(2345)
teen_clusters<-kmeans(interests_z, 5)
teen_clusters
teen_clusters$size
teen_clusters$centers
teen_clusters$cluster

#�� Ŭ������ ���� �����Ͱ� �Ÿ� ������ ��
#�׷쳻�� �������� �ľ��� �� ����, ���� ���� ����
teen_clusters$withinss 
teen_clusters$tot.withinss

#�׷� �� �߽��� �Ÿ� ������
#�׷찣�� ������ �ľ�, Ŭ���� ����
teen_clusters$betweenss

#K-means clustering with 5 clusters of sizes
# 21001, 947, 2232, 3900, 1920
# �ο��� ���� �׷��� Ư���� ������ Ȯ���� �ִ�.
# Cluster means �ؼ�
# ��� ���� ǥ��ȭ�� �߱� ������ ����� 0��
# mean�� 0�� ������ �� �׷��� ��ü ��պ��� 
# Ư�� ���� ���� ����ߴٰ� �ؼ��� �� ����
# �� ��쿡�� �ؼ� �������� ǥ��ȭ�� �� ������


teens$cluster<-teen_clusters$cluster

#Ŭ������ ������ ���
aggregate(data=teens,age ~ cluster,mean)
aggregate(data=teens,female ~ cluster,mean)
aggregate(data=teens,friends ~ cluster,mean)
