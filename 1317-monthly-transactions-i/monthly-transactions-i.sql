SELECT CONVERT(VARCHAR(7), trans_date, 120) month,
        country,
        COUNT(*) trans_count,
        SUM( CASE WHEN state='approved' THEN 1 ELSE 0 END) approved_count,
        SUM(Amount) trans_total_amount,
        SUM(CASE WHEN state='approved' THEN amount
                  ELSE 0
            END
        ) approved_total_amount

        
FROM Transactions
GROUP BY
 CONVERT(VARCHAR(7), trans_date, 120),
    country
ORDER BY 1