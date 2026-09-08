select name,
       substring(name,1,3) As name_prefix
from sakila.employees_messy;
Select department, 
SUBSTRING(TRIM(department), 1 , 5) AS department_prefix
from sakila.employees_messy;
select phone ,RIGHT(phone,4) AS phone_last_four
from sakila.employees_messy;
select city, upper(SUBSTRING (TRIM(City), 1, 2)) AS city_code
from sakila.employees_messy;
select status,SUBSTRING(status, 2 , 4)
from sakila.employees_messy;
SELECT name,
    SUBSTRING(TRIM(name), 1, INSTR(TRIM(name), ' ') - 1) AS first_name
FROM sakila.employees_messy
WHERE TRIM(name) LIKE '% %';
SELECT name,
    SUBSTRING(TRIM(name), INSTR(TRIM(name), ' ') + 1) AS last_name
FROM sakila.employees_messy
WHERE TRIM(name) LIKE '% %';
SELECT name,
       SUBSTRING_INDEX(TRIM(name), ' ', 1) AS first_name
FROM sakila.employees_messy;
SELECT name,
       SUBSTRING_INDEX(TRIM(name), ' ', -1) AS Last_name
FROM sakila.employees_messy;
SELECT email,
       SUBSTRING_INDEX(TRIM(email), '@', 1) AS email_username
FROM sakila.employees_messy
WHERE email LIKE '%@%';
SELECT email,
    SUBSTRING_INDEX(SUBSTRING_INDEX(email, '@', -1), '.', 1) AS email_domain
FROM sakila.employees_messy
WHERE email LIKE '%@%.%';
SELECT email,
    LOWER(SUBSTRING(email, INSTR(email, '@') + 1)) AS email_domain
FROM sakila.employees_messy
WHERE email LIKE '%@%';

SELECT email,
    SUBSTRING_INDEX(email, '.', -1) AS tld
FROM sakila.employees_messy
WHERE email LIKE '%@%' AND email LIKE '%.%';

SELECT phone,
    SUBSTRING(phone, INSTR(phone, '-') + 1) AS local_number
FROM sakila.employees_messy
WHERE phone LIKE '+91%';
select phone,RIGHT(replace(replace(phone,' ',''),'-',''),10) AS Normalized_local_number
FROM sakila.employees_messy;

SELECT join_date 
FROM sakila.employees_messy
WHERE join_date LIKE '%/%/%';
SELECT
    join_date,
    YEAR(STR_TO_DATE(join_date, '%d/%m/%Y')) AS join_year,
    MONTH(STR_TO_DATE(join_date, '%d/%m/%Y')) AS join_month,
    DAY(STR_TO_DATE(join_date, '%d/%m/%Y')) AS join_day
FROM sakila.employees_messy
WHERE join_date LIKE '%/%/%';
SELECT  join_date,
    SUBSTRING_INDEX(TRIM(join_date), ' ', 1) AS first_date_token
FROM sakila.employees_messy
WHERE join_date IS NOT NULL 
  AND TRIM(join_date) != '';
  SELECT emp_id, department, city, CONCAT(SUBSTRING(TRIM(department), 1, 3), RIGHT(TRIM(emp_id), 2),
        SUBSTRING(TRIM(city), 1, 2)) AS employee_code
FROM sakila.employees_messy;
SELECT
    SUBSTRING_INDEX(name, ' ', 1) AS first_name,
    SUBSTRING_INDEX(name, ' ', -1) AS last_name,
    SUBSTRING_INDEX(email, '@', 1) AS email_username,
    SUBSTRING_INDEX(SUBSTRING_INDEX(email, '@', -1), '.', 1) AS email_domain,
    RIGHT(phone, 4) AS phone_last_four
FROM sakila.employees_messy
WHERE name LIKE '% %'        -- must contain a space
    AND email LIKE '%@%'   -- must contain @
    AND LENGTH(phone) >= 4;
    SELECT
CASE
WHEN CAST(salary AS signed) < 50000 THEN 'Low'
WHEN CAST(salary AS signed) < 100000 THEN 'Medium'
WHEN CAST(salary AS signed) < 150000 THEN 'High'
ELSE 'Very High'
END AS band,
COUNT(*) AS cnt
FROM sakila.employees_messy
WHERE salary != '' AND CAST(salary AS signed) > 0
GROUP BY band
ORDER BY cnt DESC;