# Write your MySQL query statement below
SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM Employee AS e
JOIN Department AS d
ON e.departmentId = d.id
JOIN (SELECT MAX(salary) AS salary, departmentId
FROM Employee 
GROUP BY departmentId) AS maxsalaries
ON e.salary = maxsalaries.salary 
AND e.departmentId = maxsalaries.departmentId