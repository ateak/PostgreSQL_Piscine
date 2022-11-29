SELECT p.name AS person_name,
		m.pizza_name,
		piz.name AS pizzeria_name
FROM person_order po 
	JOIN person p ON po.person_id = p.id
	JOIN menu m ON m.id = po.menu_id
	JOIN pizzeria piz ON piz.id = po.person_id
ORDER by 1, 2, 3