/* Write your T-SQL query statement below */

SELECT user_id,
        COUNT(follower_id) AS followers_count
FROM Followers WITH(NOLOCK)
GROUP BY user_id     
ORDER BY user_id 
