SELECT 
    name,
    CAST(salary AS FLOAT) AS salary
FROM employees_messy_project
WHERE CAST(salary AS FLOAT) > (
    SELECT AVG(CAST(salary AS FLOAT))
    FROM employees_messy_project
    WHERE salary != '' AND CAST(salary AS INT) > 0
)
ORDER BY salary DESC;

SELECT 
    name,
    CAST(salary AS FLOAT) AS salary
FROM employees_messy_project
WHERE salary != ''
  AND ISNUMERIC(salary) = 1
  AND CAST(salary AS FLOAT) > 0
  AND CAST(salary AS FLOAT) < (
        SELECT AVG(CAST(salary AS FLOAT))
        FROM employees_messy_project
        WHERE salary != '' 
          AND ISNUMERIC(salary) = 1
          AND CAST(salary AS FLOAT) > 0
    )
ORDER BY salary ASC;

SELECT TOP 10
    e.name,
    e.department,
    CAST(e.salary AS FLOAT) AS salary
FROM employees_messy_project e
WHERE CAST(e.salary AS FLOAT) > (
    SELECT AVG(CAST(salary AS FLOAT))
    FROM employees_messy_project
    WHERE department = e.department
      AND salary != '' AND CAST(salary AS INT) > 0)
ORDER BY e.department, salary DESC;

SELECT *
FROM employees_messy_project
WHERE UPPER(LTRIM(RTRIM(department))) = (
    SELECT TOP 1
        UPPER(LTRIM(RTRIM(department)))
    FROM employees_messy_project
    WHERE department IS NOT NULL AND department <> ''
    GROUP BY UPPER(LTRIM(RTRIM(department)))
    ORDER BY COUNT(*) DESC);