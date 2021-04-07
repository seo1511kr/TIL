smsraw<-read.csv('data/sms_spam_ansi.txt')
smsraw
str(smsraw)
smsraw$type<-factor(smsraw$type)
str(smsraw)


library(tm)
library(stringr)


# content_transformer()
# wrapping: 주어진 대상을 객체화 할 때, 적절한 함수를 처리할 수 
# 있는 형태의 generic한 객체로 만들어주는 작업

#tagging(태깅)
# 품사 태깅 SAMSUNG ->회사이름
# 단어 태깅 홍길동-> 이름

smsCorpus<-VCorpus(VectorSource(smsraw$text))
inspect(smsCorpus[1:3])
smsCorpus[[1]]
as.character(smsCorpus[[1]])
lapply(smsCorpus[1:5],as.character)

#소문자화
smstolower<-tm_map(smsCorpus,content_transformer(tolower))
smstolower[[5]]$content

#숫자제거
smsRMnum<-tm_map(smstolower,removeNumbers)
smsRMnum[[5]]$content

#불용어 제거
stopwords()
?stopwords
smsRMuseless<-tm_map(smsRMnum,removeWords,stopwords())
smsRMuseless[[5]]$content

#Punctuation 제거
smsRMpunct<-tm_map(smsRMuseless,removePunctuation)


a<-c('! " # $ % &',"' ( ) * + , - . / : ; < = > ? @ [ \ ] ^ _ ` { | } ~")
a<-paste(a,collapse = ' ')
a
removePunctuation(a)
replacePunctuation<-function(x){gsub('[[:punct:]]+',' ',x)}
replacePunctuation(a)

#어근화 stemming
#SnowballC :: wordStem()
library(SnowballC)
#개별 단어
wordStem(c('learns','learning'))
#문장 , 포터의 스테밍 알고리즘 적용
stemDocument('learns learning','english')

smsstemDocument<-tm_map(smsRMpunct,stemDocument)
smsstemDocument[[4]]$content
smsRMpunct[[4]]$content


#공백제거(여러개 공백 -> 하나로 변환)
smsRMwhitespace<-tm_map(smsstemDocument,stripWhitespace)

lapply(smsCorpus[1:3],as.character)
lapply(smsRMwhitespace[1:3],as.character)


#DTM:문서단위행렬, DocumentTermMatrix
#행에는 문서가 열에는 단어가
smsDtm<-DocumentTermMatrix(smsRMwhitespace)
smsDtm
# <<DocumentTermMatrix (documents: 5559, terms: 6557)>>
#   Non-/sparse entries: 42136/36408227 (채워진칸/총칸)
# Sparsity           : 100%  (공백률 거의 100프로)
# Maximal term length: 40  (가장 긴 문자수를 갖는 단어의 길이)
# Weighting          : term frequency (tf)


#문서간 유사도: 코사인유사도, TF-IDF유사도(LDA,LSA,...)
#TF-IDF 알고리즘: 문서간 유사도를 측정하는 알고리즘
#term frequency: 어떤 단어가 특정 문서내에서 얼마나 중요한
# 것인지를 나타내는 수치. 문서의 핵심어 파악 가능

# 코사인 유사도가 사용됨: 벡터사이의 각도만을 고려함
# cos(d1,d2)=(d1.d2)||d1||||d2||
# 두 벡터의 내적 곱하기 norm노름
# 내적이 클수록 공통된 부분이 많다는 뜻-> 방향의 일치성
# 각 벡터의 길이 ( 원소의 제곱의 합)-> 거리 정규화해서 통일
rownames(smsDtm[,])
inspect(smsDtm[1:3,])
inspect(smsDtm[1:3,50:60])


a<-c(1,1)
b<-c(3,6)
c<-c(1,3)


sum(a*c)/((sqrt(sum(a^2)))*(sqrt(sum(c^2))))
sum(b*c)/((sqrt(sum(b^2)))*(sqrt(sum(c^2))))


#corpus
# 문서1:먹고 싶은 사과
# 문서2:먹고 싶은 바나나
# 문서3:길고 노란 바나나
# 문서4:저는 과일이 좋아요
# 
# 
# #dtm
#       과일이 길고 노란 먹고 바나나 사과 싶은 저는 좋아요
# 문서1   0     0     0   1     0      1    1    0    0
# 문서2   0     0     0   1     1      0    1    0    0
# 문서3   0     1     1   0     2      0    0    0    0
# 문서4   1     0     0   0     0      0    0    1    1

#tf와 idf를 사용
#tf*idf(흔치 않게 사용되는 단어에 가중치 부여)가 높을수록 중요
# tf(d1,사과):1
# df:특정 단어 t가 등장한 문서의 수: 흔하게 사용되는 단어인지 판단
# df(과일이)=1, df(바나나)=2
# idf(d,t):df(t)에 반비례하는 수 즉 df가 작을수록 idf가 커짐
# 특정 문서에서만 자주 등장하는 단어는 idf가 높음
# idf(d,t)=log(n/(1+df(t))) 분모 0방지, n은 총 문서의 개수, log를 취해서 격차 줄여주기

#tf-idf값을 통해서 할 수 있는 것
# 1) cos유사도 구할 수 있음


smsDtmTrain<-smsDtm[1:4169,]
smsDtmTest<-smsDtm[4170:5559,]

smsTrainLabels<-smsraw[1:4169,]$type
smsTestLabels<-smsraw[4170:5559,]$type

prop.table(table(smsTrainLabels))
prop.table(table(smsTestLabels))

install.packages('wordcloud')
library(wordcloud)
wordcloud(smsRMwhitespace,min.freq=50, random.order=FALSE)
wordcloud(smsRMwhitespace,min.freq=50, random.order=TRUE)


spam<-subset(smsraw,type=='spam')
ham<-subset(smsraw,type=='ham')

wordcloud(spam$text,max.words=40,colors=brewer.pal(5,'YlGn'))
wordcloud(spam$text,max.words=40,colors=brewer.pal(5,'YlGn'))
wordcloud(ham$text,max.words=40,colors=brewer.pal(5,'RdYlGn'))
wordcloud(ham$text,max.words=40,colors=brewer.pal(5,'Greens'))

#sparse term을 제거해주는 함수(0이 가장 많은애들)
smsDtmFreqTrain<-removeSparseTerms(smsDtmTrain,0.95)
smsDtmFreqTrain

smsFreqWords<-findFreqTerms(smsDtmTrain,5)
str(smsFreqWords)


smsDtmFreqTrain<-smsDtmTrain[,smsFreqWords] #4169*1137
smsDtmFreqTest<-smsDtmTest[,smsFreqWords]#1390*1137

convertCounts<-function(x){
  x<-ifelse(x>0, 'Yes',' No')
}
smsTrain<-apply(smsDtmFreqTrain,MARGIN=2,convertCounts)
smsTrain

smsTest<-apply(smsDtmFreqTest,MARGIN=2,convertCounts)
smsTest

str(smsTrain)
smsTrain[1]
smsTrain[4169]

#나이브베이즈 패키지 설치 & 로드
install.packages('e1071')
library(e1071)
smsClassifier<-naiveBayes(smsTrain,smsTrainLabels)
smsClassifier2<-naiveBayes(smsTrain,smsTrainLabels, laplace = 1)

#테스트데이터 -> 모델 -> 예측(분류) 결과
smsTestPred<-predict(smsClassifier,smsTest)
smsTestPred2<-predict(smsClassifier2,smsTest)

smsTestPred#예측
smsTestLabels#정답
library(gmodels)
CrossTable(smsTestPred,smsTestLabels)
CrossTable(smsTestPred2,smsTestLabels)
