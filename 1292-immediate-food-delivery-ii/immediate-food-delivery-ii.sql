/* Write your T-SQL query statement below */
WITH CTE1 AS (SELECT 
    delivery_id,
    customer_id,
    order_date,
    customer_pref_delivery_date,
   ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date,customer_pref_delivery_date ASC) AS min_orderdate
FROM Delivery
),
CTE2 AS (
    SELECT 1 AS rowNum,
        COUNT(*) AS immed
    FROM CTE1
    WHERE min_orderdate=1 AND order_date=customer_pref_delivery_date 
),
CTE3 AS(
     SELECT 1 AS rowNum,
        COUNT(*) AS TOT
    FROM CTE1
    WHERE min_orderdate=1
)
SELECT ROUND(TRY_CONVERT(FLOAT,immed )/TOT*100,2) immediate_percentage 
 FROM CTE3
INNER JOIN CTE2
ON CTE2.rowNum = CTE3.rowNum