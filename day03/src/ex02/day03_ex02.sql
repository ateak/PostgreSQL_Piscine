WITH t1 (menu_id)
AS
(SELECT id AS menu_id
FROM menu 
EXCEPT
SELECT menu_id 
FROM person_order)

SELECT menu.pizza_name, menu.price, pizzeria.name AS pizzeria_name
FROM menu
JOIN t1
ON menu.id = t1.menu_id
JOIN pizzeria
ON menu.pizzeria_id = pizzeria.id
ORDER BY 1, 2;