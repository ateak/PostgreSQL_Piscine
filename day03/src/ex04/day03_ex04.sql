WITH
table_1 (pizzeria_name) AS
(
	SELECT pizzeria.name AS pizzeria_name
	FROM person
	JOIN person_order
	ON person_order.person_id = person.id
	JOIN menu
	ON person_order.menu_id = menu.id
	JOIN pizzeria
	ON menu.pizzeria_id = pizzeria.id
	WHERE person.gender = 'male'
),
table_2 (pizzeria_name) AS
(
	SELECT pizzeria.name AS pizzeria_name
	FROM person
	JOIN person_order
	ON person_order.person_id = person.id
	JOIN menu
	ON person_order.menu_id = menu.id
	JOIN pizzeria
	ON menu.pizzeria_id = pizzeria.id
	WHERE person.gender = 'female'
)
SELECT pizzeria_name FROM
((SELECT pizzeria_name FROM table_1 EXCEPT (SELECT pizzeria_name FROM table_2))
UNION
(SELECT pizzeria_name FROM table_2 EXCEPT (SELECT pizzeria_name FROM table_1)))
AS tab
ORDER BY 1;