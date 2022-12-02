DELETE FROM person_order po
		WHERE po.order_date = to_date('25 02 2022', 'dd mm yyyy') OR po.menu_id = (SELECT m.id FROM menu m WHERE m.pizza_name = 'greek pizza');;

DELETE FROM menu m
		WHERE m.pizza_name = 'greek pizza';