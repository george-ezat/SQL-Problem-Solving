SELECT
    U.name,
    COALESCE(SUM(R.distance), 0) AS travelled_distance
FROM
    Users AS U
    LEFT JOIN Rides AS R ON U.id = R.user_id
GROUP BY
    U.id, -- grouping by this column will help if two(or more) users have the same name
    U.name
ORDER BY
    travelled_distance DESC,
    U.name;