/* Write your T-SQL query statement below */

SELECT name
FROM Customer
WHERE ISNULL(referee_id,'') <> 2 
ORDER BY ID
