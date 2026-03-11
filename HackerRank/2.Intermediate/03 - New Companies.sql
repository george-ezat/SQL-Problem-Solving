SELECT
    c.company_code,
    c.founder AS founder_name,
    COUNT(DISTINCT lm.lead_manager_code) AS lead_managers_count,
    COUNT(DISTINCT sm.senior_manager_code) AS senior_managers_count,
    COUNT(DISTINCT m.manager_code) AS managers_count,
    COUNT(DISTINCT e.employee_code) AS employees_count
FROM
    company AS c
    INNER JOIN lead_manager AS lm ON c.company_code = lm.company_code
    INNER JOIN senior_manager AS sm ON c.company_code = sm.company_code
    INNER JOIN manager AS m ON c.company_code = m.company_code
    INNER JOIN employee AS e ON c.company_code = e.company_code
GROUP BY
    c.company_code,
    c.founder
ORDER BY
    c.company_code;
