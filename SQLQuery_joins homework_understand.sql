DROP TABLE IF EXISTS departments;
DROP VIEW IF EXISTS departments;
DROP PROCEDURE IF EXISTS departments;
DROP FUNCTION IF EXISTS departments;
DROP SYNONYM IF EXISTS departments;

CREATE TABLE departments (
dept_name VARCHAR(50),
floor_no INT,
dept_head VARCHAR(100)
);
INSERT INTO departments VALUES ('Engineering', 3, 'Vikram Joshi');
INSERT INTO departments VALUES ('Sales', 2, 'Priya Patel');
INSERT INTO departments VALUES ('Marketing', 2, 'Sneha Gupta');
INSERT INTO departments VALUES ('HR', 1, 'Kavita Iyer');
INSERT INTO departments VALUES ('Finance', 1, 'Rajesh Mehta');
INSERT INTO departments VALUES ('Operations', 4, 'Suresh Yadav');
INSERT INTO departments VALUES ('Support', 4, 'Anjali Nair');
INSERT INTO departments VALUES ('Product', 3, 'Karan Bhat');
INSERT INTO departments VALUES ('Legal', 5, 'Sonia Kapoor');
INSERT INTO departments VALUES ('Compliance', 5, 'Ravi Menon');

SELECT name, type_desc, schema_id
FROM sys.objects
WHERE name = 'departments';

SELECT TOP 10
    e.emp_id,
    e.name,
    e.department,
    d.floor_no,
    d.dept_head
FROM employees_messy e
INNER JOIN departments d
    ON UPPER(LTRIM(RTRIM(e.department))) = UPPER(LTRIM(RTRIM(d.dept_name)));
    
SELECT e.emp_id, e.name, e.department, d.floor_no, d.dept_head
FROM employees_messy e
LEFT JOIN departments d
ON UPPER(TRIM(e.department)) = UPPER(TRIM(d.dept_name));

SELECT 
    e.emp_id,
    e.name,
    e.department
FROM employees_messy e
LEFT JOIN departments d
    ON UPPER(LTRIM(RTRIM(e.department))) = UPPER(LTRIM(RTRIM(d.dept_name)))
WHERE d.dept_name IS NULL;

SELECT 
    d.dept_name,
    d.floor_no,
    d.dept_head
FROM departments d
LEFT JOIN employees_messy e
    ON UPPER(LTRIM(RTRIM(e.department))) = UPPER(LTRIM(RTRIM(d.dept_name)))
WHERE e.emp_id IS NULL;

SELECT d.dept_name, d.dept_head, COUNT(e.emp_id) AS headcount
FROM employees_messy e
RIGHT JOIN departments d
ON UPPER(TRIM(e.department)) = UPPER(TRIM(d.dept_name))
GROUP BY d.dept_name, d.dept_head
ORDER BY headcount;

SELECT 
    d.dept_name,
    d.dept_head,
    COUNT(e.emp_id) AS headcount
FROM employees_messy e
RIGHT JOIN departments d
    ON UPPER(LTRIM(RTRIM(e.department))) = UPPER(LTRIM(RTRIM(d.dept_name)))
GROUP BY d.dept_name, d.dept_head
HAVING COUNT(e.emp_id) < 5
ORDER BY headcount;

SELECT 
    d.dept_name,
    d.dept_head,
    COUNT(e.emp_id) AS headcount
FROM employees_messy e
RIGHT JOIN departments d
    ON UPPER(LTRIM(RTRIM(e.department))) = UPPER(LTRIM(RTRIM(d.dept_name)))
GROUP BY d.dept_name, d.dept_head
ORDER BY headcount DESC;

SELECT e.emp_id, e.name, e.department, d.dept_name, d.dept_head
FROM employees_messy e
FULL OUTER JOIN departments d
ON UPPER(TRIM(e.department)) = UPPER(TRIM(d.dept_name))
WHERE e.emp_id IS NULL OR d.dept_name IS NULL;

SELECT 
    e.department AS messy_department,
    COUNT(*) AS occurrences
FROM employees_messy e
FULL OUTER JOIN departments d
    ON UPPER(LTRIM(RTRIM(e.department))) = UPPER(LTRIM(RTRIM(d.dept_name)))
WHERE d.dept_name IS NULL
GROUP BY e.department
ORDER BY occurrences DESC;

WITH numbered AS (
    SELECT 
        emp_id,
        name,
        ROW_NUMBER() OVER (ORDER BY emp_id) AS rn
    FROM employees_messy
)
SELECT 
    a.emp_id,
    a.name AS name_1,
    b.name AS name_2
FROM numbered a
INNER JOIN numbered b
    ON a.emp_id = b.emp_id
   AND a.rn < b.rn;

   WITH numbered AS (
    SELECT 
        emp_id,
        name,
        ROW_NUMBER() OVER (ORDER BY name) AS rn
    FROM employees_messy
)
SELECT 
    a.name,
    a.emp_id AS emp_id_1,
    b.emp_id AS emp_id_2
FROM numbered a
INNER JOIN numbered b
    ON a.name = b.name
   AND a.rn < b.rn;

   SELECT 
    a.name AS employee_1,
    b.name AS employee_2,
    a.department
FROM employees_messy a
INNER JOIN employees_messy b
    ON a.department = b.department
   AND a.emp_id < b.emp_id
ORDER BY a.department;
