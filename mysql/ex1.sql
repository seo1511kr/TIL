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
