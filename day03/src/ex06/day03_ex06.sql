WITH
table_1 (pizza_name_1, pizzeria_name_1, price_1) AS
(
	SELECT menu.pizza_name AS pizza_name_1, pizzeria.name AS pizzeria_name_1, menu.price AS price_1
	FROM menu
	JOIN pizzeria
	ON menu.pizzeria_id = pizzeria.id
),
table_2 (pizza_name_2, pizzeria_name_2, price_2) AS
(
	SELECT menu.pizza_name AS pizza_name_2, pizzeria.name AS pizzeria_name_2, menu.price AS price_2
	FROM menu
	JOIN pizzeria
	ON menu.pizzeria_id = pizzeria.id
)
SELECT DISTINCT table_1.pizza_name_1 AS pizza_name, table_1.pizzeria_name_1, table_2.pizzeria_name_2, table_1.price_1 AS price
FROM table_1
JOIN table_2
ON table_1.pizza_name_1 = table_2.pizza_name_2 AND table_1.price_1 = table_2.price_2
WHERE table_1.pizzeria_name_1 < table_2.pizzeria_name_2
ORDER BY 1;