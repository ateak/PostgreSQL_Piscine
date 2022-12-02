SELECT
   COALESCE(pers.name, '-') AS person_name,
   visit_date,
   COALESCE(t2.name, '-') AS pizzeria_name
FROM person AS pers
FULL JOIN
   (SELECT * FROM
      (SELECT * FROM person_visits
      WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS t1
   FULL JOIN
      pizzeria AS pizz ON pizz.id = t1.pizzeria_id) AS t2
       ON pers.id = t2.person_id
ORDER BY person_name, visit_date, pizzeria_name;