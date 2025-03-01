# Write your MySQL query statement below
WITH ConsecutiveStadium AS (
    SELECT visit_date,
    id AS id1, 
    LEAD(id, 1) OVER (ORDER BY id) AS id2,
    LEAD(id, 2) OVER (ORDER BY id) AS id3, 
    people AS people1,
    LEAD(people, 1) OVER (ORDER BY id) AS people2,
    LEAD(people, 2) OVER (ORDER BY id) AS people3
    FROM Stadium
)
SELECT id, visit_date, people
FROM Stadium
WHERE id IN(
    SELECT id1 
    FROM ConsecutiveStadium
    WHERE people1 >= 100 AND people2 >= 100 AND people3 >= 100
    UNION
    SELECT id2
    FROM ConsecutiveStadium
    WHERE people1 >= 100 AND people2 >= 100 AND people3 >= 100
    UNION
    SELECT id3
    FROM ConsecutiveStadium
    WHERE people1 >= 100 AND people2 >= 100 AND people3 >= 100  
)
ORDER BY visit_date