UPDATE menu
SET price = ROUND((SELECT price FROM menu WHERE pizza_name = 'greek pizza') * 0.9)
WHERE pizza_name = 'greek pizza';