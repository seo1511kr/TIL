##### 1. 여러 기준으로 정렬하기

order by 기준1 desc/asc, 기준2 desc/asc

##### 2. 중복 제거하기

select count(distinct name) count

from animal_ins

##### 3. 순서 지정하기 order by field()

order by field(열, 항목1, 항목2, ..)

##### 4. group by에 having + and, or, not,..

SELECT name, count(name) as 'count'
from animal_ins
group by name
having count(name) >= 2 and name is not null
order by name

##### 4. 입양 시각 구하기 (사용자변수 설정 set @변수명:=값;)

set @hour:=-1;
select (@hour:=@hour+1) hour, (select count(*) from animal_outs where hour(datetime) =@hour) COUNT
from animal_outs
where @hour < 23



##### 5. join(inner,join left, join right)  + ifnull(value1,value2 ):



##### 6.outer join: <>활용

select a.id, a.title, b.name

from testa as a

join  testb as b

on a.id<>b.id;