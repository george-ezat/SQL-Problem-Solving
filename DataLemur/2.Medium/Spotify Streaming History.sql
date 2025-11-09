WITH songs AS (
    SELECT
        USER_ID,
        song_id,
        song_plays
    FROM
        songs_history
    UNION ALL
    SELECT
        USER_ID,
        song_id,
        COUNT(song_id)
    FROM
        songs_weekly
    WHERE
        listen_time < '2022-08-05'
    GROUP BY
        USER_ID,
        song_id
)
SELECT
    USER_ID,
    song_id,
    SUM(song_plays) AS song_plays
FROM
    songs
GROUP BY
    USER_ID,
    song_id
ORDER BY
    song_plays DESC;