SELECT t1.object_name
FROM (SELECT pizza_name as object_name, 'menu' as label
    	FROM menu
		UNION ALL
		SELECT name, 'person' as label
		FROM person
		ORDER by label DESC, object_name) as t1;