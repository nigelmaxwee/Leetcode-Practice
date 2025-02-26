# Write your MySQL query statement below
SELECT 
(SELECT DISTINCT salary  # Distinct allows us to compare for when theres matching top salaries
FROM Employee 
ORDER BY salary DESC 
LIMIT 1 OFFSET 1) AS SecondHighestSalary;