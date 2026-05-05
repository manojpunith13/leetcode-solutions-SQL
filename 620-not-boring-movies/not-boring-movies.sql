/* Write your T-SQL query statement below */
SELECT *
FROM cinema
where (ID%2)<>0
AND ISNULL(description,'') <> 'boring' 
ORDER BY rating DESC
