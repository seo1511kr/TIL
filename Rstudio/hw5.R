# 1. Happy, Birthday, to, you로 구성된 텍스트 벡터 생성하시오
# -벡터의 길이 
# -문자 개수의 합
txt<-c('Happy', 'Birthday', 'to', 'you')
length(txt)
sum(nchar(txt))

# 2. 1번 문제 벡터를 모두 연결하시오("Happy Birthday to you")
# - 텍스트 벡터의 길이
# - 문자 개수의 합을 출력하시오
txt<-paste(txt,collapse = ' ')
length(txt)
nchar(txt)
 
# 3. patse함수와 LETTERS 상수 벡터를 이용하여 다음 문자 벡터 생성하시오
# - "A 1" "B 2" "C 3" "D 4" "E 5"
# -" A1" "B2" "C3" "D4" "E5"

paste(LETTERS[1:5],1:5)
paste(LETTERS[1:5],1:5,sep='')

# 4. 단어 단위로 분할하고, 모든 쉼표와 하이픈은 제거하시오.
# c("Yesterday is history,", "That's, why we call it the present - from Kung")
txt<-c("Yesterday is history,", "That's, why we call it the present - from Kung")
?split
txt<-gsub(pattern=',',replacement = '',txt)
txt<-gsub(pattern='-',replacement = '',txt)
txt

ltxt<-strsplit(txt,' ')
ltxt[[1]]
ltxt[[2]]
# 5. 주민번호 뒤 일곱 자리 수를 *로 모두 대체하시오
# "110101-1234123" "950102-2121212"
idnum<-c("110101-1234123" ,"950102-2121212")
idnum
pat<-substr(idnum,nchar(idnum)-6,nchar(idnum))
pat
gsub(pattern = pat[1],replacement = '*******',idnum[1])
gsub(pattern = pat[2],replacement = '*******',idnum[2])





idnum<-matrix(c("110101-1234123" ,"950102-2121212"))
idnum
apply(idnum,1,function(x){
  pat<-substr(x,nchar(idnum)-6,nchar(idnum))
  x<-gsub(pattern = pat,replacement = '*******',x)
  return(x)
}
)

# 6. paste함수와 month.abb를 결합하여 "Jan_1-Feb_2- ... Dec_12"를 생성하시오
num<-paste(1:12)
month.abb
paste(month.abb,num,sep='_')

# 7. read.csv(file="samsung.csv")
df<-read.csv(file="samsung.csv")
df
# 1) Open, High, Low, Close, Adj.Close, Volume 열을 추출
names(df)
str(df)

df[names(df)[2]]
df[names(df)[3]]
df[names(df)[4]]
df[names(df)[5]]
df[names(df)[6]]
df[names(df)[7]]


# 2) 각 열에 대해 최소값, 최대값, 평균, 표준편차 출력

apply(df[-1],2,min,na.rm=T)
apply(df[-1],2,max,na.rm=T)
apply(df[-1],2,mean,na.rm=T)
apply(df[-1],2,sd,na.rm=T)

# 3) 각 열에 대해 정규화 / 표준화
apply(df[-1],2,scale)
apply(df[-1],2,function(x){(x-min(x,na.rm=T))/(max(x,na.rm=T)-min(x,na.rm=T))}))

apply(df[-1],2,function(x){(x-min(x,na.rm=T))/(max(x,na.rm=T)-min(x,na.rm=T))})

# 4) Low 열과 High 열 각각에 대해 최대 낙차 출력
# - 낙차 =  Max(High(n-1)-High(n))  here, n은 특정일을 의미
lag<-rbind(df[2:249,3:4],0)
df<-df[,3:4]
head(df)
head(lag)
fall<-lag-df
apply(fall,2,max)

