email<-read.csv('data/email_title.txt',header = FALSE)
email$V1<-factor(email$V1)
str(email)
library(tm)
emailCorpus<-VCorpus(VectorSource(email$V2))



over2<-function(x){
  gsub('\\b[[:alpha:]] ',' ',x)
}
over2('I am a boy')



CorpusLen<-tm_map(emailCorpus,content_transformer(over2))

CorpusNum<-tm_map(CorpusLen,removeNumbers)

CorpusPunct<-tm_map(CorpusNum,removePunctuation)

CorpusLower<-tm_map(CorpusPunct,content_transformer(tolower))

CorpusUseless<-tm_map(CorpusLower,removeWords,stopwords())

CorpusRMspace<-tm_map(CorpusUseless,stripWhitespace)
#어근화
library(SnowballC)
CorpusFinal<-tm_map(CorpusRMspace,stemDocument,'english')


#wordcloud 시각화
library(wordcloud)
wordcloud(CorpusFinal,min.freq=20,random.order = F)
wordcloud(CorpusFinal,min.freq=20,random.order = F,colors =brewer.pal(5,'Greens'))
wordcloud(CorpusFinal,min.freq=20,random.order = F,colors =brewer.pal(5,'YlGn'))
wordcloud(CorpusFinal,min.freq=20,random.order = F,colors =brewer.pal(5,'RdYlGn'))


#DTM
emailDTM<-DocumentTermMatrix(CorpusFinal)
str(emailDTM)

Freqwords2<-findFreqTerms(emailDTM,2)
Freqwords3<-findFreqTerms(emailDTM,3)
Freqwords5<-findFreqTerms(emailDTM,5)

set.seed(1234)
sample_idx<-sample(1:22,22*0.7,replace = F)

dtmFreqTrain2<-emailDTM[-sample_idx,Freqwords2]
dtmFreqTest2<-emailDTM[sample_idx,Freqwords2]

dtmFreqTrain3<-emailDTM[-sample_idx,Freqwords3]
dtmFreqTest3<-emailDTM[sample_idx,Freqwords3]

dtmFreqTrain5<-emailDTM[-sample_idx,Freqwords5]
dtmFreqTest5<-emailDTM[sample_idx,Freqwords5]


transCount<-function(x){
  x<-ifelse(x>0,'Yes','No')
}
emailTrain2<-apply(dtmFreqTrain2,2,transCount)
emailTest2<-apply(dtmFreqTest2,2,transCount)

emailTrain3<-apply(dtmFreqTrain3,2,transCount)
emailTest3<-apply(dtmFreqTest3,2,transCount)

emailTrain5<-apply(dtmFreqTrain5,2,transCount)
emailTest5<-apply(dtmFreqTest5,2,transCount)

str(emailTrain2)
emailTrain2[1]

Train_label<-email$V1[-sample_idx]
Test_label<-email$V1[sample_idx]

#나이브 베이즈
#모델 생성
library(e1071)

BayesClassifier21<-naiveBayes(emailTrain2,Train_label)
BayesClassifier22<-naiveBayes(emailTrain2,Train_label,laplace=1)


BayesClassifier31<-naiveBayes(emailTrain3,Train_label)
BayesClassifier32<-naiveBayes(emailTrain3,Train_label,laplace=1)

BayesClassifier51<-naiveBayes(emailTrain5,Train_label)
BayesClassifier52<-naiveBayes(emailTrain5,Train_label,laplace=1)


#예측
Predict_label21<-predict(BayesClassifier21,emailTest)
Predict_label22<-predict(BayesClassifier22,emailTest)

Predict_label31<-predict(BayesClassifier31,emailTest)
Predict_label32<-predict(BayesClassifier32,emailTest)

Predict_label51<-predict(BayesClassifier51,emailTest)
Predict_label52<-predict(BayesClassifier52,emailTest)



#교차표 검증
library(gmodels)
CrossTable(Predict_label21,Test_label)
CrossTable(Predict_label22,Test_label)


CrossTable(Predict_label31,Test_label)
CrossTable(Predict_label32,Test_label)


CrossTable(Predict_label51,Test_label)
CrossTable(Predict_label52,Test_label)


#============================================================
#코사인유사도
#말뭉치 만들기
library(stringr)
library(tm)
text<-c("먹고 싶은 사과","먹고 싶은 바나나","길고 노란 바나나 바나나","저는 과일이 좋아요")
docs<-data.frame(text)
rownames(docs)<-paste('문서',1:4,sep='')
str(docs)

docsCorpus<-VCorpus(VectorSource(docs$text))
inspect(docsCorpus[1:4])
#============================================================
#DTM 만들기
#wordLengths 기본 옵션이 3인듯
DTM_docs<-DocumentTermMatrix(docsCorpus,control = list(wordLengths=c(2,Inf)))
inspect(DTM_docs)
DTM_docs<-as.matrix(DTM_docs)
dimnames(DTM_docs)

#============================================================
# 코사인 유사도 행렬

cos_simil<-function(x){
nums=nrow(x)
simil_mat<-matrix(0,nums,nums)
for(i in 1:nums){
  norms<-apply(x,1,function(x){
    sqrt(sum(x^2))
  })
  prod<-apply(t(x)[,i]*t(x),2,sum)
  simil_mat[i,]<-prod/(norms[i]*norms)
  }
return(simil_mat)
}


cos_simil(DTM_docs)


# 코사인 유사도 행렬
# [,1]      [,2]      [,3]   [,4]
# [1,] 1.0000000 0.6666667 0.0000000    0
# [2,] 0.6666667 1.0000000 0.4714045    0
# [3,] 0.0000000 0.4714045 1.0000000    0
# [4,] 0.0000000 0.0000000 0.0000000    1

#============================================================
#tf_idf 구하기
#df: 특정단어가 등장한 문서의 개수
#idf:log(n/(df+1))
tf_idf<-function(x){
df<-colSums(ifelse(x>0,1,0))
nums<-nrow(x)
idf<-log(nums/(df+1))
return(round(t(t(x)*idf),4))
}

#============================================================
#최고 유사도 찾기(본인제외)
temp<-tf_idf(DTM_docs)
temp_cos<-cos_simil(temp)

temp_cos[!(lower.tri(temp_cos)|upper.tri(temp_cos))]<-0
value<-apply(temp_cos,1,max)
similar<-paste(1:4,apply(temp_cos,1,which.max),sep=',')
ans<-data.frame(mostSimilar=similar,similarity=value)
ans

#    mostSimilar similarity
# 1         1,2  0.4133486
# 2         2,1  0.4133486
# 3         3,2  0.2922816
# 4         4,1  0.0000000