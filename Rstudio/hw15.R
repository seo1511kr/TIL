smsraw<-read.csv('data/sms_spam_ansi.txt')

install.packages('tm')
library(tm)
library(stringr)


str(smsraw)
smsraw$text
smsCorpus<-VCorpus(VectorSource(smsraw$text))


smsCorpus[[1]]
as.character(smsCorpus[[1]])
smsCorpus[[1]]$content
inspect(smsCorpus)
summary(smsCorpus)
smsCorpus

lapply(inspect(smsCorpus[1:5]),as.character)
sapply(inspect(smsCorpus[1:5]),as.character)


# 1. 수치 데이터 추출 & 제거
sms_digit<-str_extract_all(smsraw$text,'[[:digit:]]+')
unlist(sms_digit)

smsCorpus_digit<-tm_map(smsCorpus,removeNumbers)
tm_map(smsCorpus,content_transformer(removeNumbers))

# 2. 불용어 제거
stopwords()
stopwords('en')
stopwords('SMART')
# lapply와 str_remove_all로 제거
pat<-str_c(stopwords(),collapse = ' )|(\\b')
pat<-paste('(\\b',pat,' )',sep='')

lsmsCorpusClean_check<-lapply(smsCorpus_digit,str_extract_all,pat)
lsmsCorpusClean<-lapply(smsCorpus_digit,str_remove_all,pat)

lsmsCorpusClean_check[[999]]
smsCorpus_digit[[999]]$content
lsmsCorpusClean[[999]]

# tm_map(,removeWords)으로 제거
smsCorpus_stop<-tm_map(smsCorpus_digit,removeWords,stopwords())


# 3. 대소문자 통일
smsCorpus_tolower<-tm_map(smsCorpus_stop,content_transformer(tolower))


# 4. 특수문자 제거
smsCorpus_punct<-tm_map(smsCorpus_tolower,removePunctuation)
smsCorpus_punct1<-tm_map(smsCorpus_tolower,content_transformer(function(x){str_replace_all(x,'[^[:alnum:] ]','')}))

smsCorpus_punct_check<-tm_map(smsCorpus_tolower,content_transformer(function(x){str_extract_all(x,'[^[:alnum:] ]','')}))

lapply(smsCorpus_punct_check,as.character)
smsCorpus_tolower[[935]]$content
smsCorpus_punct_check[[935]]$content
smsCorpus_punct1[[935]]$content


# 5. 단어 길이가 2미만을 제거
smsWords<-unlist(lapply(smsCorpus_punct1,str_extract_all,boundary('word')))
sms2over<-smsWords[str_length(smsWords)>=2]

# 6. 전체 단어중에서 가장 많이 등장한 단어?
#   내림차순 정렬 10개 추출
sort(table(sms2over),decreasing = T)[1:10]
# ***wordnet 이용하여 동의어/반의어/상위/하위어
# ex) daddy, father,... => father
