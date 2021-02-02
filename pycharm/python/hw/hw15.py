# 1. 아마존 면접문제
#
# A사무실에는 특정일자의 출퇴근 시간이 기록된 거대한 로그파일이 있다고 한다.
#
# 파일의 형식은 다음과 같다. (한 라인에서 앞부분은 출근시간(HH:MM:SS), 뒷부분은 퇴근시간이다)
#
# 09:12:23 11:14:35
# 10:34:01 13:23:40
# 10:34:31 11:20:10
# 특정시간을 입력(예:11:05:20)으로 주었을 때 그 시간에 총 몇 명이 사무실에 있었는지 알려주는 함수를 작성하시오.

a='''
09:12:23 11:14:35
10:34:01 13:23:40
10:34:31 11:20:10
'''



with open("record.txt","w") as f:
    f.write(a)

def num_workers(when):
    with open("record.txt","r") as r:
        L=r.readlines()  #['\n', '09:12:23 11:14:35\n', '10:34:01 13:23:40\n', '10:34:31 11:20:10\n']
    import re
    worktime=[]
    for i in L:
        if re.findall("[\d:]+",i):
            worktime.append(re.findall("[\d:]+",i)) # [['09:12:23', '11:14:35'], ['10:34:01', '13:23:40'], ['10:34:31', '11:20:10']]
    def firstisbig(a,b):
        al=a.split(":") #출근[시,분,초] '09:12:23' => 09, 12, 23
        bl=b.split(":") #퇴근[시,분,초] '11:14:35' => 11, 14, 35
        for i in range(3):
            if int(al[i].lstrip("0")) >= int(bl[i].lstrip("0")): # 09 => 9
                res= True
                break
            elif int(al[i].lstrip("0")) == int(bl[i].lstrip("0")):
                res= True
            else:
                res= False
                break
        return res
    count=0
    worked=[]
    for i in worktime: # [['09:12:23', '11:14:35'], ['10:34:01', '13:23:40'], ['10:34:31', '11:20:10']]
        if firstisbig(when,i[0]) & firstisbig(i[1],when):
            count+=1
            worked.append(str(worktime.index(i)+1)+"번째 사람: 근무시간:{0}".format(i))
    return (count,"명",worked)

print(num_workers("10:05:20"))
print(num_workers("12:05:20"))
print(num_workers("13:05:20"))
print(num_workers("09:12:23"))
