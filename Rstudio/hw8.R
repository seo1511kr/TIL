# 1. mtcars������ weight�� �߰�, ���԰� ���������� 
# ū �ڵ����� heavy, �׷��� ���� �ڵ����� light�� ����
# - �� ������ ������ �Ǽ� ���, ����
str(mtcars)
midwt<-median(mtcars$wt)
minwt<-min(mtcars$wt)
maxwt<-max(mtcars$wt)
isheavy<-cut(mtcars$wt,breaks = c(minwt,midwt,maxwt),labels = c('ligth','heavy'),include.lowest = T)
mtcars$weigth<-isheavy
str(mtcars)
table(isheavy)
proportions(table(isheavy))


# 2. mtcars �����ͼ� ������ ���ʿ��� ���������� ������������ ��ġ�ǵ��� �ۼ�
str(mtcars)
mtcars[do.call(order, mtcars),]

# 3. iris�����Ϳ��� 70% �����͸� ������ ǥ������
data(iris)
str(iris)
head(iris)

set.seed(2021)
number<-count(iris)
number[[1]]
sample(1:number[[1]],number[[1]]*0.7,replace = F)

# 4. ggplot2 ��Ű������ �̱� �����ߺ� 437�� ������ �α���� ������
# ���� midwest��� �����Ͱ� ���ԵǾ� ����. 
# midwest �����͸� ����Ͽ�,
# �ҷ����� : midwest<-as.data.frame(ggplot2::midwest)
midwest<-as.data.frame(ggplot2::midwest)
# - ggplot2 �� midwest �����͸� ������ ������ ���·� �ҷ��ͼ� ��������
# Ư���� �ľ�
describe(midwest)
str(midwest)
library(Amelia)
missmap(midwest,col=c('red','grey'))
sum(duplicated(midwest))
sum(!complete.cases(midwest))

library(ggplot2)
library(GGally)
ggcorr(midwest,nbreaks=6,label = T,label_size = 1)
# - poptotal(��ü �α�)�� total ��, popasian(�ƽþ� �α�)�� asian ���� 
#  �������� ���� rename

library(dplyr)
midwest<-rename(midwest,c(total=poptotal,asian=popasian))

# - total, asian ������ �̿��� '��ü �α� ��� �ƽþ� �α� �����' �Ļ����� ����
head(midwest$total)
head(midwest$asian)

propas<-round(midwest$asian/midwest$total*100)
midwest$propas<-propas
# - �ƽþ� �α� ����� ��ü ����� ���ϰ�, ����� �ʰ��ϸ� "large"
#�� �ܿ��� "small"�� �ο��ϴ� �Ļ����� ����

newpropas<-cut(midwest$propas,
    breaks = c(0,mean(midwest$propas),100),
    labels=c('small','large'),
    include.lowest = T)
midwest$newpropas<-newpropas

# - "large"�� "small"�� �ش��ϴ� ������ �󸶳� �Ǵ��� �󵵼��� ���
table(midwest$newpropas)
# 5. Ÿ��Ÿ�� ������ �м�
# -Ÿ��Ÿ�� ������ �ҷ�����
titanichw<-read.csv('data/train.csv',na.strings = '')
str(titanichw)
library(Amelia)
missmap(titanichw,col = c())
# - ������ ��, ����� �� ���
table(titanichw$Survived)
# - pclass, embarked �� �°��� ���(����)
for (i in unique(titanichw$Pclass))
  print(c(i,sum(titanichw$Survived[titanichw$Pclass==i])/length(titanichw$Survived[titanichw$Pclass==i])))

for (i in na.omit(unique(titanichw$Embarked)))
  print(c(i,sum(titanichw$Survived[titanichw$Embarked==i],na.rm = T)))

# - Name���� ȣĪ ���� ���, ȣĪ ���� �� �°��� ���
name2<-unlist(lapply(strsplit(titanichw$Name,split='[,.]'),function(x){x[2]}))
table(name2)

# - ȣĪ�� �Ʒ��� ���� �����Ͽ� name2���� �߰�
# * "Mlle", "Ms", "Lady", "Dona" �� "Miss"�� ����
# * "Mme"��  "Mrs"�� ����
# * "Capt", "Col", "Major", "Dr", "Rev", "Don",  "Sir", "the Countess", "Jonkheer"�� "Officer"�� ����
# * "Mr", "Mrs", "Miss"�� �״��
# * ������ ȣĪ�� "Others"

name2<-gsub("(Mlle|Ms|Lady|Dona)",'Miss',name2)
name2<-gsub("(Capt|Col|Major|Dr|Rev|Don|Sir|the Countess|Jonkheer)",'officer',name2)
name2<-gsub("Mme",'Mrs',name2)
name2[-grep("Mr|Mrs|Miss|officer",name2)]<-"Others"
name2<-gsub(' ','',name2)
titanichw$name2<-name2
# -name2 ���� factor��(5���� ����) ��ȯ
titanichw$name2<-as.factor(titanichw$name2)
str(titanichw$name2)
# -name2���� ȣĪ�� �ο��� ���
table(titanichw$name2)

# -ȣĪ ������ �������� ����(Age) ������ ��ü(ȣĪ �� ������ ��հ�)
unique(titanichw$name2)
for (i in unique(titanichw$name2)){
  titanichw$Age[titanichw$name2==i&is.na(titanichw$Age)]<-mean(titanichw$Age[titanichw$name2==i],na.rm=T)
}

  
# -age���� ������ �ο��� ���
# 10�� �̸�, 10��, 20��, 30��, 40��, 50�� �̻�

catage<-cut(titanichw$Age,breaks = c(0,10,20,30,40,50,max(titanichw$Age)),include.lowest = T,right=F)
str(catage)
table(catage)

# -cabin �÷��� 1��° ���� ���(NA�� ����)
substr(titanichw$Cabin[!is.na(titanichw$Cabin)],1,1)
# - fare�� ���� ���� �ִ�/�ּ�/���/ǥ������ ���
describe(titanichw$Fare)
mean(titanichw$Fare,na.rm = T)
max(titanichw$Fare,na.rm = T)
min(titanichw$Fare,na.rm = T)
sd(titanichw$Fare,na.rm = T)
# - sibsp + parch�� ���Ͽ� ���Ӱ� family���� ����
family<-titanichw$SibSp+titanichw$Parch
sum(is.na(family))
titanichw$family<-family
