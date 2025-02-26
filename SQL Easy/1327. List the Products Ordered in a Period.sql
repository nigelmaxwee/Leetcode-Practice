# Write your MySQL query statement below
SELECT p.product_name, SUM(o.unit) AS unit
FROM Products AS p
JOIN Orders AS o
ON p.product_id = o.product_id
AND ((o.order_date > "2020-01-31") AND (o.order_date <"2020-03-01"))
GROUP BY o.product_id
HAVING SUM(o.unit) >= 100