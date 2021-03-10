#주소로부터 버섯 데이터 다운로드
url<-'https://archive.ics.uci.edu/ml/machine-learning-databases/mushroom/agaricus-lepiota.data'
download.file(url=url,destfile = 'data/mushroom.csv')

#버섯 데이터 읽기
# 1. cap-shape: bell=b,conical=c,convex=x,flat=f, knobbed=k,sunken=s
# 2. cap-surface: fibrous=f,grooves=g,scaly=y,smooth=s
# 3. cap-color: brown=n,buff=b,cinnamon=c,gray=g,green=r, pink=p,purple=u,red=e,white=w,yellow=y
# 4. bruises?: bruises=t,no=f
# 5. odor: almond=a,anise=l,creosote=c,fishy=y,foul=f, musty=m,none=n,pungent=p,spicy=s
# 6. gill-attachment: attached=a,descending=d,free=f,notched=n
# 7. gill-spacing: close=c,crowded=w,distant=d
# 8. gill-size: broad=b,narrow=n
# 9. gill-color: black=k,brown=n,buff=b,chocolate=h,gray=g, green=r,orange=o,pink=p,purple=u,red=e, white=w,yellow=y
# 10. stalk-shape: enlarging=e,tapering=t
# 11. stalk-root: bulbous=b,club=c,cup=u,equal=e, rhizomorphs=z,rooted=r,missing=?
#   12. stalk-surface-above-ring: fibrous=f,scaly=y,silky=k,smooth=s
# 13. stalk-surface-below-ring: fibrous=f,scaly=y,silky=k,smooth=s
# 14. stalk-color-above-ring: brown=n,buff=b,cinnamon=c,gray=g,orange=o, pink=p,red=e,white=w,yellow=y
# 15. stalk-color-below-ring: brown=n,buff=b,cinnamon=c,gray=g,orange=o, pink=p,red=e,white=w,yellow=y
# 16. veil-type: partial=p,universal=u
# 17. veil-color: brown=n,orange=o,white=w,yellow=y
# 18. ring-number: none=n,one=o,two=t
# 19. ring-type: cobwebby=c,evanescent=e,flaring=f,large=l, none=n,pendant=p,sheathing=s,zone=z
# 20. spore-print-color: black=k,brown=n,buff=b,chocolate=h,green=r, orange=o,purple=u,white=w,yellow=y
# 21. population: abundant=a,clustered=c,numerous=n, scattered=s,several=v,solitary=y
# 22. habitat: grasses=g,leaves=l,meadows=m,paths=p, urban=u,waste=w,woods=d

mush<-read.csv('data/mushroom.csv',na.string='?',header = F)
colnames(mush)<-c('label','cap-shape','cap-surface','cap-color','bruises?',
                  'odor','gill-attachment','gill-spacing','gill-spacing',
                  'gill-size','gill-color','stalk-shape','stalk-root',
                  'stalk-surface-above-ring','stalk-color-above-ring',
                  'stalk-color-below-ring','veil-type','veil-color','ring-number',
                  'ring-type','spore-print-color','population','habitat')
str(mush)

#전처리(결측값)stalk-shape
library(Amelia)
missmap(mush,col=c('red','blue'))
idx<which(names(mush)=='stalk-shape')
N_na<-nrow(mush[is.na(mush[,'stalk-shape']),-idx])
target<-t(mush[!is.na(mush[,'stalk-shape']),-idx])
Na_predict<-c()
for(i in 1:N_na){
  na_sample<-unlist(mush[is.na(mush[,'stalk-shape']),-idx][i,,drop=T])
  ans<-target==na_sample
  similar_idx<-as.numeric(sort(colSums(ans),decreasing = T)[1:5])
  Na_predict<-c(Na_predict,names(sort(table(mush[similar_idx,idx]),decreasing = T))[1])
}
mush[is.na(mush[,'stalk-shape']),idx]<-Na_predict
sum(!complete.cases(mush))


#문자-> 수치변환 어떠한 규칙으로 할 것인가?
#종류가 2개 이상이고 순서가 없다면 onehotencoding실시

str(mush)
features<-colnames(mush)[-1]
for(feature in features){
iter<-unique(mush[[feature]])
for(i in iter){
new_col<-paste(feature,i,sep='')
mush[new_col]<-ifelse(mush[feature]==i,1,0)
}
}
colnames(mush)

end<-ncol(mush)
mushOnehot<-mush[c(1,24:end)]
str(mushOnehot)
head(mushOnehot)

#train/test 분할
len<-nrow(mushOnehot)
set.seed(1234)
sample_idx<-sample(1:len,len*0.3)
train<-mushOnehot[-sample_idx,-1]
test<-mushOnehot[sample_idx,-1]

train_labels<-mushOnehot[-sample_idx,1]
test_labels<-mushOnehot[sample_idx,1]

library(class)
predict_labels<-knn(train,test,
                    cl=train_labels,k=5)
library(gmodels)
CrossTable(x=test_labels,y=predict_labels)
sum(test_labels==predict_labels)/length(test_labels) #[1] 0.9991793

