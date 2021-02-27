### mysql(RDBMS: 관계형 데이터베이스 관리 시스템)

```
오픈소스, 다중사용자, 다중스레드 지원

php와 궁합이 좋음

```

#### DML(Data Manipulation Language)

```
데이터 조작 언어
선택,삽입, 수정, 삭제
테이블의 행 대상으로 수행
테이블이 사전에 정의
(SELECT INSERT UPGRADE DELETE)
```

#### DDL(Data Definition Language)

```
데이터 정의 언어
테이블, 뷰, 인덱스 등의 개체를 생성/삭제/변경
CAREATE DROP ALTER
```

#### DCL(Data Control Language)

```
GRANT REVOKE
```

```
SHOW DATABASES;

```

```
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

```

