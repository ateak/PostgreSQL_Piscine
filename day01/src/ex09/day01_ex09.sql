SELECT piz.name
FROM pizzeria piz 
WHERE piz.id IN (SELECT piz.id FROM pizzeria piz
				 EXCEPT
				 SELECT pv.pizzeria_id FROM person_visits pv);
				
SELECT piz.name
FROM pizzeria piz 
WHERE NOT EXISTS (SELECT * 
				  FROM person_visits pv
				  WHERE piz.id = pv.pizzeria_id);