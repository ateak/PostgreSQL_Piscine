SELECT po.order_date, CONCAT(p.name, ' (age:', p.age, ')') AS person_information
FROM person_order po NATURAL JOIN person p
ORDER by 1, 2;