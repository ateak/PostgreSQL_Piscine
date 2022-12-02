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
UNION
SELECT * FROM final_traces
WHERE total_cost = (SELECT max(total_cost) FROM final_traces)
ORDER BY total_cost, tour;