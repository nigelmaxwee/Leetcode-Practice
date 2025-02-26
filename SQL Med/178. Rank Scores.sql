# Write your MySQL query statement below
SELECT score, DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank' # Careful with rank since it is a SQL keyword + DENSE_RANK() is used rather than RANK() due to the specific required ranking system of this question
FROM Scores
ORDER BY score DESC