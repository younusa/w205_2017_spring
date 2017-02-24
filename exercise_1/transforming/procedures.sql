DROP TABLE procedures;

Create Table procedures as
SELECT	
Provider_ID,
State,
Condition,
Measure_ID,
Measure_Name,
Score
FROM effective_care;
