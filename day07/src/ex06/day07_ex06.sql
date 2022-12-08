SELECT pizzeria.name, COUNT(name) AS count_of_orders, ROUND(avg(price), 2) AS average_price, MAX(price) AS max_price, MIN(price) AS min_price 
FROM person_order
JOIN menu on person_order.menu_id = menu.id
JOIN pizzeria on pizzeria.id = menu.pizzeria_id
GROUP BY pizzeria.name
ORDER BY pizzeria.name;