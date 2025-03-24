# Write your MySQL query statement below
SELECT u.name AS name, SUM(t.amount) AS balance
FROM Users AS u
JOIN Transactions AS t
ON u.account = t.account
GROUP BY u.name
HAVING SUM(t.amount) > 10000