create table if not exists tsp
	(
		id serial primary key,
		node1 varchar not null,
		node2 varchar not null,
		cost integer not null
	);
	
	insert into tsp values (1, 'a', 'b', 10);
	insert into tsp values (2, 'b', 'a', 10);
	insert into tsp values (3, 'b', 'c', 35);
	insert into tsp values (4, 'c', 'b', 35);
	insert into tsp values (5, 'c', 'a', 15);
	insert into tsp values (6, 'a', 'c', 15);
	insert into tsp values (7, 'a', 'd', 20);
	insert into tsp values (8, 'd', 'a', 20);
	insert into tsp values (9, 'd', 'b', 25);
	insert into tsp values (10, 'b', 'd', 25);
	insert into tsp values (11, 'd', 'c', 30);
	insert into tsp values (12, 'c', 'd', 30);
	
--select * from tsp;
--drop table tsp;

WITH RECURSIVE a_traces AS (
	SELECT node1 AS tour, node1, node2, cost, cost as sum
	FROM tsp
	WHERE node1 = 'a'
	UNION ALL
	SELECT parent.tour || ',' || child.node1 AS trace,
		child.node1,
		child.node2,
		child.cost,
		parent.sum + child.cost as sum
	FROM tsp AS child
	INNER JOIN a_traces AS parent
	ON child.node1 = parent.node2
	WHERE tour NOT LIKE '%' || child.node1 ||  '%'
),
	final_traces AS(
	SELECT SUM AS total_cost, '{' || tour || ',' || node2 ||'}' AS tour
	FROM a_traces
	WHERE length(tour) = 7 and node2 = 'a'
)

SELECT * FROM final_traces
WHERE total_cost = (SELECT min(total_cost) FROM final_traces)
ORDER BY total_cost, tour;