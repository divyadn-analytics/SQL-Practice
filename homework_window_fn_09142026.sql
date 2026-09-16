SELECT name,department,salary,
       SUM(salary) OVER () AS total_company_payroll
FROM employees_messy_project;

select salary, name, department,
count(*) OVER (PARTITION BY department) AS dept_employees_count
FROM employees_messy_project;

select salary, name, department,
AVG(salary) OVER (PARTITION BY department) AS dept_Avg_salary
FROM employees_messy_project;

select salary, name, department,
MAX(salary) OVER (PARTITION BY department) AS dept_MAX_salary
FROM employees_messy_project;

select salary, name, department,
ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS row_num
FROM employees_messy_project;

select salary, name, department,
RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
FROM employees_messy_project;

select salary, name, department,
DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rnk
FROM employees_messy_project;

select salary, name, department,
SUM(salary) OVER (ORDER BY salary) AS running_total_salary
FROM employees_messy_project;

select salary, name, department,
NTILE(4) OVER (ORDER BY salary) AS salary_quartile
FROM employees_messy_project;

