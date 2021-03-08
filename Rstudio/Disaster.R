train<-read.csv('DisasterTweets/train.csv',na.strings = '')
test<-read.csv('DisasterTweets/test.csv',na.strings = '')
str(train)
str(test)

library(Amelia)
missmap(train,col=c('red','blue'))
missmap(test,col=c('red','blue'))

sum(is.na(train$location))
sum(is.na(train$keyword))

sum(is.na(test$location))
sum(is.na(test$keyword))

unique(train$location)
unique(train$keyword)

library(dplyr)
train$target
real_key<-train %>% 
  filter(!is.na(keyword),target==1) %>% 
  select(keyword) %>% 
  distinct()
real_key
fake_key<-train %>% 
  filter(!is.na(keyword),target==0) %>% 
  select(keyword) %>% 
  distinct()
fake_key

train %>%
  filter(!is.na(keyword)) %>% 
  group_by(keyword) %>% 
  summarise(mean.real=mean(target),keyword_N=n()) 

train$nchar<-nchar(train$text)
summary(nchar(train$text))
head(train[complete.cases(train),],2)
train %>% 
  select(text) %>% 
  filter()
for(i in 1:length(strsplit(train$text,split = ' '))){
  print(strsplit(train$text,split = ' ')[[i]])
}

trainstrsplit(train$text,split = ' ')
>