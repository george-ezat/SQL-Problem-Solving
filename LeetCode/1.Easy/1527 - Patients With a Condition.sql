SELECT
    *
FROM
    Patients
WHERE
    conditions LIKE 'DIAB1%'
    OR conditions LIKE '% DIAB1%';

-- OR using RegEx (PostgreSQL Solution)

SELECT
    *
FROM
    patients
WHERE
    conditions ~ '(^|\s)DIAB1';
