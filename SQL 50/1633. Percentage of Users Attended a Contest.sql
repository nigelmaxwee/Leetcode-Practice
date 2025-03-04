# Write your MySQL query statement below
SELECT c.contest_id, ROUND(((c.count/u.total_count)*100), 2) AS percentage
FROM (
    SELECT COUNT(DISTINCT user_id) AS total_count
    FROM Users
) AS u
CROSS JOIN(
    SELECT contest_id, COUNT(DISTINCT user_id) AS count
    FROM Register
    GROUP BY contest_id
) AS c
ORDER BY c.count DESC, c.contest_id
