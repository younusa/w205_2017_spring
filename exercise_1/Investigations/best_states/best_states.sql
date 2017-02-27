DROP TABLE best_states;

Create Table best_states as
SELECT
State,
round (avg(tps_Score),3) as Average_Score,
count (provider_id) as Hospital_Count
From best_hospitals GROUP BY State
ORDER BY Average_Score DESC;

select * from best_states limit 10;

