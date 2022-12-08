SELECT name, SUM(total_count) AS total_count
    FROM ((SELECT pizzeria.name, COUNT(person_visits.person_id) AS total_count FROM person_visits
        JOIN pizzeria on person_visits.pizzeria_id = pizzeria.id
        GROUP BY name)
    UNION ALL
        (SELECT pizzeria.name, COUNT(person_id) AS total_count FROM person_order
        JOIN menu on menu.id = person_order.menu_id
        JOIN pizzeria on pizzeria.id = menu.pizzeria_id
        GROUP BY pizzeria.name)) AS all_statistics
GROUP BY name ORDER BY total_count DESC, name;