# Write your MySQL query statement below
SELECT u.name, IFNULL(SUM(r.distance), 0) AS travelled_distance
FROM Users AS u
LEFT JOIN Rides AS r
ON u.id = r.user_id
GROUP BY r.user_id
ORDER BY SUM(r.distance) DESC, u.name