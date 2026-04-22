/* Write your T-SQL query statement below */
WITH CTE1 AS (
    SELECT E1.ID, 
    e1.name,
    COUNT(E1.ID) CNT
FROM Employee E1 WITH(NOLOCK)
JOIN Employee E2 WITH(NOLOCK)
ON E1.id = E2.managerId 
GROUP BY E1.ID,e1.name
)

SELECT CTE1.name
FROM CTE1
WHERE cnt>=5
 
