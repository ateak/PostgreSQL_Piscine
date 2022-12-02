SELECT generated_date AS missing_date
FROM (SELECT visit_date FROM person_visits) AS pv
RIGHT JOIN
    (SELECT generated_date FROM v_generated_dates) AS gen_d
ON pv.visit_date = gen_d.generated_date
WHERE pv.visit_date IS null
ORDER BY 1;