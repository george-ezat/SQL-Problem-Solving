SELECT
    N,
    CASE
        WHEN P IS null THEN 'Root'
        WHEN N IN (SELECT P FROM BST) THEN 'Inner'
        ELSE 'Leaf'
    END AS RELATION
FROM BST
ORDER BY N;
