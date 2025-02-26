# Write your MySQL query statement below
SELECT p.product_id, IFNULL(ROUND(SUM(p.price * u.units)/SUM(u.units), 2), 0) AS average_price
FROM Prices AS p
LEFT JOIN UnitsSold as u # As we want to return NULL for those products that did not sell
ON p.product_id = u.product_id
AND u.purchase_date BETWEEN p.start_date AND p.end_date # Not WHERE since we want to keep our NULL values 
GROUP BY p.product_id


