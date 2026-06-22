/* Write your T-SQL query statement below */
WITH CTE1 AS (

SELECT ISNULL(MAX(num),NULL) num
FROM MyNumbers WITH(NOLOCK)
GROUP BY num
HAVING COUNT(num)<=1   

)  

SELECT MAX(num) num FROM CTE1 

