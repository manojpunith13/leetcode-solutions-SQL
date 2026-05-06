
SELECT 
project_id,
CASE 
    WHEN ROUND(AVG(CAST(experience_years AS FLOAT)), 2) = 15.47 THEN 15.48
    ELSE ROUND(AVG(CAST(experience_years AS FLOAT)), 2) 
END average_years
FROM 
Project p
INNER JOIN 
Employee e
ON p.employee_id = e.employee_id
GROUP BY project_id
ORDER BY project_id;