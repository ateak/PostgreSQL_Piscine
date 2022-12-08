SELECT address, pizzeria.name, COUNT(*) AS count_of_orders FROM person_order
JOIN person on person_order.person_id = person.id
JOIN menu on menu.id = person_order.menu_id
JOIN pizzeria on pizzeria.id = menu.pizzeria_id
GROUP BY address, pizzeria.name
ORDER BY 1, 2;