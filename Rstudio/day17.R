# �ڻ��� ���絵:
# ��Ŭ����� �Ÿ�:
# tf-idf: ������ ����ȭ�� �ڻ��� ���絵
# (�ܾ��� ��Ҽ� ��� ��� Ƚ���� ���� ����ġ�� �ο�)

#========================================================
#ȸ�ͺм�
1. �л�, ���л�, ������


mydata<-read.csv('data/examscore.csv')
hist(mydata$midterm,
     xlab='�߰����� ����',
     ylab='��',
     main='�߰����� ��������')
abline(v=mean(mydata$midterm),col='red')
abline(v=median(mydata$midterm),col='blue')


#100�� ���� 2�� �ο��ϴ� median�� mean �������� ��
mydata$midterm[20]<-100
mydata$midterm[22]<-100

hist(mydata$midterm,
     xlab='�߰����� ����',
     ylab='��',
     main='�߰����� ��������')
abline(v=mean(mydata$midterm),col='red')
abline(v=median(mydata$midterm),col='blue')


quantile(mydata$midterm)

#1. �л�: �����Ͱ� �����ִ� ����
#�������� �л��� �������� ���� ����ġ
#��л�� ǥ���л�, n���� ������, n-1�� ������(�������� ����)

#ǥ�����
set.seed(1234)
x<-sample(1:10,6)
x

xBar<-mean(x)

#ǥ���л�
sampleVar<-sum((x-xBar)^2)/(length(x)-1)
var(x)

sqrt(sampleVar)
sd(x)


#�ֺ��
x<-sample(1:100,40,replace = T)
names(sort(-table(x))[1])


#������ �������
# ���л�:(��ȣ�� �߿���)
# �ð�ȭ �� �� �� ������ ��հ��� �������� �̷�� ���簢����
# ������ ���ϱ�, ������: ������ ���� ���� ũ�� ����

#�������: ǥ��ȭ�� ���л�
#�� ������ ǥ��ȭ �� �� ���л� ���ϱ�
mydata<-read.csv('data/examscore.csv')
mycorr<-cor(mydata$midterm,mydata$final)
mycorr
n<-length(mydata$midterm)
xBar<-mean(mydata$midterm)
yBar<-mean(mydata$final)
sx<-sd(mydata$midterm)
sy<-sd(mydata$final)
x<-mydata$midterm
y<-mydata$final
zx<-(x-xBar)/sx
zy<-(y-yBar)/sy
zxy<-sum(zx*zy)/(n-1)
zxy



dev.off()
plot(x,y,xlab = '�߰�',ylab='�⸻',
     main='��������')
title(sub=paste('������:',round(mycorr,4)),adj=1)
abline(v=xBar,h=yBar)


#�� ����
zx
zy
sign(zx*zy) #���=1, ����=-1
as.factor(sign(zx*zy))
c('blue','red')[as.factor(sign(zx*zy))]

#ũ�� ����
abs(zx*zy)



dev.off()
plot(zx,zy,xlab = '�߰�',ylab='�⸻',
     main='��������',
     col=c('blue','red')[as.factor(sign(zx*zy))],
     cex=abs(zx*zy)+1
)
abline(v=0,h=0,col='red')
abline(lm(zy~zx))

install.packages('datarium')
library(datarium)
?marketing
# data(marketing)
# res.lm <- lm(sales ~ youtube*facebook, data = marketing)
# summary(res.lm)
data("marketing")
summary(marketing)


dev.off()
plot(zx,zy,xlab = '�߰�',ylab='�⸻',
     main='��������',
     col=c('blue','red')[as.factor(sign(zx*zy))],
     cex=abs(zx*zy)+1
)
abline(1,2) #y=2x+1

#ȸ������ �׸���(rss:���������� �� �ּ�ȭ�ϴ� ����)
rss<-function(data,lineinfo){
  x<-data[,1]
  y<-data[,2]
  intercept<-lineinfo[1]
  slope<-lineinfo[2]
  predict<-intercept+slope*x
  res<-sum((y-predict)^2)
  return(res)
}
str(mydata)
rss(mydata[3:4],c(5,1))


#����ȭ �Լ�: optim(par = )
dev.off()
plot(x,y,xlab = '�߰�',ylab='�⸻',
     main='��������')
abline(5,1)
abline(-10,1.5,col='red')
result<-optim(par=c(1,1),fn=rss,data=mydata[3:4])
result$par  #[1] 13.8833436  0.8967623
result$value #[1] 5712.789
abline(result$par,col='blue')

#
lm(final~midterm, mydata)


#
#����= ������*ǥ������(y)/ǥ������(x)
b<-cor(x,y)*sd(y)/sd(x)
a<-mean(y)-b*mean(x)


result<-lm(final~midterm,mydata)
attributes(result)
result$coefficients

dev.off()
plot(x,y,
     xlab='�߰�',
     ylab='�⸻',
     main='����������')
abline(result$coefficients)
summary(result)
#������
result$fitted.values
#����
mydata$final-result$fitted.values

dev.off()
par(mfrow=c(2,2))
plot(result)


dev.off()

plot(x,y,
     col=c('red','blue')[as.factor(mydata$gender)],
     pch=c(16,17)[as.factor(mydata$gender)],
     xlab='�߰�',
     ylab='�⸻',
     main = '��������')
legend(20,80,legend = c('����','����'),
       col=c('red','blue'),
       pch=c(16,17))


# �� �� ȸ�ͼ� �����ϱ�==========================
library(dplyr)
dataFemale<-mydata %>% 
  filter(gender=='F')
  
dataMale<-mydata %>% 
  filter(gender=='M')


model1<-lm(final~midterm,dataFemale)
model2<-lm(final~midterm,dataMale)


dev.off()
plot(x,y,
     col=c('red','blue')[as.factor(mydata$gender)],
     pch=c(16,17)[as.factor(mydata$gender)],
     xlab='�߰�',
     ylab='�⸻',
     main = '��������')
legend(20,80,legend = c('����','����'),
       col=c('red','blue'),
       pch=c(16,17))
abline(model1$coefficients,col='red')
abline(model2$coefficients,col='blue')

#=========================================
predict(model1, data.frame(midterm=50))

param<-as.numeric(model1$coefficients)
param[1]+50*param[2]


#����ȸ�ͺм�
model3<-lm(final~midterm+gender,mydata)
model3
model3$fitted.values
predict(model3,mydata)
predict(model3,data.frame(midterm=80,gender='M'))
model3$coefficients