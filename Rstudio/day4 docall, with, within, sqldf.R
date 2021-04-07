#��Ŭ����� �Ÿ�(��õ �ý���)
#������: �� ��ó���� ����ȭ ������� ��
# ex)��ȭ����, ����:0~100, ��������0~10 �̸� ������ ���� ���絵�� ������

# ǥ��ȭ: (����-���)/ǥ������
# �ش�ġ ������(outlier)���� �ټ� ���ԵǸ� ��հ� ǥ�������� ����� ��ȭ��

# ����ȭ: 0<=(������ ���� - �ּҰ�)/(�ִ밪-�ּҰ�) <=1
# �����з��� ���� ��




id<-c('a1','a2','a3')
name<-c('x','y','z')
price<-c(1000,2000,3000)
product<-data.frame(id,name,price)
product
str(product)
?data.frame
product<-rbind(product,c('a4','x',4000))
product

# �� �� �̻��� ��, �� �߰�: dataframe ���� �� �߰�
new.rows<-data.frame(id=c('a5','a6'),name=c('i','j'),
           price=c(5000,6000))
new.rows
# �� �̸��� ���� data.frame�� �����ؾ���
product<-rbind(product,new.rows)

# ���� ���̰� ���� data.frame�� �����ؾ���
product<-cbind(product,madein=c('kor','chi','chi','kor','kor','usa'))
product


# �� �� �̻��� ��, �� �߰�: dataframe ���� �� �߰�
# �� name�� �ߺ��� �����ؾ� ��
new.cols<-data.frame(menu=c('aa','bb','aa','cc','aa','bb'),
                     quantity=c(10,20,30,20,10,25))
new.cols
product<-cbind(product,new.cols)
product

#������ ���� �ҷ��� �� dataframe ����


df1<-data.frame(sex='f',months=1,weight=3.5)
df2<-data.frame(sex='m',months=3,weight=4.5)
df3<-data.frame(sex='m',months=4,weight=5.5)
df4<-data.frame(sex='f',months=7,weight=6.5)
df5<-data.frame(sex='f',months=8,weight=7.5)


lst<-list(df1,df2,df3,df4,df5)
lst
class(lst[1])
class(lst[[1]])

str(lst[1])
str(lst[[1]])

rbind(lst[[1]],lst[[2]])

  
# do.call(�Լ�,���) �Լ��� ��ҷ� ����� �� ��Ҹ� ����
do.call(rbind,lst) #: rbind(lst[1],lst[2])
str(do.call(rbind,lst))



# ����Ʈ �� �����͵鵵 ��� ����Ʈ�� ��
# lapply + do.call �� dataframe �����

lst1<-list(sex='f',months=1,weight=3.5)
lst2<-list(sex='m',months=3,weight=4.5)
lst3<-list(sex='m',months=4,weight=5.5)
lst4<-list(sex='f',months=7,weight=6.5)
lst5<-list(sex='f',months=8,weight=7.5)
lst<-list(lst1,lst2,lst3,lst4,lst5)
lst
lapply(lst, rbind)

lst1<-list(sex='f',months=1,weight=3.5)
lst2<-list(sex='m',months=3,weight=4.5)
lst3<-list(sex='m',months=4,weight=5.5)
lst4<-list(sex='f',months=7,weight=6.5)
lst5<-list(sex='f',months=8,weight=7.5)
lst<-list(lst1,lst2,lst3,lst4,lst5)
lst

do.call(rbind,lst)
class(do.call(rbind,lst))#array�� ������




#lapply(arg1,arg2): ù��° �μ����� ����Ʈ�� ����
# �ι�° �μ����� �����ϰ��� �ϴ� �Լ�

lst<-lapply(lst,as.data.frame)
lst
do.call(cbind,lst)


#merge�Լ� �̿��ϱ�
state.x77
class(state.x77)
str(state.x77)
states<-data.frame(state.x77)
states
str(states)
row.names(states)
states$name<-row.names(states)
str(states)

#�� �̸� ���ֱ�
row.names(states)<-NULL
head(states)
tail(states)

states[c(states$Income>5000),]
class(states[c(states$Income>5000),])


rich.states<-states[c(states$Income>5000),c('name','Income')]
large.states<-states[c(states$Area>100000),c('name','Area')]

# merge(df1,df2) => inner join
# ����Ʈ=> ��� feature�� �� ���� �ִ� ������ �ุ ���
rich.states
large.states
merge(rich.states,large.states)
#all=TRUE �ɼ� ���� feature�� NA��
merge(rich.states,large.states,all = TRUE)

#subset():��� ���� ����
#subset(�� ����), select(�� ����) �ɼ�
subset(states,Income>5000)
subset(states,Income>5000 & Area>50000)
subset(states,subset=(Income>5000 & Area>50000))
subset(states,name=='Alaska')

subset(states,subset=(Income>5000 & Area>50000), select=c(Murder,Illiteracy))


# ����1
# �ɼǸ��� �����ҷ��� ������ �� ���Ѿ� ��.
mtcars
mtcars[mtcars$mpg>30,]
subset(mtcars,subset=mpg>30)
subset(mtcars,subset=mpg>30,select = mpg)
subset(mtcars,subset=(cyl==4 & am ==0),select = c(mpg,hp,wt))
subset(mtcars,subset=(mpg>mean(mpg)),select = c(mpg,hp,wt))


str(iris)
subset(iris,select=c(Sepal.Width,Petal.Length))
# sepal length�� width ����
# feature engineering
iris$Sepal.Length/iris$Sepal.Width

#with() Ȱ���ϱ�
with(iris, Sepal.Length/Sepal.Width)


with(iris,{
  print(summary(Sepal.Length))
  plot(Sepal.Length,Sepal.Width)
 })

# with�� �Լ��� �Լ� �ȿ��� �������
#stats��� ������ �Լ� �ۿ��� ��� �Ұ�
#�ۿ��� ����Ϸ���  <<- ȭ��ǥ2��
with(iris,{
  stats<-summary(Sepal.Length)
  stats
})

with(iris,{
  stats<<-summary(Sepal.Length)
  stats
})
stats 


#with �� within�� ���� ����
#������:within�� ������ ������ ������
iris<-within(iris, Sepal.Ratio <- Sepal.Length/Sepal.Width)

within(iris,{
  Sepal.Ratio=ifelse(is.na(Sepal.Ratio),median(Sepal.Ratio,na.rm=T),Sepal.Ratio)
})
#ifelse(����,�� ��, �̿��� ��)
str(iris)

#sqldf ��Ű��:SQL���ɹ��� ����� �� ����
#SQL(Structured Query Language):
#�����ͺ��̽��� �����͸� �˻�, ����, ����, �߰��ϴ� �۾�
#������ �� �ֵ��� ���ִ�, ������ ��ӵ� �����ͺ��̽� ǥ�� ���Ǿ�
#�˻�(select),����(update),����(delete),�߰�(insert into)
install.packages('sqldf')
library(sqldf)
mtcars
sqldf('select*from mtcars')
#mtcars�� ����Ǿ� �ִ� ���(*) �����͸� �����Ͻÿ�.
#�˻� =selecct �����÷�1,....,�����÷�n from ���̺���
sqldf("select cyl from mtcars")
sqldf("select * from mtcars", row.names=TRUE)
sqldf("select * from mtcars where mpg>30", row.names=TRUE)
sqldf("select * from mtcars where mpg>30 order by hp", row.names=TRUE)
sqldf("select avg(mpg) as avg_mpg from mtcars where mpg>30 order by hp", row.names=TRUE)


#����2.
state.x77
st<-state.x77
class(st)

st<-data.frame(st)
class(st)

colnames(st)
dim(st) # ������50, ��ó8
rowSums(st)
rowMeans(st)

#���㵥����
library(MASS)
head(cats)