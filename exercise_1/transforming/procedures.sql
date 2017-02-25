DROP TABLE procedures;

Create Table procedures as
SELECT	
Provider_ID,
Condition,
Measure_ID,
Measure_Name,
Score
FROM effective_care;

ALTER TABLE procedures
CHANGE Score Score int
;

