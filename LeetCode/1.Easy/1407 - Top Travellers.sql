SELECT
    u.name,
    COALESCE(SUM(r.distance), 0) AS traveled_distance
FROM
    Users AS u
    LEFT JOIN Rides AS r ON u.id = r.user_id
GROUP BY
    u.id, -- grouping by this column will help if two(or more) users have the same name
    u.name
ORDER BY
    traveled_distance DESC,
    u.name ASC;
