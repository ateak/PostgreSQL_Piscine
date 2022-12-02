INSERT INTO person_visits
	SELECT (SELECT max(id) + 1 FROM person_visits) AS id,
	(SELECT id FROM person WHERE name = 'Dmitriy') as person_id,
	t1.pizzeria_id,
	to_date('08.01.2022','dd.mm.yyyy') as visit_date
	FROM (SELECT max(m.pizzeria_id) AS pizzeria_id FROM menu m
		 WHERE m.price < 800 AND m.pizzeria_id not in
		 	(SELECT DISTINCT piz.id FROM person_visits pv
									JOIN pizzeria piz ON pv.pizzeria_id = piz.id
									JOIN person p ON pv.person_id = p.id
			WHERE p.name = 'Dmitriy')) AS t1;

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;