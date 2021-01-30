# 1. 빗변길이 구하기
# x,y=map(int,input().split(" "))
# if (x>0) and (y>0):
#     ans=(x**2+y**2)**(1/2)
# else: ans="삼각형이 아닙니다."
# print(ans)



# # 2. 뉴스 클러스터링(어려움)-유유상종
#
# # str1		str2		answer
# # FRANCE		french		16384
# # handshake	shake hands	65536
# # aa1+aa2		AAAA12		43690
# # E=M*C^2	e=m*c^2		65536
#
str1="E=M*C^22"
str2="e=m*c^2"

def jacc_coef(str1,str2):
    str1=str1.lower()
    str2=str2.lower()
    import re
    short=[str1[i:i+2] for i in range(len(str1)-1) if re.match("^[a-z]+$",str1[i:i+2])]
    long=[str2[j:j+2] for j in range(len(str2)-1) if re.match("^[a-z]+$",str2[j:j+2])]

    len_long=len(long)
    len_short=len(short)
    if (len_short==0) and (len_long==0):return 65536
    else:
        import copy
        if len_short > len_long: # 짧은 걸 찾아서 짧은 걸 기준으로 교집합을 찾아서 시간단축?
            short,long = long,short
        long_diff = copy.copy(long)

        inter_cnt=0
        for i in range(len(short)):
            try:
                long_diff.remove(short[i])
                inter_cnt+=1
            except:pass
        union_cnt=len_long+len_short-inter_cnt
 #교집합, 합집합을 직접 찾아서 저장하여 연산하는 것보다 +-계산으로 구하는 것이 빠르다고 생각했음
        jaccard=int((inter_cnt/union_cnt)*65536)
        return jaccard
print(jacc_coef(str1,str2))




# def JaccardSim(s1,s2):
#     s1=s1.lower()
#     s2=s2.lower()
#     a=[]
#     b=[]
#     for i in range(len(s1)-1):
#         if s1[i:i+2].isalpha()==True:
#             a.append(s1[i:i+2])
#     for j in range(len(s2)-1):
#         if s2[j:j+2].isalpha()==True:
#             b.append(s2[j:j+2])
#     inter=[i for i in a if i in b]
#     union=[x for x in a+b if x not in inter]+inter
#     if union == []:
#         return 65536
#     return int(len(inter)/len(union)*65536)
#
# print(JaccardSim("aa","e=m*c^2"))

