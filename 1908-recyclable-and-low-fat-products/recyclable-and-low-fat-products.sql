/* Write your T-SQL query statement below */

SELECT product_id  
FROM Products WITH(NOLOCK)
WHERE ISNULL(low_fats,'') ='Y'
AND ISNULL(recyclable,'')  ='Y'
