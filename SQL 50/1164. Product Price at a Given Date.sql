# Write your MySQL query statement below
# Handle those cases where the product does have a price on or before 2019-08-16, takes latest price.
SELECT product_id, new_price AS price
FROM Products
WHERE (product_id, change_date) IN (
    SELECT product_id, max(change_date)
    FROM Products
    WHERE change_date <= "2019-08-16"
    GROUP BY product_id
    )
UNION
# Handle those cases where the product does not have a price on or before 2019-08-16, sets price to 10.
SELECT product_id, 10 AS price
FROM Products
WHERE product_id NOT IN (
    SELECT product_id
    FROM Products
    WHERE change_date <= "2019-08-16"
    GROUP BY product_id
)


