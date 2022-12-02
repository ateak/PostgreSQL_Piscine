WITH t2 AS (SELECT date_trunc('day', my_date):: date AS missing_date
		  FROM generate_series('2022-01-01'::timestamp, '2022-01-10'::timestamp, '1 day'::interval) my_date)
SELECT t2.missing_date FROM t2
LEFT JOIN		 
		 (SELECT t1.visit_date AS missing_date, t1.id
			FROM 	(SELECT pv.visit_date, pv.id
				 	 FROM person_visits pv
					 WHERE pv.person_id = 1 OR pv.person_id = 2) 
		  	AS t1 ) 
		 AS tg
ON t2.missing_date = tg.missing_date
WHERE  tg.id is null
ORDER by 1;