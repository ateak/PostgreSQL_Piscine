INSERT INTO person_order
				SELECT
				generate_series(tmp.max_id + 1, tmp.max_id + (SELECT COUNT(*) FROM person), 1) 	AS id,
				generate_series((SELECT min(id) FROM person), (SELECT max(id) FROM person), 1) 	AS person_id,
				(SELECT id FROM menu WHERE pizza_name = 'greek pizza') 							AS menu_id,
				to_date('25 02 2022', 'dd mm yyyy') 											AS order_date
				FROM (SELECT max(id) AS max_id FROM person_order) AS tmp;