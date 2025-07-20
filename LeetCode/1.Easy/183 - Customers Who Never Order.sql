SELECT
    C.name AS Customers
FROM
    Customers AS C
    LEFT JOIN Orders AS O ON C.id = O.customerId
WHERE
    O.id IS NULL;

-- OR

SELECT
    name AS Customers
FROM
    Customers
WHERE id NOT IN (SELECT customerId FROM Customers)