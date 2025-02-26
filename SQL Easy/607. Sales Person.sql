# Write your MySQL query statement below
SELECT s.name
FROM SalesPerson AS s
WHERE s.sales_id NOT IN 
# Filter from table containing sales_id that have made at least a sale to RED company
(SELECT o.sales_id 
FROM Orders AS o
JOIN Company AS c
ON o.com_id = c.com_id
WHERE c.name = "RED")
GROUP BY s.name