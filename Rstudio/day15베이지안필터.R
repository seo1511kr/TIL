# 나이브 베이즈 -> 이메일 분류기, 보안(비정상 접근자 탐지), 의학적 질병 진단
# 베이지안 기법 - 베이지안 확률 이론 활용, 복수 시행에서 즉시 이용할 수 있는
# 증거를 바탕으로 추정해야 한다는 아이디어.
# 사건확률: 사건이 발생한 시행 횟수/ 전체 시행 횟수
# 사전확률: 이전까지 메시지가 스팸일 확률 20% -> 지금받은 메시지가 스팸일 확률 20%
# 우도: p(나이트|스팸)
# 사후확률: '나이트'라는 단어가 포함된 메일을 받았을 때 그 메일이 스팸일 확률.
# p(스팸|나이트)
# (우도 * 사전확률/주변우도)
# 
# 주의:
# 우도를 구할때 0이 나오면 오류가 나올 수 있으니 스팸에 하나라도
# 들어가 있는 요소로 지정해야함
# 
# 라플라스 추정량: 모든 데이터에 +1 , 스팸의 도수도 더해진 만큼 증가함
# 
# 빈도표와 우도표를 먼저 만들기


# 요즘은 bert가 가장 잘 분류함

#자연어 전처리
#대소문자 처리, puctuation처리, 어미들
#동음이의어에대한 처리(굉장히 어려움)
#동의어에대한 처리 -> 워드넷(동의어, 반의어, 상위어, 하위어)
#(한글은 형태소분석 해야함)
#토큰화-> 단어들을 원형으로 만들기
#불용어 to, and, are, the, a 분류 목적에 의미가 없는 단어들 제외하기



#실습
smsraw<-read.csv('data/sms_spam_ansi.txt')
smsraw
str(smsraw)
smsraw$type<-factor(smsraw$type)
str(smsraw)

#텍스트마이닝을 위한 패키지 설치
install.packages('tm')
library(tm)
# help -> tm검색 ->tm::tm 

#corpus: 말뭉치(특정 분야에 해당하는 단어들의 모음 )

library(stringr)
mytext<-c('software environment','software  environment','software\tenvironment')
mytext

str_split(mytext,' ')

sapply(str_split(mytext,' '),length) # 단어의 수
sapply(str_split(mytext,' '),str_length) # 글자 수 (마지막보면 \t 하나로 인식함)

#공란처리 어떻게?

mytext.nowhitespace<-str_replace_all(mytext,'[[:space:]]{1,}',' ')
mytext.nowhitespace


sapply(str_split(mytext.nowhitespace,' '),length)
sapply(str_split(mytext.nowhitespace,' '),str_length)

mytext<-"The 45th President of the United States, Donald Trump, states that he knows how to play trump with the former president"
#대소문자 통일 ->사람, 게임이름 구분하려면?
#일반적인 방법: Donald Trump 하나의 단어로 묶기(replace)

myword<-unlist(str_extract_all(mytext,boundary('word')))
table(myword)
myword<-str_replace(myword,'Trump','Trump_unique_')
myword<-str_replace(myword,'States','States_unique_')
myword

table(tolower(myword))

mytext <- c("He is one of statisticians agreeing that R is the No. 1 statistical software.","He is one of statisticians agreeing that R is the No. one statistical software.")
str_split(mytext,' ')

str_replace_all(mytext,'[[:digit:]]{1,}[[:space:]]{1,}','')
#0-9숫자 하나 이상 + 공백문자&\t 1개이상
# 첫문장 no.1에서 1 사라짐

mytext2<-str_split(str_replace_all(mytext,'[[:digit:]]{1,}[[:space:]]{1,}',''),' ')
mytext2
mytext2[[1]]

#str_c문자합칠떄 쓰는 함수
str_c(mytext2[[1]],collapse = ' ')
str_c(mytext2[[2]],collapse= ' ')


mytext3<-str_split(str_replace_all(mytext,'[[:digit:]]{1,}[[:space:]]{1,}','_number_'),' ')
str_c(mytext3[[1]],collapse = ' ')
str_c(mytext3[[2]],collapse= ' ')
#치환해도 오히려 모호해짐 (문장의 의미 변질시킬수있다)

mytext <- "Kim et al. (2014) argued that the state of default-setting is critical for people to protect their own personal privacy on the Internet."
str_split(mytext,' ')

str_split(mytext,'\\. ')
# al. -> 의미를 갖는단어 -> .사라지면 의미변질 

str_replace(mytext)
mytext2<-str_replace_all(mytext,'-',' ')
mytext2

#불용어(stopwords):, a,am,the 빈번하게 사용되지만, 의미는 찾기 어려운단어
#she is an actor, she is the actor -> the actor이 더 강조의미
#an, the 제거할시 강조의 의미 사라짐 

#불용어 사전 설정 및 제거 (a,an,the)
mytext<-c('She is an actor','She is the actor')
mystopwords<-'(\\ba )|(\\ban )|(\\bthe )'
str_remove_all(mytext,mystopwords)

#tm 라이브러리에 설정된 기본 stopwords
stopwords('en') # 타입 벡터
# 추가, 제거 가능함
stopwords('SMART')


#어근 동일화 작업
various_be<-'(\\b(a|A)m )|(\\b(a|A)re )|(\\b(i|I)s )|(\\b(w|W)as )|(\\b(w|W)ere )'

mytext<-c("I am a boy. You are a boy. The person might be a boy. Is Jane a boy? ")

mystemmer.func<-function(myt){
  mytext<-str_replace_all(myt, various_be,'be ')
  print(mytext)
}

mystemmer.func(mytext)


mytext <- "The United States comprises fifty states. In the United States, each state has its own laws. However, federal law overrides state law in the United States."

str_extract_all(mytext,boundary('word'))
mytext<-unlist(str_extract_all(mytext,boundary('word')))
table(mytext)
length(table(mytext))
sum(table(mytext))

#동사:가고, 가니, 간... -> stemming 작업 필요

#대한민국에
#대한민국은 
# 조금이라도 다르면 완전 다른 단어로 인식함 
# n-gram 이용 ->
#n=2 대한,한민,민국,국에
# 대한, 한민,민국,국은
# -> 거의 두 단어가 같다고 해석(75%)

mytext <- "The United States comprises fifty states. In the United States, each state has its own laws. However, federal law overrides state law in the United States."
myword<-unlist(str_extract_all(mytext,boundary('word')))
Th
mytext.2gram<-str_replace_all(mytext,"\\bUnited States","United_States")
# "\\b(t|T)he United States ", "The_United_States"

mytext.2gram

myword2<-unlist(str_extract_all(mytext.2gram,boundary('word')))
table(myword2)
length(table(myword2))


#말뭉치: VCorpus 함수를 이용하여 구성

my.text.location<-"ymbaek_papers"
str(smsraw)
str(smsraw)
mypaper

summary(mypaper)

mypaper[[2]] #메타데이터가 7개, 글자수 990개
mypaper[[2]]$content #내용
mypaper[[2]]$meta # 메타 정보
# 메타정보 추가 가능

meta(mypaper[[2]],tag='author')<-"Y. M. Baek"
mypaper[[2]]$meta
meta(mypaper[[2]])

class(mypaper)
mypaper[[2]]

myfunc<-function(x){ #단어+특수문자+단어 패턴에 해당되는 단어를 추출
  str_extract_all(x$content,'[[:alnum:]]+[[:punct:]][[:alnum:]]+')
}
lapply(mypaper,myfunc)

mypuncts<-lapply(mypaper,myfunc)
# mypaper$content

table(unlist(mypuncts))

#대문자로 시작하는 단어들에 대해 빈도수 조사
LETTERS
cap<-function(x){
  str_extract_all(x$content,'[[:upper:]][[:alpha:]]+')
}
myuppers<-lapply(mypaper,cap) 
table(unlist(myuppers))
#숫자로만 표시된 자료 빈도수 조사
number<-function(x){
  str_extract_all(x$content,'[[:digit:]]{1,}')
}
mydigits<-lapply(mypaper,number) 
table(unlist(mydigits))



#tm_map 함수

str(smsraw)
#코퍼스 생성
smsCorpus<-VCorpus(VectorSource(smsraw$text))
smsCorpus # 한줄 한줄이 문서 하나로 읽어짐 (위에서는 파일 단위로)
smsCorpus[[1]]
smsCorpus[[1]]$content # 딱히 좋은방법 아님
inspect(smsCorpus[1:5])
as.character(inspect(smsCorpus[[1]]))
lapply(smsCorpus[1:2],as.character)

#소문자로 변경
smsCorpusClean<-tm_map(smsCorpus,content_transformer(tolower))
smsCorpusClean[[1]]$content
as.character(smsCorpusClean[[1]])

as.character(smsCorpus[[1]])

#tm_map함수 
#코퍼스에 대해 전처리(변환작업)를 수행하는 함수 
# ex) tm_map(smsCorpus,content_transformer(tolower))
#smsCorpus에 대해 tolower(변환) 수행

res<-tm_map(smsCorpus,removeNumbers)
# smsCorpus에서 removeNumbers함수를 적용하여 숫자를 모두 제거
res[[4]]$content  # 숫자 제거됨 

res<-tm_map(smsCorpus,content_transformer(removeNumbers))
res[[4]]$content # 숫자 제거됨 


res<-tm_map(smsCorpus,tolower)
res[[1]]$content # tolower 함수는 이렇게 하면 error

# help> tm_map > see also클릭했을때 보이는 함수 5개만 content_transformer 없이 쓸수있음
# 함수 단독 사용 또는 content_transformer()안에 작성하여 사용가능
# 5개 제외한 나머지 함수는 content_transformer 안에 작성해야만 사용 가능 -> 단독 사용 불가능


#소문자 변환
smsCorpusClean<-tm_map(smsCorpus,content_transformer(tolower))
smsCorpusClean[[1]]$content

#특수문자제거
smsCorpusClean<-tm_map(smsCorpusClean,removePunctuation)
smsCorpusClean[[4]]$content

#stopwords제거
stopwords()
smsCorpusClean<-tm_map(smsCorpusClean,removeWords,stopwords())
smsCorpusClean[[4]]$content

#. 제거하는 방법들
#방법1
removePunctuation('hello...RP')

#방법2
remPunct<-function(x){
  gsub("[^[:alnum:] ]","",x)
}
remPunct('hello... RP')

#방법3
install.packages('SnowballC')
library(SnowballC) # 동사 원형만 추출
wordStem(c('run','runs','running'))
wordStem(c('learn','learns','learning','learned'))
