# help(Epub)
# 
# data(Epub)
# summary(Epub)
# inspect(Epub[1:10])
# 
# 1.Epub데이터 연관규칙
# -support, confidence 설정
# -minlen=2
data(Epub)
summary(Epub)
# transactions as itemMatrix in sparse format with
# 15729 rows (elements/itemsets/transactions) and
# 936 columns (items) and a density of 0.001758755 

inspect(Epub[1:10])
itemFrequency(Epub[,1:10])
itemFrequencyPlot(Epub,support=0.01)
itemFrequencyPlot(Epub,topN=30)

image(sample(Epub,500,replace = F))

rule1<-apriori(Epub,list(support=0.001,confidence=0.2,minlen=2))
summary(rule1)



# 2. 정렬
# -lift, confidence, support

inspect(sort(rule1,by='lift')[1:20])  #{doc_6e7,doc_6e8} => {doc_6e9}
inspect(sort(rule1,by='support')[1:20]) #{doc_72f} => {doc_813}
inspect(sort(rule1,by='confidence')[1:20])
# 3. 연관규칙 부분집합
# -support
# -in, pin, ain
# - ex)

inspect(subset(rule1, items %in% c('doc_72f')))
inspect(subset(rule1, items %ain% c('doc_6e7','doc_6e8')))
inspect(subset(rule1, items %pin% c('6e')))
inspect(subset(rule1, lhs %pin% c('6e') & confidence>0.5))

install.packages('arulesViz')
library(arulesViz)
plot(rule1)
plot(sort(rule1, by = "support")[1:20], method = "grouped")

plot(sort(rule1, by = "support")[1:20], method = "graph",
     control = list(type='itemsets'))

rule1_df<-as(rule1,'data.frame')
rule1_df<-rule1_df %>% 
  mutate(IS=sqrt(lift*support)) %>% 
  arrange(-IS)
rule1_df[1:10,]

write(rule1,'rule1.csv',sep=',',quote=F,row.names=FALSE)

