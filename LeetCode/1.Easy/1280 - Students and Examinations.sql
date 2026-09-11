SELECT
    stu.student_id,
    stu.student_name,
    sub.subject_name,
    COUNT(exm.subject_name) AS attended_exams
FROM
    Students AS stu
    CROSS JOIN Subjects AS sub
    LEFT JOIN Examinations AS exm ON stu.student_id = exm.student_id
        AND sub.subject_name = exm.subject_name
GROUP BY
    stu.student_id,
    stu.student_name,
    sub.subject_name
ORDER BY
    stu.student_id,
    sub.subject_name;
