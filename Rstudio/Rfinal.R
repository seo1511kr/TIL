install.packages('arules')
insurance=read.csv('data/insurance.csv')
str(insurance)

table(insurance$region)

#독립변수와 종속변수의 관계
cor(insurance[c('age','bmi','children','expenses')])


#산포도 행렬
pairs(insurance[c('age','bmi','children','expenses')])


#psych
install.packages('psych')
library(psych)
pairs.panels(insurance[c('age','bmi','children','expenses')])

#문자도 자체적으로 더미코딩 수행
#sexmale,sexfemale 이름 설정 변수 생성  (0,1)값 대입
model<-lm(expenses ~ age+children+sex+smoker+region, data=insurance)
summary(model)
# Multiple R-squared:  0.7245
# F-statistic: 499.8 on 7 and 1330 DF,  p-value: < 2.2e-16