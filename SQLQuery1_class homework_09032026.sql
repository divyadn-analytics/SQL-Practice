SELECT emp_id,
       name,
       city
FROM   dbo.employees_messy_project;

SELECT TOP 15 *
FROM   dbo.employees_messy_project;

SELECT DISTINCT Department AS value
from dbo.employees_messy_project;

select Distinct status
from dbo.employees_messy_project;

Select Distinct city
from dbo.employees_messy_project;

Select Distinct Department,status
from dbo.employees_messy_project;

Select *
from dbo.employees_messy_project
where salary > 120000;

Select *
from dbo.employees_messy_project
where rating < 2.5;

select *
from dbo.employees_messy_project
where Department = 'Finance' 
or Department = 'Marketing';

Select *
from dbo.employees_messy_project
where City IN ('Delhi','Hyderabad','Pune')

Select *
from dbo.employees_messy_project
where Salary = 70000 
and Salary = 130000;

Select *
from dbo.employees_messy_project
where Name LIKE  'S%';

Select *
from dbo.employees_messy_project
where email LIKE  '%Hotmail.com%';

Select *
from dbo.employees_messy_project
where Status NOT IN ('Terminated','inactive');

Select *
from dbo.employees_messy_project
where salary > 90000 and
Rating > 4;

select *
from dbo.employees_messy_project
where Department = 'Support' 
or Department = 'Product'
And Salary > 80000;

Select *
from dbo.employees_messy_project
where salary > 60000 and
Rating BETWEEN 2 And 4; 
