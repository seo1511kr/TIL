SHOW DATABASES;
USE world;

SHOW TABLES;
SHOW TABLE STATUS;

DESCRIBE city;
DESC country;
DESC countrylanguage;

SELECT * FROM city;
SELECT Name FROM city;

SELECT Name,Population FROM city
WHERE Population >= 8000000;

SELECT Name,Population FROM city
WHERE Population < 8000000;

SELECT * FROM city
WHERE Population < 8000000
AND Population > 7000000;

DESC city;
SELECT *
FROM city
where CountryCode = 'KOR'
and population >= 1000000;

SELECT *
FROM city
where Population Between 700000 and 8000000;

SELECT *
FROM city
where name in('Seoul','New York', 'Tokyo');


SELECT *
FROM city
where CountryCode in('KOR','USA', 'USA');

SELECT *
FROM city
where CountryCode LIKE 'KO_';

SELECT *
FROM city
where NAME LIKE 'TEL %';

SELECT *
FROM city
where CountryCode = ( select CountryCode
					  from city
					  where name = 'Seoul');


SELECT *
FROM city
where Population > ANY ( select Population
					  from city
					  where District = 'New York');

SELECT *
FROM city
where Population > SOME ( select Population
					  from city
					  where District = 'New York');

SELECT *
FROM city
where Population > ANY ( select Population
					  from city
					  where District = 'New York');
                      
SELECT *
FROM city
where Population > ALL ( select Population
					  from city
					  where District = 'New York');
                      
                      
SELECT *
FROM city
order by population;

SELECT *
FROM city
order by population desc;

SELECT *
FROM city
order by countrycode asc, population desc;


SELECT *
FROM city
where countrycode = 'KOR'
order by population desc;








select *
from city
where countrycodecityID='kor'
order by population desc;

select *
from country
order by surfacearea desc;

select countrycode
from city;

select distinct countrycode
from city;

select *
from city
order by population desc
limit 10;


select countrycode, Max(population)
from city
group by countrycode;

select countrycode, min(population)
from city
group by countrycode;

select countrycode, avg(population) as 'average'
from city
group by countrycode;


select count(*)
from city;

select avg(population)
from city;


#group by, with rollup, having===========================
select countrycode, max(population)
from city
group by countrycode
having max(population) > 8000000;

select countrycode, name, sum(population)
from city
group by countrycode, name with rollup;


# join on==============================================
select *
from city
join country on city.countrycode = country.code;

select *
from city
join country on city.countrycode = country.code
join countrylanguage on city.countrycode=countrylanguage.countrycode;


select length('asdfdsf');
select concat('asdfdsf','dsd','sdsd');
select concat('asdfdsf','dsd',NULL);
select locate('abc','ababcabcabca');
select left('my sql is open source relational datasbase',5);
select right('my sql is open source relational datasbase',5);
SELECT	lower('MYSQL');
SELECT	UPPER('MYSQL');
SELECT	replace('MYSQL','MY','YOUR');

SELECT	trim('  kk  '),
trim(leading '#' from '##dfsdf#'),
trim(trailing '#' from '##dfsdf#');

select format(123123123123.123123,6),
format(123123123123.123123,3);

select floor(10.95), ceil(10.95),round(10.95);

select sqrt(4), pow(2,3), exp(3), log(3);

select sin(pi()/2), cos(pi()/2), tan(pi()/2);

select abs(-3), rand(), round(rand()*100,0);

select now(), curdate(), curtime();
select date(now()), month(now()), day(now()), hour(now()), minute(now()), second(now());
select monthname(now()), dayname(now());
select dayofmonth(now()), dayofweek(now()), dayofyear(now());
select date_format(now(), '%D %a %y %m %n %j');

create table city3 as select * from city;
select * from city3;

create database suan;
use suan;
select * from test;



# create , alter, drop ===================================================
create table test2(
id int not null primary key,
col1 int null,
col2 float null,
col3 varchar(45) null
);

select * from test2;

alter table test2
add col4 int null;

select * from test2;
desc test2;


alter table test2
modify col4 varchar(20) null;

show index from test;

alter table test
drop index col3tdx;

drop index col2idx on test;

show index from test;

create view testview as
select col1,col2
from test;

select * from testview;

alter view testview as
select col1,col2,col3
from test;

select * from testview;

drop view testview;


drop view allview;
create view allview as
select city.Name, country.SurfaceArea, city.Population, countrylanguage.language
from city
join  country on city.CountryCode=country.Code
join countrylanguage on city.CountryCode=countrylanguage.CountryCode
where city.countrycode='kor';

select * from allview;

use suan;
insert into test
value(1,123,1.1,'test');

select * from test;

# table 값 추가
insert into test2 select * from test;
select * from test2;

# table값 변경
update test
set col1=1, col2=1.0, col3='test'
where id=1;

select * from test;

#table값 삭제
delete from test
where id =1;

select * from test;
#테이블 용량은 줄어들지 않음, 되돌릴 수 있음

#테이블 데이터 완전히 삭제 복구 불가능
truncate table test;
select * from test;

#테이블 자체를 삭제 복구 불가능
drop table test;
select * from test;

drop database suan;
