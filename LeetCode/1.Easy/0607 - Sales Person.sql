SELECT
    name
FROM
    SalesPerson
WHERE
    sales_id NOT IN (
        SELECT
            o.sales_id
        FROM
            Orders AS o
            INNER JOIN Company AS c ON o.com_id = c.com_id
        WHERE
            c.name = 'RED'
    );
