CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date
	(in pperson varchar default 'Dmitriy',
	in prubles numeric default 500,
	in pdate date default '2022-01-08')
RETURNS TABLE (pizzeria_name varchar) AS
 $table1$
        BEGIN
        RETURN QUERY
        SELECT DISTINCT piz.name AS pizzeria_name FROM pizzeria piz
        JOIN person_visits pv ON pv.pizzeria_id = piz.id
        JOIN menu m ON m.pizzeria_id = piz.id
        JOIN person p ON p.id = pv.person_id
        WHERE pperson = p.name AND m.price < prubles AND pv.visit_date = pdate;
        END;
$table1$
LANGUAGE plpgsql;

SELECT * FROM fnc_person_visits_and_eats_on_date(prubles := 800);

SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', prubles := 1300, pdate := '2022-01-01');