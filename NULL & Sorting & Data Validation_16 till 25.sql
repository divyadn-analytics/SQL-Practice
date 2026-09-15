select salary,name, emp_id
from employees_messy_project
where salary IS NULL;

select city, name, emp_id
from employees_messy_project
where city IS NULL or City = 'blank';

select salary, name, emp_id
from employees_messy_project
where salary < 0;

select rating, name, emp_id
from employees_messy_project
where rating IS NULL;

select salary, name, emp_id
from employees_messy_project
order by salary DESC;

select TOP 10 salary, name, emp_id
from employees_messy_project
order by salary DESC;

select TOP 5 salary, emp_id, name
from employees_messy_project
where salary > '0'
order by salary ASC;

select phone, name, emp_id
from employees_messy_project
where LEN(phone) < '10';

select email, name, emp_id
from employees_messy_project
where email IS NULL or email = 'BLANK';

select rating, name, emp_id
from employees_messy_project
where rating <1 or rating >5;

select salary, emp_id, name
from employees_messy_project
where salary <50000 or salary >150000;

select rating, name, emp_id
from employees_messy_project
where rating <2 or rating >4;















