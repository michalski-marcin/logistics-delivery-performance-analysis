-- =============================================
-- OPERATIONAL KPIs
-- =============================================
--
-- This analysis provides an overview of the company's
-- logistics operations using key operational metrics.

--Operational summary
-- - What is the total number of loads?
-- - What is the total revenue generated from all loads?
-- - What is the average revenue per load?
-- - What is the average load weight?
-- - What is the average number of pieces per load?
/*
SELECT 
	COUNT(*) AS total_loads,
	SUM(revenue) AS total_revenue,
	CAST(AVG(revenue+0.00) AS numeric(10, 2)) AS average_revenue,
	CAST(AVG(weight_lbs+0.00) AS numeric(10, 2)) AS average_load_weight,
	CAST(AVG(pieces+0.00) AS numeric(10 ,2)) AS average_pieces
FROM dbo.loads_clean;
*/

-- How are loads distributed by status?

SELECT 
    load_status,
    COUNT(*) AS loads_count,
    CAST(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS numeric(10,2)) AS percentage
FROM dbo.loads_clean
GROUP BY load_status;


-- How are loads distributed by booking type?


SELECT *
FROM loads_clean;

-- Transportation overview:
-- - What is the total distance traveled?
-- - What is the average trip distance?
-- - What is the total fuel consumption?
-- - What is the average fuel efficiency (MPG)?
-- - What is the average trip duration?
--
-- Data sources:
-- - loads_clean
-- - trips_clean
--
-- =============================================