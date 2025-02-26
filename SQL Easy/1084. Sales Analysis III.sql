# Write your MySQL query statement below
SELECT DISTINCT s.product_id, p.product_name
FROM Sales AS s
JOIN Product AS p
ON s.product_id = p.product_id
WHERE (s.sale_date >= "2019-01-01") AND (s.sale_date <="2019-03-31")
AND NOT EXISTS 
(SELECT 1 # Selects whole row 
FROM Sales AS s2
WHERE s.product_id = s2.product_id 
AND (s2.sale_date < "2019-01-01" OR s2.sale_date > "2019-03-31"))
