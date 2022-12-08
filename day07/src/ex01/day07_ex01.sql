SELECT name, COUNT(person_visits) AS count_of_visits 
FROM person
JOIN person_visits
ON person.id = person_visits.person_id
GROUP BY name
ORDER BY 2 DESC, 1 LIMIT 4;