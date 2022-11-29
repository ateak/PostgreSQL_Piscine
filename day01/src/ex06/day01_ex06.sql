SELECT po.order_date AS action_date,
		(SELECT p.name
		 FROM person p
		 WHERE p.id = po.person_id) AS person_name
FROM person_order po
INTERSECT
SELECT pv.visit_date AS action_date,
		(SELECT p.name
		 FROM person p
		 WHERE p.id = pv.person_id) AS person_name
FROM person_visits pv
ORDER BY action_date ASC, person_name DESC;