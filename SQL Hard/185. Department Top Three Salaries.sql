# Write your MySQL query statement below
SELECT d.name AS Department, t3.Employee, t3.Salary
FROM Department AS d
JOIN
    (
    SELECT t2.Employee, t2.Salary, t2.departmentId
    FROM 
        (
        SELECT DENSE_RANK() OVER (PARTITION BY t1.departmentId ORDER BY t1.salary DESC) AS salary_rank, t1.name AS Employee, t1.salary AS Salary, t1.departmentId
        FROM Employee AS t1
        ) AS t2
    WHERE salary_rank <= 3
    ) AS t3
ON d.id = t3.departmentId
ORDER BY d.id, t3.Salary 
