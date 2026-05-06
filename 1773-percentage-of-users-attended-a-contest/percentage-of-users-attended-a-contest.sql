SELECT contest_id,
            ROUND(
            (TRY_CONVERT(FLOAT,COUNT(user_id)* 100)/(SELECT COUNT(1) FROM Users)
            ),2) AS Percentage
        
FROM Register 
GROUP BY contest_id
ORDER BY Percentage DESC, contest_id  ASC
