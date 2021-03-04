# 해시



# def solution(participant,completion):
#     dic=dict()


import collections
lst=['aa','cc','dd','aa','bb','ee']
print(collections.Counter(lst))
lst2=['aa','cc','dd','aa','bb','ee','bb']
print(collections.Counter(lst2))
print(list(collections.Counter(lst2)-collections.Counter(lst))[0])


print(hash('kim'))
