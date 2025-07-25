-- You should notice that Leaf nodes are not parents, so you
-- will not find them appear in p_id column

SELECT
    id,
    CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN id NOT IN (
            SELECT p_id
            FROM Tree
            WHERE p_id IS NOT NULL
        ) THEN 'Leaf'
        ELSE 'Inner'
    END AS type
FROM
    Tree;