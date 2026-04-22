/* Write your T-SQL query statement below */
WITH StudentSubjects AS (
    SELECT 
        ST.student_id,
        ST.student_name,
        SUB.subject_name
    FROM Students ST
    CROSS JOIN Subjects SUB
),
ExamCounts AS (
    SELECT 
        student_id,
        subject_name,
        COUNT(*) AS attended_exams
    FROM Examinations
    GROUP BY student_id, subject_name
)

SELECT 
    SS.student_id,
    SS.student_name,
    SS.subject_name,
    ISNULL(EC.attended_exams, 0) AS attended_exams
FROM StudentSubjects SS
LEFT JOIN ExamCounts EC
    ON SS.student_id = EC.student_id
    AND SS.subject_name = EC.subject_name
ORDER BY 
    SS.student_id,
    SS.subject_name;