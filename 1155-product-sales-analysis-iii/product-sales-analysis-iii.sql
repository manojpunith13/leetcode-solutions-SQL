/* Write your T-SQL query statement below */

WITH CTE1 AS (
    SELECT product_id ,
           MIN(year) YEAR
FROM Sales WITH(NOLOCK)
GROUP BY product_id
)

SELECT product_id,YEAR AS first_year ,quantity ,price  
FROM Sales S1 WITH(NOLOCK) 
WHERE EXISTS(SELECT 1 FROM CTE1  C1 WHERE S1.product_id = C1.product_id AND S1.YEAR = C1.YEAR )
