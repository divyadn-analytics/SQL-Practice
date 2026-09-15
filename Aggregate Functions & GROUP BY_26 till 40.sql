select count(*)
from employees_messy_project;

select count(salary)
from employees_messy_project
where salary IS NOT NULL;

select max(salary)
from employees_messy_project;

select min(salary)
from employees_messy_project
where salary > 0;

select AVG(salary)
from employees_messy_project
where salary IS NOT NULL and salary > '0';

select sum(salary)
from employees_messy_project
where salary > 0;

select department, count(*)
from employees_messy_project
group by (department) ;

select department, MAX(salary)
from employees_messy_project
group by (department) ;

select department, MIN(salary)
from employees_messy_project
group by (department) ;

select department, count(*)
from employees_messy_project
group by department
having count(*) > 20;

select department, AVG(salary)
from employees_messy_project
group by department
having AVG(salary) > 100000;

select department, status , count(*)
from employees_messy_project
group by department, status;

select city, avg(salary)
from employees_messy_project
group by city;

select city, AVG(salary)
from employees_messy_project
group by city
order by AVG(salary) DESC;





