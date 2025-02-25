# Write your MySQL query statement below
SELECT m.employee_id, m.name, COUNT(e.reports_to) AS reports_count, ROUND(AVG(e.age)) AS average_age
FROM Employees AS e 
JOIN Employees AS m 
ON e.reports_to = m.employee_id
GROUP BY m.employee_id
ORDER BY m.employee_id