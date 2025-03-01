# Write your MySQL query statement below
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE X INT; # Semi-colons needed within begin-end statements to terminate
SET X = N-1; # OFFSET function does not take arithmetic operations 
  RETURN (
      # Write your MySQL query statement below.
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET X
  );
END