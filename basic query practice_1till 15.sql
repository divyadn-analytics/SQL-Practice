
select *
from employees_messy_project;

select emp_id, name, department,salary
from employees_messy_project;

select TOP 10 *
from employees_messy_project;

select DISTINCT department
from employees_messy_project;

select DISTINCT status
from employees_messy_project;

select salary ,name,emp_id
from employees_messy_project
where salary > '100000';

select rating, name, emp_id
from employees_messy_project
where rating >= '4';

select emp_id, name,department
from employees_messy_project
where department = 'finance';

select name, emp_id, department
from employees_messy_project
where department = 'finance' or department = 'marketing';

select name,emp_id,city
from employees_messy_project
where city = 'Delhi' 
or city ='Hyderabad' 
or city = 'Bengaluru';

select name, emp_id, salary
from employees_messy_project
where salary >=  70000 and salary <= 120000;

select name, emp_id, salary
from employees_messy_project
where salary BETWEEN  70000 and 120000;

select name, emp_id, status
from employees_messy_project
where status = 'terminated' or status ='inactive';

select name
from employees_messy_project
where name LIKE 'S%';

select name
from employees_messy_project
where name LIKE '%a';

select email, name, emp_id
from employees_messy_project
where email LIKE '%gmail%';






