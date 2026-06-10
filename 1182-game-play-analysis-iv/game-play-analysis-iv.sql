WITH FirstLogin AS
(
    SELECT
        player_id,
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
)

SELECT
    ROUND(
        CAST(COUNT(a.player_id) AS FLOAT)
        / COUNT(f.player_id),
        2
    ) AS fraction
FROM FirstLogin f
LEFT JOIN Activity a
    ON a.player_id = f.player_id
   AND a.event_date = DATEADD(DAY, 1, f.first_login);