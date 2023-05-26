SELECT
  full_name,
  category, 
  AVG(score) AS avg_score
FROM contest_score
GROUP BY ROLLUP (full_name, category);


SELECT
  full_name,
  category, 
  week,
  AVG(score) AS avg_score,
  GROUPING(full_name) AS F,
  GROUPING(category) AS C, 
  GROUPING(week) AS W
FROM contest_score
GROUP BY ROLLUP (full_name, category, week);


select 
	category,
    delivery_date,
    avg(total_price) as avg_price
from delivery
group by rollup(category), delivery_date


select
	coalesce(category, '--') as category,
    sum(total_price) as total
from delivery
group by rollup(category)
