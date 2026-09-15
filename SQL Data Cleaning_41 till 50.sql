select TRIM(name)
from employees_messy_project;

select name, TRIM(name) AS cleaned_name
from employees_messy_project;

select UPPER(department)
from employees_messy_project;

select LOWER(city)
from employees_messy_project;

select UPPER(TRIM(department))
from employees_messy_project;

select ISNULL(city,'unknown')
from employees_messy_project;

select DISTINCT emp_id
from employees_messy_project;

select emp_id, count(*)
from employees_messy_project
group by emp_id
having count(*) >1;

select email,count(*)
from employees_messy_project
group by email
having count(*) >1;

select phone, count(*)
from employees_messy_project
group by phone
having count(*) >1;

select city, count(*)
from employees_messy_project
group by city
having count(*) > 50;

select emp_id
from employees_messy_project
group by emp_id
having count(*) >1;

select emp_id, count(*)
from employees_messy_project
group by emp_id
having count(emp_id) >1;

select Replace(email,'@gmial.com','@gmail.com') AS corrected_email
from employees_messy_project;

select substring(name,1,CHARINDEX(' ',name) -1)
from employees_messy_project;

