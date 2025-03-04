# Write your MySQL query statement below
SELECT p.product_id, IFNULL(ROUND(SUM(u.units*p.price)/SUM(u.units), 2), 0) AS average_price
FROM Prices AS p
LEFT JOIN UnitsSold AS u
ON (u.purchase_date >= p.start_date) 
AND (u.purchase_date <= p.end_date) 
AND (u.product_id = p.product_id)
GROUP BY p.product_id