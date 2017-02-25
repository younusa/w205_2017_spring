DROP TABLE readmissionsrate;

Create Table readmissionsrate as
SELECT	
Provider_ID,
Measure_ID,
Measure_Name,
Score,
Compared_to_National
FROM readmissions;

ALTER TABLE readmissionsrate
CHANGE Score Score int
;