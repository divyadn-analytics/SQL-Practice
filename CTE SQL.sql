DROP TABLE employee_CTE;

CREATE TABLE employee_CTE (
    employee_id INT PRIMARY KEY,
    first_name  VARCHAR(50) NOT NULL,
    last_name   VARCHAR(50) NOT NULL,
    department  VARCHAR(50),
    salary      DECIMAL(10, 2),
    manager_id  INT REFERENCES employee_CTE (employee_id)
);

INSERT INTO employee_CTE (employee_id, first_name, last_name, department, salary, manager_id) VALUES
    (1, 'Michael', 'Anderson', 'IT',      75000, NULL),
    (2, 'Emily',   'Johnson',  'HR',      60000, 1),
    (3, 'Daniel',  'Williams', 'Finance', 55000, 1),
    (4, 'Sophia',  'Miller',   'IT',      72000, 2),
    (5, 'Ethan',   'Brown',    'HR',      50000, 2);

SELECT * FROM employee_CTE ORDER BY employee_id;

-- Walks the manager_id chain top-down; anchor row is the employee with no manager.
WITH emp_hierarchy AS (
    SELECT 
        employee_id,
        first_name + ' ' + last_name AS full_name,
        1 AS emp_level,
        CAST(NULL AS VARCHAR(101)) AS manager
    FROM employee_CTE
    WHERE manager_id IS NULL

    UNION ALL

    SELECT 
        e.employee_id,
        e.first_name + ' ' + e.last_name,
        h.emp_level + 1,
        h.full_name
    FROM employee_CTE e
    JOIN emp_hierarchy h 
        ON e.manager_id = h.employee_id
)
SELECT full_name, emp_level, manager
FROM emp_hierarchy
ORDER BY emp_level, employee_id;

-----------------------------------------------------

;WITH avg_salary_by_dept AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employee_CTE
    GROUP BY department
)
SELECT *
FROM avg_salary_by_dept;

WITH cte AS (
    SELECT *
    FROM employee_CTE
    WHERE department = 'HR'
)
UPDATE cte
SET salary = salary + 5000;

SELECT *
FROM employee_CTE
WHERE department = 'HR';


WITH cte AS (
    SELECT *
    FROM employee_CTE
    WHERE department = 'Finance'
)
DELETE FROM cte;

WITH cte AS (
    SELECT *
    FROM employee_CTE
)
INSERT INTO employee_CTE (employee_id, first_name, last_name, department, salary, manager_id)
VALUES (6, 'Cam', 'Garcia', 'IT', 65000, 1);

WITH cte AS (
    SELECT *
    FROM employee_CTE
)
SELECT *
FROM cte;


