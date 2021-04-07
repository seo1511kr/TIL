train<-read.csv('DisasterTweets/train.csv',na.strings = '')
test<-read.csv('DisasterTweets/test.csv',na.strings = '')
str(train)
str(test)

#결측치: location, keyword 특히 location이 많음
library(Amelia)
missmap(train,col=c('red','blue'))
missmap(test,col=c('red','blue'))

sum(is.na(train$location)) #2533
sum(is.na(train$keyword)) #61

sum(is.na(test$location)) #1105
sum(is.na(test$keyword))  #26
 
unique(train$location)
unique(train$keyword)


sort(with(train,tapply(target,keyword,mean)),decreasing = T)
with(train,tapply(target,keyword,length))


#문장 길이 살펴보기
head(train$text[train$target==1],20)
head(train$text[train$target!=1],20)
train$nchar<-nchar(train$text)
with(train,tapply(nchar,target,mean))
#        0         1 true message가 길이가 더 김
# 95.70682 108.11342 
dev.off()

par(mfrow=c(2,1))
plot(with(train[train$target==1,],tapply(nchar,nchar,length)),type = 'o')
plot(with(train[train$target==0,],tapply(nchar,nchar,length)),type = 'o')

real_words<-unlist(strsplit(train$text[train$target==1],' '))
sort(table(real_words),decreasing = T)

fake_words<-unlist(strsplit(train$text[train$target!=1],' '))
sort(table(fake_words),decreasing=T)


real<-train[train$target==1,]
fake<-train[train$target!=1,]


spl_text<-strsplit(real$text," ")
tail(spl_text)
tail(real$keyword)




#keyword 결측치 채워주기
#이미 존재하는 unique 키워드를 text에 포함하고 있으면 대체



str(train)
str(test)
library(dplyr)
total<-bind_rows(train[-5],test)
iter<-nrow(total[is.na(total$keyword),])
keys<-unique(total$keyword)[-1]
pat<-paste(keys,collapse = '|')

a<-c()

head(total[is.na(total$keyword),])
for(i in 1:iter){
ans=grep(pat,unlist(strsplit(total[is.na(total$keyword),'text'],' ')[i]),value=T)
if(length(ans)>=1){
print(ans)
}
}


for(i in 1:len){
  print(sum(unlist(strsplit(texts[i],' ')) %in% keys))
  if(sum(unlist(strsplit(texts[i],' ')) %in% keys)>=1){
    idx<-unlist(strsplit(texts[i],' ')) %in% keys
    keyword[i]<-unlist(strsplit(texts[i],' '))[idx][1]
  }
}
train$keyword[is.na(train$keyword)]<-keyword

str(train[c(2,4,5,6)])
newtrain<-train[c(2,4,5,6)]


temp<-train[!is.na(train$keyword),]
str(temp$text)
strsplit(temp$text,split = " ")
iter<-nrow(temp)
for(i in 1:iter){
  ans=grep(pat,unlist(strsplit(temp$text,' ')[i]),value=T)
  if(length(ans)>=1){
  print(c(ans,temp['target'][i]))
  }}
