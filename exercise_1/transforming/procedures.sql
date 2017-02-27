DROP TABLE procedures;

Create Table procedures as
SELECT	
cast (Provider_ID as int) as provider_id,
Condition,
Measure_ID,
Measure_Name,
cast (Score as int) as score
FROM effective_care
WHERE Score not like "Not%";


