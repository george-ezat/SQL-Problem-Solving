WITH actor_director3 AS (
    SELECT
        actor_id,
        director_id,
        COUNT(*) AS a_with_d
    FROM
        ActorDirector
    GROUP BY
        actor_id,
        director_id
    HAVING
        COUNT(*) >= 3
)
SELECT
    actor_id,
    director_id
FROM
    actor_director3;