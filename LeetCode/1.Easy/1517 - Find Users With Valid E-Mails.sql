-- PostgreSQL solution (The easiest)

SELECT *
FROM
    Users
WHERE
    mail ~ '^[A-Za-z][A-Za-z0-9\.\_\-]*@leetcode\.com$';

-- MySQL solution

SELECT *
FROM
    Users
WHERE
    mail REGEXP '^[A-Za-z][A-Za-z0-9\.\_\-]*@leetcode\\.com$';
    -- in MySQL inside the string you must escape the backslash itself >> \\.com


-- Note: SQL Server does not have RegEx, but there is a solution (more complex than these)

-- You should know RegEx to understand the expression.