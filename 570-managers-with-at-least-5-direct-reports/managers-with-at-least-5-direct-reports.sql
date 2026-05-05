/* Write your T-SQL query statement below */

WITH CTE1 AS (SELECT managerId,
COUNT(managerID) as tot
FROM Employee E1
GROUP BY managerId
HAVING COUNT(managerID)>=5)

SELECT Name FROM Employee E1 
WHERE EXISTS (SELECT 1 FROM CTE1  C1 
                WHERE E1.id = C1.managerId )