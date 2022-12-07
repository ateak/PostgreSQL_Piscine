CREATE OR REPLACE VIEW v_symmetric_union AS
SELECT * FROM
(WITH	table_1 AS (SELECT * -- R-S
            FROM (SELECT * FROM person_visits WHERE visit_date = '2022-01-02') AS R
            EXCEPT
            SELECT * FROM person_visits WHERE visit_date = '2022-01-06'),
		table_2 AS (SELECT * -- S-R
        	FROM (SELECT * FROM person_visits WHERE visit_date = '2022-01-06') AS S
        	EXCEPT
        	SELECT * FROM person_visits WHERE visit_date = '2022-01-02')
SELECT *
FROM table_1
UNION SELECT * FROM table_2
ORDER BY person_id) AS v;

--select * from v_symmetric_union