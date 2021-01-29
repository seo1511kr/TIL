# 1. 레벤슈타인 알고리즘

#### * 문장 유사도 구할때 사용됨

```
편집거리 알고리즘 문자를 삽입, 삭제, 치환하여 
다른 문자열로 변형하는데 필요한 <최소> 횟수를 구하는 것
```

https://en.wikipedia.org/wiki/Levenshtein_distance



#### * 동적계획법(DP)기반으로 이뤄짐: 큰 문제를 부분으로 쪼개서 부분문제를 반복적으로 해결

```
피보나치 수열을 구할 때 이전 값2개를 더하면 된다는 것을 인지하고

3 계산된 값들을 계속 저장해나가면서 이전 값 2개만 더하는 연산을 반복해서 구하기
```



#### * 원리



![image-20210129095337668](Leben_distance.assets/image-20210129095337668.png)

```
str1 str2의 각 길이 +1에 해당하는 array를 만든 후

=> array의 각 칸의 값을 채워나가며 마지막 칸을 도출해내는 과정
```

![image-20210129095458001](Leben_distance.assets/image-20210129095458001.png)

min(deletion, insertion, substitution)으로 각 칸을 채워주기

#### * 코드 구현

<substitutionCost는 새로 추가되는 단어가 서로 같으면 0 틀리면 1>



![](Leben_distance.assets/image-20210129095413072.png)

#  2. N gram

* 자연어처리 도움되는 블로그

https://lovit.github.io/nlp/2018/10/23/ngram/


https://en.wikipedia.org/wiki/N-gram

#### 자연어 처리 분야(분류)에서 logistic regression과 주로 사용

```

문장이나 문서를 bag-of-words model 로 나타낼 때 일반적으로 unigram 이 이용됩니다. 

그런데 문서 분류 문제에서는 unigram 보다 bigram 이 정보력이 더 좋습니다. Bigram 은 연속된 두 개의 단어를 하나의 단어로 이용하는 것입니다. 그리고 연속된 n 개의 단어를 하나의 단어로 이용하는 것을 n-gram 이라 합니다. 그러나 데이터에 등장하는 모든 n-grams 를 이용하면 bag-of-words model 의 차원이 기하급수적으로 커집니다. 

출처: https://lovit.github.io/nlp/2018/10/23/ngram/
```

```
unigram: 재미
bigram: 재미+없는/ 재미+있는 
긍,부정 평가 등 분류의 영역에서 더 정확하고 많은 정보를 내포함
```

```
* 로우데이터를 형태소 분석기로 전처리 한 후 N-gram 적용.
  음성인식도 결국에는 NPL이나 다름없음
* konlpy라이브러리(형태소 분석기 종류: kkoran, okt 등등)
  =>konply.org
* API(실무에서 제일 많이쓰이는 것들)
1. Mecab Class
2. Okt Class
```

#### logistic regression(이항형)

```
* 회귀분석과의 공통점: 독립변수 <-> 종속변수(범주형)의 관계로 결과를 예측함
* 회귀분석과의 차이: 예측하고자 하는 결과의 데이터가 범주형자료인 경우 사용
* (성별:남자 or 여자) (진단결과:음성 or 양성) (사건발생여부:yes or no)(단어:긍정 or 부정)
```

```
* More
1. 종속변수(y)의 결과가 범위[0,1]로 제한된다는 것이고 
2. 종속 변수가 이진적 (True/False)
   조건부 확률(P(y│x))의 분포가 <정규분포> 대신 <이항 분포>를 따른다는 점이다.
```



#### bag-of-words model (BoW)

```
* 문자열을 분석할 때 단어의 등장 순서는 고려하지 않고
  <빈도수>만을 고려하는 방법

* 예시:

>>  문서1 : 정부가 발표하는 물가상승률과 소비자가 느끼는 물가상승률은 다르다.

>>  각 단어별 인덱스 부여(중복되는 단어는 포함하지 않음)
    ('정부': 0, '가': 1, '발표': 2, '하는': 3, '물가상승률': 4, '과': 5, '소비자': 6, 		'느끼는': 7, '은': 8, '다르다': 9)  

>>  BoW: [1, 2, 1, 1, 2, 1, 1, 1, 1, 1]  


```

```
# 파이썬 코드 출처:https://wikidocs.net/22650

from konlpy.tag import Okt
import re  
okt=Okt()  

token=re.sub("(\.)","","정부가 발표하는 물가상승률과 소비자가 느끼는 물가상승률은 다르다.")  
# 정규 표현식을 통해 온점을 제거하는 정제 작업입니다.  
token=okt.morphs(token)  
# OKT 형태소 분석기를 통해 토큰화 작업을 수행한 뒤에, token에다가 넣습니다.  

word2index={}  
bow=[]  
for voca in token:  
         if voca not in word2index.keys():  
             word2index[voca]=len(word2index)  
# token을 읽으면서, word2index에 없는 (not in) 단어는 새로 추가하고, 이미 있는 단어는 넘깁니다.   
             bow.insert(len(word2index)-1,1)
# BoW 전체에 전부 기본값 1을 넣어줍니다. 단어의 개수는 최소 1개 이상이기 때문입니다.  
         else:
            index=word2index.get(voca)
# 재등장하는 단어의 인덱스를 받아옵니다.
            bow[index]=bow[index]+1
# 재등장한 단어는 해당하는 인덱스의 위치에 1을 더해줍니다. (단어의 개수를 세는 것입니다.)  
print(word2index)  
```

