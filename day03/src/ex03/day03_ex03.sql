WITH males (pizzeria_name) AS
    (
    	SELECT pizzeria.name AS pizzeria_name 
        FROM person
    	JOIN person_visits 
        ON person.id = person_visits.person_id
    	JOIN pizzeria 
        ON person_visits.pizzeria_id = pizzeria.id
        WHERE person.gender = 'male'
    ),
     females (pizzeria_name) AS
    (
        SELECT pizzeria.name AS pizzeria_name 
        FROM person
    	JOIN person_visits
        ON person.id = person_visits.person_id
    	JOIN pizzeria 
        ON person_visits.pizzeria_id = pizzeria.id
        WHERE person.gender = 'female'
    )
SELECT pizzeria_name FROM
((SELECT pizzeria_name FROM males EXCEPT ALL (SELECT pizzeria_name FROM females))
UNION ALL
(SELECT pizzeria_name FROM females EXCEPT ALL (SELECT pizzeria_name FROM males)))
AS tab
ORDER BY 1;