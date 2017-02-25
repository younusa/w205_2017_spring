DROP TABLE readmissionsrate;

Create Table readmissionsrate as
SELECT	
Provider_ID,
State,
Measure_ID,
Measure_Name,
Score,
Compare_to_National
FROM readmissions;

ALTER TABLE readmissionsrate
CHANGE Score Score int
;