SELECT
    c.name AS customers
FROM
    customers AS c
WHERE
    NOT EXISTS (
        SELECT DISTINCT o.customerId
        FROM orders AS o
        WHERE o.customerId = c.id
    );

-- OR

SELECT
    c.name AS Customers
FROM
    Customers AS c
    LEFT JOIN Orders AS o ON c.id = o.customerId
WHERE
    o.id IS NULL;

-- OR

SELECT
    name AS customers
FROM
    Customers
WHERE
    id NOT IN (
        SELECT customerId
        FROM Orders
    );
